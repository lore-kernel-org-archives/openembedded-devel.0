Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2OTK-0006Zg-6z
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 17:00:44 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so2223316pad.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 07:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=EgPkg10L+g0QrYTLOweHSeZK5HJtS3Lp0NhUrc2bNyU=;
	b=m3lgxVMgjm17CT0Vw+QSCfBfqnx3Zs+LpHPYQUAK1QEKBys6rVYGg6OlnFs6EO6bVw
	WZTXm1wHMFM0Gj3FdutoT5hGPetyJC5Evq6kVWA0BS5a8hUtxFpSKj9yp5bHKYAIrPdf
	yR06b7K6x10cVRmXwUgtSOviWzyfjwuX3ZqP0Qo6FLe1IEsQoII5ZIUn//jMQluOldup
	vdOB4yWyu7nNmYHkuoMxR1iddlR5svTqXwF+9v8Mx1ildQzegVg5wawDqFPvwagu6aVz
	/QxwOc/PSwl/dXbHqxAzq60wNCZvQ3J9GWh1h+5yog+yn3gaYy+hmIKHY5g9WAiOzBq4
	/hXw==
X-Received: by 10.66.72.225 with SMTP id g1mr53961877pav.79.1359992692741;
	Mon, 04 Feb 2013 07:44:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z10sm22271421pay.7.2013.02.04.07.44.45
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 07:44:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 15:44:10 +0100
Message-Id: <c1d72ad2480fd09c92ecb8ea1476d02e1836ca1f.1359988981.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1359988981.git.Martin.Jansa@gmail.com>
References: <cover.1359988981.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359988981.git.Martin.Jansa@gmail.com>
References: <cover.1359988981.git.Martin.Jansa@gmail.com>
Subject: [PATCH][for-danny 2/2] cryptsetup: import from oe-classic
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
X-List-Received-Date: Mon, 04 Feb 2013 16:00:46 -0000
X-List-Received-Date: Mon, 04 Feb 2013 16:00:46 -0000

* add LIC_FILES_CHKSUM
* depend on util-linux (renamed from util-linux-ng)
* depend on lvm2 instead of device-mapper
* inherit gettext

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
new file mode 100644
index 0000000..254f563
--- /dev/null
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Setup virtual encryption devices under dm-crypt Linux"
+HOMEPAGE = "http://code.google.com/p/cryptsetup/"
+SECTION = "console"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "util-linux lvm2 libgcrypt popt"
+RRECOMMENDS_${PN} = "kernel-module-aes \
+                     kernel-module-dm-crypt \
+                     kernel-module-md5 \
+                     kernel-module-cbc \
+                     kernel-module-sha256 \
+                    "
+SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
+SRC_URI[md5sum] = "318a64470861ea5b92a52f2014f1e7c1"
+SRC_URI[sha256sum] = "9c8e68a272f6d9cfb6cd65cc0743f4c44a2096c61f74e0602bf40208b5e69c0a"
+
+inherit autotools gettext
-- 
1.8.1.2



