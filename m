Return-Path: <kaiu@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA307391B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2015 17:48:28 +0000 (UTC)
Received: from kulrich-SVE1712W1EB.fritz.box ([217.187.243.10]) by
	mail.gmx.com (mrgmx101) with ESMTPSA (Nemesis) id
	0MgXCF-1YrgPj2SKV-00NwNR; Mon, 16 Mar 2015 18:48:29 +0100
From: Kai Ulrich <kaiu@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 18:48:17 +0100
Message-Id: <1426528097-14698-1-git-send-email-kaiu@gmx.de>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K0:x7l9KqcoFETNxGgsUybl1h5AWODfWvCW4b7jCNdbpSM4Sgqsz2O
	dL/YzOIvqlGJ65yUiC4so7dSp87w7LNlOgKb7aB50TE8UFbp7lYxsh3kT4vRa4MVOhLjBuq
	EeHQ24TZ0ckVZHhXNb678QyNqai2lnkFWcFa/DMctJFmkmKicWQIMs4FmR5N8W1PvgHv9eS
	eKQHlejOHzvbkNvQQDcWg==
X-UI-Out-Filterresults: notjunk:1;
Cc: kulrich <ulrich.kai@gmail.com>
Subject: [meta-oe][PATCH] Add smstools3 http://smstools3.kekekasvi.com to meta-oe recipes-connectivity.
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
X-List-Received-Date: Mon, 16 Mar 2015 17:48:30 -0000

From: kulrich <ulrich.kai@gmail.com>

Signed-off-by: kulrich <ulrich.kai@gmail.com>
---
 .../smstools3/sms_binpath_and_psops.patch          | 19 ++++++++++
 .../smstools3/smstools3_3.1.15.bb                  | 44 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
 create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb

diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
new file mode 100644
index 0000000..ffcaa09
--- /dev/null
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
@@ -0,0 +1,19 @@
+Index: smstools3/scripts/sms3
+===================================================================
+--- smstools3.orig/scripts/sms3	2010-05-04 11:21:44.000000000 +0200
++++ smstools3/scripts/sms3	2015-02-22 20:05:51.615074469 +0100
+@@ -24,11 +24,11 @@
+ # Logfile can also be defined in here:
+ LOGFILE="/var/log/smsd.log"
+ 
+-DAEMON=/usr/local/bin/smsd
++DAEMON=/usr/bin/smsd
+ # A program which turns power off for couple of seconds:
+-RESETMODEMS=/usr/local/bin/smsd_resetmodems
++RESETMODEMS=/usr/bin/smsd_resetmodems
+ NAME=smsd
+-PSOPT="-e"
++PSOPT=""
+ ECHO=echo
+ case `uname` in
+   *BSD|Darwin)
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
new file mode 100644
index 0000000..55a2583
--- /dev/null
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
@@ -0,0 +1,44 @@
+SUMMARY = "The SMS Server Tools 3 is a SMS Gateway software which can send and receive short messages through GSM modems and mobile phones."
+SECTION = "network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
+HOMEPAGE = "http://smstools3.kekekasvi.com"
+
+SRC_URI = "http://smstools3.kekekasvi.com/packages/${PN}-${PV}.tar.gz \
+           file://sms_binpath_and_psops.patch"
+
+SRC_URI[md5sum] = "0241ef60e646fac1a06254a848e61ed7"
+SRC_URI[sha256sum] = "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59"
+
+
+S = "${WORKDIR}/${PN}"
+
+RDEPENDS_${PN} = " bash "
+INITSCRIPT_NAME = "sms3"
+INITSCRIPT_PARAMS = "defaults"
+
+inherit update-rc.d
+
+do_install () {
+	
+	install -d ${D}${bindir}	
+	install -m 755 ${S}/src/smsd "${D}${bindir}/smsd"
+	
+	install -m 755 ${S}/scripts/sendsms "${D}${bindir}/sendsms"
+	install -m 755 ${S}/scripts/sms2html "${D}${bindir}/sms2html"
+	install -m 755 ${S}/scripts/sms2unicode "${D}${bindir}/sms2unicode" 
+	install -m 755 ${S}/scripts/unicode2sms "${D}${bindir}/unicode2sms"
+
+	install -d ${D}${sysconfdir}	
+	install -m 644 ${S}/examples/smsd.conf.easy "${D}${sysconfdir}/smsd.conf"
+
+	install -d "${D}${localstatedir}/spool"
+	install -d "${D}${localstatedir}/spool/sms"
+	install -d "${D}${localstatedir}/spool/sms/incoming"
+	install -d "${D}${localstatedir}/spool/sms/outgoing"
+	install -d "${D}${localstatedir}/spool/sms/checked"
+
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 ${S}/scripts/sms3 "${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}"
+
+}
-- 
1.9.1


