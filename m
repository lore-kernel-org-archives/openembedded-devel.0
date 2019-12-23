Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 567227FBCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 22:58:58 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id i23so4430221pfo.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 14:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/PdSnbn5SBwgHrH6zPmhuM2wGXL0E6gmQ9dCgcGHAz8=;
	b=bVpL8TbvvVo6AQidaiUvPm6xJbDc5vwOs2K+Cfk0GuPDp7HsZ5iFNAt/RM7alf3FBh
	K/ZBasGSWui10wvBwk9B8YqIH9CuvSffZ5TUSCSkPK8FiNhrDv1dwx9a1TqGWBXW61Jt
	TPRG2OqZpQt+bXzm3eKQUcsXj+QjcmusG6d2Ei3LMsFcMPNC/vE7ly8JzBLVGeEmK4BJ
	6lNYBkT2Cxgz5QaxIjpgm/ncFDHqVih8IFEeQNjxun91rVphXccN9ffqg04M7bCctjWq
	fCDSPFeO2gEsItEWZ5or9B6kXme5YRfdggzIMQnTX3snb/5iFi/ltyyeOBzjTM1r0oSF
	sm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/PdSnbn5SBwgHrH6zPmhuM2wGXL0E6gmQ9dCgcGHAz8=;
	b=X6e/j9RmgFBmwqHhJhatuiLtdiZBxKYgjwUGHzAVOR/IuoXu8SQOw2Hx1xoF4PfdcR
	g2AovqiyRgtdL/v09rNO8VEUFEqKlU5NjnBmNHQRKXBxkINgkmAcf5pfwfSo4APPWJod
	nnjyMbFQeIHOiBHRtBXo3Czs6zw4XABp0KJcwiSAI0FIiabWxSDFwk60vJGssRiO4mo8
	GYFnB//FyJTdmWWUATNyC6jjuXjIHV9BY/xaMz+ZuIIWR60Dxa0oH5+jiT1OCDOuAqr3
	6D4PeE9NTnBpJ7SiphAgewLgwZTNln/XoGnNbXL0wc3F9otk0mM9q1SxW0KXLwFFdOJV
	rXFg==
X-Gm-Message-State: APjAAAUlmT3vC2Md0a6g8ALx5ahk9vX1jk3ZiKQBJtFNuvHdgQBnUcEG
	G/eEO+E++V/t6az+Un8ABFkEV/YfZcQ=
X-Google-Smtp-Source: APXvYqzMczn7dmbwVkIXgtSx5niB21a1e+8EQIb4hvQj4UsbGlhVpDFTO8gISe+YZbSHkjStSnEa9w==
X-Received: by 2002:a63:554c:: with SMTP id f12mr34658635pgm.23.1577141939077; 
	Mon, 23 Dec 2019 14:58:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id c2sm526448pjq.27.2019.12.23.14.58.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 14:58:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Dec 2019 14:58:46 -0800
Message-Id: <20191223225846.2277629-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191223225846.2277629-1-raj.khem@gmail.com>
References: <20191223225846.2277629-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/4] cannelloni: Include stdexcept for runtime_error
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
X-List-Received-Date: Mon, 23 Dec 2019 22:58:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes
error: 'runtime_error' is not a member of 'std'
             throw std::runtime_error("Allocation error.");
                        ^~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-missing-stdexcept-for-runtime_error.patch | 32 +++++++++++++++++++
 .../cannelloni/cannelloni_git.bb              |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni/0002-include-missing-stdexcept-for-runtime_error.patch

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0002-include-missing-stdexcept-for-runtime_error.patch b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0002-include-missing-stdexcept-for-runtime_error.patch
new file mode 100644
index 0000000000..55f28dd672
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0002-include-missing-stdexcept-for-runtime_error.patch
@@ -0,0 +1,32 @@
+From 1788762863cd1f657697575f6e73a22e661ccb43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Dec 2019 10:32:54 -0800
+Subject: [PATCH 2/2] include missing <stdexcept> for runtime_error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes
+error: ‘runtime_error’ is not a member of ‘std’
+
+Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/22]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ parser.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/parser.cpp b/parser.cpp
+index 4afb9e0..5bcdbde 100644
+--- a/parser.cpp
++++ b/parser.cpp
+@@ -2,6 +2,7 @@
+ 
+ #include <arpa/inet.h>
+ #include <string.h>
++#include <stdexcept>
+ 
+ void parseFrames(uint16_t len, const uint8_t* buffer, std::function<canfd_frame*()> frameAllocator,
+         std::function<void(canfd_frame*, bool)> frameReceiver)
+-- 
+2.24.1
+
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
index cd893afb37..d4a62bd92d 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 
 SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https \
            file://0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch \
+           file://0002-include-missing-stdexcept-for-runtime_error.patch \
           "
 SRCREV = "82aa49b417b96fe46bb3f017ae1bfea928f20f9a"
 
-- 
2.24.1


