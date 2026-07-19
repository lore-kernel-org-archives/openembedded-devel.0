Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE74AC4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 14:48:44 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6484.1784472515664158756
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 07:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=i4g4U3sJ;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout11.t-online.de (Postfix) with SMTP id B6E171C11A
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 16:48:33 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.166.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wlSog-2Gtujo0; Sun, 19 Jul 2026 16:48:30 +0200
Date: Sun, 19 Jul 2026 16:48:25 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] protobuf: update 6.33.1 -> 35.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <PSFFIT.BDTC3AOV2LX93@t-online.de>
In-Reply-To: <18C3B8329BF6024D.2522628@lists.openembedded.org>
References: <18C3B8329BF6024D.2522628@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3qFNYz3BM1nC6hHIUybA"
X-TOI-EXPURGATEID: 150726::1784472510-49FF89F8-892B2FBA/0/0 CLEAN NORMAL
X-TOI-MSGID: c8beb718-4815-4236-9319-94ef2ecf1e6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784472513; i=f_l_k@t-online.de;
	bh=1HuX6vhomiJd2aH39b+N0ejeYSiNbgvQwz8IdsSS9FM=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=i4g4U3sJrvcwq58nZdxmwTcTOcmPtL0nNnmQRxMwzQX1oiO9twsl9AYKKVn+qDAdr
	 dxVqYSbKao++AeZ75coEbmWx+ulQ6vu4HHWaIDUU9vrLVAI38/kLF12K1E7cFB5Z/n
	 l4tBWyBwKjt/sO6U5CnGmF7VBv/evcyxzNY7qItmEOTnsshNtT6LLhyzKYbYUNxbSK
	 0ybEYMX/b2v0fwo3kjfRsZn7aQC+YrJW8RuEx6yARCmMXWYOsGnlqf8znd6S56nUwK
	 AOHJyxGsDm4DDcm3uyl7p/k3EetgI1K0eOw7iNUAZCkT7+2MXCZcztZtr6Lm13ojQz
	 6HicKD5b6Ui+Q==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 14:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128260

--=-3qFNYz3BM1nC6hHIUybA
Content-Type: text/plain; charset=us-ascii; format=flowed

While cross-compiling warzone2100 for aarch64, I ran into issues with 
protobuf, which are fixed by this patch.
I also updated the recipe, but I think there must be a reason we're 
still using v6. So I submitted this as an RFC.

Am So, 19. Jul 2026 um 16:46:31 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
>     - Remove PROTOC_VERSION. It now matches PV
>     - Adjust PROTOC_BRANCH
>     - Do not build with a custom configuration for protobuf-native; 
> in particular, do not build shared libraries
>     - protobuf-native only needs to provide the binaries. Do not 
> package the library and includes to
>       avoid potential linking failures
> ---
>  .../{protobuf_6.33.6.bb => protobuf_35.1.bb}  | 19 
> +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_6.33.6.bb => 
> protobuf_35.1.bb} (92%)
> 
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb 
> b/meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
> similarity index 92%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
> index 880dd82b1d..dd3f364de2 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
> @@ -10,21 +10,20 @@ LIC_FILES_CHKSUM = " \
>      
> <file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c> 
> \
>  "
> 
> -PROTOC_VERSION = "v${@d.getVar 
> <mailto:v${@d.getVar>('PV').split('.', 1)[1]}"
> -PROTOC_BRANCH = "${@d.getVar <mailto:${@d.getVar>('PV').split('.', 
> 2)[1]}.x"
> +PROTOC_BRANCH = "${@d.getVar 
> <mailto:${@d.getVar>('PV').split('.')[0]}.x"
> 
>  DEPENDS = "zlib abseil-cpp jsoncpp"
>  DEPENDS:append:class-target = " protobuf-native"
> 
> -SRCREV = "6e1998413a5bca7c058b85999667893f167434bc"
> +SRCREV = "35cd01f9fe9afbeea38cc7b979a3b6bfcde82c03"
> 
> -SRC_URI = 
> "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH};protocol=https;tag=${PROTOC_VERSION} 
> \
> +SRC_URI = 
> "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH};protocol=https;tag=v${PV} 
> \
>             file://run-ptest <file://run-ptest/> \
>             
> file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch 
> <file://0001-examples-makefile-respect-cxx-ldflags-variables-fix-.patch/> 
> \
>             
> file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch 
> <file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch/> \
>             "
> 
> -UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+\.\d+)"
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+)"
> 
>  CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf 
> protobuf-cpp"
> 
> @@ -39,7 +38,7 @@ PACKAGECONFIG:class-nativesdk ?= "compiler"
>  PACKAGECONFIG[python] = ",,"
>  PACKAGECONFIG[compiler] = 
> "-Dprotobuf_BUILD_PROTOC_BINARIES=ON,-Dprotobuf_BUILD_PROTOC_BINARIES=OFF"
> 
> -EXTRA_OECMAKE += "\
> +EXTRA_OECMAKE:class-target = "\
>      -Dprotobuf_BUILD_SHARED_LIBS=ON \
>      -Dprotobuf_BUILD_LIBPROTOC=ON \
>      -Dprotobuf_BUILD_TESTS=OFF \
> @@ -100,6 +99,14 @@ do_compile_ptest() {
>  	export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
>  }
> 
> +do_install:append:class-native() {
> +    rm -rf ${D}${libdir} ${D}${includedir}
> +}
> +
> +do_install:append:class-nativesdk() {
> +    rm -rf ${D}${libdir} ${D}${includedir}
> +}
> +
>  do_install_ptest() {
>  	local olddir=`pwd`
> 
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128259): 
> <https://lists.openembedded.org/g/openembedded-devel/message/128259>
> Mute This Topic: <https://lists.openembedded.org/mt/120344566/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-3qFNYz3BM1nC6hHIUybA
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>While cross-compiling warzone2100 for aarch64, I ran into issues with protobuf, which are fixed by this patch.</div><div>I also updated the recipe, but I think there must be a reason we're still using v6. So I submitted this as an RFC.</div></div><div id="geary-quote" dir="auto"><br>Am So, 19. Jul 2026 um 16:46:31 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">    - Remove PROTOC_VERSION. It now matches PV
    - Adjust PROTOC_BRANCH
    - Do not build with a custom configuration for protobuf-native; in particular, do not build shared libraries
    - protobuf-native only needs to provide the binaries. Do not package the library and includes to
      avoid potential linking failures
