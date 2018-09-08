Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB93771C9B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 07:11:38 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id b12-v6so7528932plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HAJuzSyM7BARGFgSLFGg5k/u7+Aj7bhqlnYgYcm9VNA=;
	b=pPYfsZ0uwUMDcz1CZ1NEYG6HPTaX3j0/o0G9idfPhprnQbih6YQBvWc6ACY+akD/qz
	PYgK7/KaSH5gzPECLZAYHQL+1cmafB7ZPiTyrJrIt3F7z/mfax1x4YeZqZdGogQGwd/0
	wScnGbXxlO/RtgPXYklXpiDcMLlw0NZxMD+O4rx6joWYwi9qDyAPjJx2YFtKQe24Mzqm
	2+N+06mDQ05oYZ5jyKhXdOmvHOgmM8XXgXV1s85ESihUayie8bNdoJ4UCAy6PUWShl3I
	1HskB0R0v42An0RRzEoWMql06h2774gCZ+kJdigJzHFhtfKWbT5nAHqEdVTwOyzQ/Oo4
	JXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HAJuzSyM7BARGFgSLFGg5k/u7+Aj7bhqlnYgYcm9VNA=;
	b=ImEKFKq4bUI9r2+VM/9MAvattnwdWK5GGHvR30rzcl/m8R4ewKWf4qBx1ytN2ViUyJ
	XU/FxPjzCxre/H0+Wdrc+uiZn5ecBGYuY+iffgboZgcQmdu8O86Qz9wTJsNXSX2m7qfy
	mh/iaApc3o4GRvd+kwlH2OqkUqe98VI8b9hC9cksOF8+DKT2Pk9KjCQuPNJsTIHFoxU9
	QeicMbP+3QlTHu5Cp7gG7Y9DqWb7lAu1pAZIvXB+gRv/v8Q6ATyQWavAUUxNqbRpQYnk
	9FnVnmjMzdKsYN5Z/gQR2Qlis4TfuUrFFViKCMQTuHTGaCbxO3iwaOmMioEs7S+jpb4g
	VRaw==
X-Gm-Message-State: APzg51AXtCIxB84yJryo95BFjCFgrYF/LfZQVbl5h6qjJMLxAWzXpI1i
	M7XyTdcaEgQ//lJk5WhsCPcEHzVL
X-Google-Smtp-Source: ANB0VdbB2YXyTKV9+bX9Twt7Ll+LaY3WurviCG7rJ0dbQmIPeL1k2o6P50Nnke7T18AhEHBUb6hfDQ==
X-Received: by 2002:a17:902:bf46:: with SMTP id
	u6-v6mr11617121pls.85.1536390699455; 
	Sat, 08 Sep 2018 00:11:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm18702212pfe.32.2018.09.08.00.11.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Sep 2018 00:11:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Sep 2018 00:11:25 -0700
Message-Id: <20180908071125.28282-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180908071125.28282-1-raj.khem@gmail.com>
References: <20180908071125.28282-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/5] kea: Fix build with boost 1.68+
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
X-List-Received-Date: Sat, 08 Sep 2018 07:11:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-of-overloaded-distance-is-ambiguous.patch | 89 +++++++++++++++++++
 .../recipes-connectivity/kea/kea_1.4.0.bb     |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/kea/files/0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch

diff --git a/meta-networking/recipes-connectivity/kea/files/0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch b/meta-networking/recipes-connectivity/kea/files/0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch
new file mode 100644
index 0000000000..fb16ecbf99
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch
@@ -0,0 +1,89 @@
+From 8ea2ee451a1af7c5b5c8f4b36c1f77d44442064d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Sep 2018 13:02:35 -0700
+Subject: [PATCH] Fix error: call of overloaded distance is ambiguous
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The boost::iterators::distance function template is an adapted version
+of std::distance for the Boost iterator traversal in 2.68 it has started
+to fail with argument dependent lookup and compiler is erroring out
+
+with
+
+error: call of overloaded ‘distance'
+
+boost implementation of distance is protected against being found by ADL
+
+The way function is called in libdhcp means it will be found via ADL and
+all namespaces will be considered which is providing problematic since
+its getting it from both std:: and boost:: namespaces
+
+so let it not rely on ADL by qualifying then calls with std:: namespace
+
+Upstream-Status: Submitted [https://github.com/isc-projects/kea/pull/103]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/dhcp/libdhcp++.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/dhcp/libdhcp++.cc b/src/lib/dhcp/libdhcp++.cc
+index 330c02b..ced705d 100644
+--- a/src/lib/dhcp/libdhcp++.cc
++++ b/src/lib/dhcp/libdhcp++.cc
+@@ -419,14 +419,14 @@ size_t LibDHCP::unpackOptions6(const OptionBuffer& buf,
+         // We previously did the lookup only for dhcp6 option space, but with the
+         // addition of S46 options, we now do it for every space.
+         range = idx.equal_range(opt_type);
+-        num_defs = distance(range.first, range.second);
++        num_defs = std::distance(range.first, range.second);
+ 
+         // Standard option definitions do not include the definition for
+         // our option or we're searching for non-standard option. Try to
+         // find the definition among runtime option definitions.
+         if (num_defs == 0) {
+             range = runtime_idx.equal_range(opt_type);
+-            num_defs = distance(range.first, range.second);
++            num_defs = std::distance(range.first, range.second);
+         }
+ 
+         OptionPtr opt;
+@@ -538,14 +538,14 @@ size_t LibDHCP::unpackOptions4(const OptionBuffer& buf,
+         // may be standard options in other spaces (e.g. radius). So we now do
+         // the lookup for every space.
+         range = idx.equal_range(opt_type);
+-        num_defs = distance(range.first, range.second);
++        num_defs = std::distance(range.first, range.second);
+ 
+         // Standard option definitions do not include the definition for
+         // our option or we're searching for non-standard option. Try to
+         // find the definition among runtime option definitions.
+         if (num_defs == 0) {
+             range = runtime_idx.equal_range(opt_type);
+-            num_defs = distance(range.first, range.second);
++            num_defs = std::distance(range.first, range.second);
+         }
+ 
+         // Check if option unpacking must be deferred
+@@ -638,7 +638,7 @@ size_t LibDHCP::unpackVendorOptions6(const uint32_t vendor_id,
+                 idx->equal_range(opt_type);
+             // Get the number of returned option definitions for the
+             // option code.
+-            size_t num_defs = distance(range.first, range.second);
++            size_t num_defs = std::distance(range.first, range.second);
+ 
+             if (num_defs > 1) {
+                 // Multiple options of the same code are not supported
+@@ -746,7 +746,7 @@ size_t LibDHCP::unpackVendorOptions4(const uint32_t vendor_id, const OptionBuffe
+                     idx->equal_range(opt_type);
+                 // Get the number of returned option definitions for
+                 // the option code.
+-                size_t num_defs = distance(range.first, range.second);
++                size_t num_defs = std::distance(range.first, range.second);
+ 
+                 if (num_defs > 1) {
+                     // Multiple options of the same code are not
+-- 
+2.18.0
+
diff --git a/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
index ba01b8c1c9..67de07b31f 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
@@ -10,6 +10,7 @@ DEPENDS += "kea-native"
 SRC_URI = "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
     file://0003-Makefile.am-update-hooksdir-for-lease_cmds.patch \
+    file://0001-Fix-error-call-of-overloaded-distance-is-ambiguous.patch \
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
-- 
2.18.0


