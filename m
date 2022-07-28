Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D9AC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 02:14:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.28161.1658974490059450817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 19:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hA+7s+uO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658974488; i=@fujitsu.com;
	bh=b79exmmy99GqrAX6SbeKmWLlh6esr5/+fJ0n+cW8Y8U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hA+7s+uOJ2lvDZQu7IcnZL9WwNiw9J0gwVKrXpckSQ28EmOXssk0TfImmv9a6EoK9
	 GPlplfAyF1NGABTda059rQXAkSteQfqWR26vuXSxVvNIX6hRnThI/54Yv0bA0RAg0I
	 IrcAOSBvMoo6X8Vk5NCoKH7QEItm2WjZj366UsDf++2hGWaH52uFvRsB15VDOW+Sti
	 qY1Immf3qBaEJVB+vL+uRZ+QcJJTBunuvSaL73LjIYJ7R1b8DkUm3Jw/eCYo5qH4Ek
	 VFFsIouXOsmn0BogMfn42KE6ivivZkkq6F2pC2RWJ1IObzUtmtAJ64NQlI1rH54uey
	 R7PE4b4QuuXug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORpCv+8WG
  SwZsudYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePZucqCNdwV35cXNjCu4upi5OIQEnjIKHHz
  2GpWCOcKk8TEGwtZIJw9jBKvr3cxdzFycrAJqElMv3WDFcQWEdCXWDp7D1icWUBF4sXvHnYQW
  1jAR+LB8W9gcRYBVYnGmQ/AbF4BJ4nNPcvAeiUEFCSmPHwPFucUcJZYs30iI4gtBFTzaOJldo
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YrZKKMtMzSnITM3N0DQ0MdA0NTXWNLXUtjPQSq3QT9VJLdctTi0t0gdzyYr3U4mK94src5JwU
  vbzUkk2MwBBOKVYP2sH4bcVPvUOMkhxMSqK8Mxc+TBLiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  bvpFVBOsCg1PbUiLTMHGE8waQkOHiUR3gdvgdK8xQWJucWZ6RCpU4yWHFNn/9vPzLEcTM782n
  aAWYglLz8vVUqc9/t7oAYBkIaM0jy4cbCYv8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPf
  xO6ApPJl5JXBbXwEdxAR00BaFByAHlSQipKQamKyKbKsPX2BYWLmH8RBn84SGhd6Ol7LX9Fox
  t5QdPOF2cs86177pOif1btqcaAk5u+jP3iNCyx5vbDP5Kmcf+u9i/ObX9VIv7V6LvK96z3tWd
  uYG0S3OF68diHf2WOf848rtEMGIc7alnzedaM3ef1S/9q6XtoLtvxuvYqpK3/IqX1uzoHCvnQ
  XLBjvFjZHx72wMeEU7l8UEnOW4vWS2ba0GJ4+g5bGOL2a7X3M4J1+7J1PHfuSafUXpL8mmt1d
  Z1icKZIoXLmSY5TxdOiy+gGE9G8/TH5s+WDLZH+Y4fpvr1jS27NV/nKbvljq9rmT2vuRNurLT
  Z4eZpLb8KxcXFzwyoeaD93rNNYmBNts0FiuxFGckGmoxFxUnAgAjVX+JdAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1658974487!284202!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6591 invoked from network); 28 Jul 2022 02:14:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Jul 2022 02:14:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5BEF11AC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:14:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 511361AB
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:14:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Jul 2022 03:14:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.2.3 -> 4.3
Date: Thu, 28 Jul 2022 10:14:26 +0800
Message-ID: <1658974468-10622-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658974468-10622-1-git-send-email-wangmy@fujitsu.com>
References: <1658974468-10622-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 02:14:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98023

Changelog:
==========
- Removed wheel from the set of build dependencies in pyproject.toml (it is
  redundant since setuptools already includes it), PR #652.
- Updated freebsd configuration in .cirrus.yml (with workaround for pipx in
  2022Q3 repo), PR #657.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyscaffold_4.2.3.bb => python3-pyscaffold_4.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.2.3.bb => python3-pyscaffold_4.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.3.bb
index fe4f7e4eb7..027d7b9029 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.3.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "58c7d9ce296cc26ac377061365c2f87cd8e28f46e4fb2c96ee48f9c64e33ac4a"
+SRC_URI[sha256sum] = "1a8c39bbad9abc121d6e126035740ba5f043434abb432f368a3a76596184b3ed"
 
 inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "PyScaffold"
-- 
2.25.1


