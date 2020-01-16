Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id DAD587F893
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 04:42:22 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id p27so7783394pli.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 20:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=big7pBJkAeza7+9QlI6BbdEp2Uk6Tt8/bnCxGa+1QTM=;
	b=Qos8+gCGZEVQ/cSQrHsP0+4w6HlMYHNm1bWemTqKhBMFr5UYUaOZo+mzQzwCJTeLSx
	YSbhjHhl0TrTzDBFpzY1jhossP4GPlK5FBH2mjNd/9tqkcm0UWLPr3LZiMiEqX8bG0s2
	J+0rrDiA8DtWRg+28lfFtJDH3Lt9vCDrWpB3GPuzyodwsDwN4KkEj7UBDKybeivcg/Sn
	O9CxayvLSErDMByTG3sEruU70IRlhPyfEHIePDIMW5qUOZy9Uyg9CSpc5ILQwkGEwXA6
	bZ81NxSMr4ngjxex1LBeEJurzQPpKMD5R0C8d4QKdj364tbKNgSb/YFbgnm1RlXPUdmX
	+Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=big7pBJkAeza7+9QlI6BbdEp2Uk6Tt8/bnCxGa+1QTM=;
	b=nsGvgFvDTdPe28Ax1pRuBdFXqRlCjWEucD+0rQbvhecnkuxGYV8aiZu9inG2r5EVbR
	ued/s/XbsHFj7dRI8nX6VpvvoHMYnlJ+JebVOynDiTfE8514gRegUt6cHzoqtP04xz5a
	nH3X/nmCziFz8Zgz7FzmCC5A/9LN9gx748fDQJjc588Z97rOihDbBxJHOfQyNUI+4tzi
	DHPGS7ypzEKsM2vobfPfW94Ic4MxwkDrvoLG14bQ5B8GUtcZ4XkRHTEhDqF+pt+wSEQ8
	kCS2nQYhy6tsAtZla2zLgboNRYcgLxOYTNI4X5Lr8D2PjubRFNbFfrR/JefLb7V3ObOt
	aywQ==
X-Gm-Message-State: APjAAAXMjbmg18OPHdl0jxl6fUsEXMbSkRHuxiCMZJMYOcd4DQZ2I83q
	UO0LXIig1wEUVQ5n2NpIwPBbPOk+F1w=
X-Google-Smtp-Source: APXvYqxpGfq6oPCOdogCS2UXf5+GTvhiZRdYCeE2bS32tBRova/OU8g8IO3poxN+/2eT5QxC9jtdSg==
X-Received: by 2002:a17:902:a706:: with SMTP id
	w6mr30361464plq.79.1579149743400; 
	Wed, 15 Jan 2020 20:42:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l14sm1425742pjq.5.2020.01.15.20.42.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 20:42:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2020 20:42:18 -0800
Message-Id: <20200116044220.3667460-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200116044220.3667460-1-raj.khem@gmail.com>
References: <20200116044220.3667460-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] iozone3: Do not define prototype for pread64()
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
X-List-Received-Date: Thu, 16 Jan 2020 04:42:22 -0000
Content-Transfer-Encoding: 8bit

Use the one from system headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-let-system-headers-provide-pread64.patch | 34 +++++++++++++++++++
 .../recipes-benchmark/iozone3/iozone3_488.bb  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch b/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch
new file mode 100644
index 0000000000..a61a56a71d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch
@@ -0,0 +1,34 @@
+From 64389a67b93a53b9fb7e9e20e905a5ee4613606b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Jan 2020 17:10:42 -0800
+Subject: [PATCH] let system headers provide pread64()
+
+The signature does not match with system headers anyway
+
+Fixes
+
+iozone.c:1270:9: error: redeclaration of 'pread64' must have the 'overloadable' attribute                                                                       ssize_t pread64();                                                                      ^                                                                       /mnt/b/yoe/build/tmp/work/core2-64-yoe-linux/iozone3/488-r0/recipe-sysroot/usr/include/bits/unistd.h:83:1: note: previous overload of function is here          pread64 (int __fd, void *const __clang_pass_object_size0 __buf,                 ^
+1 error generated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ iozone.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/iozone.c b/iozone.c
+index 090dd5f..fdea400 100644
+--- a/iozone.c
++++ b/iozone.c
+@@ -1267,7 +1267,6 @@ int pit_gettimeofday();
+ #ifdef HAVE_ANSIC_C
+ #if defined (HAVE_PREAD) && defined(_LARGEFILE64_SOURCE)
+ ssize_t pwrite64(); 
+-ssize_t pread64(); 
+ #endif
+ #if !defined(linux)
+ char *getenv();
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
index 5885b145e9..4d9e07765f 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dca
 "
 SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
+    file://0001-let-system-headers-provide-pread64.patch \
     file://copyright.txt \
 "
 SRC_URI[md5sum] = "d60a69e44cda8436f4f94d860958efc2"
-- 
2.25.0


