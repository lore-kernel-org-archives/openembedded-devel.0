Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6987C678DB
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:03:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.6899.1677927824781204716
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IOwmWCJp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927822; i=@fujitsu.com;
	bh=2KxmPYSXHVY0x4cg5nH2KF9BPJyO6ZFGOyQ3fADtPHA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IOwmWCJpebqLgH/xl/zC72xAnY+4s6kHuKZaVkYZX8cIOlRPk0M5Si/l7uYWfcD6a
	 d4009hzywDIQh3MawaNwRYZjfWzYkyg4vyl+Y3GVwgqiBKPkjdie9u+UTDf3ge249z
	 4ytCuw3cq0tnWrBphC/rJLzAHTdbPARP2FDoQk2C34OYWOk4Fe5airs0eLLw/ulwQB
	 fkWaIw8bMTh6wTeHmE2oVA1Iqr0zBiV4UzMKlvcyeTlpWSoimSRfAiudHNfW7rde8x
	 bkEpgh7mWvLhIsDYWqEoDmeWcUcYuOdt08o/ptZhEEbMXcGo9jQ4QV7eno3hWsB/IV
	 nRuH9QPuRCROg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpNurypx
  iMKfZ1uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdi/4QBrwWuRiv8Hp7A3MM4T6mLk4hASeMgo
  0bF7EjOEc5VJ4tn0yYwQzh5GiVVXH7N0MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgIPF07hGwehag+JF168HqeQWcJE72/QOrkRBQkJjy8D1YL6eAs8SLi3/BbCGgmrZVhx
  kh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7QsYmVY
  xmhWnFpWlFula6CUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWl
  lmxiBIZvSnHyjx2Mu/r+6h1ilORgUhLlncTKkCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgpdDk
  TlFSLAoNT21Ii0zBxhLMGkJDh4lEd4tIkBp3uKCxNzizHSI1ClGXY4Ph67sZRZiycvPS5US5x
  VQBioSACnKKM2DGwGL60uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHn/g0zhycwrgdv0Cug
  IJqAjNE4zgBxRkoiQkmpgYl3bmKC13XvRO1uepcc+S93i1qq7lWmSwvLh28z+bWdWtxsYfZc5
  KdD9oTb7gvqtDbvNC87MmOUgusf1xHr+tfGOv3Q5c5ZG1YluXKh3r+fGiscHD0Zc5l5wavH5R
  wtzT30uc41rT9s058OP1u/mS5KaH2lpLpx+dveHV3oMYhvMpITOskdc6apg0xL/XHoqxFju/N
  9Hy5ZN1/SIPHCkIjTNe53p+2YLFVeWl4nf2F/o7tWOSHdcIKFZe+nXfjXN1n2r7mQ2VZ2MFYl
  8sV177au0/8+vvVsl1/JUd860xsMHl0oY+2i2JAYFvPdLnvhp74azG05M+mpdsvqCxxuvumz5
  7pl5ng8UG2ev3c3k6qDEUpyRaKjFXFScCADdRYPEZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-745.messagelabs.com!1677927821!584488!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3986 invoked from network); 4 Mar 2023 11:03:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:03:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 58D4A1BC
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:41 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4CEEC1BA
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:03:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.18.1 -> 1.19.0
Date: Sat, 4 Mar 2023 19:03:18 +0800
Message-ID: <1677927799-22851-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
References: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101359

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Security:
----------
Low. Stack overflow in ares_set_sortlist() which is used during c-ares initialization and typically provided by an administrator and not an end user.

Changes:
----------
Windows: Drop support for XP and derivatives which greatly cleans up initialization code.
Add ARES_OPT_HOSTS_FILE similar to ARES_OPT_RESOLVCONF for specifying a custom hosts file location.
Add vcpkg installation instructions

Bug fixes:
------------
Fix cross-compilation from Windows to Linux due to CPACK logic.
Fix memory leak in reading /etc/hosts when using localhost fallback.
Fix chain building c-ares when libresolv is already included by another project
File lookup should not immediately abort as there may be other tries due to search criteria.
Asterisks should be allowed in host validation as CNAMEs may reference wildcard domains
AutoTools build system referenced bad STDC_HEADERS macro
Even if one address class returns a failure for ares_getaddrinfo() we should still return the results we have
CMake Windows: DLLs did not include resource file to include versions
CMake: Guard target creation in exported config
Fix ares_getaddrinfo() numerical address resolution with AF_UNSPEC
Apple: fix libresolv configured query times.
Fix tools and help information
Various documentation fixes and cleanups
Add include guards to ares_data.h
c-ares could try to exceed maximum number of iovec entries supported by system
CMake package config generation allow for absolute install paths
Intel compiler fixes
ares_strsplit bugs
The RFC6761 6.3 states localhost subdomains must be offline too.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.18.1.bb => c-ares_1.19.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.18.1.bb => c-ares_1.19.0.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb
index 2cd00cb57..bb19ff1bd 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
+SRCREV = "fddf01938d3789e06cc1c3774e4cd0c7d2a89976"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.34.1


