Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32EFC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:15:37 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.65229.1679544928861845490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yEnAUL0V;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679544926; i=@fujitsu.com;
	bh=wt2M8dkwMMkzrBZ66JhDmujyGSw0gBLtXkLCuuuW29k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yEnAUL0VERDigPh8boXo76Lesj8eCpDTwHBlYcj+cWau33rQLE9U3zTKyuhLMkWWB
	 dDlgcR5yR68KERxs/awGntOTNyBqnXgggXqwvVa7EDSFiPnXGbVPCUVn073kdFW0vl
	 9dmXQb5YwuVwGJifHHROD1qfWphzS7sk8II0L5DoiFS/cSuvIWa0V+Uf6ewRu8b3mh
	 FvUuAMEl6sMAvIJ12Vqi/GylMn3GD4ZTwcGkfEFhAOYTeVdxKXCX19XrgwKTfwV8Yp
	 k5SIPtVoWZFFzLZCFgL0jm19/7xnqSpmC1xW8r1lk+jUwGBK/jlhbsQYf8TI2dLmkr
	 B1tfK8ccCIsWQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqBt3STr
  F4MtFKYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPNnpXsBS+4K85M3cnWwPiEq4uRk0NI4Amj
  xOfO6i5GLiD7OpPEwRm7WCCcPYwSzx49ZgKpYhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAX+Luv4lgNSwCqhIXrrczgti8Ak4Su2ZuYwWxJQQUJKY8fA/WyyngLDF3UjczxBVOEi
  1repkh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVEo3TDzFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpWuglFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGb0px8o8djLv6/uodYpTkYFIS5ZUIlU4R4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MGrcxEoJ1iUmp5akZaZA4wkmLQEB4+SCO/cg0Bp3uKCxNzizHSI1ClGRSlx3liQPgGQREZpHl
  wbLHovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnXEeaApPZl4J3PRXQIuZgBbHzZAAWVy
  SiJCSamDSCrawaS9V7IgOdU2c2PHrZsyqpx2u5y+sOMDme0Fk+V+WvUlbdhxb2SnCF7ThlY6P
  5qx7L+4lMUbe9J8bO78mJj1xg+if8yw/IpUtpLRbr1efOTgzc4PxQUuJ6L+lTRIWtx+G8uT7t
  S3VjNz5e+0dPzVR1suN1k+PHVza5e1ncXxDvt2LxQcYlnJkLgjftfeXj8nxDYzHRRKCZnfIXP
  /3xvWr14peH/0ZFxc1aNg/MnszY2bXBYsPc1K1/Y76OT2fX+c7XTJ79xqN1puhV0TSDjBvVb5
  7oOv3Rb1ejSlyW+z2rLgTlqNa8Wad5YVkl9tWu+8Eq/P7S3epf04y8M2cc/i2q/V179ttFd3C
  u+8psRRnJBpqMRcVJwIARh7IXVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1679544926!58106!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32634 invoked from network); 23 Mar 2023 04:15:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:15:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CC0EC10019E
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:25 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C049A10019C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:15:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argcomplete: upgrade 2.1.1 -> 3.0.0
Date: Thu, 23 Mar 2023 12:14:41 +0800
Message-ID: <1679544881-19951-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
References: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101646

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Fully support zsh. Argcomplete now supports completion descriptions and global completion in zsh.
 Clean up top level namespace.
 Documentation and test improvements.
 Test infrastructure improvements
 Indicate that there is no support commitment for fish and tcsh shells

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_2.1.1.bb => python3-argcomplete_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_2.1.1.bb => python3-argcomplete_3.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_2.1.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.0.0.bb
index 8e77d39cb..3ec271bac 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "72e08340852d32544459c0c19aad1b48aa2c3a96de8c6e5742456b4f538ca52f"
+SRC_URI[sha256sum] = "69db74ba0c72897452f2666267bd76c9cd10829686e99889e6758fac99b23286"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