---
 .../{protobuf_6.33.6.bb =&gt; protobuf_35.1.bb}  | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_6.33.6.bb =&gt; protobuf_35.1.bb} (92%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
similarity index 92%
rename from meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
index 880dd82b1d..dd3f364de2 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
@@ -10,21 +10,20 @@ LIC_FILES_CHKSUM = " \
     <a href="file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c">file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c</a> \
 "
 
-PROTOC_VERSION = "<a href="mailto:v${@d.getVar">v${@d.getVar</a>('PV').split('.', 1)[1]}"
-PROTOC_BRANCH = "<a href="mailto:${@d.getVar">${@d.getVar</a>('PV').split('.', 2)[1]}.x"
+PROTOC_BRANCH = "<a href="mailto:${@d.getVar">${@d.getVar</a>('PV').split('.')[0]}.x"
 
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "6e1998413a5bca7c058b85999667893f167434bc"
+SRCREV = "35cd01f9fe9afbeea38cc7b979a3b6bfcde82c03"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH};protocol=https;tag=${PROTOC_VERSION} \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH};protocol=https;tag=v${PV} \
            <a href="file://run-ptest">file://run-ptest</a> \
            <a href="file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch">file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch</a> \
            <a href="file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch">file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch</a> \
            "
 
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P&lt;pver&gt;\d\.\d+\.\d+)"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P&lt;pver&gt;\d\.\d+)"
 
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
 
@@ -39,7 +38,7 @@ PACKAGECONFIG:class-nativesdk ?= "compiler"
 PACKAGECONFIG[python] = ",,"
 PACKAGECONFIG[compiler] = "-Dprotobuf_BUILD_PROTOC_BINARIES=ON,-Dprotobuf_BUILD_PROTOC_BINARIES=OFF"
 
-EXTRA_OECMAKE += "\
+EXTRA_OECMAKE:class-target = "\
     -Dprotobuf_BUILD_SHARED_LIBS=ON \
     -Dprotobuf_BUILD_LIBPROTOC=ON \
     -Dprotobuf_BUILD_TESTS=OFF \
@@ -100,6 +99,14 @@ do_compile_ptest() {
 	export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
 }
 
+do_install:append:class-native() {
+    rm -rf ${D}${libdir} ${D}${includedir}
+}
+
+do_install:append:class-nativesdk() {
+    rm -rf ${D}${libdir} ${D}${includedir}
+}
+
 do_install_ptest() {
 	local olddir=`pwd`
 
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#128259): <a href="https://lists.openembedded.org/g/openembedded-devel/message/128259">https://lists.openembedded.org/g/openembedded-devel/message/128259</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/120344566/3618223">https://lists.openembedded.org/mt/120344566/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-3qFNYz3BM1nC6hHIUybA--


