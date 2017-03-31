Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id B55D977EA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:42 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id g2so75167806pge.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3rrpETB2hawPtBIKTaZnQM4nAYe9t77Icz7NAS5e8aw=;
	b=kGzGmrlUUk6Nhbfhpy/TDYsl+JMhpflmwOhDC+3lNz913b3a0K7h5udPPnxFtw5MUf
	jGqB0YddMyZCQV0njcl6SB9GNvXK/4ugQmCebv92+gvfGiU+N+AuTwerAgC2IidoDaSO
	FrEreXmP50GCMDoi7nINTUVPbOEhD0zGyIbbxQoX3RL5l4ARcHU+iGN/ZDW1R/t/irjm
	yqIyZzkBNbVshC4FNH37WN7MzwcgYBHfQTyZVE+hb0EFZYUGGPH2HyN0vgzNoJE6oG58
	9noxLxxqhxM+YSuyEYBXGnDgs4APEDR7cPCx5ph/IQQUcu8nzfb89nvFWZu3XjMORfcm
	3kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3rrpETB2hawPtBIKTaZnQM4nAYe9t77Icz7NAS5e8aw=;
	b=DSMSKNzpTvPsnH0HW1DXjxqRnR6gbLKPcqcYpte/be/99O3/6xQy8Efq8ecckL1BC2
	kaI3D34oiVvrOu1bxdzOh/BjyDtOBKPnTFe472oXZWdzgszV4eXKlQ5r+hiIx7GhmUDa
	wRzzNVe5C3PLPVRT1ykRymL0WI2gcUAn/AYNfKm7Kvlu/lh8KytUFoZU4cz3AC5/rSZV
	JuUPya0DgRR1/rV19gZZK3CdUzF8n5hT1RFAuWQdOdz/bCjSJlNn5lGWozsu+/3x3oQ/
	6rHy3PyjyRzn5MAZZCbwwY4eiosXhra+pE7tYYaThn7/gxXqWI6xmEQ3b4aymTP7jpgx
	MOaw==
X-Gm-Message-State: AFeK/H0kfhyPm6JJ9+UoXhb3P/Fz4WyYMKHvvEfoamp4bmkeF3lFHONabeU4n+GYppqImw==
X-Received: by 10.98.67.157 with SMTP id l29mr3853484pfi.251.1490978623809;
	Fri, 31 Mar 2017 09:43:43 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:37 -0700
Message-Id: <20170331164247.5052-33-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 33/43] utouch: Fix build on musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sys-stat.h-for-fixing-build-issue-on-musl.patch | 29 ++++++++++++++++++++++
 meta-oe/recipes-support/utouch/utouch-frame_git.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/utouch/files/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch

diff --git a/meta-oe/recipes-support/utouch/files/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch b/meta-oe/recipes-support/utouch/files/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch
new file mode 100644
index 000000000..f3c8eeb41
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/files/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch
@@ -0,0 +1,29 @@
+From 08b17ec505e09e8f5a4d73ffc3aa61561ec2e0da Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 30 Mar 2017 00:27:54 -0700
+Subject: [PATCH] include sys/stat.h for fixing build issue on musl
+
+error: field has incomplete
+      type 'struct stat'
+        struct stat fs;
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/utouch-frame-test-mtdev.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/utouch-frame-test-mtdev.c b/tools/utouch-frame-test-mtdev.c
+index 5253320..2032af4 100644
+--- a/tools/utouch-frame-test-mtdev.c
++++ b/tools/utouch-frame-test-mtdev.c
+@@ -30,6 +30,7 @@
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <sys/stat.h>
+ #include "common-defs.h"
+ 
+ struct frame_test {
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
index 6ec566ddb..39d46af8e 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -10,7 +10,9 @@ DEPENDS += "mtdev utouch-evemu"
 inherit autotools pkgconfig
 
 SRC_URI = "git://bitmath.org/git/frame.git;protocol=http \
-           file://remove-man-page-creation.patch"
+           file://remove-man-page-creation.patch \
+           file://0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch \
+           "
 SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
 
 PV = "1.1.2+git${SRCPV}"
-- 
2.12.1


