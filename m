Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EA3C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 14:56:04 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web12.42091.1666018556988782170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 07:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id BA9E21B2FE
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 16:55:34 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.75]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1okRWg-3VcHgm0; Mon, 17 Oct 2022 16:55:34 +0200
Date: Mon, 17 Oct 2022 16:55:29 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] perfetto: build libperfetto
To: openembedded-devel@lists.openembedded.org
Message-Id: <H4KWJR.NZASG3B23CIA@t-online.de>
In-Reply-To: <171EE2F0B203884C.10474@lists.openembedded.org>
References: <171EE2F0B203884C.10474@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-jOEGu5Kzd2H4EvNp35jF"
X-TOI-EXPURGATEID: 150726::1666018534-2E7F9535-1CAF0D75/0/0 CLEAN NORMAL
X-TOI-MSGID: ceb47ed4-7513-4c06-9818-8100c51f625c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 14:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99200

--=-jOEGu5Kzd2H4EvNp35jF
Content-Type: text/plain; charset=us-ascii; format=flowed

sent again because of mail delivery error

Am Mo, 17. Okt 2022 um 16:53:39 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> - Mesa has support for perfetto, but the libperfetto library is needed
> - Only v27 seems to be supported for now. Update perfetto accordingly
> - Make sure perfetto and libperfetto share the same codebase
> - Patch meson.build to allow shared build
> - Add a version number to avoid having a non symlink so file packaged 
> into dev package.
> - Create a PC file for libperfetto to allow mesa to find it using 
> pkgconfig.
> - Add nobranch=1 for the git repos to silence warnings about missing 
> default branch
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...1-meson-add-pc-file-for-lib_perfetto.patch | 38 
> +++++++++++++++++++
>  .../recipes-devtools/perfetto/libperfetto.bb  | 11 ++++++
>  meta-oe/recipes-devtools/perfetto/perfetto.bb | 14 +++----
>  .../recipes-devtools/perfetto/perfetto.inc    |  9 +++++
>  4 files changed, 65 insertions(+), 7 deletions(-)
>  create mode 100644 
> meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
>  create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto.bb
>  create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto.inc
> 
> diff --git 
> a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch 
> b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
> new file mode 100644
> index 000000000..056382156
> --- /dev/null
> +++ 
> b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
> @@ -0,0 +1,38 @@
> +From 4712b1252ecf6270b5bb2931358b4a368351eaa3 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 17 Oct 2022 15:39:26 +0200
> +Subject: [PATCH] meson: add PC file for lib_perfetto
> +
> +---
> + meson.build | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 06015141c..c67358cae 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -30,8 +30,9 @@ endif
> +
> + dep_threads = dependency('threads')
> +
> +-lib_perfetto = static_library(
> ++lib_perfetto = shared_library(
> +     'perfetto',
> ++    version: '27.1',
> +     sources: 'sdk/perfetto.cc',
> +     dependencies: dep_threads,
> +     install: true,
> +@@ -39,6 +40,10 @@ lib_perfetto = static_library(
> +
> + inc_perfetto = include_directories('sdk')
> +
> ++install_headers('sdk/perfetto.h')
> ++pkg = import('pkgconfig')
> ++pkg.generate(lib_perfetto)
> ++
> + dep_perfetto = declare_dependency(
> +     link_with: lib_perfetto,
> +     include_directories: inc_perfetto,
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto.bb 
> b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
> new file mode 100644
> index 000000000..d58e31414
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
> @@ -0,0 +1,11 @@
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390" 
> <file://license;md5=f87516e0b698007e9e75a1fe1012b390/>
> +
> +require perfetto.inc
> +
> +inherit meson
> +
> +SRC_URI:append = " 
> file://0001-meson-add-pc-file-for-lib_perfetto.patch" 
> <file://0001-meson-add-pc-file-for-lib_perfetto.patch/>
> +
> +FILES:${PN} += "${datadir}"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb 
> b/meta-oe/recipes-devtools/perfetto/perfetto.bb
> index 94c39e9cc..c1b099430 100644
> --- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
> +++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
> @@ -10,16 +10,15 @@ LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390 \
>                      
> <file://debian/copyright;md5=4e08364c82141f181de69d0a2b89d612> \
>                      
> file://python/LICENSE;md5=c602a632c34ade9c78a976734077bce7" 
> <file://python/LICENSE;md5=c602a632c34ade9c78a976734077bce7>
> 
> -SRC_URI = 
> "git://github.com/google/perfetto.git;protocol=https;name=perfetto \
> +SRC_URI:append = " \
>             
> git://github.com/protocolbuffers/protobuf.git;branch=3.9.x;protocol=https;destsuffix=git/buildtools/protobuf;name=protobuf 
> \
> -           
> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=git/buildtools/libcxx;name=libcxx 
> \
> -           
> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=git/buildtools/libcxxabi;name=libcxxabi 
> \
> -           
> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;name=libunwind 
> \
> -           
> git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib 
> \
> +           
> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=git/buildtools/libcxx;name=libcxx;nobranch=1 
> \
> +           
> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=git/buildtools/libcxxabi;name=libcxxabi;nobranch=1 
> \
> +           
> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;name=libunwind;nobranch=1 
> \
> +           
> git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib;nobranch=1 
> \
>             
> <https://storage.googleapis.com/perfetto/gn-linux64-1968-0725d782;subdir=git/buildtools/;name=gn> 
> \
>             file://0001-Remove-check_build_deps-build-steps.patch 
> <file://0001-remove-check_build_deps-build-steps.patch/> "
> 
> -SRCREV_perfetto = "5bd3f582c075d0d026c5fe0b5e291d34dee0d976"
>  SRCREV_protobuf = "6a59a2ad1f61d9696092f79b6d74368b4d7970a3"
>  SRCREV_libcxx = "d9040c75cfea5928c804ab7c235fed06a63f743a"
>  SRCREV_libcxxabi = "196ba1aaa8ac285d94f4ea8d9836390a45360533"
> @@ -27,6 +26,8 @@ SRCREV_libunwind = 
> "d999d54f4bca789543a2eb6c995af2d9b5a1f3ed"
>  SRCREV_zlib = "5c85a2da4c13eda07f69d81a1579a5afddd35f59"
>  SRC_URI[gn.sha256sum] = 
> "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa2358177b64f5cd"
> 
> +require perfetto.inc
> +
>  DEPENDS += " ninja-native"
> 
>  COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm).*-linux*"
> @@ -35,7 +36,6 @@ FILES:${PN}:append = " \
>    ${bindir}/tracebox \
>    "
> 
> -S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
> 
>  CXXFLAGS:append:arm = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('TUNE_FEATURES', 'callconvention-hard', 
> ' -mfloat-abi=hard', '', d)}"
> diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc 
> b/meta-oe/recipes-devtools/perfetto/perfetto.inc
> new file mode 100644
> index 000000000..5cb6f8bb3
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
> @@ -0,0 +1,9 @@
> +SUMMARY = "Perfetto - System profiling, app tracing and trace 
> analysis."
> +HOMEPAGE = "<https://github.com/google/perfetto>"
> +
> +SRC_URI = 
> "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1"
> +
> +SRCREV_perfetto = "1c52b5e132312aeb007ed180d4ba1d8d66227923"
> +PV = "27.1"
> +
> +S = "${WORKDIR}/git"
> --
> 2.34.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99199): 
> <https://lists.openembedded.org/g/openembedded-devel/message/99199>
> Mute This Topic: <https://lists.openembedded.org/mt/94386124/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-jOEGu5Kzd2H4EvNp35jF
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>sent again because of mail delivery error</div></div><div id="geary-quote" dir="auto"><br>Am Mo, 17. Okt 2022 um 16:53:39 +0200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Mesa has support for perfetto, but the libperfetto library is needed
- Only v27 seems to be supported for now. Update perfetto accordingly
- Make sure perfetto and libperfetto share the same codebase
- Patch meson.build to allow shared build
- Add a version number to avoid having a non symlink so file packaged into dev package.
- Create a PC file for libperfetto to allow mesa to find it using pkgconfig.
- Add nobranch=1 for the git repos to silence warnings about missing default branch

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...1-meson-add-pc-file-for-lib_perfetto.patch | 38 +++++++++++++++++++
 .../recipes-devtools/perfetto/libperfetto.bb  | 11 ++++++
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 14 +++----
 .../recipes-devtools/perfetto/perfetto.inc    |  9 +++++
 4 files changed, 65 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
 create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto.bb
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto.inc

diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
new file mode 100644
index 000000000..056382156
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
@@ -0,0 +1,38 @@
+From 4712b1252ecf6270b5bb2931358b4a368351eaa3 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Mon, 17 Oct 2022 15:39:26 +0200
+Subject: [PATCH] meson: add PC file for lib_perfetto
+
+---
+ meson.build | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 06015141c..c67358cae 100644
+--- a/meson.build
++++ b/meson.build
+@@ -30,8 +30,9 @@ endif
+ 
+ dep_threads = dependency('threads')
+ 
+-lib_perfetto = static_library(
++lib_perfetto = shared_library(
+     'perfetto',
++    version: '27.1',
+     sources: 'sdk/perfetto.cc',
+     dependencies: dep_threads,
+     install: true,
+@@ -39,6 +40,10 @@ lib_perfetto = static_library(
+ 
+ inc_perfetto = include_directories('sdk')
+ 
++install_headers('sdk/perfetto.h')
++pkg = import('pkgconfig')
++pkg.generate(lib_perfetto)
++
+ dep_perfetto = declare_dependency(
+     link_with: lib_perfetto,
+     include_directories: inc_perfetto,
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto.bb b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
new file mode 100644
index 000000000..d58e31414
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
@@ -0,0 +1,11 @@
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390" "="">file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390"</a>
+
+require perfetto.inc
+
+inherit meson
+
+SRC_URI:append = " <a href="file://0001-meson-add-pc-file-for-lib_perfetto.patch" "="">file://0001-meson-add-pc-file-for-lib_perfetto.patch"</a>
+
+FILES:${PN} += "${datadir}"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 94c39e9cc..c1b099430 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -10,16 +10,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390 \
                     <a href="file://debian/copyright;md5=4e08364c82141f181de69d0a2b89d612">file://debian/copyright;md5=4e08364c82141f181de69d0a2b89d612</a> \
                     <a href="file://python/LICENSE;md5=c602a632c34ade9c78a976734077bce7" "="">file://python/LICENSE;md5=c602a632c34ade9c78a976734077bce7"</a>
 
-SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto \
+SRC_URI:append = " \
            git://github.com/protocolbuffers/protobuf.git;branch=3.9.x;protocol=https;destsuffix=git/buildtools/protobuf;name=protobuf \
-           git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=git/buildtools/libcxx;name=libcxx \
-           git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=git/buildtools/libcxxabi;name=libcxxabi \
-           git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;name=libunwind \
-           git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib \
+           git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=git/buildtools/libcxx;name=libcxx;nobranch=1 \
+           git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=git/buildtools/libcxxabi;name=libcxxabi;nobranch=1 \
+           git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;name=libunwind;nobranch=1 \
+           git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib;nobranch=1 \
            <a href="https://storage.googleapis.com/perfetto/gn-linux64-1968-0725d782;subdir=git/buildtools/;name=gn">https://storage.googleapis.com/perfetto/gn-linux64-1968-0725d782;subdir=git/buildtools/;name=gn</a> \
            <a href="file://0001-Remove-check_build_deps-build-steps.patch">file://0001-Remove-check_build_deps-build-steps.patch</a> "
 
-SRCREV_perfetto = "5bd3f582c075d0d026c5fe0b5e291d34dee0d976"
 SRCREV_protobuf = "6a59a2ad1f61d9696092f79b6d74368b4d7970a3"
 SRCREV_libcxx = "d9040c75cfea5928c804ab7c235fed06a63f743a"
 SRCREV_libcxxabi = "196ba1aaa8ac285d94f4ea8d9836390a45360533"
@@ -27,6 +26,8 @@ SRCREV_libunwind = "d999d54f4bca789543a2eb6c995af2d9b5a1f3ed"
 SRCREV_zlib = "5c85a2da4c13eda07f69d81a1579a5afddd35f59"
 SRC_URI[gn.sha256sum] = "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa2358177b64f5cd"
 
+require perfetto.inc
+
 DEPENDS += " ninja-native"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm).*-linux*"
@@ -35,7 +36,6 @@ FILES:${PN}:append = " \
   ${bindir}/tracebox \
   "
 
-S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
 CXXFLAGS:append:arm = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', '', d)}"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
new file mode 100644
index 000000000..5cb6f8bb3
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Perfetto - System profiling, app tracing and trace analysis."
+HOMEPAGE = "<a href="https://github.com/google/perfetto">https://github.com/google/perfetto</a>"
+
+SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1"
+
+SRCREV_perfetto = "1c52b5e132312aeb007ed180d4ba1d8d66227923"
+PV = "27.1"
+
+S = "${WORKDIR}/git"
<div>-- 
</div>2.34.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#99199): <a href="https://lists.openembedded.org/g/openembedded-devel/message/99199">https://lists.openembedded.org/g/openembedded-devel/message/99199</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/94386124/3618223">https://lists.openembedded.org/mt/94386124/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-jOEGu5Kzd2H4EvNp35jF--


