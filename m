Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59D296DF41
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 10:33:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB4AXvvC020269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Dec 2013 02:33:57 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 4 Dec 2013 02:33:57 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Dec 2013 18:33:54 +0800
Message-ID: <1386153235-16411-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Cc: li.wang@windriver.com
Subject: [meta-networking][PATCH 1/2] inetutils: fix simple bb rule error
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
X-List-Received-Date: Wed, 04 Dec 2013 10:33:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Correct the usage of alternative link and target:
ALTERNATIVE_LINK_NAME[name] = "target"
ALTERNATIVE_TARGET[name] = "target"

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../inetutils/inetutils_1.9.1.bb                     | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index e371ae5..59a22aa 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -92,22 +92,22 @@ ALTERNATIVE_${PN}-ftp = "ftp"
 ALTERNATIVE_${PN}-ftpd = "ftpd"
 ALTERNATIVE_${PN}-tftp = "tftp"
 ALTERNATIVE_${PN}-tftpd = "tftpd"
-ALTERNATIVE_LINK_NAME_${PN}-tftpd = "${bindir}/tftpd"
-ALTERNATIVE_TARGET_${PN}-tftpd  = "${sbindir}/in.tftpd"
+ALTERNATIVE_LINK_NAME[tftpd] = "${bindir}/tftpd"
+ALTERNATIVE_TARGET[tftpd]  = "${sbindir}/in.tftpd"
 
 ALTERNATIVE_${PN}-telnet = "telnet"
 ALTERNATIVE_${PN}-telnetd = "telnetd"
-ALTERNATIVE_LINK_NAME_${PN}-telnetd = "${bindir}/telnetd"
-ALTERNATIVE_TARGET_${PN}-telnetd = "${sbindir}/in.telnetd"
+ALTERNATIVE_LINK_NAME[telnetd] = "${bindir}/telnetd"
+ALTERNATIVE_TARGET[telnetd] = "${sbindir}/in.telnetd"
 
 ALTERNATIVE_${PN}-rsh = "rcp rexec rlogin rsh"
 ALTERNATIVE_${PN}-rshd = "rshd rexecd rlogind"
-ALTERNATIVE_LINK_NAME_${PN}-rshd = "${bindir}/rshd"
-ALTERNATIVE_TARGET_${PN}-rshd = "${sbindir}/in.rshd"
-ALTERNATIVE_LINK_NAME_${PN}-rexecd = "${bindir}/rexecd"
-ALTERNATIVE_TARGET_${PN}-rexecd = "${sbindir}/in.rexecd"
-ALTERNATIVE_LINK_NAME_${PN}-rlogind = "${bindir}/rlogind"
-ALTERNATIVE_TARGET_${PN}-rlogind = "${sbindir}/in.rlogind"
+ALTERNATIVE_LINK_NAME[rshd] = "${bindir}/rshd"
+ALTERNATIVE_TARGET[rshd] = "${sbindir}/in.rshd"
+ALTERNATIVE_LINK_NAME[rexecd] = "${bindir}/rexecd"
+ALTERNATIVE_TARGET[rexecd] = "${sbindir}/in.rexecd"
+ALTERNATIVE_LINK_NAME[rlogind] = "${bindir}/rlogind"
+ALTERNATIVE_TARGET[rlogind] = "${sbindir}/in.rlogind"
 
 ALTERNATIVE_${PN}-inetd= "inetd"
 ALTERNATIVE_${PN}-traceroute = "traceroute"
-- 
1.8.3


