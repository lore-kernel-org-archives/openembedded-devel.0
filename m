Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BD1C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:46:03 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.91716.1669556757585742160
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id 7A6E596F4
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 14:45:41 +0100 (CET)
Received: from [192.168.178.83] ([79.219.231.234]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozHyV-11xWIC0; Sun, 27 Nov 2022 14:45:40 +0100
Date: Sun, 27 Nov 2022 14:45:34 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCHv4] polkit: add recipe for v122
To: openembedded-devel@lists.openembedded.org
Message-Id: <Y7E0MR.HJIRW0TTZDR9@t-online.de>
In-Reply-To: <20221127134508.1538723-1-f_l_k@t-online.de>
References: <20221127134508.1538723-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yluureRem+sXpkMxSe2R"
X-TOI-EXPURGATEID: 150726::1669556740-3E7E9B8C-F6A6CF5C/0/0 CLEAN NORMAL
X-TOI-MSGID: 8d32cc6b-8eca-40ee-b284-090014d3d598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 13:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99783

--=-yluureRem+sXpkMxSe2R
Content-Type: text/plain; charset=us-ascii; format=flowed

fixed a typo

Am So, 27. Nov 2022 um 14:45:08 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> autotools buildsystem has been dropped
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-extended/polkit/polkit_122.bb | 49 
> +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit_122.bb
> 
> diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb 
> b/meta-oe/recipes-extended/polkit/polkit_122.bb
> new file mode 100644
> index 000000000..dfa6c14a4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit_122.bb
> @@ -0,0 +1,49 @@
> +SUMMARY = "PolicyKit Authorization Framework"
> +DESCRIPTION = "The polkit package is an application-level toolkit 
> for defining and handling the policy that allows unprivileged 
> processes to speak to privileged processes."
> +HOMEPAGE = "<http://www.freedesktop.org/wiki/Software/polkit>"
> +LICENSE = "LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=155db86cdbafa7532b41f390409283eb" 
> <file://copying;md5=155db86cdbafa7532b41f390409283eb/>
> +
> +SRC_URI = 
> "git://github.com/freedesktop/polkit.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "da87c5698019897dd731bb2cbb54ebd9c9481f52"
> +
> +DEPENDS = "expat glib-2.0"
> +
> +inherit meson pkgconfig useradd systemd gettext 
> gobject-introspection features_check
> +
> +REQUIRED_DISTRO_FEATURES = "polkit"
> +
> +PACKAGECONFIG = " \
> +	${@bb.utils.filter <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 
> 'pam', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 
> 'systemd', 'consolekit', d)} \
> +	dbus \
> +	mozjs \
> +"
> +PACKAGECONFIG[dbus] = ",,dbus"
> +PACKAGECONFIG[gtk-doc] = 
> "-Dgtk_doc=true,-Dgtk_doc=false,gtk-doc-native"
> +PACKAGECONFIG[pam] = "-Dauthfw=pam,-Dauthfw=shadow,libpam,libpam"
> +PACKAGECONFIG[systemd] = 
> "-Dsession_tracking=libsystemd-login,-Dsession_tracking=ConsoleKit,systemd"
> +PACKAGECONFIG[consolekit] = ",,,consolekit"
> +
> +# Default to mozjs javascript library
> +PACKAGECONFIG[mozjs] = "-Djs_engine=mozjs,,mozjs-102,,,duktape"
> +# duktape javascript engine is much smaller and faster but is not 
> compatible with
> +# same javascript standards as mozjs. For example array.includes() 
> function is not
> +# supported. Test rule compatibility when switching to duktape.
> +PACKAGECONFIG[duktape] = "-Djs_engine=duktape,,duktape,,,mozjs"
> +
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/${BPN}-1 --shell /bin/nologin polkitd"
> +
> +SYSTEMD_SERVICE:${PN} = "${BPN}.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +do_install:append() {
> +	#Fix up permissions on polkit rules.d to work with rpm4 constraints
> +	chmod 700 ${D}/${datadir}/polkit-1/rules.d
> +	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
> +}
> +
> +FILES:${PN} += "${libdir}/polkit-1 ${datadir}"
> --
> 2.34.1
> 


--=-yluureRem+sXpkMxSe2R
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>fixed a typo</div></div><div id="geary-quote" dir="auto"><br>Am So, 27. Nov 2022 um 14:45:08 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">autotools buildsystem has been dropped

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-extended/polkit/polkit_122.bb | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_122.bb

diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb b/meta-oe/recipes-extended/polkit/polkit_122.bb
new file mode 100644
index 000000000..dfa6c14a4
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit_122.bb
@@ -0,0 +1,49 @@
+SUMMARY = "PolicyKit Authorization Framework"
+DESCRIPTION = "The polkit package is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes."
+HOMEPAGE = "<a href="http://www.freedesktop.org/wiki/Software/polkit">http://www.freedesktop.org/wiki/Software/polkit</a>"
+LICENSE = "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=155db86cdbafa7532b41f390409283eb" "="">file://COPYING;md5=155db86cdbafa7532b41f390409283eb"</a>
+
+SRC_URI = "git://github.com/freedesktop/polkit.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+SRCREV = "da87c5698019897dd731bb2cbb54ebd9c9481f52"
+
+DEPENDS = "expat glib-2.0"
+
+inherit meson pkgconfig useradd systemd gettext gobject-introspection features_check
+
+REQUIRED_DISTRO_FEATURES = "polkit"
+
+PACKAGECONFIG = " \
+	<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'pam', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit', d)} \
+	dbus \
+	mozjs \
+"
+PACKAGECONFIG[dbus] = ",,dbus"
+PACKAGECONFIG[gtk-doc] = "-Dgtk_doc=true,-Dgtk_doc=false,gtk-doc-native"
+PACKAGECONFIG[pam] = "-Dauthfw=pam,-Dauthfw=shadow,libpam,libpam"
+PACKAGECONFIG[systemd] = "-Dsession_tracking=libsystemd-login,-Dsession_tracking=ConsoleKit,systemd"
+PACKAGECONFIG[consolekit] = ",,,consolekit"
+
+# Default to mozjs javascript library
+PACKAGECONFIG[mozjs] = "-Djs_engine=mozjs,,mozjs-102,,,duktape"
+# duktape javascript engine is much smaller and faster but is not compatible with
+# same javascript standards as mozjs. For example array.includes() function is not
+# supported. Test rule compatibility when switching to duktape.
+PACKAGECONFIG[duktape] = "-Djs_engine=duktape,,duktape,,,mozjs"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 --shell /bin/nologin polkitd"
+
+SYSTEMD_SERVICE:${PN} = "${BPN}.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install:append() {
+	#Fix up permissions on polkit rules.d to work with rpm4 constraints
+	chmod 700 ${D}/${datadir}/polkit-1/rules.d
+	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
+
+FILES:${PN} += "${libdir}/polkit-1 ${datadir}"
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-yluureRem+sXpkMxSe2R--


