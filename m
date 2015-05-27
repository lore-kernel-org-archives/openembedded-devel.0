Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 53AC672D64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 17:35:43 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so19769370igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 10:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=Wq9el0m/wl1PI9cUWO3ajwNJOiKLpDQ5sXxkSTPWzB8=;
	b=j6YblbAWYFWXsA2niW9RkNxWHrTP7ohJfdKF6K8Sp7ZARQSWwg8V2Po5OpRkDaAco1
	HluzZSstjIDMCOuUYKXw5motUxua2lEDq/EujJ32BXeRkIwH6AyejbcJMdW+mu8WQw6j
	zYRwj+l0YNyP0i8plhwMlDkwquLZrqQGVs0F0OktN7Dch218aPVa/cDTkYw32W/UmrkK
	aLCPOYlMz90cfFSARfOE+8LZP0D0x3f1nLhNozEL6lMnw+6TPG7ny673hPRLRJmozaH9
	esT2oNoKvmkJ92EIKpdl3+1ZFOi5feTwbO1we/IvGDkWNlgVWwDaLOMqTflPpUXpWh5P
	97Cw==
X-Gm-Message-State: ALoCoQmUQ6/nM2ISLyVzN7/Zt4c42zGyAxhnhuzezMMr5OY+KNYr7U+yEtZk1FGakf7WSDObW7Rp
X-Received: by 10.107.6.136 with SMTP id f8mr34378803ioi.61.1432748144365;
	Wed, 27 May 2015 10:35:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.20.5 with HTTP; Wed, 27 May 2015 10:35:24 -0700 (PDT)
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Wed, 27 May 2015 19:35:24 +0200
Message-ID: <CAAzKXng3U9JtMBvooi72wNr-aNWxbEXMX13YmVK9Htx5jXLcdQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] [PATCH 2/2] chromium, cef: fetch chromium source from git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 May 2015 17:35:46 -0000
Content-Type: text/plain; charset=UTF-8

Updated recipe to fetch Chromium from git.
LASTCHANGE file is now created using the proper
gclient hook.

Change-Id: Ie1790abec002a0dd39c8d0aae3d03f5ebe6f46aa
Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
---
 .../cef3/01_get_svn_version_from_LASTCHANGE.patch  | 32 ------------
 recipes-browser/chromium/cef3_280796.bb            | 57
++++++++++++++++------
 2 files changed, 43 insertions(+), 46 deletions(-)
 delete mode 100644
recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch

diff --git
a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
deleted file mode 100644
index 9b14429..0000000
--- a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fetch the revision from LASTCHANGE file programmatically
-
-Upstream-Status: Pending
-
-Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff --git a/cef/tools/make_version_header.py
b/cef/tools/make_version_header.py
-index 84d49f5..395c2cf 100644
---- a/cef/tools/make_version_header.py
-+++ b/cef/tools/make_version_header.py
-@@ -64,6 +64,8 @@ def write_svn_header(header, chrome_version,
cef_version, cpp_header_dir):
-       revision = svn.get_revision()
-     elif git.is_checkout('.'):
-       revision = git.get_svn_revision()
-+    elif os.path.isfile("../build/util/LASTCHANGE"):
-+      revision =
open("../build/util/LASTCHANGE").read().split("=")[1].strip()
-     else:
-       raise Exception('Not a valid checkout')
-
-diff --git a/cef/tools/revision.py b/cef/tools/revision.py
-index 1d94602..eb89e3b 100644
---- a/cef/tools/revision.py
-+++ b/cef/tools/revision.py
-@@ -16,6 +16,8 @@ if os.path.exists(os.path.join('.', '.svn')):
-   sys.stdout.write(svn.get_revision())
- elif os.path.exists(os.path.join('.', '.git')):
-   sys.stdout.write(git.get_svn_revision())
-+elif os.path.isfile("../build/util/LASTCHANGE"):
-+  revision = open("../build/util/LASTCHANGE").read().split("=")[1].strip()
- else:
-   raise Exception('Not a valid checkout')
diff --git a/recipes-browser/chromium/cef3_280796.bb
b/recipes-browser/chromium/cef3_280796.bb
index 9a9efe5..806a4ac 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -7,21 +7,22 @@ RDEPENDS_${PN} += "pango cairo fontconfig pciutils
pulseaudio freetype fontconfi
 SRCREV_tools = "99bcb0e676eb396bcf8e1af3903aa4b578aeeee0"
 SRCREV_cef = "bbad53dfca9f98dddcb31a590410fece0a4f0234"
 SRCREV_egl = "a5b81b7617ba6757802b9b5f8c950034d5f961ec"
