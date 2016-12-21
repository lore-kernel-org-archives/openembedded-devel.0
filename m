Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E92E271C9A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 08:43:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14132788"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Dec 2016 16:42:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id BD3F8477B1D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 16:42:56 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 21 Dec 2016 16:42:56 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Dec 2016 16:42:34 +0800
Message-ID: <1482309754-1281-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: BD3F8477B1D4.AA3AE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] opensaf: 5.0.0 -> 5.1.0
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
X-List-Received-Date: Wed, 21 Dec 2016 08:43:05 -0000
Content-Type: text/plain

1)Upgrade opensaf from 5.0.0 to 5.1.0.
2)Modify meta_oe_security_flags.inc to fix error:
  /
  | collect2: error: ld returned 1 exit status
  | Makefile:542: recipe for target 'librda.la' failed
  | make[6]: *** [librda.la] Error 1
  \

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/opensaf/{opensaf_5.0.0.bb => opensaf_5.1.0.bb}    | 4 ++--
 meta-oe/conf/distro/include/meta_oe_security_flags.inc                | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.0.0.bb => opensaf_5.1.0.bb} (94%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
similarity index 94%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
index 6ceb225..be903a0 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
@@ -21,8 +21,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-plmcd-error-fix.patch \
            "
 
-SRC_URI[md5sum] = "94cd1a4c0406e6a45bb04c003f8690e7"
-SRC_URI[sha256sum] = "4b4188a0f3d0ed1ed0e3d77de27c45e2c96b437401de08e7df2ed9ecd54bb999"
+SRC_URI[md5sum] = "821391311c73bc2f2dc5a7d867f732e0"
+SRC_URI[sha256sum] = "f687c883a0d50517c33cb445d9177a9e2b07f5bb077bcc0235ffc0fc99af5cb6"
 
 inherit autotools useradd systemd pkgconfig
 
diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index 815fb16..01ee4d4 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -25,3 +25,4 @@ SECURITY_CFLAGS_pn-libvdpau = "${SECURITY_NO_PIE_CFLAGS}"
 #| make[1]: *** [Makefile:675: libluajit.so] Error 1
 SECURITY_CFLAGS_pn-luajit = "${SECURITY_NO_PIE_CFLAGS}"
 
+SECURITY_CFLAGS_pn-opensaf = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.7.4




