Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1612C6FA9E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:03:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.6823.1677927814919066142
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dzy/efHU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927813; i=@fujitsu.com;
	bh=VspN0g/L41mL9zDN9h1uqPZUjbd6sonR+YT5NemcoPo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Dzy/efHU/1MHX1oFmwF4plg+SQ0EvMvHocEg/SDaxBWt/2XrU5oBaxmN0ruRBVIN0
	 sUaqpC+fmmTB+a1DJhzEu5VVutL5sRAZqcIlwHqwQfiyRc7O91QJ8al+uKTu/AhmdC
	 HDkeBvtv3UX8KlYa3CldVsGnyF4FrTqlblzlj3GKjMWBj1AFfA5Ujnecar2phsTs4L
	 7YDVn0TMZ2xhgaVIOTl+psHP2pESu6ip7qXYENXmShkzVjhuWYmNlx4xdEcbgDEOvk
	 oeH5nEciiconq07+ZxhKzhX9Bm4+JM+Sv79U6vVaBD+Acp+hfOz1dZJrZpPhMMVQJH
	 AfR3gJ5HJe+Iw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSbdFlTn
  FYNF+eYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePnrCesBf94K+bf2M3awLiCp4uRi0NI4Amj
  xMqF11khnBtMEqsWHGeHcPYwSjyYvRnI4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphARuJHx9esoLYLEDxHz+XgNXzCjhJXHmwG6xGQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0
  SNosTsy80sEHalROuHX1C2msTVc5uYJzDyz0LSPgtJ+wJGplWMpsWpRWWpRbpGeklFmekZJbm
  JmTl6iVW6iXqppbrlqcUlQJnE8mK91OJiveLK3OScFL281JJNjMBgTClW7d/BuLb3r94hRkkO
  JiVR3kmsDClCfEn5KZUZicUZ8UWlOanFhxhlODiUJHg5FJlThASLUtNTK9Iyc4CRAZOW4OBRE
  uHdIgKU5i0uSMwtzkyHSJ1iVJQS5xVQBkoIgCQySvPg2mDReIlRVkqYl5GBgUGIpyC1KDezBF
  X+FaM4B6OSMO9/kCk8mXklcNNfAS1mAlqscZoBZHFJIkJKqoFp+4yNXdOm5+4+W+aWbV+41vt
  0vmOqc1yIviTvDinD23X5ubzv2lM5nXr0l3dcjzT8OHfWIY4lU4u9ztbVsfv97eRylOgps+YV
  TYg5t/fXvuLE6+tLc4PPhgm8ZIhJ+DlT0SRB5wrXvnZnG82PDAubVs8613LJw5lxtkU1U+eF6
  WZ/bjJzslRzpxdfqMku5llXuC6/KyZgmfqtKX7vj79mbDuspmHgdeVye/4jiacvRF6XfD2w84
  7xuuf7/t+/9058bvLF1SJ8Uu8dvme3pxxrD1cL+niRNzGY+Ze+ZOVPKekVfTEshX79SxaWVlz
  l27tcxXtT7SMFnjBd7+rzLU93rXbfcO+j88ujU1k1qpVYijMSDbWYi4oTAaap1AhBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1677927812!243931!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22716 invoked from network); 4 Mar 2023 11:03:32 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:03:32 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3A78F1000FB
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:32 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2E8421000F5
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:03:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bats: upgrade 1.8.2 -> 1.9.0
Date: Sat, 4 Mar 2023 19:03:15 +0800
Message-ID: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101356

From: Wang Mingyu <wangmy@fujitsu.com>

Added:
=======
-add installation instructions for Debian, Fedora, Gentoo, and OpenSUSE (#659)
-add --line-reference-format to switch file/line references in stack traces (#665)
 comma_line (default): file.bats, line 1
 colon: file.bats:1
 uri: file:///path/to/file.bats:1
 custom: define your own formatter in bats_format_file_line_reference_custom
-add bats:focus tag to run only focused tests (#679)
-add bats-support, bats-assert, bats-file and bats-detik to Dockerfile (#674)

Documentation:
==============
-add --help text and man page content for --filter-tags (#679)
-improved clarity of section about output in free code (#671)
-fixed typos (#673)
-clarify use cases of run (#366)

Fixed:
=======
-explicitly check for GNU parallel (#691)
-wait for report-formatter to finish before ending bats' execution,
 to fix empty files with --report-fomatter junit under Docker (#692)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.8.2.bb => bats_1.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.8.2.bb => bats_1.9.0.bb} (94%)

diff --git a/meta-oe/recipes-test/bats/bats_1.8.2.bb b/meta-oe/recipes-test/bats/bats_1.9.0.bb
similarity index 94%
rename from meta-oe/recipes-test/bats/bats_1.8.2.bb
rename to meta-oe/recipes-test/bats/bats_1.9.0.bb
index 74e683e58..a642d7cf5 100644
--- a/meta-oe/recipes-test/bats/bats_1.8.2.bb
+++ b/meta-oe/recipes-test/bats/bats_1.9.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "\
   git://github.com/bats-core/bats-core.git;branch=master;protocol=https \
   "
 
-# v1.7.0
-SRCREV = "e8c840b58f0833e23461c682655fe540aa923f85"
+# v1.9.0
+SRCREV = "6636e2c2ef5ffe361535cb45fc61682c5ef46b71"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


