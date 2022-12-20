Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103E5C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:20:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.48858.1671538843719189291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gkhQ7o9u;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538842; i=@fujitsu.com;
	bh=bcJjxPNhAb/J5R1EjXVqsjv5rFe/2qI2+0lB4YTQJ0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gkhQ7o9uq1wJGpbikvbFeNgYVTATp9r2VEUNaTLpC3Da0SYb2LJhINy+WzfRP7kLJ
	 yypBxKE1gFfD/ShXFWPo3Q6rfZXcRvsNCIhv1FZI/UjEMn3Qm9aatANENQtVy4gHm7
	 pnSyXRf1UsPZSsGFCYCav3gL+loIvSTzhfwq9oUwvQavcNGsOGm7UrvGjDS8PVCuBS
	 SPcmSNq2k5bwhlxZSc48yOToXSgxlWTabEt5Dhhsh1RbR8+dByhwtznMh72/hLjtdl
	 DQp1892IScDObh94kIoJkBHoRTOQUyNrvbg0kWnwzIuEyV4Bxp8YJU1IgO1bTKUXxn
	 sKk5887bnCwkQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpDtzxcJ
  kgzlvNS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oydnR/YCqZxV0w82MvawNjG1cXIxSEk8JBR
  4tHhTjYI5wqTxKVV+xkhnD2MElNvP2DvYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFviX9v9jB1MXJwsAioSszYXggS5hVwlHi6aiILiC0hoCAx5eF7sFZOASeJfffWsoOUCw
  HVPN7kBFEuKHFy5hMWiOkSEgdfvGCGaFWUmH25GWpMhcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFuoZGeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBoZtSzJ68g/H/sj96hxglOZiURHnDwhcmC/El5adUZiQWZ8QXleakFh9ilOHgU
  JLgnbEIKCdYlJqeWpGWmQOMI5i0BAePkghvz2ygNG9xQWJucWY6ROoUozHHzK9tB5g5Ovd3HW
  AWYsnLz0uVEud9sRyoVACkNKM0D24QLL4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmNQK
  ZwpOZVwK37xXQKUxApxy6NBfklJJEhJRUA5NxqLPtTdbbwqXfz6v3b3klwlyTVXVWk//flzi5
  2KMlT6b7mdpdCjsu8Ut+S1jCBOaIHUzljy8571Sy+ZGQJvUxcar9u9v/z77993TK/rv3XrZNt
  ufL2vOjJbJ230Q2Efe/S17r2KzKvXL49d2pThVcpmVTt7H82Lr94NXlIjX7v9zQONGwbcMXqX
  u75SVmzZ9WpvFox8Srxz+u3d6aMkd58XGlSbzWTl2PYk7PELR/uSPIxupvsJUzo92smRuyvv7
  Kiz9WNbdlKeehO0FT77x7ELji/8eoqarOvP/npPZMfv5Vylf52E8339sl65U3rFqjPCN7UqLy
  ++xpxa/OhO8KPS1vuGq6Qdn2lbNndD2W9lZiKc5INNRiLipOBABMnVRgagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1671538841!269584!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4521 invoked from network); 20 Dec 2022 12:20:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:20:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4B53B1B1
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4086C1AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:20:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycares: upgrade 4.2.2 -> 4.3.0
Date: Tue, 20 Dec 2022 20:19:49 +0800
Message-ID: <1671538789-7206-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
References: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100144

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  Bump cibuildwheel to build for Python 3.11 + CI total time speedups
  Fix tests that depended on external sites
  Complete the Python 3.11 support
  Drop CPython 3.6
  Improve test compatibility with pytest
  Update c-ares submodule to 1.18.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycares_4.2.2.bb => python3-pycares_4.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.2.2.bb => python3-pycares_4.3.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.2.2.bb b/meta-python/recipes-devtools/python/python3-pycares_4.3.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pycares_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.3.0.bb
index d2de4d3b7..f5223913c 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.3.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "e1f57a8004370080694bd6fb969a1ffc9171a59c6824d54f791c1b2e4d298385"
+SRC_URI[sha256sum] = "c542696f6dac978e9d99192384745a65f80a7d9450501151e4a7563e06010d45"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.25.1


