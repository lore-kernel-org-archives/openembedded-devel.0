Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C9DE77182
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:26:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.107813.1733765194996215217
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C7E175D
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:27:02 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2D5163F720
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/7] vk-gl-cts: don't require networking to configure
Date: Mon,  9 Dec 2024 17:26:26 +0000
Message-ID: <20241209172626.4144686-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209172626.4144686-1-ross.burton@arm.com>
References: <20241209172626.4144686-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 17:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114255

The CMakeLists in this package go and download a number of packages at
configure time, which is bad practise for us.

Instead, use a script to parse the fetching tool and generate SRC_URI
fragments that can be included in the recipe. This refresh_srcuri task
will need to be reran on upgrades to ensure that it is up to date: the
fragment will warn if the version doesn't match and devtool will do that
automatically.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../vk-gl-cts/files/generate-srcuri.py        | 131 ++++++++++++++++++
 .../vk-gl-cts/khronos-cts.inc                 |  54 +++-----
 .../vk-gl-cts/opengl-es-cts-sources.inc       |  23 +++
 .../vk-gl-cts/opengl-es-cts_3.2.11.0.bb       |  15 +-
 .../vk-gl-cts/vulkan-cts-sources.inc          |  23 +++
 .../vk-gl-cts/vulkan-cts_1.3.9.2.bb           |  14 +-
 6 files changed, 205 insertions(+), 55 deletions(-)
 create mode 100755 meta-oe/recipes-graphics/vk-gl-cts/files/generate-src=
uri.py
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sour=
ces.inc
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources=
.inc

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py =
b/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py
new file mode 100755
index 0000000000..c2756b592c
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py
@@ -0,0 +1,131 @@
+#! /usr/bin/env python3
+
+import json
+import re
+import os
+import subprocess
+import sys
+import types
+import urllib.parse
+
+
+def resolve_commit(repo, ref):
+    # If it looks like a SHA, just return that
+    if re.match(r"[a-z0-9]{40}", ref):
+        return ref
+
+    # Otherwise it's probably a tag name so resolve it
+    cmd =3D ("git", "ls-remote", "--tags", "--exit-code", repo, ref)
+    ret =3D subprocess.run(cmd, check=3DTrue, text=3DTrue, capture_outpu=
t=3DTrue)
+    sha =3D ret.stdout.split(maxsplit=3D1)[0]
+    assert len(sha) =3D=3D 40
+    return sha
+
+
+def transform_git(repo_url, repo_ref, destination):
+    parts =3D urllib.parse.urlparse(repo_url)
+    protocol =3D parts.scheme
+    parts =3D parts._replace(scheme=3D"git")
+    url =3D urllib.parse.urlunparse(parts)
+    # Resolve the commit reference to a SHA
+    sha =3D resolve_commit(repo_url, repo_ref)
+
+    return url + f";protocol=3D{protocol};nobranch=3D1;destsuffix=3D{des=
tination};rev=3D{sha}"
+
+
+def load_module(filename):
+    import importlib.util
+
+    spec =3D importlib.util.spec_from_file_location("fetchmodule", filen=
ame)
+    module =3D importlib.util.module_from_spec(spec)
+    spec.loader.exec_module(module)
+    return module
+
+
+def convert_fetch(basedir):
+    """
+    Convert the external/fetch_sources.py data
+    """
+    fetch =3D load_module(os.path.join(basedir, "fetch_sources.py"))
+    lines =3D []
+    for p in fetch.PACKAGES:
+        if isinstance(p, fetch.SourcePackage):
+            # Ignore these as so far we can use the system copies
+            pass
+        elif isinstance(p, fetch.SourceFile):
+            dest =3D "/".join(["git/external", p.baseDir, p.extractDir])
+            url =3D f"{p.url};subdir=3D{dest};sha256sum=3D{p.checksum}"
+            lines.append(f"    {url} \\")
+        elif isinstance(p, fetch.GitRepo):
+            dest =3D "/".join(["git/external", p.baseDir, p.extractDir])
+            url =3D transform_git(p.httpsUrl, p.revision, dest)
+            lines.append(f"    {url} \\")
+        else:
+            assert f"Unexpected {p=3D}"
+    return lines
+
+
+def convert_knowngood(basedir, destination):
+    """
+    Convert the """
+    filename =3D os.path.join(basedir, "vulkan-validationlayers/src/scri=
pts/known_good.json")
+    try:
+        with open(filename) as fp:
+            data =3D json.load(fp, object_hook=3Dlambda x: types.SimpleN=
amespace(**x))
+    except FileNotFoundError:
+        return []
+
+    lines =3D []
+    for repo in data.repos:
+        # Skip repositories that are not needed on Linux (TODO: assumes =
linux target)
+        if hasattr(repo, "build_platforms") and repo.build_platforms !=3D=
 "linux":
