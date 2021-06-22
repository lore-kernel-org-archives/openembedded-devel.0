Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5989.1624350564516172711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 01:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: ito-yuichi@fujitsu.com)
IronPort-SDR: eV6F/aqP/dGbXmSxoLtav0yZ5WyoD1sSODXojeqT06YLZTH9UBFxlznRHOwWhRp9jswevudsTc
 XSUHYNEPUsMGF/KwvNjSrL91KIBHktuyxYDzRifTNzxLqTghldjcWZSGaecTmAOzxmFzrDJmI3
 VSfKphrycZTOSz3KaxJL82X3yHJxWlYjtdL/T2KusAJRlat+xzR3S3q/XX4fpuJl09BQXpop/E
 uLg+gc+MYIGydGO2jw1KZiM9rBXrT1n86sX212MA4/14pV/EqP2Jg1W1H9T2DL9sOxVWKTtAOS
 Ntk=
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="33910010"
X-IronPort-AV: E=Sophos;i="5.83,291,1616425200"; 
   d="scan'208";a="33910010"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 22 Jun 2021 17:29:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 92C06EBA58
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 17:29:20 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D4F06B4E48
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 17:29:19 +0900 (JST)
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id B6FF740000436
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 17:29:19 +0900 (JST)
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] cve-check: Add allowlist that is same function of whitelist.
Date: Tue, 22 Jun 2021 17:29:17 +0900
Message-Id: <20210622082917.1567681-1-ito-yuichi@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

The Linux team plan to removed references to racially-charged jargon from
their code for more neutral and inclusive language.
So replace use of "whitelist" with "allowlist" in cve-check.

First, we add CVE_CHECK_ALLOWLIST and it is considered patched as well as
CVE_CHECK_WHITELIST.
We plan to replace about other word later and eventualy, replace all
"whitelist" to "allowlist".

Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
---
 meta/classes/cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 112ee3379d..5e3441a783 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -52,6 +52,7 @@ CVE_CHECK_PN_WHITELIST ?= ""
 # CVE_CHECK_WHITELIST = 'CVE-2014-2524 CVE-2018-1234'
 #
 CVE_CHECK_WHITELIST ?= ""
+CVE_CHECK_ALLOWLIST ?= ""
 
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??= ""
@@ -238,7 +239,7 @@ def check_cves(d, patched_cves):
     old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
     if old_cve_whitelist:
         bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_CHECK_WHITELIST.")
-    cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
+    cve_whitelist = d.getVar("CVE_CHECK_ALLOWLIST").split() + d.getVar("CVE_CHECK_WHITELIST").split()
 
     import sqlite3
     db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
-- 
2.25.1

