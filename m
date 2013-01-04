Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygo-0001z8-7p
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:26 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so7330425dak.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=q8d4sfYj8CF3lH6R4pZVhlAQ2Yh9GC5ZTNdOlTDUb1E=;
	b=flLhN05o8JanmlbWYYzMNcHdOvRfD5E8WZJLmrj+LWv2bc5wnmjrHS6KB3MW4Vi4UN
	jGkcAKp3gqoFKyTb33nvSQHo+w8WE5xVeJbe0HPjaflP9Y7HIOlx2GVxPDocRpVhYS32
	dmh9neXodxKOxw9tkC939OYy+gcdyRFebNwyvghD52cujelQLiAK8EvTnFmdjT06ZBG/
	jbZS4d5wbHKenYfonREc9JJCi8xu4WIB+P9G6ngPF10SUjL6pHym8RlPWOLMzJA3ZRus
	gTW6oWJMBIggQS/LkZb/0FvnhdSCGb1zT5z1i4KaVFagZnV4D9FfrNWeekA2EvlRju3f
	uvpg==
X-Received: by 10.68.236.100 with SMTP id ut4mr161261710pbc.92.1357272021077; 
	Thu, 03 Jan 2013 20:00:21 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:30 -0800
Message-Id: <1357271974-3317-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/13] net-snmp: Use ${PN} instead of hardcoding net-snmp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 04:15:41 -0000
X-List-Received-Date: Fri, 04 Jan 2013 04:15:41 -0000

This shows up when doing multilib builds where
PN != BPN and warnings about non existent systemd packages are
popping up.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/net-snmp/net-snmp.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
index c6f613d..eb355ab 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
@@ -38,8 +38,8 @@ do_install_append() {
 		-i ${STAGING_BINDIR}/net-snmp-config
 }
 
-PACKAGES = "net-snmp-dbg net-snmp-doc net-snmp-dev net-snmp-staticdev net-snmp-static net-snmp-libs \
-            net-snmp-mibs net-snmp-server net-snmp-client net-snmp-server-snmpd net-snmp-server-snmptrapd"
+PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
+            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
 
 ALLOW_EMPTY_${PN}-server = "1"
 FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
@@ -59,7 +59,7 @@ INITSCRIPT_PARAMS_${PN}-server = "defaults"
 
 LEAD_SONAME = "libnetsnmp.so"
 
-pkg_postrm_net-snmp-server() {
+pkg_postrm_${PN}-server() {
 	if test "x$D" != "x"; then
 		OPT="-r $D "
 	else
-- 
1.7.9.5



