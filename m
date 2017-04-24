Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 18B5A71DDE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 07:46:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18082341"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2017 15:46:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 07DB047E6347
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 15:46:48 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 24 Apr 2017 15:46:54 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Apr 2017 15:46:38 +0800
Message-ID: <1493019998-49235-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 07DB047E6347.A215E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] krb5: 1.13.6 -> 1.15.1
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
X-List-Received-Date: Mon, 24 Apr 2017 07:46:58 -0000
Content-Type: text/plain

1) Upgrade krb5 from 1.13.6 to 1.15.1.
2) License checksum changed,since the copyright years were updated. 
3) Fix error in the step of do_configure.
   | ERROR: krb5-1.15.1-r0 do_package: QA Issue: krb5: Files/directories were installed but not shipped in any package:
   |  /usr/lib/krb5/plugins/preauth/test.so

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/krb5/{krb5_1.13.6.bb => krb5_1.15.1.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.13.6.bb => krb5_1.15.1.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
index 656a02f..61cdd60 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
@@ -14,7 +14,7 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=c6f37efad53b098e420f45e7ab6807dc"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=3e12b8a065cca25dfdcac734fb3ec0b9"
 DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d
@@ -31,8 +31,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
 "
-SRC_URI[md5sum] = "6164ca9c075b4ecc68eadd6d13040417"
-SRC_URI[sha256sum] = "9c0a46b8918237a53916370d2e02298c2b294f55f0351f9404e18930bc26badc"
+SRC_URI[md5sum] = "8022f3a1cde8463e44fd35ef42731f85"
+SRC_URI[sha256sum] = "437c8831ddd5fde2a993fef425dedb48468109bb3d3261ef838295045a89eb45"
 
 S = "${WORKDIR}/${BP}/src"
 
@@ -107,7 +107,7 @@ PACKAGES =+ "${PN}-admin-server \
              libkrb5support \
              libverto"
 
-FILES_${PN} = ""
+FILES_${PN} = "${libdir}/krb5/plugins/preauth/test.so"
 FILES_${PN}-doc += "${datadir}/examples"
 FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
 
-- 
2.7.4




