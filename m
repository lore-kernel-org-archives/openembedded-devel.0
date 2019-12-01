Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD00B6BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:46:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id h14so7142076pfe.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DKzpBKto+y5qke9BVQ46RJGj5KykD/d49l7RpIbPLzw=;
	b=OZEr+DKEv0x7HuNdNhKMxE3faGTYKLTNk3CvPov9ZcVgJZlQc33uAyxfb8ftjSCtm1
	ag1e8EwC9L8L9uKMOpJnH/H+Q7j8MQ7BSEIU4fkOKfDT29VqYW1O8fIMF1cHF0CRa/kg
	4nFZ6F52Z5SXqlQEoz5ulM99LbEf0Rqa08xb3UAlO0QZDO+fTQioCn7T/XL0r8XnXtvG
	HWHVtuRWkj0JkqQZIo0yQ+TKy3WGH+ZegjiUs7OMNb3gr9uY3Ob4+wtWGaXkQsJDOC2B
	og3U357Ft/TplBOsQniJKVgcjW8xn/wNuFTLiNwbIbUGJ15VpOak8rDFAbAspPyn0Jvq
	gZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DKzpBKto+y5qke9BVQ46RJGj5KykD/d49l7RpIbPLzw=;
	b=a3nLwH2KcHmY1DiM2KO6zQ6kLffqo7iWQq0BFKLPiAJ3FAz4EqT91gKoP6exwShA0C
	b+O0yJFFYhimFR9Y4CletH4hvNXBnX2xVoUw53BUkUEwQvHocKv3xvL5EHjDBkmvlZLx
	TciUOCh7f1p/QmysuYIZPg9xExbxh4PHHtrO7BDOUDy6QIhe+Ro9oSieiNcxnX/Llums
	wn8cxk3hdIJUjMuLZ26T7MCW4wUI3bbhNCwOddannKpY/iRsJURv8lVqGfhiY4d/VXoc
	O+EY32TuaQj5DC3imztJyVRVkjLU2mRmPu2Yv8CyncNNWr7z0ysl8NfA27JRDru2rUFJ
	T8yQ==
X-Gm-Message-State: APjAAAXB89tTQzSlzZ6v9q32W9XQ0mIXD7W5w2GqyS4q0GD0TwwVVqXv
	S3u0Polt1UnQAqqEh7JhNcQehBSEUfg=
X-Google-Smtp-Source: APXvYqyooEak7yXVnelFwvlAv2ixh7rANBS8nYBR/Rx0+F0guodn3SorBu2BDs7Kg3gz3D1uViBk4g==
X-Received: by 2002:a63:a511:: with SMTP id n17mr27337132pgf.338.1575225996403;
	Sun, 01 Dec 2019 10:46:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	y24sm33916800pfr.116.2019.12.01.10.46.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:46:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 10:46:16 -0800
Message-Id: <20191201184622.889513-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201184622.889513-1-raj.khem@gmail.com>
References: <20191201184622.889513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/9] evtest: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Sun, 01 Dec 2019 18:46:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 41 +++++++++++++++++++
 meta-oe/recipes-test/evtest/evtest_1.34.bb    |  6 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 0000000000..706322d565
--- /dev/null
+++ b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,41 @@
+From fa57c78c33d26084f85f1a6b4c29378631dc9395 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 11:58:58 -0800
+Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/libevdev/evtest/merge_requests/6]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ evtest.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/evtest.c b/evtest.c
+index 548c203..93063cd 100644
+--- a/evtest.c
++++ b/evtest.c
+@@ -61,6 +61,11 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #define BITS_PER_LONG (sizeof(long) * 8)
+ #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
+ #define OFF(x)  ((x)%BITS_PER_LONG)
+@@ -1140,7 +1145,7 @@ static int print_events(int fd)
+ 			type = ev[i].type;
+ 			code = ev[i].code;
+ 
+-			printf("Event: time %ld.%06ld, ", ev[i].time.tv_sec, ev[i].time.tv_usec);
++			printf("Event: time %ld.%06ld, ", ev[i].input_event_sec, ev[i].input_event_sec);
+ 
+ 			if (type == EV_SYN) {
+ 				if (code == SYN_MT_REPORT)
diff --git a/meta-oe/recipes-test/evtest/evtest_1.34.bb b/meta-oe/recipes-test/evtest/evtest_1.34.bb
index 3b6dc61408..a3a23c8951 100644
--- a/meta-oe/recipes-test/evtest/evtest_1.34.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.34.bb
@@ -8,8 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libxml2"
 
 SRCREV = "16e5104127a620686bdddc4a9ad62881134d6c69"
-SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git \
-           file://add_missing_limits_h_include.patch"
+SRC_URI = "git://gitlab.freedesktop.org/libevdev/evtest.git;protocol=https \
+           file://add_missing_limits_h_include.patch \
+           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.24.0


