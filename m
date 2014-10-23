Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44EE5601F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 09:12:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9N9CoA9009641
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 02:12:50 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 02:12:50 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Oct 2014 17:12:55 +0800
Message-ID: <1414055575-31631-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking][V2]inetutils: Use texinfo-native instead of host command
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
X-List-Received-Date: Thu, 23 Oct 2014 09:12:50 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
index 2bae3ee..d909913 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
@@ -3,7 +3,7 @@ networking utilities and servers including ftp, ftpd, rcp, \
 rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
 talkd, telnet, telnetd, tftp, tftpd, and uucpd."
 SECTION = "libs"
-DEPENDS = "ncurses netbase readline"
+DEPENDS = "ncurses netbase readline texinfo-native"
 LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
-- 
1.9.1


