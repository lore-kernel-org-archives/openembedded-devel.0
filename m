Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1205FC61DD6
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:53:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13161.1788526428626058629
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NesfUvIF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58157143D
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 05:53:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF3A73F673
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788526428; bh=MJhVCRiPYw28IH3myPBuJY6hJQWXWLQ+OhOKNuK+s4o=;
	h=From:To:Subject:Date:From;
	b=NesfUvIFbgpJY1hymBP8POZsX+4jsP8Irm4f/jJNd+MNxz5VHef9JC/7hVZJRAV1s
	 ErzMTj8cObaTLRQDrZXHKsGrES2U7n9yv4LMarQ5P0prLCbc6jnG/3I1dPiiD7yyKJ
	 86z3qn7N7HmXBuDchtEfm9OP/GvJ2mztSXkVokEs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] python3-paho-mqtt: remove redundant assignments
Date: Fri,  4 Sep 2026 13:53:41 +0100
Message-ID: <20260904125343.693490-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 12:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129765

Both S and UPSTREAM_CHECK_PYPI_PACKAGE are set to the default values, so
remove them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-paho-mqtt_2.1.0.bb        | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.=
bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index d01145c043..ae89f2ae2b 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -10,10 +10,6 @@ PYPI_PACKAGE =3D "paho_mqtt"
=20
 SRC_URI[sha256sum] =3D "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4=
f7c3968fc1723834"
=20
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "paho_mqtt"
-
-S =3D "${UNPACKDIR}/paho_mqtt-${PV}"
-
 DEPENDS +=3D "python3-pytest-runner-native"
=20
 do_install:append() {
--=20
2.43.0


