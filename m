Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F371C433FE
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:52:32 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.30701.1632747150971494614
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 05:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p3B7cD8+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632747149; i=@fujitsu.com;
	bh=MtWJduQRptFBHOD5wLMvb7NiMGBkH7BIaAPcRPW/VgY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=p3B7cD8+Q6Yeuw25dMisj4xyzsB7eFi+m118+r5N+YHPerMDLvNSze17j9zzNO2xP
	 OWQedEKjvWVYlAHS/ksJw864lZGMByjOhiXSaAERz++dx2mmVQ4PCjyIFF71vYkC0R
	 kf+BXsz99xFqVTLKBn+aBLye+uvt4NYjMaFXBvuJkCCYb4HGXaszEJ2LkWFZBXCD5f
	 ytGy2DQvXJmgbKTkr1/yrDZs05EpFytKuCM+OQ+9MuVGZl0g2a1sRhhTKbCdMfLVSh
	 F2p8+zLNeHmVEWxlnQM7qd44IdDJBaYSKZbYCfBHe3jfwF5oR3is1zcQikb0LSf8gY
	 Jlf3ZBAWdtlNQ==
Received: from [100.113.6.157] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id EA/67-23198-C8EB1516;
 Mon, 27 Sep 2021 12:52:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRotuzLzD
  R4OQBLYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePPrhlsBV+5KnaemcHewPiLs4uRi0NIYDaT
  xOTHNxkhnBOMEh9Xb2PuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897CC2sICnxL99V
  8DiLAKqEk9//2XrYuTg4BVwkjj9wwQkLCGgIDHl4XuwEk4BZ4mN918wgdhCQCV/nt5kA7F5BQ
  QlTs58wgIxXkLi4IsXzBC9ihKzLzezQNgVErNmtTFNYOSfhaRlFpKWBYxMqxgtk4oy0zNKchM
  zc3QNDQx0DQ2Ndc10jUwM9BKrdJP0Ukt1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGIEBmVLI
  9mEH45Q3H/QOMUpyMCmJ8oasDUwU4kvKT6nMSCzOiC8qzUktPsQow8GhJME7Yw9QTrAoNT21I
  i0zBxgdMGkJDh4lEV6OvUBp3uKCxNzizHSI1ClGRSlxXgOQhABIIqM0D64NFpGXGGWlhHkZGR
  gYhHgKUotyM0tQ5V8xinMwKgnzZoNM4cnMK4Gb/gpoMRPQ4tpJASCLSxIRUlINTGWH+zaduGJ
  gMsu//4L3Nj/nMMmnqu5VH+dFPjx93WX+I12eWx/9dqz5Hs7wP0FXarFyyel5CZdY+H+lPY5e
  JfpBKZDH48v6dy8kJSZe2R70UJCnUPm3vMyWnKr34Q2r+wrnv8xZfz0oJyJCRn9WkYaico7D7
  9iLpyx1KtdMbjzTntQYqxuSEdDj4JPDXPD2lFtjRfWTno15Djf/qf++/EX963rHXUYXEzdomb
  Jl1woePtOzPfzHzhj+lg/yGSdnbJJvajk7xz+1zVaxcWGO1gEllssfjjgWnVyzMVbr9a0vxTr
  ZZcsv6t99LWHDn9pz/OO7WRJn09ZtNdln7ze5V+IP26S/nXu2br7AfkS7RomlOCPRUIu5qDgR
  AC+IKCJDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-245.messagelabs.com!1632747148!355252!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23492 invoked from network); 27 Sep 2021 12:52:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 12:52:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18RCqI1U007977
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 13:52:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 13:52:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] snort: upgrade 2.9.18 -> 2.9.18.1
Date: Mon, 27 Sep 2021 20:52:06 +0800
Message-ID: <1632747129-70797-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632747129-70797-1-git-send-email-wangmy@fujitsu.com>
References: <1632747129-70797-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 12:52:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93144

snort 2.9.18.1

	* snort/src/dynamic-preprocessors/dcerpc2/dce2_smb.c:
	  Fixed possible memory corruption in SMB preprocessor.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../snort/{snort_2.9.18.bb => snort_2.9.18.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.18.bb => snort_2.9.18.1.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.18.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.18.1.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.18.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.18.1.bb
index 47c201fa13..1e2495406e 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.18.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.18.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
-SRC_URI[sha256sum] = "d0308642f69e0d36f70db9703e5766afce2f44ff05b7d2c9cc8e3ac8323b2c77"
+SRC_URI[sha256sum] = "da8af0f1b2e4f247d970c6a3c0e83fb6dcd5c84faa21aea49f306f269e8e28aa"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


