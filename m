Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id D8B867FC18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 05:17:01 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d29so8860958plj.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 21:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qVflzA+0Jf0Jvtb2jOzIsnUWsZKutEHLkJeZ/r9fxVw=;
	b=qZOfBnMWqBFXm5fzPEwITehtAOA8hoMS76q3pwjUtU19vxHXzKLRWDEa8X+cVePBEA
	PuwVhusY3qlqHjINkYkVODq3zAfOLaZlgnMZWaYwTzV1GXbd8dXqbvpBJ29O0GylK45A
	1FI/KEIq7PR32y37ZriOQoc3Pfg6wQh9FMVhdAwxps46RqkkXKbSXCAJcf4/ffmwqaA/
	VOGDsdLYX0y+OdACm4VWaKEy/rzxXnq/5Ou6bAnYYHTqkbpRrfcJeg++nQH4bXGn9N9k
	ZTIjjB5iaTdnI84f2jlG812UKPpenyLN1lt3QMqvDmmwyNj/0J4EYR15cp4ZDTRVV9IB
	0Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qVflzA+0Jf0Jvtb2jOzIsnUWsZKutEHLkJeZ/r9fxVw=;
	b=BvuMPkuSdtquFmRbi+bzsKDyqX6Mn5gSPzjPhcvc115vl4sNGpCfF3cxqhIxaEkv5c
	0Rz3t0yHi5UcW5kv5sGWzaUcV6e2Jk4eOdLrOprYC5KJlQLwkO3Ujchx9XFk1S+zetl8
	aHbauA24sLd9LE3tCxGV+6Q07TURZ4mh/nyqBiZ4FueNMqVfRUjZus/VzysdLwHY8O5k
	F643cuUZC+lHG16dKvMo5OYpwDedUJW9NEipioaMCUcMkMBKU/Z2/FpbK6zckSmvVkBM
	F7PRrxL0OBebnkitf1qULE3JkDQAA+fe8iTnpr7Y3cAJ5fEqWkGF60hjkWZdugQuUY9P
	o7/g==
X-Gm-Message-State: APjAAAXRp8XSu/oulJzEzBzBBJpXXT6olbfJRn5mBIzKi0VNhD7exjYN
	E5LJjAc730dJ5oPR2VHXnoTAnq7qFjI=
X-Google-Smtp-Source: APXvYqxRL4osYw4QVAZQcrftFD+zzDiIcXVnHBbKdRXvxeiZWaNGqPRUBO7UNc2os2QXN9oJm2SmGw==
X-Received: by 2002:a17:902:9002:: with SMTP id
	a2mr29869142plp.133.1573535822480; 
	Mon, 11 Nov 2019 21:17:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a99e])
	by smtp.gmail.com with ESMTPSA id
	j14sm15605886pfi.168.2019.11.11.21.17.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 21:17:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Nov 2019 21:16:48 -0800
Message-Id: <20191112051648.472467-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112051648.472467-1-raj.khem@gmail.com>
References: <20191112051648.472467-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pidgin-sipe: Fix build when time_t is 64bit
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
X-List-Received-Date: Tue, 12 Nov 2019 05:17:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-consider-64bit-time_t-when-printing.patch | 31 +++++++++++++++++++
 .../pidgin/pidgin-sipe_1.25.0.bb              |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe/0001-sipe-consider-64bit-time_t-when-printing.patch

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-sipe-consider-64bit-time_t-when-printing.patch b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-sipe-consider-64bit-time_t-when-printing.patch
new file mode 100644
index 0000000000..e7a72953da
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-sipe-consider-64bit-time_t-when-printing.patch
@@ -0,0 +1,31 @@
+From ae6fa551907006c612cca98b87f339d4d6f45e25 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 11 Nov 2019 21:08:11 -0800
+Subject: [PATCH] sipe: consider 64bit time_t when printing
+
+This helps printing 64bit time_t on 32bit architectures
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/core/sipe-utils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/sipe-utils.c b/src/core/sipe-utils.c
+index 12ff8d6..d3d4071 100644
+--- a/src/core/sipe-utils.c
++++ b/src/core/sipe-utils.c
+@@ -414,8 +414,8 @@ sipe_utils_time_to_str(time_t timestamp)
+ 	if (result)
+ 		return(result);
+ 
+-	SIPE_DEBUG_ERROR("sipe_utils_time_to_str: failed to convert %lu to ISO8601 string",
+-			 timestamp);
++	SIPE_DEBUG_ERROR("sipe_utils_time_to_str: failed to convert %lld to ISO8601 string",
++			 (long long int)timestamp);
+ 	return(g_strdup(""));
+ }
+ 
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index 1d739874be..7dc63164e3 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "pidgin gmime intltool-native glib-2.0-native"
 inherit autotools gettext pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
+           file://0001-sipe-consider-64bit-time_t-when-printing.patch \
 "
 
 SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
-- 
2.24.0


