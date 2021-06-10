Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.7764.1623318736298021779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 02:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BVYwQ81G;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623318734; i=@fujitsu.com;
	bh=sCJzJjtLqMHbO3h79bjszqS+wWLavAb5HP6LoHKWkKg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BVYwQ81GpAof+45O8cf95Ki4/a4Nr6oz9RETGcgQGM6i0O90v37XxBCcEC3YZSBbO
	 PMHH+4WL9kNZJEJDNQnqeVM7AtnYCBruyz1TCNatqys2jTgxpsOLcoCsV/wrQ5V1/n
	 ni1Nm8/8FZVGVvARcPm0UwjmwBRXxQ/3rsoR5H+vB+FSF+YzsAChc5+u+nLXFYBoYK
	 MbaiF/NfLDmJyeatoo9Xy58eo89MBGgNH8koNRGMrQmc1LSkD3i2rlbW7SOlmcMJUH
	 C/Ji1sHJMmRwV9DrelUxMEwiE92ZDkWZs+peK3yCWpVAWFGfglB3QJw72zETWxLlgt
	 yIVQuIm8tpV2g==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id B4/16-34775-8C0E1C06; Thu, 10 Jun 2021 09:52:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxVffEg4M
  JBru+y1lcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmtr7eyFdyTrPgy+zZLA+N5sS5GLg4hgdlM
  EjOnfmKGcPYwSvS3XGHpYuTkYBPQlTj3eC07iC0ioC+xdPYeZhBbWMBP4vKkw2BxFgFVid3r1
  gDZHBy8Au4St9cogoQlBBQkpjx8D1bOKyAocXLmE7CRzAISEgdfvGAGKZcQUJSYPV0eorxCYs
  aMbWwTGHlmIemYhaRjASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLU11DU0O9xCrdRL3UUt3
  y1OISXSC3vFivuDI3OSdFLy+1ZBMjMIhSCg5P38HY/+aD3iFGSQ4mJVHe9qsHE4T4kvJTKjMS
  izPii0pzUosPMcpwcChJ8FrdA8oJFqWmp1akZeYAAxomLcHBoyTCqw8MaiHe4oLE3OLMdIjUK
  cZwjjdrlyxi5ngLJtvu3QWS7WBy5oKDq5k5ZoHJ++2HgOQDECnEkpeflyolzpt9H2icAMi4jN
  I8uGWwiL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3EcgUnsy8EribXgGdywR0rqPxPpB
  zSxIRUlINTDNSXkxjO7jT845t+R//l/6PvbyKViQobDo9K/H5fnfB3cuN/1x8OuX8p5m7Yo0V
  N/2bnCXMFxpSNK981pfgdVWXgx2dkgT+yn0WWdPxd6WUdnf+1/c6W39eXdHYvuL9cx2r/ZpuM
  2/8j/n98svpW2JPEtvPWHkzxlt0ConVHbD6t2ViaPep6SkCr/8vZl+r2i4hXiB/4HzKpFtWL1
  4HN562K+jPZdvAuPrNkX1fp+z+u3Wa9uH2pxuXe6/4mWPexvttj2HTY+f068/fPS07vfbCrGf
  L15tE5Roeli34dT6vSlF6hyH3799c2ls90/gci4r3zJbRPHvv9IolHzfL2ff+uZYZO6s8uy7g
  9IegQ4uNlFiKMxINtZiLihMBFRhCvFMDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-271.messagelabs.com!1623318728!22735!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14876 invoked from network); 10 Jun 2021 09:52:08 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-12.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 09:52:08 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A9q8PH026965
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 10:52:08 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 10:52:06 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-networking] [PATCH] net-snmp: upgrade 5.9 -> 5.9.1
Date: Fri, 11 Jun 2021 02:51:59 +0800
Message-ID: <1623351119-4687-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ....7.2-fix-engineBoots-value-on-SIGHUP.patch | 19 +++++++++++--------
 .../{net-snmp_5.9.bb => net-snmp_5.9.1.bb}    |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.bb => net-snmp_5.9.1.bb} (99%)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
index da6d80ef4a..9972752355 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
@@ -1,6 +1,6 @@
-From b6a3d6c8af35f1ef27b80b0516742fce89f4eb29 Mon Sep 17 00:00:00 2001
-From: Marian Florea <marian.florea@windriver.com>
-Date: Thu, 20 Jul 2017 16:55:24 +0800
+From 1e3178835217ba89aa355e2b6b88e490f17be16d Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
+Date: Wed, 9 Jun 2021 15:47:30 +0900
 Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
 
 Upstream-Status: Pending
@@ -14,17 +14,17 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/agent/snmpd.c b/agent/snmpd.c
-index ae73eda..66b4560 100644
+index 1af439f..355b510 100644
 --- a/agent/snmpd.c
 +++ b/agent/snmpd.c
-@@ -1207,6 +1207,7 @@ receive(void)
+@@ -1208,6 +1208,7 @@ receive(void)
  	    snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
  		     netsnmp_get_version());
              update_config();
-+            snmp_store(app_name);
++	    snmp_store(app_name);
              send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
- #if HAVE_SIGHOLD
-             sigrelse(SIGHUP);
+ #if HAVE_SIGPROCMASK
+             ret = sigprocmask(SIG_UNBLOCK, &set, NULL);
 diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
 index 29c2a0f..ada961c 100644
 --- a/snmplib/snmpv3.c
@@ -41,3 +41,6 @@ index 29c2a0f..ada961c 100644
          engineBoots = 1;
      }
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
similarity index 99%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index de0aeeec7c..1d48a85989 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
            "
-SRC_URI[sha256sum] = "04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071"
+SRC_URI[sha256sum] = "eb7fd4a44de6cddbffd9a92a85ad1309e5c1054fb9d5a7dd93079c8953f48c3f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
-- 
2.25.1

