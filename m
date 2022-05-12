Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92266C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:27:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.2100.1652347648965640717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=LTeVmDco;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-092-072-083-181.092.072.pools.vodafone-ip.de
 [92.72.83.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EB66183B74;
	Thu, 12 May 2022 11:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1652347646;
	bh=skTgmxYsVAP5p71k5sY9IqYlvCvM0XsQIF3IwU4H+uc=;
	h=From:To:Cc:Subject:Date:From;
	b=LTeVmDcoVbreArT7spKIdIFd5U7fv/Os8cuqxCk4/dnN9oHbFvQyCoI34uk8/OOR8
	 TT8ugOVU2X1BL+DMbkcvA5aTCm3iqietjEqWLoBCu6+fSQT0b4Nzl1sG0kt7GyC8Lk
	 QMwszob0OrD9Q72sWQPOY9uaw/yWOXJMhFove0k3LMT3YagQZsFN0HuRLaChg/lus9
	 DRRjnm71wSXZE4R449wPC+CIZZ66ii6THhpfX9BGI2SM2E0CXFlXkYXFJEtck3djP3
	 s/hn6d2wSkDQZWJ7s/vXTLCaTK0C0zQKb5oI/l2T92/r31t2Azs/BIgTI5T3uTMdQ/
	 j30Lu6G9gupfA==
From: Claudius Heine <ch@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Claudius Heine <ch@denx.de>
Subject: [meta-filesystems][PATCH] btrfsmaintenance: add recipe for
 btrfsmaintenance scripts
Date: Thu, 12 May 2022 11:27:21 +0200
Message-Id: <20220512092721.745694-1-ch@denx.de>
X-Mailer: git-send-email 2.33.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:27:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97076

Btrfs requires regular maintenance in order to self-heal. Other
distributions like OpenSUSE, Debian and Fedora use these scripts to
perform those.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 .../btrfsmaintenance/btrfsmaintenance_0.5.bb  | 62 +++++++++++++++++++
 ...change-sysconfig-path-to-etc-default.patch | 47 ++++++++++++++
 ...ective-to-btrfsmaintenance-refresh.s.patch | 33 ++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/btrfsmaintenance/btrfs=
maintenance_0.5.bb
 create mode 100644 meta-filesystems/recipes-utils/btrfsmaintenance/files=
/0001-change-sysconfig-path-to-etc-default.patch
 create mode 100644 meta-filesystems/recipes-utils/btrfsmaintenance/files=
/0002-add-WantedBy-directive-to-btrfsmaintenance-refresh.s.patch

diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmainten=
ance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmainte=
nance_0.5.bb
new file mode 100644
index 000000000..a4573cf59
--- /dev/null
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.=
5.bb
@@ -0,0 +1,62 @@
+
+SUMMARY =3D "Services for periodic btrfs maintenance tasks"
+DESCRIPTION =3D "A set of scripts supplementing the btrfs filesystem and=
 aims \
+    to automate a few maintenance tasks. This means the scrub, balance, =
trim \
+    or defragmentation."
+HOMEPAGE =3D "https://github.com/kdave/btrfsmaintenance"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa=
63a"
+
+SECTION =3D "base"
+
+DEPENDS =3D "btrfs-tools"
+
+SRC_URI =3D "git://github.com/kdave/${BPN};branch=3Dmaster;protocol=3Dht=
tps \
+    file://0001-change-sysconfig-path-to-etc-default.patch \
+    file://0002-add-WantedBy-directive-to-btrfsmaintenance-refresh.s.pat=
ch \
+"
+SRCREV =3D "be42cb6267055d125994abd6927cf3a26deab74c"
+
+UPSTREAM_CHECK_URI =3D "https://github.com/kdave/${BPN}/tags"
+UPSTREAM_CHECK_REGEX =3D "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
+
+RDEPENDS:${PN} =3D "bash"
+
+S=3D"${WORKDIR}/git"
+
+inherit allarch
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -Dm0644 ${S}/btrfsmaintenance-refresh.path \
+        ${D}${systemd_system_unitdir}/btrfsmaintenance-refresh.path
+    install -Dm0644 ${S}/*.timer \
+        ${D}${systemd_system_unitdir}
+    install -Dm0644 ${S}/*.service \
+        ${D}${systemd_system_unitdir}
+
+    install -Dm0644 ${S}/btrfsmaintenance-functions \
+        ${D}${datadir}/${PN}/btrfsmaintenance-functions
+    install -Dm0755 ${S}/*.sh \
+        ${D}${datadir}/${PN}
+
+    install -Dm0644 ${S}/sysconfig.btrfsmaintenance \
+        ${D}${sysconfdir}/default/btrfsmaintenance
+}
+
+inherit systemd
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE:${PN} =3D " \
+    btrfs-scrub.timer \
+    btrfs-scrub.service \
+    btrfs-trim.timer \
+    btrfs-trim.service \
+    btrfs-balance.timer \
+    btrfs-balance.service \
+    btrfs-defrag.timer \
+    btrfs-defrag.service \
+    btrfsmaintenance-refresh.service \
+    btrfsmaintenance-refresh.path \
+"
diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-c=
hange-sysconfig-path-to-etc-default.patch b/meta-filesystems/recipes-util=
s/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
new file mode 100644
index 000000000..d425206f0
--- /dev/null
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-s=
ysconfig-path-to-etc-default.patch
@@ -0,0 +1,47 @@
+From b49dbe17e0d9ae463e5a34e6991aa2d3c70d2fb1 Mon Sep 17 00:00:00 2001
+From: Claudius Heine <ch@denx.de>
+Date: Wed, 11 May 2022 14:33:13 +0200
+Subject: [PATCH] change sysconfig path to /etc/default
+
+OE uses /etc/default for service configuration, not /etc/sysconfig which
+is used by SUSE and RedHat based distributions.
+
+Change the files accordingly
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Claudius Heine <ch@denx.de>
+---
+ btrfsmaintenance-refresh.path    | 4 ++--
+ btrfsmaintenance-refresh.service | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/btrfsmaintenance-refresh.path b/btrfsmaintenance-refresh.pa=
th
+index d56ad11..f0b4132 100644
+--- a/btrfsmaintenance-refresh.path
++++ b/btrfsmaintenance-refresh.path
+@@ -1,8 +1,8 @@
+ [Unit]
+-Description=3DWatch /etc/sysconfig/btrfsmaintenance
++Description=3DWatch /etc/default/btrfsmaintenance
+=20
+ [Path]
+-PathChanged=3D/etc/sysconfig/btrfsmaintenance
++PathChanged=3D/etc/default/btrfsmaintenance
+=20
+ [Install]
+ WantedBy=3Dmulti-user.target
+diff --git a/btrfsmaintenance-refresh.service b/btrfsmaintenance-refresh=
.service
+index 4ed1eb4..d6225a6 100644
+--- a/btrfsmaintenance-refresh.service
++++ b/btrfsmaintenance-refresh.service
+@@ -1,5 +1,5 @@
+ [Unit]
+-Description=3DUpdate cron periods from /etc/sysconfig/btrfsmaintenance
++Description=3DUpdate cron periods from /etc/default/btrfsmaintenance
+=20
+ [Service]
+ ExecStart=3D/usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.s=
h systemd-timer
+--=20
+2.33.3
+
diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0002-a=
dd-WantedBy-directive-to-btrfsmaintenance-refresh.s.patch b/meta-filesyst=
ems/recipes-utils/btrfsmaintenance/files/0002-add-WantedBy-directive-to-b=
trfsmaintenance-refresh.s.patch
new file mode 100644
index 000000000..0da7992a0
--- /dev/null
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0002-add-Want=
edBy-directive-to-btrfsmaintenance-refresh.s.patch
@@ -0,0 +1,33 @@
+From 420ae0f395838b852ae8b8fe5528056c36dc0919 Mon Sep 17 00:00:00 2001
+From: Claudius Heine <ch@denx.de>
+Date: Wed, 11 May 2022 15:14:22 +0200
+Subject: [PATCH] add WantedBy directive to btrfsmaintenance-refresh.serv=
ice
+
+Just trigger the service on the first boot, to configure services to the
+configuration file deployed in the package, afterwards disable the
+service, so that is only triggered when the configuration file has
+changed.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Claudius Heine <ch@denx.de>
+---
+ btrfsmaintenance-refresh.service | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/btrfsmaintenance-refresh.service b/btrfsmaintenance-refresh=
.service
+index d6225a6..58d0e09 100644
+--- a/btrfsmaintenance-refresh.service
++++ b/btrfsmaintenance-refresh.service
+@@ -3,4 +3,8 @@ Description=3DUpdate cron periods from /etc/default/btrf=
smaintenance
+=20
+ [Service]
+ ExecStart=3D/usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.s=
h systemd-timer
++ExecStart=3Dsystemctl disable btrfsmaintenance-refresh.service
+ Type=3Doneshot
++
++[Install]
++WantedBy=3Dmulti-user.target
+--=20
+2.33.3
+
--=20
2.33.3


