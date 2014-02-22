Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id B07686B86F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 13:18:56 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so599865eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 05:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IqLRFbAo9WA4XLlKngr5HZ1i65P+EjbMGyXwfITKWSc=;
	b=cCn/8Be/Abm/f2k58EZSwZ5OejXl6DQwCG5kLubmNvJGWKr4mf7wfg327wtuIGK5tc
	n5Pogx9VSfx+toDm9mI7LQgOai8uV7H2YMux1fovlOtVL5Twk5smB0014SQG3neD0S/G
	bTS51/AuAR+GouOMBUYn3gEWDJhQd/uZdA/5jKESm4BEt0YG0bGAAoNbugwr4bOFsEpe
	ybBGbLYJ3Vq+rtcb9BjykcRS/d3X9wzPB1An1cH7LFKui8zc/OQpbDHv3YWGoqaWpH9g
	1Yt2txTEc72ng69F/fGa5XXtWqVpGSAPtuzKEuXR4s6ciFsas87rs6eQMEB/z8PMfEv1
	dqtQ==
X-Received: by 10.14.179.129 with SMTP id h1mr14492853eem.26.1393075137177;
	Sat, 22 Feb 2014 05:18:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm38800686eeg.16.2014.02.22.05.18.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 05:18:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Feb 2014 14:19:30 +0100
Message-Id: <1393075171-11866-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-qt5][PATCH 1/2] qtbase: Move remaining few by default enabled options to PACKAGECONFIG_DEFAULT
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
X-List-Received-Date: Sat, 22 Feb 2014 13:19:00 -0000

* more and more people don't want to redefine whole PACKAGECONFIG variable

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index d8ad4da..6c47730 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -44,13 +44,11 @@ PACKAGECONFIG_DISTRO ?= ""
 PACKAGECONFIG_RELEASE ?= "release"
 # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
 # PACKAGECONFIG_OPENSSL ?= "openssl"
+PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets"
 
-PACKAGECONFIG ??= " \
+PACKAGECONFIG ?= " \
     ${PACKAGECONFIG_RELEASE} \
-    dbus \
-    udev \
-    evdev \
-    widgets \
+    ${PACKAGECONFIG_DEFAULT} \
     ${PACKAGECONFIG_OPENSSL} \
     ${PACKAGECONFIG_GL} \
     ${PACKAGECONFIG_FB} \
-- 
1.8.5.3


