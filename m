Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D7FC43219
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:10:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.1766.1666055406604034009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YmnBD+FB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055405; i=@fujitsu.com;
	bh=ZdgxES1gsGj/bZQQl1sccKDScit7Kd/E2YWIjjaMPBI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YmnBD+FBs2CL7h6taUdhNqv+GiIKF7LEPMYLbFGXg5l9Sg9W2PRwedc44xX2/7j1A
	 kM05nSb2GmNYirmMc4UgtSPaAjSFAxiITZ2B+n+S/9Nvkd6bJKA1V/cdEEum0BYpQD
	 dydwnr5EN2mdYtSrByJKTHniI7F54+X1dTN+Yt96csJIsMb9VPcbNMoFopn4ub+86L
	 0N6YOXJz+RPmxFjBio2WurVueUrqpAEgsW2LOmSPZ8Q8E2Itb4AgBVT8GJdfddvAzL
	 jF6G55oFuUXENmwHdS7odAqmoGJSLfN7wkkrh7h3tLpxtPbomzFFznk5Cm4pPfKmhX
	 ba7Cv2u/mlgkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORpPvmj2+
  ywaSZqhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0edOZC5p5Ky5/ucPWwHiKu4uRi0NI4CGj
  RP+rL4wQzhUmiTWrtjJDOHsYJY51HwJyODnYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw87i
  C0sYCuxaf4GJhCbRUBV4uCDZrB6XgFHia2X9jOC2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0K04tKkst0jU00ksqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMeUYvbkHYz/l/3R
  O8QoycGkJMrbMcM3WYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb8cPoJxgUWp6akVaZg4wNmDSE
  hw8SiK8UWeA0rzFBYm5xZnpEKlTjMYcV69c2cvMMfNr2wFmIZa8/LxUKXHe07+BSgVASjNK8+
  AGwWL2EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3tRfQFN4MvNK4Pa9AjqFCeiUjP1eIKe
  UJCKkpBqY8vefePbT6sxx9tSnBl63WTlXf386P7zZf/eWFa9D4lY/+P1QNXTJ4ZiTDklPpjcl
  rzo5a0W69pytW9xzVnocmrTl/PLeT1/aV8w6vPYa27OPZ35sKlkulmN1wGfDPOPdepUsPiGTl
  t39ZRGpnKGbdrOgo4evkENi022Rw3tcIrn3ab1a5LcnaZaD8Z3tehFJF+ffiuG431P5/SjjnZ
  wnvPN+75jwvty38ZlRg7T70eK9ezm4c6JiWZaernQodbjywuPsypzmQ1vK5W885ypQO8056Wv
  kjMnVv4TiJNa58lzdO2Fu8qdOpllnS2WTP6YE2zx7JHRtf/0HpQbrhDOFZWnCrxSDPhsqnDT7
  d1J25wUlluKMREMt5qLiRACC7IdpVAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1666055404!281957!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10181 invoked from network); 18 Oct 2022 01:10:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:10:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3AC681AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2F7931AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:10:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cli11: upgrade 2.2.0 -> 2.3.0
Date: Tue, 18 Oct 2022 09:09:43 +0800
Message-ID: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99217

Changelog:
==========
Add CLI11_PRECOMPILED as an option. #762
Bugfix: Include <functional> in FormatterFwd #727
Bugfix: Add missing Macros.hpp to Error.hpp #755
Bugfix: Fix subcommand callback trigger #733
Bugfix: Variable rename to avoid warning #734
Bugfix: split_program_name single file name error #740
Bugfix: Better support for min/max overrides on MSVC #741
Bugfix: Support MSVC 2022 #748
Bugfix: Support negated flag in config file #775
Bugfix: Better errors for some confusing config file situations #781
Backend: Restore coverage testing (lost with Travis CI) #747

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/cli11/{cli11_2.2.0.bb => cli11_2.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cli11/{cli11_2.2.0.bb => cli11_2.3.0.bb} (94%)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.2.0.bb b/meta-oe/recipes-support/cli11/cli11_2.3.0.bb
similarity index 94%
rename from meta-oe/recipes-support/cli11/cli11_2.2.0.bb
rename to meta-oe/recipes-support/cli11/cli11_2.3.0.bb
index 53a57489fe..53ae95b68e 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.3.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich f
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9ad746b5f49c0fd53c08ca1faff1922c"
-SRCREV = "b9be5b9444772324459989177108a6a65b8b2769"
+SRCREV = "a66ae4145779c56dc0f9f98a631656417dd77de8"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
-- 
2.25.1


