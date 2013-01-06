Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXA-000366-3e
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:48 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so8147603dak.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=q8d4sfYj8CF3lH6R4pZVhlAQ2Yh9GC5ZTNdOlTDUb1E=;
	b=w1aoxGaqWbX2QPfcH54uYYAlgf9gDiHEMhVHZ+a/V2uwvmMSg/RUQMcQf43vCuSmCy
	KstC6NSxYqRdFyRb1LLRqs9zEQNunf25vuMSo3NOmFsYXACb6kPqnRb59jxMuct2ESwx
	5o0P7xW1/x+vxRwa5p3+7hiPdkSin0rWmgQxpgtCGUo5tutByUzSfaNRSgc4/l+4+3rq
	ez9kd9gjHCymQZWmd84jLqs5x2HvXp1/VZbg1MAU+vLlcISG3vA+eLMJw3JIo6EbEExQ
	/jyCUm/J9P/DanNouubJZW0/eushFuw474Q//g09h9uJ31dB5DvkcLBncG2XDNFA9Xtt
	n1aw==
X-Received: by 10.68.203.132 with SMTP id kq4mr175263822pbc.3.1357463619873;
	Sun, 06 Jan 2013 01:13:39 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:29 -0800
Message-Id: <1357463568-26241-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 06/25] net-snmp: Use ${PN} instead of hardcoding net-snmp
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
X-List-Received-Date: Sun, 06 Jan 2013 09:28:49 -0000

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



