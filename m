Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id ABCD372491
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:03:33 +0000 (UTC)
Received: by wizk4 with SMTP id k4so157792954wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HplLg6pubQmTrzlXMLpOOrxUCxjPurwDY9J70ClqnBw=;
	b=zA75WaRfR56p51zOTZzt1zfMhZKpzpU0J5Jjqh/198Ve32w3+PX2/tmshBx6lEkQNI
	fkakvHnYN+mPb7UlwgFJx+ehFgvnywOo+cvo5yJpdMnD/GW2ezvTmCT0uh8mGsMmE62c
	CL3po6bQtJEAubA27vvbTVm2U2uMaC5EGpZmsFPpkA6LKup3q3zsVaODrzl+HVB/8UOx
	1DNmeQVdmHZg1kq4BAp1vPvoODrWBaJR1R51bwaZ9aQ1eTr8o2Wc4ytqj4upjbAmHyVU
	Q2rx4Ilr/+0P6eP8U/6JSA2QLCbrRKFog0XNCKLIsspnxSh+OXkPpXxVUqVDuSQ+cKtE
	l7eQ==
X-Received: by 10.180.82.135 with SMTP id i7mr3099144wiy.68.1430258614137;
	Tue, 28 Apr 2015 15:03:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id o5sm18410958wia.0.2015.04.28.15.03.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Apr 2015 15:03:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Apr 2015 00:03:25 +0200
Message-Id: <1430258606-26895-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1430258606-26895-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430258606-26895-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/3] qtsystems: add packageconfig for bluez4 and disable it by default
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
X-List-Received-Date: Tue, 28 Apr 2015 22:03:35 -0000

* bluez5 is now enabled by default and conflicts with bluez4

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtsystems.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsystems.inc b/recipes-qt/qt5/qtsystems.inc
index cd2438f..e9b14ae 100644
--- a/recipes-qt/qt5/qtsystems.inc
+++ b/recipes-qt/qt5/qtsystems.inc
@@ -1,6 +1,15 @@
 require qt5.inc
 
-DEPENDS += "qtbase qtdeclarative udev bluez4 gconf"
+DEPENDS += "qtbase qtdeclarative udev gconf"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[bluez4] = "OE_BLUEZ_ENABLED,,bluez4"
+
+do_configure_prepend() {
+    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
+    # disable bluez test if it isn't enabled by PACKAGECONFIG
+    sed -i 's/^    qtCompileTest(bluez)/    OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtsystems.pro
+}
 
 do_install_append() {
     # Remove example.pro file as it is useless
-- 
2.3.5


