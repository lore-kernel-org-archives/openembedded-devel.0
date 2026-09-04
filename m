Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B9EC79F89
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 15:53:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1512.1788537181678156734
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 08:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=HJYBXtmq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78F2C152B
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C11363F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788537181; bh=o5GldJoKDqIMVTpCydZKPN+uNBvxzBZYLe7CMwvhp/4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HJYBXtmqB7Z5gf+HI98/lphG7ZSXydyCEy87TAuPvNxBj8ZE34UUog+MJ29TPEZDl
	 j+e0zwJN9IygA1ZmORCqd+o1KA8uX1ypIORGAm7GTAIJR1gabSw1OBbgC/7Wqm5QD/
	 bRQFaG2FJz/NN6Z4wllCNjqZrzEJNwqbX5rz9yHg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] python3-paho-mqtt: remove obsolete DEPENDS
Date: Fri,  4 Sep 2026 16:52:51 +0100
Message-ID: <20260904155251.1373817-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904155251.1373817-1-ross.burton@arm.com>
References: <20260904155251.1373817-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 15:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129772

These dependencies are no longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.=
bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index ae89f2ae2b..aa6ffb8526 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -10,8 +10,6 @@ PYPI_PACKAGE =3D "paho_mqtt"
=20
 SRC_URI[sha256sum] =3D "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4=
f7c3968fc1723834"
=20
-DEPENDS +=3D "python3-pytest-runner-native"
-
 do_install:append() {
         install -d -m0755 ${D}${datadir}/${BPN}/examples
         cp --preserve=3Dmode,timestamps -R ${S}/examples/* ${D}${datadir=
}/${BPN}/examples
--=20
2.43.0


