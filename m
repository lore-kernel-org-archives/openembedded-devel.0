Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31365C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:39:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.81042.1657003153327339091
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VEp9MeMe;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003151; i=@fujitsu.com;
	bh=X3Yz9Vyv+o5SMZINaHlzwyQoITm7aeWCJ9m7EDWPSQA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VEp9MeMetl3MWzAzfG+I8ILP3OjPChZatiuRbY42iZZjPG9cfnO/fKh7MdYkdpsWd
	 j5gQb1d76kRF9+XqrR37s2sFQYiAvl7BLA/bQIXJuQidUTGLNSUXx6dU8zw1dN15qV
	 eb7trXcMz0jpLFQZtZKTQDO/uz7TG7ytva8wzN2/gCg+GiUcYWKZ6pthg1L55wvotT
	 zpEpkQ950YlBWRRYidX6CzCu0N7vzuzfrhUC//6Nc0WErxE3CRFjljm62Ja4/XF8T8
	 tnBP+e2S+OIAb4veugXFXQylJcUtWIt1m3z2jneKbfFT9JwBpga0BJBlg+5OOWChcz
	 1+G1VXRdJqKUQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORpNt/53C
  SwZJOUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN7+WbmgnUcFUeufmFtYLzF3sXIxSEk8JBR
  4tzMjWwQzmUmiTl9X5khnN2MEsvWnWPpYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAX+LRvOlgNgtQfMmnN4xdjBwcvAJOEqt3+oOEJQQUJKY8fA/WyingLPF21ks2kBIhoJ
  KDDaUgYV4BQYmTM5+wQEyXkDj44gUzRKuixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXWNjXXNTfQSq3QT9VJLdctTi0t0jfQSy4v1UouL
  9Yorc5NzUvTyUks2MQJDOKVY0WsH46sVP/UOMUpyMCmJ8sZdPZwkxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYKX+QpQTrAoNT21Ii0zBxhPMGkJDh4lEd4Vp4HSvMUFibnFmekQqVOMuhwzv7YdYB
  ZiycvPS5US5919C6hIAKQoozQPbgQsti8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub9dRt
  oCk9mXgncpldARzABHXGj6gDIESWJCCmpBiZ3o3szOqO0rD65n3xSM1F4gs7+iKB3Qu0hzxI7
  Ra5s33E8MO+fadHU5bvKFW/98D+3l91nQ7pT+hQhHp8PRpN7N2/3nZMivvLVz70Con3li4tu6
  bmFB7gks907dtcmhW9T3P0N741F2lvtmRdecg4xnFKgacWbWclgV8S6xe7uka2GTn+VlHzKf6
  RfmzzrSu5vs7lbJ1tELyxa05259+Diar1OH6nrLCeSM3l/vunbcrhlw4OJwju/GHw3M7kQv3K
  Wit6HAwe2NtR/Uv6zc0Ld2dLSfp3i+/knYlo37Kk8LGCf9umqjJOa9i7H9Z8MT24zd0u80xkw
  4dyjS1rn9Lldd6xiUvJkkntxio250UCJpTgj0VCLuag4EQCMed+WaAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1657003151!237906!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12450 invoked from network); 5 Jul 2022 06:39:11 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:39:11 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 123661AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:39:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 10B677C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:39:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:39:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220605.0 ->
 5.9.20220703.0
Date: Tue, 5 Jul 2022 14:38:37 +0800
Message-ID: <1657003117-14465-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
References: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:39:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97712

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220605.0.bb => ctags_5.9.20220703.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220605.0.bb => ctags_5.9.20220703.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220605.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220703.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220605.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220703.0.bb
index 099b9bdea..fb736db57 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220605.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220703.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "4e9f5df52498777d46360cb610f63d7af1f4b771"
+SRCREV = "787811b6eac03ab81ccf5b6957432d893eb982cb"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


