Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB61C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 09:18:07 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.8665.1648113485970187070
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 02:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nSSPWzth;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648113484; i=@fujitsu.com;
	bh=v+7Kp/ZKDIvTOUR0ExRF1UIUFFtkRsZKprId1z2jbF0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nSSPWzthR8Y9ryTcslEUUe9+KxYX+rObtUZXlEtul5/Nb04IpX6ABUmg76vmVSpPR
	 Trg3FYNhihFoE/1FWWWm8KTWtWaicewe+iyoMdIL6g+FRI7rUmNtMZnNSQrGEGxNMQ
	 pIvl2/48j3LEGvRTE9ak4Z0cPO4VV5ZT5iCad7shcb9erGbws7xtlm3RJHS5jlNhDV
	 URnKWi7+3jtJzxn0V1l+Smnz/2QMamCAAHHz2uGHFprOKUjjXW71wwqrp5Zmicb1M0
	 qEhx7R9moKv8TARs4FOpcAcPV8kU7Ur5dq65olqJMN7wS3YozXed+3AzeqaPkpSfGm
	 +J0vlw2xa+z0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxRdfb3Cb
  JYNcdA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePXwy6mgjNcFffOt7M2MN7h7GLk4hASmMkk
  cWTvY1YI5ySjRMvDPqYuRk4ONgF1icc3XzOC2CIC+hJLZ+9hBrGZBVQlui+uYQexhQUiJZbMv
  QQWZwGKH71/FizOK+Au8eLdVhYQW0JAQWLKw/dANRwcnAIeEl/em4OYQkAlvxZHQlQLSpyc+Y
  QFYrqExMEXL5ghOpUkTqz4yARhV0i8PnyJeQIj/ywkLbOQtCxgZFrFaJdUlJmeUZKbmJmja2h
  goGtoaKprbqhraGysl1ilm6iXWqqbnJpXUpQIlNZLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMzJRi
  99YdjJf7fuodYpTkYFIS5f1sbJMkxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3lxFQTrAoNT21I
  i0zBxglMGkJDh4lEd4aQ6A0b3FBYm5xZjpE6hSjopQ4b6wZUEIAJJFRmgfXBovMS4yyUsK8jA
  wMDEI8BalFuZklqPKvGMU5GJWEeUtBpvBk5pXATX8FtJgJaPHzn5Ygi0sSEVJSDUy7T731ZH9
  x+ky01cJd36vTLpe+ilx2Q3h5apl3z5YLjSUOv0NL0zzynr9wONBlElR1ZXvpxfKkuc+E7tz/
  PzNn9Wc2q4X+60oeJtgLK0ccX3pLOG/6BpsFixzv6Ub7iOo8/rr/uMONdUbB7D0Vq69nvjW95
  zP/L8fpBheRvIhjhZ9vWLusype62Ls5541X1PWfQccnn6twn7tmVeV5bQ0ux6Oi68/e73r4Lb
  k2MKvV0E9W+5FiwmTm+foBB2V//mtSZo748pL/82POtL2vo/cmHBMJ81XOvLxzwUoX87vGibl
  u0bceVO16le2g47/geKvJ5mvXFn5fwGQwu2D2/gCNtHzfy5rtWtO783dd4ZNTYinOSDTUYi4q
  TgQAIUzBxEcDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-532.messagelabs.com!1648113483!69708!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3034 invoked from network); 24 Mar 2022 09:18:03 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Mar 2022 09:18:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22O9Hqdg002428
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:18:03 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 24 Mar 2022 09:17:52 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/5] [oe] [meta-python] [PATCH] python3-arpeggio: upgrade
 1.10.2 -> 2.0.0
Date: Thu, 24 Mar 2022 17:17:57 +0800
Message-ID: <1648113480-29846-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 09:18:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96187

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
Added eval_attrs call to NoMatch exceptions (ebfd60).
Dropped support for deprecated Python versions.
The lowest supported version is 3.6.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-arpeggio_1.10.2.bb => python3-arpeggio_2.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_1.10.2.bb => python3-arpeggio_2.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_1.10.2.bb b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-arpeggio_1.10.2.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
index 468e6d5fde..96d6de6a69 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_1.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 
-SRC_URI[sha256sum] = "bfe349f252f82f82d84cb886f1d5081d1a31451e6045275e9f90b65d0daa06f1"
+SRC_URI[sha256sum] = "d6b03839019bb8a68785f9292ee6a36b1954eb84b925b84a6b8a5e1e26d3ed3d"
 
 PYPI_PACKAGE = "Arpeggio"
 inherit pypi setuptools3
-- 
2.25.1


