Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08115C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:03:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.2813.1657177429725684732
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Nlf1p29w;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177428; i=@fujitsu.com;
	bh=kSSFoNyZl5JxOvp4Guzhwzfv8UCcfGlzGsB0xByPC8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Nlf1p29wTucpDLdx/4wSR1BpqE/4xiAQZyaT3pTfCx9rmpuEsMZsmJ/AJ+7rFfwL1
	 sQUFEKxHIIgGov3x+dpjxMuGPE64zsagUalbZOFA+DzVJUx/NxQ75ttBHbBVyhgsKN
	 Z31Z20XGbqp4E2cLY8b5qPWjgc1fRbRO2WKYaAvqdMaT9IXlV0IWDhccz9FH/CyNd/
	 DuYnpcJs8/08LIs/b1C/2fSmRy3mirpJYJl9foaZ1FCX7KSLH9AEjiUKkmCrIHn3UN
	 mpGb7+na4hlNWgqvmtFltvmVKJLVO48riy47b6pUQzmV5Y6v865KjtfJhGsweJmoOL
	 KHVdkwxiH77EA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqBvceiz
  J4FyvtsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH71wqWgtm8FWt2vmFqYJzO08XIxSEk8IRR
  4uLsJSwQznUmiXUdE5kgnN2MEm+m/WHsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAV+LKghYmEJsFKH6lpResnlfASWLj+VYwW0JAQWLKw/dgvZwCzhLnLj8Emy8EUvNlBS
  NEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYsaMbWwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjNZJRZnpGSW5iZk5uoYGBrqGhqa6xpa6RobGeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgYGcUqx+dQfj5lU/9Q4xSnIwKYnyetUfSxLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwbu4BSgnWJSanlqRlpkDjCqYtAQHj5IIL2MzUJq3uCAxtzgzHSJ1ilGXo3N/1wFmIZa8/L
  xUKXHeeyBFAiBFGaV5cCNgEX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvRpBLeDLzSuA
  2vQI6ggnoiGX5R0COKElESEk1MLn2Lvr18rG7QvJfndYZm57duaV6Yk7T/6XRicH9/wIM+67c
  W2sr9om/eMK+g3NSLQUOfXHYZveKhb307R2b3zNX9BgcPFb19nFfzfbI1837OCbU3776ePGVR
  1sOxXBrnG/8ymqz3r6HLUxKPsxINPaSy4dX33Zzn/75INPvhtyaxMKPTZUh+hrNYfc8TpdqTF
  /wteJfWcuGG6eN1We9LPfdfGhx5cXHy0WWKfbsk+DIe3TZzaf/otz2dKa980rrn84JnZ1c0b1
  4v7Pk0/NtBQ/b47oaVFMCHjtKT/ead9Hwm9XGbM/CNXWmx5/WTlLVC9YqLcsPcTv/6UX7u1WF
  7577f9Fp5Ehg6tLqPvMiyUCJpTgj0VCLuag4EQAZcD2WawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-548.messagelabs.com!1657177427!14011!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20918 invoked from network); 7 Jul 2022 07:03:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:03:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 64BE9100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:03:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5837D100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:03:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:03:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] phoronix-test-suite: upgrade 10.8.3 -> 10.8.4
Date: Thu, 7 Jul 2022 15:03:22 +0800
Message-ID: <1657177403-28456-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177403-28456-1-git-send-email-wangmy@fujitsu.com>
References: <1657177403-28456-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97748

Changelog:
===========
pts-core: Allow sub-folders within PTS_EXTRA_SYSTEM_LOGS_DIR when uploading to Phoromatic server
pts-core: Fix TOTAL_LOOP_TIME handling
pts-core: openSUSE external dependency handling fixes
phodevi: Support for reporting video BIOS version
phodevi: Budgie desktop version detection
phodevi: Avoid deprecated wmic usage on Windows
phoromatic: Input sanitization updates in the result viewer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ronix-test-suite_10.8.3.bb => phoronix-test-suite_10.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_10.8.3.bb => phoronix-test-suite_10.8.4.bb} (94%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.3.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
similarity index 94%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.3.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
index a4d586ebc..be9756d9a 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.3.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "4b742e28a9542fe2b57aacb691159d69d3e1c77d95da6d24b7867889ce84ba80"
+SRC_URI[sha256sum] = "1f2092d536c0a3193efc53e4a50f3cee65c0ef1a78d31e5404f1c663fff7b7f4"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.25.1


