Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5A9C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 05:50:58 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.5728.1712037054446623920
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 22:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id 0D1DDE4E7
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Apr 2024 07:50:53 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.174.110]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrX2p-4ZOY2C0; Tue, 2 Apr 2024 07:50:51 +0200
Date: Tue, 02 Apr 2024 07:51:09 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libjxl: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <99WABS.CMZHD6HTU89B1@t-online.de>
In-Reply-To: <17C26094CB1AF857.27825@lists.openembedded.org>
References: <17C26094CB1AF857.27825@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-cwpqB/JxqgSt8pV6e0Jq"
X-TOI-EXPURGATEID: 150726::1712037051-94A7B9CB-FB8FF7FD/0/0 CLEAN NORMAL
X-TOI-MSGID: e0643d1f-e5d0-43f8-9be0-90ef1724c451
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 05:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109775

--=-cwpqB/JxqgSt8pV6e0Jq
Content-Type: text/plain; charset=us-ascii; format=flowed

renamed to provide PV in the bb name

On Tue, Apr 2 2024 at 07:49:47 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Import this recipe from meta-wayland, because it is a prerequisite
> for the Gnome desktop. The recently updated gnome-backgrounds package
> has converted most of the backgrounds to jxl and to keep them usable
> the gdk-pixbuf-loader for jpegxl must be provided. This is included
> in the libjxl package itself.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../libjxl/libjxl_2.10.0.bb                   | 42 
> +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> 
> diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb 
> b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> new file mode 100644
> index 000000000..0c4f79fdb
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> @@ -0,0 +1,42 @@
> +SUMMARY = "Reference implementation of JPEG XL (encoder and decoder)"
> +HOMEPAGE = "<https://github.com/libjxl/libjxl/>"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=6a905a337cc228a1f68f0b5416f52a7f" 
> <file://license;md5=6a905a337cc228a1f68f0b5416f52a7f/>
> +
> +inherit cmake pkgconfig mime
> +
> +DEPENDS = "highway brotli"
> +
> +SRC_URI = 
> "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1"
> +
> +SRCREV = "e1489592a770b989303b0edc5cc1dc447bbe0515"
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE = " \
> +	-DCMAKE_BUILD_TYPE=Release \
> +	-DJPEGXL_ENABLE_PLUGINS=ON \
> +	-DBUILD_TESTING=OFF \
> +	-DJPEGXL_WARNINGS_AS_ERRORS=OFF \
> +	-DJPEGXL_ENABLE_SIZELESS_VECTORS=ON \
> +	-DJPEGXL_ENABLE_SJPEG=OFF \
> +	-DJPEGXL_ENABLE_BENCHMARK=OFF \
> +	-DJPEGXL_ENABLE_EXAMPLES=OFF \
> +	-DJPEGXL_ENABLE_MANPAGES=OFF \
> +	-DJPEGXL_ENABLE_SKCMS=ON \
> +	-DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
> +	-DJPEGXL_FORCE_SYSTEM_HWY=ON \
> +	-DJPEGXL_ENABLE_JNI=OFF \
> +	-DJPEGXL_ENABLE_TCMALLOC=OFF \
> +	-DJPEGXL_ENABLE_TOOLS=OFF \
> +"
> +
> +PACKAGECONFIG ?= "mime gdk-pixbuf-loader"
> +PACKAGECONFIG[gdk-pixbuf-loader] = 
> "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=ON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=OFF,gdk-pixbuf"
> +PACKAGECONFIG[gimp] = 
> "-DJPEGXL_ENABLE_PLUGIN_GIMP210=ON,-DJPEGXL_ENABLE_PLUGIN_GIMP210=OFF,gimp"
> +PACKAGECONFIG[mime] = 
> "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIME=OFF"
> +
> +FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"
> +
> +CXXFLAGS:append:arm = " -mfp16-format=ieee"
> +
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109774): 
> <https://lists.openembedded.org/g/openembedded-devel/message/109774>
> Mute This Topic: <https://lists.openembedded.org/mt/105282918/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-cwpqB/JxqgSt8pV6e0Jq
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>renamed to provide PV in the bb name</div></div><div id="geary-quote" dir="auto"><br>On Tue, Apr 2 2024 at 07:49:47 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Import this recipe from meta-wayland, because it is a prerequisite
for the Gnome desktop. The recently updated gnome-backgrounds package
has converted most of the backgrounds to jxl and to keep them usable
the gdk-pixbuf-loader for jpegxl must be provided. This is included
in the libjxl package itself.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../libjxl/libjxl_2.10.0.bb                   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
new file mode 100644
index 000000000..0c4f79fdb
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Reference implementation of JPEG XL (encoder and decoder)"
+HOMEPAGE = "<a href="https://github.com/libjxl/libjxl/">https://github.com/libjxl/libjxl/</a>"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=6a905a337cc228a1f68f0b5416f52a7f" "="">file://LICENSE;md5=6a905a337cc228a1f68f0b5416f52a7f"</a>
+
+inherit cmake pkgconfig mime
+
+DEPENDS = "highway brotli"
+
+SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1"
+
+SRCREV = "e1489592a770b989303b0edc5cc1dc447bbe0515"
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = " \
+	-DCMAKE_BUILD_TYPE=Release \
+	-DJPEGXL_ENABLE_PLUGINS=ON \
+	-DBUILD_TESTING=OFF \
+	-DJPEGXL_WARNINGS_AS_ERRORS=OFF \
+	-DJPEGXL_ENABLE_SIZELESS_VECTORS=ON \
+	-DJPEGXL_ENABLE_SJPEG=OFF \
+	-DJPEGXL_ENABLE_BENCHMARK=OFF \
+	-DJPEGXL_ENABLE_EXAMPLES=OFF \
+	-DJPEGXL_ENABLE_MANPAGES=OFF \
+	-DJPEGXL_ENABLE_SKCMS=ON \
+	-DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
+	-DJPEGXL_FORCE_SYSTEM_HWY=ON \
+	-DJPEGXL_ENABLE_JNI=OFF \
+	-DJPEGXL_ENABLE_TCMALLOC=OFF \
+	-DJPEGXL_ENABLE_TOOLS=OFF \
+"
+
+PACKAGECONFIG ?= "mime gdk-pixbuf-loader"
+PACKAGECONFIG[gdk-pixbuf-loader] = "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=ON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=OFF,gdk-pixbuf"
+PACKAGECONFIG[gimp] = "-DJPEGXL_ENABLE_PLUGIN_GIMP210=ON,-DJPEGXL_ENABLE_PLUGIN_GIMP210=OFF,gimp"
+PACKAGECONFIG[mime] = "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIME=OFF"
+
+FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"
+
+CXXFLAGS:append:arm = " -mfp16-format=ieee"
+
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#109774): <a href="https://lists.openembedded.org/g/openembedded-devel/message/109774">https://lists.openembedded.org/g/openembedded-devel/message/109774</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105282918/3618223">https://lists.openembedded.org/mt/105282918/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-cwpqB/JxqgSt8pV6e0Jq--


