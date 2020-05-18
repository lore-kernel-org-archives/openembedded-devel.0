Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.38178.1589791596048844128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 01:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=cmGbtpfc;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.localdomain (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id 521FB20226BE;
	Mon, 18 May 2020 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1589791593; bh=vVyPkwWHxLmXnqy4oJkzZ7b4hgcLfcPHpx2jij/Svc0=;
	h=From:To:Cc:Subject:Date;
	b=cmGbtpfcQOal4eJ1O9lDh4DG1PBqUO/zKRaNdGEa4uRAyPZg8TKTOaSOcP1RuTy3M
	 jhpV788l0B8PpKixJv8xlhngmilkl2Vqh8wnFZiIvpALVLQv4mH2OG91QaQnHNpHfp
	 wLZzid71uuvKPz/gdbv0+GmWkygmrAciJDf7qfTtX3S47hf/1VQARgQN4weCgxEaCj
	 0fJO/GOBzGwDfOs2rdNXYipyvNlWFASQqyiN+4P1KskzFYj7gzzo7SYZ+U74/ebD/t
	 OJzYtag9UgjyfVFFLnrp5jkNZyc4Zqb8Kevkt0lC3OEe0WeAEktFMR0fA3j//LXi+e
	 nklrmAw1b2E8A==
From: "Sean Nyekjaer" <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [oe] [meta-oe] [PATCH] gpsd: mark CLEANBROKEN
Date: Mon, 18 May 2020 10:46:27 +0200
Message-Id: <20200518084627.2525286-1-sean@geanix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on fdf6823a942a
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.20.bb
index 5463c8231..390e6a8c3 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
@@ -23,6 +23,8 @@ SYSTEMD_OESCONS =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'systemd', 'true', 'f
 export STAGING_INCDIR
 export STAGING_LIBDIR
=20
+CLEANBROKEN =3D "1"
+
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez', '', d)} usb"
 PACKAGECONFIG[bluez] =3D "bluez=3D'true',bluez=3D'false',bluez5"
 PACKAGECONFIG[qt] =3D "qt=3D'yes' qt_versioned=3D5,qt=3D'no',qtbase"
--=20
2.26.2

