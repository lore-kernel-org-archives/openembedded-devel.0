Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A10E77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 17:17:29 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.26237.1736270240695019087
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 09:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout11.t-online.de (Postfix) with SMTP id 7DA3DFE9
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:17:18 +0100 (CET)
Received: from [192.168.178.67] ([84.163.46.246]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVDCd-0G6BX60; Tue, 7 Jan 2025 18:17:15 +0100
Date: Tue, 07 Jan 2025 18:17:29 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv3] x265: update 3.2.1 -> 4.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <5PAQPS.HDRNZM5FNZBD1@t-online.de>
In-Reply-To: <18187887BF14CFCD.5240@lists.openembedded.org>
References: <18187887BF14CFCD.5240@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-7E6vZtcZAqcyVQIATKDm"
X-TOI-EXPURGATEID: 150726::1736270235-56FFA9DE-8593DFD2/0/0 CLEAN NORMAL
X-TOI-MSGID: cb18d183-13aa-48b8-9282-fec52c6c6a9b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 17:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114719

--=-7E6vZtcZAqcyVQIATKDm
Content-Type: text/plain; charset=us-ascii; format=flowed

fix typo

On Tue, Jan 7 2025 at 18:16:31 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add PACKAGECONFIG for hdr10plus and 10bit
> - add numa support
> - build shared library by default
> - do manual packaging to avoid dev-elf error:
> x265-4.1-r0 do_package_qa: QA Issue: -dev package x265-dev contains 
> non-symlink .so '/usr/lib/libhdr10plus.so' [dev-elf]
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-multimedia/x265/x265_3.2.1.bb     | 26 -----------------
>  .../recipes-multimedia/x265/x265_4.1.bb       | 29 
> +++++++++++++++++++
>  2 files changed, 29 insertions(+), 26 deletions(-)
>  delete mode 100644 
> meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
>  create mode 100644 
> meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> 
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb 
> b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> deleted file mode 100644
> index 225fbdee87..0000000000
> --- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -SUMMARY = "H.265/HEVC video encoder"
> -DESCRIPTION = "A free software library and application for encoding 
> video streams into the H.265/HEVC format."
> -HOMEPAGE = "<http://www.videolan.org/developers/x265.html>"
> -
> -LICENSE = "GPL-2.0-only"
> -LICENSE_FLAGS = "commercial"
> -LIC_FILES_CHKSUM = 
> "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091" 
> <file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091>
> -
> -DEPENDS = "nasm-native gnutls zlib libpcre"
> -
> -SRC_URI = 
> "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz 
> <http://ftp.videolan.org/pub/videolan/x265/x265_$%7BPV%7D.tar.gz>"
> -
> -S = "${WORKDIR}/x265_${PV}/source"
> -
> -SRC_URI[sha256sum] = 
> "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
> -
> -inherit lib_package pkgconfig cmake
> -
> -do_generate_toolchain_file:append() {
> -    echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map 
> ${S}=${TARGET_DBGSRC_DIR})" >> ${WORKDIR}/toolchain.cmake
> -}
> -
> -EXTRA_OECMAKE:append:x86 = " -DENABLE_ASSEMBLY=OFF"
> -EXTRA_OECMAKE:append:aarch64 = " -DENABLE_PIC=ON"
> -
> -AS[unexport] = "1"
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb 
> b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> new file mode 100644
> index 0000000000..176774e359
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "H.265/HEVC video encoder"
> +DESCRIPTION = "A free software library and application for encoding 
> video streams into the H.265/HEVC format."
> +HOMEPAGE = "<https://bitbucket.org/multicoreware/x265_git>"
> +
> +LICENSE = "GPL-2.0-only"
> +LICENSE_FLAGS = "commercial"
> +LIC_FILES_CHKSUM = 
> "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091" 
> <file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091>
> +
> +DEPENDS = "nasm-native gnutls zlib libpcre numactl"
> +
> +SRC_URI = 
> "https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz 
> <https://bitbucket.org/multicoreware/x265_git/downloads/x265_$%7BPV%7D.tar.gz>"
> +SRC_URI[sha256sum] = 
> "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
> +S = "${WORKDIR}/x265_${PV}/source"
> +
> +inherit lib_package cmake pkgconfig
> +
> +EXTRA_OECMAKE += "-DENABLE_SHARED=ON -DENABLE_CLI=ON"
> +
> +do_generate_toolchain_file:append() {
> +   echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map 
> ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> 
> ${WORKDIR}/toolchain.cmake
> +}
> +
> +PACKAGECONFIG ?= "hdr10plus 10bit"
> +PACKAGECONFIG[hdr10plus] = 
> "-DENABLE_HDR10_PLUS=ON,-DENABLE_HDR10_PLUS=OFF"
> +PACKAGECONFIG[10bit] = "-DHIGH_BIT_DEPTH=ON,-DHIGH_BIT_DEPTH=OFF"
> +
> +FILES:${PN} += "${libdir}/libhdr10plus.so"
> +FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig 
> ${libdir}/libx265.so"
> +
> --
> 2.47.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114718): 
> <https://lists.openembedded.org/g/openembedded-devel/message/114718>
> Mute This Topic: <https://lists.openembedded.org/mt/110480967/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-7E6vZtcZAqcyVQIATKDm
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>fix typo</div></div><div id="geary-quote" dir="auto"><br>On Tue, Jan 7 2025 at 18:16:31 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add PACKAGECONFIG for hdr10plus and 10bit
- add numa support
- build shared library by default
- do manual packaging to avoid dev-elf error:
x265-4.1-r0 do_package_qa: QA Issue: -dev package x265-dev contains non-symlink .so '/usr/lib/libhdr10plus.so' [dev-elf]

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-multimedia/x265/x265_3.2.1.bb     | 26 -----------------
 .../recipes-multimedia/x265/x265_4.1.bb       | 29 +++++++++++++++++++
 2 files changed, 29 insertions(+), 26 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265_4.1.bb

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
deleted file mode 100644
index 225fbdee87..0000000000
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "H.265/HEVC video encoder"
-DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
-HOMEPAGE = "<a href="http://www.videolan.org/developers/x265.html">http://www.videolan.org/developers/x265.html</a>"
-
-LICENSE = "GPL-2.0-only"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "<a href="file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091" "="">file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"</a>
-
-DEPENDS = "nasm-native gnutls zlib libpcre"
-
-SRC_URI = "<a href="http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz">http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz</a>"
-
-S = "${WORKDIR}/x265_${PV}/source"
-
-SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
-
-inherit lib_package pkgconfig cmake
-
-do_generate_toolchain_file:append() {
-    echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=${TARGET_DBGSRC_DIR})" &gt;&gt; ${WORKDIR}/toolchain.cmake
-}
-
-EXTRA_OECMAKE:append:x86 = " -DENABLE_ASSEMBLY=OFF"
-EXTRA_OECMAKE:append:aarch64 = " -DENABLE_PIC=ON"
-
-AS[unexport] = "1"
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
new file mode 100644
index 0000000000..176774e359
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "H.265/HEVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
+HOMEPAGE = "<a href="https://bitbucket.org/multicoreware/x265_git">https://bitbucket.org/multicoreware/x265_git</a>"
+
+LICENSE = "GPL-2.0-only"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "<a href="file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091" "="">file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"</a>
+
+DEPENDS = "nasm-native gnutls zlib libpcre numactl"
+
+SRC_URI = "<a href="https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz">https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz</a>"
+SRC_URI[sha256sum] = "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
+S = "${WORKDIR}/x265_${PV}/source"
+
+inherit lib_package cmake pkgconfig
+
+EXTRA_OECMAKE += "-DENABLE_SHARED=ON -DENABLE_CLI=ON"
+
+do_generate_toolchain_file:append() {
+   echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" &gt;&gt; ${WORKDIR}/toolchain.cmake
+}
+
+PACKAGECONFIG ?= "hdr10plus 10bit"
+PACKAGECONFIG[hdr10plus] = "-DENABLE_HDR10_PLUS=ON,-DENABLE_HDR10_PLUS=OFF"
+PACKAGECONFIG[10bit] = "-DHIGH_BIT_DEPTH=ON,-DHIGH_BIT_DEPTH=OFF"
+
+FILES:${PN} += "${libdir}/libhdr10plus.so"
+FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/libx265.so"
+
<div>-- 
</div>2.47.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#114718): <a href="https://lists.openembedded.org/g/openembedded-devel/message/114718">https://lists.openembedded.org/g/openembedded-devel/message/114718</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110480967/3618223">https://lists.openembedded.org/mt/110480967/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-7E6vZtcZAqcyVQIATKDm--


