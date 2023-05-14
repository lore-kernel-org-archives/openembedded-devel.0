Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB55C77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:04:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.66028.1684069457087854304
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IOMUUJSm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069455; i=@fujitsu.com;
	bh=HmTzYYSJgW2e6k9DWciQcBiWzu0JvHSojaddcHmwb9E=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=IOMUUJSmMF3F3mTGFjPVe0h1WkqNsccNwjgml8hMTt6tQXVINQZCyX1RETil8ErN1
	 Bwj+gzTqtHO+G2g9KWJQUFAxa+9a9TVuSuE4ixPX9gAOAYVG7t01t0JPqnYQM/Zk1f
	 orvjiMkjB5j1hv02dYuCIJfpXY5C3Ucr0azHf73sTHjk1Lut1BlS8Iw2RlrqgKjvwO
	 gpGxQQ72wXg7KtlyJ5oEDqUdi9F6xMD57VSz3aNbMbGEqldcyTjgts0iZH+urtj0Qn
	 dYbZRVg7/aOHSdoK3IxVnaIL58I68UftjZCtp5kfm+nd1jgbmFpWzpeydj1vjTIef7
	 V57VIxIgLRujg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRWlGSWpSXmKPExsViZ8ORpOt3JyH
  FYEqzksXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHy6z2mghscFX9O3GJqYPzP3sXIxSEksJFR
  YuuvFmYIZyqTxM72I0AOJwebgITE9L0n2UFsEQFdiY8f5jKC2MwCKhIzJh9hArGFBfwl5q18C
  WazCKhKXF79BayeV8BJ4uKah6wgtoSAgsSUh++ZIWw1iavnNjFPYORawMiwitG0OLWoLLVI10
  gvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uAQok1herJdaXKxXXJmbnJOil5dasokR6OOUYiWGHYw
  Hdv7VO8QoycGkJMp7rSQuRYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr87NhBQhwaLU9NSKtMwc
  YLjBpCU4eJREeOOuAqV5iwsSc4sz0yFSpxgVpcR5D4D0CYAkMkrz4NpgIX6JUVZKmJeRgYFBi
  KcgtSg3swRV/hWjOAejkjAvzw2gKTyZeSVw018BLWYCWnxrTzzI4pJEhJRUA1NSklxsuK2yTH
  /Nx45iKVXrd5+mWejuUi7z9lw8Y6nq39Rdhg0sgsc1hQKsVj+7/+7W9QnGPhPZY0q6Ak3bZ0v
  nHDyeJXa0Yslb43s3nC7vffFLRtT3wxf3pefc+vNb/89PjxV9pxvUGWnavj/j4pklupP+cDyJ
  vmnImqissXT60cNzBEs/H0xOUIg4/jxadXl7//NcfbmS17JXfyS8fnzM4ZBq+OEungvpb/den
  Pjq9SmnCxU7BBOrpLa6zRSVaTi+VYJ9xpme2B7dY3NWdq775nkrWejz5HMvdGO3OhcK1OzP6X
  i1yUL27nuHpkmTL261it6o1zr/3nJb/0/xyX+/7uV/7/Fx1TTNklRGPXklluKMREMt5qLiRAA
  NOV6H7AIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1684069454!255697!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11879 invoked from network); 14 May 2023 13:04:14 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:04:14 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 477BD1AE;
	Sun, 14 May 2023 14:04:14 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6B4D97B;
	Sun, 14 May 2023 14:04:13 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230430.0 -> 6.0.20230507.0
Date: Sun, 14 May 2023 21:03:58 +0800
Message-Id: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102566

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230430.0.bb => ctags_6.0.20230507.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230430.0.bb => ctags_6.0.20230507.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230430.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230507.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230430.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230507.0.bb
index 9ed34de694..b8df3b02b6 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230430.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230507.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "39a017244892394f65a51cdb2ec37a3e29f43a0a"
+SRCREV = "6b06565cd3b9c351835aea80a07efd55a9b2d77a"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


