Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56BFC63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:26:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.191365.1673940407504722374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gytqxSMA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940405; i=@fujitsu.com;
	bh=iYncptg4tSF02bltZanwzBNxvFRIXaWyavRAIRP70QI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gytqxSMAVwB4zirLjXlpwc5VA0bSiTJmEA/x6nJ7EPbauFNvHo5HEuD4WJQWWiase
	 7YYPVcS+apKuGhEclcV9JTgD66WnJAsWYNls2lw1Eu3WlS65kArW/nVgPgjCpHx9Mg
	 dVTaGg9d1Iwf7oWsrN7O5KSrxgKEmCRgC1IsJojMJCZ47pwe5Ls6ueWb4tmziM8EtM
	 RuGhAGE+qHVBeBu8mkJ1nBauZwOwx5BuBKrNQiM2Z9pL9RTdm2/lk6llrOdbj1FYV1
	 WOjrTl9EgWPqgd5psw3JtamcXzFqdwaBegV9pxL6ZyAAIPyYHdwszC7pYeO580FmfD
	 oI68iKTfPs65w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSXer77F
  kg56bghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aKvd9YCj4IVOy8tIyxgXE/XxcjF4eQwBNG
  iVnPZjFDODeYJI6sPgbkcAI5exklDm/xBbHZBKQkbtz/zwZiiwjoSyydvQeshllAReLF7x52E
  FtYwFPibucCMJtFQFXi9KHjLCA2r4CTRNenJ2C9EgIKElMevgfr5RRwlmiaew5ql5PEsqmvmS
  HqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxiZVjG
  aFqcWlaUW6ZroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZs
  YgSGbkqxqucOxj9L/+gdYpTkYFIS5T1peixZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvKS+gn
  GBRanpqRVpmDjCOYNISHDxKIrzhlkBp3uKCxNzizHSI1ClGRSlxXkcfoIQASCKjNA+uDRa7lx
  hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8zp6A03hycwrgZv+CmgxE9Bij5KjIItLEhFSUg1
  M4u1ylVqScd0hFa81nTt5Lqr7r1rT7sS+aGdU/v9H2T8kK5f3+CtePFosmJS59vDdK883sK79
  KPPO6PHfsjluU70/Bhu8tnhkLVn04HJfZ73/sxUHPpf9nv14eRbrvJKi02H8J9Z7svimWphOU
  ayXUihkividYVbwSajjx4//pbsf7ZvE+Lez4WHa5eK/7lPXGHyRmc1v+lLTWypJ6zSjR3Jd30
  6VOknJnd82x3pEn+/ex/V+abobI7sDsxr3RLaNx40XvLctqljsn3GfO9azTnKSN3vOa6mt84W
  XKdsvCwn15urifzTPZuHL9eF/02oKzzpO+y3xn73iVuYa0YpDkjoX/cRltr7NK+EoPa7EUpyR
  aKjFXFScCAAU7GJaWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-571.messagelabs.com!1673940405!382226!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14518 invoked from network); 17 Jan 2023 07:26:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:26:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F23621000FC
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:44 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E619A1000D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:26:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tcpdump: upgrade 4.99.2 -> 4.99.3
Date: Tue, 17 Jan 2023 15:26:17 +0800
Message-ID: <1673940378-20528-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
References: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100628

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Updated printers:
   PTP: Use the proper values for the control field and print un-allocated
     values for the message field as "Reserved" instead of "none".
 Source code:
   smbutil.c: Replace obsolete function call (asctime)
 Building and testing:
   cmake: Update the minimum required version to 2.8.12 (except Windows).
   CI: Introduce and use TCPDUMP_CMAKE_TAINTED.
   Makefile.in: Add the releasecheck target.
   Makefile.in: Add "make -s install" in the releasecheck target.
   Cirrus CI: Run the "make releasecheck" command in the Linux task.
   Makefile.in: Add the whitespacecheck target.
   Cirrus CI: Run the "make whitespacecheck" command in the Linux task.
   Address all shellcheck warnings in update-test.sh.
   Makefile.in: Get rid of a remain of gnuc.h.
 Documentation:
   Reformat the installation notes (INSTALL.txt) in Markdown.
   Convert CONTRIBUTING to Markdown.
   CONTRIBUTING.md: Document the use of "protocol: " in a commit summary.
   Add a README file for NetBSD.
   Fix CMake build to set man page section numbers in tcpdump.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcpdump/{tcpdump_4.99.2.bb => tcpdump_4.99.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.2.bb => tcpdump_4.99.3.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
index 0a541acfe..03f1b76f9 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "f4304357d34b79d46f4e17e654f1f91f9ce4e3d5608a1badbd53295a26fb44d5"
+SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


