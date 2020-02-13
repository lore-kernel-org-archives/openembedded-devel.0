Return-Path: <asmithakarun@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2A02260BB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 09:20:03 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9so2095363plo.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 01:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6WliEL7NP2cC3/JT0tmLCvgraLWjeG8dC40iZVgMrPM=;
	b=AtgT2lWB76CYC0nw/a50Lqj1bqM5x8fg+S+FNU+cSMYiJx/Q9uDuZP9Ng4SZ5EvYrQ
	uGrKjreFzg7GY9inSE+7ykGsBa0pec/EZZfaED7pvkBFdoM5agsbOVv8iCzTE35sJeaX
	QjlUCz1SaxfpFmuB0YMDrt/cWsg/dGEZfnA5OTMDAxrFFJu5bbO1BpGgFyXyWBBPqe94
	igDr8mTFBmk0d/SPqrGONtYNuQXKvpKV6NR8iXwPlMWTJU4kgOKLDw8A+3whgL9kXfY+
	dC7eT4KC67F0iUXIdVZwhchCehpcB5g0sPY7+CDjUebi2mE8mk9tJE4gbvMFRvFIlpna
	fx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6WliEL7NP2cC3/JT0tmLCvgraLWjeG8dC40iZVgMrPM=;
	b=MRk8hixKIVHNw3IMRQOyPwknhaDlRlg9YSksB5Sx6Ff9SxilKsI2LY9iqfaiYB+sMC
	g/J14Wgpqe9DS1e1CMQpWhRnjM0yMjC2YP0EkUiEpKx6WuHTY/sCeexE5J7EtnuDmbph
	LwzEUTsqQtFSym4Ki2Ume2y8pAZK4xzz68cCngUuhCd8XuzoDunh0LdvrSz7ZOSyPeOn
	3RLdEmDOVdomRhPqxa2rn/RS6LY+i7CQEKLDmpM+OoCpD70urBuPSXMa+5+3aF6D2xIn
	2zlDii6mGV462Ncdct2ClR4zol1flaYuTQ6/FcFXODqrw9NjXLHT07+DhENKUd+yPn9S
	APdQ==
X-Gm-Message-State: APjAAAWybKvQd2aejVve57Z4QMjHqjkInXbFfa4xf26Qb9sOhAZh7Dsg
	RGJ8+lyWkcZ+xS/4VxKnxzCHK8AJnyA=
X-Google-Smtp-Source: APXvYqz9Jhr87PfX90OVzw97fD0ZJn8tTVwjw7QUIMdcgwiQiPaPTCJoknjwugZ0V/tZBKigEeo8mw==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id
	iq15mr4130147pjb.86.1581585604500; 
	Thu, 13 Feb 2020 01:20:04 -0800 (PST)
Received: from dhcp-9-199-73-82.in.ibm.com ([129.41.84.91])
	by smtp.gmail.com with ESMTPSA id u12sm2062941pgr.3.2020.02.13.01.20.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 01:20:03 -0800 (PST)
From: asmithakarun@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Feb 2020 14:49:50 +0530
Message-Id: <20200213091950.25001-1-asmithakarun@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [meta-oe][PATCH v2] libmimetic: Library to aid multi-part form data parsing
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
X-List-Received-Date: Thu, 13 Feb 2020 09:20:04 -0000
Content-Transfer-Encoding: 8bit

From: asmitha <asmithakarun@gmail.com>

Mimetic library helps parsing the multi-part form data. This library
can be used for scenarios that includes multi-part form data file uploads
to the system.

The patch file includes:
i) The test directory is removed as there were errors (relocation errors)
since the shared object files of libc++ and libc were not taken from the
sysroot path but from the system's library path where the required
version of the .so is not present.

ii) The files 'mimetic/codec/other_codecs.h' and 'mimetic/contenttype.cxx'
contains changes that resolves errors when compiling on target system
aarch64-yoe-linux-musl.

