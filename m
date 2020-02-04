Return-Path: <asmithakarun@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 921966041D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 09:21:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 2so9115332pfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2020 01:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W2DB0plxGNNxBQxz3YjgRYsoOweMyinr7vbCmGcPEHA=;
	b=PFlXwnnHrKNWreDzjbM6rOKPN9GqZUpub08OH6osEulGj+f2ioJeVsP7xp7is59+v9
	ygGerKaUjnGUJGwgoUArfz9kEPzHvEnc+MLcNNVX5012mrdg3x4sRsmQaQ7j8N/moJtm
	BLZi0MdT0aGL6giegu9qYwXc/5h6+3lKTiyP8B85p9IM82xkkNfFGz57pROzl8Lg3h1+
	Can3EWAidpxT/wzLYRLCAHeUhGOgRYeq6XvjB5aoKOcgsJSNpnOCELr18EACTrjnKA3Y
	WCk2lQN90NJh/vOXYuiFvVXCQFoaMN7nDVf/zXZGQ/OH8xS4OEd9M3jcUBl8AyppspcP
	fnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W2DB0plxGNNxBQxz3YjgRYsoOweMyinr7vbCmGcPEHA=;
	b=gJRqtRlvbH/XEHg/65oKB/NNwGUBaeNNoFEmaJCuMVE0vqMjYv8TODSs2gN9yvjU//
	jL+3mW5Cm3UlHvDAuD+1/NKeEwtCOFHh1PFNcXv9oIqut1nCSGd/16143OivI0TwdBTh
	lRYl6a/iRVa4U4jA0BE8gjTmeea8yY7XF7/zfB1bEZ3wDJyXqVW8qB6dd83k8IBGiEBd
	ANmIA5nh4ifeWGZJNUW6s9oLqbbYjM9tchz3N3y3pknC9g7ttuK4/Rub7CyWaYjmAfUd
	ovYChWfLTIqhzFEofh7sSNBWaix+hKGdnxxpuDr4pNgK89tE8XU1fT0Q5g/h/loFtATl
	pPSQ==
X-Gm-Message-State: APjAAAXI43rUfPwD1qWFW00u6jnW5ixxWdwttqcYnbXW+CarAzROHxOM
	Ry6hY68vpdrz8NXR8PK+yD061Kk+
X-Google-Smtp-Source: APXvYqxDup8LFYy4dqm8gxrXpfTTy01sOQWABWjVWfZPoB0eQcFCLtrO2Nc/Vwj+LoFbeOku4iVJpg==
X-Received: by 2002:a62:7883:: with SMTP id
	t125mr30846813pfc.141.1580808093099; 
	Tue, 04 Feb 2020 01:21:33 -0800 (PST)
Received: from dhcp-9-199-73-82.in.ibm.com ([129.41.84.80])
	by smtp.gmail.com with ESMTPSA id
	w8sm22832391pfn.186.2020.02.04.01.21.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 01:21:32 -0800 (PST)
From: Asmitha Karunanithi <asmithakarun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Feb 2020 14:51:26 +0530
Message-Id: <20200204092126.19209-1-asmithakarun@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] Library to aid multi-part form data parsing
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
X-List-Received-Date: Tue, 04 Feb 2020 09:21:32 -0000
Content-Transfer-Encoding: 8bit

From: asmitha <asmithakarun@gmail.com>

Mimetic library helps parsing the multi-part form data. This library
can be used for scenarios that includes multi-part form data file uploads
to the BMC.

The patch file (config.patch) includes:
i) addition of a compilation flag - "no-narrowing" since this has been
treated as warning in earlier versions of c++ and now with the higher
versions, this is treated as errors.
ii) the test directory is removed as there were errors (relocation errors)
since the shared object files of libc++ and libc were not taken from the
sysroot path but from the system's library path where the required
version of the .so is not present.

Signed-off-by: asmitha <asmithakarun@gmail.com>
---
 .../libmimetic/libmimetic/config.patch        | 25 +++++++++++++++++++
 .../libmimetic/libmimetic_0.9.8.bb            | 19 ++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic/config.patch
 create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb

diff --git a/meta-oe/recipes-support/libmimetic/libmimetic/config.patch b/meta-oe/recipes-support/libmimetic/libmimetic/config.patch
new file mode 100644
index 000000000..52bf7b450
--- /dev/null
+++ b/meta-oe/recipes-support/libmimetic/libmimetic/config.patch
@@ -0,0 +1,25 @@
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
+diff --git a/configure.in b/configure.in
+index 5e8f3d4..af1018e 100644
+--- a/configure.in
++++ b/configure.in
+@@ -30,7 +30,7 @@ debug_enabled=false
+ dnl CFLAGS and CXXFLAGS default to -O2 -g
+
+ dnl CXXFLAGS="$CXXFLAGS -DNDEBUG -fno-exceptions"
+-CXXFLAGS="$CXXFLAGS -DNDEBUG"
++CXXFLAGS="$CXXFLAGS -DNDEBUG -Wno-narrowing"
+
+ AC_ARG_ENABLE(debug,
+   [  --enable-debug[=LEVEL]  enables debug symbols [default=2]],
diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
new file mode 100644
index 000000000..a0a704188
--- /dev/null
+++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
@@ -0,0 +1,19 @@
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
+            file://config.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
2.21.0


