Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C757C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:26:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.90434.1679617588832640574
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tgfckiQS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617587; i=@fujitsu.com;
	bh=XBr+Y8crZEzEkyz95yVjqg/MLY9npLgGGX63dt7wjEY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tgfckiQS/vNYO8ctm1Xrf5JA0rx2kCAV4MjFqUQeipowH4yJ+ktW3k8XKqOuP6kep
	 R/L3uLtr9xzwT6JJFIxHv7Temy+kps5ZItL59mwFtsp/YNb9YVCoUlR5eVm03pWGXV
	 tdPGUgL2WqH/vMecf84XMS8+rdAeCRiSHaA7+CRTbPbH0hcfzGEVWIYZAsItMDggky
	 uOLjl/BHhL/yC9HdaAd291vUvYupOKwMxlOCiNOvSmfP1gTX3OKBv9lOeRGDFiMHLf
	 HWQv/L7hKhFQ0ROJ36n3mUv4oOz1/GXezfRWskUfMbb2bPF+l42YMghkDhLJmAJKrx
	 BPEcDxaZKT8Og==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpGv4Tib
  F4NFEK4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePXuz+sBa+5K2507WBuYPzL1cXIySEk8JBR
  Yu/MgC5GLiD7CpPEh3/9jBCJPYwSS1fFgthsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCwRJHL39HKyGRUBVYvOmv2BxXgEnib9/5jKB2BICChJTHr4H6+UUcJa40jwPKM4BtMtJ4s
  7hdIhyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdoVE4/RDUCPVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0rXQSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM25Ri1jc7GLf1/dU7xCjJwaQkyisRKp0ixJeUn1KZkVicEV9UmpNafIhRhoNDSYL38
  xuZFCHBotT01Iq0zBxgDMGkJTh4lER4D50FSvMWFyTmFmemQ6ROMSpKifM+BukTAElklObBtc
  Hi9hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd49r4Gm8GTmlcBNfwW0mAlosXMN2OKSRIS
  UVAOT0IHidyEfDx6eucW67uhd9btJFhNvlE5lvN+X3pOq0x6StLNjRoXHHT6b6H8S+ldFJz6Z
  t/CBKp/wt+OLb7aK7mwQZIxKOdXE9J0rzbFTKtp2fvTCS/YfRD6VRTzpFjS8msAQ7LQjuT/u5
  YKNTyTNJNZwnzT5Fcf9dYezvvjl+UXqUv5K60984Vi2+ub+3rh/Hmc/xD7t3evCdeLGheSXu9
  TiraQTPHv618r0JpuLv/hTufVksk199TmVu1J5y6Zf+Cqvbm6zfU0k/+T7fAem1ex8bNx7/yC
  H35ZLPMtemZfc0whnZpXcXTz/pFM17864KXd7cjw62EOmht1+x61lqeAXIV18d+Ldc5enif5R
  YinOSDTUYi4qTgQATrcweFYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1679617585!255900!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14349 invoked from network); 24 Mar 2023 00:26:25 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:26:25 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9040E1B5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:25 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 852C31B0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:26:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-compress-lzma-perl: upgrade 2.201 -> 2.204
Date: Fri, 24 Mar 2023 08:25:36 +0800
Message-ID: <1679617536-27169-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617536-27169-1-git-send-email-wangmy@fujitsu.com>
References: <1679617536-27169-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101677

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...s-lzma-perl_2.201.bb => libio-compress-lzma-perl_2.204.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-lzma-perl_2.201.bb => libio-compress-lzma-perl_2.204.bb} (76%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.201.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.204.bb
similarity index 76%
rename from meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.201.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.204.bb
index 327cc7a969..13c17b9bba 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.201.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.204.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=8f4f1603d6e92a381ce2f595ab3cafd5"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=b95311d4a7dbf3d0d3663edc094aced6"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e0714dd35624654ba3d8e245ac980bcd07d995989d7acc90a46146f62c4ec761"
+SRC_URI[sha256sum] = "1e7a4c4f4e665434df59246b19d168b08af2f1aeebaa08937bd69ad3e5e319c8"
 
 S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
 
-- 
2.34.1


