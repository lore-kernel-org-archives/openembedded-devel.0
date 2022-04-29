Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E01C433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:31:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.29416.1652085075675662442
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OfuoAU0m;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085074; i=@fujitsu.com;
	bh=yqQ6imlx0y1HUc1Jcg/j7V5V6ExeOKPGixldGhdMlLA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OfuoAU0mWN31Nhq8xAbMVUMrC06EmCwFMyrZWvLk+eixW+zkdflSbCwsDI5+RVYKZ
	 ivTkuv1F4KArYMYoBFVEGQz99KVsgKRFcNMB/9Ef+EDWFpuUpOzRlP5Y3gWFHMbx0I
	 6CZrtwJUXN3EmTY7rQE6sbXFVi/dAVfgVIXNzFJKUtsMS05uvKLTPXV11lyZox8wR9
	 1X9txLJeQx0KWtcSGx1RIU0hKBGG6gciYgwteeDO9DuN9op++fOJjsKbbsiviHeNJc
	 vMchqomomz8wlRcA6SZLX4+bI/Ph8kCr3yh0lW6E2f48k4x3EeeYKvBis787wYxNRR
	 IEhsns+1O2Gzg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxRTfwYkW
  SQWerhsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF4Qm3BEq6K24tdGhincXYxcnEICcxikjg2
  +QA7hLObUeL4uWtADicHm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373gNUIC7hLfFt8lqWLk
  YODRUBVYu8UXpAwr4CTxIU5jSwgtoSAgsSUh+/BWjkFnCUWN/eCtQoB1fS3NDFD1AtKnJz5hA
  VivITEwRcvmCF6FSVmX26GmlMhMWtWG9MERv5ZSFpmIWlZwMi0itE6qSgzPaMkNzEzR9fQwED
  X0NBU19hE18jQQi+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzAgU4qVbu1g
  3LDqp94hRkkOJiVR3sqmiiQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwh54BygkWp6akVaZk5w
  OiASUtw8CiJ8N49AZTmLS5IzC3OTIdInWI05ri7cO9eZo4Ph67sZRZiycvPS5US5711HqhUAK
  Q0ozQPbhAsai8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub1vQA0hSczrwRu3yugU5iATvk
  YUApySkkiQkqqgUnx+K2Q0IRa41eFWWteWOSbnix3bLh3Uc8m/lr5qU3JtrM2fJA5sCyqo7w8
  qLpggf2Utf2bix2FQl+7/nzGdvyrHkPY3D/379+2PG81vSdTz/rCB4Vm9Y60bzc92r/t2f4ws
  mmx1sXQO/3srEyT2I4c/ma4/sCCkI9zT+Wd3Lh79zrNzRM05JXyD5dPnztx2vz9q95yG5s8TF
  zen5z99olc8u05O1fsdv/5uD4kuVRrzU6GVd1n7+xwcpRM8t14s/nsZ4u3VlPkNkz2Vk1RUY7
  NOue8dl3Er/K0I3FFp31XCc/p3FTMG7Dtq08mZ8fkkrPHVi25Oqn+f3deasVVyTf7+bZ1vf54
  rzSg6sH3pYbSSizFGYmGWsxFxYkAcm8NJFUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1652085073!422762!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30374 invoked from network); 9 May 2022 08:31:13 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:31:13 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2498VDD5005190
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 9 May 2022 09:31:13 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:31:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pkcs11-helper: upgrade 1.28.0 -> 1.29.0
Date: Fri, 29 Apr 2022 16:13:11 +0800
Message-ID: <1651219993-27514-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
References: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:31:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97004

2020-04-21 - Version 1.29.0

    build: do not fail if slot evnets are disabled, thanks to Fabrice Fontaine.
    core: do not assume standard objects supported by provider.
    openssl: set back key into EVP for openssl-3 to work, thanks to apollo13.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{pkcs11-helper_1.28.0.bb => pkcs11-helper_1.29.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.28.0.bb => pkcs11-helper_1.29.0.bb} (95%)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.0.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb
similarity index 95%
rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.0.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb
index 68ae94bdb..a34a4b914 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.0.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 # v1.27
-SRCREV = "a4b46d545c33459610d4b4ae85a43a76e03a8c5e"
+SRCREV = "2306f896c2f3c147792300155316fd65825aabad"
 
 UPSTREAM_CHECK_GITTAGREGEX = "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


