Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FC5D3C927
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 03:52:47 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.19009.1729396359890535560
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Oct 2024 20:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id 307BE6F8AD
	for <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 05:52:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.81]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t2Mzc-18UqNl0; Sun, 20 Oct 2024 05:52:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] snapper: add recipe
Date: Sun, 20 Oct 2024 05:54:34 +0200
Message-ID: <20241020035434.1348891-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1729396356-DE7FB8C0-A6A9B554/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a5e6918-ac34-4a20-8857-8efd8f7d7340
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 03:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113065

Snapper is a tool for Linux file system snapshot management. Apart from
the obvious creation and deletion of snapshots it can compare snapshots
and revert differences between them. In simple terms, this allows root
and non-root users to view older versions of files and revert changes.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../snapper/snapper/statvfs64.patch           | 21 ++++++++++
 .../recipes-support/snapper/snapper_0.11.2.bb | 40 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/snapper/snapper/statvfs64.pat=
ch
 create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb

diff --git a/meta-oe/recipes-support/snapper/snapper/statvfs64.patch b/me=
ta-oe/recipes-support/snapper/snapper/statvfs64.patch
new file mode 100644
index 000000000..dfccb8630
--- /dev/null
+++ b/meta-oe/recipes-support/snapper/snapper/statvfs64.patch
@@ -0,0 +1,21 @@
+Taken from Alpine Linux: [https://gitlab.alpinelinux.org/alpine/aports/-=
/blob/master/testing/snapper/statvfs64.patch]
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+--- a/snapper/FileUtils.cc
++++ b/snapper/FileUtils.cc
+@@ -387,9 +387,9 @@
+     std::pair<unsigned long long, unsigned long long>
+     SDir::statvfs() const
+     {
+-	struct statvfs64 fsbuf;
+-	if (fstatvfs64(dirfd, &fsbuf) !=3D 0)
+-	    SN_THROW(IOErrorException(sformat("statvfs64 failed path:%s errno:=
%d (%s)", base_path.c_str(),
++	struct statvfs fsbuf;
++	if (fstatvfs(dirfd, &fsbuf) !=3D 0)
++	    SN_THROW(IOErrorException(sformat("statvfs failed path:%s errno:%d=
 (%s)", base_path.c_str(),
+ 					      errno, stringerror(errno).c_str())));
+=20
+ 	// f_bavail is used (not f_bfree) since df seems to do the
diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.11.2.bb
new file mode 100644
index 000000000..33214e2e4
--- /dev/null
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D "Snapper is a tool for Linux file system snapshot management=
"
+HOMEPAGE =3D "https://github.com/openSUSE/snapper"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 nc=
urses zlib"
+
+# Build separation is slightly broken
+inherit autotools-brokensep pkgconfig gettext
+
+SRC_URI =3D " \
+	git://github.com/openSUSE/snapper.git;protocol=3Dhttps;branch=3Dmaster =
\
+	file://statvfs64.patch \
+"
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
+export DIFFBIN =3D "${bindir}/diff"
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
+RDEPENDS:${PN} =3D "bash diffutils util-linux util-linux-mount"
--=20
2.47.0


