Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7587E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 16:39:19 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.25278.1736267952758231910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 08:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 006C314EC;
	Tue,  7 Jan 2025 17:39:11 +0100 (CET)
Received: from [192.168.178.67] ([84.163.46.246]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVCbk-16mhVI0; Tue, 7 Jan 2025 17:39:08 +0100
Date: Tue, 07 Jan 2025 17:39:24 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] x265: update 3.2.1 -> 4.1
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Message-Id: <OX8QPS.DO43ZHKOS8PW1@t-online.de>
In-Reply-To: <18187660CB5A537D.5240@lists.openembedded.org>
References: <18187660CB5A537D.5240@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KQ1TlytHCPoqXpaHfkPt"
X-TOI-EXPURGATEID: 150726::1736267948-FA7FB9DC-27958B8B/0/0 CLEAN NORMAL
X-TOI-MSGID: 8eea6cca-6320-4905-8541-2dabcd5ab4a2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 16:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114716

--=-KQ1TlytHCPoqXpaHfkPt
Content-Type: text/plain; charset=us-ascii; format=flowed

tested to compile for arm/aarch64/x86-64/riscv64 glibc+musl

On Tue, Jan 7 2025 at 17:37:05 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add PACKAGECONFIG for hdr10plus
> - add numa support
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-multimedia/x265/x265_3.2.1.bb     | 26 
> -------------------
>  .../recipes-multimedia/x265/x265_4.1.bb       | 23 ++++++++++++++++
>  2 files changed, 23 insertions(+), 26 deletions(-)
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
> index 0000000000..f430eddcef
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "H.265/HEVC video encoder"
> +DESCRIPTION = "A free software library and application for encoding 
> video streams into the H.265/HEVC format."
> +HOMEPAGE = "<http://www.videolan.org/developers/x265.html>"
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
> +do_generate_toolchain_file:append() {
> +   echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map 
> ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> 
> ${WORKDIR}/toolchain.cmake
> +}
> +
> +PACKAGECONFIG ?= "hdr10plus"
> +PACKAGECONFIG[hdr10plus] = 
> "-DENABLE_HDR10_PLUS=ON,-DENABLE_HDR10_PLUS=OFF"
> +
> --
> 2.47.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114713): 
> <https://lists.openembedded.org/g/openembedded-devel/message/114713>
> Mute This Topic: <https://lists.openembedded.org/mt/110480157/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-KQ1TlytHCPoqXpaHfkPt
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>tested to compile for arm/aarch64/x86-64/riscv64 glibc+musl</div></div><div id="geary-quote" dir="auto"><br>On Tue, Jan 7 2025 at 17:37:05 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add PACKAGECONFIG for hdr10plus
- add numa support

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-multimedia/x265/x265_3.2.1.bb     | 26 -------------------
 .../recipes-multimedia/x265/x265_4.1.bb       | 23 ++++++++++++++++
 2 files changed, 23 insertions(+), 26 deletions(-)
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
index 0000000000..f430eddcef
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "H.265/HEVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
+HOMEPAGE = "<a href="http://www.videolan.org/developers/x265.html">http://www.videolan.org/developers/x265.html</a>"
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
+do_generate_toolchain_file:append() {
+   echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" &gt;&gt; ${WORKDIR}/toolchain.cmake
+}
+
+PACKAGECONFIG ?= "hdr10plus"
+PACKAGECONFIG[hdr10plus] = "-DENABLE_HDR10_PLUS=ON,-DENABLE_HDR10_PLUS=OFF"
+
<div>-- 
</div>2.47.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#114713): <a href="https://lists.openembedded.org/g/openembedded-devel/message/114713">https://lists.openembedded.org/g/openembedded-devel/message/114713</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110480157/3618223">https://lists.openembedded.org/mt/110480157/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-KQ1TlytHCPoqXpaHfkPt--