+            continue
+
+        # Switch the URL to use git: and save the original protocol
+        parts =3D urllib.parse.urlparse(repo.url)
+        protocol =3D parts.scheme
+        parts =3D parts._replace(scheme=3D"git")
+        url =3D urllib.parse.urlunparse(parts)
+        # Resolve the commit reference to a SHA
+        sha =3D resolve_commit(repo.url, repo.commit)
+
+        destsuffix =3D destination + "/" + repo.sub_dir
+
+        url +=3D f";protocol=3D{protocol};nobranch=3D1;destsuffix=3D{des=
tsuffix};rev=3D{sha}"
+        lines.append(f"    {url} \\")
+    return lines
+
+
+def main():
+    pv =3D sys.argv[1]
+    basedir =3D sys.argv[2]
+
+    print("""
+#
+# Generated by generate-srcuri.py, don't update manually")
+#
+
+RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_refresh_srcuri"
+
+python __anonymous() {
+    if d.getVar("PV") !=3D "%s":
+        bb.warn("-sources.inc out of date, run refresh_srcuri task")
+}
+""" % (pv))
+
+    print('SRC_URI +=3D " \\')
+    lines =3D convert_fetch(basedir)
+    print("\n".join(lines))
+    print('"')
+
+    #lines =3D convert_knowngood(sys.argv[1], "git/external/validation")
+    #if lines:
+    #    print('SRC_URI +=3D " \\')
+    #    print("\n".join(lines))
+    #    print('"')
+    #else:
+    #    print("# Re-run")
+
+
+if __name__ =3D=3D "__main__":
+    main()
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 0b347cf77e..02af1c6ed0 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -1,21 +1,16 @@
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
-SRC_URI =3D "\
-	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=3Dhttps;name=3Dvk-=
gl-cts;nobranch=3D1 \
-	git://github.com/google/amber;protocol=3Dhttps;destsuffix=3Dgit/externa=
l/amber/src;name=3Damber;nobranch=3D1 \
-	git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;destsuffix=3D=
git/external/glslang/src;name=3Dglslang;nobranch=3D1 \
-	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;destsu=
ffix=3Dgit/external/spirv-headers/src;name=3Dspirv-headers;nobranch=3D1 \
-	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;destsuff=
ix=3Dgit/external/spirv-tools/src;name=3Dspirv-tools;nobranch=3D1 \
-	git://github.com/open-source-parsers/jsoncpp.git;protocol=3Dhttps;dests=
uffix=3Dgit/external/jsoncpp/src;name=3Djsoncpp;nobranch=3D1 \
-	git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;destsuff=
ix=3Dgit/external/vulkan-docs/src;name=3Dvulkan-docs;nobranch=3D1 \
-	git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=3Dht=
tps;destsuffix=3Dgit/external/vulkan-validationlayers/src;name=3Dvulkan-v=
alidationlayers;nobranch=3D1 \
-	git://github.com/Igalia/ESExtractor.git;protocol=3Dhttps;destsuffix=3Dg=
it/external/ESExtractor/src;name=3DESExtractor;nobranch=3D1 \
-	git://github.com/Igalia/vk_video_samples.git;protocol=3Dhttps;destsuffi=
x=3Dgit/external/nvidia-video-samples/src;name=3Dvideo-parser;nobranch=3D=
1 \
-	https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/=
app/renderdoc_app.h;subdir=3Dgit/external/renderdoc/src;name=3Drenderdoc =
\
-"
-
-SRCREV_FORMAT =3D "vk-gl-cts_amber_glslang_spirv-headers_spirv-tools_jso=
ncpp_video-parser_vulkan-docs_vulkan-validationlayers"
+SRC_URI =3D "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=3Dhttp=
s;name=3Dvk-gl-cts;nobranch=3D1 \
+           file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOL=
S_D.patch \
+           file://0001-use-library-sonames-for-linking.patch \
+           file://generate-srcuri.py \
+           "
+
+SRC_URI:append:libc-musl =3D "file://fix-musl.patch"
+SRC_URI:append:toolchain-clang =3D "file://fix-clang-private-operator.pa=
tch"
+
+SRCREV_FORMAT =3D "vk-gl-cts"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -26,22 +21,10 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "${BPN}-(?P<pver>\d+(\=
.\d+)+)"
 ANY_OF_DISTRO_FEATURES +=3D "opengl vulkan"
=20
 DEPENDS +=3D "python3-lxml-native libpng zlib virtual/libgles2 qemu-nati=
