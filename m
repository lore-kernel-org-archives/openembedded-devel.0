Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 90E206C138
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 08:23:13 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b85so4590015pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 00:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=OxrxaqaNcrcnrQWKyTf4WAMoYumSlo976MHc/yibnNs=;
	b=g6QK3EQ8C+6BjESFZR49lyNoNhKraEjLajKiuz4ztZvushWbVbaaOio0ruZ9TMODxg
	tof3GIKU6GJs9G8vnwAvwFoHiubGipIHJpxRKoyxVXLtxEg9R/e1e4cSrICyFjao9mbA
	yOI5P1hJsAMwG9rz1ezVT18qzLeMZK5LguxwQPtcg/4bIS/uRTtYqLSjxmMXPwwxRhpT
	/t9ZtXOoUE7SaPEpN+KwoRLHXg2yRudG30dn7eAl94DLFw76/5SOF1WRabzYsJlHETyE
	xXjCHHaNWqIyemtE7MqrtPjOktlI/eos81bDsRdNeFUzg3/YLM7nx14p0QkjjcV/kv5r
	PXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OxrxaqaNcrcnrQWKyTf4WAMoYumSlo976MHc/yibnNs=;
	b=iDf8CChDtsP8bk9Z10xtg49Q+DPlqwh+DDYOpCpCrI5wERR2oSLcMjioWy7afsYCJM
	YoATcPqVVQT98RwUho0vUX/fR7j+cKoRNK1M+kprCePSRxDxqTZKmIoQgWMeOlCsKrTH
	d79RxKK4bmFusNcOlU7sokgUo9d/XBWq9q9Ad73vtWz9LV8u8DNhOzoVzA0kIPh2/ltG
	jHoVQY7kWyFzoLq9HrOyJJunTD27u8VXj+bQKVxM/euau+wrAIp5a37ht/66qi9SstL8
	blV7B0YQDljYxpbeNDpcowNlLP+qQHK/ro00ficadM0JTvoVn1EKNoj9v7bLx4qGo0WQ
	tIYw==
X-Gm-Message-State: AA+aEWaXwkrhLq8daGBe172niiM4ToixObc77CKkUI4iIvq3Tz1yy4V0
	Ny2s4pqxMZd+mVONLR2AxWQhEr3PSLs=
X-Google-Smtp-Source: AFSGD/XncFzb/c8y6gfs0BJuR5W+NBpcubTyjSleOCc2IiF4VicIl/J2AbZFuAc1DNE/Ee8cTUu8GQ==
X-Received: by 2002:a62:8e19:: with SMTP id k25mr9029757pfe.185.1545553394325; 
	Sun, 23 Dec 2018 00:23:14 -0800 (PST)
Received: from apnavik-DESK.iind.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39]) by smtp.gmail.com with ESMTPSA id
	u8sm41342323pfl.16.2018.12.23.00.23.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Dec 2018 00:23:13 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:54:43 +0530
Message-Id: <1545553483-17422-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wifi-test-suite: Initial recipe for wifi test suite.
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
X-List-Received-Date: Sun, 23 Dec 2018 08:23:13 -0000

Add generic recipe for wifi test suite from wifi alliance.
Suite is to support certification program development and device certification.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../wifi-test-suite/wifi-test-suite_git.bb         | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
new file mode 100644
index 0000000..3890f2f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
@@ -0,0 +1,43 @@
+SUMMARY  = "Wi-Fi Test Suite Linux Control Agent"
+DESCRIPTION = "Wi-Fi Test Suite is a software platform originally developed \
+by Wi-Fi Alliance, the global non-profit industry association that brings you \
+Wi-Fi, to support certification program development and device certification."
+HOMEPAGE = "https://www.wi-fi.org/certification/wi-fi-test-suite"
+LICENSE  = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
+SECTION = "test"
+
+S = "${WORKDIR}/git"
+SRCREV = "f7a8d7ef7d1a831c1bb47de21fa083536ea2f3a9"
+SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git"
+
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	install -d ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
+	install -d ${D}${sbindir}
+	install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
+	install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
+	install -m 0755 ${S}/WTGService/WTG ${D}${sbindir}
+	install -m 0755 ${S}/console_src/wfa_con ${D}${sbindir}
+# Test scripts
+	install -m 0644 ${S}/scripts/getipconfig.sh ${D}${sbindir} # Must copy
+	install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
+	install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
+	install -m 0644 ${S}/scripts/findprocess.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/getpid.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/getpstats.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/gpstats.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
+	install -m 0644 ${S}/scripts/stoping.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/updatepid.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/wfaping6.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/wfaping.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/wfa_test_cli.sh ${D}${sbindir}
+}
-- 
2.7.4


