Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B53C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:01:56 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.4325.1652940114695403725
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LF5p/qWp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940112; i=@fujitsu.com;
	bh=2yHOHgExRu3VJfbZuRfLV3LXpUDD/R+z+GM0oNRuu8g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LF5p/qWpo+yEwXZ6ShMZTF+vgD9+x8FDYACLWU14aToC9vTgGaX/XeWUZaAdCimxU
	 uy+IeTToFL+K49yyJ6BsH7Mx98NbqUYRWAUuUwDKfJQLpjZwKK4fDOzly9s+wProoI
	 lVCHPXOhlbf+l2DEsOGmwfpxcO7oI1oBiU/M+6+eqV3egcSTF5I0YQgU/QJTg7o+jH
	 BbirDlb0rJU+5Rlh1E/ZMotolTFX+UtNkU70tHTK9HvxqDRpJEWcA7/0a6tjQ4L7at
	 6/SPF/xTbldUyhWxvTK6F62G6IQdL8Sh1WcOFijX/wriB510RRrCk9iLgjjNNTr9kY
	 CNOt462SK68Xw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSTfgbmu
  SwcpNohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bDlWOsBUu5K878mcHcwLiGq4uRi0NI4Amj
  xMyjR5i7GDmBnAtMEtP3u0MkDjBKHHq1nhEkwSagK/Hix2IWEFtEQF9i6ew9YA3CAnESc1+uB
  YuzCKhKdM++CGbzCnhIrLg4mR3ElhBQkJjy8D0zRFxQ4uTMJ2A1zAISEgdfvACKcwDVKErMni
  4PUV4h8frwJWYIW03i6rlNzBMY+WYh6Z6FpHsBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdY11
  DS0u9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzA0EspZj6+g3FK30+9Q4yS
  HExKorzuR1qThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwfr4BlBMsSk1PrUjLzAHGAUxagoNHS
  YS3ZRdQmre4IDG3ODMdInWKUVFKnDfhDlBCACSRUZoH1waLvUuMslLCvIwMDAxCPAWpRbmZJa
  jyrxjFORiVhHlTQabwZOaVwE1/BbSYCWjxLWWwxSWJCCmpBqbe/t+tmSFH/O6euByX0vU9s8h
  +9XStWyX/WO7tl/19rcht7rd1jJovH2/f0nV744GsxlcrLc9d/qCtuyu5vK0l6nfPlEkTOa/3
  nONZrZLq81B8peO/XRXXhaP2fHx/4dlt/Rqp6cytNV3O/Jc7Vz9M4Q5LdJ5p5a61ZZNWXkvxQ
  3dRR4YrHte1dXkt8/WuLNtwnb1AKbqHKeHIg29+qsWNc3zu/stwVN/1WVRhr6SG7WGNl/rSh5
  4FPLnv+zy1l6t+c/TMk7sb5C6ky4WY68pPqntrNp1//+Ie5tysRc9VBA/dU6oN+blIYtUB+Tk
  L3M/eXP/zteaRu2f+yy84e2/uVCFzpfpXC7U8J5zcvGSXEktxRqKhFnNRcSIAE4u69jgDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1652940112!20399!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17736 invoked from network); 19 May 2022 06:01:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:01:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DF2B1100353
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:01:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D17DE10032A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:01:51 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:01:30 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade
 1.56.0 -> 1.56.1
Date: Thu, 19 May 2022 14:01:20 +0800
Message-ID: <1652940080-24835-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97172

Bug Fixes

    deps: require protobuf >=1.15.0 (f04ed64)
    include tests directory (#103) (72e5df1)
    regenerate pb2 files using the latest version of grpcio-tools (f04ed64)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...tos_1.56.0.bb => python3-googleapis-common-protos_1.56.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.56.0.bb => python3-googleapis-common-protos_1.56.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.1.bb
index 0a3547ee9..171649ffb 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4007500795bcfc269d279f0f7d253ae18d6dc1ff5d5a73613ffe452038b1ec5f"
+SRC_URI[sha256sum] = "6b5ee59dc646eb61a8eb65ee1db186d3df6687c8804830024f32573298bca19b"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


