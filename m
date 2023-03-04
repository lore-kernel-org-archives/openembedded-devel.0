Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1EFC6FA8E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:10:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.6931.1677928238812844519
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XijhlVD2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928237; i=@fujitsu.com;
	bh=l5n85zw73Iw6D/rZHPfyXLpXRYL5M1SNFiWD3b10bKY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XijhlVD2VZ1Obq+Cd0dr6EVMSyhKlnyEQBtI/pI/sAHbc42s4OH9fjbS3UVy2cTuP
	 zL+Zn+h4i51yDUtSTl7d52h0upsmgMGEGYX/f68cjLiw/qXEdXcdFAUsE0P2+wsCmY
	 1DYa2cZFTizhrGtv/66PMzevkZ9snCrPaw32B5xdJLLCv+pTlkAXy1QogIpgJmfH2q
	 9CCZlL5ZQ2EvLTgQklfyiO2RGOyyGbqleqVE4fycLAy7TvzTAUcXCbOHY47TBLPtcJ
	 Z1Me2pPgLzTd4+Xt585tfQySYtDd4x2ODgXipvBNtpZsAfQsO4V51GIXYGwvs6K22P
	 KeZ3FMYWEkeSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpKutzpx
  i8P6CjcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG0+x5zwQbOiluHW1kbGG9ydDFycQgJPGSU
  6P+yngXCucok8f/ROiYIZw+jxP+P55m7GDk52ASkJG7c/88GYosI6Essnb0HLM4soCLx4ncPO
  4gtLOAn0X1sIlCcg4MFKL6/mwMkzCvgJPHnygWwcgkBBYkpD9+D2ZwCzhJnj55gBbGFgGrmLL
  vGAlEvKHFy5hMWiPESEgdfvIDqVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/AyLS
  K0aw4tagstUjXUi+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB4U4qTz+5gPNr3V+8QoyQHk5Io7yRWhhQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwyq
  swpQoJFqempFWmZOcBIgklLcPAoifBuEQFK8xYXJOYWZ6ZDpE4xKkqJ8wooAyUEQBIZpXlwbb
  DovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHeLCtAUnsy8Erjpr4AWMwEt1jjNALK4JBE
  hJdXA1LZ13wPJP56ll63sdDVOPHP6EXvctn3397tCvV377r3PnpVz9F91y9uaKx3hodNYnj4/
  vFE0oXzG5XzTl9pznpmGaqvvPzxnuWr011CjT7e+rnGw1Pp63OyBRbiDRKepvMKZvtnFPDGWE
  fM/ScUrMKjeW778hfq3pR5n5764t9RV4soH51/yUQyHe+teulUKO04v/SDnsfxU+pVbiUsm60
  4v+y3ybd7f58+mfuBkVY774ab3c9IGva8LT7xnlzySdG4nr7nMqpXKk2PPq07IeymYfCK3QSf
  AjL+qdd6G6HfRJYxbju3eOf3l0QaLY3lMvw7ZnY5iWBr06NQzuzlrZigLpnMllH6SvXxV8IbJ
  +jdKLMUZiYZazEXFiQCH8V6BWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1677928235!666084!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29851 invoked from network); 4 Mar 2023 11:10:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:10:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 621291BC
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:35 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 569EF1B3
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:10:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-nocasedict: upgrade 1.1.0 -> 2.0.0
Date: Sat, 4 Mar 2023 19:10:19 +0800
Message-ID: <1677928222-23049-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
References: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101372

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocasedict_1.1.0.bb => python3-nocasedict_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_1.1.0.bb => python3-nocasedict_2.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.1.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-nocasedict_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_2.0.0.bb
index 319598e3b..a5bc40d6c 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "ac551de692be6aea5b43ac3f2c33780df940013ac6dd0718fb552c8b560ba661"
+SRC_URI[sha256sum] = "33bf7b0ea50eee6bad16dc7400fd89dd2d5379d9ba9cf17634bf2a59ae36ff0a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


