Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 49DE471B48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:21:53 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a188so132593pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YdTt7xUOD9wtwYRg5EB6f11H5SyzrTOt+OELPzKyI0w=;
	b=buZzbSVPJ7TuebW0KYv0RKAE9mlvz24TerzUYzx2b8Tzzf0iAymORxj3cSIm2jUUp8
	MFQQ0u4pL5o6Rx/qXqhIrMYMb19BwfTIa1Z/r9hkgSVMNn/JEaWSOcPIfpmalockAaQx
	m1dvL8azjezGpOCy73czJl9fqtWLe3q3bKbgerzCGnjVOC6h6tH+9qwNNWKXEgVCeHqr
	JHkASt9fAX9pweXb518YFVn/WYckKn0eWetV3VuRFXx5Q2aavkymfni0C+lNVJ9RMMcW
	wgh1fmKWkA3J93eXBHZ38T4KQrIfD8M56j2iqBGu4hlDNKzlreKkG0GDlw83ivt0x1nM
	aOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YdTt7xUOD9wtwYRg5EB6f11H5SyzrTOt+OELPzKyI0w=;
	b=UbmTdKFXAk6h/MjH7L/Jm0sdh7hJ93vxLVfWcBHgP5apNqEg9gZL0qpGBpAggLvnNA
	nTfVVrMymBy0fcjrnG5P4LMXKs1C0mNsEiqdBOnj7OeohHalzFP1+KkXVQOKS+ZlqouO
	4PYRMj5utJRLw/DEeH7tBoJMHRhov2MiVskJpNcnulDczLReCbjNlKGsQ/razs3BVIZ5
	LQ1E9yN6s5KCgdtvjnWGLMAgwx8Oa+T6KQvHNRunm0aRjtXjoacWVUVdHDF/RrAesuQX
	/0uaHCvQsk6BjM++oVqF2YWoFTm3GF8owC3QyrJ2h7084xw7m8TNDXNbu6Ij0+Yb819C
	jv9A==
X-Gm-Message-State: AN3rC/5fH60wcDpDxv+6MgqOfxLnhAk4frkvxUKumE4ee0sgrlSAN5EF
	TUZikAn9FiDbwt1N
X-Received: by 10.84.236.67 with SMTP id h3mr5238012pln.86.1492539714475;
	Tue, 18 Apr 2017 11:21:54 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.21.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:21:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:12 -0700
Message-Id: <20170418182142.27253-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-networking][ 02/32] lowpan-tools: Fix build with clang
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
X-List-Received-Date: Tue, 18 Apr 2017 18:21:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-src-iz.c-Undef-dprintf-before-redefining.patch | 27 ++++++++++++++++++++++
 .../lowpan-tools/lowpan-tools_git.bb               |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
new file mode 100644
index 000000000..68393067d
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
@@ -0,0 +1,27 @@
+From ad088233608ba2205511da4f270f8ba29844b84c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2017 09:02:02 -0700
+Subject: [PATCH] src/iz.c: Undef dprintf before redefining
+
+Clang is picky and warns about macros redefinition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/iz.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/iz.c b/src/iz.c
+index 32be1a8..886f0a5 100644
+--- a/src/iz.c
++++ b/src/iz.c
+@@ -60,6 +60,7 @@ static int iz_seq = 0;
+ /* Parsed options */
+ static int iz_debug = 0;
+ 
++#undef dprintf
+ #define dprintf(lvl, fmt...)			\
+ 	do {					\
+ 		if (iz_debug >= lvl)		\
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 139eb788f..0dcc6a785 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
            file://no-help2man.patch \
            file://0001-Fix-build-errors-with-clang.patch \
            file://0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch \
+           file://0001-src-iz.c-Undef-dprintf-before-redefining.patch \
            "
 SRCREV = "38f42dbfce9e13629263db3bd3b81f14c69bb733"
 
-- 
2.12.2


