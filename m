Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail2.br-automation.com
	[213.33.116.61])
	by mail.openembedded.org (Postfix) with ESMTP id 878F86FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 09:23:58 +0000 (UTC)
X-AuditID: c0a80110-5afff70000000f12-24-5710b32e00c4
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by  () with SMTP id 62.40.03858.E23B0175;
	Fri, 15 Apr 2016 11:23:59 +0200 (CEST)
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2016 11:23:42 +0200
Message-Id: <1460712222-17193-1-git-send-email-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.8.0
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 15/04/2016 11:24:14,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 15/04/2016 11:24:19,
	Serialize complete at 15/04/2016 11:24:19,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 15.04.2016 11:23:56,
	Serialize by Router on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 15.04.2016 11:23:56,
	Serialize complete at 15.04.2016 11:23:56
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDJMWRmVeSWpSXmKPExsVyYAWjja7+ZoFwg2dfhSwuHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujJZp2xgLfvBWTL85h7WBcQpPFyMnh4SAicTqj5NZuhi5OIQE
	5jBKrPm2lgkkwSZgK3FkwlcWEFtEQFfi44e5jCA2s4C1xPvlC1i7GDk4hAWiJE7PNQMJswio
	Slzc384MYvMKBEtsWd3EBjFfTmLd5O/sIPMlBDaySMy6/Y4ZIiEkcXrxWeYJjNwLGBlWMYrn
	JmbmGOklFekmlpbk5yaWZObn6SXn525ihPhRYAfj7jfahxgFOBiVeHiXLxAIF2JNLCuuzD3E
	KMHBrCTC+3A9UIg3JbGyKrUoP76oNCe1+BCjNAeLkjhvQwlQSiA9sSQ1OzW1ILUIJsvEwSnV
	wBjdJRRze+Fzkannt0h8tmCf9LTqzXO9k4WGgrO7vnf/5+CXED3OV+L4U3+jvEf//3C1M6I3
	f71Q2Kx7TNnl6i9FFoPNG65bHi68uuPynFavy+VFEm2He3ouVNd3TvAWW/dtBmu9mI6zbn6h
	u0nxyfeVkZ/kDX3mz4/4c3wSe6DNr42qXf/mXlRiKc5INNRiLipOBAB/uRvq3wEAAA==
Subject: [meta-networking][PATCH] samba: add volatile file to support readonly rootfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2016 09:24:00 -0000

This patch adds a volatile file for samba which was removed by the
update from 3.6.25 to 4.1.12. This file is necessary to build a image
that uses the read-only-rootfs feature.

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba         | 3 +++
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb             | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba b/meta-networking/recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba
new file mode 100644
index 0000000..4bdfa7d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba
@@ -0,0 +1,3 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/log/samba none
+d root root 0755 /var/run/samba none
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index ff58dae..a0ede00 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -146,6 +146,7 @@ do_install_append() {
     install -d ${D}${sysconfdir}/samba
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
     install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
+    install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
 
     install -d ${D}${sysconfdir}/sysconfig/
     install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
-- 
2.8.0


