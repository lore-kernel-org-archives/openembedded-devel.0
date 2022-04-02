Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FCFC49EA2
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.2697.1649137340674298687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lUL/UTMO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137339; i=@fujitsu.com;
	bh=qkw3XBZeuZlJg3yDiFXGewRG8cCKOmmMyxuOquos+O0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lUL/UTMOWi4cfzI4kLiFlV7ryQ+PtufdzzZbirhDLNxGNX7Tq7cSrjkQ4tbRsYM2O
	 I81pcDPVHpRRKwMza3ydyB6tEU3RBPR+Gd9Tpw0WeUjlwAsQH8NuOdaWcJPx5Oc8On
	 VQdADpvtwfcmU5wrnN1uIuRN5SEMOsovh5TmIsNhKKCyUtwOCn1ps76FZ+O6nvjqvu
	 1jBbdB7/qbF2VkMDexrGAEc45GwefVab7qkEcI+TSTwDFVY2EaC84AcMdgA772ADsg
	 nAhhTVAOoaPqkAEuHaFAyuk+n0P1jQy+Ve/eocvyLRGu6Qct/3c/sl1sVI9OtGKO5h
	 HjZeEv9C6H8lw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqLvrmne
  SwZWP0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Zr+2qWgsucFS8eXWdvYPzK0cXIxSEk8IRR
  4si+42wQzgUmiQnvp7NAOLsZJU4cfMvYxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAj8TD/evAaliA4gualrGA2LwCThI7l6wCi0sIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRKqkoMz2jJDcxM0fX0MB
  A19DQVNdA18jEWC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAsU4oZPu9g
  XND3U+8QoyQHk5Io7xlX7yQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwnzwLlBItS01Mr0jJzg
  DECk5bg4FES4T1yESjNW1yQmFucmQ6ROsWoKCXOe/MKUEIAJJFRmgfXBovLS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEea2uAk3hycwrgZv+CmgxE9Did2c8QRaXJCKkpBqYNjGm/4usaGz
  S9XuffnaKWOCC+sLwmax8ExKksz7Urlz0PmhHeV/B3CvH/PTOmxwKevqRtftSgsKWk1/086UV
  dj3uOb9AQdCC5W3Em4Vv37rfamzT0FLUbZ/xZ/O0rLzp0WeUV7/f4zpj4qvVl5ylbK8K8z76t
  XJa3Q6lRTUGZeeXpxlsnnhW9+esN6cMni5cHOK8xUqvQGTas6vsMTYLf/D4Zgo7ycqIH21xeL
  Iw48783yfzszf5KuaJq6w9+XdtsNQ72dZ1ztorZ09cnqJ6ouLRnytaP0tndirobdliOd/n66l
  6aWvT1OMZ3Q+uRtTzr+puiw1a/OyIkLi/55dft1liTN8Uymdyum8M+K57WYmlOCPRUIu5qDgR
  AHQwdJFGAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1649137338!86543!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12158 invoked from network); 5 Apr 2022 05:42:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:42:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D595F1001AF
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C22EA1001A0
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:41:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-trafaret: upgrade 2.1.0 -> 2.1.1
Date: Sat, 2 Apr 2022 20:38:31 +0800
Message-ID: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96412

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-trafaret_2.1.0.bb => python3-trafaret_2.1.1.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-trafaret_2.1.0.bb => python3-trafaret_2.1.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb b/meta-python/recipes-devtools/python/python3-trafaret_2.1.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-trafaret_2.1.1.bb
index 0b3d2427cd..97c56abde4 100644
--- a/meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trafaret_2.1.1.bb
@@ -3,8 +3,7 @@ SUMMARY = "Ultimate transformation library that supports validation, contexts an
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=21ecc7aa8f699874e706fc1354903437"
 
-SRC_URI[sha256sum] = "72c342ede27fb34cd219b62855119380ae1c87006b6106be163c01159eb955ff"
-SRC_URI[md5sum] = "228675376012fb27dd7f70ab685e7766"
+SRC_URI[sha256sum] = "d9d00800318fbd343fdfb3353e947b2ebb5557159c844696c5ac24846f76d41c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


