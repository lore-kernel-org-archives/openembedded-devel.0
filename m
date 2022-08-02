Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AA4C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:44:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.6275.1659447867827296472
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jFOLThSs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447866; i=@fujitsu.com;
	bh=VhxrsIA+jNLE8heOk02fdstkrkwMwMCQ1zf5To683W8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jFOLThSsMMHAjWp9p6LB6O/rZkA6R2b265WqTEjoAdn/y6tRWLQNuH0Yy2lFMThIn
	 XBgZgKTU3w0YqyaBLioqfGByq+Q4Sji1q71Vo+nbi7FPPD1BQGWamGW589bSiwd8OZ
	 o/ZsDUkju0DOrvNlbe1cZWY5X+cKziaXj9+IxYe2FO749xlPT3Yd1VGeJz8y9HZXe0
	 fTtMA8al0x6xIRVaD9f5iHHQiXQi+Kd6et6PIC+bevHt1LK65YwUU5q7MqBHa8qt5g
	 8ShanHgxglvLeQTW5IQRIsadPFbFbIFaN3gsnQAc4T9a1ddMcyYIim8xYnQ0A8+1Yj
	 k8Bw81KNOw6GA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSddS62W
  SwYmt2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bqzia2glPiFY8+SzcwbhTtYuTiEBJ4wiix
  9GwTO4RznUni8e0uJghnN6PEi10rgBxODjYBNYnpt26wgtgiAvoSS2fvYQaxmQVUJF787gHq5
  uAQFvCSOHLWCiTMAhT+cGEzWAmvgJPExxcP2EBsCQEFiSkP30PFBSVOznzCAjFGQuLgixfMED
  WKErMvN7NA2BUSM2Zsg+pVk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0fX0MBA19D
  QVNfYAkgZ6iVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBAZlSrFa/g7Gvyt/
  6h1ilORgUhLllVN8mSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgveWKlBOsCg1PbUiLTMHGCEwa
  QkOHiUR3rMaQGne4oLE3OLMdIjUKUZ7jqmz/+1n5lgOJmd+bTvAzLFpX9cBZiGWvPy8VClx3u
  UgbQIgbRmleXBDYRF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7wGQKTyZeSVwu18BncU
  EdJYO1wuQs0oSEVJSDUwhHbmJDVsWzvu8+5OMn7Efb6KKU1vNP+1gG+Wv3JOEtk/2nf6Oq/9E
  nO6MwJ0Jsku/KUt9z9Di0g9keDdNzmO946YDBm+eaRum3p9kX1sxee7ye/bLngXOcprpl9cd4
  BCTvOGoLFdLxa/JHywiO4QmaL+4Hffn4xt130tv+pOc98y2jgwzm7Y5ca4500IGM4WktV/bHj
  MfdJnJ06/7Su3MrQjXbbuSp2Z4fjSvSTCcKsT0tfjhwy29ex4Jh7Zz7NYr47n/zaXNqFU1dhX
  /Dr9zR8/N7XN3tzYIOHE5XOBq7+dksW0LIzLOP1uocjt9dWXIybJjO4sOzZvZH8O8THHj7WYx
  HTavjP9zi3lN85RYijMSDbWYi4oTAe6cN75jAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1659447865!4081!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23972 invoked from network); 2 Aug 2022 13:44:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:44:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 685C71000EE
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:44:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5B83A100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:44:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:44:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.6 -> 5.9.7
Date: Tue, 2 Aug 2022 21:44:14 +0800
Message-ID: <1659447854-24486-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:44:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98098

0001-enum-Fix-compiler-warning.patch
removed since it's included in 5.9.7.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-enum-Fix-compiler-warning.patch      | 31 -------------------
 ...trongswan_5.9.6.bb => strongswan_5.9.7.bb} |  6 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.6.bb => strongswan_5.9.7.bb} (98%)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
deleted file mode 100644
index e730fe1cd0..0000000000
--- a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d23c0ea81e630af3cfda89aeeb52146c0c84c960 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Mon, 2 May 2022 09:31:49 +0200
-Subject: [PATCH] enum: Fix compiler warning
-
-Closes strongswan/strongswan#1025
-
-Upstream-Status: Backport
-[https://github.com/strongswan/strongswan/commit/d23c0ea81e630af3cfda89aeeb52146c0c84c960]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/libstrongswan/utils/enum.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libstrongswan/utils/enum.c b/src/libstrongswan/utils/enum.c
-index 79da450f0c..1e77489f6f 100644
---- a/src/libstrongswan/utils/enum.c
-+++ b/src/libstrongswan/utils/enum.c
-@@ -97,7 +97,7 @@ char *enum_flags_to_string(enum_name_t *e, u_int val, char *buf, size_t len)
- 		return buf;
- 	}
- 
--	if (snprintf(buf, len, e->names[0]) >= len)
-+	if (snprintf(buf, len, "%s", e->names[0]) >= len)
- 	{
- 		return NULL;
- 	}
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
similarity index 98%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
index 1b82dceac2..67ab7c4110 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
@@ -8,11 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
-SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-           file://0001-enum-Fix-compiler-warning.patch \
-           "
+SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
+SRC_URI[sha256sum] = "9e64a2ba62efeac81abff1d962522404ebc6ed6c0d352a23ab7c0b2c639e3fcf"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


