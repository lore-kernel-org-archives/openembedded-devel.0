Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDD5D6E2B6
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 05:29:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6769.1732080576334232213
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 21:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1054f72aee=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK5CPt3013285
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 21:29:35 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7ut53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 21:29:35 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 19 Nov 2024 21:29:34 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 19 Nov 2024 21:29:34 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-networking][PATCH] openvpn: add ptest support
Date: Wed, 20 Nov 2024 13:29:33 +0800
Message-ID: <20241120052933.2174895-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lR9O0xQJezG9eaVdKaNehLbCO5Gyd1ZM
X-Proofpoint-GUID: lR9O0xQJezG9eaVdKaNehLbCO5Gyd1ZM
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673d73bf cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=uDo-SIiEAAAA:8 a=9dNbsytUAAAA:8 a=t7CeM3EgAAAA:8 a=xTxiDkjYvB-ne5mhvqgA:9 a=Rkhf4GTZPwEC63LfVcCP:22
 a=gPpeecpFUKP6j8iU7U-x:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_02,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 05:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113921

From: Jiaying Song <jiaying.song.cn@windriver.com>

All test cases PASS.
Add openvpn to PTESTS_SLOW because test duration longer than 30s Below is parts of the run log:
[==========] xkey provider tests: Running 3 test(s).
[ RUN      ] xkey_provider_test_fetch
[       OK ] xkey_provider_test_fetch
[ RUN      ] xkey_provider_test_mgmt_sign_cb
[       OK ] xkey_provider_test_mgmt_sign_cb
[ RUN      ] xkey_provider_test_generic_sign_cb
[       OK ] xkey_provider_test_generic_sign_cb
[==========] xkey provider tests: 3 test(s) run.
[  PASSED  ] 3 test(s).
PASS: provider_testdriver

The files t_client.sh.in and t_cltsrv.sh were not added because they
require specific environment configuration files. It is recommended that
users configure these based on their environment before testing.

Since the recipe enables iproute2, the condition for t_net.sh based on
HAVE_SITNL is not met, so t_net.sh will not be included in the build.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../ptest-packagelists-meta-networking.inc    |  1 +
 .../recipes-support/openvpn/openvpn/run-ptest |  5 ++
 .../recipes-support/openvpn/openvpn_2.6.12.bb | 48 ++++++++++++++++++-
 3 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/run-ptest

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 7ec6f9063d..2197a06e74 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -25,6 +25,7 @@ PTESTS_FAST_META_NETWORKING = "\
 #    firewalld
 PTESTS_SLOW_META_NETWORKING = "\
     net-snmp \
+    openvpn \
 "
 
 PTESTS_PROBLEMS_META_NETWORKING = "\
diff --git a/meta-networking/recipes-support/openvpn/openvpn/run-ptest b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
new file mode 100644
index 0000000000..5b187d9086
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+for x in `find ./ -name Makefile`;
+do
+	make -C `dirname ${x}` -k runtest-TESTS
+done
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
index d81b8ce449..958eecb63a 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
@@ -3,13 +3,14 @@ HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89196bacc47ed37a5b242a535661a049"
-DEPENDS = "lzo lz4 openssl iproute2 libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "lzo lz4 openssl iproute2 libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} ${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)} "
 
-inherit autotools systemd update-rc.d pkgconfig
+inherit autotools systemd update-rc.d pkgconfig ptest
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
            file://openvpn \
+           file://run-ptest \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
@@ -42,6 +43,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
+RDEPENDS:${PN}-ptest:append = " make bash"
+
 do_install:append() {
     install -d ${D}/${sysconfdir}/init.d
     install -m 755 ${UNPACKDIR}/openvpn ${D}/${sysconfdir}/init.d
@@ -63,6 +66,47 @@ do_install:append() {
     install -d -m 710 ${D}/${localstatedir}/lib/openvpn
 }
 
+do_compile_ptest () {
+    for x in `find ${B}/tests/unit_tests -name Makefile -exec grep -l buildtest-TESTS {} \;`; do
+        dir=`dirname ${x}`
+        case $dir in
+            *example*)   
+                echo "Skipping directory: $dir"
+                ;;
+            *)           
+                oe_runmake -C ${dir} buildtest-TESTS
+                ;;
+        esac
+    done
+}
+
+do_install_ptest() {
+    for x in $(find ${B}/tests/unit_tests -name Makefile -exec grep -l buildtest-TESTS {} \;); do
+        dir=$(dirname ${x})
+
+        if [[ "$dir" == *example* ]]; then
+            continue
+        fi
+
+        target_dir="${D}/${PTEST_PATH}/unit_tests/$(basename ${dir})"
+        mkdir -p ${target_dir}
+        cp -f ${dir}/Makefile ${target_dir}/        
+        sed -i "s/^Makefile:/MM:/g" ${target_dir}/Makefile
+        sed -i 's/^#TESTS = $(am__EXEEXT_4)/TESTS = $(am__EXEEXT_4)/' ${target_dir}/Makefile
+
+        for testfile in $(find ${dir} -name "*testdriver"); do
+            cp -rf ${testfile} ${target_dir}/
+        done
+    done
+    sed -i 's|find ./|find ${PTEST_PATH}|g' ${D}${PTEST_PATH}/run-ptest
+    sed -i 's|${top_builddir}/src/openvpn|${sbindir}|g' ${S}/tests/t_lpback.sh
+    cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
+    cp -f ${B}/tests/Makefile ${D}/${PTEST_PATH}
+    sed -i "s/^Makefile:/MM:/g" ${D}/${PTEST_PATH}/Makefile
+    sed -i "s/^test_scripts = t_client.sh t_lpback.sh t_cltsrv.sh/test_scripts = t_lpback.sh/g" ${D}/${PTEST_PATH}/Makefile
+    
+}
+
 PACKAGES =+ " ${PN}-sample "
 
 RRECOMMENDS:${PN} = "kernel-module-tun"
-- 
2.34.1


