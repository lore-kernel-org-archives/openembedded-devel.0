Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CCDC00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 04:16:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.1135.1659586593270295720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 21:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WMeZTxbU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659586591; i=@fujitsu.com;
	bh=qTyFsGoS93+umXk0bXnTAwK4oJJpH8R6m7E2DP1xKT4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WMeZTxbU5Yfkgt9owVMYeciu1dUQe6Cxk3qbbMjMydGnWSJvp+a+Ynf9PeJP64EuK
	 lv4iA7i3MKbxOiVrqi72FSOiXAyBOferx7Ux8xu4obYYv8smh9+HDDP2KfBtSX0zMK
	 TpvG2Kn7U8bdQsEDefYKR0h+XhPr5YmEcFl0RynMziRphgea9WYsDmInku+p/Ek3f7
	 G4bUOumeQ2nEyh+q/jSSppq9REzl3c0NQLjQRRh82nOTffVBFAmCKOxITdIiBUlkKr
	 IpSYm6NMQwmw9fAR0juQbSlSoXQr/l/sACp/FyJ+lN0DWq5Yh3p2W2gpIU8q3dRMqQ
	 cCJOzmPlxWYTg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWVfO43W
  SQcs+cYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP6ombWgsOcFZ+3vGJpYHzE0cXIxSEk8JBR
  Ysua9cwQzmUmidfXPkI5+xklmjaeZOpi5ORgE9CVePFjMQuILSKgL7F09h6gIg4OYQFfiX2zX
  EFMFgFViY1tFSAVvAIeEtPOzWIEsSUEFCSmPHzPDBEXlDg58wnYFGYBCYmDL16ATZEQUJSYPV
  0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjLZJRZnpGSW5iZk5uoYGBrqGhqZA2kj
  X0NRYL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzD8UorTZu5g3LLvl94h
  RkkOJiVRXlm310lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhvmQLlBItS01Mr0jJzgLEAk5bg4
  FES4RUFaeUtLkjMLc5Mh0idYjTmuLtw715mjplf2w4wC7Hk5eelSonzbgApFQApzSjNgxsEi9
  FLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5n7kCTeHJzCuB2/cK6BQmoFN0uF6AnFKSiJC
  SamCaomyo6p9+ylF2I2vexDbjXG6XeVsYFZebPCtaaO365Wkiz53pndeNCqpOtd8+bb/+ru3u
  7RkPN/c8WjuvKU32yN7zZeoaRocEpAQ+K7WU+DZzZCRM+300gHMPv4HBrdUm985KGQaaTA4wZ
  O9SWbzf/eyc+Yyp50It39aZaWyduX0nX8E5W4b5Myc5S2/++sGua8kW1iOHTlysdl52nW/Ggi
  k6IuUd33Iqrlw8mHVoZ4yhX6ueumKe6f+3+3q2Ft60D3BokXhl8dh+b7NDmExgeHy2omJy0Y2
  Viw6UxE4WSC8ou5ZxyTmyvvaXRf7PHUK6QlJ/1LNeGa3Nv9Z0J3LThwxLD4ZifsGFnScvfVRi
  Kc5INNRiLipOBACXJ83nTAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1659586590!204230!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4216 invoked from network); 4 Aug 2022 04:16:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 04:16:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C9FFF152
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:16:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BD86E75
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:16:29 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 05:16:28 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-haversine: upgrade 2.5.1 -> 2.6.0
Date: Sat, 30 Jul 2022 06:02:57 +0800
Message-ID: <1659132177-15922-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 04:16:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98120

Check or normalize given lat/lon. #49

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-haversine_2.5.1.bb => python3-haversine_2.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.5.1.bb => python3-haversine_2.6.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb b/meta-python/recipes-devtools/python/python3-haversine_2.6.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.6.0.bb
index 1ed67d3260..65779187a1 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.6.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[sha256sum] = "357e41dfddc4a0f2b1c941d92a590cac840f7ce4b3da14b45b68d968b3ad7cc7"
+SRC_URI[sha256sum] = "eb7c308ba721e86662c1d50427cb9b06f9e7eb9984803d9ec200582425cc4fb7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


