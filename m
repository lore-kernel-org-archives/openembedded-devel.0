Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FB5C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:05:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.66299.1680516348848233945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r0lmEOin;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516347; i=@fujitsu.com;
	bh=lx/y9Yw6Gbq0MywyPxqKSUZxROHlCGZDDLSmId01Ip8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=r0lmEOintQLc1cnXBp8SLnD+fbsKTvvabmU/5pC+cLr6eRCSeAvXGdij7/x6SkCnh
	 IlLKv5QRLGVWGsNjW9GxVL5mqeFDM0xVA1IX9WZ4ciPrKAF1Ph+rLjNYMUvXHuPkdT
	 AzIDF+e/4QmegH7ugI5uI3fEeSESaVwA0OWMlH9f4AUprE55/yjMVDExniiYPEP7Z5
	 FQApNI075j0Khaw8OeRuV+W+pfUeq+289m4HJTZxxPN6buIg5vcZFVRzA8ADZV2a80
	 T/fbj9mNxgeRfzPdmqOk90fWY2R3H7zIM1pDIEa/nHrQ7HMRe3I5eKmk4C7p9eOvct
	 /1xltxbhqJO0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWffXEq0
  Ug4trVS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owjf3+xFyzmrPh77xJTA+Nxji5GTg4hgYeM
  Eg8+lHUxcgHZl5kkrq2YzALh7GaU+L91MytIFZuAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MIC/hJfvkxgBLFZgOItLR+Bejk4eAWcJDZMigcJSwgoSEx5+B6slVPAWeLYrmYWiCOcJD
  qutIKN4RUQlDg58wkLxHgJiYMvXjBD9CpKzL4MUS8hUCHROP0QE4StJnH13CbmCYyCs5C0z0L
  SvoCRaRWjeXFqUVlqka6hiV5SUWZ6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFl
  bnJOil5easkmRmDwphQnHt/B+Krvr94hRkkOJiVRXsF6rRQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErzzFgHlBItS01Mr0jJzgJEEk5bg4FES4VVcAJTmLS5IzC3OTIdInWJUlBLnvbMYKCEAks
  gozYNrg0XvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGIgU3gy80rgpr8CWswEtLg1SgN
  kcUkiQkqqgSnXS7W2Qd1z8gSZqMp3n71kpoRsMj5nWcR32l0umu/Yxefy65/Fyluof9D7N/n+
  79CyPxaGcz5mHOxPXKpifnLTUheuc9Eqcpw/JprpLfm6rmj93z91euxZK+ZO9ParelJjmun4x
  m+Gk0OG2kS2r30O2u+XnNc1mq5s6PFU3qaTZeus1WqGu0VPehjMb/lz78DdYG7Llwqim0TN31
  +eOy2Ia9qMS/v2JvhGCW8QMfGJFZmxJcpA1NNAPOP7p9zZyyRKiw0zpDdUFUv/NE3+pTfJpvx
  Zwp4FXYLzVlsmdHFF7eRk+y/4I9f4E+u77v0JR3cJC53eOXXmy0eKan9WZQXxb5dZ/djgV/Gv
  7LxXe5RYijMSDbWYi4oTAWwlnJ5ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1680516346!736493!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15806 invoked from network); 3 Apr 2023 10:05:46 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:05:46 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 13DAA163
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:46 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1165C7C
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:05:44 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-luma-oled: upgrade 3.11.0 -> 3.12.0
Date: Mon, 3 Apr 2023 18:05:23 +0800
Message-ID: <1680516324-30996-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
References: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101922

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix 96x16 OLED panel offset

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-luma-oled_3.11.0.bb => python3-luma-oled_3.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.11.0.bb => python3-luma-oled_3.12.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.11.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.12.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.12.0.bb
index 7ce3570b6..87f7ad663 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.12.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5ec447eb69733e20a55838de7e8cb991"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "81583e77ecb1d3ae04a641b3311082719b7a3149c15a5f2577d9b93b243e9331"
+SRC_URI[sha256sum] = "af97d79fa3481d2c48b7bccfb6de349219f6d814fdc9a3dd075c7b2c71206450"
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


