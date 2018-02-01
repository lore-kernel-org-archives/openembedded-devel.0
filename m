Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 14485 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Feb 2018 12:15:02 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0119.outbound.protection.outlook.com [104.47.2.119])
	by mail.openembedded.org (Postfix) with ESMTP id 2C53C77BD2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NXcjRlEhMnsuoVesyReCV/0DjsYgWbgfAL8IUQnBZ68=;
	b=TwFHwpEVqZY6+x31OQDSGRzfx9IgnU8Jg5zlKZBWH/HwficJtZAHreVQc0lpaRZKYA/J8ygRGgmg6NOB+rWdXNvpQ3Ing8FPKnhfc/nT6q4ZadjDSqwGEz8rbU3lX6g/jupqEuQEmCgDIxwQGShkTqXqZ84ajwHGW+gnGyHD3Sw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	VI1PR0202MB2589.eurprd02.prod.outlook.com (2603:10a6:801:6::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.444.14;
	Thu, 1 Feb 2018 06:39:53 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Feb 2018 08:39:32 +0200
Message-Id: <20180201063932.8510-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: HE1PR0102CA0018.eurprd01.prod.exchangelabs.com
	(2603:10a6:7:14::31) To VI1PR0202MB2589.eurprd02.prod.outlook.com
	(2603:10a6:801:6::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82e76fd1-cf21-4458-d1ef-08d5693e9a6f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:VI1PR0202MB2589; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2589;
	3:cupXfVdRvkFHoLYGtUvHZ185mdx3JH8U3rNs9/HO4nboQlgmV0XemRxk1OPYbnXHa9oaSO/35GzpJUCS36jxfVFdkJxlkN3Rzj78clU52sORbobEw7VdPyZXJJEBcJRm7hW1eUu/exdR+obSbMFK3k2UPYqx4WQsEzbiqz9OzycgWlebB+3OIAPLSq9goSZORqkKypZkJ/0n8BbE+ktFCD8kHNSStt8p7V30NK36PTeC15qhbZyLkTWUKPrw3Sww;
	25:gcqV+djaZ/5uvWdLIjLrxtJhAkRJBcOmVTfKNNeZttdKIH3O/JLp/VO8sLB4ONLQT8+PKXg0m5SppbN0CX5+Dnx8UV+Pg2Bfb7D5FBb98GIxgWYHnWh+UA2DJYfZ/DxnCGidE9oy5uS2njEkIHkujqIt1FGLTcrT9I5fJNdu0Tvh+GS2fAnIGeOaCiG7wdBEtxzL2Z8eFpJh/PLkD2tjjvFh+0RPwBFvwUIPicQDu9r20lSAWwf/qHhUyDRZ9KJMJAOmjWiqHh15utCCq0fF/Q9dJ6vNW5pyQzEqrpjmtGTpjkGgfMN74OALW9fOJnAIo0MvpU3uZoJeiJxJQGlb2w==;
	31:M2Ok1NENBtPEJ4PdZzlvcXXSKVLu98cK/Bu96+S+eB8/kl/jCjfI3x+HDY26pgljG7cQTB1N4QrPyF7gVvS+Kg/yZWvqhuqI2bQwRqTHrxy+SFf9ZF8/X/akM0qw/tv8pBnvdZB3AMjLRlqEymwLRFV3EaBecsfNRKSa+Mg+TzGQjCXgHe/EHFmsYAjBVisFawuqoJN+dW1m60N6AmsMr8cRKQZNqo0DVVd7AntbFqs=
X-MS-TrafficTypeDiagnostic: VI1PR0202MB2589:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2589;
	20:RtfzoxCp7Sus9mhgjMURT4vUmtqX5D66xkVlL+IRGZCgrJAOYhHKUzkaST3mFr3ZYD+9mtNARdHBIikappzisYomKZSX8/Jy5JjTZxVQw8D3edNwtbAEFf+DjgQsoRyYlTp8eI92IYi2QYozuHocK6zKpOHz+VIoeLalgrLFomL8/XTmciQ4Zw4MQzs0AQfmDPDohbIOS7KDACvdpDOL1klTAw3MiUXHvv7rU/YgqiTbhBcHc8db1ZZDkR/ZUJSWYcBLu03BgVpytiCFFhx8QbKrBrMSxIZ1KZaODBuT8pRYWD+aJgXbUjdjnrbwej3Xr/eH3mQr/7AdOB2EfRjQQKkfqyUi/8TqrfCmpxyyihgDXhCGZmTSdtyJsgSQWmBjYRu/qIewmIAT5wazDVEWNN8angZkqSvUCguF/tED7dkomfDwg6ubnhm7sZqbUFriGAKhoRE7Iv9B3+T5ynQ5PfpCxj8bSzFU8h7MmRaAOvTU1HJ0sFv5Gc5tLAUAf55P;
	4:cxyikOmvUTUVEyn02kZ7jqxhnXpafA8Gjrd2Oq4FPns1eAiqC9WDBRbsgHhBYGuomU23yTaIQvQApLsVt6YuUEyoZfnaEkKPv5zFuFswUR6RPPXzcJ69U+mIDSfQBil9vAyodLUskVaka0/gwhLzZWia0tmfVz1z/aaUOAqg/FL/FLMJ8jD+qQHIm8rjuctxWllKto6FvAMktoh+yvgT2FwcZoU1pnxjxJQWXhKueCYWhKF0Dj3xEYDzSkZ1HgefengZlyiixiag94CsQWD5xRuMn5b2CxnjjdbGaMy4/mJr2qwX5nmP5bI+hZoaeVUY
X-Microsoft-Antispam-PRVS: <VI1PR0202MB258946FDA7E9EA882872939AE9FA0@VI1PR0202MB2589.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3231101)(2400082)(944501161)(3002001)(93006095)(93001095)(10201501046)(6041288)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011);
	SRVR:VI1PR0202MB2589; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0202MB2589; 
