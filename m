Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26731C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:42:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.49047.1681717309960320735
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ohJhqHgz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717310; i=@fujitsu.com;
	bh=XKQ9Alo93s55jeDaa2EWnOzp2ph5qdi1IUV9R3axrvI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ohJhqHgz/cTdDSyXDZVqzgMA5TJ54lxCDQYd8PkKVwMBPN3gBRUJXu6Kne8y8Bl1F
	 qCv3Gyu4CjNFOcL/k3VCxOtBCnhZneKhUDO9cil6TC4P6hWzzbU7/4oXfAdT3rwXtM
	 7cuagLqFZ3JSnhcseIPtrbAUlW7obHLf3Jt/4XlN8sgZNCEVWZj80roeXUu0V/mRHt
	 ed6DnuEMXFPETYy8eDIw5hKPCIKRa/kLjd9eWKxnTGmlxXkA7rTlxARCuLh99YECw1
	 +WeCArY3viPIZsAAsY+O2yMz70WTx9flRqzvT/LgVyG5ksQckKFzvJAsjZMCR2UtJa
	 WRcrPSPN/iWsw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSdfuh02
  Kwf4ZTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bB863MBf85K7ZvXMzawDiTs4uRi0NI4Amj
  xInL89ggnBtMEs8Pb2KEcPYySvRMXM3axcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAgMST1VMYQWwWAVWJGYcWgdXzCjhJTLq/hwnElhBQkJjy8D1YL6eAs8SKhb/B5guB1C
  x8wwhRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6UaP3wC8pWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRtDi1qCy1SNdUL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMweFOK1XbtYJzQ91fvEKMkB5OSKO+LVOsUIb6k/JTKjMTijPii0pzU4kOMMhwcShK85
  7/ZpAgJFqWmp1akZeYAIwkmLcHBoyTCa/wMKM1bXJCYW5yZDpE6xagoJc7r/x0oIQCSyCjNg2
  uDRe8lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8b0C282TmlcBNfwW0mAlosZwS2OKSRIS
  UVAPTur/az1W/Sq4TTcxaH/v4xZ6eKfxCfR+vJj2zmBR+LiRLp/vD32/1Vu/lFaZOsUlVXDZN
  kU0jI/mEOcd/q5/yv6Ocv1cx95+/svvTJX+bePOrHlw76lUO8v25Jndtz8uC/Xmel3MPJLX38
  aw/qBTZeDOdyavv84Wr//1iz0xLCuhL+5g7welt17lT918zM2gVJ726N+GK9+1t5vn9Ga7tD5
  3MF9eH2zCEFZdqzerfd+rCjtMRi1erm6gmG/qfLivaljGDR/flb8Y/HVzzXi6ZL5J4p9tWY+5
  edTdur+CsNdZau5+/mxw53fDqHGezfw+/n2qet7vCfmKOhJimw2rJ9089znk9W2QjdVrtpvlb
  JZbijERDLeai4kQAClQihlkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1681717309!296844!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30969 invoked from network); 17 Apr 2023 07:41:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:41:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BB407100337
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:49 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A5A21100346
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:41:48 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.169.3 -> 2.4.170
Date: Mon, 17 Apr 2023 15:41:30 +0800
Message-ID: <1681717292-19167-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
References: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102114

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add: support breakOnDuplicate option for attributes:add()
- Update reportlab_generator.py.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.169.3.bb => python3-pymisp_2.4.170.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.169.3.bb => python3-pymisp_2.4.170.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb
index 4f8a13051..dbfcebe5d 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "39f5acf1f618cde6cb14dd815cbff5297a8af25a"
+SRCREV = "6b28d8e606747cade1638f651ea531850027ddf4"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


