Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC4FC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 07:30:08 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.3260.1646811006687413461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 23:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QrDtvm3Z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646811004; i=@fujitsu.com;
	bh=CJZCWUKJmI8VwVcy99FP6r0HVAsFOVSQuQ2dRFetVj4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QrDtvm3ZQevz/r9ti/sAUZOTt+5Gy6TfBQdQKqbOgk/Uk8tEdw4MAjW6Nd4Sxs6ST
	 vXlPyLi5PFHCr1z6t6HO/tfySDZ6YeQMNFffXslSDS1w3h1fjun9uKCWgXpHObFjmW
	 HktNYmE/mKeD0artGdcwz+hIBdrJGuv3dxLCmEwKzv9nqw9xnagY1/s4lK6lsGntcM
	 iLAAE/sZw2X01iP7UYTYsbHWK45trbq5iD26zv96ilzM59ASps6QNm1MczySk/KPF+
	 uu1K/zMvyHyN4ix8ZV3TA5Jgi4NjzONPHk3s2TP5SzOC8XWYZ/BqBR7esiCvUla6RK
	 iZ7ROXiYXDCKg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MRolsdrpF
  k8P4hl8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFg/1zWgmfcFa82N7M3MN7j6mLk4hASmMEk
  cXH7FRYI5wSjxKOj39i6GDk52ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64hh3EFhYIk3jUP
  4sJxGYRUJHo3P8IrJdXwF3i/Mf1LCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaJYkTKz
  4yQdgVEq8PX2KewMg7C0nLLCQtCxiZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6prqGhmZ6iVW6Sb
  qpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZZSjHrwx2Mi/t+6h1ilORgUhLllQnW
  SBLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwVsUBpQTLEpNT61Iy8wBBjxMWoKDR0mEty4UKM1bX
  JCYW5yZDpE6xagoJc57FmSmAEgiozQPrg0WZZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCf
  NqgUzhycwrgZv+CmgxE9BiOyM1kMUliQgpqQam1c5PTBXF18W37NZcoTHDekPYXckPn/wDTuW
  vjfteKWV2/tYutX8Mi0Mvm6tKvnFWXfWq7/3svH8uc8Mn1LrPt7jCz8RTLvJyzaKtbywWxNS+
  ZHvXqHy07Xkht+SeBQt6//3JdpOTDleZkfIyKSqIXzNW+YOEzOnFC/j27Gzo3SUqHfbY4fufm
  Lxfk+582Hhg+Z6vBzUMJhsa13Xnmu0Le9hdrXl5p8M8zZuu9s+Od+Z936b892n3geuzBGZ4LH
  P8XumafL6y9fu+WxN2/H0eH3js5nbHvuq02Uv1//C/2l2WV1vXbhywfFXXZjsHtserVU/841t
  r7n5k75mIefeCVnhmfNq340gMo2N4r5PgJSWW4oxEQy3mouJEAPbzhBctAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1646811002!5617!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14162 invoked from network); 9 Mar 2022 07:30:03 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 07:30:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2297TuE6017237
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Mar 2022 07:30:02 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 07:29:54 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/5] [oe] [meta-python] [PATCH] python3-xxhash: upgrade 2.0.2
 -> 3.0.0
Date: Wed, 9 Mar 2022 15:30:26 +0800
Message-ID: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 07:30:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95892

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
New set algorithms_available lists all implemented algorithms in xxhash package.
Upgrade xxHash to v0.8.1.
Drop support for EOL Python versions, require python >= 3.6 from now on.
Migrate to github actions and build arm64 wheels for macOS.
Always release GIL.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-xxhash_2.0.2.bb => python3-xxhash_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_2.0.2.bb => python3-xxhash_3.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_2.0.2.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xxhash_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.0.0.bb
index 01343abc85..ca8ed3b01e 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.0.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
-SRC_URI[sha256sum] = "b7bead8cf6210eadf9cecf356e17af794f57c0939a3d420a00d87ea652f87b49"
+SRC_URI[sha256sum] = "30b2d97aaf11fb122023f6b44ebb97c6955e9e00d7461a96415ca030b5ceb9c7"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.25.1


