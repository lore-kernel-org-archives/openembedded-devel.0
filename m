Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B9CC48BDF
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.161])
 by mx.groups.io with SMTP id smtpd.web11.7200.1650625666549222738
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 04:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=gg56VniJ;
 spf=pass (domain: extraklein.de, ip: 188.68.63.161,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4KlBTC3rNfz3pqV
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 13:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1650625663;
	bh=rasvXyGMJ/U8kaNp21xO8onXfykdziipcqApj5Rt4Ds=;
	h=From:To:Cc:Subject:Date:From;
	b=gg56VniJ4+x9RAlUHRvje+LqASQGvdMrveVhRvfPsxewcOJa52CWw3qZlw6uZuUlL
	 V9kE1I+bgaaP8HSmlpdBjQ1+psVlKyug8XaQ1SviRBVUEmGHhNWipgp86qkt3mb4xf
	 z6+u3pcL1BT30ffIxraJgouUFuhObCQAF/1eENrZ4F7QOzgP5pvupkXD8egs9QQgrc
	 E1fEtnRzhrsbFDWbVYZ42G6pn+H61PUy2ttYjRRRwe3zgp0wDWg6/KOw8+dbefCDZW
	 Z/TQ/ycId49QeRIVLyD6Wtud1o/Utqga/qDKdqhITSFlTYx18kjQRRbI5KscoYqyKB
	 mtNmGqR6y2HJA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4KlBTC3S7Sz3pqT
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 13:07:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4KlBTB1pr7z8svP
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 13:07:42 +0200 (CEST)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 45114140050;
	Fri, 22 Apr 2022 13:07:41 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH] gpsd: bugfix: add gps-utils-python to PACKAGES
Date: Fri, 22 Apr 2022 13:06:58 +0200
Message-Id: <20220422110658.5639-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <165062566157.11641.3660236674337337926@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: 1sO+jLGXaxZMu25cwwg92TjbsEYQL++IOAY+51p9neINIptKfJ4=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96734

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.23.1.bb
index 8d270ec58..98f7511b1 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -79,7 +79,7 @@ do_install:append() {
     fi
 }
=20
-PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-=
utils"
+PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-=
utils gps-utils-python"
=20
 RPROVIDES:${PN}-dbg +=3D "python-pygps-dbg"
=20
--=20
2.30.2


