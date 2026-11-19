Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1973.1795113511648830401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cVOh7Lq1;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so920326b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113511; x=1795718311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCSDprkJrjyqJcFMoCtIqd8QcrMhWVGByfZFgLdpyhE=;
        b=cVOh7Lq1sZJqONZ1yokq1C97bT9UrfMmpsOOlytVXBpVCwelNtlN5rvdXYnBVvEofw
         DDsb5tMu79YodMPnPUjVab1+joJUfBoNT50DSaTFRrCFRYkv6VViy2EJ8rvPLHWJB8vL
         H3SBftWvrxR0dUtfKkPHCGOOuhB4vteqbMZHbPYlR53qXUn6q2DCbZuZ1FRAGUCmMoF5
         FuJ0MUNSQ4npa3sFPmoe07vVJ1bqkSCk9fHEI/mAvxAAAkCYwFNFVx3wmZW+/3wxeHxU
         lhUkdF8g8wcrf2xZKK73iqfXcpZcVF/OBDXRyWaaChYLdGP94FNMhmjrnESrOf55Ay15
         gw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113511; x=1795718311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCSDprkJrjyqJcFMoCtIqd8QcrMhWVGByfZFgLdpyhE=;
        b=wKpDkhSx4ZdyVqp0FXcPUcH3LLNbbcwu0c0P75MYNSw66/oJbpifT9PCiP6U1WEbUA
         VRktWQAe1kZPMAMQ7vfwawLhQnwWIGapVMiEe1rAJz5esx13U5NvPLMDQv9J0R4y0fEh
         nPiCXbbbPZuNBPOJlKd9WRY3uLC5uJp5IOhj3QFH5wfIAVtkJ0nghjseDBgPSqDTRR7m
         fw+ZuhVVz8dJQT0XxdHRK0SoxaeULnImcUJtSwLKYyjfn0D1aN4tXvTgCuUrOQ+U3zdW
         NIDR9i9f9edD7t4lU7iXZ3AoAo9nyqm4QKnHngqzSyvmN8LlIBEKGN8EFum2pOVpudUO
         Kbgg==
X-Gm-Message-State: APuU4Z8xWVJNQpWNdX0Q4uWkqCo87wOHtf68+0s3rKF8RQtbTtUct+pR
	slKYVMXjHKUvFEZVmD9cyYyelVjJSWDl5OvXuo63LFzwCCXLyOL+QLaBCjIfbw==
X-Gm-Gg: AYBFou1fNa2zjlBI15fA/zTHue+xFe46zKi9CUohAzsH5LFLHBiq8i+pEuasGYm4V1Q
	DdPVLckCbcsOV8zlwr1deCClZNLFv7WbmNjdjWxRcPQ6e9igSzGOnkYMChnD+YAPCFjD+mk0Qe9
	bnbMuf0T5cEDik/YRMhr1rHxp+NWjjw7emYCcA+VA/B4n0ace+kjASOJgrA3ye4wQOqWm7eFvaM
	nRXrDhmU+uowiBbhk4P7WTY8SU4Bo1UhB3LnO0cBtDyOjYgP+D152ISuS162wk5zlMVNlg0WhQK
	rWzH7UXI+dHVSJkgOM1Kd2XbdDJ/rs1QtdkhhEEP+ezc1rrUe+IqL8TrAqHUn/GAwx3q/7bXAK4
	GpqQvzROaCTwBUILSLCkmRPn8SJoSLd0GOVFx2y9NMxANST6niFYRsdbZWbKOQ8oWfU31ltsy4g
	DubAdfCdJu9SxsSg3OBt3GJ1YEpFfP3g8RXbXEWKQFplVaEiCO2U36iUex2j16PMfrNyjUm/Xos
	8cm71dSeNQu5+yEu/uBkNez7UKOzFsVKJj2Z132sT1H76Q3vMttxvLKDPqke7Ss8gsfXLBbgwCC
	blgpShE91j97elDt7Te5zqAni2pbnqfKMFumpZkY3hv5+Dcl8S85VeoA3N4UHQ==
X-Received: by 2002:a05:6a00:3003:b0:881:e266:c3d8 with SMTP id d2e1a72fcca58-8c7de0a5883mr1279240b3a.35.1795113510898;
        Thu, 19 Nov 2026 10:38:30 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:30 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 60/64] mongodb: Backport fix for SERVER-49099
Date: Fri, 20 Nov 2026 07:33:28 +1300
Message-ID: <616b374b1af0417e4cc72869fc5d7c0c285af788.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132750
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

The Node and Head swap() friends and the copy-and-swap assignment
operators in Biggie store.h are unused and refer to members that do
not exist. Backport the upstream removal.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
AI-Generated: Uses Claude Code
(cherry picked from commit cc2835067bc19f55632483bba26b67aa6174197d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
