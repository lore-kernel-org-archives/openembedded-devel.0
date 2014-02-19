Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 02DB36CBDF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 08:23:44 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so252197wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 00:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=trQso5k/9NQaU+M6dkGVveH+Gvot4UzDxz5hsgI7uSI=;
	b=h8yfgRdZBheDO+CGSd/iYWcfFxYBKMrJnm4XqDyWSRT0q1n1slVudjYJFj/uKAzLmq
	uizbeXugG36lhi3l8eQPzrw9vwV+V0Hz8KnhgVPshuDHWWRwqvYc4G1UYoWDSBuAzNqd
	i9Q8UOEKZzbtoZgnYIQvZw9YvzIdX3ti7bKkWm4ayns7/dey14xSnSPKX63S9seuw07q
	I8R4mC/Ji8xpZ5ANPla8hK9ZgevhS5CIO8pQdVkV0gy3ouKFz0/kzytzzLJ3k3fk0YVJ
	Ie/TPaX+HpVsQyj8jyU57Not3vGHnF5Auhkm4wzNLOTclr9J55fZDWcjJc7+S3sgeoEG
	wNhw==
X-Gm-Message-State: ALoCoQm2TIoK0eiFi2SMKM2TGlAmK0S71aPEACLWhTeeJfLXhJjA7rlKLRxKIDKO2uN1ij4h7xUW
X-Received: by 10.180.207.10 with SMTP id ls10mr200670wic.4.1392798225544;
	Wed, 19 Feb 2014 00:23:45 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	ci4sm51968558wjc.21.2014.02.19.00.23.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Feb 2014 00:23:44 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2014 09:23:38 +0100
Message-Id: <1392798218-17950-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] mariadb: move linker fix to .inc
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
X-List-Received-Date: Wed, 19 Feb 2014 08:23:45 -0000

When using a recent cross-binutils you need this fix as well, so move it from -native to the .inc.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb | 3 ---
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc       | 4 +++-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
index 15605d0..942afcc 100644
--- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
@@ -9,9 +9,6 @@ PACKAGES = ""
 EXTRA_OEMAKE = ""
 EXTRA_OECONF = " --with-embedded-server "
 
-SRC_URI += "file://fix-link-error-ub1310.patch \
-"
-
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
     mv -f ${D}${libdir}/mysql/* ${D}${libdir}
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index e311ed7..100b3a7 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -17,7 +17,9 @@ SRC_URI = "http://mirrors.coreix.net/mariadb/mariadb-${PV}/kvm-tarbake-jaunty-x8
            file://storage-forbids-absolute-addresses-on-IA-32.patch \
            file://my.cnf \
            file://mysqld.sh \
-           file://avoid-plugin-options-warnings.patch"
+           file://avoid-plugin-options-warnings.patch \
+           file://fix-link-error-ub1310.patch \
+          "
 
 SRC_URI[md5sum] = "44c331fa91943155e4796f89e17a0612"
 SRC_URI[sha256sum] = "33471e9275c9b03919cabc38eb39f807d645adabf6a1a18f2e41ed73f47677c8"
-- 
1.8.4.2


