Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FF4C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:29:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.39461.1681115379969110057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Pmat2Gam;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115378; i=@fujitsu.com;
	bh=R2VWxJj3YDUQPtDnqdJRp0J6FP1y/aglDEsfe2j0zLg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Pmat2Gamy61iyov+eXOi6Gzuoq/sMS3fo4TR5WD2r3uw4shly4j57UIPRVHgeKVs/
	 9J88bzRfY+Jzm27KV6Z1TLzlEVCe9NGXmyuOdsMiR+MvZEYHQBe4Ana3hpjjLac0TG
	 FN218zMTx5IpWKINUX73L51R6nXQJ9iE6KrTBVOgm0eJI0f0/TiaVJaDGE9QHv3af6
	 n2BpQbwCOz31tCE00udFZzmTeo4tLpDDGCQKBG/IuJTyvrfk+X2GqMCwCoRb0XcyYA
	 fbcATqteNhKHbRE5YHtdljVS6FhL4duuBVKqG5U+Jj+gH1jRxKfHQ4OgVu9qSNP3L0
	 JsDWmvCrjF4oQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8OxWffjCeM
  UgwmXFC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxdT1QLFnFX/J93hrGBcT5XFyMXh5DAQ0aJ
  1wfmskM4V5gkzs97xwTh7GGUuPfhF0sXIycHm4CUxI37/9lAbBEBfYmls/cwg9jMAioSL373s
  IPYwgK+Esu/3GPtYuTgYBFQlVh7JRAkzCvgJNF3vQesVUJAQWLKw/fMEHFBiZMzn7BAjJGQOP
  jiBTNEjaLE7MvNLBB2hUTj9ENMELaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFuhZ6SUW
  Z6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZhSnPxjB+Ou
  vr96hxglOZiURHm7uIxThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwLjwAlBMsSk1PrUjLzAHGB
  UxagoNHSYS34hhQmre4IDG3ODMdInWKUVFKnLf2OFBCACSRUZoH1waLxUuMslLCvIwMDAxCPA
  WpRbmZJajyrxjFORiVhHm3HQaawpOZVwI3/RXQYiagxVwuBiCLSxIRUlINTN05ly4cDLv8w/t
  X+yRTiy9LP75LTO1v5HKrFs2etOKpf6t10OWs9d7lx3iq2z8dLFtzcP7c3/4+urusLunezlc4
  ceDr2yvb566aGrPY5PYJ/bzGVfuyrNdasZ883nZlQc61S6b+i+4KChwK+NX08PYb/+9vjj4Ne
  nEyz6f+7dp/77arhx09eUbpc9qBdWFepzdMUpSqyT+eLn2K0Xm9q9zseLFrXpcmHjopYjSByT
  zFr06/3GDDtIrcqZExOgWzpZfw7NY+2KRmec22y8xu4RsZgc+8p6eFBS27nHJmW62Z3Yw5W35
  m3zVduFdVOX+D9rXojIY9iSFP3qkoXv/LnZDRV+virdvPH1W9/0fdJk8lluKMREMt5qLiRADq
  PJ3MQAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1681115377!470999!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27222 invoked from network); 10 Apr 2023 08:29:37 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:29:37 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 02FB415F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:37 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EA355159
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:29:35 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.10.2 -> 1.10.3
Date: Mon, 10 Apr 2023 16:29:19 +0800
Message-ID: <1681115363-24418-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102015

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 [bug] [typing] Fixed various typing issues observed with pyright, including issues
 involving the combination of Function and
 MigrationContext.begin_transaction().

 [bug] [autogenerate] Fixed error raised by alembic when running autogenerate after removing
 a function based index.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.10.2.bb => python3-alembic_1.10.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.10.2.bb => python3-alembic_1.10.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.10.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.10.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.10.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.10.3.bb
index 3b3c9a546..6bdc9cf96 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.10.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "457eafbdc0769d855c2c92cbafe6b7f319f916c80cf4ed02b8f394f38b51b89d"
+SRC_URI[sha256sum] = "32a69b13a613aeb7e8093f242da60eff9daed13c0df02fff279c1b06c32965d2"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


