Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C023C4743E
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.7049.1649903584273780913
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I4X3OcNV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649903582; i=@fujitsu.com;
	bh=R6N0meQGuqtErF9O2OIEo0YmRbltuEgkp8CWZWkRZj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=I4X3OcNVTsREwA09Q/Q/IQvO9IeW7vhdaYrlaQ+vJqbptieD/hcTK1jH8Mxzn614y
	 cR3e+5IrQHUpunt/UmSU1tIMg4dfF5LoU77mTMPGo20b1Y+rG8PakoRVLls+oB8198
	 +6fdbGbmBzF+jsjJNxpcOrMM1jR1WyYp/cAxCFubRt8Wa4Vj7JEtY7Erk6em1BOptf
	 ulEyZy/70UlJRvESW4IC4kdB195Krp3U6IkyM1LjbDUwNyrZ5hg1L+aq845xLgTErj
	 SNkYvryuyDARdGhD1WUtf+iEi9knXOHwjBpbrCxVptszN+qKY6An5omaOPyTkfw11o
	 XUhJ3VTUlr8IA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSfdue3i
  Swb65+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bl9uyCLs6KllufmBoY13N0MXJxCAk8YZRY
  cvoVC4RzgUli8prfzBDOHkaJV7MPsHYxcnKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw97F
  yMHh7CAo8SbmRIgJouAqsSXTd4gFbwCThJ/7/4C65QQUJCY8vA9M0gJp4CzxIPNGSBhIaCSjx
  tOsEKUC0qcnPmEBWK4hMTBFy+YIVoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1NtU1tDDRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYr
  rsxNzknRy0st2cQIDOCUYuUdOxjbVv3UO8QoycGkJMqbZRieJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mC16sVKCdYlJqeWpGWmQOMJpi0BAePkghvUw1Qmre4IDG3ODMdInWKUVFKnPdzG1BCAC
  SRUZoH1waL4EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmngkzhycwrgZv+CmgxE9Dib6t
  CQRaXJCKkpBqYFryznXQw4Mb6ylUe53VWH4ty6TobH/NbNSdZ3f78g7VfY0IE73y5ePv4z8pJ
  /NPT9WcWiF1dE3HubWFYGEMiz+4mlapGl3i90vmvnhZdZZ/9vnq51Cpvnc0c7ILr2o6cOx1id
  v/SZKnYmwGH95n9VZlkxTC3jnNewATjIzlaV8xr+ZV+mF/eM/lya2RA1UevxREz4pP6Z3tfFB
  ItVOHxPuL2coPJ9L/z2Jifz5Z9rWvEwllfc9gzZVH9zOzf4ddkFIvDjtgUfXg4TzqdX6qE9XV
  A4wSZvOcvHQ/92r5W48zUnqvfl1arnTez/iKtd/nappUFX/u2NNUz+W8QcHtUf2XJVMazzwq/
  OoTkbPSNUmIpzkg01GIuKk4EAAYsQxVbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1649903581!209831!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21127 invoked from network); 14 Apr 2022 02:33:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:33:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 699D010046F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:33:01 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5C2E5100466
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:33:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 03:32:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pax-utils: upgrade 1.2.2 -> 1.3.3
Date: Thu, 14 Apr 2022 10:32:28 +0800
Message-ID: <1649903550-17752-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649903550-17752-1-git-send-email-wangmy@fujitsu.com>
References: <1649903550-17752-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96636

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pax-utils/{pax-utils_1.2.2.bb => pax-utils_1.3.3.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pax-utils/{pax-utils_1.2.2.bb => pax-utils_1.3.3.bb} (88%)

diff --git a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.2.2.bb b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb
similarity index 88%
rename from meta-oe/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
rename to meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb
index 0eb2146265..d512c85704 100644
--- a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
+++ b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb
@@ -8,8 +8,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"
-SRC_URI[md5sum] = "a580468318f0ff42edf4a8cd314cc942"
-SRC_URI[sha256sum] = "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9"
+SRC_URI[sha256sum] = "eeca7fbd98bc66bead4a77000c2025d9f17ea8201b84245882406ce00b9b6b14"
 
 RDEPENDS:${PN} += "bash"
 
-- 
2.25.1


