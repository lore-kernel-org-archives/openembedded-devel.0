Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1B7C25B74
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.6645.1714628979453633684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cWugC+dq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628980; x=1746164980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FvitYdQFJSGAavpuZkw19869tZsZKVXu2j4tAdli10I=;
  b=cWugC+dqx8d73JqMjdRrJTxcsN+4iia1jrWS1313BEJpSGww22DaL2Do
   qC2E91k1VbFYBdXoSddyo16LHMmAfnMhVTzvzzEVDjfr2ax9hqzt5B8ID
   MTvFiXslH2qJLgUjVkqi2aWXLLaqak6gUIkMiS7lomDZbYvvdAwPxiJgM
   63PWCPcluO9th3Btt59BSK3GvQXkJeNyvbTeZRN/arbjoR0WhHFZUeBj3
   fKfLzIkt7mAk+53SdrCY4ToqWkIOBpVzxDY8R+hY0DwQjBfZdkj4a3cJt
   h/vqpUxLttZSjNVsw8gYCkxvvbeY3MwEIECXtAETEvyN1FXayr4x2vZIV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="159223482"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="159223482"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 473D9D6473
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7184CD6235
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1731B2008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:34 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA1A51A000C;
	Thu,  2 May 2024 13:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 30/30] uftrace: upgrade 0.15.2 -> 0.16
Date: Thu,  2 May 2024 10:48:29 -0400
Message-Id: <20240502144829.241208-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--4.928300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxs1Ir4NZzFmnQi
	GZe0jWAMvEI4haRugcROMFJeHBztQH/f0pmu/H+SCtzGvPCy/m7jLrHqvAiSy7oFQ8GRC1Pri3G
	OCGgGiObffnlyeHIZrwDzRES7L9pfP7ue82/p97oMPOZL2X19isLiFiL0BG1ulPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDRlJRfzNw8afguwtqyXlE6Hut6dxL6OwmNftC
	rF2sVs+4vM1YF6AJbb2xnRRfQRo4gtuKBGekqUpnH7sbImOEBRWAi4LUYANzP1V/Py5Bc9YDJYl
	6NrpUErE4RSj+s1inSnW3yvcpnt2sAzChhvrLUJtsJ+C1yX9jcg9U/cCQVYN9B7JdI9Kk9KbDRB
	qS2n66yzP5xAyz9Oenvkw4sh/+PcMX5CwH5DTUmgGZNLBHGNe
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110232

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- build: Add -mno-sse to fix i386 build
- build: Fix build failure on RHEL 7
- mcount: Fix a compiler warning on PAGE_SIZE
- fix: #1858 by changing the wrong logic in update_dbg_info
- ci: Fix ci warning on GitHub Acitons
- slide: Add tensorflow and keras tracing example
- python: Fix GC isn't working correctly.
- replay: Support a new argument format for octal values
- build: Fix compiler warnings
- Fix Python SyntaxWarning on invalid escape sequence in the tests scripts
- utils: Lower the debug level after dwfl_module_getdwarf
- wrap: Do not print "dlopen is called for '(null)'"
- Support standard deviation(STDDEV) in report output
- dwarf: Close file descriptors in setup_dwarf_info()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uftrace/{uftrace_0.15.2.bb => uftrace_0.16.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.15.2.bb => uftrace_0.16.bb} (95%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.15.2.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.16.bb
similarity index 95%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.15.2.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.16.bb
index 60436025a..320b5a88a 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.15.2.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.16.bb
@@ -10,7 +10,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "9d8657e90b918994d7d2bcf6dd2cc7354c35a1b4"
+SRCREV = "68aed9b0a20d3d1b5e1dc15e0f8aabba7e34735b"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
            file://0001-include-libgen.h-for-basename.patch"
 S = "${WORKDIR}/git"
-- 
2.34.1


