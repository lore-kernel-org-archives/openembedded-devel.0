Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455CBC43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:34:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.25848.1655429640084051878
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cCw3frYv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429638; i=@fujitsu.com;
	bh=RJ8pnlAV0islBXxxSzKEa9lLReUdB032qOEzaqtj4lE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cCw3frYvw5wm4E+9KxoMTc3YW9ZmHa4RXga7zeP/MbpEmnKMXiLfbXnH42+g2yYtf
	 +G4IsJ4UcOyXXf31peySmFGDDs2WsjXY90ieed/SzJryMpfbJxuCubPLOwFIO+e2zV
	 eNNA+PYIhM3yeWCavfyiEU51YoqKv69mUtcOpKN2x7c8gTKtKiGmwJ/HXyYIq0FMlo
	 YYhzohg24bigh++MYjNn3sx3BoESmeLB3Owu9cwk3uuW2XuSa57Hb/xH36fj9o82jq
	 6llCOxyH/GKaXphuVtHlbfJepOKnq/kfQ/2RuaRsd0ptdQqd14QUCRdSlKHsVULk+L
	 uXpPap/ArYhwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWZf11uo
  kg8uHjS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozeC5tZC3qEKt68PMrUwNgq0MXIxSEk8IBR
  4v6NJawQzlkmid59XSwQzklGiQt7rwJlODnYBNQlHt98zQhiiwjoSyydvYcZxGYWUJXovriGH
  cQWFvCROLayD6ieg4MFKL643wXE5BVwl5i6MBmkQkJAQWLKw/dgnZwCHhK75p0F6xQCKnn5YS
  ELiM0rIChxcuYTFojpEhIHX7xghuhVkjix4iMThF0h8frwJai4msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGlrpGBgZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSrH5iB+PTlT/1DjFKcjApifJqHV+dJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mC1+EqUE6wKDU9tSItMwcYUTBpCQ4eJRFe+8tAad7igsTc4sx0iNQpRl2OmV/bDjALse
  Tl56VKifNm3gAqEgApyijNgxsBi+5LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5e0Gm8GT
  mlcBtegV0BBPQEY37VoAcUZKIkJJqYDp+457T9d88D7iZb1fdWFhmyzr3zKbqnSmCaUvPTdB4
  7HY9e0na0tj/ZUy6tVu5J231KOeKy03nO+S55dnhWvsVWTOffZioddonsu/pbdY848vsm1pFe
  5xl+/RlGH3nu8fp5YWZRhXpt+4VLr5sahLJGqgm1D57zhxuMff1lzffjjufI1p18M1HW9kbS3
  2CmowObd5o+8Na8YFF6cJ1FdUuBxqbFy1ZaqY5t6fuEdMnZ/XnwQLfPzlN6CpxFvrte0ZQcdu
  ciIMbZGeWHH6xkJVpxuIP5zKivjw5uPT15FWskjuEeWp0aya/PLa4d61e+LLt88vzpTbtyhJL
  7v/79mP4fNekZ6cmZ+XyvHuRf0GJpTgj0VCLuag4EQBjTaiNaQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1655429637!149334!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23150 invoked from network); 17 Jun 2022 01:33:57 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:33:57 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8019D7A
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:33:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5FC9E151
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:33:57 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:33:43 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.13.9 -> 2.14.1
Date: Fri, 17 Jun 2022 09:33:31 +0800
Message-ID: <1655429612-19310-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655429612-19310-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1655429612-19310-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 01:34:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97529

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
Avoid reporting unnecessary-dict-index-lookup or unnecessary-list-index-lookup
when the index lookup is part of a destructuring assignment.

Fixed parsing of unrelated options in tox.ini.

Fixed a crash when linting __new__() methods that return a call expression.

Don't crash if we can't find the user's home directory.

Fixed false positives for unused-import when aliasing typing e.g. as t
and guarding imports under t.TYPE_CHECKING.

Fixed a false positive regression in 2.13 for used-before-assignment where it is safe to rely
on a name defined only in an except block because the else block returned.

Fixed the use of abbreviations for some special options on the command line.

Fix a crash in the optional pylint.extensions.private_import extension.


bad-option-value (E0012) is now a warning unknown-option-value (W0012). Deleted messages that do not exist
anymore in pylint now raise useless-option-value (R0022) instead of bad-option-value. This allows to
distinguish between genuine typos and configuration that could be cleaned up. Existing message disables for
bad-option-value will still work on both new messages.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pylint_2.13.9.bb => python3-pylint_2.14.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.13.9.bb => python3-pylint_2.14.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb b/meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb
index 1946a8923..d4d2d2c8a 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "095567c96e19e6f57b5b907e67d265ff535e588fe26b12b5ebe1fc5645b2c731"
+SRC_URI[sha256sum] = "549261e0762c3466cc001024c4419c08252cb8c8d40f5c2c6966fea690e7fe2a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


