Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web08.4073.1615523117205217939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 20:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 96/38-24644-A2DEA406; Fri, 12 Mar 2021 04:25:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRoqv11iv
  B4MQWXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePz+cOMBY1sFfu+eDQwrmLtYuTiEBKYySRx
  pHEuO4RznFHi18F3LF2MnBxsApoSvVu2MILYIgL6Ektn72EGsZkF1CUurWsBqxEWMJVYfv4AG
  4jNIqAqMenCeSYQm1fARWL5tfVg9RICChJTHr5nhogLSpyc+YQFYo6ExMEXL6BqFCVmX25mgb
  ArJfZsfsg6gZF3FpKWWUhaFjAyrWI0TyrKTM8oyU3MzNE1NDDQNTQ00jW0NNI1MdFLrNJN1Es
  t1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAyulIIDOjsYf776oHeIUZKDSUmUV2qlV4IQX1J+
  SmVGYnFGfFFpTmrxIUYZDg4lCV7mN0A5waLU9NSKtMwcYKDDpCU4eJREeN+/AkrzFhck5hZnp
  kOkTjEqSonzaoL0CYAkMkrz4Npg0XWJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvy2ugKT
  yZeSVw018BLWYCWuylCra4JBEhJdXAtIeHeZ9QoM1qd/HFl5a92nQo9c7aoKlZvJt0tqQJH9f
  4u/QgT83ZZbtf5Cx+5PvilqjkFOm7R68/z5jGdTx6db76uxQu7TV73njWnwzKPtDStjrY7JKq
  86OS2hV6O7cL/ZOct6GmYNLe33YR3s1zNK5kRW1PjkmLbWWwvOMf+/BxZkHgni2tdiYOf3XnC
  CQlcs8OXJV9bpo974ea2T8TDu2b6ZP+25ej7UjBQa5Fxlu/flnKc2NSUMbh2c4bG46m/J/JeF
  PxyO8VUfwXJ5TZJqhnTBa9tFq9qtwm2uhF/HK7JJ39P6JqF9U9fuS2ccaDuQqs29KvHO6PdzX
  70hTW3/lGM3FGbEUhR9lvgdKaHCWW4oxEQy3mouJEACwvhVopAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-33.tower-271.messagelabs.com!1615523114!1654507!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5849 invoked from network); 12 Mar 2021 04:25:14 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-33.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2021 04:25:14 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12C4P8EC020495
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 04:25:14 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 04:25:06 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH] czmq: Conflict resolution for sha1.h
Date: Fri, 12 Mar 2021 12:24:58 +0800
Message-ID: <1615523098-8089-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

libmd(oe-core) also uses the doc 'sha1.h', so package it in own subdirs of czmq.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index e742d2a1c4..56b688cad1 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -30,3 +30,7 @@ PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
 
 BBCLASSEXTEND = "nativesdk"
 
+do_install_append() {
+        mkdir -p ${D}/${includedir}/${PV}
+        mv ${D}/${includedir}/sha1.h ${D}/${includedir}/${PV}/.
+}
-- 
2.25.1

