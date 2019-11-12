Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6FEF87F68F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 20:57:55 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a18so26245plm.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 12:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=K5ZLG8uiDsa6d8fvAN9Mu4Bp8NJKQBRaCBBPPpFxfPM=;
	b=UrMy4N9DhfhJdu4X3/9zSX8bJQBm6YP+iHkWZSAFnLt5iUh9JaAwc8lxjLjXGYLNIH
	ywDasKRC9iGzZKRyCGUXjwpXqjr/xCAMM2fbjoJQkKTWxJvLs5uX8KregZamlsN5m146
	YAe36DNwuy0FL3YOuio8bSf0lc7r6+mjGIMH2QrUEAUNOscMDG+IfA5o6GBabDwCBfcf
	MTInWZB4LhxU5rU4Lvbh3TkBktCq+ERkcO4ET9Wd9h7/n8aoxv/YuYzW+YlEP38L+MDZ
	PLCRN0TUv2aoKMCowUmfxS3HS/qyKqRiml5t66MfDmpPzi4b1l9pO3HqtEfBXyGh1ncQ
	DY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K5ZLG8uiDsa6d8fvAN9Mu4Bp8NJKQBRaCBBPPpFxfPM=;
	b=LBUpZJTHDrsZqCljbZyHryRVrCmD8Dd4By7oULrTUEfTp0Jr3qrvAcTxOcj55DNCgi
	GLFa+UBnJhNxmYVtd6qR55y2T8cDblLJ2apUu3vtCd9F4x7uMVwL95Cm1cF5BT8uvcoc
	h1EbBYPEIwFi3/ouVYaLsO1zdcY6U8qxJChq49fng+A5ZXR3JbQSutkPYGqKD3DVQIMe
	zsUDO5JrGajEU3ceFT3mGYaJJepKsqbUOlAilG8naf0nkuq7bQRFAZr2qZV07Yo86xrD
	s8lBsYcXudzPsETngUOUEZsbDY712HTkGslxC4EZagwEd+AhgZ1ahOVYs+aXZozAUrXm
	GtrQ==
X-Gm-Message-State: APjAAAXTtKh27+u1Ch/Z2SuTcVmU9eH8WtawnwY8eBuFaK3+lljxkhGE
	KxN4MkjR5Vm3LQaM2Tp50iFrkJ9SbS4=
X-Google-Smtp-Source: APXvYqyxvSZ+/2jbHdVOZNAUV2zHVMHG62QjdhqRZyYGhFd4uMdq0/E7stxDFrtcXKU7bRIihefvcg==
X-Received: by 2002:a17:902:b614:: with SMTP id
	b20mr14832861pls.305.1573592276058; 
	Tue, 12 Nov 2019 12:57:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	c9sm12471676pfn.65.2019.11.12.12.57.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 12:57:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2019 12:57:38 -0800
Message-Id: <20191112205738.725884-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112205738.725884-1-raj.khem@gmail.com>
References: <20191112205738.725884-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/3] python-systemd: Include endian.h for htobe16
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
X-List-Received-Date: Tue, 12 Nov 2019 20:57:55 -0000
Content-Transfer-Encoding: 8bit

Fixes
| systemd/util.c:112:39: error: implicit declaration of function 'htobe16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
|                 addr->in6.sin6_port = htobe16(port);
|                                       ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-systemd.inc     |  2 ++
 .../python/python-systemd/endian.patch             | 14 ++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-systemd/endian.patch

diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
index 5be5de092a..f01165cf89 100644
--- a/meta-python/recipes-devtools/python/python-systemd.inc
+++ b/meta-python/recipes-devtools/python/python-systemd.inc
@@ -15,4 +15,6 @@ SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895
 # allow for common patches for python- and python3-systemd
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
 
+SRC_URI += "file://endian.patch"
+
 SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
diff --git a/meta-python/recipes-devtools/python/python-systemd/endian.patch b/meta-python/recipes-devtools/python/python-systemd/endian.patch
new file mode 100644
index 0000000000..e09aea7336
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-systemd/endian.patch
@@ -0,0 +1,14 @@
+Include endian.h for missing definitions of htobe16
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/systemd/util.c
++++ b/systemd/util.c
+@@ -28,6 +28,7 @@
+ #include <stdbool.h>
+ #include <assert.h>
+ #include <errno.h>
++#include <endian.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <net/if.h>
-- 
2.24.0


