Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24918D3000E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 13:53:19 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.22388.1729259591844462949
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 06:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 64A863639F
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 15:53:08 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.33.25]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t1nPd-1xB4FM0; Fri, 18 Oct 2024 15:53:06 +0200
Date: Fri, 18 Oct 2024 15:55:11 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] snapper: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <ZB1KLS.FYWPL6R2DCQT2@t-online.de>
In-Reply-To: <17FF906480C7D821.8839@lists.openembedded.org>
References: <17FF906480C7D821.8839@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-DeSAmCp63rz26GEi4bpy"
X-TOI-EXPURGATEID: 150726::1729259586-197F85EF-53B274DA/0/0 CLEAN NORMAL
X-TOI-MSGID: 04830e60-ca3e-480b-8e6a-d2ee88bcf8c5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 13:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112982

--=-DeSAmCp63rz26GEi4bpy
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: disable zypp

On Fri, Oct 18 2024 at 03:53:46 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Snapper is a tool for Linux file system snapshot management. Apart 
> from
> the obvious creation and deletion of snapshots it can compare 
> snapshots
> and revert differences between them. In simple terms, this allows root
> and non-root users to view older versions of files and revert changes.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-support/snapper/snapper_0.11.2.bb | 37 
> +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> 
> diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb 
> b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> new file mode 100644
> index 000000000..5bc0d36f8
> --- /dev/null
> +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "Snapper is a tool for Linux file system snapshot 
> management"
> +HOMEPAGE = "<https://github.com/openSUSE/snapper>"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" 
> <file://copying;md5=751419260aa954499f7abaabaa882bbe/>
> +
> +DEPENDS = "acl boost btrfs-tools dbus json-c libxml2 lvm2 zlib"
> +
> +# Build separation is slightly broken
> +inherit autotools-brokensep pkgconfig gettext
> +
> +SRC_URI = 
> "git://github.com/openSUSE/snapper.git;protocol=https;branch=master"
> +SRCREV = "6c603565f36e9996d85045c8012cd04aba5f3708"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF += "--disable-zypp"
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'api-documentation 
> systemd pam', d)}"
> +PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
> +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
> +PACKAGECONFIG[api-documentation] = 
> "--enable-doc,--disable-doc,libxslt-native 
> docbook-xsl-stylesheets-native"
> +
> +# Avoid HOSTTOOLS path in binaries
> +export DIFFBIN="${bindir}/diff"
> +export RMBIN = "${bindir}/rm"
> +export TOUCHBIN = "${bindir}/touch"
> +export CPBIN = "${bindir}/cp"
> +
> +
> +do_install:append() {
> +	install -d ${D}${sysconfdir}/sysconfig
> +	install -m0644 ${S}/data/default-config 
> ${D}${sysconfdir}/sysconfig/snapper
> +}
> +
> +FILES:${PN} += "${libdir}/pam_snapper ${libdir}/systemd 
> ${libdir}/security ${datadir}"
> +# bash is needed for the testsuite
> +RDEPENDS:${PN} = "bash diffutils util-linux"
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112981): 
> <https://lists.openembedded.org/g/openembedded-devel/message/112981>
> Mute This Topic: <https://lists.openembedded.org/mt/109082177/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-DeSAmCp63rz26GEi4bpy
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: disable zypp</div></div><div id="geary-quote" dir="auto"><br>On Fri, Oct 18 2024 at 03:53:46 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Snapper is a tool for Linux file system snapshot management. Apart from
the obvious creation and deletion of snapshots it can compare snapshots
and revert differences between them. In simple terms, this allows root
and non-root users to view older versions of files and revert changes.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-support/snapper/snapper_0.11.2.bb | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb

diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
new file mode 100644
index 000000000..5bc0d36f8
--- /dev/null
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Snapper is a tool for Linux file system snapshot management"
+HOMEPAGE = "<a href="https://github.com/openSUSE/snapper">https://github.com/openSUSE/snapper</a>"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=751419260aa954499f7abaabaa882bbe" "="">file://COPYING;md5=751419260aa954499f7abaabaa882bbe"</a>
+
+DEPENDS = "acl boost btrfs-tools dbus json-c libxml2 lvm2 zlib"
+
+# Build separation is slightly broken
+inherit autotools-brokensep pkgconfig gettext
+
+SRC_URI = "git://github.com/openSUSE/snapper.git;protocol=https;branch=master"
+SRCREV = "6c603565f36e9996d85045c8012cd04aba5f3708"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--disable-zypp"
+
+PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'api-documentation systemd pam', d)}"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
+PACKAGECONFIG[api-documentation] = "--enable-doc,--disable-doc,libxslt-native docbook-xsl-stylesheets-native"
+
+# Avoid HOSTTOOLS path in binaries
+export DIFFBIN="${bindir}/diff"
+export RMBIN = "${bindir}/rm"
+export TOUCHBIN = "${bindir}/touch"
+export CPBIN = "${bindir}/cp"
+
+
+do_install:append() {
+	install -d ${D}${sysconfdir}/sysconfig
+	install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconfig/snapper
+}
+
+FILES:${PN} += "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/security ${datadir}"
+# bash is needed for the testsuite
+RDEPENDS:${PN} = "bash diffutils util-linux"
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#112981): <a href="https://lists.openembedded.org/g/openembedded-devel/message/112981">https://lists.openembedded.org/g/openembedded-devel/message/112981</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/109082177/3618223">https://lists.openembedded.org/mt/109082177/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-DeSAmCp63rz26GEi4bpy--


