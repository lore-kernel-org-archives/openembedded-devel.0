Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC6E6C132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 01:16:43 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id m71so2035911pjb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 17:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bEW2vNig96tl5DFJwR++zmgDq8OCXJbwBeWbTxT7AXU=;
	b=uqyRJYFBc33eye+5VL+kZroQCN3ZsiqqjHTKeb2QHYm+b9lVekVHUdYoVi7xnDgp7C
	8AS6xiFNAp0Zdd+Wm4mnnk2LZS4Y/zTeYnxQBYddsWf3HftrmzHr1Jbx/mRHj+jwu1rO
	MulCqhCamEn23nLS69T31B9lD0AreeRc+7mLw5UNdn49kIeHzrtDARA6G2djMKEFbEDO
	j7MAcbztxHRa45Aw9BREKqWiTAi57GXMUzIHWUIuLFor3R4fQvfMbiDgG0Xvsc5VVdyZ
	499Pzi2slVSJrauwFQcFmT8kg6rgOA+3Orif5dqb8uQmoFmYRDVknYTMxV1qetuuDwrd
	/Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bEW2vNig96tl5DFJwR++zmgDq8OCXJbwBeWbTxT7AXU=;
	b=Uv5DjWcuq1hn6d6XdhbnQ7FxuX53+DzrOjlWyXx8KQGOu/ZdhInG1ERTXwnEaR/DLg
	g6+jQaI3bKTL6wuGFjFuHFU53/tEj3k9LURTi2twW4BGx1hNTiaaaGmmRltQdNzWcj+W
	0CyOKH8bHprxpfHRZ+Ysq5txJqd0CvD/apU7vTZdSc/U/d63voO/rEOyNaCUWqStKpXX
	PMKu8Qu+fdAc/RXLRSxuFHInWfsJN9+zak4gVgJyW4GhYQ0zjcaTk86uxiPzdiPhaF0Q
	U6HRsvyN9TzuDJeO320S/fa9gDq+1aK716LgAXO63H7pFo95IavM+MSa/1Jjn3DTT4pj
	ZrVQ==
X-Gm-Message-State: APjAAAW2PeIVp/DCr4Xb/sDdf6Tcv5Fertrqb2nVrgFOB0WUM0v3QfHJ
	j7LS8FuGzeZ0jKkxeG6kaqHJRi0kehg=
X-Google-Smtp-Source: APXvYqy2LFn+JFfTLRw5Er7SRl5S2dormlc9xrSzzlnY4NzTmiG43lg7Am39Ahsz5MgLK+ysprty0A==
X-Received: by 2002:a17:902:b693:: with SMTP id
	c19mr32113666pls.89.1574126203903; 
	Mon, 18 Nov 2019 17:16:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id y8sm22021106pfl.8.2019.11.18.17.16.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 17:16:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2019 17:16:29 -0800
Message-Id: <20191119011629.3835732-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119011629.3835732-1-raj.khem@gmail.com>
References: <20191119011629.3835732-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] upm: Link with libatomic on clang/x86
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
X-List-Received-Date: Tue, 19 Nov 2019 01:16:43 -0000
Content-Transfer-Encoding: 8bit

This is needed for atomic<double> which clang does not use intrinsic
function for on 32bit x86

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../upm/0001-nmea_gps-Link-with-latomic.patch | 27 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch b/meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch
new file mode 100644
index 0000000000..c16b8dbc5a
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch
@@ -0,0 +1,27 @@
+From 996d37fc0b7177ee57788399b9140032d5de2765 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Nov 2019 15:50:02 -0800
+Subject: [PATCH] nmea_gps: Link with latomic
+
+clang/x86 ends up with missing symbols for atomics due to atomic<double>
+with libstdc++, it works ok with libc++
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nmea_gps/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/nmea_gps/CMakeLists.txt b/src/nmea_gps/CMakeLists.txt
+index b3fb6591..5280bfed 100644
+--- a/src/nmea_gps/CMakeLists.txt
++++ b/src/nmea_gps/CMakeLists.txt
+@@ -6,4 +6,4 @@ upm_mixed_module_init (NAME nmea_gps
+     CPP_SRC nmea_gps.cxx
+     FTI_SRC nmea_gps_fti.c
+     CPP_WRAPS_C
+-    REQUIRES mraa utilities-c ${CMAKE_THREAD_LIBS_INIT})
++    REQUIRES mraa utilities-c atomic ${CMAKE_THREAD_LIBS_INIT})
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index fb22e83359..dbe97370d5 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -15,6 +15,8 @@ SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
            file://0001-Use-stdint-types.patch \
            "
 
+SRC_URI_append_toolchain-clang_x86 = " file://0001-nmea_gps-Link-with-latomic.patch "
+
 S = "${WORKDIR}/git"
 
 # Depends on mraa which only supports x86 and ARM for now
-- 
2.24.0


