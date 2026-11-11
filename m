Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.800.1794363040035780267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 18:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LTKuB62w;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so1384218eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 18:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363039; x=1794967839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UsCMlL0JZjfEfpYFs0kvridOfvAcJHDIkpIidKNxVjI=;
        b=LTKuB62w284L+5i16epL12lnFp8we2Bu3rxWHiBhGgSqRLXaN7hkxrzx0V23NTPkKX
         J1BfGtxD9ap72jD1fyySMLEtv4sml2t5xuLZqxRFHfsdQNmQnFTDO3iUSgPCSylZrrdV
         wFoKsb6d4tRdXjBSKrezgnh8kL3j5woku68yYak5tYy/hwBEevWgdMzuI5vmCcs2CfeZ
         8q3CP+gEFmqdS0QJDLowql41ZwwZdjM1jiALivLnb8CwJzcdjBI1MmsgMdaGYBLKT/E1
         q8YgFIDMmcZi3n8K2H3gN4grCvk7yGgRFi0Jcsg+bgFmMHHHtxF2g+zQTPHcPCBvV+4V
         jgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363039; x=1794967839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsCMlL0JZjfEfpYFs0kvridOfvAcJHDIkpIidKNxVjI=;
        b=wtZBMUBFPVgu7PubhvveF6jAas2n90ZZMTaULnidlhDidYMN8tLgR2Eu5B2M8k61kk
         J3PzWg9VlgNttXV+V25HRM8dhMHCU4ux/dlyicaph40k3VbhhT/Z0mKmE9aw1GdLVbwq
         o0Ipc05wNx3M2Wbemib3O2ySDp8HQ0SpDHEHXe0RWLpfUD+k4uE5+HEZHkNrOocWSniY
         e2cXQp8vJZnsp8p3yZOwK3+N79Se/dx07Vu6kb/jkhS5nluR+VWmBIqCFkXhS1xLEqQN
         gHMArnAmImAsoIS/N7iBYKNnydQFyf5dfVTR4mMFIy/G7EUki14eIpQkV+X0x/Nn/QMY
         WVLg==
X-Gm-Message-State: APuU4Z83/Yyppl3jlkG5jXlnc5PR7rTWQPpgN1P4mmn1BIVs4d19LnHw
	KaGVX63Pf0L0Ag/bbBGhEAC1b0Sck8wUPE+LtvaKS+QGA9ghdBEKV25GLhMxp7v6z7Gs8Q==
X-Gm-Gg: AYBFou1vItm8g8btiiG9wX3TIksU3MB1wOrhNS0FJvLMabE8gxOEqcKoAs9e/PV1tdd
	SxSU5G52RZNPG27kzirK0yAzD5Xim1pLXgU/aJeskwehbMv41UEQZUh37WiWa7H1M8tlnBvSmq1
	yobsnPxidTEWX7tKyXoG5BJ4CbnFVfa91s9M0Dv33soux06/fUswZbaP1bCkYI5RtmIXxrFiZEl
	Ev18OtGyHyps/LgK2GgQNuVtVVzu+F33B9Y/4hr5+XJcweCJsJo5NZWuyHzTqcO9W/8d4C97bIi
	pjDkFqvSVxGjt6hKeRCmE33b8pugOQZe5NdmOPTNquUsSOalSTAgz51q7juEAj9mMe4TzUnnkt1
	RxNi74UCZA4gODECthct8VnPj99/pLEwFK9AcRbHPoaz/OHNTl+2xK+T9RaG+z8djC8JyPU3zun
	LcZ2WhLANOG0UYY+HNt9oHQ7z90IUo8lezC0D0hI4IJHEqPG28Q/+h5dfrj4Bw6mLhyjjTMsLJO
	2bMu7l8Dw2e+qIgVlS1rwP2lujU1ghk/1OB6zuHseGdrb0LCD2zopACdCqwjgO+H5WYXCjVDkJR
	pqRQyMCDkRYNQPhqIKA3SpfoLCfMsYDclqafGmAu2vBBEo419FaXzEg7BETBV8ul++DZ7zzJ6s9
	kRxQwgGNU0COHb1bihOlTrv/ZZYoEghxw2enOHjL9NkY0Q3GdTucQyY9sDx0xb2Z2+f4l08Ydef
	1DJfV/907fKeT20G+FoXnRVszDWo6lvSnecksnjjY+Y9iuK2IPGztnkad0rvLO5bcv+DfpeOa1Q
	y+JW2HsgD1U+Xh8rWXPJ9wdEMxJz298Y2XJztNmsTst1sskg3WZfKguJ3ybGKisjqCGR3psSR8O
	1o1y
