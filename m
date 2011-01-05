Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Paa9Z-0004nQ-De
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 21:40:17 +0100
Received: by gwaa12 with SMTP id a12so3951813gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 12:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=RGK4nrMld4Qc6jfVWAEg56iFYg13ZfC96Wae9jQvJ8g=;
	b=KKEKteHK/Qt610AujMqY1UyRnZ/JKs9Op6ZsPbPss5YRvuhCDucemDxG6MXuxNcJvf
	tSUUbDyL3I+hxeFsKsmvwd/AQGtaDzlCxbtbZpIKVGDl2CoI2ZL6oZGFBL1IiVsTDbVO
	LAg/5zxyd8/f22vUlJ2w1uafEtFVZ2vzriK+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=u56IiZxU0XGMlnIUmY6qGTGInP7igMHteeaLgi4O9fCrjD8HEpidFJ3ZdAgVXiMRjv
	j9Y6mByc0rv4WNV4QFbFRlTzZoT5kT5rytVYt4tU77bHZLJ3jFkCqx3oP3XpON5oSYGT
	ISs3Cgc/MKNMAmqGTOPRYvXZEQOSbOp490w68=
Received: by 10.100.31.9 with SMTP id e9mr14048981ane.162.1294259992880;
	Wed, 05 Jan 2011 12:39:52 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id d4sm1397412and.39.2011.01.05.12.39.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 05 Jan 2011 12:39:52 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jan 2011 14:39:32 -0600
Message-Id: <1294259972-3430-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1294259972-3430-1-git-send-email-Chase.Maupin@ti.com>
References: <1294259972-3430-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 3/3] ti-ocf-crypto-module: add crypto module for hw accel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jan 2011 20:40:17 -0000

* Added the module for the OCF subsystem that allows access to
  the crypto accelerator hardware on the am37x device.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-ocf-crypto-module_1.0.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-ocf-crypto-module_1.0.bb

diff --git a/recipes/ti/ti-ocf-crypto-module_1.0.bb b/recipes/ti/ti-ocf-crypto-module_1.0.bb
new file mode 100644
index 0000000..0dbc917
--- /dev/null
+++ b/recipes/ti/ti-ocf-crypto-module_1.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Builds Crypto module used by OCF-Linux driver in OpenSSL example applications"
+HOMEPAGE = "https://gforge.ti.com/gf/project/arm_crypto/"
+LICENSE = "BSD GPLv2"
+
+COMPATIBLE_MACHINE = "am37x-evm"
+
+SRC_URI = "svn://gforge.ti.com/svn/arm_crypto/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+#gforge source revision
+SRCREV = "11"
+
+PACKAGE_STRIP = "no"
+
+S = "${WORKDIR}/trunk"
+
+inherit module
+
+PR = "${MACHINE_KERNEL_PR}+svnr${SRCPV}"
+
+do_install () {
+        install -d ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
+        install -m 0755 ${S}/ocf_omap3_cryptok.ko ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
+}
+
+FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/crypto/ocf/ocf_omap3_cryptok.ko"
-- 
1.7.0.4



