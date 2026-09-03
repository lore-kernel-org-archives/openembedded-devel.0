Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CFEC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 17:08:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12895.1788455280789567176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 10:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=OC939AMj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 996531650
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:07:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 095193FAA1
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788455280; bh=GvwtN54JptTqlLOygGNAhy2jAldkGyLVSo9VuioQIZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OC939AMjTMRKX4n5QWVJJispGtXXQduro8J/+yAKfKAv6hBDT1uWGIzyOJspLRaQl
	 tbf/rGPzEMjbZ+LJQCkp0r7qtowixPMoMYpULrorM1F6A+sE77rVCNRJb5ARLmwDVl
	 4yVBKz1yudURw/PcNBlexlUNCnYZIbxoY9uNfpts=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] python3-paho-mqtt: idiomatically set SRC_URI
Date: Thu,  3 Sep 2026 18:07:54 +0100
Message-ID: <20260903170754.352677-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903170754.352677-1-ross.burton@arm.com>
References: <20260903170754.352677-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 17:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129747

Don't set PYPI_SRC_URI explicitly, instead of PYPI_PACKAGE so the correct
SRC_URI is generated.

Also remove the unused variable SRCNAME.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-paho-mqtt_2.1.0.bb       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.=
bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index fc8145303f..d01145c043 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -3,13 +3,12 @@ LICENSE =3D "EPL-1.0 OR LicenseRef-EDL-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8e5f264c6988aec56808a3a11=
e77b913 \
                     file://edl-v10;md5=3Dc09f121939f063aeb5235972be8c722=
c \
 "
-SRCNAME =3D "paho-mqtt"
=20
 inherit pypi python_hatchling
=20
-SRC_URI[sha256sum] =3D "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4=
f7c3968fc1723834"
+PYPI_PACKAGE =3D "paho_mqtt"
=20
-PYPI_SRC_URI =3D "https://files.pythonhosted.org/packages/39/15/0a6214e7=
6d4d32e7f663b109cf71fb22561c2be0f701d67f93950cd40542/paho_mqtt-${PV}.tar.=
gz"
+SRC_URI[sha256sum] =3D "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4=
f7c3968fc1723834"
=20
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "paho_mqtt"
=20
--=20
2.43.0


