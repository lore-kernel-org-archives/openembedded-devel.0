Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7590277E4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 05:47:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20683707"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jun 2017 13:47:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7D28847E9887
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:47:29 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 30 Jun 2017 13:47:28 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Jun 2017 13:47:03 +0800
Message-ID: <1498801625-1064-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498801625-1064-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1498801625-1064-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 7D28847E9887.A66D6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5] [PATCH v3 1/3] qt5: add qt5-ptest.inc
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
X-List-Received-Date: Fri, 30 Jun 2017 05:47:34 -0000
Content-Type: text/plain

Add qt5-ptest.inc file for qt ptest related tasks
    1)	Rewrite do_compile_ptest task for qt
    2)	Add new do_compile_ptest_base and task do_install_ptest
    3)	Write do_populate_sysroot_append to resolve do_compile_ptest_base problem in yocto2.3
    The compile error log is shown as follow:
    cd auto/ && ( test -e Makefile || /yocto/work001/fnst/huangqy/work_qt/build/tmp/work/i586-poky-linux/qtxmlpatterns/5.8.0+gitAUTOINC+9f7e01b582-r0/recipe-sysroot-native/usr/bin/qt5/qmake -o Makefile /yocto/work001/fnst/huangqy/work_qt/build/tmp/work/i586-poky-linux/qtxmlpatterns/5.8.0+gitAUTOINC+9f7e01b582-r0/git/tests/auto/auto.pro ) && make -f Makefile
    Project ERROR: Could not find feature xml-schema.
    Makefile:42: recipe for target 'sub-auto-make_first' failed

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qt5-ptest.inc | 61 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 recipes-qt/qt5/qt5-ptest.inc

diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
new file mode 100644
index 0000000..da0b65a
--- /dev/null
+++ b/recipes-qt/qt5/qt5-ptest.inc
@@ -0,0 +1,61 @@
+SRC_URI += "file://run-ptest"
+
+inherit ptest
+
+addtask do_populate_sysroot after do_install before do_compile_ptest_base
+deltask do_compile_ptest_base
+addtask do_compile_ptest_base after do_populate_sysroot before do_install_ptest
+addtask do_install_ptest after do_compile_ptest_base before do_package
+
+do_compile_ptest() {
+    cd ${S}/tests
+    qmake -o Makefile tests.pro
+    oe_runmake
+}
+
+do_populate_sysroot_append() {
+    workdir = d.getVar('WORKDIR')
+    srcdir = workdir + '/sysroot-destdir/usr/'
+    destdir = workdir + '/recipe-sysroot/usr/'
+    
+    def copyFiles(sourceDir, targetDir, filelist):
+        for file in os.listdir(sourceDir):
+            sourceFile = os.path.join(sourceDir,  file)
+            targetFile = os.path.join(targetDir,  file)
+            filelist.append(targetFile)    #record the file list
+            if os.path.isfile(sourceFile):
+                if not os.path.exists(targetDir):
+                    os.makedirs(targetDir)
+                if not os.path.exists(targetFile) or(os.path.exists(targetFile) and (os.path.getsize(targetFile) != os.path.getsize(sourceFile))):
+                        open(targetFile, "wb").write(open(sourceFile, "rb").read())
+            if os.path.isdir(sourceFile):
+                First_Directory = False
+                copyFiles(sourceFile, targetFile, filelist)
+    
+    Tmpfilelist = []
+    copyFiles(srcdir, destdir, Tmpfilelist)
+    
+    fp=open(workdir + '/filelist', 'w')
+    for i in Tmpfilelist:
+        fp.write(i)
+        fp.write("\n")
+    fp.close()
+}
+
+fakeroot do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}
+    t=${D}${PTEST_PATH}
+    for var in ` find ${S}/tests/auto/ -name tst_*`; do
+        if [ -z ` echo ${var##*/} | grep '\.'` ]; then
+            echo ${var##*/} >> ${t}/tst_list
+            install -m 0644  ${var} ${t}
+        fi
+    done
+    for file in `cat ${WORKDIR}/filelist`; do
+       if [ -f $file ]; then
+           rm -f $file
+       fi
+    done 
+    rm -f ${WORKDIR}/filelist
+}
+
-- 
2.7.4




