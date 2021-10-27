Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E58C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:23:59 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web08.7638.1635312237206600174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OPkx/m2t;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312225; i=@fujitsu.com;
	bh=anUUEgw1QC2nfzGE0sH0uFPUvIS+tXjhi07Y9CUs+Nk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OPkx/m2t9NigHYRG3MGFFdFx5ZjOJI+jTZc68wdbZ37PvLYaDFa+fHp0lnpYQNpRZ
	 r7oNmOEeptZYXmU9feOWcgD2iaShUgVVW27LuCJfoLM7qmb1eyteM/wmj6KUn+FgjE
	 rh4AO/Hq8OK+2qeeI7ogSSavbnNj99heuQ1GjnvFAzTZHlgQ6iiBXijLVuEwplxuBB
	 krrU1zYQSDCRjSd6UKYIqD/BLFEO/uH0eoARsItflgqTNSscVvVSU5U0VBxDvgrd6r
	 fvpl64ltTl6H2UAcM1mFBSRBEvMj4FTFWVtvFMxTgcjhEjgF8xkTa0yLClBCr8VS9j
	 ETy5SWndHRlLA==
Received: from [100.113.7.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id CC/CC-30139-062E8716;
 Wed, 27 Oct 2021 05:23:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1U14VJF
  o8PijvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH14nX2glMcFRuvfmZrYPzG3sXIxSEkMJtJ
  4vDpKWwQzglGiWdPlgM5nBxsAjoSHS+6WUBsEQF9iaWz9zCD2MICXhJt19aCxVkEVCXOL1vOD
  mLzCnhIPPz5mwnElhBQkJjy8D0zRFxQ4uTMJ2D1zAISEgdfvGCGqFGU2L7zDAuEXSHx+vAl5g
  mMPLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hobGuma6FuV5ilW6SXmqpbnJqXklRIlB
  SL7G8WK+4Mjc5J0UvL7VkEyMwkFIK2cJ3MJ55/UHvEKMkB5OSKK/vtopEIb6k/JTKjMTijPii
  0pzU4kOMMhwcShK8SfeAcoJFqempFWmZOcCghklLcPAoifAaPABK8xYXJOYWZ6ZDpE4xKkqJ8
  967CZQQAElklObBtcEi6RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5/ION5MvNK4Ka/Al
  rMBLSYWQlscUkiQkqqgakoPmB579V6K8uFh427J+9SzC2dmr9MagLLrbLscKGlFd8nuz2VL+5
  Nb1+86ZPWza9P1ikIeSv32MabdSz+dej5q6mz/F9eK9C7vWPdYpW6QN0SAwXjrYtPzr/BZ+nz
  IC/3mgvDji33PR6Kts4Mf31Jo3+C4JGkBfJNFqkXMo81Jf6tuJbYtOdjdXDtFc8rmz8/2/PMb
  cd174f/JveJZjWf679WExh5rI2jeZ74hn2HVNu87v646divufTF1WcS/jZR3p8KvVbaHNsvsu
  sh961tfvdWPLJt2N4id11cX/pZY+y7kn7OHQ0X+w1ubcpg+zx1PvPkReUGH3+n/A+M7ZNruzd
  N2Zdb4LhDUd7cDW+VWIozEg21mIuKEwHL92MkHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-238.messagelabs.com!1635312224!77248!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32119 invoked from network); 27 Oct 2021 05:23:44 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:23:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19R5NcQG031038
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:23:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:23:37 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 0.14.1 -> 0.15.0
Date: Thu, 28 Oct 2021 01:23:33 +0800
Message-ID: <1635355413-111938-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:23:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93614

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-absl_0.14.1.bb => python3-absl_0.15.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.14.1.bb => python3-absl_0.15.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.14.1.bb b/meta-python/recipes-devtools/python/python3-absl_0.15.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-absl_0.14.1.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.15.0.bb
index 270dbf200..f25201dc3 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_0.15.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "eb0383bd431c0d7b2320179904cab00120a10977e3c9671d99efbbed17efb55a"
+SRC_URI[sha256sum] = "72d782fbeafba66ba3e525d46bccac949b9a174dbf66233e50ece09ee688dc81"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1


