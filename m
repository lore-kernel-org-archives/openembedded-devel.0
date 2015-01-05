Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E95B37213F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:51:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2015 02:51:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="664505009"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2015 02:51:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:51:26 +0000
Message-Id: <e09d4af1e645cae650dfafe89956e24b66b87953.1420454954.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 1/5] ntp: fix file locations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 10:51:56 -0000

After the upgrade to 4.2.8, ntp's configure process now uses a custom
script which looks at the host to determine what install locations it
should use. This resulted in the recipe working on some people's
machines and failing during do_install on others. Force it to use the
"redhat" configuration as this seems closest to what we used to be
using prior to the upgrade (this means that binaries are now back in
sbindir as they used to be).

Thanks to Philip Balister for reporting this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8.bb | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
index 7e1b1c1..e14921a 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
@@ -35,6 +35,7 @@ EXTRA_OECONF += "--with-net-snmp-config=no \
                  --without-ntpsnmpd \
                  ac_cv_header_readline_history_h=no \
                  --with-yielding_select=yes \
+                 --with-locfile=redhat \
                  "
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
@@ -71,10 +72,10 @@ do_install_append() {
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${bindir}/ntpdate-sync
-    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${bindir}/ntptrace
-    sed -i '/use/i use warnings;' ${D}${bindir}/ntptrace
-    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${bindir}/ntp-wait
-    sed -i '/use/i use warnings;' ${D}${bindir}/ntp-wait
+    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntptrace
+    sed -i '/use/i use warnings;' ${D}${sbindir}/ntptrace
+    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntp-wait
+    sed -i '/use/i use warnings;' ${D}${sbindir}/ntp-wait
 
     install -d ${D}/${sysconfdir}/default
     install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate
@@ -90,8 +91,6 @@ do_install_append() {
 
     install -d ${D}${systemd_unitdir}/ntp-units.d
     install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
-
-    rmdir ${D}${sbindir}
 }
 
 PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
@@ -120,19 +119,19 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
 
 RSUGGESTS_${PN} = "iana-etc"
 
-FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
+FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
     ${NTP_USER_HOME} \
     ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
 "
-FILES_${PN}-tickadj = "${bindir}/tickadj"
-FILES_${PN}-utils = "${bindir} ${datadir}/ntp/lib"
-FILES_ntpdate = "${bindir}/ntpdate \
+FILES_${PN}-tickadj = "${sbindir}/tickadj"
+FILES_${PN}-utils = "${sbindir} ${datadir}/ntp/lib"
+FILES_ntpdate = "${sbindir}/ntpdate \
     ${sysconfdir}/network/if-up.d/ntpdate-sync \
     ${bindir}/ntpdate-sync \
     ${sysconfdir}/default/ntpdate \
     ${systemd_unitdir}/system/ntpdate.service \
 "
-FILES_sntp = "${bindir}/sntp \
+FILES_sntp = "${sbindir}/sntp \
               ${sysconfdir}/default/sntp \
               ${systemd_unitdir}/system/sntp.service \
              "
-- 
1.9.3


