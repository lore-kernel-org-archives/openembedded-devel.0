Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C841D3000D
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 13:52:29 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.22703.1729259542839272939
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 06:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout07.t-online.de (Postfix) with SMTP id 1D5DF2B20A
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 15:51:46 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.25]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t1nOL-1g4Sbx0; Fri, 18 Oct 2024 15:51:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] snapper: add recipe
Date: Fri, 18 Oct 2024 15:53:46 +0200
Message-ID: <20241018135346.21402-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1729259505-C3FFD5D9-EB09213D/0/0 CLEAN NORMAL
X-TOI-MSGID: 6b7bfb9d-e39d-4bc1-9253-7848990a9f38
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 13:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112981

Snapper is a tool for Linux file system snapshot management. Apart from
the obvious creation and deletion of snapshots it can compare snapshots
and revert differences between them. In simple terms, this allows root
and non-root users to view older versions of files and revert changes.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/snapper/snapper_0.11.2.bb | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb

diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.11.2.bb
new file mode 100644
index 000000000..5bc0d36f8
--- /dev/null
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -0,0 +1,37 @@
+SUMMARY =3D "Snapper is a tool for Linux file system snapshot management=
"
+HOMEPAGE =3D "https://github.com/openSUSE/snapper"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "acl boost btrfs-tools dbus json-c libxml2 lvm2 zlib"
+
+# Build separation is slightly broken
+inherit autotools-brokensep pkgconfig gettext
+
+SRC_URI =3D "git://github.com/openSUSE/snapper.git;protocol=3Dhttps;bran=
ch=3Dmaster"
+SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
+
+S =3D "${WORKDIR}/git"
+
+EXTRA_OECONF +=3D "--disable-zypp"
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'api-documenta=
tion systemd pam', d)}"
+PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
+PACKAGECONFIG[api-documentation] =3D "--enable-doc,--disable-doc,libxslt=
-native docbook-xsl-stylesheets-native"
+
+# Avoid HOSTTOOLS path in binaries
+export DIFFBIN=3D"${bindir}/diff"
+export RMBIN =3D "${bindir}/rm"
+export TOUCHBIN =3D "${bindir}/touch"
+export CPBIN =3D "${bindir}/cp"
+
+
+do_install:append() {
+	install -d ${D}${sysconfdir}/sysconfig
+	install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconfig/sna=
pper
+}
+
+FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/secu=
rity ${datadir}"
+# bash is needed for the testsuite
+RDEPENDS:${PN} =3D "bash diffutils util-linux"
--=20
2.47.0


