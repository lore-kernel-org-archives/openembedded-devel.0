Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 33339731A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:58:49 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id n5so30529612wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=C/qSxHAtoNjSrlF8l6OoxkfTfVzy4h/bEZRfaqDe6nY=;
	b=ECVfTuPHJclne5HJUF1pqY9aOHhG3uIPOglSlmzHS+mD3WSdflNWZYa5v8ngoyo4cv
	+jmg6DpXTBJTncfZBHP99bTO8WWs1U2ZI6u+QxZ5xoFv+toNTaw1c8BYCVfLkZEUTrD6
	++z2bsWLf0Soh5jtUloXKWMO7lFJMHZ45ox10=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=C/qSxHAtoNjSrlF8l6OoxkfTfVzy4h/bEZRfaqDe6nY=;
	b=zNYAuW9IvmKtLCCSBBYsWk3LqRpQDq9v/n2uWBrrpHNV2liEpq1BTu670W1ap4peo0
	HZELWSxtNw5Ptuqsf8lxGoaOrItH2xAgdDqPrJIobrP3/vhPMTN2N0KMAFCRtgvuzEGI
	c7QuwxXiai07m/RM/Vs18ymKua90gSW2bDekKlxwBiLUSiLWkA5zp7jv+V2CL9dDUvaA
	eZtiT8dFIIS+Ck8GB0yeZV7RK05yEmnLRoKZwtKaOkt4zHM9PRoy1yUFIXdy3em7tT66
	4yoJTciK5CaXnhPFGPa41rJGfXTilzlzjudMHEdXCG9xdq1GGDea4cjAg2gtjkXA2mId
	f7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=C/qSxHAtoNjSrlF8l6OoxkfTfVzy4h/bEZRfaqDe6nY=;
	b=g7NnLYuEmRu2xy+0TAtxiy/RtJPF4WZac/TZn3IO1/ITq3qj0c3NLMObci3cZvBEaL
	gtu90GIeE5ixo1Jb8CckU8RU3lsJOIKci4HM0h1QHIGlwOqN5IVWkchGVeExOpEy58eV
	KzfxNYkYP05Br7If5zjpC177rr46D/odI3yF4LtnU/xWdIrjyIWqmAJmDcN6S0iOCAAK
	eaXVF0DfR4TXro7qAzpJl+FovQPQrjTre3aCW6MrdaJdChOR3IUGGiF2znPg89Xkddnv
	3iMtJ6t5UDRxQHgomzP+ij1UAoC3qgxSYwaP+c8LCCFRKWnONxByn0rOwdDZv2EXY40F
	EDRg==
X-Gm-Message-State: AG10YOSgfmzrhz09rja3TWOtpOcbtr1N3wUZ4L/e38UYJQvRKIVyOcZchYXupgGNjMeQQA==
X-Received: by 10.28.46.193 with SMTP id u184mr32544746wmu.102.1453906730028; 
	Wed, 27 Jan 2016 06:58:50 -0800 (PST)
Received: from centos7.localdomain ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id x10sm6597766wjx.8.2016.01.27.06.58.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 06:58:49 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jan 2016 15:58:35 +0100
Message-Id: <1453906715-6881-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: [meta-qt5][PATCH] qtwebengine: build examples by default
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
X-List-Received-Date: Wed, 27 Jan 2016 14:58:51 -0000

From: Manuel Bachmann <mbc@iot.bzh>

Just as we do for qtwebkit, let us have a patch to build
qtwebengine examples by default.

Otherwise, the "qtwebengine-examples" package will be
empty, and attempting to add it with "IMAGE_INSTALL_append"
will result in an error message.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../0001-examples-enable-building-examples-by-def.patch         |    7 +++++++
 recipes-qt/qt5/qtwebengine_git.bb                               |    1 +
 2 files changed, 8 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-examples-enable-building-examples-by-def.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-examples-enable-building-examples-by-def.patch b/recipes-qt/qt5/qtwebengine/0001-examples-enable-building-examples-by-def.patch
new file mode 100644
index 0000000..3b13c02
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-examples-enable-building-examples-by-def.patch
@@ -0,0 +1,7 @@
+--- a/qtwebengine.pro	2016-01-04 02:08:57.152198023 +0000
++++ b/qtwebengine.pro	2016-01-04 02:09:11.667422022 +0000
+@@ -1,2 +1,4 @@
+ load(qt_build_config)
+ load(qt_parts)
++
++SUBDIRS += examples
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 7660932..7cdbea8 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -115,6 +115,7 @@ SRC_URI += " \
     file://0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch \
     file://0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch \
     file://0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch \
+    file://0001-examples-enable-building-examples-by-def.patch \
 "
 
 SRCREV_qtwebengine = "40ef43e0d69c4a86c9430b7f264d2cde6340ee0f"
-- 
1.7.10.4


