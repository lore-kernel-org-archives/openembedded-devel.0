Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EABC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:02:43 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.65538.1680512559059332207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QSx/2SDR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512557; i=@fujitsu.com;
	bh=RJ0SX8NykndXuE/b8ryM/TL2jN16JOfICRFRmKwusnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QSx/2SDRqEa3vDfp8l9PCMlwviOgyLvvjYB8zVQDfTRpwSNC3ELK0yhA68JwgmAyK
	 KW8+JsDufBWEtCbNVWeQZorNLdv7idg9WEwJZyUTvnGEy5fPAT/6Or3VBUO6NuDrrL
	 GHMuwzax52lNXe0A6A/PQQFegLmuO16o5RBABqWTuc4wrhIWT4teI6c9/1XHMxtTQE
	 s2rgQmGH/Xq88CiWHSRIEUy+qVsQtwAQY/BtRwkOpEdSVW5E6TPn4sKpQEgmyzzerd
	 oesqIpWtXTX7pMT/NrMfA+aav83iSbjnehxvwLxXK4yVBisBF4DVAxxAeIReCEmWJw
	 l3elWfaDFO66w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqKszTSv
  F4MkGc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN75xXGggvCFbOfnGBrYPwm0MXIxSEk8IRR
  Yu2G3WwQznUmiQe7JrJCOLsZJS5e3gjkcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAgsezufiYQmwUofvXKDLA4r4CTxM9nL8F6JQQUJKY8fA/WyyngLHFh8Quw+UJANatOdr
  NB1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJBqnH2KCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNTTVSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM35RilvgdjNf6/uodYpTkYFIS5RWs10oR4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7c
  AJQTrAoNT21Ii0zBxhLMGkJDh4lEd7gXqA0b3FBYm5xZjpE6hSjopQ4r98UoIQASCKjNA+uDR
  a/lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ876aCDSFJzOvBG76K6DFTECLW6M0QBaXJCK
  kpBqY9njK+enrsR3TiP5ZvIpNeEtx5NopafkmVbuC4u9kbmVaInXe8V/pZf5LrXNDlxxtzCr3
  vCoiJGVzUuLbtXo5yzkH6gKEry+QDV8rzXq8r8tkzoeV5dy/HvZJPj93d80qTr5TU7zVMsUvL
  ZGUlmv0OvBZ+oPqBGmdG1Pjdlmsf7W3ZOGrjf5vrZoOiHB3PTyw1u+RupRAmfbZwCuHVt2fOk
  XOd/G2PXySRbsdfso+Cr8YuPrrPe5YE+sM1QctFwrPqh17VzHzYm+j0SrOTk/ZyHvqE66FZr6
  ss/ysq79aW78qZfG8c/svnJZOnBL5onc++8QtXzf53jB9b6C70TLWq571zuZekUs1E3+3Ly5f
  rsRSnJFoqMVcVJwIAJbjv8laAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1680512556!438033!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23068 invoked from network); 3 Apr 2023 09:02:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:02:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 70D0F1001B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:36 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 64BB410019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:02:35 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2023.1 -> 2023.2
Date: Mon, 3 Apr 2023 17:02:04 +0800
Message-ID: <1680512525-30501-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
References: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101905

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  Add 'sysroot.bootprefix' option
  deploy: Use 'semodule --refresh' if available
  configure: post-release version bump
  Release rust/ bindings 0.17.1
  rust-bindings: Regenerate for 2023.1
  rust-bindings: 'Sysroot' is 'Send'
  itest-pull-space: Use mkfs.ext4, align to at least 512b
  tests: Set size on fileinfo
  Enable 'trust_return_value_nullability'
  Add docs and fix annotations for ostree-repo-file.c
  rust: Bump semver
  lib: Fix two nullable annotations
  repo: Fix nullability for remote options
  rust: Renerate bindings
  Revert "repo: Fix nullability for remote options"
  rust-bindings: Regenerate
  configure: post-release version bump
  build: Do not include private headers in the introspection
  libostree: Ignore new_and_connect in the introspection
  libostree: Enhance the annotation coverage
  core: Ensure glib standard::size attribute is always set
  ci: update for new kolaTestIso()
  lib/fetcher-util: Wake up main context when a request is complete
  Increase buffer size for create_regular_tmpfile_linkable_with_content
  tests: Ensure non-root users have access to libcap tools
  ostree_raw_file_to_content_stream: Make size default to 0
  _ostree_zlib_file_header_new: Default size to 0
  write_content_object: Don't assume file info has standard::size
  Use g_steal_fd() in preference to glnx_steal_fd()
  docs: Use upstream theme & update to 0.4.1
  build(deps): bump libglnx from '4e44fd9' to '07e3e49'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2023.1.bb => ostree_2023.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2023.1.bb => ostree_2023.2.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.1.bb b/meta-oe/recipes-extended/ostree/ostree_2023.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2023.1.bb
rename to meta-oe/recipes-extended/ostree/ostree_2023.2.bb
index bd566e1c2..299012295 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.1.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.2.bb
@@ -22,7 +22,7 @@ SRC_URI = " \
     ${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96f55"
+SRC_URI[sha256sum] = "ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402bb85"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.34.1


