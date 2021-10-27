Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E35C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:32:05 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.7803.1635312724126822667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nX2867YX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312722; i=@fujitsu.com;
	bh=2W3rQUTBu+e4+3i5cGigf1ueM8W4R2QxQEVN237/l44=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nX2867YXQS2mGrxTQZa7pgxLzd+TDWVZck96Hdb33nKIaRgM5sQg5jUG70TNUdWRT
	 l9/xH5kQ/P40x7tcd8zkMxcR2LAQj/e2A+hNrB9u0SJ7uFOQ/55RykVeNGn/MPC0ci
	 GZQ5f6nuGaVuN2DibD9dE93NhAzY+CFkm6SoVSG7HHl1BLl5hqLfprq2XlARMD+4vj
	 9XANvKWyIy8i6t9j0SElLcCY2yI9cpFw8svxRvaKyJ4UL+duwE4mqnyCryKwkvJD7q
	 qUVcg/HOBEf2hCUEmbj6MPOnEQTyKDwagRaf6QUaXMnsppneO+iyMyaBBwS79aCQOZ
	 ECLDV47FfQxvg==
Received: from [100.113.7.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 8F/A5-01506-154E8716;
 Wed, 27 Oct 2021 05:32:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8MxSTfwSUW
  iwYsHIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0brskXsBYs4Kya+b2BqYDzK0cXIySEk8IRR
  omGPYhcjF5B9gUli1vaZjBDOHkaJjde3MoNUsQnoSpx7vJYdxBYR0JdYOnsPWFxYwFtiX/dWF
  hCbRUBV4vDbmUxdjBwcvALuEsd2RIGEJQQUJKY8fA9WzisgKHFy5hOwcmYBCYmDL14wg5RLCC
  hKzJ4uD1FeIfH68CVmCFtN4uq5TcwTGPlmIemehaR7ASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0N
  jXTNdC3O9xCrdJL3UUt3k1LySokSgpF5iebFecWVuck6KXl5qySZGYNClFLKF72A88/qD3iFG
  SQ4mJVFe320ViUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeBUeAeUEi1LTUyvSMnOAEQCTluDgU
  RLhPQGS5i0uSMwtzkyHSJ1iVJQS5713EyghAJLIKM2Da4NF3SVGWSlhXkYGBgYhnoLUotzMEl
  T5V4ziHIxKwrz3QMbzZOaVwE1/BbSYCWgxsxLY4pJEhJRUAxPvG5/f8wqLexIDVJ4U+WfJKLw
  7J5V+Ue+llviyqPMRymFOr7adXGZurmpgUMiVYXV55grjaeZBj16V/HkoUXbnxZlb8yfWvnzH
  6maRmNf181mt8dRuaWGhd5OuHvytdW//bflP6/4d+bGrm1l81qGF723KVvl8yft70u82889Pj
  1VPXwxccV/0/2mGzFSFbTna6wSdZYQrXU1Fpl71Llc5tb7a7du/+ZzcunJbr6U/zD5SWL749Q
  Gh16tfF+ZUsuR9jG61mDpFtWrG70V/X4qFlZwvr3ppoKHY1pm+b4UtB+ubk4o1Xkkzfq6U3vK
  667l8XfFiH8Hf65eVVdpfChe1PlQbsPt69WXdHxbp5+8psRRnJBpqMRcVJwIAKP2wEDUDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-248.messagelabs.com!1635312721!629013!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13787 invoked from network); 27 Oct 2021 05:32:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:32:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DB89810045A
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:32:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CF08A10044F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:32:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:31:59 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-gmqtt: upgrade 0.6.10 -> 0.6.11
Date: Wed, 27 Oct 2021 22:31:54 +0800
Message-ID: <1635345114-3501-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:32:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93621

correct the order of pushing and yielding in resending procedure

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-gmqtt_0.6.10.bb => python3-gmqtt_0.6.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.10.bb => python3-gmqtt_0.6.11.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.10.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.11.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.10.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.11.bb
index eee47fefa..0e6670b90 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.10.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "7ab7a226ab13d75f7bc34a1422da73658ce4cac86708bf55f92daf7c5f44165a"
+SRC_URI[sha256sum] = "0be6d57841538abc3ae0a41131c6d53314e0705b74876a6f94bc903df1209fb6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


