Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E279EC636D6
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 11:19:30 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.80975.1675768767836230788
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 03:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e/3rPPy1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675768765; i=@fujitsu.com;
	bh=sg4cDFupNpHPBHqZ2ufxqZe45ry4bJ47y4la2SLXwP8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=e/3rPPy1EKE+ll/Ks9davJVkYw8x5TIwNfhoiV76irvrPQmCdgd/1fbQvtvxq4ndv
	 btRh0ClWWRJT5BQN7VFLtVh2CNcmIVY4m++SEo/LIR5l+il0uEaJzEYVs2BQI5HyjG
	 DdrMdnqpmgn7p3yAMzngMWznVpkCXST5y6Re5u/G+6l9Wag2bLNQdHv+W7eQlrbKdE
	 0zczxUxwJLzbScbqRW3R1K0pAwmY2qjF4ImFT7SlWKEqPvYwDG0EJkotO8bF/DY6Q4
	 dtSeNoGznhzj0gIRJoN3YfMf7KQQJ/8j6yIJC0/LmT1Dt9eu6rKzeZ7v9LsW5Mp6hR
	 uGnJ3t9KSg4LA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWXev8aN
  kg+P3JCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozlDToFj0UrLvzqY2pgXCTUxcjFISTwkFHi
  yZ0nrBDOVSaJuatOs0E4exglbs6ay9zFyMnBJiAlceP+fzYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAXuJn5f/gNWwAMXnHHzP1MXIwcEr4ChxY50/SFhCQEFiysP3YK2cAk4S2/72gpULAZU8mN
  PGCGLzCghKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdI10UsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlOKEtB2MrX1/9Q4xSnIwKYny3ld5lCzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  tfLCCgnWJSanlqRlpkDjCOYtAQHj5II7z2QVt7igsTc4sx0iNQpRkUpcV5XkD4BkERGaR5cGy
  x2LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5k3QA5rCk5lXAjf9FdBiJqDFIaoPQRaXJCK
  kpBqY9NQT9uqclrd/ldTyPfpmySP9DdKTS2pdtmQkbOtaKKY/9drs4qMLOEL7G8o09m7+e2fX
  16te3Gvsvh8/VmLvefDzqa0PtFpVtDd8SDX6opj2+VZdTpTdwvxLP1UOFolvFPiVxVci+pHtw
  OIMdZ9T1xdnnLk24+DJi+4de1J3mN7idzxSuPLYGucb35Ql7Et21X4J8jDu/PDs66eXlguPz8
  68wDnlZ/TnRx9Tc6/P23RoScJhqyNZM8QYrk/ecPlO4tpXv9U9N0+dc/yw1++cx/v3r5bmbRL
  uPqLsbbrh8a2/lryGUVN8y5quFlrzn1+1tCZ5b/7W077G7SauMxQqnqfffRh1ge3MjuyrQZ7X
  tFcqsRRnJBpqMRcVJwIAsdoTylgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1675768765!323314!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16582 invoked from network); 7 Feb 2023 11:19:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Feb 2023 11:19:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C841D154
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:24 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BC0EC142
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Feb 2023 11:19:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cmark: upgrade 0.30.2 -> 0.30.3
Date: Tue, 7 Feb 2023 19:19:03 +0800
Message-ID: <1675768744-3871-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
References: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 11:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100959

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  * Fix quadratic complexity bug with repeated '![[]()'.
    Resolves CVE-2023-22486. Add new pathological test.

  * Allow declarations with no space, as per spec

  * Set 'enumi*' counter correctly in LaTeX output

  * Allow '<!DOCTYPE' to be case-insensitive.
    existing spec.)

  * Fixed HTML comment scanning. Need to handle this case: '<!--> and -->'.
    Since the scanner finds the longest match, we had to
    move some of the logic outside of the scanner.

  * Fix quadratic parsing issue with repeated '<!--' (this was not
    introduced by the previous fix, and not in a released version of cmark).
    Resolves CVE-2023-22484. Add new pathological test.

  * Update HTML comment scanner to accord with commonmark/commonmark-spec#713

  * Pathological tests: half the number of repetitions, and the timeout.
    This reduces the time needed for the pathological tests.

  * Shrink 'struct cmark_node' (#446). The 'internal_offset' member is
    only used for headings and can be moved to 'struct cmark_heading'.
    This reduces the size of 'struct cmark_node' from 112 to 104 bytes on
    64-bit systems.

  * Add '-Wstrict-prototypes' and fix offending functions.

  * Fix quadratic behavior involving 'get_containing_block' (#431).
    Instead of searching for the containing block, update the tight list
    status when entering a child of a list item or exiting a list.

  * Fix 'pathological_tests.py'
    - Use a multiprocessing.Queue to actually get results from spawned
      tests processes.
    - Fix the 'allowed_failures' test.
    - Truncate actual output when printed.
    - Prepare for testing pathological behavior of the Commonmark renderer.

  * Fix source position bug with backticks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/cmark/{cmark_0.30.2.bb => cmark_0.30.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cmark/{cmark_0.30.2.bb => cmark_0.30.3.bb} (89%)

diff --git a/meta-oe/recipes-support/cmark/cmark_0.30.2.bb b/meta-oe/recipes-support/cmark/cmark_0.30.3.bb
similarity index 89%
rename from meta-oe/recipes-support/cmark/cmark_0.30.2.bb
rename to meta-oe/recipes-support/cmark/cmark_0.30.3.bb
index 6d6d3e585..6697dfe07 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.30.2.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.30.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
 
 SRC_URI = "git://github.com/commonmark/cmark.git;branch=master;protocol=https"
-SRCREV = "a8da5a2f252b96eca60ae8bada1a9ba059a38401"
+SRCREV = "5ba25ff40eba44c811f79ab6a792baf945b8307c"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
-- 
2.34.1


