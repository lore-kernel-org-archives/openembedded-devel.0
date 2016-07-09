Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 39ED1601A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jul 2016 15:15:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q62so373105qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2016 08:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3iT0EReLaHoykuPdSNjbP/E5DQTgl6LGQKlc0ISP/vs=;
	b=biqcNuFySmn/Q9a9Lo2jLOr4tePves3PPrqQunlZdjZ7MSZsMMwpdaHT1GgrsoR4R3
	4xHyjdviW4fh0B2/UIrjBoziGEptnCkZ+vIBmheV+kL3xXUFgfpGke/sEsqi+8oli/ul
	jaCDhDDF0ANDiojbCWqpvWtFYzeQTt3isMtl4P9Ssvc8nJ+/si+Qwmvi5ul1MMoPPKfl
	LDQnoU808LYm6M7pyOk7F6m2STSlcp6zJzCet7FuN/R6jgDlFk6j5BI+0wFi/b8wjygQ
	5S0is3CTl85Rk4fonvfhfpjyp26hE6S0kVTbJkc4wlykPTbs/FB2q7gINR7cXk0YMndk
	xfxg==
X-Gm-Message-State: ALyK8tK807h7xHrJQNuCzNO9iRSKLPgIhLuI55zSZ26lZxItODUQzyz733JHn/qSKjXRqg==
X-Received: by 10.55.126.7 with SMTP id z7mr13976405qkc.172.1468077328720;
	Sat, 09 Jul 2016 08:15:28 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	o27sm1929360qto.29.2016.07.09.08.15.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jul 2016 08:15:28 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jul 2016 11:14:58 -0400
Message-Id: <1468077298-14504-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-tornado: remove deprecated version 2.2.1
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
X-List-Received-Date: Sat, 09 Jul 2016 15:15:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../0001-disable-AI_ADDRCONFIG-flag.patch          | 32 ----------------------
 .../python/python-tornado_2.2.1.bb                 | 16 -----------
 2 files changed, 48 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-tornado_2.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch b/meta-python/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
deleted file mode 100644
index 0b0d471..0000000
--- a/meta-python/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d7fb0a6ef3f3cbdfc1f21f5a67d54fa9d2c1e183 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 Nov 2011 11:07:24 +0100
-Subject: [PATCH] disable AI_ADDRCONFIG flag
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-Status: unknown
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
diff --git a/meta-python/recipes-devtools/python/python-tornado_2.2.1.bb b/meta-python/recipes-devtools/python/python-tornado_2.2.1.bb
deleted file mode 100644
index 28026b3..0000000
--- a/meta-python/recipes-devtools/python/python-tornado_2.2.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
-
-PV = "2.2.1+git${SRCPV}"
-
-SRCREV = "c501917eba46dec30b1f2ef12497dffc4beec505"
-SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
-           file://0001-disable-AI_ADDRCONFIG-flag.patch \
-"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools
-
-
-- 
1.9.1


