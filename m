Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F95465D00
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 02:25:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w042Pm1c008643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Jan 2018 18:25:48 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 3 Jan 2018 18:25:47 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jan 2018 10:04:58 +0800
Message-ID: <20180104020458.14470-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] openl2tp: add ptest support
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
X-List-Received-Date: Thu, 04 Jan 2018 02:25:47 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add run-ptest
* Add patch to enable the regressin test

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../openl2tp/openl2tp/openl2tpd-enable-tests.patch | 24 ++++++
 .../recipes-protocols/openl2tp/openl2tp/run-ptest  | 97 ++++++++++++++++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     | 12 ++-
 3 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-enable-tests.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-enable-tests.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-enable-tests.patch
new file mode 100644
index 000000000..0bece2f4d
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-enable-tests.patch
@@ -0,0 +1,24 @@
+commit 3e96a6c41bdd26417265a45ed685138d8eed564e
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Fri Sep 14 02:32:53 2012 -0400
+
+    openl2tp: Enable tests
+    
+    Build the test direcctory as part
+    of the overall build
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/Makefile b/Makefile
+index 412cf4d..adf4f44 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,7 +16,7 @@ L2TP_FEATURE_LOCAL_CONF_FILE=	y
+ 
+ # Define to include test code. This must be defined to run the
+ # regression tests
+-# L2TP_TEST=		y
++L2TP_TEST=y
+ 
+ # Define to compile in debug code. Also makes default trace flags
+ # enable all messages
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
new file mode 100644
index 000000000..01c9c7b44
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
@@ -0,0 +1,97 @@
+#!/bin/sh
+
+TMP_DIR=`mktemp -d /tmp/std.26.tmp.XXXXXX`
+
+# restore the file if exist
+restore_file()
+{
+	filelist="test_procs.tcl tunnel.test session.test"
+	for file in ${filelist}
+	do
+		if [ -f ${TMP_DIR}/${file} ]; then
+			mv ${TMP_DIR}/${file} ${OPENL2TP_DIR}
+		fi
+	done
+}
+
+exit_cus()
+{
+	restore_file
+	echo $1
+	exit $2
+}
+
+if [ -d /usr/lib64/openl2tp/ptest ]; then
+	OPENL2TP_DIR="/usr/lib64/openl2tp"
+elif [ -d /usr/lib/openl2tp/ptest ]; then
+	OPENL2TP_DIR="/usr/lib/openl2tp"
+else
+	exit_cus "The openl2tp ptest directory not installed, skip the test" 1
+fi
+
+#read -p "Please input the network interface you use to test(such as eth0, em1 etc):" ETH_TEST
+echo "Please input the network interface you use to test(such as eth0, em1 etc):"
+read ETH_TEST > /dev/null
+
+if [ x"$ETH_TEST" = x ]; then
+    exit_cus "The network interface cannot be null" 1
+fi
+ifconfig | grep $ETH_TEST > /dev/null || exit_cus "The network interface you provide is invalid" 1
+
+# check openl2tp related kernel config
+zcat /proc/config.gz | grep CONFIG_L2TP=y > /dev/null || exit_cus "Failed to check CONFIG_L2TP=y, skip the tests." 1
+zcat /proc/config.gz | grep CONFIG_PPPOL2TP=m > /dev/null || exit_cus "Failed to check CONFIG_PPPOL2TP=m, skip the tests." 1
+
+SYSV_INIT="/etc/init.d/rpcbind"
+if [ -e ${SYSV_INIT} ]; then
+	${SYSV_INIT} status > /dev/null || ${SYSV_INIT} start > /dev/null
+else
+	systemctl status rpcbind > /dev/null || systemctl start rpcbind > /dev/null
+fi
+
+which systemctl > /dev/null && systemctl status rpcbind > /dev/null || service rpcbind status > /dev/null
+[ $? -ne 0 ] && exit_cus "Failed to start rpcbind service, skip the tests." 1
+
+# backup the below files
+cp ${OPENL2TP_DIR}/ptest/test_procs.tcl $TMP_DIR
+cp ${OPENL2TP_DIR}/ptest/tunnel.test $TMP_DIR
+cp ${OPENL2TP_DIR}/ptest/session.test $TMP_DIR
+
+# customise the config
+if [ x"$ETH_TEST" = x ]; then
+	exit_cus "Please set ETH_TEST which used to test first, skip the tests." 1
+fi
+
+sed -i 's/eth2/'\"$ETH_TEST\"'/g' ${OPENL2TP_DIR}/ptest/test_procs.tcl
+test_ip="`ifconfig $ETH_TEST | grep 'inet ' | sed 's/^.*inet addr://g' | \
+    sed 's/ *Mask.*$//g'|sed 's/ *Bcast.*$//g'`"
+sed -i 's/192.168.0.1/'"$test_ip"'/g' ${OPENL2TP_DIR}/ptest/tunnel.test
+
+# load module l2tp_ppp
+modprobe  l2tp_ppp > /dev/null
+lsmod | grep l2tp_ppp > /dev/null || exit_cus "FAIL: Load module l2tp_ppp" 2
+
+# start openl2tpd
+ps aux | grep openl2tpd | grep -v grep > /dev/null && killall openl2tpd > /dev/null
+ppp_path=`rpm -ql openl2tp | grep ppp_null.so`
+echo "test it here"
+/usr/sbin/openl2tpd -d all -D -f -p ${ppp_path} &  > /dev/null
+
+# prepare the test env
+rm -rf $OPENL2TP_DIR/results
+mkdir -p $OPENL2TP_DIR/results || exit_cus "FAIL: mkdir $OPENL2TP_DIR/results" 2
+cp /usr/bin/l2tpconfig ${OPENL2TP_DIR} || exit_cus "FAIL: copy /usr/bin/l2tpconfig to ${OPENL2TP_DIR}" 2
+
+# start the test
+cd ${OPENL2TP_DIR}/ptest && tclsh all.tcl -preservecore 3 -verbose bps -tmpdir $OPENL2TP_DIR/results -outfile test-l2tpd.result -constraints "l2tpdRunning peerProfile tunnelProfile sessionProfile pppProfile system" -match "peer_profile-1.1 tunnel_profile-1.1 session_profile-1.1 ppp_profile-1.1 system-1.1"
+
+# check the result
+PASSNUM=`grep PASS $OPENL2TP_DIR/results/test-l2tpd.result | wc -l`
+FAILNUM=`grep FAIL $OPENL2TP_DIR/results/test-l2tpd.result | wc -l`
+if [ $PASSNUM -ne 0 ] && [ $FAILNUM -eq 0 ]; then
+    echo "PASS: openl2tp"
+else
+    echo "FAIL: openl2tp"
+fi
+
+restore_file
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index bbde8a337..bf6850b17 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -31,6 +31,8 @@ SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
            file://openl2tpd-initscript-fix-sysconfig.patch \
            file://openl2tpd-initscript-fix-warning.patch \
            file://openl2tpd.service \
+           file://openl2tpd-enable-tests.patch \
+           file://run-ptest \
            "
 
 SRC_URI_append_libc-musl = "\
@@ -41,7 +43,7 @@ SRC_URI_append_libc-musl = "\
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
 
-inherit autotools-brokensep pkgconfig systemd
+inherit autotools-brokensep pkgconfig systemd ptest
 
 SYSTEMD_SERVICE_${PN} = "openl2tpd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
@@ -85,4 +87,12 @@ do_install_append () {
     fi
 }
 
+do_install_ptest () {
+    for i in all.tcl configfile.test peer_profile.test ppp_profile.test \
+    session_profile.test session.test system.test test_procs.tcl \
+    thirdparty_lns.test tunnel_profile.test tunnel.test; do
+        install -m 0755 ${S}/test/$i ${D}${PTEST_PATH}
+    done
+}
+
 RDEPENDS_${PN} = "ppp ppp-l2tp bash"
-- 
2.13.3


