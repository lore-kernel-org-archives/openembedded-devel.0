Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54CDC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:10:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.17869.1658916617288419615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rubLX699;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658916615; i=@fujitsu.com;
	bh=dN+fldC0kZ7wkpLI/ixfdHyZtFWkct+nE4Yjwl5d5FE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rubLX699rfL4itRwlbouCWhuiGFoJdINJ2lqTwKdkEuh9ySB1dBgKDCERXXNiwK3x
	 ADK/tUiixqbNc5iY5qRMVVUJ+6K58mNu+dSLu7N6v6o4XoKwS5Wd+4IFfpb1j3fIjt
	 ICcbn6fR3pNn4aupqetjhlYUg7zBFF+7xP0vbAfngSx98W6DXJjSlEOS1s3cDSQ0wO
	 JMgNu0La1YhkFRsNRbkndB9L4gIY7Du3NQPeqOVm8PDxQaIEVHPLHoItVHHHwZwARv
	 5Kq+QXxcdIVfvTiptt7kicyKfI+p+W/z0Sef/wu89YU1FXDElNePbxBNShiOHxoS2/
	 PQCSldJ2pIF4Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSZeN/2G
  Swfp/KhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bSk2tZCiZyV/TMamBtYGzi6mLk4hASeMIo
  cf79YpYuRk4g5zqTxImvFhCJk4wSPxta2UASbALqEo9vvmYEsUUE9CWWzt7DDGIzC6hKdF9cw
  w5iCwv4Sjw+tI4VxGYBiq/69hRsKK+Am8SGvzfB5kgIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMPLPQtI+C0n7AkamVYxWSUWZ6RkluYmZObqGBga
  6hoamukDSyFgvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwKFOKGap3MP7v
  /al3iFGSg0lJlNf97YMkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8ezkeJgkJFqWmp1akZeYAI
  wQmLcHBoyTCm8wLlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDhvOkiRAEhRRmke3AhYtF
  5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzrADKFJzOvBG7TK6AjmICO2KLwAOSIkkSElFQ
  D04bZ87xNH+il7Fz6yebXEYfEOP6i1ylc8S+3rj2541x++rydZ+qajNN81cqeqsxOacncrqcz
  sXiWheRdJTv5RzZ+Xb9v1HkFzsk3fz3vkcDHi8GZBoVXKh4onGi8xbw73N8q9RBPhX9cBrO10
  C728u0hHTJmOVaaJzepViYtS/htziR7c2aafsD2WL6CjXKBXE9UPx0+FdmkKxjQ/9t+7fkUj2
  4Z6frpZbN1r3MlpErdXDPNpPJugOGTdeFLNCRE/zv++qb0Y8tJFbd7PPqJl3/kss9fk7Zy5U7
  X9LXu0dsjw2cpb2T1W1S08/pN41VV52/KK61YvyfoQcfSmS8NojN4rLMm6xvN3eH140G2Ektx
  RqKhFnNRcSIAgRZjfVEDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1658916614!226411!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5242 invoked from network); 27 Jul 2022 10:10:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:10:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3BCEA100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2F4C2100077
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:14 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:10:12 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.19.3 -> 2.19.5
Date: Wed, 27 Jul 2022 18:10:01 +0800
Message-ID: <1658916605-9446-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:10:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98003

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
Fix
-----
    Allow multiple reads from imopen (#830) (18e3cb6)

Other
------
    Fix typos in v3 narrative docs. (#835) (d68f16b)
    Point source links to github (#834) (20eef2a)
    Remove outdated numpy minimum version (#833) (39947a7)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-imageio_2.19.3.bb => python3-imageio_2.19.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.19.3.bb => python3-imageio_2.19.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.19.3.bb b/meta-python/recipes-devtools/python/python3-imageio_2.19.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.19.3.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.19.5.bb
index 86229322b8..6fa43930de 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.19.3.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.19.5.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "0c9df80e42f2ee68bea92001e7fcf612aa149910efe040eb757f5ce323250ae1"
+SRC_URI[sha256sum] = "eb3cd70de8be87b72ea85716b7363c700b91144589ee6b5d7b49d42998b7d185"
 
 inherit pypi setuptools3
 
-- 
2.25.1


