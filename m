Return-Path: <joe@deserted.net>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1795171D4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 12:48:12 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id c26so2050943itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 May 2017 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=m1euO5Bq8pBQ8Sqt+NQeux6TJv3fOf0OCC5fa01UkEQ=;
	b=voEFF/tVlrp5abWpG2LafxPMb0KysnpEs2xzpFLNDDs6xOvG69V9idgJDV5eiXQejp
	jTaPkgsQwYUsqwiRdBcOHCaS+RMpXtBGwakk3Qfgywq420eeYZuqXb6I5YNJ3QpKwZnd
	edjjVeuZT9/qm6IIjJ7vhZummPXielLuzTAQGntGtTF01rS4jc20leRpWYNDBBHe71Ai
	qDTW2jtmtU5MbnGJ0iHWE/1GZDhR6NyHrxHADBBxQksyDk1bKe64nSVm14lTtoUOkTGA
	Y3S8TLkCNpwnmLUqEKm8hf6wUwRNfAtbZrgVcE0UzhQbNLg5fqkY4R+PgL1wwoMzXHHG
	d0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=m1euO5Bq8pBQ8Sqt+NQeux6TJv3fOf0OCC5fa01UkEQ=;
	b=HnBi7IrR4sf8xWLMjOgkZtic4NJuu+JwXN7mXn+142sPi7gsL5Y2oyYgL9KniiIPbM
	he5jhrrjGmtdxmmSbLN1ghoDbVA+z1sGVQy17JcrjXWJARvSBIiB7BP80JkgS2Pd/bwy
	z4IXy4siJQOwCQvQ3B4G++8QGSae3cgPDrcLsC/ZizZbhn7UvFzwGam4JvBz5Q0loiFb
	/Qnyduq2x694QlxlY1ejJpX82lJndN+C5ZJO2dKMMrD+dJkQd9AEzurAmeBmizqjZg95
	ecBEUfVBpXjLYzWwK6JB8qqBSjb6h/DM+o/2O4w9W6BRZvGqRU4vfJJyQwaKr3kSgoG4
	fBBw==
X-Gm-Message-State: AN3rC/4h44kSr3iIcR7FwxA44qqoWXTUv6XkNbrUjaPlp/lcZu1SvGNz
	ZeTPVAsRO1gJnX5h
X-Received: by 10.36.150.193 with SMTP id z184mr2873529itd.89.1493729293686;
	Tue, 02 May 2017 05:48:13 -0700 (PDT)
Received: from mir.deserted.net (23-233-24-42.cpe.pppoe.ca. [23.233.24.42])
	by smtp.gmail.com with ESMTPSA id f16sm799588itc.29.2017.05.02.05.48.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 May 2017 05:48:12 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 May 2017 08:48:36 -0400
Message-Id: <1493729316-28212-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] wireguard: module install cleanup
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
X-List-Received-Date: Tue, 02 May 2017 12:48:13 -0000

The module_install target shouldn't be used, just installing the module to
the sysroot directly seems more appropriate.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../wireguard/wireguard-module_0.0.20170421.bb       | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
index e3d4210..2c69c58 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-inherit module-base kernel-module-split
+inherit module kernel-module-split
 
 DEPENDS = "virtual/kernel libmnl"
 
@@ -10,14 +10,22 @@ DEPENDS = "virtual/kernel libmnl"
 
 EXTRA_OEMAKE_append = " \
     KERNELDIR=${STAGING_KERNEL_DIR} \
-    CC='${CC}' \
-    KERNEL_CC='${KERNEL_CC}' \
     "
-KERNEL_MODULES_META_PACKAGE = "${PN}"
 
 MAKE_TARGETS = "module"
-MODULES_INSTALL_TARGET = "module-install"
 
 RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
+MODULE_NAME = "wireguard"
 
-PNBLACKLIST[wireguard-module] ?= "BROKEN: Kernel configuration invalid (http://errors.yoctoproject.org/Errors/Details/141421/) - the recipe will be removed on 2017-07-01 unless the issue is fixed"
+# Kernel module packages MUST begin with 'kernel-module-', otherwise
+# multilib image generation can fail.
+#
+# The following line is only necessary if the recipe name does not begin
+# with kernel-module-.
+PKG_${PN} = "kernel-module-${MODULE_NAME}"
+
+module_do_install() {
+    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
+    install -m 0644 ${MODULE_NAME}.ko \
+    ${D}/lib/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}/${MODULE_NAME}.ko
+}
-- 
1.9.1


