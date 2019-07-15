Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3717C5F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 08:17:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6F8HTtD025197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:17:29 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 15 Jul 2019 01:17:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jul 2019 16:09:56 +0800
Message-ID: <1563178196-19268-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563178196-19268-1-git-send-email-Qi.Chen@windriver.com>
References: <1563178196-19268-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] esmtp: use alternatives to manage /usr/lib/sendmail
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
X-List-Received-Date: Mon, 15 Jul 2019 08:17:28 -0000
Content-Type: text/plain

There are several packages which all provide /usr/lib/sendmail
when lsb is enabled. So use alternative to manage it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
index 663161a..972d5aa 100644
--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -18,11 +18,15 @@ EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
 
 inherit autotools update-alternatives
 
-ALTERNATIVE_${PN} += "sendmail mailq newaliases"
+ALTERNATIVE_${PN} = "sendmail mailq newaliases"
+# /usr/lib/sendmial is required by LSB core test
+ALTERNATIVE_${PN}_linuxstdbase = "sendmail mailq newaliases usr-lib-sendmail"
 ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
 ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
 ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
 ALTERNATIVE_TARGET[sendmail] = "${bindir}/esmtp"
+ALTERNATIVE_LINK_NAME[usr-lib-sendmail] = "/usr/lib/sendmail"
+ALTERNATIVE_TARGET[usr-lib-sendmail] = "${bindir}/esmtp"
 
 ALTERNATIVE_PRIORITY = "10"
 
@@ -39,9 +43,4 @@ do_install_append() {
     rm -rf ${D}${libdir}
 }
 
-pkg_postinst_${PN}_linuxstdbase () {
-    # /usr/lib/sendmial is required by LSB core test
-    [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
-}
-
 FILES_${PN} += "${libdir}/"
-- 
2.7.4


