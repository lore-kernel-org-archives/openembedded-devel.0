Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AC6C433FE
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 02:33:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.3758.1652409231766576674
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 19:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JKqiqWgD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652409229; i=@fujitsu.com;
	bh=ZgovNp0EG9yKnW8r7d4/1+kE6r3IyuI1xxYBfu5wcbA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JKqiqWgDDMdgrXj1HL4czlsIkYkaLMCdMA/0KPdkZBpvwAvTpAszIUZULtVzUf41Z
	 VsTcz9LS/EReG36YQbOkNQvQs57uc8xW/Y1fuEeby4QWmq5zLA86TzBd64D6N+leF7
	 Rz0HwSXf28kFEpNaA0pZvPRdF4P1ExwBxxO8vg08J2aMqmI7QC0gUxSSDEwopdazdw
	 kgsb/fg0uomBGQNwm0neb0b185WGeUSvP7HRc9+E6Do7eGu0pL6RDeuXy4X6MEFqCI
	 RKTPryzxTE6fXyhj02R5XMMqzRTDb6A7kPabNd3CJkRyvhgvnrRwNEoaBNpcmQtOyp
	 lXvA8LoEkx4Hg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSbfncG2
  SweWNOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0brVrmCTu6KDf1HmBoYp3N1MXJxCAk8YZS4
  eX4lC4RzgUliZf9WRgjnJKPEwUurmboYOTnYBNQlHt98zQhiiwjoSyydvYcZxGYWUJXovriGH
  cQWFgiSWHf2MguIzQIUP7LnBlgvr4C7xL2OJWC2hICCxJSH74F6OTg4BTwkjm+3AwkLAZXMXr
  2QFaJcUOLkzCcsEOMlJA6+eMEM0aokcWLFR6gxFRKvD1+CiqtJXD23iXkCo+AsJO2zkLQvYGR
  axWiVVJSZnlGSm5iZo2toYKBraGiqa2ypa2qkl1ilm6iXWqpbnlpcogvklhfrpRYX6xVX5ibn
  pOjlpZZsYgSGcEqxuskOxu6VP/UOMUpyMCmJ8r6Jr00S4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MHbeggoJ1iUmp5akZaZA4wnmLQEB4+SCO+ug0Bp3uKCxNzizHSI1ClGXY6/n/7uZRZiycvPS5
  US5/XYDFQkAFKUUZoHNwIW25cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNOBFnFk5lXArf
  pFdARTEBHxFuBHVGSiJCSamASibwko7ZRxPZtnErezLjXAmf/WK5qOGgUs8pa7cgP1l2ti1a9
  X3dx4hk2w4o3b6ND/uicWp55UJxhQ0STr2b038fuya8SGgLiTESehTCecjvwcNIMKVs3l74rn
  cXrnrz6c3v1l2s3/FMmhPX3uD76uTo2w3dlQ/qSfx9KNR/XKU927I9546UuptdyPcHp5V+Pdb
  P2b6sr4dB//c41TexVYZCISVDUppB9Aoqs/VcClk/ljLL63jlnbXJ9/uSDV66YinTavFaRTSo
  /8nTi/ktpDU/iZYP4bKZkLPKZv7X0hMMTq4ymzfJvDVRiAv8YcX3blHXPjXnj70Mm/oJNz453
  qkjkCgWorzNJfvCmMkOJpTgj0VCLuag4EQBy19EraAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1652409228!314812!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4510 invoked from network); 13 May 2022 02:33:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 May 2022 02:33:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5D53A1000FD
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3B07E100453
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:48 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 13 May 2022 03:33:26 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 11.0.0 ->
 12.1.1
Date: Fri, 13 May 2022 10:33:02 +0800
Message-ID: <1652409184-13282-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 May 2022 02:33:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97090

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
Add load_media_failed callback to MediaStatusListener
Tweak media status
Lookup known cast models in mDNS discovery
Fix default value for fetching model name in discovery

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...n3-pychromecast_11.0.0.bb => python3-pychromecast_12.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_11.0.0.bb => python3-pychromecast_12.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_11.0.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_12.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_11.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_12.1.1.bb
index f55696373..b34c78eb8 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_11.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_12.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "151723b178110052b673b8765a120c85d16eae8c22d75575dceebe2be1eb1ef6"
+SRC_URI[sha256sum] = "9545a22acdadc96603f76d7878c6ea17baf1328260cf560c887c8c12aad4c82c"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


