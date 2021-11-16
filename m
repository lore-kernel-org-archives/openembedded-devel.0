Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC8BC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:36:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.5241.1637033788811806295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dzUxmxUj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637033775; i=@fujitsu.com;
	bh=Yk30YPXoigBLughonzr8j6GEmDL3k9TvYktJhDntJwE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dzUxmxUjkc1UT601sICaMQVVoq1Pk07rBc+mLYsw/qFm4IsEVUvnO9y61Okk+lwV6
	 GUmcZzTpd2sq9tbFlrpii2zn4Bq7X8rIgyX958sdmhOjOPEZtVo98fZrYyXlZvZFP1
	 RVgslhw6ObiyrXNwsKoA6e5TNMAelKo1In7auM5375ThA/lN2P+pkv3uS73xRNGUnj
	 IYrgJDbjmTmSrQ5VS5sJqH3+J+oolVjg1P+MbwlffMh0MHbPkRRk5CWUZVHPz/pfVt
	 fn1/Ocl1y41zx+HodVYLY0OUjFjJ9iz4giq1/QpQtgzdBsmFpufSytoeBs4xsK4tEw
	 ykG+Jm08uk7EQ==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 19/99-02703-E2723916;
 Tue, 16 Nov 2021 03:36:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRVdPfXK
  iwZ/1chYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ayQ29ZCxqEKz5fK2lgfC/QxcjJISQwk0ni
  1JXqLkYuIPsEo8S3y1PYQBJsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILC3hIXL43E
  6iGg4NFQFXi+78kkDCvgJPEy5+zwFolBBQkpjx8D9bKKeAssXnhAiaIvU4SN5fNZISoF5Q4Of
  MJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVxjSBkX8WkpZZSFoWMDKtYrROKspMzyjJTczM0TU
  0MNA1NDTVNTbVNTIw0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzIlGLl
  MzsYP136pneIUZKDSUmUN27RpEQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryPVCYnCgkWpaanV
  qRl5gCjAyYtwcGjJMIrpwiU5i0uSMwtzkyHSJ1iVJQS530sApQQAElklObBtcEi8hKjrJQwLy
  MDA4MQT0FqUW5mCar8K0ZxDkYlYd75qkBTeDLzSuCmvwJazAS02P5eP8jikkSElFQDE4fdiQa
  Fyk1z9y7z5hQ6bMz8qbBDZFWxyoJ+zzI2xQlBF2o3b4//5HRm09qahuLau3sMTzNarvw1/SRT
  Matw7Ysga/krvNYbTy+OmNE/4Rt/oFDpJiHVEw3Xd/uddBX6rML04Zzd9w0md79dd5nsy+jCK
  PK3/plaoH5Fa+RK39CfZrMWTGFa9u3P6spWG9ckITmuvHLhF3bGNT8dip47dKRJuwlL39ATr1
  Z7tPL8qvMHGD+8OS8m+CaD4W5i1vkv6hPbv3jOnOa75k+JZv8953dH193tn5DLoen0tCnn8tW
  iF18Md0TLtjhvsjad4n1P+1l61dIJ/XErnFVjJxt++T3hSp+g/vs1W+fmWL/7qMRSnJFoqMVc
  VJwIAA4rL4hDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1637033774!523199!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7166 invoked from network); 16 Nov 2021 03:36:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 03:36:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AG3a6iR025393
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:36:14 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 03:36:10 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmd2: upgrade 2.2.0 -> 2.3.0
Date: Tue, 16 Nov 2021 11:35:55 +0800
Message-ID: <1637033756-81253-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637033756-81253-1-git-send-email-wangmy@fujitsu.com>
References: <1637033756-81253-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 03:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93966

Bug Fixes
Fixed AttributeError in rl_get_prompt() when prompt is None.
Fixed bug where using choices on a Settable didn't verify that a valid choice had been entered.
Fixed bug introduced in cmd2 2.0.0 in which select() converts return values to strings. It should never
have converted return values.
Enhancements
Added settings to Column class which prevent a table from overriding existing styles in header
and/or data text. This allows for things like nesting an AlternatingTable in another AlternatingTable.
AlternatingTable no longer automatically applies background color to borders. This was done to improve
appearance since the background color extended beyond the borders of the table.
Added ability to colorize all aspects of AlternatingTables, BorderedTables, and SimpleTables.
Added support for 8-bit/256-colors with the cmd2.EightBitFg and cmd2.EightBitBg classes.
Added support for 24-bit/RGB colors with the cmd2.RgbFg and cmd2.RgbBg classes.
Removed dependency on colorama.
Changed type of ansi.allow_style from a string to an ansi.AllowStyle Enum class.
Deprecations
Deprecated cmd2.fg. Use cmd2.Fg instead.
Deprecated cmd2.bg. Use cmd2.Bg instead.
Breaking Changes
To support the color upgrade, all cmd2 colors now inherit from either ansi.FgColor or ansi.BgColor.
Therefore, ansi.style() no longer accepts colors as strings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_2.2.0.bb => python3-cmd2_2.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.2.0.bb => python3-cmd2_2.3.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.2.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.3.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.3.0.bb
index 2632ce1c80..0cc8e9ce50 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4c527bcb481233ebcb803de975f42701"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "34cd12424d9e2835eff125146af3d9f4a4c2931c6bc5a3cea9790bd4f55756d9"
+SRC_URI[sha256sum] = "2493ab8e5baab3d1a0325ea50920674a63de41bee4c63a634ac5cb42bfd63c1b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


