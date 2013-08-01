Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.198])
	by mail.openembedded.org (Postfix) with ESMTP id EEAE261883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 13:39:35 +0000 (UTC)
Received: from [216.82.241.132:38473] by server-6.bemta-8.messagelabs.com id
	17/5A-27210-8156AF15; Thu, 01 Aug 2013 13:39:36 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-45.messagelabs.com!1375364370!13492795!2
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.9.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32043 invoked from network); 1 Aug 2013 13:39:35 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-6.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	1 Aug 2013 13:39:35 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Thu, 1 Aug 2013 08:38:58 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.123.3;
	Thu, 1 Aug 2013 08:39:04 -0500
Received: from log-cln-jviguera.digi.com (10.101.1.79) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.298.1; Thu, 1 Aug 2013 15:39:02 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Aug 2013 15:39:01 +0200
Message-ID: <1375364341-35086-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
Cc: Javier Viguera <javier.viguera@digi.com>
Subject: [meta-networking][dylan][PATCH] vsftpd: fix compile-time dependence
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
X-List-Received-Date: Thu, 01 Aug 2013 13:39:36 -0000
Content-Type: text/plain

vsftpd links with openssl libraries (libssl and libcrypto) so there is a
compile-time dependence on openssl package.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
index c02ee9c..f146910 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
@@ -4,7 +4,7 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
 
-DEPENDS = "libcap"
+DEPENDS = "libcap openssl"
 
 SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://makefile-destdir.patch \

