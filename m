Return-Path: <ticotimo@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4F77EC40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 05:03:19 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id e11so851441pjt.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 21:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VEFF106QCmHJnxKkSDqvTHMMeK7bsCzLqiUSUTs9Mew=;
	b=bOiSFHXV4rpfABKvQbmT/Y7CDctgxMbLHVwNswSXjaN5i5ZW/LgmW3+AcYq/bGWcRy
	D5FbeXQMHbmq48vGr4ckdN2G5PFG7fCih6IoW2uHIjs0dQRy6p27/VvluYvspxWvbllA
	kEAqtysWRT4firfbNvUdQFsgzeUN/F82XwvinulIb4KJY0r7kFMKVeSrrvzT0aonUqFF
	PDJfsVq+Zuh51Hq/3L0LmYP9BakaQkY0+5ILuA83GFtoczQCjMIX2xE367JyXMeyd0FU
	pyiKil6MD9Gfy7r5CIZveSWyyX3vnX2Sv9Q2UcVJJohiT0PRsFstCA6QdG/M6ELiF3Tp
	G/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VEFF106QCmHJnxKkSDqvTHMMeK7bsCzLqiUSUTs9Mew=;
	b=ns7+EHYmqQfus4G1sTz6vV/lX30Rup5dQPOkuDu6TXka6VDULGOy+rKEJGzfOgNWdA
	fK0+z13OwmjStuq1BfHbU2xZZ0HlFlSVZ7ecjgcVaFYVk0L2lb4QXgm6PBLqsAAtDm0C
	m/t/y3wPIQNu8ImZtl/ZobcHAwCl3mhNgo3puyTOUvWIca0uol9JIC+VRPnXRdjXUdrB
	HsqLsKJXfcB5pgRCMVYhA7N0myGtgZY2Nstt/Jfv2UQ7Lo63b9qpEjQ+/GcgFcafmyJO
	65qRQzR0xQibrFjdXKMIaDuf2yDIACUkeHl8lFz9wKmABM05V77tCwPkUnyDc1b0QsBf
	La0Q==
X-Gm-Message-State: APjAAAVb3kbcLZmPAGSbj0OUiYk9DI/jpTC8exRVOaxBCm6TzrtgEZ/z
	ipZA37zEctIxT/9+DGedVGZE0w4vlng=
X-Google-Smtp-Source: APXvYqyoMdrFkCBqaPpEyq9rshO/LD/BCSLq9cvAcaBIxYco4uRGbc2HXvVrhMoh5gGcGrVyn8ADzA==
X-Received: by 2002:a17:902:7e4d:: with SMTP id
	a13mr3590870pln.281.1579583000805; 
	Mon, 20 Jan 2020 21:03:20 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:7c96:1b52:3429:d935])
	by smtp.gmail.com with ESMTPSA id
	y62sm43387877pfg.45.2020.01.20.21.03.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 21:03:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 21:02:54 -0800
Message-Id: <20200121050257.16561-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/4] python-wrapt: add recipe for 1.11.2
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
X-List-Received-Date: Tue, 21 Jan 2020 05:03:20 -0000
Content-Transfer-Encoding: 8bit

Module for decorators, wrappers and monkey patching.

Dependency for python-deprecated

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python-wrapt_1.11.2.bb             | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/recipes-devtools/python/python-wrapt_1.11.2.bb b/recipes-devtools/python/python-wrapt_1.11.2.bb
index 6a286ab9..9a9e2f48 100644
--- a/recipes-devtools/python/python-wrapt_1.11.2.bb
+++ b/recipes-devtools/python/python-wrapt_1.11.2.bb
@@ -1,15 +1,34 @@
-SUMMARY = "A Python module for decorators, wrappers and monkey patching."
-HOMEPAGE = "http://wrapt.readthedocs.org/"
-LICENSE = "BSD-2-Clause"
+SUMMARY = "Module for decorators, wrappers and monkey patching."
+DESCRIPTION = "The aim of the wrapt module is to provide a transparent object \
+proxy for Python, which can be used as the basis for the construction of \
+function wrappers and decorator functions.\
+\
+The wrapt module focuses very much on correctness. It therefore goes way \
+beyond existing mechanisms such as functools.wraps() to ensure that decorators \
+preserve introspectability, signatures, type checking abilities etc. The \
+decorators that can be constructed using this module will work in far more \
+scenarios than typical decorators and provide more predictable and consistent \
+behaviour.\
+\
+To ensure that the overhead is as minimal as possible, a C extension module is \
+used for performance critical components. An automatic fallback to a pure \
+Python implementation is also provided where a target system does not have a \
+compiler to allow the C extension to be compiled."
+HOMEPAGE = "https://github.com/GrahamDumpleton/wrapt"
 SECTION = "devel/python"
+
+LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fdfc019b57affbe1d7a32e3d34e83db4"
 
+PYPI_PACKAGE = "wrapt"
 SRC_URI[md5sum] = "cc15c001b129f81eb2f79b15eb99ffe5"
 SRC_URI[sha256sum] = "565a021fd19419476b9362b05eeaa094178de64f8361e44468f9e9d7843901e1"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-stringold \
+S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
+
+RDEPENDS_${PN}_append_class-target = "\
+    ${PYTHON_PN}-lang \
     ${PYTHON_PN}-threading \
 "
-- 
2.25.0