X-Forefront-PRVS: 0570F1F193
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(39380400002)(346002)(366004)(376002)(39850400004)(199004)(189003)(316002)(305945005)(386003)(50226002)(1076002)(51416003)(7736002)(186003)(47776003)(3846002)(105586002)(26005)(59450400001)(53386004)(25786009)(8676002)(69596002)(74482002)(6506007)(66066001)(6666003)(6916009)(8936002)(52116002)(81166006)(33896004)(6116002)(16526019)(2906002)(68736007)(97736004)(2361001)(48376002)(50466002)(6486002)(5660300001)(6306002)(81156014)(86362001)(106356001)(478600001)(53936002)(2351001)(6512007)(966005)(36756003)(53416004)(16586007)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2589;
	H:piippo.intra.qt; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0202MB2589;
	23:7Fl1fiX/dIH1IBxLCxjAdqHnw5MbGzd4WblkSDg?=
	=?us-ascii?Q?GU2ubDD/1vW1vTcBtEKpQ5cMvPddUAw9OVEGV2mf1tleUnIiPKWVnp6YMb3H?=
	=?us-ascii?Q?8RU59O1ITcIoFSkY1n6tz/E7r/uUIpHvnEJRqYz+DeFgKTCBHDsnEAO7VTMy?=
	=?us-ascii?Q?rwB/jN2+nzhs4BI2Yz61dXz903LF25svs+R2m5Q/2bRWZFYu/D2glqQNE90A?=
	=?us-ascii?Q?HaI5lIDUluCAUPoquws9CoFA7RAYzsrccUe6jmR51YJSsVTQ8iL9x5Hcz8Yt?=
	=?us-ascii?Q?cTHZX5YefHeim2PcWPJkhJ2vM1DDB7pG/QQKY+NuR4fFMm5a98pJpke/WcS+?=
	=?us-ascii?Q?fgpa32JthwG1csKhNLGeEs1fkHSlUEhcdtvQCVH7wJ3fUPaUCuuJxfIx69Fu?=
	=?us-ascii?Q?9ehQdYo7X729IQladujEZ0JMn/Ymxy55igsA/YeOs9ym+FdO4EJ5SWdGDAsb?=
	=?us-ascii?Q?QhLzEMcIBUE9UEm1c+XY4l2FFwNg5srJqpZC5CcB7f0YF71+ZMlPzi1JUzm1?=
	=?us-ascii?Q?FzHqGLLxMVTkDuC1Q81zakH/Xq0fXU/Q9BPlGQt0dDAjIF2NNwHuQd5bugWF?=
	=?us-ascii?Q?/LH3h7vG8kj9QMuFEELaps3UdlQwNena1im1yoYmEgG742vbZcOHj2wKKnw8?=
	=?us-ascii?Q?51zwPvxwE6Nk7otO59uvZWI8YqXvvHRqmPn/UZUyiHdpzOKyMsyvfPe8cy+x?=
	=?us-ascii?Q?kNRTnfamoa/kF0sXo6X8ZwsDMGgJeIUw9zDQabVkcWngrc650Ktu+0nuYD5q?=
	=?us-ascii?Q?V2OLEJCFW9Ylt6dq11gTi5Ae1mrLZvsmiksBnQp6y7fXh02rMjihmFb3Dm9M?=
	=?us-ascii?Q?cGTva8hEiHHNZZUOIwAdsL4TwKVxlNday1Ks+eOmZxui+/31EYkw10sPgcT2?=
	=?us-ascii?Q?CaXtZlj7grdYKvZNCXGE4ZpGGmAIIzA2PuJPUv9LmvAX1slrkKCGvhX0mPj+?=
	=?us-ascii?Q?jKyrFAaty+JuxBKWi+vdhLXMhHf9ifHKQOJ/e35dTyE2zPuSFkoC8NYRKk0g?=
	=?us-ascii?Q?pGcmKz+Yr9oO7/XWeb1ZcR7514kPnGNFVPPv8XZ5YMXMncwZtNEsbstu10PA?=
	=?us-ascii?Q?KaKff9wZfiP16NREn3RLuA7mm3ftuH+hDuU/bJBVMrd8lqSjTVrNnqvP/51F?=
	=?us-ascii?Q?27TQTlW2m4zQvpvKfk1dXS9cGEcpeImXqsJqcC+FtBFS3MJL/Vc6jZeg63kb?=
	=?us-ascii?Q?v/C8nr1bifhzY38Dk94HgCXrYlXJ2L3n8rt9samIEbUBvgWjp7qdmMyvVoyA?=
	=?us-ascii?Q?JkCwZ8DuqvPKTNwiesCe4zJgUQiDQ5xrVnSAVgNXoPPEeVesHNILiO0ahxFe?=
	=?us-ascii?Q?ddg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2589;
	6:1y4aS4GTFkILG4EmjndbDlCKO5bCZR2v88owhip13+tTdzZGNYTOUmT8UcFucE9LGrnVfxUY3WUCufCBpT1mshF8PEtjc4vh05rLktmy3PVLAFPtzs5e/CBMcdTcimr7L+zfQL/y/e9GHeTbD+8YzkcfGJ8Bp9yeCmb6BAw0jHAyO+zijnMfQymO5Q0cd8dW7o+NCJOzx3wKTXLJn5jV+FlFCHdk1dsfS7kzlGquhAO6cnGDK3HNOpgcyZdd6Tb/FajgE+tRJ6L3riFpJ51PqwRwUh+Syx1X+jPNmamHcNpPPdzXACHLRg/gJhh8UrbZDzIu6tgcN/x/JwUgyoTqRdsGzx1flvdtQMt3FPx0OGU=;
	5:OnYzh6kn7HX3WGzqp8scQGJCATcXOeRYNkEsxR4LXeH+0qtgVnAdcez1qN8lyq1kQpz8FW5k++F00PeyfpoZvSfbYlbwGYuj9L0/n/uCMW/EOyOuvXcxLDwxygPXpTcXXxsmj5/QJoYDwQIkusFmc5HUah2hRiu4Yli6+9XLh/Q=;
	24:3VWt9Enn8aJUT/abI2k37SEekEVGjVgSXTQn0jT8CkTq1JjSNSSmnDElBBZ3XGgAYtypAutBmqF3qYSoUP0Rb1g9EwLuXFuSvthzMKkJbkc=;
	7:pVhBaewjIXDwor8RmIM+8HyKp3QiMwAvOp5A/+g1PyTU/B3baMVkVdYg4+EnW+9XCEIA2+f+uqchEF4DudDX/HtF6U9ETExspHyGoJihhmrxmc2gAmt2ojWPWs7dJVBVWsy6YDBrY0Xb5+gyDSntLFHoX+ntrVlpnnOV1uod+tIs9wJ95f8OcNfmDgmW6/+/XoJZrhmHw+SAolXrRjjCJT4x9q1EBBcAuqvMCoPrE3sN4jLBIe1b0icT0oESVTl8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2018 06:39:53.9420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e76fd1-cf21-4458-d1ef-08d5693e9a6f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2589
