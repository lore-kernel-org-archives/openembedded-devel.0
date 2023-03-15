Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94176C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:10:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.9032.1678889407838883579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vbr16jra;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889406; i=@fujitsu.com;
	bh=0PJjPoTb0toWmYTiZcADWdqng7jBDcYCnRacuLhAf/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Vbr16jral5I9CvhtbS6ujhojMlCU0AYKOADVbKyy2fnkVHTuUFWneLEIZLXeKsEnb
	 NTlOfdCfaD6xm/ufMsfopQy8tADZSiBSR+xsYEK6UXI7zntV6wC9jqrzZeBP1rCPvK
	 pP2VDKXv86qOcPaUxVCSmTCHTWMW5YQv2TYK732gLGdoTzQuTkGRBkVq3kL6yFZJ2w
	 myhYEoMrrkq+5UedAZSZKXK+7qMpYmiZ06GCIveHP0jLzVh5wuZiX5/1EMssLJssil
	 sVl/9ONuVtmIh0SFeE6bGWBTbuGIO6gQcXd7TITmGRf25//41LiM7y08j+tch3btT5
	 7pRBzj/wSScyg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSXfvRcE
  Ug1m3LS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owVMy6wFZziqpjS85GxgfEKZxcjF4eQwBNG
  ibYVG5kgnOtMEvf62lggnD2MEk9vrGfvYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFfifu/WplAbBYBVYkrE/aB2bwCThKzrjSwgtgSAgoSUx6+B+vlFHCW6F48kRHEFgKqef
  j2ECtEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRtPi1KKy1CJdC72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwU
  vbzUkk2MwOBNKVZ7vINxa99fvUOMkhxMSqK8f9YIpAjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  C26IJgiJFiUmp5akZaZA4wkmLQEB4+SCG/qeaA0b3FBYm5xZjpE6hSjLseHQ1f2Mgux5OXnpU
  qJ8+aCzBAAKcoozYMbAYvqS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZedAZrCk5lXArf
  pFdARTEBH8M4TADmiJBEhJdXAxJew0P9f8KR3u3/sleXym6deoXHsRrGN/LSABd7392sJz+Gb
  /ElzLcvGZa/f7QvgKgjRi3jK32/DdmXLG+6FUgaS9mxM30IulT5qsUi5NlUrLur2Js4a6Ru31
  rYeiTjZxnk+6rPCqzsRQT4my9aY/f6R9OPXehaWc90Ny5VnZcQuL5+3aNXV98qPJq7LUb9QkM
  4huqyeY952lZtq675saT1ua6P842TdoSfbvlo/ecLe9IC5v0fZvFvGX7Rve8ituBVf7tv92HN
  kwsTnVmV8z5U4T1/tDH5xQu3CBp+9kV3n+O/NCHn0haX2i7yfbtz1zU4pKi+7PrGu2jl9wRWb
  FwGzt075IxT0+xhzZqDhpk1KLMUZiYZazEXFiQBK9OwNZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1678889405!377681!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22601 invoked from network); 15 Mar 2023 14:10:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:10:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A0B211000D7
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:05 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9434E1000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:10:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pykickstart: upgrade 3.44 -> 3.45
Date: Wed, 15 Mar 2023 22:09:49 +0800
Message-ID: <1678889389-20817-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889389-20817-1-git-send-email-wangmy@fujitsu.com>
References: <1678889389-20817-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101560

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pykickstart_3.44.bb => python3-pykickstart_3.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.44.bb => python3-pykickstart_3.45.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.44.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.45.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.44.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.45.bb
index 632662c28..b1f26d01c 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.44.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.45.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "6f29ffdb6ed8330ddd21c026576d9fb23dd31c0f"
+SRCREV = "6bd4bb5f411ae98f4d01958534ff937f59c8b2c3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.34.1