ve"
-
-SRC_URI +=3D " \
-            file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCO=
LS_D.patch \
-            file://0001-use-library-sonames-for-linking.patch \
-"
-
-SRC_URI:append:libc-musl =3D "\
-	file://fix-musl.patch \
-"
 DEPENDS:append:libc-musl =3D " libexecinfo"
=20
-SRC_URI:append:toolchain-clang =3D "\
-	file://fix-clang-private-operator.patch \
-"
-
 EXTRA_OECMAKE +=3D "-DAMBER_DISABLE_WERROR=3DON \
+                  -DUPDATE_DEPS_DIR=3D${S}/external/validation/ \
                   -DWAYLAND_SCANNER=3D${STAGING_BINDIR_NATIVE}/wayland-s=
canner \
                   -DWAYLAND_PROTOCOLS_DIR=3D${STAGING_DATADIR}/wayland-p=
rotocols"
=20
@@ -78,6 +61,15 @@ FILES:${PN} +=3D "${CTSDIR}"
 # error: implicit instantiation of undefined template 'std::char_traits<=
unsigned int>'
 TOOLCHAIN =3D "gcc"
=20
-# Validation-layers requires access during configure as it fetches valid=
ation-headers
-# and bunch of other packages from khronos github
-do_configure[network] =3D "1"
+# Prototype task to refresh the generated SRC_URI entries by parsing
+# the files in the source tree and writing a BPN-sources.inc file.
+do_refresh_srcuri() {
+    ${UNPACKDIR}/generate-srcuri.py ${PV} ${S}/external/ \
+        > ${THISDIR}/${BPN}-sources.inc
+    # Don't convert ${S}/external/vulkan-validationlayers/src/scripts/kn=
own_good.json as we
+    # currently build without validation
+}
+
+addtask refresh_srcuri after do_patch
+do_refresh_srcuri[network] =3D "1"
+do_refresh_srcuri[nostamp] =3D "1"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc=
 b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
new file mode 100644
index 0000000000..9752c2d7d7
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
@@ -0,0 +1,23 @@
+
+#
+# Generated by generate-srcuri.py, don't update manually")
+#
+
+RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_refresh_srcuri"
+
+python __anonymous() {
+    if d.getVar("PV") !=3D "3.2.11.0":
+        bb.warn("-sources.inc out of date, run refresh_srcuri task")
+}
+
+SRC_URI +=3D " \
+    https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/a=
pi/app/renderdoc_app.h;subdir=3Dgit/external/renderdoc/src;sha256sum=3De7=
b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3Dgit/external/spirv-tools/src;rev=3D148c97f6876e427ef=
d76d2328122c3075eab4b8f \
+    git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3Dgit/external/glslang/src;rev=3D4da479aa6afa43e5a2ce4c4148c=
572a03123faf3 \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3Dgit/external/spirv-headers/src;rev=3Dff2afc3afc48d=
ff4eec2a10f0212402a80708e38 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3Dgit/external/vulkan-docs/src;rev=3Ded4ba0242beb89a17=
95d6084709fa9e713559c94 \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=3D=
https;nobranch=3D1;destsuffix=3Dgit/external/vulkan-validationlayers/src;=
rev=3Df589bc456545fbab97caf49380b102b8aafe1f40 \
+    git://github.com/google/amber.git;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3Dgit/external/amber/src;rev=3D0f003c2785489f59cd01bb2440fcf303149=
100f2 \
+    git://github.com/open-source-parsers/jsoncpp.git;protocol=3Dhttps;no=
branch=3D1;destsuffix=3Dgit/external/jsoncpp/src;rev=3D9059f5cad030ba11d3=
7818847443a53918c327b1 \
+    git://github.com/Igalia/vk_video_samples.git;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3Dgit/external/nvidia-video-samples/src;rev=3D6821adf11=
eb4f84a2168264b954c170d03237699 \
+"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb=
 b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
index 1a745c6cc1..9d07076951 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
@@ -1,19 +1,10 @@
 DESCRIPTION =3D "OpenGL CTS"
=20
 require khronos-cts.inc
-# opengl-es-cts-3.2.11.0
+
 SRCREV_vk-gl-cts =3D "66956d195169596472e956e3aebf2df8e3bd960d"