Subject: [meta-qt5][PATCH] qt5: refactor ptest
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
X-List-Received-Date: Thu, 01 Feb 2018 12:15:03 -0000
Content-Type: text/plain

Current implementation was causing build issues as it cluttered source
directories and modified recipe sysroot content. Tests are now build
in the separate build directory ${B} where we don't need to worry about
moving files to the recipe sysroot, and if tests are enabled in
PACKAGECONFIG, they have been already built during do_compile task.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-qt/qt5/{qtbase => ptest}/run-ptest |  0
 recipes-qt/qt5/qt5-ptest.inc               | 51 +++---------------------------
 recipes-qt/qt5/qtbase_git.bb               | 15 +--------
 recipes-qt/qt5/qtdeclarative/run-ptest     |  5 ---
 recipes-qt/qt5/qtquick1/run-ptest          |  6 ----
 recipes-qt/qt5/qttools_git.bb              | 15 ++-------
 recipes-qt/qt5/qtxmlpatterns/run-ptest     |  6 ----
 7 files changed, 9 insertions(+), 89 deletions(-)
 rename recipes-qt/qt5/{qtbase => ptest}/run-ptest (100%)
 delete mode 100644 recipes-qt/qt5/qtdeclarative/run-ptest
 delete mode 100644 recipes-qt/qt5/qtquick1/run-ptest
 delete mode 100644 recipes-qt/qt5/qtxmlpatterns/run-ptest

