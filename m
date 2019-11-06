Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 164C57F8AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 03:49:22 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id s5so9540571pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 19:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nn9weU2IqF9aqFLeeSpESn9tiwLRSaFjtr+ALvtWU8I=;
	b=jiVj3b8DRNEW+XINhySu6hAOWovnKQnosnxVzmOR2l7dPhDt392NBEh/75/eFCmRvh
	0dE7rGE+TfXBmo9nfAm5ejUZ7rl07z5x/Jrcs0agqfg2zG5VhUseC7RAfoUpuWKxs/Zm
	+hgYD27kPMFkxue7UQrl+FvPiv9F5NaP95jcju+AB4McclTkkRDBRGq/u9IiFPGyNWFD
	q/pcShjQZZ3miz5ciXnQVxlcwMhRFAfZ6gn9rHaumiNMBhYd6mhrgxzWSbgWbQm+OrOq
	xwTpJ6N0tDCqyFgjEdStPKF3hgU+dLFt/MQbyNoQHN30kG4mLf1YqvyVyVAC/LfoDwGA
	lmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nn9weU2IqF9aqFLeeSpESn9tiwLRSaFjtr+ALvtWU8I=;
	b=JXxh/wlW10/rKyrJqoxJ4+3AmAHhanZIRMNNxPdiCAAarN9N5HpMTg0w+9xIWt399a
	qlhjAGuqTePHdXM5vVScQoWSJ1WZFx2SrNegimbi/1h63/vJneXtM3Ubz4gJMW976flL
	SojHIzh5QJGufycyoGyVzGbs/+YBPz+ZktYVDZDb41WuXwtjCwLu0mt+ivSpq09psI7M
	LLFWGOCPcWB8Lj+7mDFgl6lNb+xhnphq901VPgk736TV+F04/gn3E/zGh2S5leGNhjMD
	G4GURbBmkY/qjeJfmlM/AY72LvvsBLrKG5xLMHT5NSHgKOlJoDbb1dAknnFiH6Qc0+2h
	/9BQ==
X-Gm-Message-State: APjAAAUdAMmz/YVrHLDBQhZzOFK9fjD0Djq9a4qRRy7EeLJLnXxdh6Bd
	lF8Ng1xTvWCLSTSlpfActSD3TenX6MI=
X-Google-Smtp-Source: APXvYqx6T3IV3mwCLuESZikNsxWD+cNXnJEtgob+jdkjLTZ+zi3WEpUv8OREz0t5u/6qaDV6dv7aiw==
X-Received: by 2002:a17:90a:ba18:: with SMTP id
	s24mr756229pjr.69.1573012163493; 
	Tue, 05 Nov 2019 19:49:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id 39sm912407pjo.7.2019.11.05.19.49.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 19:49:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Nov 2019 19:49:04 -0800
Message-Id: <20191106034904.2815791-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191106034904.2815791-1-raj.khem@gmail.com>
References: <20191106034904.2815791-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/3] libowfat: Fix parallel build
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
X-List-Received-Date: Wed, 06 Nov 2019 03:49:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ncp/libowfat/parallel_make.patch          | 20 +++++++++++++++++++
 .../recipes-support/ncp/libowfat_0.32.bb      |  4 +++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ncp/libowfat/parallel_make.patch

diff --git a/meta-networking/recipes-support/ncp/libowfat/parallel_make.patch b/meta-networking/recipes-support/ncp/libowfat/parallel_make.patch
new file mode 100644
index 0000000000..ea39c771c3
--- /dev/null
+++ b/meta-networking/recipes-support/ncp/libowfat/parallel_make.patch
@@ -0,0 +1,20 @@
+Depend on haveuint128.h for umult64.c
+
+This fixes parallel build issue e.g.
+mult/umult64.c:9:10: fatal error: 'haveuint128.h' file not found
+#include "haveuint128.h"
+         ^~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Makefile
++++ b/Makefile
+@@ -430,7 +430,7 @@ range_str4inbuf.o: mult/range_str4inbuf.
+ range_strinbuf.o: mult/range_strinbuf.c rangecheck.h
+ umult16.o: mult/umult16.c uint16.h
+ umult32.o: mult/umult32.c uint32.h
+-umult64.o: mult/umult64.c uint64.h
++umult64.o: mult/umult64.c uint64.h haveuint128.h
+ open_append.o: open/open_append.c open.h
+ open_excl.o: open/open_excl.c open.h
+ open_read.o: open/open_read.c open.h
diff --git a/meta-networking/recipes-support/ncp/libowfat_0.32.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
index a5e2c21cf0..b668b0ed5f 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.32.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -6,7 +6,9 @@ HOMEPAGE = "http://www.fefe.de/libowfat"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz"
+SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz \
+           file://parallel_make.patch \
+          "
 SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
 SRC_URI[sha256sum] = "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
 
-- 
2.24.0


