Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2DCC54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 12:07:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5655.1711022853901016872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 05:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YanWW1o8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=381012e865=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42L6lkTd006469
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 12:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=h6Uoh
	4s1cdtdoG/FLPRQm8/Pizghkj3cH6gskFjQXf0=; b=YanWW1o8cplJvSaQKOVxS
	kKz7/SY7u2dzeVpYDEXlhR7xD/DwUlPP1DwruPTHPc5yXcwGZ1Q+JvdHJ6RGR4eo
	Fkvk4MH0SIs2p7cgwze3vzotwn6km8OLuiZN0Hja/eEmChnEUGtR62qou+9TTrdd
	Y/Tsfj1P6cUoMysXWOlVOP9nNeYnLwBK3X7Uc5VPIc1U8Ep71WtbZpTG2bwOCvVE
	iwspCoCqZrYpL85r+CRTDPFol3IYSY2G9P5PpuHZfF1WNESZXmYd6+RizW7l4Gcb
	RWBtB06hhYQ0U71f3eaET3jwmpGgje6KnmTv1YFLRk45c4oLkLEpCL9dOlanXe7s
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww0mxn21e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 12:07:32 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 21 Mar 2024 05:07:30 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] dnsmasq: Upgrade 2.87 -> 2.90
Date: Thu, 21 Mar 2024 12:07:15 +0000
Message-ID: <20240321120715.1890935-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ikxBXjPa3t6_3K286ljBfwMPHKccYFFB
X-Proofpoint-GUID: ikxBXjPa3t6_3K286ljBfwMPHKccYFFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 12:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109504

From: Soumya Sambu <soumya.sambu@windriver.com>

Fixes CVE-2023-50387 and CVE-2023-50868

Remove backported CVE patch.
Remove patch for lua as hardcoding lua version was removed.

Changelog:
===========
https://thekelleys.org.uk/dnsmasq/CHANGELOG

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../recipes-support/dnsmasq/dnsmasq.inc       |  1 -
 .../recipes-support/dnsmasq/dnsmasq/lua.patch | 31 ------------
 .../recipes-support/dnsmasq/dnsmasq_2.87.bb   |  7 ---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  3 ++
 .../dnsmasq/files/CVE-2023-28450.patch        | 48 -------------------
 5 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 9e0f529ec..a8ff21a12 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -14,7 +14,6 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
-           file://CVE-2023-28450.patch \
 "
 
 inherit pkgconfig update-rc.d systemd
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
deleted file mode 100644
index be2bb42fc..000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From be1b3d2d0f1608cba5efee73d6aac5ad0709041b Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Tue, 9 Sep 2014 10:24:58 -0400
-Subject: [PATCH] Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 73ea23e..ed3eeb9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -60,8 +60,8 @@ idn2_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFI
- idn2_libs =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFIG) --libs libidn2`
- ct_cflags =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
- ct_libs =       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
--lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua5.2` 
--lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.2` 
-+lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`
-+lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`
- nettle_cflags = `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC     $(PKG_CONFIG) --cflags 'nettle hogweed' \
-                                                         HAVE_CRYPTOHASH $(PKG_CONFIG) --cflags nettle \
-                                                         HAVE_NETTLEHASH $(PKG_CONFIG) --cflags nettle`
-
--- 
-2.9.5
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
deleted file mode 100644
index 793b61d71..000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.87.sha256sum] = "ae39bffde9c37e4d64849b528afeb060be6bad6d1044a3bd94a49fce41357284"
-SRC_URI += "\
-    file://lua.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
new file mode 100644
index 000000000..6e4c33110
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -0,0 +1,3 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.90.sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
deleted file mode 100644
index 129c9043e..000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Tue, 7 Mar 2023 22:07:46 +0000
-Subject: [PATCH] Set the default maximum DNS UDP packet size to 1232.
-
-http://www.dnsflagday.net/2020/ refers.
-
-Thanks to Xiang Li for the prompt.
-
-CVE: CVE-2023-28450
-Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- man/dnsmasq.8 | 3 ++-
- src/config.h  | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/man/dnsmasq.8 b/man/dnsmasq.8
-index 41e2e04..5acb935 100644
---- a/man/dnsmasq.8
-+++ b/man/dnsmasq.8
-@@ -183,7 +183,8 @@ to zero completely disables DNS function, leaving only DHCP and/or TFTP.
- .TP
- .B \-P, --edns-packet-max=<size>
- Specify the largest EDNS.0 UDP packet which is supported by the DNS
--forwarder. Defaults to 4096, which is the RFC5625-recommended size.
-+forwarder. Defaults to 1232, which is the recommended size following the
-+DNS flag day in 2020. Only increase if you know what you are doing.
- .TP
- .B \-Q, --query-port=<query_port>
- Send outbound DNS queries from, and listen for their replies on, the
-diff --git a/src/config.h b/src/config.h
-index 1e7b30f..37b374e 100644
---- a/src/config.h
-+++ b/src/config.h
-@@ -19,7 +19,7 @@
- #define CHILD_LIFETIME 150 /* secs 'till terminated (RFC1035 suggests > 120s) */
- #define TCP_MAX_QUERIES 100 /* Maximum number of queries per incoming TCP connection */
- #define TCP_BACKLOG 32  /* kernel backlog limit for TCP connections */
--#define EDNS_PKTSZ 4096 /* default max EDNS.0 UDP packet from RFC5625 */
-+#define EDNS_PKTSZ 1232 /* default max EDNS.0 UDP packet from from  /dnsflagday.net/2020 */
- #define SAFE_PKTSZ 1232 /* "go anywhere" UDP packet size, see https://dnsflagday.net/2020/ */
- #define KEYBLOCK_LEN 40 /* choose to minimise fragmentation when storing DNSSEC keys */
- #define DNSSEC_WORK 50 /* Max number of queries to validate one question */
--- 
-2.20.1
-
-- 
2.40.0


