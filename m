Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 50A257EC4C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 13:38:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x4so24055696wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z28hvgpiEdooLuJ0phytlbyRvTCavqD1mWh8VR+koIg=;
	b=QUMaJBGhq95hqNMtmFBn3BQ7NZguEhI3LcLO8I7tWw4lBH6qEY+0J+hDlMTJsEwsjO
	RRXgGSBnqVeqqinqmsHG9qGMomMF9XShUTpteCI1z0fJelGsWpd3UobNUhIqCwYL+ky6
	o4foHuOWcHDvIENuVFBrQunpOz7FN4K08+azam8xhuti0jmJz9GmMgAeIeBDRqaenEcU
	pJyb85jxT/kr9o0acSV76OnayAzwSiYS8ANG2CfSaYDpqqMr0XIk3Bp5I5R5iG2THAVb
	AhcBpbvSJfjoCXKPQBmaSu7quFfHoawxtp9pPLbDEROVRrwBZQvb5Go8T0PcSwoUouAw
	mTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z28hvgpiEdooLuJ0phytlbyRvTCavqD1mWh8VR+koIg=;
	b=N0Z9Is+wgAzKL4XlCUjml/RP/kWUP37kk5w3+STbCDOkBG6XiiVwWdU5H5aA1ZOcjb
	AA6hOG9m9Jvc9U36s/7iAkzxMEk/lpmvZZZuH1Wpy+5h/TJ3WLLGBXr+Nb8xoZqfDdS7
	h9vZ3V9NGCpbk/brxAaS4poLyd929hrTX2BpK7AecjQV1KD6+lQ4GuLiGCeHoGNE0jqM
	Ip7TcNwVmFw2FC2hGXPhCnsqS4Lr65X4gKWWOgLlTVbglFIH1Hd5cSlXB+RGKLPg5/Pj
	/kYeuIPptrIQ3mDj8rqstVdA9qF/5j7IFS1wrhhgHqDauebXwpJvorwKcfeMcAsKTRHq
	WihA==
X-Gm-Message-State: APjAAAW+ovYuWiRnQjzjuvqN9lX4rkx+cgyXneJUXktj0eGZERjwAuC4
	V4rk/VlECIPcbIJEHImbKvbFww6b
X-Google-Smtp-Source: APXvYqxZMOjDOi2MiufquoYn4SLyS298xWvbwnaud7Q0TTlLPLAIVIEHpgU8UKydIfnCMwSfU3gJ6Q==
X-Received: by 2002:adf:b60c:: with SMTP id
	f12mr112972257wre.231.1564753133503; 
	Fri, 02 Aug 2019 06:38:53 -0700 (PDT)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x16sm56084053wmj.4.2019.08.02.06.38.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 06:38:52 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 14:38:08 +0100
Message-Id: <20190802133808.38181-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-qt4][PATCH] qtbase: fix build with musl
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
X-List-Received-Date: Fri, 02 Aug 2019 13:38:53 -0000
Content-Transfer-Encoding: 8bit

This helps to make sure that QT_SOCKLEN_T is defined to be int
only on glibc < 2 and not also for the libraries that follow the standard
f.ex. musl

see here https://patchwork.openembedded.org/patch/94947/
for the corresponding patch in meta-qt5

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 recipes-qt4/qt4/qt4-4.8.7.inc                 |  1 +
 ...-socklen_t-on-other-C-libraries-than.patch | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-qt4/qt4/qt4-4.8.7/0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch

diff --git a/recipes-qt4/qt4/qt4-4.8.7.inc b/recipes-qt4/qt4/qt4-4.8.7.inc
index d8b178f..1299493 100644
--- a/recipes-qt4/qt4/qt4-4.8.7.inc
+++ b/recipes-qt4/qt4/qt4-4.8.7.inc
@@ -36,6 +36,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://linux.conf \
            file://fix-for-mips-n32.patch \
 	   file://qt-everywhere-opensource-src-4.8.6-QTBUG-22829.patch \
+           file://0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch \
            "
 
 SRC_URI[md5sum] = "d990ee66bf7ab0c785589776f35ba6ad"
diff --git a/recipes-qt4/qt4/qt4-4.8.7/0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch b/recipes-qt4/qt4/qt4-4.8.7/0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
new file mode 100644
index 0000000..7a7a33e
--- /dev/null
+++ b/recipes-qt4/qt4/qt4-4.8.7/0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
@@ -0,0 +1,41 @@
+From dad69257345d5259c36d87e83fa526a2634116c5 Mon Sep 17 00:00:00 2001
+From: Dave Flogeras <dflogeras2@gmail.com>
+Date: Tue, 29 Sep 2015 08:52:31 -0300
+Subject: [PATCH 1/2] Fix for platform socklen_t on other C libraries than
+ glibc.
+
+Rather than treating >=glibc-2 specially, we treat <glibc-2 specially
+and all other libc implementations as POSIX.
+
+This was found here http://patchwork.openembedded.org/patch/94947/ and
+tested with armv6j-hardfloat-linux-uclibceabi and
+armv6j-hardfloat-linux-musleabi.
+
+Change-Id: I3850b1561a2e240f6564afedd80ce39407cc50b6
+Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+---
+ mkspecs/linux-g++/qplatformdefs.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mkspecs/linux-g++/qplatformdefs.h b/mkspecs/linux-g++/qplatformdefs.h
+index de751ddf..d4146ed2 100644
+--- a/mkspecs/linux-g++/qplatformdefs.h
++++ b/mkspecs/linux-g++/qplatformdefs.h
+@@ -86,10 +86,10 @@
+ 
+ #undef QT_SOCKLEN_T
+ 
+-#if defined(__GLIBC__) && (__GLIBC__ >= 2)
+-#define QT_SOCKLEN_T            socklen_t
+-#else
++#if defined(__GLIBC__) && (__GLIBC__ < 2)
+ #define QT_SOCKLEN_T            int
++#else
++#define QT_SOCKLEN_T            socklen_t
+ #endif
+ 
+ #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
+-- 
+2.20.1
+
-- 
2.20.1


