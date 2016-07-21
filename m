Return-Path: <cynthia.ms.chiu@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 23FC3605BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:38:20 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h186so5915862pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CFVn0G1zHnQk4/c5gP5Zuk32+xu6/QNRFwm4ma4YpBY=;
	b=QW2o+GVyfgpsr8lBLweCrrq99623u+XX5EocJDDUxhtNCJxhABwWxt94KR2VTqIerv
	6U9znqttOtB3yy2FlxLCLMKf8o3Q8nth6ZMQGVlu1KsWBTS6bq66g2ZVw8B/63tGe115
	S9q6Y/2t/o8eUgt7UI2of/8efH/XUIYwgf8U/eYCOPqHB68KEnbl4C5tc/RDaouLSns+
	wmZ3ik78A6mhQEbVb1Pz+gUYF1YpPPETOCvDXtZUkizR434myyUCAOpCIZLF+r3NNQ4Y
	u5K0k7mXNBqufwqY7huBmQfca/npE2IlJSIca7O33bBsMHoMuQoRgybhRDbl+LoW2Z02
	FkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CFVn0G1zHnQk4/c5gP5Zuk32+xu6/QNRFwm4ma4YpBY=;
	b=JEDm2+f2oGN2Nyy1aBkSq+z9/DYe1tnEp6gXhhHaSj/oYrNKykhYL7RAOuExPXCNML
	J/zCDm/Sh7xyqIzljJ3pHci8v+Ly+GNryRfHoWC9/0hRGoJROxwbE0YMxDZ0wm5osfOA
	6E9TIkkW0sj2IZAmyZXUv8bUDodYip37bJICkr3JDRysUGHIJJM6dnRUbFDl/TQDAnLc
	mXRP0z2GO74HX66QJvBqs5eM3IllsyF27gBaNtfCXbC/50BW5tzbWuDbR49cip/0kHgq
	WY9z0ejQfggOSZqbjpPFf3tPRPcO+D3iYxQ2xKl6YdRFe9vCBOcDYm1t17YTQ9rt2akJ
	xI+A==
X-Gm-Message-State: ALyK8tJGd7oH/JACDPIRrdE7QbqHMWlReurPeR3RvgbV4uCuk/8/oB/fqHZE/jtKuERioA==
X-Received: by 10.98.29.201 with SMTP id d192mr69115761pfd.142.1469129901319; 
	Thu, 21 Jul 2016 12:38:21 -0700 (PDT)
Received: from cynthia-VirtualBox.int.pason.com ([69.58.16.38])
	by smtp.gmail.com with ESMTPSA id
	tm1sm14178887pab.31.2016.07.21.12.38.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 12:38:20 -0700 (PDT)
From: cynthiachiu <cynthia.ms.chiu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2016 13:38:16 -0600
Message-Id: <1469129896-2662-1-git-send-email-cynthia.ms.chiu@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v3] Pointing the LIC_FILES_CHKSUM to a valid file.
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
X-List-Received-Date: Thu, 21 Jul 2016 19:38:22 -0000

Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
---
 .../canopennode/canopensocket_git.bb               | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-extended/canopennode/canopensocket_git.bb

diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
new file mode 100644
index 0000000..656d417
--- /dev/null
+++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Linux CANopen tools"
+DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "gitsm://github.com/CANopenNode/CANopenSocket.git"
+SRCREV = "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    cd ${S}/canopend
+    make
+    cd ${S}/canopencomm
+    make
+    cd ${S}/canopencgi
+    make
+}
+
+do_install(){
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/canopend/app/canopend ${D}${bindir}
+    install -m 0755 ${S}/canopencomm/canopencomm ${D}${bindir}
+    install -m 0755 ${S}/canopencgi/canopen.cgi ${D}${bindir}
+}
-- 
1.9.1


