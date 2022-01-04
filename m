Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0072C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 03:43:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.2155.1641267808703866669
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 19:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Hconc9lD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641267807; i=@fujitsu.com;
	bh=4bZ8dPhrLZDMuO0uWznFnWgGoRL9f2cDw3WPIJNE4YQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Hconc9lDYrGSKfRmhEStt/6pqOaXydl/No6dbR+/gFIdzwI9jgtDtEr+n2BNZcMU8
	 gsxJlCRE1hlRxXyi7We7eCEnUX7qIIWx3mk8Pks22JSm5NwfL9NlUBPMse8J6rZ1n5
	 yMjoj9oZ8omwTE6tqIYXkTf4aFfagw820MSmI91e237DaICuP0DgX+6WtQBTIXp+xe
	 z82IRnIQ64XIjoIyebEA2GK+YoIXDuJHhHvau8u96bfkg3pHoHVj9ghjC6dMP5PWxG
	 HDody+W4kzarCfNPjBjWdR3szWeeOcklXt/dVraiFc5jYvXZTNVchLZJptd3qGJVdE
	 yq2KpggT7EXOQ==
Received: from [100.115.2.141] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 8A/4D-14524-E52C3D16;
 Tue, 04 Jan 2022 03:43:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYoht36HK
  iwZ8HYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ac87UF07gqnnduZWpgPMLZxcjFISQwg0mi
  58YKVghnN6NEV/Nz9i5GTg42AV2Jc4/XgtkiAvoSS2fvYQaxhQXiJOa9ns4KYrMIqEg8WniMs
  YuRg4NXwENi9bc4kLCEgILElIfvwcp5BQQlTs58wgJiMwtISBx88YIZpFxCQFFi9nR5iPIKid
  eHLzFPYOSZhaRjFpKOBYxMqxitkooy0zNKchMzc3QNDQx0DQ1NdU11jUxN9RKrdBP1Ukt1y1O
  LS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAsMopZj1/w7G7r6feocYJTmYlER5K6wuJwrxJeWn
  VGYkFmfEF5XmpBYfYpTh4FCS4F24FygnWJSanlqRlpkDDGmYtAQHj5IIL88BoDRvcUFibnFmO
  kTqFKOilDgv2x6ghABIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzngEZz5
  OZVwI3/RXQYiagxefkwBaXJCKkpBqYZn1I8/51yjvdrJvpeNhb01LvLJvLK1dOWbi/+9DK+0/
  +/wnZVKbyZBPr1reFuhaWUTtMvDKe1pzuedDtdO9OYPsurgnCb63Znj+x8yzVfbAwTGJGzW4t
  wfW3X1q5LZyje8G+cPue9m3FJ9bwNa15t+yEao24Wnn+f29xa8XyqiM65uLz197gkGxkMFDVV
  Dx/goOtS7lvhtOCvH9XtuxcovHyopujXD7rk0zpo0KamdsmCX9wDv+5TUwu7zzH1JfbwqKepm
  7lMK5+KXareZIk12oFwVU/fk68+NVbbcezg27fvNd6JhVGqHkvOnDti98J1weOOQ+T9ktNPyH
  Tdnfe8kcvXPeXzd3VzLL5FPeuUiWW4oxEQy3mouJEAE2bgjEeAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1641267806!46954!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 890 invoked from network); 4 Jan 2022 03:43:26 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jan 2022 03:43:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2043hPLA009719
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Jan 2022 03:43:25 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 03:43:24 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.30.0 -> 2.33.0
Date: Tue, 4 Jan 2022 20:43:18 +0800
Message-ID: <1641300198-14523-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jan 2022 03:43:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94653

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.30.0.bb => python3-google-api-python-client_2.33.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.30.0.bb => python3-google-api-python-client_2.33.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.30.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.33.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.30.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.33.0.bb
index e1f7040e4..913c3719f 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.33.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d46418a296f8ee309b2044791aeffae512cb1a9d9bfb3def2bfb37058f01c645"
+SRC_URI[sha256sum] = "38e98611794632a12479fafbabe0b5027e8fcfc412e8375f1b23db0bc0209181"
 
 inherit pypi setuptools3
 
-- 
2.25.1


