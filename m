Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446F9C48BD2
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.26490.1650872530163926753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TYklr+B6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872528; i=@fujitsu.com;
	bh=jgfIFlDH/cFFoV8VpFDotg9v8rfdYrwHj7yeI5ujm7g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TYklr+B6ZQfyI35yzcTtJBvlcb1xKBvfd+RTZ7ZEsPTBqP/Pf0Js3M7s3SoXEJ09v
	 qxYKG88PG5RcEm7D8DGHcCkGGVcgKFCTfcKIKEKta6KBnLJ6gmBSlJTUfEEJ8cbwR6
	 WBlRyQZHBzOjyxy4z60JkFWknqccyfdYbgBhXpiOfMhf73MZVFDR7HQlMv/y9GmyW6
	 kp+vWqQXsPT38r1L1yTmz4lEAMFgVeRkMxemnTjlwfE7d0Xp+7ALameMs8Rp+VKTg7
	 zdw2UBmeNL73MBl4iMCpH+skb0oDKzshN/I43sMkXqpmqu2sBf2FjjUn5qFI50NB6y
	 LL7yAf/qvCkgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSfdCQFq
  Swb6brBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bn+3eZCqYJVHzd8pitgfE7bxcjF4eQwBNG
  ia1Xz7FCOBeYJCZuXsMG4exhlHh+4z1TFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICThI/zp4Fi7MIqEr0TVgCZvMCxbuP/mABsSUEFCSmPHwPFucUcJZ40twBFhcCqnl0fy
  pUvaDEyZlPWCDmS0gcfPGCGaJXUWL25WaoORUSs2a1MUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xWicVZaZnlOQmZuboGhoY6BoamuoaGwGZJnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGBnFKskLGD8fvKn3qHGCU5mJREee+ZpCUJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uDd7QuUEyxKTU+tSMvMAUYVTFqCg0dJhDfdGyjNW1yQmFucmQ6ROsWoKCXOywWMRSEBkERGaR
  5cGyySLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n3nDzSFJzOvBG76K6DFTECLP9Wmgiw
  uSURISTUwVX1JfxyzobZNKuKJMv+SkL9vl8tsUfE+Yc/ixnlCmz9frP3Q9jX7Wk1tr/Iy+Peq
  L9rvs+CLr4f+BZbLmmESOrPzD3hEHpkhxvp2z5QJk10Lde1Yn/mEvDiXUX/3TIfsXv/aM+mnX
  zv5vn4qIBbfdDurlZV/wt3lxxvN1vXcu3zU4kZc0abdpYsbLFTap29XuqqwbE2g5gxJZce2x8
  8uyMdH5kVJyxenOEif/ihrsKo2ouLx86SuXtv0Z/V1xe9lJ9Tsj3Oz5VAr6NmzePZLTsO1b84
  wlu7X0GAoqt07lztgy41r19i+3o1vzDbrXG7nIaJtkv6zJn+v3F+3iYnJ/y8yG7vc6T6iO1fF
  bosSS3FGoqEWc1FxIgBeIae6XwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1650872527!306410!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3463 invoked from network); 25 Apr 2022 07:42:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:42:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A1A6B100458
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 84F3A10044D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:41:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] openwsman: upgrade 2.6.11 -> 2.7.1
Date: Mon, 25 Apr 2022 15:41:27 +0800
Message-ID: <1650872488-31555-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
References: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96779

Changelog from 2.6.11 to 2.7.1
==============================
- Bugfixes
  - fix regression introduced in 2.5.0, __cimnamespace selector
    was not properly set in requests.
  - fixed several compiler warnings
  - code cleanup
  - general code robustness
  - msvc build fixes
  - cleanup passwords after use
  - drop RANDFILE in owsmangencert.h
  - fix potential NULL pointer dereference
  - MinGW build enablement

- API change
  - client_opt: expiry and hearbeat_interval are float
    wsmc_set_sub_expiry() and wsmc_set_heartbeat_interval() change their
    first parameter from int to float
  - bump so version of libwsman_client from 4 to 5
  - new functions for C++ bindings: OpenWsmanClient::GetWithFlags()
    and OpenWsmanClient::PutWithFlags to add a 'flags' parameter
  - add FLAG_SUPRESS_100_CONTINUE to options, fixes #131 to workaround
    a curl problem. Reportedly curl 7.69.0 fixes this also in curl.
  - fixed several compiler warnings
  - fixed spelling errors

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openwsman/{openwsman_2.6.11.bb => openwsman_2.7.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.11.bb => openwsman_2.7.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
index af0a3c2bd2..7fc5d4218f 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "d8eba6cb6682b59d84ca1da67a523520b879ade6"
+SRCREV = "6cdf3bee50388d8e5f70850322a4df57fd685a5e"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=master;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
-- 
2.25.1


