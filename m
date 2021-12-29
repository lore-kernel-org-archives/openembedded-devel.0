Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC81C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 07:59:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.48522.1640764766202584477
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 23:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Hpu+/fhB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640764764; i=@fujitsu.com;
	bh=dj1BQhjNDbivHW2vV7TdmebsUbI2TNkMshDkApqBhbw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Hpu+/fhBM13CGNI+a5QLGGwSA3mmMEYVcCb6LqyrXfALBPqu2T3pLh81y5MMLI7wH
	 PCCZ2f0LCtDgWDtg0An+AvUfWL+qEw++o3brq5KyQGKpS2741V2OZWEev4ePNWOQum
	 VBQJkwptJELRjwaj+Kk12P+WEo5AJn103aHgKTP9zM2i0vVaMGXvaxs1CaA1RNO3Iw
	 4bDbJvhZTlOmugSdog21qemHLkvJ364ekeB8qAaaHJwuX/XdHKFlo18g6HQ95C2bwA
	 yR1YDMJ9LErexW0E9ZsUBr0tyOA+4nr+aKzVWYpmDXR7K5CrPIkBX5wl0NgJCZnT+7
	 dq2MCyj0dk8SQ==
Received: from [100.115.35.72] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id E2/FA-27579-B551CC16;
 Wed, 29 Dec 2021 07:59:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRTda9Ey
  iwYklIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8buzyfYCg5zVmzaN4WlgfEVRxcjJ4eQwEwm
  iQvzMyHsk4wSc+44gthsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1zDDmILC/hLvLx+CyzOA
  hQ/3juVFcTmFXCXaP23D8yWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDFGjJHFixUcmCLtC4v
  XhS8wTGHlnIWmZhaRlASPTKkbrpKLM9IyS3MTMHF1DAwNdQ0NTXWMjXUMjM73EKt1EvdRS3fL
  U4hJdI73E8mK91OJiveLK3OScFL281JJNjMAQSylWqNvBeG3lT71DjJIcTEqivPUMZxKF+JLy
  UyozEosz4otKc1KLDzHKcHAoSfAysQDlBItS01Mr0jJzgOEOk5bg4FES4X0oApTmLS5IzC3OT
  IdInWJUlBLnjQFJCIAkMkrz4NpgMXaJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvAZApPJ
  l5JXDTXwEtZgJabGt6GmRxSSJCSqqBid9su376j5kPRavcHk5wsK+e8fu8xqeyrqqycxpbXgo
  ++6ZStrUgovanVrMQz/SSm+80G7a+Danft03iiOimbVUiZb9z5kwyfSLC4hh2aeJUoTqJHyyx
  JZLHt7V9ODxFM0Lm0bOsd/XLHqSdiy99ZCrmUvenjpuF16my4apKd5303LjCMwJff++uMS03r
  N1junq2qViFWea151ukWpQUy11DMmy1XZ0XGW/mepL66H/sK/WzBtMux25Mz38fs1jM0S7lcG
  XA+qpZBgxLLrmvly8709DiuWPiI/sre3h+8MWVymipVNv/XLdtosfmD5sZ+rc1Xvg3uW2SPpe
  YpFuX7Mm4k25xcv4zNmWG2okrsRRnJBpqMRcVJwIAknXBdiwDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1640764763!141253!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32560 invoked from network); 29 Dec 2021 07:59:23 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Dec 2021 07:59:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BT7xHgW029202
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 07:59:23 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 29 Dec 2021 07:59:16 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.28
 ->1.4.29
Date: Wed, 29 Dec 2021 15:58:03 +0800
Message-ID: <1640764683-27566-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Dec 2021 07:59:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94561

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.28.bb => python3-sqlalchemy_1.4.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.28.bb => python3-sqlalchemy_1.4.29.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.28.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.29.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.28.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.29.bb
index 7a19f96f6e..b535951c00 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.28.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.29.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "7fdb7b775fb0739d3e71461509f978beb788935bc0aa9e47df14837cb33e5226"
+SRC_URI[sha256sum] = "fa2bad14e1474ba649cfc969c1d2ec915dd3e79677f346bbfe08e93ef9020b39"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


