Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 97A056011A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 13:56:15 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g62so26416297wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 05:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qfJtdG32DEerQWnniy8RdpY+g6S+JgByzxTx0ZK5dXU=;
	b=ODDLhTb69TPo1MMOoJf76ZJQ/ElMTA4+JLw7JUgP5Cuq4YSlZCF3jJ0UBaEHR93aNf
	0+gWMZpru7kNlcYh8CeCp0LPuXsjQCNHLtCcKEwCIIIO/fGceQXSaj4ZbBShip1VzPML
	jmNjCkFey9adAl6Hwz4lTY3wObxhqGDyzLu2qdwG1wMitZ79OxDsjmRvwvviRadgjuPC
	UaTTtVut2uJGl1axlT+vxt2NjX5r3TX4XQevteLCZJY+Oj46aaQ9a1sjGceuSoGX5lyc
	wERrhFp24CsT+MUVX6IyWxnxgMfYXQHNVhkqJh0NTqLkiJ0Z/t76mAURI6yj/clS/XIN
	NUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qfJtdG32DEerQWnniy8RdpY+g6S+JgByzxTx0ZK5dXU=;
	b=WaLRfFwNNfSacNRGEq+R/T4J5lEx6D/Je5KZzgCvJQGY4jKrKYfMn6jNbl6zkutvuL
	3pcXFuUSJnwujqCPyZrWml9Iq8qfyS1fQ5yCgnlKbVoAN3HuW7iwKsxbowKAwdgk4vB+
	M4jGShUOuOBiedIG1i/N67vMn3CBiplAf62Th+j2vozP8RLIPopP7JQHWZYLhxygZG+4
	sR+4rW8woV+vIss+KWVAP43QzWjZYcmaztK6MYDJJ5ic+3G6djlTNlh7gWDoc9RUUZZo
	ImByHXTs8DqHXIYKVeROr3p4Xjme8gtkMFDT0Z09+m3/g4ylnf2WwJzH5eIJcaEA74Eq
	U0HA==
X-Gm-Message-State: AG10YOQ9IAdq0JqcKD2wWawgh7Nyrr8HDIEm4p7fEmvtV1fCHV9ov7Vu4b6DsBIiS/HqjQ==
X-Received: by 10.194.103.198 with SMTP id fy6mr9142261wjb.48.1455803776210;
	Thu, 18 Feb 2016 05:56:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hh8sm6665588wjc.42.2016.02.18.05.56.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Feb 2016 05:56:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2016 14:56:37 +0100
Message-Id: <1455803797-4057-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-qt5] examples: fix few thousands host-user-contaminated QA warnings
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
X-List-Received-Date: Thu, 18 Feb 2016 13:56:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/demo-extrafiles/qt5-demo-extrafiles.bb | 6 +++---
 recipes-qt/examples/cinematicexperience_1.0.bb    | 2 +-
 recipes-qt/examples/qt5everywheredemo_1.0.bb      | 4 ++--
 recipes-qt/examples/qt5ledscreen_1.0.bb           | 4 ++--
 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb     | 6 +++---
 recipes-qt/examples/qt5nmapper_1.0.bb             | 6 +++---
 recipes-qt/examples/qtsmarthome_1.0.bb            | 6 +++---
 recipes-qt/examples/quitbattery_1.0.0.bb          | 4 ++--
 recipes-qt/examples/quitindicators_1.0.1.bb       | 4 ++--
 9 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/recipes-qt/demo-extrafiles/qt5-demo-extrafiles.bb b/recipes-qt/demo-extrafiles/qt5-demo-extrafiles.bb
