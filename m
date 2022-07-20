Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E20C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 01:02:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.48537.1658278926730529734
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 18:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kl/0RRd3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658278924; i=@fujitsu.com;
	bh=NV/X+AeJY4wY6VcXOa2LCw9nk8bf+ZUb/EQZKLAYTK0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kl/0RRd3vTCMaLsWYiNmgc4s1IIL0qOJKMMRnerRyfAzhrq3TrGTA4fwiSyJGR4U0
	 vtAy4q2ZNgvsmbxluvXRqr0fTlvrSiLOjUECbM8wSS5lsNDF5t+7Lt5U2PCI3yCM12
	 iS8bV8bY5QapbWIXZ5IrSCnBL34xEA+akz75OQrzyVCjHyRfi5vekYvK4vGVEZTk7a
	 b/ZoCkbdF7eLNVdw7Gmv7T62MPRO2ybIKAVZGY/QA9v2tRWOvYxW+UNSZzZV3j0M6y
	 jiEXjrM7j8GrafRpi7AszpAcporqG80mHSjHNuEU7b2Z/wa17YDeCwRwDfb/WVZha4
	 EmC7G1DOKcoQw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpMsTcj3
  JYPIdFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNXyxW2ghecFfNvdLI3ML7m6GLk4hASeMgo
  0fH+OFsXIyeQc5lJYlOXEIS9h1Gi9TkjiM0moCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sI
  LawgKfEoz2LwepZBFQlTh+7ChbnFXCUeHN6IVivhICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AyD8LSfssJO0LGJlWMdokFWWmZ5TkJmbm6BoaGOg
  aGprqWloCKUu9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzUkk2MwLBMKU4u38G4
  fd8vvUOMkhxMSqK86f+vJQnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4N0fdD1JSLAoNT21Ii0zB
  xgjMGkJDh4lEd6rgUBp3uKCxNzizHSI1ClGY46rV67sZeaY+bXtALMQS15+XqqUOK8fyCQBkN
  KM0jy4QbDYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHchyBSezLwSuH2vgE5hAjplktM
  VkFNKEhFSUg1Mu332zZrYcqh81etzd/NqHvYvYREM2pj04r/QdrOL089siJwy01mrMS48K7N6
  qUXAmxAVJYlfiow/Qg90sFrfOhXG/OLWpSuPbDfscZPJ8ZHYw5Rx6+NFhZ3M06YfsSiPunvMO
  XJi5UPBBQs1NU4a7f76uyXSf5nF87lvz6/YWCjzaJ6pyMc3/Cfm3Tn+R9Ij/OC7gLbk1rvnPf
  evvnHfaMveyKVl8V+31Nh67HWebvQgV2qB9GOrNCdZXUVff0mTZeET7NdtqszLznksf3V6tWF
  +esn1ysrKplOPs0NcJe2drPI+cOqtXHlFw2v5kieW0cfF5q4ss9l75m3poVVH6gRjWTJm2efx
  v1ra7zUnS4mlOCPRUIu5qDgRAG0OfjNYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1658278923!374211!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29093 invoked from network); 20 Jul 2022 01:02:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Jul 2022 01:02:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7E4A91AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:02:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7307D7C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:02:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 20 Jul 2022 02:02:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH v2] ndisc6: upgrade 1.0.5 -> 1.0.6
Date: Wed, 20 Jul 2022 09:01:47 +0800
Message-ID: <1658278907-9714-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Jul 2022 01:02:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97905

Changelog:
==========
# ndisc6: print NAT64 prefix if present.
# rdnssd: fix timeout calculation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/ndisc6/{ndisc6_git.bb => ndisc6_1.0.6.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_git.bb => ndisc6_1.0.6.bb} (97%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
similarity index 97%
rename from meta-networking/recipes-support/ndisc6/ndisc6_git.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
index f5467794e6..6861314a0a 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
@@ -5,8 +5,7 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PV = "1.0.5"
-SRCREV = "b706f5f01aa82aa0db678fffd15a1527f330c507"
+SRCREV = "7e314b23329f9c24c4c097b8513673fed7e7158a"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "
-- 
2.25.1


