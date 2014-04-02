Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3242A6FA90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 13:26:29 +0000 (UTC)
Received: from [216.82.249.131:52132] by server-13.bemta-12.messagelabs.com id
	38/CD-28941-6001C335; Wed, 02 Apr 2014 13:26:30 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-14.tower-28.messagelabs.com!1396445189!26775209!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.11.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31179 invoked from network); 2 Apr 2014 13:26:29 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-14.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	2 Apr 2014 13:26:29 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 2 Apr 2014 08:26:01 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 2 Apr 2014 08:26:28 -0500
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.342.0; Wed, 2 Apr 2014 15:26:26 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Apr 2014 15:26:26 +0200
Message-ID: <1396445186-64883-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [meta-networking][PATCH] stunnel: fix SRC_URI
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
X-List-Received-Date: Wed, 02 Apr 2014 13:26:30 -0000
Content-Type: text/plain

Trying to build stunnel fails with:

  ERROR 404: Not Found.

Seems that after the new release (5.x) they have moved the old tarball
under a 'archive/4.x' subdirectory.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
index 7ac2e23afa96..086d0b7aafea 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
 DEPENDS = "openssl"
 
-SRC_URI = "https://www.stunnel.org/downloads/${BP}.tar.gz"
+SRC_URI = "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
 SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"

