Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775AFC00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:12:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.13523.1660543946635700827
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lf8NnVjP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660543949; i=@fujitsu.com;
	bh=WbnG7QgkheOASAWouDIwEu9GRoPLh0049W84/+C4ObU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lf8NnVjPQ7YBqHPk88uBycwsV6TrqsmBSgl4/kIw8j5jFmBQ4+Vyt1aDTelyymY0o
	 JwMetS3j4gSVLNaw+DgHpXoxOoZJxsM0jUwlSOv2Q6sIPtku26TEloHsUIg2eIBgWj
	 oGWmVbHM8pGL/Et13UoIKIk7zEi6+vLcwOYjbTx2w1EVJyOKtNkFR+LUTusU8ubzqU
	 VlO5VATa/h1lcfE9WchRd70D0nf6l0yAO1gTASyWBH+GE2FIx9TPlclyyPJTrbFsW7
	 xjteHmIssGIQqL34hKm2KQbWkcjgFtG1B8tQrkDs6Y/FrmF4icSwL21a9G6moExdum
	 ysj0s/ym4r8Rw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWffs459
  JBjs2sFtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlvz71kLNgmXPFkZRdTA2OnYBcjF4eQwANG
  iVmnLrJCOJeZJL6cucTcxcgJ5OxhlHixOwzEZhNQk5h+6wYriC0ioC+xdPYesBpmARWJF7972
  EFsYQFbiavdm9lAbBYBVYkF6/eB1fMKOEqc3NDNAmJLCChITHn4HqyXU8BJ4uK9nawQuxwlfm
  w7ywhRLyhxcuYTFoj5EhIHX7xghuhVlJh9uRlqToXEjBnb2CBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNTXUNTSz1Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WK
  K3OTc1L08lJLNjECwzilWHnqDsbTq37qHWKU5GBSEuW9dvFnkhBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJXjNgZAgJFqWmp1akZeYAYwomLcHBoyTCu+A2UJq3uCAxtzgzHSJ1ilGXY+bXtgPMQi
  x5+XmpUuIQMwRAijJK8+BGwOL7EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXvdHQFN4MvN
  K4Da9AjqCCegIvbvfQY4oSURISTUwqT1OvbVjll/K+8aO5xf3rKst4vlqmL/uYMoFk4aJabEC
  Uyf/yrfSDfKdcHHRz+tyBautBFdlTjC9zbP25eKmCYcOT/O2PGL+U+/bkSl3HqSrua89Ya1/O
  F925uZ5TBVc6QdXXAzXnBtZFl5os1Bu0anFyo5lSqWuljP3Ta+MOcZpnBkxTdT3unjThHApiY
  pJrJGrDpaycphPPxDHHNrffktlFd9yV/sePrsOv/W7RI9L+AdsfH5rg/b5xSfm7YyRWMbDri4
  jyZjOs0V9zrUg/XqOIMP5c8PXn0+++uCcbNv6HQd3GTVoM2+eJPuMgY9X+QtPmytb2d514g9n
  Pnbm8nBZtVOg/FBrS4vBp5ndSizFGYmGWsxFxYkAOkv7qWoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1660543948!481453!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20235 invoked from network); 15 Aug 2022 06:12:29 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:12:29 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CE65875
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C1F0273
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:12:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] icewm: upgrade 2.9.8 -> 2.9.9
Date: Mon, 15 Aug 2022 14:12:05 +0800
Message-ID: <1660543925-1319-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
References: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:12:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98237

Changelog:
===========
-Permit percentages to have comma's in icesh.
-Keep accurate track of window changes in workspace buttons for
  PagerShowPreview.  Only redraw affected workspace buttons, which reduces
  the total number of workspace button redraws, especially for larges
  number of workspace buttons.
-Add key bindings for single window tiling operations for issues
  bbidulock/icewm#335, ice-wm/icewm#74 and ice-wm/icewm#84.
-Complete -e option.
-WindowMaker dock apps are supported.
-Support more HTML entities in icehelp.
-Remove dependency on asciidoc and prefer markdown format for the manual.
-Prevent warnings.
-Also install markdown.
-Try srcdir.
-Cleanup test and prefer markdown manual.
-Cleanup key grabs.
-Drop obsolete wmOccupyAll().
-Accept either markdown or asciidoc to generate manual html with CMake.
-Add markdown and icesh.
-Automatically detect and prevent race conditions in icesh relating to
  moving and sizing windows for issue #335. Improve the accuracy of the
  "sizeto" command in icesh for issue #335. Add "extents" command to
  icesh. Add "workarea" command to icesh.
-Get rid of the frameContext.
-Prefer findClient in two cases: unmap notify and recv ping.
-Merge remote-tracking branch 'upstream/icewm-1-4-BRANCH' into
  icewm-1-4-BRANCH
-Merge branch 'icewm-1-4-BRANCH'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_2.9.8.bb => icewm_2.9.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.9.8.bb => icewm_2.9.9.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.8.bb b/meta-oe/recipes-extended/icewm/icewm_2.9.9.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.9.8.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.9.9.bb
index 2c7ede7725..ecb0dbe73f 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.9.8.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.9.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "8d5d0f78a49c952f7f185d0f6713c6fabba597dcb713b1ac92e0e5795db29a25"
+SRC_URI[sha256sum] = "af7bab3472189febf50753eaecfac586901419d282cbcbff92e860d4b74894b3"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1


