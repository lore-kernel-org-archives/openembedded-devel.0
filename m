Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.5700.1622714343175268117
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 02:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DIwTjzOO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622714341; i=@fujitsu.com;
	bh=tCI1VW6Foqsnx5d/gH9zS3zrmZXWtF+pHchuVHk7Zrw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DIwTjzOOkQWx2YAgE8qhOxd7Rgv+Y/fslWoO1EJN9TtvJHbVWF01PkgOwTs9lP5ee
	 RiH3JZOzl2SfSno34nSBI/02s6JyQO35cFghoutbTNM/issdtrAMwqzSc3VXzAu+X5
	 LCf5l/Ay6ZZe2sfXWKjR7tBrj8IfMX9x9E7cLWR2X/TUoEwXP/ODvjgt+UXaeOq+k5
	 OVopPRhqr8KsTCHUEahgg+9OsoUD8oU+yHw1Gge71Zw02WNmB6zEFXvGYgJGK8S9ct
	 BaO4hW71eyKLaHQT64ED+cCtNNaWyDbUuTr3/ILMaX9h0M3CFppZCHx71AXKtKuVVp
	 tsC+rbAvpeG2g==
Received: from [100.112.194.111] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id A8/9C-27560-5E7A8B06; Thu, 03 Jun 2021 09:59:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MRqvt0+Y4
  Eg08TuC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ox7m5pYC/5wVXy6283SwHiJs4uRi0NIYBaT
  RN/UDkYIZzejxO0dHWxdjJwcbAK6Eucer2UHsUUE9CWWzt7DDGILCzhLtLxbBGRzcLAIqEhM/
  ysOEuYVcJfY8+AjC4gtIaAgMeXhe2aIuKDEyZlPwOLMAhISB1+8AGuVEFCUmD1dHqK8QmLGjG
  1sExh5ZiHpmIWkYwEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DS1NdQ1NDvcQq3US91FLd8tT
  iEl0gt7xYr7gyNzknRS8vtWQTIzCIUgoOT9/B2P/mg94hRkkOJiVR3jvtOxKE+JLyUyozEosz
  4otKc1KLDzHKcHAoSfBaLgPKCRalpqdWpGXmAAMaJi3BwaMkwjtlMVCat7ggMbc4Mx0idYoxn
  OPN2iWLmDnegsm2e3eBZDuYnLng4Gpmjllg8n77ISD5AEQKseTl56VKifNWgWwTABmXUZoHtw
  wWsZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfN6gUzhycwrgbvpFdC5TEDnCnhtAzm3JBE
  hJdXAFCvQEHPS/tK3UI364NB21cCMD5UnnNX6VjBMZJbqrLu9ynal1Cl9bY+iJ9GbE36eszvV
  +Ofz7tN9sXOYH23ZNr0oOWVdoJ/m6z4fzbuO62/w2zq3KkUJtoekxPU4a90/OWP1lotPtm40f
  WOa/uDH9T87Dx0svBPk3Gv1bVPEkfVKy3tNUhZOvNfs7Wlw0uWvwfLyuXfmOIa83nc5wkyExz
  xQ2Gfaqk0yDdp3Yx022bmezQ1Sk224oCB/fPtaBunsiaZrf8SIuQt7XwsOmp/dHH5NUHTp1eB
  5Z97PjbyprjLnrt/y16YzlIIf5gSyxrgWtsr5lOUniEoWPeXKvXhOILtev6M9eZ8eg3j3Tkcl
  luKMREMt5qLiRACwFO0NUwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-265.messagelabs.com!1622714340!15357!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2801 invoked from network); 3 Jun 2021 09:59:01 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-11.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 09:59:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1539x0re016200
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 10:59:00 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 10:58:59 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-oe] [PATCH] iperf3: upgrade 3.9 -> 3.10
Date: Fri, 4 Jun 2021 02:58:52 +0800
Message-ID: <1622746732-4446-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../iperf3/{iperf3_3.9.bb => iperf3_3.10.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.9.bb => iperf3_3.10.bb} (89%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.10.bb
similarity index 89%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.10.bb
index be75837beb..6fe87353dd 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.10.bb
@@ -9,14 +9,14 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b7fb682e9941a49f1214dcd7441410d7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4991c26fb646b69589d1eff3e958b06a"
 
 SRC_URI = "git://github.com/esnet/iperf.git \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "1f8fb13297f3e3e40169ebcd12e171167e394473"
+SRCREV = "c159c741243441be84f91d3130cbeef1e1d579e8"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