index 934a30b..0d65ba1 100644
--- a/recipes-qt/demo-extrafiles/qt5-demo-extrafiles.bb
+++ b/recipes-qt/demo-extrafiles/qt5-demo-extrafiles.bb
@@ -61,9 +61,9 @@ do_install () {
     install -m 0644 ${WORKDIR}/quitindicators.png ${D}/${datadir}/pixmaps
     install -m 0644 ${WORKDIR}/quitindicators.desktop ${D}/${datadir}/applications
     install -m 0644 ${WORKDIR}/qt5basket.png ${D}/${datadir}/pixmaps
-    install -m 0644 ${WORKDIR}/qt5basket.desktop ${D}/${datadir}/applications 
+    install -m 0644 ${WORKDIR}/qt5basket.desktop ${D}/${datadir}/applications
     install -m 0644 ${WORKDIR}/qt5nesting.png ${D}/${datadir}/pixmaps
-    install -m 0644 ${WORKDIR}/qt5nesting.desktop ${D}/${datadir}/applications 
+    install -m 0644 ${WORKDIR}/qt5nesting.desktop ${D}/${datadir}/applications
     install -m 0644 ${WORKDIR}/qt5solarsystem.png ${D}/${datadir}/pixmaps
-    install -m 0644 ${WORKDIR}/qt5solarsystem.desktop ${D}/${datadir}/applications    
+    install -m 0644 ${WORKDIR}/qt5solarsystem.desktop ${D}/${datadir}/applications
 }
diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
index 116127f..0c53573 100644
--- a/recipes-qt/examples/cinematicexperience_1.0.bb
+++ b/recipes-qt/examples/cinematicexperience_1.0.bb
@@ -26,7 +26,7 @@ require recipes-qt/qt5/qt5.inc
 do_install() {
     install -d ${D}${datadir}/${P}
     install -m 0755 ${B}/Qt5_CinematicExperience ${D}${datadir}/${P}
-    cp -a ${S}/content ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/content ${D}${datadir}/${P}
     install -m 0644 ${S}/Qt5_CinematicExperience.qml ${D}${datadir}/${P}
 
     install -d ${D}${bindir}
diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index 057aaaa..ab2bbd4 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -15,8 +15,8 @@ require recipes-qt/qt5/qt5.inc
 
 do_install() {
     install -d ${D}${datadir}/${P}
-    install -m 0755 ${B}/QtDemo ${D}${datadir}/${P}   
-    cp -a ${S}/qml ${D}${datadir}/${P}  
+    install -m 0755 ${B}/QtDemo ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/qml ${D}${datadir}/${P}
 }
 
 FILES_${PN}-dbg += "${datadir}/${P}/.debug"
diff --git a/recipes-qt/examples/qt5ledscreen_1.0.bb b/recipes-qt/examples/qt5ledscreen_1.0.bb
index e16c557..e2b994b 100644
--- a/recipes-qt/examples/qt5ledscreen_1.0.bb
+++ b/recipes-qt/examples/qt5ledscreen_1.0.bb
@@ -14,8 +14,8 @@ S = "${WORKDIR}/ledscreen_1.0"
 
 do_install() {
     install -d ${D}${datadir}/${P}
-    #install -m 0755 ${B}/QUItBattery ${D}${datadir}/${P}  
-    cp -ar ${S}/* ${D}${datadir}/${P}  
+    #install -m 0755 ${B}/QUItBattery ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/${P}
 }
 
 FILES_${PN}-dbg += "${datadir}/${P}/.debug"
diff --git a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
index 7edf727..145f797 100644
--- a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
+++ b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
@@ -16,9 +16,9 @@ require recipes-qt/qt5/qt5.inc
 
 do_install() {
     install -d ${D}${datadir}/${P}
-    install -m 0755 ${B}/Qt5_NMap_CarouselDemo ${D}${datadir}/${P}  
-    cp ${S}/Qt5_NMap_CarouselDemo.qml ${D}${datadir}/${P}  
-    cp -a ${S}/content ${D}${datadir}/${P}  
+    install -m 0755 ${B}/Qt5_NMap_CarouselDemo ${D}${datadir}/${P}
+    cp ${S}/Qt5_NMap_CarouselDemo.qml ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/content ${D}${datadir}/${P}
 }
 
 FILES_${PN}-dbg += "${datadir}/${P}/.debug"
diff --git a/recipes-qt/examples/qt5nmapper_1.0.bb b/recipes-qt/examples/qt5nmapper_1.0.bb
index 77cb067..762ad20 100644
--- a/recipes-qt/examples/qt5nmapper_1.0.bb
+++ b/recipes-qt/examples/qt5nmapper_1.0.bb
@@ -17,9 +17,9 @@ require recipes-qt/qt5/qt5.inc
 
 do_install() {
     install -d ${D}${datadir}/${P}
-    install -m 0755 ${B}/Qt5_NMapper ${D}${datadir}/${P}  
-    cp ${S}/Qt5_NMapper.qml ${D}${datadir}/${P}  
-    cp -a ${S}/content ${D}${datadir}/${P}  
+    install -m 0755 ${B}/Qt5_NMapper ${D}${datadir}/${P}
+    cp ${S}/Qt5_NMapper.qml ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/content ${D}${datadir}/${P}
 }
 
 FILES_${PN}-dbg += "${datadir}/${P}/.debug"
diff --git a/recipes-qt/examples/qtsmarthome_1.0.bb b/recipes-qt/examples/qtsmarthome_1.0.bb
index 944c4dc..da1bbdf 100644
--- a/recipes-qt/examples/qtsmarthome_1.0.bb
+++ b/recipes-qt/examples/qtsmarthome_1.0.bb
@@ -17,9 +17,9 @@ require recipes-qt/qt5/qt5.inc
 
 do_install() {
     install -d ${D}${datadir}/${P}
-    install -m 0755 ${B}/smarthome ${D}${datadir}/${P}   
-    cp -a ${S}/qml ${D}${datadir}/${P}  
-    cp -a ${S}/components ${D}${datadir}/${P}  
+    install -m 0755 ${B}/smarthome ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/qml ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/components ${D}${datadir}/${P}
 }
 
 FILES_${PN}-dbg += "${datadir}/${P}/.debug"
diff --git a/recipes-qt/examples/quitbattery_1.0.0.bb b/recipes-qt/examples/quitbattery_1.0.0.bb
index ea218d7..6c2d3d1 100644
--- a/recipes-qt/examples/quitbattery_1.0.0.bb
+++ b/recipes-qt/examples/quitbattery_1.0.0.bb
@@ -16,8 +16,8 @@ require recipes-qt/qt5/qt5.inc
 
 do_install() {
     install -d ${D}${datadir}/${P}
-    install -m 0755 ${B}/QUItBattery ${D}${datadir}/${P}  
-    cp -a ${S}/qml ${D}${datadir}/${P}  
+    install -m 0755 ${B}/QUItBattery ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/qml ${D}${datadir}/${P}
 }
 
 FILES_${PN}-dbg += "${datadir}/${P}/.debug"
diff --git a/recipes-qt/examples/quitindicators_1.0.1.bb b/recipes-qt/examples/quitindicators_1.0.1.bb
index 19a861a..3e42d04 100644
--- a/recipes-qt/examples/quitindicators_1.0.1.bb
+++ b/recipes-qt/examples/quitindicators_1.0.1.bb
@@ -15,8 +15,8 @@ require recipes-qt/qt5/qt5.inc
 
 do_install() {
     install -d ${D}${datadir}/${P}
-    install -m 0755 ${B}/QUItIndicators ${D}${datadir}/${P}  
-    cp -a ${S}/qml ${D}${datadir}/${P}  
+    install -m 0755 ${B}/QUItIndicators ${D}${datadir}/${P}
+    cp -R --no-dereference --preserve=mode,links ${S}/qml ${D}${datadir}/${P}
 }
 
 FILES_${PN}-dbg += "${datadir}/${P}/.debug"
-- 
2.7.1


