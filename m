Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8EDC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:18:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.273.1668309484378264351
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f91rDCHf;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309482; i=@fujitsu.com;
	bh=9zIkqYBDrc0NGSiAGzBKq4Uomb8XPnzKimWbKRp1f9I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=f91rDCHfVXkFSEu33/GXv2Nm92vtbqbJis0kWR0Qm6jr6oodu8WkbBoL5K89jOuE5
	 y006u+aYvws4Aeeyy9Ey3wyTUAKm5abfQfjV9U+ZVp6tvvJMvnqw7orw7exK948mJr
	 0l4s4XkPQsbSpUqtiW0vF4TtvHj92b02Eh0CBXrU8C9LCBJXEgclv7PfDf33C4lqOX
	 rPyA+VoRcqapml6MPU4o5sOa/wVRgj6ySdCRf6ogi1jbnfl8fYeQxUEiPAqcQyOST2
	 hDjJ7N0W17SIKrf4lraj3h0A1HHkFTWkG4J/8Gu9egAXKppYwaUuMwYB/3WUTBLV7v
	 4PHGwe0MWH0nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqPsysSD
  Z4EefmMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnG4dSVjwVTuipl33zI3MPZydTFycQgJPGGU
  OPenl7WLkRPIuc4ksXmLG0RiD6PEx42TmUASbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwsESvy5ug6shkVAVeLFip9gcV4BJ4mDbw6CxSUEFCSmPHwP1ssp4Czx5sgUqMVOEv0v/j
  FD1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNbTQSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3pRilgc7GHcs+6N3iFGSg0lJlDften6yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne3
  5EFyUKCRanpqRVpmTnASIJJS3DwKInwVtgBpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc
  47OwGoSACkKKM0D24ELKovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmXRsNNIUnM68EbtM
  roCOYgI74HpkHckRJIkJKqoGJVcnxXkIS02yjhVxvk1S0Toosjtxzre62+yq9piK1JZ8UMxmr
  1l2sWfuU133azo/POAR6MkUvtV28Xng/V01c7/aLur5FkxQ/WZXduv3qQKplRhjv/pdv+rT8N
  01Nb1z/lsEgQ8nkqNnTRXVHln+RWdK1OFzml996n8cFQrt4Ra6n1rQoPu7/sbVRZv/tCxLP9z
  Nx6F1hsP0upGaQJ/l/7iMV0bwUo3PeaYfY+2bGPFiTJjzj5yvfi6IbZbY55c9S9z3w44vNDd5
  PRXZ+NxnX3zU/UPJCI3OpnKpDoeSdj6+jjrF5puXsFuT8rPPyuYyriOGZ6Wf33V93J3dy4J/N
  Vovy31x5NenK5TOl2WY9SizFGYmGWsxFxYkAMlztu2UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1668309481!782095!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27528 invoked from network); 13 Nov 2022 03:18:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:18:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 02F1A100198
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:18:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EB070100194
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:18:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:17:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.14.0 -> 2.14.1
Date: Sun, 13 Nov 2022 11:17:27 +0800
Message-ID: <1668309448-15438-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309448-15438-1-git-send-email-wangmy@fujitsu.com>
References: <1668309448-15438-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99575

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
----------
    Apply quota project for compute cred in adc (#1177) (b9aa92a)
    Update minimum required version of cryptography in pyopenssl extra (#1176) (e9e76d1)
    Validate url domain for aws metadata urls (#1174) (f9d7d77)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.14.0.bb => python3-google-auth_2.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.14.0.bb => python3-google-auth_2.14.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.14.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.14.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.14.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.14.1.bb
index a32a78e69..68651bb92 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.14.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cf24817855d874ede2efd071aa22125445f555de1685b739a9782fcf408c2a3d"
+SRC_URI[sha256sum] = "ccaa901f31ad5cbb562615eb8b664b3dd0bf5404a67618e642307f00613eda4d"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