-SRCREV_amber =3D "0f003c2785489f59cd01bb2440fcf303149100f2"
-SRCREV_glslang =3D "4da479aa6afa43e5a2ce4c4148c572a03123faf3"
-SRCREV_spirv-headers =3D "ff2afc3afc48dff4eec2a10f0212402a80708e38"
-SRCREV_spirv-tools =3D "148c97f6876e427efd76d2328122c3075eab4b8f"
-SRCREV_ESExtractor =3D "ce5d7ebcf0ebb0d78385ee4cc34653eb6764bfc4"
-# Not yet needed
-SRCREV_jsoncpp =3D "9059f5cad030ba11d37818847443a53918c327b1"
-SRCREV_vulkan-docs =3D "ed4ba0242beb89a1795d6084709fa9e713559c94"
-SRCREV_vulkan-validationlayers =3D "a92629196a4fed15e59c74aa965dd47bd5ec=
e3b7"   =20
-SRCREV_video-parser =3D "6821adf11eb4f84a2168264b954c170d03237699"
-SRC_URI[renderdoc.sha256sum] =3D "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133a=
a857d6a4271b0ef3d0bdb6868e"
+
+require opengl-es-cts-sources.inc
=20
 EXTRA_OECMAKE +=3D "-DSELECTED_BUILD_TARGETS=3D"cts-runner deqp-egl deqp=
-gles2 deqp-gles3 deqp-gles31 deqp-gl-shared de-internal-tests glcts""
=20
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/=
meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
new file mode 100644
index 0000000000..1f54282fcb
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -0,0 +1,23 @@
+
+#
+# Generated by generate-srcuri.py, don't update manually")
+#
+
+RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_refresh_srcuri"
+
+python __anonymous() {
+    if d.getVar("PV") !=3D "1.3.9.2":
+        bb.warn("-sources.inc out of date, run refresh_srcuri task")
+}
+
+SRC_URI +=3D " \
+    https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/a=
pi/app/renderdoc_app.h;subdir=3Dgit/external/renderdoc/src;sha256sum=3De7=
b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3Dgit/external/spirv-tools/src;rev=3D4c7e1fa5c3d988cca=
0e626d359d30b117b9c2822 \
+    git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3Dgit/external/glslang/src;rev=3D2b19bf7e1bc0b60cf2fe9d33e5b=
a6b37dfc1cc83 \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3Dgit/external/spirv-headers/src;rev=3Ddb5a00f8cebe8=
1146cafabf89019674a3c4bf03d \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3Dgit/external/vulkan-docs/src;rev=3D7bb606eb87cde1d34=
f65f36f4d4c6f2c78f072c8 \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=3D=
https;nobranch=3D1;destsuffix=3Dgit/external/vulkan-validationlayers/src;=
rev=3Df589bc456545fbab97caf49380b102b8aafe1f40 \
+    git://github.com/google/amber.git;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3Dgit/external/amber/src;rev=3D0f003c2785489f59cd01bb2440fcf303149=
100f2 \
+    git://github.com/open-source-parsers/jsoncpp.git;protocol=3Dhttps;no=
branch=3D1;destsuffix=3Dgit/external/jsoncpp/src;rev=3D9059f5cad030ba11d3=
7818847443a53918c327b1 \
+    git://github.com/Igalia/vk_video_samples.git;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3Dgit/external/nvidia-video-samples/src;rev=3D6821adf11=
eb4f84a2168264b954c170d03237699 \
+"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb b/m=
eta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
index bffec29e4d..6c0a07b873 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
@@ -2,19 +2,9 @@ DESCRIPTION =3D "Vulkan CTS"
=20
 require khronos-cts.inc
=20
-# vulkan-cts-1.3.9.2
 SRCREV_vk-gl-cts =3D "24c1b1498ba4f05777f47541968ffe686265c645"
-SRCREV_amber =3D "0f003c2785489f59cd01bb2440fcf303149100f2"
-SRCREV_glslang =3D "2b19bf7e1bc0b60cf2fe9d33e5ba6b37dfc1cc83"
-SRCREV_spirv-headers =3D "db5a00f8cebe81146cafabf89019674a3c4bf03d"
-SRCREV_spirv-tools =3D "4c7e1fa5c3d988cca0e626d359d30b117b9c2822"
-SRCREV_jsoncpp =3D "9059f5cad030ba11d37818847443a53918c327b1"
-SRCREV_vulkan-docs =3D "7bb606eb87cde1d34f65f36f4d4c6f2c78f072c8"
-SRCREV_vulkan-validationlayers =3D "a92629196a4fed15e59c74aa965dd47bd5ec=
e3b7"
-SRC_URI[renderdoc.sha256sum] =3D "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133a=
a857d6a4271b0ef3d0bdb6868e"
-# Not yet needed
-SRCREV_ESExtractor =3D "75ffcaf55bb069f7a23764194742d2fb78c7f71f"
-SRCREV_video-parser =3D "6821adf11eb4f84a2168264b954c170d03237699"
+
+require vulkan-cts-sources.inc
=20
 # Workaround an optimization bug that breaks createMeshShaderMiscTestsEX=
T
 OECMAKE_CXX_FLAGS:remove:toolchain-gcc =3D "-O2"
--=20
2.43.0


