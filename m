Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CFFC83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 09:47:32 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.53706.1752400042316338875
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 02:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TS+Zw10U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250713094720ac42d640a813a88d40-vxmych@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250713094720ac42d640a813a88d40
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Jul 2025 11:47:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RkeW9Hzsd/HFQQOm9LhYhLOKof+zzfGeplJ5Q/EnGjA=;
 b=TS+Zw10URfxly26FzX3ZinB3hIfGdhE6E8gEGcwk9p79N+dnF6xxPVBQtVKzesCrh/aIGB
 SX9P8Aj5d/TNTJ2GEsO5SfYY8Box8DWaLP1GTEWgHSDOJ7WtkNYPJwj99HrRYSNuzuMYlp9t
 EbUh6QaIvjb9gvQ119vW82DVoNPgrNosm9x3HRduGLAc63EeDM0vd19xY9RuS2gh6LP9/N16
 tu7tBGHzzUM1qhLbGM35GZAkx6ATeiyy1x5UxeZsIrz4XVG0QCp3xZfcCwpBWXRal/o8Lx50
 MxjRImH41gdetoAQticykKpRSY4JXHZ07FWdciyoMUEfpIeIvPhyAtlw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH 3/3] poco: Fix ptests
Date: Sun, 13 Jul 2025 11:46:14 +0200
Message-Id: <20250713094614.501804-3-peter.marko@siemens.com>
In-Reply-To: <20250713094614.501804-1-peter.marko@siemens.com>
References: <20250713094614.501804-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 09:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118504

From: Khem Raj <raj.khem@gmail.com>

testrunners file was coming out to be empty after anon python was turned
into a prepend to populate_packages which is executed during do_package
and hence POCO_TESTRUNNERS was not populated when it was used during
do_ptest_install now. Therefore alter the logic to collect the list of
tests to run into testrunners file. Also package the ignore file which
is platform specific, here the lnx version is packaged and specified
using -ignore cmd to tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/poco/poco/run-ptest | 2 +-
 meta-oe/recipes-support/poco/poco_1.11.2.bb | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index c9896eadee..521cc08a75 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -3,6 +3,6 @@ while read runner; do
   oldpath=`pwd` >/dev/null
   cd bin
   echo Testing $runner
-  ./$runner-testrunner -all
+  ./$runner -ignore $oldpath/cppignore.lnx -all
   cd $oldpath >/dev/null
 done < testrunners
diff --git a/meta-oe/recipes-support/poco/poco_1.11.2.bb b/meta-oe/recipes-support/poco/poco_1.11.2.bb
index 075eb72a06..4711c6bb92 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
@@ -66,17 +66,14 @@ python populate_packages:prepend () {
     poco_libdir = d.expand('${libdir}')
     pn = d.getVar("PN")
     packages = []
-    testrunners = []
 
     def hook(f, pkg, file_regex, output_pattern, modulename):
         packages.append(pkg)
-        testrunners.append(modulename)
 
     do_split_packages(d, poco_libdir, r'^libPoco(.*)\.so\..*$',
                     'poco-%s', 'Poco %s component', extra_depends='', prepend=True, hook=hook)
 
     d.setVar("RRECOMMENDS:%s" % pn, " ".join(packages))
-    d.setVar("POCO_TESTRUNNERS", "\n".join(testrunners))
 }
 
 do_install_ptest () {
@@ -84,7 +81,11 @@ do_install_ptest () {
        cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
        cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
        find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
-       echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
+       rm -f ${D}${PTEST_PATH}/testrunners
+       for f in ${D}${PTEST_PATH}/bin/*-testrunner; do
+            echo `basename $f` >> ${D}${PTEST_PATH}/testrunners
+       done
+       install -Dm 0644 ${S}/cppignore.lnx ${D}${PTEST_PATH}/cppignore.lnx
 }
 
 PACKAGES_DYNAMIC = "poco-.*"