X-Received: by 2002:a05:7301:715:b0:36d:2b02:86a6 with SMTP id 5a478bee46e88-37682f9422amr1481475eec.4.1794363039194;
        Tue, 10 Nov 2026 18:10:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm9475312c88.15.2026.11.10.18.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:10:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mongodb: Backport fix for SERVER-49099
Date: Tue, 10 Nov 2026 18:10:35 -0800
Message-ID: <20261111021036.3866389-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 02:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132109
Content-Type: text/plain; charset="utf-8"

The Node and Head swap() friends and the copy-and-swap assignment
operators in Biggie store.h are unused and refer to members that do
not exist. Backport the upstream removal.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
AI-Generated: Uses Claude Code
---
 ...ove-the-Node-swap-function-in-Biggie.patch | 58 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
new file mode 100644
index 0000000000..b2d1d92f30
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
@@ -0,0 +1,58 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yuhong Zhang <danielzhangyh@gmail.com>
+Date: Thu, 9 Jul 2020 15:43:33 +0000
+Subject: [PATCH] SERVER-49099 Remove the Node::swap() function in Biggie
+
+The Node and Head swap() friends and the copy-and-swap assignment
+operators built on them are unused and do not compile: Node::swap()
+does not exist and Node has no trieKey, depth, data or children
+members (they are _-prefixed). This went unnoticed because they are
+in a class template that never instantiates them.
+
+Upstream-Status: Backport [https://github.com/mongodb/mongo/commit/77ffbcb4f5673b154fe64872cba9f34ce97bc55d]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mongo/db/storage/biggie/store.h | 21 ---------------------
+ 1 file changed, 21 deletions(-)
+
+diff --git a/src/mongo/db/storage/biggie/store.h b/src/mongo/db/storage/biggie/store.h
+index a09b5b4..aeaa337 100644
+--- a/src/mongo/db/storage/biggie/store.h
++++ b/src/mongo/db/storage/biggie/store.h
+@@ -809,18 +809,6 @@ private:
+
+         virtual ~Node() = default;
+
+-        friend void swap(Node& first, Node& second) {
+-            std::swap(first.trieKey, second.trieKey);
+-            std::swap(first.depth, second.depth);
+-            std::swap(first.data, second.data);
+-            std::swap(first.children, second.children);
+-        }
+-
+-        Node& operator=(const Node other) {
+-            swap(*this, other);
+-            return *this;
+-        }
+-
+         bool isLeaf() const {
+             for (auto child : _children) {
+                 if (child != nullptr)
+@@ -855,17 +843,8 @@ private:
+                 _nextVersion->_hasPreviousVersion = false;
+         }
+
+-        friend void swap(Head& first, Head& second) {
+-            Node::swap(first, second);
+-        }
+-
+         Head(Head&& other) : Node(std::move(other)) {}
+
+-        Head& operator=(const Head other) {
+-            swap(*this, other);
+-            return *this;
+-        }
+-
+         bool hasPreviousVersion() const {
+             return _hasPreviousVersion;
+         }
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index e1016681e4..22169ddd64 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch \
            file://0003-boost-Fix-build-with-clang-23.patch \
            file://0004-ssl-Fix-build-with-OpenSSL-4.patch \
+           file://0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
