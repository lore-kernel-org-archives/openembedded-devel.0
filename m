Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9341C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 02:42:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.6991.1638931331778071461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 18:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MNGI1e6Y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638931329; i=@fujitsu.com;
	bh=D0zRGYoxQP/SaYjwlqizgcE/4bTEMJeiAdgD66gaZEg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MNGI1e6Y+XB9MqyQ8YZZsXp4M7i2jxDj/InFGrO1TXdt9b8zYyuiGE2p6evomsAVx
	 DJqScapkVGhWy+oi41q6VCHzyQEraBUMXiwqSKSEgGiLlIdf3MZjETsDUEy9943m6Y
	 IhaMoCuBiPdD9zNm4EYqXTSYA2djyhE4iRTj4yWRi55g8mc7wKpEv3UjL4jOiRti6L
	 sWBHvKW1Lg4zzlWSv2Fi3RZnYM9Ikbp7+4icOvShAsOdu/KikdGesm4lwxsES8XHNY
	 6J0bpHX/J+Lpnhi9eLf0LFOSvCIzIOjmWTQpAuiMFzeNziTDUYUCPvhFXsXmoFHfKN
	 eR9Daqk3Hlkgw==
Received: from [100.115.67.185] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 21/39-06990-18B10B16; Wed, 08 Dec 2021 02:42:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRWlGSWpSXmKPExsViZ8MxRbdBekO
  iwcH5BhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aJgztZCzq4KiZ8WMrUwLiYs4uRi0NIYAaT
  ROeqBYwQzglGIOcPkMPJwSagLvH45mswW0RAX2Lp7D3MIDazgKpE98U17F2MHBzCAh4Sp/rBS
  lgEVCT+bX/PBmLzCrhLTGjbDRaXEFCQmPLwPTNEXFDi5MwnLBBjJCQOvnjBDFGjJHFixUcmCL
  tC4vXhS8wTGHlnIWmZhaRlASPTKka7pKLM9IyS3MTMHF1DAwNdQ0NTXXNDXUNjY73EKt1EvdR
  S3eTUvJKiRKC0XmJ5sV5qcbFecWVuck6KXl5qySZGYKilFLu37mC83PdT7xCjJAeTkiiv/ev1
  iUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeM+Kb0gUEixKTU+tSMvMAYY9TFqCg0dJhPeDJFCat
  7ggMbc4Mx0idYpRUUqc10gKKCEAksgozYNrg8XaJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjE
  rCvGYgU3gy80rgpr8CWswEtNi5ZT3I4pJEhJRUA5P4nacPWJe4L7rpYBXUOPNo3VnulrN3Cn6
  wCEctMLEIfFA+8dnsJevTt2h09Fk3hnbnJbkdOLHMY+OOVUKSbvum3ZL421fCnGj9cFEZ30vG
  CJePj82sHk28sdU6w4bt3qdILrfOT1feFuS+L459IKy251Jipc7xi/zSsTq7tl44vW33XulHE
  lu+mz8sCa7K/hIYZKt94O7u3XFTlh1p00pm02AoTgnu03wpqpTnyaLJezTybWijX1+zeuGqUt
  FNTTHHFW6c7zh9PHSSqZH+3j0HJDd8Eaw1n7m+pGfx7cSNwcfX+i5PvB7wiIXn/YtzDQwKdg9
  NZ+/ut1m0LefIN/Fras7HEp/PFD2yZJ7B/dNKLMUZiYZazEXFiQBQxWUhMAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-26.tower-532.messagelabs.com!1638931328!74116!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13229 invoked from network); 8 Dec 2021 02:42:08 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-26.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Dec 2021 02:42:08 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1B82g03J017807
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Dec 2021 02:42:08 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 8 Dec 2021 02:41:58 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmd2: upgrade 2.3.1 -> 2.3.3
Date: Wed, 8 Dec 2021 10:41:27 +0800
Message-ID: <1638931287-31587-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 02:42:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94244

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=================================================================
Enhancements:
Added clearer exception handling to BorderedTable and SimpleTable.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-cmd2_2.3.1.bb => python3-cmd2_2.3.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.3.1.bb => python3-cmd2_2.3.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.3.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.3.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.3.3.bb
index 8167d20504..d8a4fb5f23 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.3.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4c527bcb481233ebcb803de975f42701"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "44f9d93bbcd90c6dda70e73db722d6b27b551d98bef28bd82fd14ccbe88d18ea"
+SRC_URI[sha256sum] = "750d7eb04d55c3bc2a413e191bc177856f388102de47d11f2210a35266543640"
 
 inherit pypi setuptools3
 
-- 
2.25.1


