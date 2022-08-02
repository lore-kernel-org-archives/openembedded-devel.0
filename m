Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78127C19F28
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:40:02 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.6224.1659447589260771480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MiUP5k66;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447587; i=@fujitsu.com;
	bh=hNH6360MbE7JJhWbDGCqjpSvs3Tc2DCP5nXY0VxSaqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MiUP5k66GHP0dnQnWDFzwbmIslqQLGlP85anNpUHrnoAolwUE7hfekdTRYjmPG/Dn
	 2AuZ85eZz2JJc0cT/YS+xrAvKTWStKH12UdGv3xOZssPiYGPGtRQgtE3oLRsNWfmBv
	 PnJQ09Jw49QyVdDe7zOhwuVjtnny2h+ZQKvFQUQfCp97SCEEO0lYf0oImiwkZQuTLt
	 juI3Pc9Hjmk5XE2lR0mMtbbXmohZLSQLngY8VgVWWrjqGXxjMZd8CHIhUrLMN1enhe
	 lcx73noD4vQqNj41BMvZW/rZva+HrivRQP+9nNY+rsCnkG9d5A0v4FVwlmeW8vV3Y7
	 qEFyV2r7IaemQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8MxSVdZ82W
  SQdsXbouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPf0U9sBSs4Kj7damJpYDzN3sXIxSEk8IRR
  YtfRdjYI5zqTxLrny4EynEDObkaJR/vkQWw2ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O4Bq
  xcWcJdY+mUTC4jNAhSfeeEXWA2vgJPEk3WPwHolBBQkpjx8DxbnFHCWuNV+gg1il5PE/W1f2C
  HqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hcwMq1
  itEoqykzPKMlNzMzRNTQw0DU0NNU11TUyNtZLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM4pRi1pc7GKf3/dQ7xCjJwaQkyiun+DJJiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvLVWgnGBRanpqRVpmDjCiYNISHDxKIrzv1IDSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/N
  p2gFmIJS8/L1VKnPcWSIMASENGaR7cOFjUX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHs
  PZApPZl4J3NZXQAcxAR2kw/UC5KCSRISUVAOT0buMkrLHU9QOPj/uekmZbW/tDr2M+38K/i/e
  xN6ftKdbbU19kr6kVZxqT+ali3XztkhosrstSNx0osBhwpFHkqJBC2IVNwZPyld4GfE56ukk5
  dSMFwFK5/Y3tN/VznDV0e+0OZJi5P+31v1SLQuTVbE217fip8qfZP3nGoUUqxg9CfNL25AR+3
  +GUtHR2NdNh7hYk87oXrp1ZnLDzo+tSU+6z95dmWaxQ1OMZaKPC2PELN1Hs6b8sNT8ahrEXO6
  xtX/HuyRPhwOPWxpmPbx187hIypuNRnzBHRf2vd/V/OTh/aObv3XdXaTQbSZVU/HSbWb/RJXD
  nA6brGvZyv+J5yott37qt4vH2nT51VAlluKMREMt5qLiRABF1PZWdQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1659447587!580649!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7895 invoked from network); 2 Aug 2022 13:39:47 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:39:47 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CE4CE1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C1F6B100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:39:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] debootstrap: upgrade 1.0.126 -> 1.0.127
Date: Tue, 2 Aug 2022 21:39:28 +0800
Message-ID: <1659447571-24348-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
References: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:40:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98084

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debootstrap_1.0.126.bb => debootstrap_1.0.127.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.126.bb => debootstrap_1.0.127.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.126.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.127.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.126.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.127.bb
index 38b015c401..5e0a488429 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.126.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.127.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "bc48e1c500c33bed50bd00d201f338d3c92d6c0dcb1f202c3bc00ef01f96c618"
+SRC_URI[sha256sum] = "45887cf0582e6d16598e50713278d16b2272d02bdd117a9876e98277300dabd4"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.25.1