Signed-off-by: asmitha <asmithakarun@gmail.com>
---
 ...ing-test-directory-from-the-Makefile.patch | 67 +++++++++++++++++++
 .../libmimetic/libmimetic_0.9.8.bb            | 21 ++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
 create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb

diff --git a/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch b/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
new file mode 100644
index 000000000..50cd4d427
--- /dev/null
+++ b/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
@@ -0,0 +1,67 @@
+From 64fd25af5fea3a3c9c12122a2fd0fab3cd420f72 Mon Sep 17 00:00:00 2001
+From: asmitk01-in <asmitk01@in.ibm.com>
+Date: Wed, 5 Feb 2020 00:14:42 -0600
+Subject: [PATCH] libmimetic: Removing test directory from the Makefile
+
+The test directory is removed as there were errors (relocation errors)
+since the shared object files of libc++ and libc were not taken from the
+sysroot path but from the system's library path where the required
+version of the .so is not present.
+
+The files 'mimetic/codec/other_codecs.h' and 'mimetic/contenttype.cxx'
+contains changes that resolves errors when compiling on target system
+aarch64-yoe-linux-musl.
+
+Signed-off-by: asmitk01-in <asmitk01@in.ibm.com>
+Change-Id: I1822b36ad4a1fa5e7b165d8cac3a6e96aca11c35
+---
+ Makefile.am                  | 2 +-
+ mimetic/codec/other_codecs.h | 4 ++++
+ mimetic/contenttype.cxx      | 4 ++++
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 634bd4c..c7cbae7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ MAINTAINERCLEANFILES = Makefile Makefile.in config.cache
+ EXTRA_DIST=LICENSE m4
+-SUBDIRS = mimetic doc examples test win32
++SUBDIRS = mimetic doc examples win32
+ INCLUDES=-I$(top_srcdir)
+ ACLOCAL_AMFLAGS=-I m4
+
+diff --git a/mimetic/codec/other_codecs.h b/mimetic/codec/other_codecs.h
+index c4ccf3f..0fc88fd 100644
+--- a/mimetic/codec/other_codecs.h
++++ b/mimetic/codec/other_codecs.h
+@@ -8,6 +8,10 @@
+ #define _MIMETIC_CODEC_OTHER_CODECS_H_
+ #include <mimetic/codec/codec_base.h>
+
++#ifndef __GLIBC__
++    typedef unsigned int uint;
++#endif
++
+ namespace mimetic
+ {
+
+diff --git a/mimetic/contenttype.cxx b/mimetic/contenttype.cxx
+index 522082d..0577d44 100644
+--- a/mimetic/contenttype.cxx
++++ b/mimetic/contenttype.cxx
+@@ -13,6 +13,10 @@
+ #include <mimetic/tokenizer.h>
+ #include <mimetic/utils.h>
+
++#ifndef __GLIBC__
++    typedef unsigned int uint;
++#endif
++
+ namespace mimetic
+ {
+ using namespace std;
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
new file mode 100644
index 000000000..fd65db2d3
--- /dev/null
+++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
@@ -0,0 +1,21 @@
+# Released under the MIT license.
+
+SUMMARY = "Mimetic Library for multi-part parsing"
+DESCRIPTION = "Email library (MIME) written in C++ designed to be easy to use and integrate but yet fast and efficient."
+AUTHOR = "Stefano Barbato <stefano@codesink.org>"
+HOMEPAGE = "http://www.codesink.org/mimetic_mime_library.html"
+BUGTRACKER = "https://github.com/LadislavSopko/mimetic/issues"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b49da7df0ca479ef01ff7f2d799eabee"
+
+SRCREV = "50486af99b4f9b35522d7b3de40b6ce107505279"
+SRC_URI += "git://github.com/LadislavSopko/mimetic/ \
+            file://0001-libmimetic-Removing-test-directory-from-the-Makefile.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+CXXFLAGS += "-Wno-narrowing"
+
+inherit autotools
-- 
2.23.0