diff --git a/recipes-qt/qt5/qtbase/run-ptest b/recipes-qt/qt5/ptest/run-ptest
similarity index 100%
rename from recipes-qt/qt5/qtbase/run-ptest
rename to recipes-qt/qt5/ptest/run-ptest
diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
index 97bce88..56efe10 100644
--- a/recipes-qt/qt5/qt5-ptest.inc
+++ b/recipes-qt/qt5/qt5-ptest.inc
@@ -1,63 +1,22 @@
+FILESEXTRAPATHS_append := ":${THISDIR}/ptest"
 SRC_URI += "file://run-ptest"
 
 inherit ptest
 
-addtask do_populate_sysroot after do_install before do_compile_ptest_base
-deltask do_compile_ptest_base
-addtask do_compile_ptest_base after do_populate_sysroot before do_install_ptest_base
-deltask do_install_ptest_base
-addtask do_install_ptest_base after do_compile_ptest_base before do_package
-
 do_compile_ptest() {
-    cd ${S}/tests
-    qmake -o Makefile tests.pro
+    mkdir -p ${B}/tests
+    cd ${B}/tests
+    ${OE_QMAKE_QMAKE} -o Makefile ${S}/tests/tests.pro
     oe_runmake
 }
 
-do_populate_sysroot_append_class-target() {
-    workdir = d.getVar('WORKDIR', True)
-    srcdir = workdir + '/sysroot-destdir/usr/'
-    destdir = workdir + '/recipe-sysroot/usr/'
-    
-    def copyFiles(sourceDir, targetDir, filelist):
-        for file in os.listdir(sourceDir):
-            sourceFile = os.path.join(sourceDir,  file)
-            targetFile = os.path.join(targetDir,  file)
-            filelist.append(targetFile)    #record the file list
-            if os.path.isfile(sourceFile):
-                if not os.path.exists(targetDir):
-                    os.makedirs(targetDir)
-                if not os.path.exists(targetFile) or(os.path.exists(targetFile) and (os.path.getsize(targetFile) != os.path.getsize(sourceFile))):
-                        open(targetFile, "wb").write(open(sourceFile, "rb").read())
-            if os.path.isdir(sourceFile):
-                First_Directory = False
-                copyFiles(sourceFile, targetFile, filelist)
-    
-    if os.path.exists(destdir):
-        Tmpfilelist = []
-        copyFiles(srcdir, destdir, Tmpfilelist)
-        
-        fp=open(workdir + '/filelist', 'w')
-        for i in Tmpfilelist:
-            fp.write(i)
-            fp.write("\n")
-        fp.close()
-}
-
 fakeroot do_install_ptest() {
     mkdir -p ${D}${PTEST_PATH}
     t=${D}${PTEST_PATH}
-    for var in ` find ${S}/tests/auto/ -name tst_*`; do
+    for var in ` find ${B}/tests/auto/ -name tst_*`; do
         if [ -z ` echo ${var##*/} | grep '\.'` ]; then
             echo ${var##*/} >> ${t}/tst_list
             install -m 0644  ${var} ${t}
         fi
     done
-    for file in `cat ${WORKDIR}/filelist`; do
-       if [ -f $file ]; then
-           rm -f $file
-       fi
-    done 
-    rm -f ${WORKDIR}/filelist
 }
-
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4f3ade2..f586409 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -1,5 +1,6 @@
 require qt5.inc
 require qt5-git.inc
+require qt5-ptest.inc
 
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
@@ -29,11 +30,8 @@ SRC_URI += "\
     file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
-    file://run-ptest \
 "
 
-inherit ptest
-
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
 
 # for syncqt
@@ -203,17 +201,6 @@ do_configure() {
         ${QT_CONFIG_FLAGS}
 }
 
-fakeroot do_install_ptest() {
-    mkdir -p ${D}${PTEST_PATH}
-    t=${D}${PTEST_PATH}
-    for var in ` find ${B}/tests/auto/ -name tst_*`; do
-        if [ not ` echo ${var##*/} | grep '\.'` ]; then
-            echo ${var##*/} >> ${t}/tst_list
-            install -m 0644 ${var} ${t}
-        fi
-    done
-}
-
 do_install_append() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
     touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
diff --git a/recipes-qt/qt5/qtdeclarative/run-ptest b/recipes-qt/qt5/qtdeclarative/run-ptest
deleted file mode 100644
index 6c3f522..0000000
--- a/recipes-qt/qt5/qtdeclarative/run-ptest
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-for x in ` awk '{print $1}' tst_list `;do
-    ./${x};
-done
diff --git a/recipes-qt/qt5/qtquick1/run-ptest b/recipes-qt/qt5/qtquick1/run-ptest
deleted file mode 100644
index 044f834..0000000
--- a/recipes-qt/qt5/qtquick1/run-ptest
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-for x in ` awk '{print $1}' tst_list `;do
-    ./${x};
-done
-
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 2187f9c..dad5ba8 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,5 +1,6 @@
 require qt5.inc
 require qt5-git.inc
+require qt5-ptest.inc
 
 HOMEPAGE = "http://www.qt.io"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
@@ -11,14 +12,11 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-inherit ptest
-
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 # Patches from https://github.com/meta-qt5/qttools/commits/b5.10
 # 5.10.meta-qt5.1
 SRC_URI += " \
-    file://run-ptest \
     file://0001-add-noqtwebkit-configuration.patch \
     file://0002-linguist-tools-cmake-allow-overriding-the-location-f.patch \
 "
@@ -35,16 +33,9 @@ SRCREV = "3ce89dc37d3c73033c18dcec9e4710afd747ce01"
 
 BBCLASSEXTEND = "native nativesdk"
 
-do_compile_ptest() {
-    export PATH=${STAGING_DIR_NATIVE}/usr/include/qt5:$PATH
-    cd ${S}/tests
-    qmake -o Makefile tests.pro
-    oe_runmake
-}
-
 do_install_ptest() {
     mkdir -p ${D}${PTEST_PATH}
     t=${D}${PTEST_PATH}
-    cp ${S}/tests/auto/qtdiag/tst_tdiag $t
-    cp ${S}/tests/auto/qtattributionsscanner/tst_qtattributionsscanner $t
+    cp ${B}/tests/auto/qtdiag/tst_tdiag $t
+    cp ${B}/tests/auto/qtattributionsscanner/tst_qtattributionsscanner $t
 }
diff --git a/recipes-qt/qt5/qtxmlpatterns/run-ptest b/recipes-qt/qt5/qtxmlpatterns/run-ptest
deleted file mode 100644
index 044f834..0000000
--- a/recipes-qt/qt5/qtxmlpatterns/run-ptest
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-for x in ` awk '{print $1}' tst_list `;do
-    ./${x};
-done
-
-- 
2.16.1


