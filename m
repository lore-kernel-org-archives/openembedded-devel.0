Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF3B739B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:36:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2A3aenl024651
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Mar 2015 20:36:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 9 Mar 2015 20:36:40 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Mar 2015 11:28:31 +0800
Message-ID: <1425958111-2143-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1425958111-2143-1-git-send-email-kai.kang@windriver.com>
References: <1425958111-2143-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-networking][PATCH 2/2] esmtp: update sendmail link files
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
X-List-Received-Date: Tue, 10 Mar 2015 03:36:39 -0000
Content-Type: text/plain

esmtp use 'sbinsendmail' to define alternative ${sbindir}/sendmail, but
other packages msmtp and postfix use 'sendmail'. When remove esmtp, it
removes ${sbindir}/sendmail even msmtp or postfix is installed which has
alternative ${sbindir}/sendmail.

Make esmtp use 'sendmail' too to fix this issue.

Remove ${libdir}/sendmail which is only used by LSB core test for
historical reasons. And only create link file with fixed path
/usr/lib/sendmail for LSB images even for 64 bits system.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
index 69bdaf9..917dc8b 100644
--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -18,23 +18,23 @@ EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
 
 inherit autotools update-alternatives
 
-ALTERNATIVE_${PN} = "sbinsendmail libsendmail"
+ALTERNATIVE_${PN} = "sendmail"
 
-ALTERNATIVE_LINK_NAME[sbinsendmail] = "${sbindir}/sendmail"
-ALTERNATIVE_TARGET[sbinsendmail] = "${bindir}/esmtp"
-ALTERNATIVE_LINK_NAME[libsendmail] = "${libdir}/sendmail"
-ALTERNATIVE_TARGET[libsendmail] = "${bindir}/esmtp"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_TARGET[sendmail] = "${bindir}/esmtp"
 ALTERNATIVE_PRIORITY = "10"
 
 SRC_URI[md5sum] = "79a9c1f9023d53f35bb82bf446150a72"
 SRC_URI[sha256sum] = "a0d26931bf731f97514da266d079d8bc7d73c65b3499ed080576ab606b21c0ce"
 
-FILES_${PN} += "${libdir}/"
+do_install_append() {
+    # only one file /usr/lib/sendmail in ${D}${libdir}
+    rm -rf ${D}${libdir}
+}
 
-# The sysroot/${libdir}/sendmail conflicts with lsb's, and it's a
-# symlink to ${bindir}/esmtp which is meaningless for sysroot, so
-# remove it.
-SYSROOT_PREPROCESS_FUNCS += "remove_sysroot_sendmail"
-remove_sysroot_sendmail() {
-    rm -r "${SYSROOT_DESTDIR}${libdir}/sendmail"
+pkg_postinst_${PN}_linuxstdbase () {
+    # /usr/lib/sendmial is required by LSB core test
+    [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
 }
+
+FILES_${PN} += "${libdir}/"
-- 
1.9.1


