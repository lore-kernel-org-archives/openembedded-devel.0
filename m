Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E03A7C5F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 08:17:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6F8HRgr028073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:17:27 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 15 Jul 2019 01:17:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jul 2019 16:09:55 +0800
Message-ID: <1563178196-19268-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] postfix: use alternatives to manage /usr/lib/sendmail
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
X-List-Received-Date: Mon, 15 Jul 2019 08:17:26 -0000
Content-Type: text/plain

There are several packages which all provide /usr/lib/sendmail
when lsb is enabled. So use alternative to manage it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 3d4f1df..9437941 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -196,11 +196,15 @@ do_install_append_class-native() {
     ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq
 }
 
-ALTERNATIVE_${PN} += "sendmail mailq newaliases"
+ALTERNATIVE_${PN} = "sendmail mailq newaliases"
+# /usr/lib/sendmial is required by LSB core test
+ALTERNATIVE_${PN}_linuxstdbase = "sendmail mailq newaliases usr-lib-sendmail"
 ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
 ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
 ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
 ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_TARGET[usr-lib-sendmail] = "${sbindir}/sendmail.postfix"
+ALTERNATIVE_LINK_NAME[usr-lib-sendmail] = "/usr/lib/sendmail"
 
 ALTERNATIVE_PRIORITY = "120"
 
@@ -219,11 +223,6 @@ pkg_postinst_${PN} () {
         touch /etc/postfix/virtual_alias
         postmap /etc/postfix/virtual_alias
     else
-        if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) else 'false'}; then
-            # /usr/lib/sendmail is required by LSB core test
-            [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
-        fi
-
         touch $D/etc/aliases
         # This can fail depending on host setup
         if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
-- 
2.7.4


