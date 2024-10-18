Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FA9D30008
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 13:16:39 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.21601.1729257394883918563
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 06:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout01.t-online.de (Postfix) with SMTP id A45D3B0E1
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 15:16:32 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.33.25]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t1mqC-2N1wKO0; Fri, 18 Oct 2024 15:16:28 +0200
Date: Fri, 18 Oct 2024 15:18:34 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] snapper: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <YMZJLS.1JHRF8BZ7IRL2@t-online.de>
In-Reply-To: <17FF8E6016EB1E66.8839@lists.openembedded.org>
References: <17FF8E6016EB1E66.8839@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8CuAzXlEbdwoUEH6RIPB"
X-TOI-EXPURGATEID: 150726::1729257388-41FF88C0-1982E0E8/0/0 CLEAN NORMAL
X-TOI-MSGID: a550dc29-51e4-41ef-b410-f00cbd5276a0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 13:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112979

--=-8CuAzXlEbdwoUEH6RIPB
Content-Type: text/plain; charset=us-ascii; format=flowed

I created a recipe for snapper and thought it might be useful enough 
for meta-oe?

On Fri, Oct 18 2024 at 03:17:24 PM +02:00:00, Markus Volk 
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
>  .../recipes-support/snapper/snapper_0.11.2.bb | 35 
> +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> 
> diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb 
> b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> new file mode 100644
> index 000000000..2759cdafb
> --- /dev/null
> +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> @@ -0,0 +1,35 @@
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
> ${libdir}/zypp ${libdir}/security ${datadir}"
> +# bash is needed for the testsuite
> +RDEPENDS:${PN} = "bash diffutils util-linux"
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112978): 
> <https://lists.openembedded.org/g/openembedded-devel/message/112978>
> Mute This Topic: <https://lists.openembedded.org/mt/109081580/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-8CuAzXlEbdwoUEH6RIPB
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I created a recipe for snapper and thought it might be useful enough for meta-oe?</div></div><div id="geary-quote" dir="auto"><br>On Fri, Oct 18 2024 at 03:17:24 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Snapper is a tool for Linux file system snapshot management. Apart from
the obvious creation and deletion of snapshots it can compare snapshots
and revert differences between them. In simple terms, this allows root
and non-root users to view older versions of files and revert changes.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-support/snapper/snapper_0.11.2.bb | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb

diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
new file mode 100644
index 000000000..2759cdafb
--- /dev/null
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -0,0 +1,35 @@
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
+FILES:${PN} += "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/zypp ${libdir}/security ${datadir}"
+# bash is needed for the testsuite
+RDEPENDS:${PN} = "bash diffutils util-linux"
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#112978): <a href="https://lists.openembedded.org/g/openembedded-devel/message/112978">https://lists.openembedded.org/g/openembedded-devel/message/112978</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/109081580/3618223">https://lists.openembedded.org/mt/109081580/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-8CuAzXlEbdwoUEH6RIPB--


