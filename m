Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 41C166AB9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2015 09:08:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6698pOU023143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 02:08:51 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 02:08:50 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jul 2015 17:08:08 +0800
Message-ID: <1436173688-7567-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] inetutils: move daemon servers from bin to sbin directory
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
X-List-Received-Date: Mon, 06 Jul 2015 09:08:53 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

move daemon servers from bin to sbin directory:
tftpd, telnetd, rshd, rexecd and rlogind

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../recipes-connectivity/inetutils/inetutils_1.9.2.bb          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
index cd7b425..9bb9fe8 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
@@ -97,21 +97,21 @@ ALTERNATIVE_${PN}-ftp = "ftp"
 ALTERNATIVE_${PN}-ftpd = "ftpd"
 ALTERNATIVE_${PN}-tftp = "tftp"
 ALTERNATIVE_${PN}-tftpd = "tftpd"
-ALTERNATIVE_LINK_NAME[tftpd] = "${bindir}/tftpd"
+ALTERNATIVE_LINK_NAME[tftpd] = "${sbindir}/tftpd"
 ALTERNATIVE_TARGET[tftpd]  = "${sbindir}/in.tftpd"
 
 ALTERNATIVE_${PN}-telnet = "telnet"
 ALTERNATIVE_${PN}-telnetd = "telnetd"
-ALTERNATIVE_LINK_NAME[telnetd] = "${bindir}/telnetd"
+ALTERNATIVE_LINK_NAME[telnetd] = "${sbindir}/telnetd"
 ALTERNATIVE_TARGET[telnetd] = "${sbindir}/in.telnetd"
 
 ALTERNATIVE_${PN}-rsh = "rcp rexec rlogin rsh"
 ALTERNATIVE_${PN}-rshd = "rshd rexecd rlogind"
-ALTERNATIVE_LINK_NAME[rshd] = "${bindir}/rshd"
+ALTERNATIVE_LINK_NAME[rshd] = "${sbindir}/rshd"
 ALTERNATIVE_TARGET[rshd] = "${sbindir}/in.rshd"
-ALTERNATIVE_LINK_NAME[rexecd] = "${bindir}/rexecd"
+ALTERNATIVE_LINK_NAME[rexecd] = "${sbindir}/rexecd"
 ALTERNATIVE_TARGET[rexecd] = "${sbindir}/in.rexecd"
-ALTERNATIVE_LINK_NAME[rlogind] = "${bindir}/rlogind"
+ALTERNATIVE_LINK_NAME[rlogind] = "${sbindir}/rlogind"
 ALTERNATIVE_TARGET[rlogind] = "${sbindir}/in.rlogind"
 
 ALTERNATIVE_${PN}-inetd= "inetd"
-- 
1.9.1


