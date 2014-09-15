Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 600B260167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Sep 2014 23:43:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8FNhpwb025440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Sep 2014 16:43:51 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Sep 2014 16:43:51 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Sep 2014 16:43:51 -0700
Message-ID: <1410824631-1845-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] vftpd: update to version 3.0.2
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
X-List-Received-Date: Mon, 15 Sep 2014 23:43:53 -0000
Content-Type: text/plain

No changes other than source checksum.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../makefile-destdir.patch                         |    0
 .../makefile-libs.patch                            |    0
 .../makefile-strip.patch                           |    0
 .../nopam-with-tcp_wrappers.patch                  |    0
 .../{vsftpd-3.0.0 => vsftpd-3.0.2}/nopam.patch     |    0
 .../vsftpd-tcp_wrappers-support.patch              |    0
 .../vsftpd/{vsftpd_3.0.0.bb => vsftpd_3.0.2.bb}    |    5 +++--
 7 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 => vsftpd-3.0.2}/makefile-destdir.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 => vsftpd-3.0.2}/makefile-libs.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 => vsftpd-3.0.2}/makefile-strip.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 => vsftpd-3.0.2}/nopam-with-tcp_wrappers.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 => vsftpd-3.0.2}/nopam.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.0 => vsftpd-3.0.2}/vsftpd-tcp_wrappers-support.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd_3.0.0.bb => vsftpd_3.0.2.bb} (96%)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-destdir.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdir.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-destdir.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-libs.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-libs.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-strip.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-strip.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-tcp_wrappers.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam-with-tcp_wrappers.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-tcp_wrappers.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
similarity index 96%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
rename to meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
index 5df8211..a1c4ff4 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
@@ -21,8 +21,9 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
                         file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
                         file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
-SRC_URI[md5sum] = "ad9fa952558c2c5b0426ccaccff0f972"
-SRC_URI[sha256sum] = "ef70205dcd0c7f03b008b9578fb44c0cbe31e66daab8cfafb9904747c17fc2a8"
+SRC_URI[md5sum] = "8b00c749719089401315bd3c44dddbb2"
+SRC_URI[sha256sum] = "be46f0e2c5528fe021fafc8dab1ecfea0c1f183063a06977f8537fcd0b195e56"
+
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
-- 
1.7.3.4


