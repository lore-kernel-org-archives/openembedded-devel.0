Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web08.2612.1615858357743984787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 8D/8D-35258-3BA00506; Tue, 16 Mar 2021 01:32:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYoruJKyD
  BoPGLhcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFv1WOmgiccFTvfL2ZtYGzk6GLk4hASmMkk
  cePtHyYI5zijxK6lyxm7GDk52AT0JRrev2IGsUWA7KWz94DZwgLeEt03d7OB2CwCqhIv+j+zg
  Ni8QPG1J6aB9UoIKEhMefieGSIuKHFy5hOwGmYBCYmDL14wQ9QoSmzfeYYFwq6UmPtmIdMERp
  5ZSFpmIWlZwMi0itE8qSgzPaMkNzEzR9fQwEDX0NBI19DSTNfMRC+xSjdJL7VUtzy1uETXUC+
  xvFivuDI3OSdFLy+1ZBMjMIxSCo447GC8//qD3iFGSQ4mJVFeP+aABCG+pPyUyozE4oz4otKc
  1OJDjDIcHEoSvA/ZgXKCRanpqRVpmTnAkIZJS3DwKInwVrECpXmLCxJzizPTIVKnGBWlxHkvc
  AIlBEASGaV5cG2wOLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3BcgUnsy8Erjpr4AWMw
  EtNpT2A1lckoiQkmpgmtI7yfjBq0i/L+ErLZ5Zbf1q84jHiCdEme/6ZO7w1VYV82/wVxakfuF
  kZxL7v+P8yqLpC9MnlvhoCkXrTb3/9513lX+F1lSmaRoHzjVfnvbkS9y1JLmDJVIBl5kTirYG
  xu2pj95yXJNlD9+P9XNWGwWyvHlwzXeh+I+nPcfmZPYsqv8w9+PiVxaVD2fw7WtkE0mSftzJz
  L92wrX7b3+XrpkrVHXP4rLAt3lbUuaqHHi3SujGF5YNc56sLpDfee+kdFhsxWax+OZFPPu2Pp
  jwiu1C/OoiFot1fF9kzuXceaXcUFg/zXFaucfdKww1oos1CqN5D0R3Htw6u+GsPXfGkUutqtp
  mzhzL16eIGs3bEqrEUpyRaKjFXFScCAA611pBHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-287.messagelabs.com!1615858354!236318!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16040 invoked from network); 16 Mar 2021 01:32:34 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 01:32:34 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12G1WYZO027659
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 01:32:34 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 01:32:32 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] fetchmail: upgrade 6.4.16 -> 6.4.17
Date: Tue, 16 Mar 2021 09:32:26 +0800
Message-ID: <1615858346-107908-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.16.bb => fetchmail_6.4.17.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.16.bb => fetchmail_6.4.17.bb} (91%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.16.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb
similarity index 91%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.16.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb
index 71163c8d91..7c513f62b6 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.16.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb
@@ -12,7 +12,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "044b9a0ac03afbae7744979defe3e2e32e39141bca68fd0c8deda2ed40884fb9"
+SRC_URI[sha256sum] = "a41bcdf11b41aa0682b259aee4717c617c15dadd43fa008b2ed38b770f4d50c6"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.25.1

