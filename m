Return-Path: <Guojian.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD6956FF91
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 09:19:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2F9JapX008370
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 02:19:36 -0700 (PDT)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 15 Mar 2016 02:19:35 -0700
From: <guojian.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Mar 2016 17:19:33 +0800
Message-ID: <1458033573-20501-2-git-send-email-guojian.zhou@windriver.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1458033573-20501-1-git-send-email-guojian.zhou@windriver.com>
References: <1458033573-20501-1-git-send-email-guojian.zhou@windriver.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH] firefox: fix install issue and do_package_qa issues
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
X-List-Received-Date: Tue, 15 Mar 2016 09:19:36 -0000
Content-Type: text/plain

From: Guojian Zhou <guojian.zhou@windriver.com>

1. Fix the firefox install missing the "usr/lib64/firefox/defaults/pref" directory issue.

| make[1]: Leaving directory `tmp/work/core2-64-wrs-linux/firefox/38.6.1esr-r0/mozilla-esr38/firefox-build-dir'
| install: target
'tmp/work/core2-64-wrs-linux/firefox/38.6.1esr-r0/image/usr/lib64/firefox/defaults/pref/' is not a directory: No such file or directory
| WARNING: tmp/work/core2-64-wrs-linux/firefox/38.6.1esr-r0/temp/run.do_install.329:1 exit 1 from

2. Add the "--libdir=${libdir}" into the EXTRA_OECONF to make sure these
library files could be installed into the /usr/lib64 in the 64 bits OS.

WARNING: QA Issue: firefox: Files/directories were installed but not
shipped in any package:
  /usr/lib64/firefox
  /usr/lib64/firefox-devel-38.6/xpcom-config.h
  /usr/lib64/firefox-devel-38.6/idl
  /usr/lib64/firefox-devel-38.6/include
  /usr/lib64/firefox-devel-38.6/bin

3. Fix some do_package_qa warning issue which comes from the commit e045c68c41f65ba3b0b22d06022ea6c53e072ab5

NOTE: recipe firefox-38.6.1esr-r0: task do_package_qa: Started
ERROR: QA Issue: non -staticdev package contains static .a library:
firefox-dev path
'work/core2-64-wrs-linux/firefox/38.6.1esr-r0/packages-split/firefox-dev/usr/lib64/firefox-devel-38.6/sdk/lib/libcrmf.a'
[staticdev]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
tmp/work/core2-64-wrs-linux/firefox/38.6.1esr-r0/temp/log.do_package_qa.90631
NOTE: recipe firefox-38.6.1esr-r0: task do_package_qa: Failed

Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
---
 recipes-mozilla/firefox/firefox_38.6.1esr.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-mozilla/firefox/firefox_38.6.1esr.bb b/recipes-mozilla/firefox/firefox_38.6.1esr.bb
index 4e4a7aa..ba04f41 100644
--- a/recipes-mozilla/firefox/firefox_38.6.1esr.bb
+++ b/recipes-mozilla/firefox/firefox_38.6.1esr.bb
@@ -59,16 +59,18 @@ MOZ_APP_BASE_VERSION = "38.6"
 inherit mozilla
 
 EXTRA_OEMAKE += "installdir=${libdir}/${PN}"
+EXTRA_OECONF += "--libdir=${libdir}"
 
 ARM_INSTRUCTION_SET = "arm"
 
 do_install_append() {
     install -d ${D}${datadir}/applications
     install -d ${D}${datadir}/pixmaps
+    install -d ${D}${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/defaults/pref
 
     install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/applications/
     install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmaps/
-    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}/defaults/pref/
+    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/defaults/pref/
 
     # Fix ownership of files
     chown root:root -R ${D}${datadir}
@@ -78,10 +80,10 @@ do_install_append() {
 FILES_${PN} = "${bindir}/${PN} \
                ${datadir}/applications/ \
                ${datadir}/pixmaps/ \
-               ${libdir}/${PN}/* \
+               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/* \
                ${bindir}/defaults"
-FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config"
-
+FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${PN}-devel-*"
+FILES_${PN}-staticdev += "${libdir}/${PN}-devel-*/sdk/lib/*.a"
 # We don't build XUL as system shared lib, so we can mark all libs as private
 PRIVATE_LIBS = "libmozjs.so \
                 libxpcom.so \
-- 
1.7.12.4


