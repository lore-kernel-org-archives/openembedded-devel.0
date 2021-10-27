Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA375C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 12:42:13 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.102])
 by mx.groups.io with SMTP id smtpd.web09.11052.1635338529369819641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 05:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=Pe8qt9So;
 spf=pass (domain: extraklein.de, ip: 188.68.61.102,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4HfSxp4Qyxz7y1F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1635338526;
	bh=pP5ZXFwTHLX4O0YJnQMU4qFs/I5uq409wlT5z1n1BVs=;
	h=From:To:Cc:Subject:Date:From;
	b=Pe8qt9So/FL+juaA1AT82SRXYMMGpeAKnPOZE77efYKXl4OHbXVwhFU1jeP9M7m8V
	 zTR1QSx/mrORyNb8lSWL8WReib7WAYCARUMv9SQTnpa2YxDynEhQA3W926MQ9EkWEP
	 3BagS6x1oe4xMMMxOq2OgmMyKxcdqjsOLA1bvA2+mQVVE2AdYMvgMNHEWl5cVJkzdx
	 eH4rAwZwcfrQ9Crct9fl96Z7XtkRCxHoIffQnlFbzRLs/PQA0ZwzbnIkIGqUmWkuES
	 zIusxuZcvHfFRgTQI7r5iOmZvyzGimo270zjMHILbvnlZ8HEvDgk50y8W9uU6Ir5C+
	 8mu2bm21vWVlA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4HfSxp43V1z7y0x
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:42:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4HfSxn23Nqz8shN
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:42:05 +0200 (CEST)
Received: from localhost (ip-88-152-245-240.hsi03.unitymediagroup.de
 [88.152.245.240])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 42D51140050;
	Wed, 27 Oct 2021 14:42:04 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.245.240)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] gpsd: Install also the generated parts of the Python
 library
Date: Wed, 27 Oct 2021 14:41:46 +0200
Message-Id: <20211027124146.1468-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <163533852454.20540.18279663592060221760@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: POPEtwDO4Vq/p92kZuXrY/bC+veLTyWS8TPo5ICHojDD/94nzUo=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 12:42:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93629

The Python library cannot be copied from the source code directory,
otherwise generated files like gps.py and packet.py are missing.

This is noticed when starting ubxtool which otherwise crashes:

Traceback (most recent call last):
  File "/usr/bin/ubxtool", line 48, in <module>
    import gps.ubx
  File "/usr/lib/python3.10/site-packages/gps/ubx.py", line 244, in <modu=
le>
    class ubx(object):
  File "/usr/lib/python3.10/site-packages/gps/ubx.py", line 255, in ubx
    verbosity =3D gps.VERB_NONE
AttributeError: module 'gps' has no attribute 'VERB_NONE'

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.23.1.bb
index 4740e0c98..8763c68ed 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -72,7 +72,7 @@ do_install:append() {
=20
     # Support for python
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps
-    install -m 755 ${S}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
+    install -m 755 ${D}${libdir}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}=
/gps
 }
=20
 PACKAGES =3D+ "libgps libgpsd python3-pygps gpsd-udev gpsd-conf gpsd-gps=
ctl gps-utils"
--=20
2.30.2


