Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E621EC7EE26
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:05:45 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.66058.1684069544336520290
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A2sm0Ct8;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069542; i=@fujitsu.com;
	bh=0q8WesQA+1WiPfLL2EOxuHjIPI4OhNbRVx7X5YHb++o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=A2sm0Ct8cDDIM7rek7WcvNwFxXtxT8zsywBR45Ya3W5s5STq0I1KFYSj2brx49BKu
	 RyCBJMd/P1LhdxjAJTsIY2notO+1sYOHvEHDUVx8Ay9+Tpv59Whei08t/IklShiLEy
	 5eKFf/K7QFld6t6y4HqIgUGrP+QTb7T1PCoxzkHPjk1iW78G0H/03AG3G43nfr33yC
	 D/Wst5Q45HcrzZPs9b9f2tPU1xc/tltq9kt/e904wO9VMNEtvJbJrFuDr1cF0X7rai
	 fUbMeoHa/KtHo4Ng+wRLQmxWe4+KwUUNgV3jZIRF4AhENZc3ckR5+ObRKTDeoEMRlQ
	 SaDclQi7hhY2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRWlGSWpSXmKPExsViZ8ORpLvsTkK
  KwZteTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPXRdmCrVwVy7pnMjUwHufsYuTiEBLYyCjx
  79NTZghnKpPE2/7pTF2MnBxsAhIS0/eeZAexRQR0JT5+mMsIYjMLqEjMmHwErEZYIFDi4p1rY
  HEWAVWJ3h3vWLoYOTh4BZwktv6VAglLCChITHn4nhnE5hRwlvhx6wVYqxBQydN7k1khatQkrp
  7bxDyBkWcBI8MqRtPi1KKy1CJdc72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK
  94src5JwUvbzUkk2MwHBIKVbq2cH4b+dfvUOMkhxMSqK810riUoT4kvJTKjMSizPii0pzUosP
  McpwcChJ8OrcTEgREixKTU+tSMvMAYYmTFqCg0dJhDfuKlCat7ggMbc4Mx0idYpRUUqc9wBIn
  wBIIqM0D64NFg+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz8twAmsKTmVcCN/0V0GImoM
  W39sSDLC5JREhJNTAVLPzz2MBnZ13i54sZU8MDuddFtceIs08rYX/Emxj9eePtlKmpUT+Djb5
  9X3P3dp2vwq6891qMSvYLLrxv6PbV+/HlQ4Ze3zxFK9scK2Zj31PWPo3L15YuuMexd0pLqdr0
  dIk3NaUT7C7kVH9avmnlUm4mubJ/ynvvmAdNltQX4p+4+PWP0PozXxTc5Sqbb55OkGGYnH005
  F9My5kbT84pLGoK3PDd3bDFnXXLvyUeXTbF9o9ztk06HRhbfi7623rT2CO6x1Kbzne9/3M+vm
  +VseqqpnlP/mj4LL/zWJ13XvrV3T+lwza8OsG8gInd6TyL1b15RbvmrBTucjxZeJKtpntZ4U3
  W+21qH/dzMF1VYinOSDTUYi4qTgQA582mbAIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1684069542!469834!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1722 invoked from network); 14 May 2023 13:05:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:05:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D9E1A1AC;
	Sun, 14 May 2023 14:05:41 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0C4847B;
	Sun, 14 May 2023 14:05:40 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.17.3 -> 2.18.0
Date: Sun, 14 May 2023 21:05:19 +0800
Message-Id: <1684069520-12282-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
References: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102574

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Add smbios check to detect GCE residency (#1276) (22d241b)
Universe domain support for service account (#1286) (821c1b6)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.17.3.bb => python3-google-auth_2.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.17.3.bb => python3-google-auth_2.18.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.18.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.18.0.bb
index a767710eab..5b4f13a9f4 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.18.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ce311e2bc58b130fddf316df57c9b3943c2a7b4f6ec31de9663a9333e4064efc"
+SRC_URI[sha256sum] = "c66b488a8b005b23ccb97b1198b6cece516c91869091ac5b7c267422db2733c7"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


