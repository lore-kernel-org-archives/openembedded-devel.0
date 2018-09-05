Return-Path: <a.filippov@yadro.com>
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
	by mail.openembedded.org (Postfix) with ESMTP id 92BB574FBA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:11:03 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 58BEC411FB;
	Wed,  5 Sep 2018 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received:received; s=
	mta-01; t=1536163863; x=1537978264; bh=5e2V8/THO44N8QjlvUcMkpQ2G
	jVcfNvCLU9txSzW9Dk=; b=i9s4VSfCOjg159//3KM2BwAyvyaTRmrbh2Z3D6N9K
	dDbRBKTDfb75G8VDCOl/RQqOzjiZ0cAkIeFhionp8w+2pdgidzC5T7Sc5K4BCDY2
	sP/he+kwiwy2s94n4o681Lu6Fw6MDkEbfu/MwQYhVOYpz5lf29n8kP1bVWU/QZMS
	Ag=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nV-7HakpgxeR; Wed,  5 Sep 2018 19:11:03 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 6A54E404D1;
	Wed,  5 Sep 2018 19:11:03 +0300 (MSK)
Received: from bbwork.com (172.17.15.155) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Wed, 5 Sep 2018 19:11:03 +0300
From: Alexander Filippov <a.filippov@yadro.com>
To: <openembedded-devel@lists.openembedded.org>, Joe MacDonald
	<joe_macdonald@mentor.com>
Date: Wed, 5 Sep 2018 19:10:49 +0300
Message-ID: <20180905161049.13809-1-a.filippov@yadro.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
X-Originating-IP: [172.17.15.155]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
Cc: openbmc@lists.ozlabs.org
Subject: [sumo][meta-networking][PATCH] split net-snmp-libs into smaller packages
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
X-List-Received-Date: Wed, 05 Sep 2018 16:11:04 -0000
Content-Type: text/plain

By default `net-snmp-libs` contains all compiled libs.
This commit splits `net-snmp-libs` into subpackages for each library.

This allows for smaller resulting image due to finer packaging.

Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index faf73a563..4ea0a5915 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -173,17 +173,21 @@ net_snmp_sysroot_preprocess () {
     fi
 }
 
-PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
+PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client \
+             ${PN}-server-snmpd ${PN}-server-snmptrapd \
+             ${PN}-lib-netsnmp ${PN}-lib-agent ${PN}-lib-helpers \
+             ${PN}-lib-mibs ${PN}-lib-trapd"
 
 # perl module
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}-perl-modules', '', d)}"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-server = "1"
+ALLOW_EMPTY_${PN}-libs = "1"
 
 FILES_${PN}-perl-modules = "${libdir}/perl/*"
 
-FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-libs = ""
 FILES_${PN}-mibs = "${datadir}/snmp/mibs"
 FILES_${PN}-server-snmpd = "${sbindir}/snmpd \
                             ${sysconfdir}/snmp/snmpd.conf \
@@ -196,6 +200,12 @@ FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd \
                                 ${systemd_unitdir}/system/snmptrapd.service \
 "
 
+FILES_${PN}-lib-netsnmp = "${libdir}/libnetsnmp${SOLIBS}"
+FILES_${PN}-lib-agent = "${libdir}/libnetsnmpagent${SOLIBS}"
+FILES_${PN}-lib-helpers = "${libdir}/libnetsnmphelpers${SOLIBS}"
+FILES_${PN}-lib-mibs = "${libdir}/libnetsnmpmibs${SOLIBS}"
+FILES_${PN}-lib-trapd = "${libdir}/libnetsnmptrapd${SOLIBS}"
+
 FILES_${PN} = ""
 FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
 FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
@@ -219,10 +229,15 @@ SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'net-snmp-perl-modules', '', d)}"
 RDEPENDS_${PN} += "net-snmp-client"
 RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
-RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
+RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd ${PN}-lib-trapd"
 RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
 RDEPENDS_${PN}-client += "net-snmp-mibs net-snmp-libs"
-RDEPENDS_${PN}-libs += "libpci"
+RDEPENDS_${PN}-libs += "libpci \
+                        ${PN}-lib-netsnmp \
+                        ${PN}-lib-agent \
+                        ${PN}-lib-helpers \
+                        ${PN}-lib-mibs \
+"
 RDEPENDS_${PN}-ptest += "perl \
                          perl-module-test \
                          perl-module-file-basename \
-- 
2.14.4


