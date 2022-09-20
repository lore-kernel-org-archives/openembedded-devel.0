Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B21C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:26:04 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.7317.1663640763268547842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FQYl15ET;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640761; i=@fujitsu.com;
	bh=5C5nHz6GoRuqAWupYcXAKVHQfq+MB2j2JKupBrzh7eQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FQYl15ETDWg8jq1DRNuErAuCCd6gpnfzKq/0/pyps9S/uyFDIc6/LrmyjUG1EyHzQ
	 X7h1RRj4jOE01OWtVjmRygbNonug0YEnYc8uzScSdF2UTB/upt3oOCWXvgdaoSQqeQ
	 Jl40Gs4ksxNipyAnpsoiqHnf4lkqBUu3peRPZWuMkf/qMhytU+GdDuTcc/VB76vEFG
	 o2z7I8fYUK2fGmpSyYLsxCME6/Hny/l4B0LaX4Ed9E/tIg3YqjDw/hjb6vS7JloxFm
	 RPkLK4J9NCpWBc9q2kkGqswCyJAC1E7DnGJ2QyqVGqHKGZpszM7w/FOPbNchHgU045
	 VjvNN4G6Zk+Vg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8OxWXeHima
  yQe9HWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP9wm/WgsPcFTv33WZrYNzF1cXIxSEk8JBR
  4talBYxdjJxAzhUmiQNT6yESexglPq3sZQdJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsICvxJkHTUxdjBwcLAKqEnv+FYOEeQWcJBrP3webLyGgIDHl4XtmiLigxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkabpKLM9IyS3MTMHF1
  DAwNdQ0NTXUtLIGWpl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeXWrKJERiWKcXJ
  5TsYt+/7pXeIUZKDSUmUl6tOI1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK+9oGaykGBRanpqR
  VpmDjBGYNISHDxKIrxblYDSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/Np2gFmIJS8/L1VKnN
  dJGahBAKQhozQPbhwsji8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEublBJnCk5lXArf1FdB
  BTEAH3VBRBzmoJBEhJdXANDtmUsLiTrunnz/6POv81mPBJ1Rfc7yryNak023JMv1Hu9P+lW0o
  c+e/6Peq4Lb3xCom7Z3VG2QOeCdnGPKzxOtsvJszc+0Jtcsdd7k3xYqcFOrd/VDsxYItP/9WJ
  7DJucatYucJSfosHt3xUolhguq5h7t3Mz93izystaDd5+GvGw5pcjev3Y6v/jVte2p6cTDHW9
  bmi7LxZcvM7LuU+sQPvNy/v93lhsiZfPOLJffucAlqPjNRVu9z0ZZ9X5/Q8uhJ+Lqn6vHqa0u
  /JBTMiJns+3B9r0j5hJ6EjtSLlk3nNj0W3+xlmRZ/tEn/00k/C6f9H/++UPsdG8Pxzmb1v4J6
  yyPaybOWGHsZHrihxFKckWioxVxUnAgA0ZJM4l4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-732.messagelabs.com!1663640760!316568!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4033 invoked from network); 20 Sep 2022 02:26:00 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:26:00 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E5034156
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:25:59 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D7B9B152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:25:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:25:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-fasteners: upgrade 0.17.3 -> 0.18
Date: Tue, 20 Sep 2022 10:25:45 +0800
Message-ID: <1663640745-27707-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:26:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98888

Changelog:
==========
 Reshuffle the process lock code and properly document it.
 Revamp the docs and switch from sphinx to mkdocs
 Remove difficult to use tread lock features from docs
 Bring back support for eventlet spawn_n
 Remove support for python3.6. It should still work, but is no longer tested.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fasteners_0.17.3.bb => python3-fasteners_0.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fasteners_0.17.3.bb => python3-fasteners_0.18.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.18.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-fasteners_0.18.bb
index 51691b7593..5f63891748 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/harlowja/fasteners"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-SRC_URI[sha256sum] = "a9a42a208573d4074c77d041447336cf4e3c1389a256fd3e113ef59cf29b7980"
+SRC_URI[sha256sum] = "cb7c13ef91e0c7e4fe4af38ecaf6b904ec3f5ce0dda06d34924b6b74b869d953"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


