Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.5716.1623400371461153132
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jun 2021 01:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: ito-yuichi@fujitsu.com)
IronPort-SDR: JUVGXFMjaZ2iWwkoIGbyZbc0KrdTUT8B3hTTttO0DQO9FfQI12RuB6GSK1y36Jv2A0WpAymeWt
 D7DurywlIIN6hf2M6vGw761OLVjh3gFK0X4VA2xscgSn8pHf8DBO+A+eLTLrmbTCrB5opVoxmt
 FpMrab9dmy/tv4+zjvBelokyL19IjWaqfltNFDZdEp3ZLwnquwdWmphJ3H/2a7KcjbNJWXqPWj
 Sfk3hx4el/fGJ5s8kZwfUg7bf7t54pmEcdorSFuK0xD5rIpzlF0ufHRKk1Tdg+xuMdgoOFbtY4
 2CM=
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="20756643"
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="20756643"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP; 11 Jun 2021 17:32:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2246BA80C1
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 17:32:48 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7829E9B606
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 17:32:47 +0900 (JST)
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id 6C4CC405733AD
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 17:32:47 +0900 (JST)
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] cyrus-sasl: add CVE-2020-8032 to allowlist
Date: Fri, 11 Jun 2021 17:32:45 +0900
Message-Id: <20210611083245.45849-1-ito-yuichi@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

This affects only openSUSE, so add it to allowlist.

Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
---
 .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index 33de8ca7e..c4b41ace8 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -96,3 +96,6 @@ FILES_${PN}-dbg       += "${libdir}/sasl2/.debug"
 FILES_${PN}-staticdev += "${libdir}/sasl2/*.a"
 
 INSANE_SKIP_${PN} += "dev-so"
+
+# CVE-2020-8032 affects only openSUSE
+CVE_CHECK_WHITELIST += "CVE-2020-8032"
-- 
2.25.1

