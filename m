Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEF6C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 19:48:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1452.1711396082845733518
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 12:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mS2jscvM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3814fe1ce9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42P9ahoV024239
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:48:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=8Oxml
	Bow+m5A0stFQDglExsjvgiV/W4HXwljRPjUwuQ=; b=mS2jscvMBVo7MDGPlJcqP
	gZqXU/Be68aUOoUpJdo3De2wikZmABFCZyqEXfy83KRxFKE7MxhSLc0WV1iSGsVE
	f+sWzqavmsz6DrKQYb3y8SEbwDQt9FY/x8TzQ4MNVYBTRpDP5sMdNZnVCojDe+wF
	Hw9KyEZDNYbUGYBHFQ5GW3WqpxpQ77jHxZR3nWZ3/Jl2RQFecgnNzqTjz/TsK6I9
	C8JuX/Y6VSEDeyVlMJD/5/onMN2F5ehgvniZpdvikwLAZAlBvZWX5MojLyPK5min
	P+0+LD/zmeWW3tBiXwVw7J1hsSemNW9x9irwn+gCj2lvBM/IXVj0taaDBzNG9APl
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1tc0tq5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:48:02 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 25 Mar 2024 12:48:01 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Mon, 25 Mar 2024 12:48:01 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] rsyslog: update from 8.2306.0 to 8.2402.0
Date: Mon, 25 Mar 2024 12:48:01 -0700
Message-ID: <20240325194801.1873730-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: U6pSfke6V3Au6cw477YJBiLOqjaaCi8P
X-Proofpoint-ORIG-GUID: U6pSfke6V3Au6cw477YJBiLOqjaaCi8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_18,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109599

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Change the PACKAGECONFIG[systemd] that wrapped --with-systemdsystemunitdir
to use the new --enable-libsystemd option:
   acb62dfda remove systemd embedded code, use library instead

The bug related to using libcap-ng has beeen fixed:
   https://github.com/rsyslog/rsyslog/pull/5166/commits/030e047fd0c896b4cb2433bab853321eff6f8ec9
so use that library by default now to allow rsyslog to run with fewer privileges.

PTest results: sysvinit, systemd
 TOTAL: 462, 462
 PASS:  457, 459
 SKIP:  5, 3
 XFAIL: 0, 0
 FAIL:  0, 0
 XPASS: 0, 0
 ERROR: 0, 0

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/{rsyslog_8.2306.0.bb => rsyslog_8.2402.0.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2306.0.bb => rsyslog_8.2402.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
index c3948a40e..af46cc14d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
     file://disable-omfile-outchannel.patch \
 "
 
-SRC_URI[sha256sum] = "f6283efaadc609540a56e6bec88a362c966e77f29fe48e6b734bd6c1123e0be5"
+SRC_URI[sha256sum] = "acbdd8579489df36b4a383dc6909a61b7623807f0aff54c062115f2de7ea85ba"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -47,7 +47,7 @@ EXTRA_OECONF:remove:riscv32 = "ap_cv_atomic_builtins=yes"
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-    rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
+    rsyslogd rsyslogrt klog inet regexp uuid libcap-ng libgcrypt \
     fmhttp imdiag openssl imfile \
     ${@bb.utils.filter('DISTRO_FEATURES', 'snmp systemd', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench relp ${VALGRIND}', '', d)} \
@@ -60,6 +60,7 @@ PACKAGECONFIG[rsyslogrt] = "--enable-rsyslogrt,--disable-rsyslogrt,,"
 PACKAGECONFIG[fmhttp] = "--enable-fmhttp,--disable-fmhttp,curl,"
 PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,,"
 PACKAGECONFIG[klog] = "--enable-klog,--disable-klog,,"
+PACKAGECONFIG[libcap-ng] = "--enable-libcap-ng,--disable-libcap-ng,libcap-ng,"
 PACKAGECONFIG[regexp] = "--enable-regexp,--disable-regexp,,"
 PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
 PACKAGECONFIG[libgcrypt] = "--enable-libgcrypt,--disable-libgcrypt,libgcrypt,"
@@ -72,14 +73,12 @@ PACKAGECONFIG[imfile] = "--enable-imfile,--disable-imfile,,"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
+PACKAGECONFIG[systemd] = "--enable-libsystemd,--disable-libsystemd,systemd,"
 PACKAGECONFIG[imjournal] = "--enable-imjournal,--disable-imjournal,"
 PACKAGECONFIG[mmjsonparse] = "--enable-mmjsonparse,--disable-mmjsonparse,"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
 PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
 PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
-# For libcap-ng, see commit log and  https://github.com/rsyslog/rsyslog/issues/5091
-PACKAGECONFIG[libcap-ng] = "--enable-libcap-ng,--disable-libcap-ng,libcap-ng,"
 PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[valgrind] = ",--without-valgrind-testbench,valgrind,"
 PACKAGECONFIG[imhttp] = "--enable-imhttp,--disable-imhttp,civetweb,"
-- 
2.43.0


