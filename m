Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDD16B86F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 13:18:59 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e51so2032845eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 05:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SIzlWmgnmp+8XJwxN4Y3xcXLHPuZ2xaasL0MFt2q32E=;
	b=qJfAevfTvmkDHQ2Mrcq6ZLe/SxiGNIcl7CJ4srs9NgYXMeLuzQU2ZzNYGlgSS4+H1Y
	M4s3pDQI91Y4FKJ2VnU/NUVdXS55yQZI2cabdP959j0xVsSVWcMdvpznjFXeU6wFs6tP
	AG7LJ/yhnegA6hr9xvbQ68TBn9CIjy85eVWTcufD5KrPJQFF0ckguuGAs/Qib+9RvYXw
	Q0t+EPs2f8WSDDQbOnUNH7lkqDZ30vCYCMjy9JNVQC5QP3f6kZ55WRL3H5aaX/kNFllU
	w3Y0aD4dFCiq2kceSHzcA718wvko9Ts1RADKNob5e6JvHFCTI6NFSCnauVBiJ7srokZ7
	Mt9A==
X-Received: by 10.15.81.197 with SMTP id x45mr13835240eey.28.1393075140372;
	Sat, 22 Feb 2014 05:19:00 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m9sm38806225eeh.3.2014.02.22.05.18.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 05:18:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Feb 2014 14:19:31 +0100
Message-Id: <1393075171-11866-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1393075171-11866-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393075171-11866-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtbase: Fix PACKAGECONFIG[tests]
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

* at least in 5.2.1 tests aren't enabled by default:
  QT_ALL_BUILD_PARTS=" libs tools examples tests "
  QT_DEFAULT_BUILD_PARTS="libs tools examples"
  so without -make option they weren't enabled even with tests in
  PACKAGECONFIG

* add options for other build parts just for completeness

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 6c47730..378f229 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -44,7 +44,7 @@ PACKAGECONFIG_DISTRO ?= ""
 PACKAGECONFIG_RELEASE ?= "release"
 # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
 # PACKAGECONFIG_OPENSSL ?= "openssl"
-PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets"
+PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs"
 
 PACKAGECONFIG ?= " \
     ${PACKAGECONFIG_RELEASE} \
@@ -62,8 +62,11 @@ PACKAGECONFIG ?= " \
 PACKAGECONFIG[release] = "-release,-debug"
 PACKAGECONFIG[developer] = "-developer-build"
 PACKAGECONFIG[sm] = "-sm,-no-sm"
-PACKAGECONFIG[tests] = ",-nomake tests"
-PACKAGECONFIG[examples] = ",-nomake examples"
+PACKAGECONFIG[tests] = "-make tests,-nomake tests"
+PACKAGECONFIG[examples] = "-make examples,-nomake examples"
+PACKAGECONFIG[tools] = "-make tools,-nomake tools"
+# only for completeness, configure will add libs even if you try to explicitly remove it
+PACKAGECONFIG[libs] = "-make libs,-nomake libs"
 # accessibility is required to compile qtquickcontrols
 PACKAGECONFIG[accessibility] = "-accessibility,-no-accessibility"
 PACKAGECONFIG[glib] = "-glib,-no-glib,glib-2.0"
-- 
1.8.5.3


