Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC03C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:08:46 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.4641.1655968122613364754
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sbjRuPsa;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968120; i=@fujitsu.com;
	bh=SFZZDHK2jn88az9oQPRBzKwFr3UzBwBli/absxIBOS4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sbjRuPsakDc1amLslUfCUfvDS/9Gqopvjp4ecHonIZPBdBhfmp0bZnXD6rcyG5lGK
	 iEs2DEJI62XiCVggkfKxxsmOJXjPUd9hrfjtCIxETQwq7QgvIHm8rAse/3eaoTgXUF
	 745/Mh0FMKRm4qzvzYihpFGIge58+dHEEGwEf4lqz1AEzX4ulTmykXovWaoEkUPtDl
	 JHrWPOUu1c8gDRRkHEOGDZu9S1EuXJuVAyApcZR2bvznTjlMH2pLuIn5wGyKEgxFDG
	 CHtbGwYneOWvIKW/IWpA1FVKZO01js77lqVXP62Sb4A7Lj/M3h0yuvLFxPYt6mKSXs
	 KypDzeqMtBijA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8ORqFshuCX
  JoOWDosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF65yb2gmVcFV/ampkaGLdwdjFycQgJPGGU
  uLLvHBuEc5dJ4u3MP0wQzgFGiUX3Gli7GDk52AR0JV78WMwCYosI6Essnb2HGcQWFvCTuDinh
  wnEZhFQleh72Q5m8wq4S3xc+YMdxJYQUJCY8vA9M0RcUOLkzCdgc5gFJCQOvngBFOcAqlGUmD
  1dHqK8QuL14UvMELaaxNVzm5gnMPLNQtI9C0n3AkamVYzWSUWZ6RkluYmZObqGBga6hoamusa
  muoYmlnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIHhl1KsPHUH4+lVP/UO
  MUpyMCmJ8j7j3ZIkxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3Ej9QTrAoNT21Ii0zBxgLMGkJD
  h4lEd45IGne4oLE3OLMdIjUKUZFKXHeBjaghABIIqM0D64NFn+XGGWlhHkZGRgYhHgKUotyM0
  tQ5V8xinMwKgnz+oKM58nMK4Gb/gpoMRPQ4ifLN4AsLklESEk1MGUcm2agudpDYZrEnCtPebt
  CvVrve7Ue99QTbcyOsdzatzFX8e4ZZkm21543g0L3eVzLuaAs9XpzzqEb8r/7q903tZt/vfzU
  /u3Oj9v2t9TOVl6Xk2D6lUGow9HxaugrW7agz+uffj9q3tQmbr1SNmCdwPkZL+uWXDnNtLevy
  /aVww1N3ajlM+8mJO46PHer0ozjmb7fbaQmdHqzLVf2i0mJsUvqeLEwnMMtPidZxGyLz8k509
  tfT1dL5FidNlH9/Oz/q/78q99+hcH+x7nu2TGN7r0qPY8SVET9XpzoObaa4aJUTc2t7UvnGwi
  cddCY1aoimHPGg/vEpL7Zok0prbteXFT9tL3JMW7NjIxUHyWW4oxEQy3mouJEAHOWGEI6AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1655968120!42257!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21413 invoked from network); 23 Jun 2022 07:08:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:08:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 266EC100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:08:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1A8D4100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:08:40 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:08:38 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-kiwisolver: upgrade 1.4.2 -> 1.4.3
Date: Thu, 23 Jun 2022 15:08:31 +0800
Message-ID: <1655968111-2522-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:08:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97577

Changelog:
=========
   add support for Python 3.11 PR #142
   do not install tests PR #143
   fix packaging for latest setuptools PR #140

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-kiwisolver_1.4.2.bb => python3-kiwisolver_1.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.2.bb => python3-kiwisolver_1.4.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.3.bb
index 48ff7df52..0280afc11 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f137eeae9cf8004d06830f6ab25b2d52"
 
-SRC_URI[sha256sum] = "7f606d91b8a8816be476513a77fd30abe66227039bd6f8b406c348cb0247dcc9"
+SRC_URI[sha256sum] = "ab8a15c2750ae8d53e31f77a94f846d0a00772240f1c12817411fa2344351f86"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


