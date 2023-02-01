Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070A9C38142
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 05:21:50 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.16653.1675228905080877559
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 21:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id A08C0178E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Feb 2023 06:21:43 +0100 (CET)
Received: from [192.168.178.83] ([84.163.46.155]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pN5Yx-4GRp6O0; Wed, 1 Feb 2023 06:21:39 +0100
Date: Wed, 01 Feb 2023 06:21:33 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCHv3] system-config-printer: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <XVYDPR.BWKRSOYI4AU1@t-online.de>
In-Reply-To: <20230201051919.45856-1-f_l_k@t-online.de>
References: <20230201051919.45856-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-GgH0X2kl3VTSl2vKjTtl"
X-TOI-EXPURGATEID: 150726::1675228900-12796992-F39D7A5B/0/0 CLEAN NORMAL
X-TOI-MSGID: e4c16d48-aadc-46e9-9598-aadead981c48
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 05:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100898

--=-GgH0X2kl3VTSl2vKjTtl
Content-Type: text/plain; charset=us-ascii; format=flowed

I removed the dependency on systemd to allow to build without. It'll be 
found automatically if present

Am Mi, 1. Feb 2023 um 06:19:19 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> The OpenPrinting gui for cups configuration
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../system-config-printer_1.5.18.bb           | 33 
> +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 
> meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> 
> diff --git 
> a/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb 
> b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> new file mode 100644
> index 000000000..ba2fbed98
> --- /dev/null
> +++ 
> b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "a graphical user interface that allows the user to 
> change print settings"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> +
> +SRC_URI = 
> "git://github.com/OpenPrinting/system-config-printer.git;protocol=https;branch=master"
> +
> +SRCREV = "895d3dec50c93bfd4f142bac9bfcc13051bf84cb"
> +S = "${WORKDIR}/git"
> +
> +inherit autotools gettext pkgconfig python3native features_check
> +
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +
> +DEPENDS = "cups glib-2.0 libusb xmlto-native intltool-native 
> desktop-file-utils-native"
> +
> +do_configure:prepend() {
> +    # This file is not provided if fetching from git but required 
> for configure
> +    touch ${S}/ChangeLog
> +}
> +
> +FILES:${PN} += "${libdir} ${datadir}"
> +
> +RDEPENDS:${PN} = " \
> +    dbus-x11 \
> +    gtk+3 \
> +    libnotify \
> +    python3-core \
> +    python3-dbus \
> +    python3-firewall \
> +    python3-pycups \
> +    python3-pycurl \
> +    python3-pygobject \
> +"
> --
> 2.34.1
> 


--=-GgH0X2kl3VTSl2vKjTtl
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I removed the dependency on systemd to allow to build without. It'll be found automatically if present</div></div><div id="geary-quote" dir="auto"><br>Am Mi, 1. Feb 2023 um 06:19:19 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">The OpenPrinting gui for cups configuration

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../system-config-printer_1.5.18.bb           | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb

diff --git a/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
new file mode 100644
index 000000000..ba2fbed98
--- /dev/null
+++ b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "a graphical user interface that allows the user to change print settings"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
+
+SRC_URI = "git://github.com/OpenPrinting/system-config-printer.git;protocol=https;branch=master"
+
+SRCREV = "895d3dec50c93bfd4f142bac9bfcc13051bf84cb"
+S = "${WORKDIR}/git"
+
+inherit autotools gettext pkgconfig python3native features_check
+
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+
+DEPENDS = "cups glib-2.0 libusb xmlto-native intltool-native desktop-file-utils-native"
+
+do_configure:prepend() {
+    # This file is not provided if fetching from git but required for configure
+    touch ${S}/ChangeLog
+}
+
+FILES:${PN} += "${libdir} ${datadir}"
+
+RDEPENDS:${PN} = " \
+    dbus-x11 \
+    gtk+3 \
+    libnotify \
+    python3-core \
+    python3-dbus \
+    python3-firewall \
+    python3-pycups \
+    python3-pycurl \
+    python3-pygobject \
+"
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-GgH0X2kl3VTSl2vKjTtl--


