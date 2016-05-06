Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6403075C51
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:43 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id 90so56352779qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=dxgk+27t/jxU5Q7IutyUadeFUVdECp5gMYJk7mdMyd8=;
	b=XTRG6d0t1gInv/t6+qEP+NDwjVNgtWVnDTlx1eCPwOwEMJX7bmQRo0PTgGqKjeNgrq
	8hZTSJJLw6u6n2P7kJC9+UyGkV/xJVnM+G/hX9GGiInKRIZ4QItU7lu4pd/f8GlWL71s
	enF8YiGws3kFjHdsL279U1i8YC2FuVE15Z9lt8BLXvTBXG9kYkjYvwP6Y+L2EWqiKStr
	64j+i/+GpLnd+rC4vlR1/ozktG8zsXvsrv4U3du1NTpmKrL43gn0CvN3PtitehXPrIXH
	Rt6f9XcORo7Ck+5cXgjquZuXYxCrJH42Bd2O7yx/oajDDV2EyPPDHN1oPRcpMr2Ud2pe
	K+bw==
X-Gm-Message-State: AOPr4FVVrEZOIGchrwcJ5mzj6Qg/GQx9jKnRJ4R9jifYJuevUPJcrzq5+or5FNJmYiuFYw==
X-Received: by 10.140.33.181 with SMTP id j50mr19794190qgj.64.1462543363811;
	Fri, 06 May 2016 07:02:43 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	b40sm5774702qga.47.2016.05.06.07.02.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:42 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:55 -0300
Message-Id: <1462543259-7206-18-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 18/22] packagegroup-tools-bluetooth.bb: Selects the tools appropriate for the version of bluez being used.
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
X-List-Received-Date: Fri, 06 May 2016 14:02:43 -0000

From: Ann Thornton <ann.thornton@nxp.com>

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../packagegroups/packagegroup-tools-bluetooth.bb  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
new file mode 100644
index 0000000..bdab389
--- /dev/null
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -0,0 +1,40 @@
+# Copyright (C) 2014-2015 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SUMMARY = "Set of Bluetooh related tools for inclusion on images"
+DESCRIPTION = "Add bluetooth tools based on the version of BlueZ in use.\
+The tools that have been tested and work the best are pulled in \
+automatically.  The same packagegroup can be used in a recipe without \
+the need to know which version of BlueZ is in use. \
+Supports BlueZ4 and BlueZ5."
+
+inherit packagegroup
+
+BLUEZ4_INSTALL = " \
+    obexftp \
+"
+
+BLUEZ5_INSTALL = " \
+     bluez5-noinst-tools \
+     bluez5-obex \
+     bluez5-testtools  \
+     libasound-module-bluez \
+     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', "pulseaudio-module-bluetooth-discover \
+                                                            pulseaudio-module-bluetooth-policy \
+                                                            pulseaudio-module-bluez5-discover \
+                                                            pulseaudio-module-bluez5-device \
+                                                            pulseaudio-module-switch-on-connect \
+                                                            pulseaudio-module-loopback", \
+                                             '', d)} \
+"
+
+# Install either bluez4 or bluez5 if they are in distro.  
+# Otherwise install nothing.
+RDEPENDS_${PN} = " \
+     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', '${BLUEZ5_INSTALL}', "", d)} \
+     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez4', '${BLUEZ4_INSTALL}', "", d)} \
+"
-- 
2.8.2


