Return-Path: <cynthia.ms.chiu@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AA0416AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 15:08:40 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i6so4586942pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nYZFM/Wmd0E8jIB1J0KZrwRtB0EkAQWcfZBzhGLQLjI=;
	b=PsMLDSRvgT77SxWQRhDbw0AsgvEVHDbix4uWhhmyMT2Bh5Rn2yMZuJXsVLvbFiKyAC
	omI9W3cSU1tN5yCnLKZuEEUOtizxaluTkzViA++2RDpQhp/yKg7ioOxXy2M+Z0x3H0sw
	DdFCtI7g5ivvwSqz8ghvxUujhv88LfKriRSBdYLXNn9UvpzqJNr0nH7A/+qtjzDUWxgc
	XQOzKr7D7KBJbFoMJ35+341xr/XcgRHEZ5WYqS28yxx4LidhIMEKWSvdXAWEwlrfjZxM
	vcLX8Lc7tzgJoD5JOpcsP//p2WL0LDNXm73hmT00pn9h1oLZMEo5jmCsF8EA4l8dsOXs
	+T6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nYZFM/Wmd0E8jIB1J0KZrwRtB0EkAQWcfZBzhGLQLjI=;
	b=l4fW7Wk7FPADDKfhO1G518HjvQyOnEt1ME99hweWpx77YUgnvBV5g/53IL2QdKNdSS
	ejOHP3HyR4otiwpbyN2t2KeC/iTts8plQ9HEyQMEUGz0nI9pduy8KVNTNi7sFXMxcaoQ
	aVSidvE1+mLPbLeDHQuEJbUX6We/nXr1Zr7dS/liOZe5GVOS/49yeNg5g1Ftrg1Oh8uy
	O6MzT3vIjqPjzkQ2MIFm+o062RqpCALripx8qGPdB2hat45aflP/kw/lLepCROe4Xy7b
	tAfzKrgXrz76bY+Ryn+sgYJbdYz0zWZaNephbPxxsKqKRC0B/xiGXt5j6WoVGsieSfIl
	ODMA==
X-Gm-Message-State: ALyK8tL5UTH7vzEPyNXzztGD265Pq5EF2zld5Y1Ka8n91LHejp80cIP0s6Qf0TlJD6u2bg==
X-Received: by 10.98.104.71 with SMTP id d68mr2591897pfc.163.1468508921321;
	Thu, 14 Jul 2016 08:08:41 -0700 (PDT)
Received: from cynthia-VirtualBox.int.pason.com ([69.58.16.38])
	by smtp.gmail.com with ESMTPSA id
	y184sm6370083pfg.94.2016.07.14.08.08.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 08:08:40 -0700 (PDT)
From: cynthiachiu <cynthia.ms.chiu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2016 09:08:34 -0600
Message-Id: <1468508914-17420-1-git-send-email-cynthia.ms.chiu@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] CANopenNode: recipe for building the CANopenSocket tools
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
X-List-Received-Date: Thu, 14 Jul 2016 15:08:44 -0000

Initial check-in for the CANopenSocket tools recipe.

Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>

Including a specific revision for the recipe.

Using gitsm.

Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
---
 .../canopennode/canopensocket_git.bb               | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-extended/canopennode/canopensocket_git.bb

diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
new file mode 100644
index 0000000..7c58a26
--- /dev/null
+++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Linux CANOpen tools"
+DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
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


