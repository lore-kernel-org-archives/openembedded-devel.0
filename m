Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E59C64EC4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 10:26:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.9361.1676715964941945248
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 02:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cRAc9fog;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676715970; i=@fujitsu.com;
	bh=ILAxTm2+axXLHDUKb8z3UtPIeqJMLHynKFr14dvGb0Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cRAc9foggmPiXnjmxCygThXfkt2pxhC9PI/wnATrmVa50BOcFWu1yUT0vFIDDy8gj
	 KPXrs0pXIn8KjfdSpYgbHrnWRhKBeJWf/0seMLqtnXWjJFHhan1ah9HOzvk26tKMwO
	 MKlDUQIj4D44efP2htJsSijnRho8mTwCYN2b86TjFDxq6UHgmS7c9xzHcPXMCNvdXw
	 0UH7XlB13PgjU4VLgLmOWVfDvr0+DKn+vqEI+vQo2b/LYeOi21Rliag1zCFT7S2QOx
	 JOeetklsnSXsAx3znh/75BTS2eOQkCOx8TZ/1unFtbaNZ1dRuJ/6B0k7VC+VuDiLgG
	 TEXHQffR73uBQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSffg8g/
  JBu3XJS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozu4zPZCnbwVvxe2MrewPiIu4uRi0NI4Amj
  xMbTT5ggnBtMEicPrGSBcPYySmw69pKxi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9i7GDk4hAUsJP58NQcJswioShxf8IUVxOYVcJKYNL2XCcSWEFCQmPLwPVgrp4CzxJWFq8BsIa
  CaU/v3sEDUC0qcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0K04tKkst0jXRSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxN
  zknRy0st2cQIDN6U4oS0HYytfX/1DjFKcjApifJ+3vY+WYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IEb93cD8lCgkWp6akVaZk5wEiCSUtw8CiJ8FbOBkrzFhck5hZnpkOkTjEqSonzvlsKlBAASW
  SU5sG1waL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3sJlQFN4MvNK4Ka/AlrMBLR4AfN
  bkMUliQgpqQam1gVGFtXOVSum28Z8esJ4S3Tzm/mqMzc+3v+nziGULzi0byVH+xWh97x3Xv6q
  iFP8kWl4P609M8q/937LF9v+S94yU/XWOF/P67JfeDEhSl2/YGeSx7cHl9NY5PkcVjyvSOJvS
  5i4IUFC4M+taZ9D00VbbR8zG298xVg5u3+2WO2K4lmfhX70TQ8z9/jKssE/1PvXCSbW+btUu4
  Tmrbj1/1/+BuvSHW9qD3y5M+NWYrHrXKaISZflkuXryqb2srxy0U27s0ttv90x7WyNV+IPDJT
  /vtPMkRR+9vqHPMuDPZqxPftOHb+fMdt62uHXDrfjFVbemvPw1u6FvcxF+SazmELtPny47qB3
  86sP8+QiJZbijERDLeai4kQAT6zWnlkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-728.messagelabs.com!1676715969!1273354!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19206 invoked from network); 18 Feb 2023 10:26:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-25.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 10:26:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D203B1000DB
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:08 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C557A1000C1
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 10:26:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 7.1 -> 7.2
Date: Sat, 18 Feb 2023 18:25:44 +0800
Message-ID: <1676715946-32075-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
References: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101140

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
  bindings: let ^/ toggle between the 'search' and 'gotoline' menus
  bump version numbers and add a news item for the 7.2 release
  copyright: update the years for the FSF
  docs: give ^K and ^U some useful function in the alternative bindings
  docs: put the binding of ^Y after its unbinding, for it to be effective
  gnulib: update to its current upstream state
  input: disallow bracketed pastes when in view mode
  syntax: html: colorize specially the other two emphasizing tags too
  tweaks: avoid warnings when compiling with -Wpedantic
  tweaks: rewrap an old news item
  tweaks: separate a special thanks from the preceding ones

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_7.1.bb => nano_7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_7.1.bb => nano_7.2.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_7.1.bb b/meta-oe/recipes-support/nano/nano_7.2.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_7.1.bb
rename to meta-oe/recipes-support/nano/nano_7.2.bb
index c60135415..0642287c9 100644
--- a/meta-oe/recipes-support/nano/nano_7.1.bb
+++ b/meta-oe/recipes-support/nano/nano_7.2.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "57ba751e9b7519f0f6ddee505202e387c75dde440c1f7aa1b9310cc381406836"
+SRC_URI[sha256sum] = "86f3442768bd2873cec693f83cdf80b4b444ad3cc14760b74361474fc87a4526"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.34.1