-SRCREV_FORMAT = "cef_egl_tools"
+SRCREV_FORMAT = "cef_egl"

-SRC_URI = "
http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${PV}.tar.xz
\
-           git://
github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=src/cef;branch=aura;name=cef
\
-           git://
github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=src/ui/ozone/platform/egl;branch=master;name=egl
\
-           git://
chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools
\
-           file://01_get_svn_version_from_LASTCHANGE.patch \
-          file://cef-simple \
-         "
-SRC_URI[md5sum] = "9efbb50283b731042e62b9bd5e312b2f"
-SRC_URI[sha256sum] =
"f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
+SRC_URI = "git://
chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools
\
+           git://
github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=${S}/src/cef;branch=aura;name=cef
<http://github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=$%7BS%7D/src/cef;branch=aura;name=cef>
\
+           git://
github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=${S}/src/ui/ozone/platform/egl;branch=master;name=egl\
<http://github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=$%7BS%7D/src/ui/ozone/platform/egl;branch=master;name=egl%5C>
+           file://cef-simple\
+  "

-S = "${WORKDIR}/chromium_rev_${PV}"
+export CHROMIUM_SRC_GIT_URL="https://chromium.googlesource.com/chromium/src
"
+export CHROMIUM_SRC_GIT_COMMIT="e800fe7470fa87dc1ca5b148a7c2c41f603fdcbd"

-do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl SRCREV_tools"
+S = "${WORKDIR}/chromium_rev_${PV}/"
+
+B = "${S}/src/"
+
+do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl"

 GYP_ARCH_DEFINES_armv7a = " target_arch=arm arm_float_abi=hard"
 GYP_ARCH_DEFINES_i586 = " target_arch=ia32"
@@ -30,14 +31,41 @@ export GYP_GENERATORS="ninja"
 export BUILD_TARGET_ARCH="${TARGET_ARCH}"
 export GYP_DEFINES="${GYP_ARCH_DEFINES}
release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"

+do_fetch_chromium_source_from_git() {
+  cd ${S}
+  export PATH=${WORKDIR}/depot_tools:"$PATH"
+
+  # Note: --deps-file needs to set to .DEPS.git for syncing to old
+  # chromium versions
+  gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=".DEPS.git"
+
+  # Runhooks is disabled. Running the hooks will trigger the
+  # gyp_chromium command replaced with cef_create_projects.sh by
+  # cef3.
+
+  gclient sync -f --nohooks --revision src@${CHROMIUM_SRC_GIT_COMMIT}
+
+  # We need the lastchange hook to generate the LASTCHANGE revision info
+  # file.
+
+  python src/build/util/lastchange.py -o src/build/util/LASTCHANGE
+}
+
+addtask fetch_chromium_source_from_git after do_patch before do_configure
+
 do_configure_append() {
        export PATH=${WORKDIR}/depot_tools:"$PATH"
        # End of LD Workaround
        #-----------------------
        # Configure cef
        #------------------------
-       cd cef
-       ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth
../
+       cd ${S}/src/cef
+
+  # Fatal linker warnings need to be disalbed to avoid linker issu
+  # with GCC 4.9:
+  #
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095947.html
+
+       ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth
../ -Ddisable_fatal_linker_warnings=
        cd -
 }

@@ -47,5 +75,6 @@ do_qa_configure() {
 }

 do_compile() {
+ cd ${S}/src
        ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
 }
--
1.9.1

