Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED15C761AF
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:36:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.90634.1679618187011123745
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mdqk0yIs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679618185; i=@fujitsu.com;
	bh=8aMhpBw2EBdoQuSjAPDrHnLPBcQJNsF0yJIP5xFO31E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mdqk0yIs8tu+Y9WAi0u1SZPqjoUksxcmSSWZBt+VXRDj6EOV5QUEibMpvCJT4pinM
	 KAosviaol+m8UdMyYIrKcvVs3xpT0BRIRMG5UXESnCNaKGkq2BI+iV3ySDzUKW/Z1Z
	 UwCwG6N/qijEKd1PzKaj3NoLGWmNP+qcn2d7zy36hnFpYKgxR+GnKW9pjgJLjug1IV
	 z2WDOBkMTiCnzji84wR0IjauiPd13N8LiUIh+kVBqBL5rPKGtSdXHSro2PT1+GJy2p
	 DEtz9CG9LErMJdVTjQ6jESK50NGyvmBRkEznS3mfLeopQfqOT3G6T4oWRmkr8/PaKJ
	 5HpSDhUvPOkOQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpNvxQSb
  FYMYhaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPm6nXsBS3cFS82v2NqYPzB2cXIxSEk8JBR
  4s619+wQzhUmifev9zBDOHsYJWZ/ncraxcjJwSYgJXHj/n82EFtEQF9i6WyQIk4OZgEViRe/e
  9hBbGEBB4mph9qYQGwWAVWJ/m8tYHFeASeJAwfeM4LYEgIKElMevgfr5RRwlli4cRoLiC0EVH
  O/eR4bRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkbT4tSistQiXTO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OSc
  FL281JJNjMDgTSlW/7WDcWbfX71DjJIcTEqivBKh0ilCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  Hg/v5FJERIsSk1PrUjLzAFGEkxagoNHSYT30FmgNG9xQWJucWY6ROoUoy7H1StX9jILseTl56
  VKifP6vQMqEgApyijNgxsBi+pLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYQhpvBk5pXAbXo
  FdAQT0BHONWBHlCQipKQamFYtl69L7Uhl+3jpaYfWoYbfZhNC7P7++Jdg+f3plgD5NzYZmmdn
  xmvkXv2pH7pPWc9dg+WdGlPOn9sCP87+rri150oXxwvDvA0fTv78eejOuZIZe6x76n58s2o4U
  T/l+TkvH70F3W/OhJco3L3ye9tedrFv95qkcnzaeys+f1j7oOVyTApTS8PkpuwOqVvr4sNnSP
  HV2/iXe72Mu50RKfNE1cN42cTWp9m3dBZZXH41R8jdwOvC/qafj223HD0Sybn59NIJuQF700p
  nVCZ4nfh5W9lw5a6VyZbmOepTyowkPH26a2Y+O5t3ZXXD5nhW5rAQ57j0jb/qbCPd2lIjLHq+
  KJvE7U7cxN047znjGiWW4oxEQy3mouJEAEI1hNhlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1679618184!141677!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27891 invoked from network); 24 Mar 2023 00:36:24 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:36:24 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2C4AF1B5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:24 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 214671AF
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:36:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libass: upgrade 0.17.0 -> 0.17.1
Date: Fri, 24 Mar 2023 08:36:04 +0800
Message-ID: <1679618167-27390-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
References: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101694

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fix buffer overread if soft-wrapping occurred and ASS_FEATURE_WHOLE_TEXT_LAYOUT was enabled via API or due to Encoding -1 (bug introduced in 0.16.0)
x86: detect GNU Hurd and configure NASM appropriately

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libass/{libass_0.17.0.bb => libass_0.17.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libass/{libass_0.17.0.bb => libass_0.17.1.bb} (92%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.17.0.bb b/meta-oe/recipes-multimedia/libass/libass_0.17.1.bb
similarity index 92%
rename from meta-oe/recipes-multimedia/libass/libass_0.17.0.bb
rename to meta-oe/recipes-multimedia/libass/libass_0.17.1.bb
index c052239cb..800ad1b15 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.17.0.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.17.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 
 DEPENDS = "fontconfig freetype fribidi harfbuzz"
 
-SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=master"
-SRCREV = "bef4b43ef1882b77f789f611d9cd24271ccdd65b"
+SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=0.17.1-branch"
+SRCREV = "e8ad72accd3a84268275a9385beb701c9284e5b3"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.34.1


