Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F28FC38A04
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3745.1649837454813693068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a1CEnGHi;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649837453; i=@fujitsu.com;
	bh=1mloo3tngCDzgFc5bwZlvycBoGEkZlZuvFlJETkgunw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a1CEnGHiSWI92JDBT8qsC+f/y+wIe2kcWEtYNzUguK1Z7gRYDDlVZdsta8b/VfgWw
	 CjUMSbfnvhvRTOnLT50FRejwQO36+ilJJoR5qsg3l4EQBMPNYQNidYH4ssfZOUA7l2
	 5PEx5vH/So6jb7S6Dv/1UmzR9kiFaYqCPT/ZzruHuc5sdoH4imddgWDsau7IYD/9Jf
	 SdTIHE7V8mLrwFkR8C1YcjsBll+WC03BUmYF38ypFvFNcJWYdPgHz7KKA44d3HaKwA
	 ao8lMlP8wDJrIHIFfpfjFQRlErA5CpZbsI797a0te7hZ91u5CJdt/KVQ2NRe8LnNkr
	 tv8gIUOSoYk4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqNvTGpZ
  k0H/MwuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfi39ANjwQ3OirvNS5kaGD9xdDFycQgJPGGU
  uNzQywzhXGCSWHi2iw3C2cMosejLYaAMJwebgJrE9Fs3WEFsEQF9iaWz94DFmQVUJF787mEHs
  YUFbCXO7rzDAmKzCKhKfJl1nhHE5hVwkpj0+jhYvYSAgsSUh+/BbE4BZ4mGSaeYQGwhoJrFM9
  6zQtQLSpyc+YQFYr6ExMEXL6B6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrRKKspMzyjJTczM0TU0MNA1NDTVNbbUNTXSS6zSTdRLLdUtTy0u0QVyy4v1UouL9Yorc5Nz
  UvTyUks2MQLDOKVY3WQHY/fKn3qHGCU5mJREea/XhCYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uA92RSWJCRYlJqeWpGWmQOMKZi0BAePkgivewNQmre4IDG3ODMdInWKUVFKnNe8BSghAJLIKM
  2Da4PF8SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrx9IFN4MvNK4Ka/AlrMBLT426pQkMU
  liQgpqQam8KaO/Y3LPDdO3FhRmLuKf6PMOa+kyvKqyy8vbN0Y4MF6puTUO/G8jqifMr+XJJ5K
  +hUgE265+ESM448Cifusup/W3N74YKnt7pZOuZOzA27c32i7cNGFudnlgTtM3oVL3ryafs1nn
  6gvr23Ygf7Cli3PdPqelX72uihfMiHyuWDQq10lAqzaXUcd17UZX9HbI3FrcmnJrEsZryfq7U
  xXZ+2Qf/HURuSBrM6Vh+Z1/GttlR6df27AfTVk2uxXl7fHCR3dlyz4vLjDUI7L0u19HWvDXMf
  c5ycd1RadXDj/ft6v2SqFXVFzg1n03z9SnqdyOeWk23G1J/FdKzd7LtlVevN72fTPJ8wsGGIu
  HZ5trMRSnJFoqMVcVJwIAMR2c6heAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1649837452!174!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3846 invoked from network); 13 Apr 2022 08:10:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Apr 2022 08:10:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 56480100189
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:10:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 395CD100180
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:10:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 13 Apr 2022 09:10:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mercurial: upgrade 5.5 -> 6.1
Date: Sun, 10 Apr 2022 23:07:00 +0800
Message-ID: <1649603220-12209-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649603220-12209-1-git-send-email-wangmy@fujitsu.com>
References: <1649603220-12209-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96612

Changelog from 5.5 to 6.1:
https://www.mercurial-scm.org/wiki/WhatsNew#Mercurial_6.1_.282022-03-01.29_to_6.1.1_.282022-04-05.29

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mercurial/{mercurial_5.5.bb => mercurial_6.1.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_5.5.bb => mercurial_6.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_5.5.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/mercurial/mercurial_5.5.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
index 8049434109..3abecc3054 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_5.5.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
@@ -10,8 +10,7 @@ RDEPENDS:${PN} = "python3 python3-modules"
 inherit python3native
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "17b21729cbc61dda80b2e3dfc046319f"
-SRC_URI[sha256sum] = "c1ed28e1534304a7a4981ed59905286d1c56acd5b75755eedd184171a4a782b4"
+SRC_URI[sha256sum] = "86f98645e4565a9256991dcde22b77b8e7d22ca6fbb60c1f4cdbd8469a38cc1f"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.25.1


