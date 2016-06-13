Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA4862134
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 10:41:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r5so13785227wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2016 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1szG5xaU/T3Hqe/8MSXRIZm04PVgc+8NpUatjhtQbRM=;
	b=Pwcex2/6u/A0ZPrYM1H/ExJViQM99LT1md1AkARsexWglRyG9tsyCELzg6vFz5Zuil
	5POBX5Rlkv0tBS9kzCTMSB1GPVtaZktLnZc29skhEaZXvooj9E6pDIpP6oUeM/NlY0X2
	KsPZDChY3nCBNpGeyXxzdabWyGwgGUW8Ut7lQ+51eGwx3l1Yqyx+JjXOaBYo4Idp0SMO
	BKGqYnjTsWig9E+lRHeuiZqNWzsM1c/5vzIcJEylod+r34UhuXdWCLcgJJ16056llhQ3
	sCAeBwBsvey1QpLT3/pQ3h1eTmCqMB9EvkVCHrNaGeU273ypR5rf6vydeog6Hn3GgaDd
	0AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1szG5xaU/T3Hqe/8MSXRIZm04PVgc+8NpUatjhtQbRM=;
	b=OS6d03qIhrDkNd4jRN3C6+zAoWGK1/RsU7dTC6rMHFUnMG3+t4c+GSL+5T0e+Mh36v
	WBur5ZEMWjfXN93ZZVWCXDuqKohLH+rhdq5pp3tAFtoQ+TtypHOHP7Uizq+pD8osp5ng
	BPqXfHEpJKzqevrF8yZL6+al5QUuPdCvZE+lTRKYmRi3AWzt44Sv15QhAQSJoGegxjhx
	FwEZWq3ZJTQASGx3s88QvcVNfyv923PtH/DSboavFm6nShczHX9izWUkE7NFwox1TFep
	z5ceZjMXDbDE8s+CDnmcAAti/hYQfBQ5IaPbkrus7vxLBPtejlzshEKFfMZuybNECf4i
	TgVA==
X-Gm-Message-State: ALyK8tK1hIbDF/4hGxAFH1amNlw/ikx8r6LJfR/hexfhe8ZZzfQbozV4dNCeeFpBFU2s1A==
X-Received: by 10.194.81.8 with SMTP id v8mr386496wjx.155.1465814473647;
	Mon, 13 Jun 2016 03:41:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a198sm13669971wme.16.2016.06.13.03.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jun 2016 03:41:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jun 2016 12:41:20 +0200
Message-Id: <20160613104120.30748-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <c34b9a92-71a6-fdf8-2a27-b92fc7c9cb86@linux.intel.com>
References: <c34b9a92-71a6-fdf8-2a27-b92fc7c9cb86@linux.intel.com>
Subject: [meta-smartphone][PATCH] frameworkd, mdbus, gta04-gps-handler, pisi: Remove runtime dependency on broken python-pygobject
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
X-List-Received-Date: Mon, 13 Jun 2016 10:41:15 -0000

* these components need to be upgraded to python3 (python3-pygobject) or
  python-pygobject will need to be fixed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-fso/recipes-freesmartphone/freesmartphone/frameworkd.inc  |  4 +++-
 meta-fso/recipes-freesmartphone/freesmartphone/mdbus_git.bb    | 10 ++++++----
 .../recipes-bsp/gta04-gps-handler/gta04-gps-handler_git.bb     |  5 ++++-
 meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb                    |  5 ++++-
 4 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta-fso/recipes-freesmartphone/freesmartphone/frameworkd.inc b/meta-fso/recipes-freesmartphone/freesmartphone/frameworkd.inc
index 29ecf3e..3ec3721 100644
--- a/meta-fso/recipes-freesmartphone/freesmartphone/frameworkd.inc
+++ b/meta-fso/recipes-freesmartphone/freesmartphone/frameworkd.inc
@@ -46,7 +46,6 @@ RDEPENDS_${PN} += "\
   python-logging \
   python-pprint \
   python-pyalsaaudio \
-  python-pygobject \
   python-pyrtc \
   python-pyserial \
   python-pyyaml \
@@ -59,6 +58,9 @@ RDEPENDS_${PN} += "\
   ${PN}-config \
 "
 
+# python-pygobject is broken http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
+# RDEPENDS_${PN} += "python-pygobject"
+
 RRECOMMENDS_${PN} += "\
   alsa-utils-amixer \
   python-phoneutils \
diff --git a/meta-fso/recipes-freesmartphone/freesmartphone/mdbus_git.bb b/meta-fso/recipes-freesmartphone/freesmartphone/mdbus_git.bb
index f94f1db..4cc5ed5 100644
--- a/meta-fso/recipes-freesmartphone/freesmartphone/mdbus_git.bb
+++ b/meta-fso/recipes-freesmartphone/freesmartphone/mdbus_git.bb
@@ -16,8 +16,10 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "\
-  python-dbus \
-  python-pygobject \
-  python-pprint \
-  python-xml \
+    python-dbus \
+    python-pprint \
+    python-xml \
 "
+
+# python-pygobject is broken http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
+# RDEPENDS_${PN} += "python-pygobject"
diff --git a/meta-openmoko/recipes-bsp/gta04-gps-handler/gta04-gps-handler_git.bb b/meta-openmoko/recipes-bsp/gta04-gps-handler/gta04-gps-handler_git.bb
index 34c791a..74b4168 100644
--- a/meta-openmoko/recipes-bsp/gta04-gps-handler/gta04-gps-handler_git.bb
+++ b/meta-openmoko/recipes-bsp/gta04-gps-handler/gta04-gps-handler_git.bb
@@ -6,7 +6,10 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-RDEPENDS_${PN} += "python-pygps python-pygobject python-core"
+RDEPENDS_${PN} += "python-pygps python-core"
+
+# python-pygobject is broken http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
+# RDEPENDS_${PN} += "python-pygobject"
 
 PR = "r3"
 PV = "0.0.0+gitr${SRCPV}"
diff --git a/meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb b/meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb
index 9423cef..9daae52 100644
--- a/meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb
+++ b/meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb
@@ -5,11 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 HOMEPAGE = "http://freshmeat.net/projects/pisiom"
 SRCNAME = "pisi"
 DEPENDS = "python-native"
-RDEPENDS_${PN} = "python-vobject python-core python-pygtk python-pygobject python-pycairo\
+RDEPENDS_${PN} = "python-vobject python-core python-pygtk python-pycairo\
            python-gdata python-webdav python-ldap python-epydoc python-core\
            python-dateutil python-sqlite3 python-netserver python-netclient\
            python-misc python-ctypes libsyncml"
 
+# python-pygobject is broken http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
+# RDEPENDS_${PN} += "python-pygobject"
+
 # Rdepends on libsyncml and python-pygtk
 #PNBLACKLIST[pisi] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
 PNBLACKLIST[pisi] ?= "RDEPENDS on python-pygtk which was removed from oe-core"
-- 
2.8.4


