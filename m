Return-Path: <daniel.mcdougall@liftoffsoftware.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 231446CFF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 19:18:35 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id i7so4485913yha.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 11:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9e7pwwlaNsxamPMnUfpMHYXvTZ5YrBSi5j58qumjvFI=;
	b=nH0zXqG3VMnGtLuBsRy13OoBUzMUja7tuNVxt38EgR02CUXP3ZCvO023PDgm8q6tle
	8JyfUR/XgoLx0Qn7/IojfFe20PU3wWBNqA5NK+Z2395cvTEnVwpZnQC1M7RsGj+xWsTb
	xSt+nEG5WqeYxsE+H5LEikK0OwH1d+Yg6ZEDyoLWaKmpuTMhJaBljTYaLPnnChYhwYXq
	r1HSjCuUDdPdROvgBewzrn7S7OciixWlkZ/cyDT3YklBHoEjVc2SqWwJ7T8fRwPLWbGa
	1pbfvnuNu0gRiceEe0oWuGmSgPILm7VOCgROgVix7b1B4mgYq6JCvtqsdoWeAN5paTGM
	NDqg==
X-Gm-Message-State: ALoCoQmKGtc1jezA1VDtxrD3OPgjMiIgo9vHSEaau37l1s7UsyYwFYAn1g6/VoOuL0SXWv0MBgdP
X-Received: by 10.236.144.103 with SMTP id m67mr44039yhj.146.1384888717022;
	Tue, 19 Nov 2013 11:18:37 -0800 (PST)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPSA id
	v22sm37401030yhn.12.2013.11.19.11.18.35 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Nov 2013 11:18:36 -0800 (PST)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2013 19:18:16 +0000
Message-Id: <1384888696-21678-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] python-tornado: Updated to version 3.1.1
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
X-List-Received-Date: Tue, 19 Nov 2013 19:18:36 -0000

The sole patch for this package is no longer necessary and has been
removed.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 .../0001-disable-AI_ADDRCONFIG-flag.patch          | 32 ----------------------
 .../recipes-devtools/python/python-tornado_git.bb  |  9 +++---
 2 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch

diff --git a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch b/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
deleted file mode 100644
index 3c3ec7c..0000000
--- a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d7fb0a6ef3f3cbdfc1f21f5a67d54fa9d2c1e183 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 Nov 2011 11:07:24 +0100
-Subject: [PATCH] disable AI_ADDRCONFIG flag
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-status: unknown
----
- tornado/netutil.py |    6 ------
- 1 files changed, 0 insertions(+), 6 deletions(-)
-
-diff --git a/tornado/netutil.py b/tornado/netutil.py
-index cfff0ba..c181f24 100644
---- a/tornado/netutil.py
-+++ b/tornado/netutil.py
-@@ -238,12 +238,6 @@ def bind_sockets(port, address=None, family=socket.AF_UNSPEC, backlog=128):
-     if address == "":
-         address = None
-     flags = socket.AI_PASSIVE
--    if hasattr(socket, "AI_ADDRCONFIG"):
--        # AI_ADDRCONFIG ensures that we only try to bind on ipv6
--        # if the system is configured for it, but the flag doesn't
--        # exist on some platforms (specifically WinXP, although
--        # newer versions of windows have it)
--        flags |= socket.AI_ADDRCONFIG
-     for res in set(socket.getaddrinfo(address, port, family, socket.SOCK_STREAM,
-                                   0, flags):
-         af, socktype, proto, canonname, sockaddr = res
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-oe/recipes-devtools/python/python-tornado_git.bb
index 82a94e6..e51ce3c 100644
--- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
+++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
@@ -1,12 +1,11 @@
 DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
 LICENSE = "Apache"
-LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
+LIC_FILES_CHKSUM = "file://README.rst;md5=b34308b7b58b086690bf3d59ea9f3b28"
 
-PV = "2.2"
+PV = "3.1.1"
 PR = "r1"
-SRCREV = "c501917eba46dec30b1f2ef12497dffc4beec505"
-SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
-           file://0001-disable-AI_ADDRCONFIG-flag.patch \
+SRCREV = "495c94f6329e457bc5678e4aa38c228f8e93a4c8"
+SRC_URI = "git://github.com/facebook/tornado.git;branch=branch3.1 \
           "
 
 S = "${WORKDIR}/git"
-- 
1.8.1.2


