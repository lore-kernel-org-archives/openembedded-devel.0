Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCD9C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 02:18:03 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.4259.1634609882278368557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ipk6UAka;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634609880; i=@fujitsu.com;
	bh=nFHMdxUTzIoIZL+FbeVjFLjEV7LPjJWsha/FvVqbtZo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ipk6UAkaS/kFNKf+yvjJc51bKmz8u1+T0wLXpfMs50LrgC/okNZaIqnQt8RZgMH3/
	 oABwT3n8utZkj/XW4umkos1cyPCD92ji5mWYisnBT3cRLLfHuChjQVudJ+t6YIGJx7
	 mxci5Ib/sszXUSps88tvVlJrrV+clG0Rj0AieMjMhdyEGMnlPhgzEYvD0dzpO9nFXz
	 pTo7/E/7BJnF0ZnsepVA0QdCm3EwqhjZpEwGz1RYQs1slWtNAzpeThHccAWj9xHV6S
	 VyonAgtCGMpJ1Hxtv/nnWpZFcUWGoEf154KeY/nZ3JHDK5sxWRoGUoqMp/pHg5Anhe
	 juEZD0qGmfk0g==
Received: from [100.112.196.123] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 91/47-18279-7DA2E616;
 Tue, 19 Oct 2021 02:17:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSfe6Vl6
  iwbSfnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8btE7fZChZJVsyZ+IG5gfGvaBcjF4eQwBNG
  iW3zJrNBOBeYJK63HGCGcE4wShz6fxzI4eRgE1CTmH7rBiuILSKgL7F09h6wOLOAisSL3z3sI
  LawgJXE1mN7WUBsFgFVif9nNrKB2LwCzhLTXj8Ci0sIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25Gaq+QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbzpKLM9IyS3MTMHF1DAwN
  dQ0MjXUNLM10zE73EKt0kvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwIBMKTjisIPx/usP
  eocYJTmYlER5HS7mJgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4O3TyEsUEixKTU+tSMvMAUYHT
  FqCg0dJhPefClCat7ggMbc4Mx0idYrRnuPN2iWLmDna7t0FkjMXHFzNzHG//dBqZiGWvPy8VC
  lx3mxNoDYBkLaM0jy4obBovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNcBZApPZl4J3O5
  XQGcxAZ111TkH5KySRISUVAPTxktP9QVUMjn1lz9hm2/kalFUa/4yvPns35XrrWNPLuoXvTaj
  8KkR59QikY4Odf9D5tuivebLRR/oiCuZ+LTpdMORWtlndTZJ6u0mAjuEXq6+5LjYVGj7KoPu0
  0cuxn9gMDjq+VMsuIPfRFXj9e/C3cFCl947Bu44kH/A7+d8HumLYZw1tlNadr3j2KbQlHP1aa
  CGfF2aR6j6RStBe9+qxVtLfX3+2N0oWLsxtv3s3tdz7/gLvakWiXrLvPD6SalpJw+JuGqdKLs
  p+zmo7Pnhlk09k3YHveHK4fskMGOSY8aHFtvjH59MVX/arvL+UL5cxI6NAv/U36T1pTbHvOu0
  v77o9LHklBS7NYuOLeNSYinOSDTUYi4qTgQAn7x9HmEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-287.messagelabs.com!1634609878!2028539!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1747 invoked from network); 19 Oct 2021 02:17:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 02:17:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B142A100463
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:17:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A40E7100451
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:17:58 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 03:17:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libgit2: upgrade 1.2.0 -> 1.3.0
Date: Tue, 19 Oct 2021 10:17:23 +0800
Message-ID: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 02:18:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93444

New Features
Support custom git extensions by @ethomson in #6031
Introduce git_email_create; deprecate git_diff_format_email by @ethomson in #6061
Deprecated APIs
git_oidarray_free is deprecated; callers should use git_oidarray_dispose
Bug fixes
remote: Mark git_remote_name_is_valid as GIT_EXTERN by @lhchavez in #6032
Fix config parsing for multiline with multiple quoted comment chars by @basile-henry in #6043
indexer: Avoid one mmap(2)/munmap(2) pair per git_indexer_append call by @lhchavez in #6039
merge: Check file mode when resolving renames by @ccstolley in #6060
Allow proxy options when connecting with a detached remote. by @lrm29 in #6058
win32: allow empty environment variables by @ethomson in #6063
Fixes for deprecated APIs by @ethomson in #6066
filter: use a git_oid in filter options, not a pointer by @ethomson in #6067
diff: update GIT_DIFF_IGNORE_BLANK_LINES by @ethomson in #6068
Attribute lookups are always on relative paths by @ethomson in #6073
Handle long paths when querying attributes by @ethomson in #6075
Code cleanups
notes: use a buffer internally by @ethomson in #6047
Fix coding style for pointer by @punkymaniac in #6045
Use typeof GNUC keyword for ISO C compatibility by @duncanthomson in #6041
Discover libssh2 without pkg-config by @stac47 in #6053
Longpath filter bug by @lrm29 in #6055
Add test to ensure empty proxy env behaves like unset env by @sathieu in #6052
Stdint header condition has been reverted. by @lolgear in #6020
buf: common_prefix takes a string array by @ethomson in #6077
oidarray: introduce git_oidarray_dispose by @ethomson in #6076
examples: Free the git_config and git_config_entry after use by @257 in #6071
CI Improvements
ci: pull libssh2 from www.libssh2.org by @ethomson in #6064
Documentation changes
Update README.md by @shijinglu in #6050
New Contributors
@basile-henry made their first contribution in #6043
@duncanthomson made their first contribution in #6041
@stac47 made their first contribution in #6053
@shijinglu made their first contribution in #6050
@ccstolley made their first contribution in #6060
@sathieu made their first contribution in #6052
@257 made their first contribution in #6071

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgit2/{libgit2_1.2.0.bb => libgit2_1.3.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.2.0.bb => libgit2_1.3.0.bb} (80%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.2.0.bb b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
similarity index 80%
rename from meta/recipes-support/libgit2/libgit2_1.2.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.3.0.bb
index 6df42e473f..580fa41c21 100644
--- a/meta/recipes-support/libgit2/libgit2_1.2.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73fa96e40ce64f79bab087c7e1deeacd"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main"
-SRCREV = "4fd32be01c79a5c003bb47674ac1d76d948518b7"
+SRC_URI = "git://github.com/libgit2/libgit2.git;nobranch=1"
+SRCREV = "b7bad55e4bb0a285b073ba5e02b01d3f522fc95d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


