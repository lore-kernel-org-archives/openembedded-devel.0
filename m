Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 274C77FA24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:06:58 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id s21so12556682plr.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 17:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yerTml6L2yrDvA5jtyfEFiHmbBzHXqbnOvyX/5TJtic=;
	b=uZafuESgfVZfaWr1MA7g3oirCmW1y1kxVynvf3Tm4W9vSViT5kHa7gQ9qmjJoHj/qL
	9HoOms+oQt1atsFEM1Xrv1N+qoW/V4uHSvTFp1fJg3TpANiUvzP5RaN/fLcbzCk1dtro
	vMDk+zfTYnT1s4lwZwPadjgZoIB0ChU8wwN8yMPpDQzco4JemOKxJDMQCIN6XpBeBB8v
	PneVjvs1ovqRkJXwlLyAhMZc4aj2m0FMHIYp20O9GuWEiyM6X1CoJcHUp57+6iWFIro0
	FP6sR+foeFy5NXsycHup8lyFxLwsRxy4tkg4W6sZt+Ne7Sp/4tDPnLFZEAwjGRucsfba
	P5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yerTml6L2yrDvA5jtyfEFiHmbBzHXqbnOvyX/5TJtic=;
	b=YZ9ZUPJ6EL6aUisbxvodbg4L+U1kMh7zXrWz7zwKqE3Q4Z0ujQkInh1dIJhtHIck7V
	8XSJ4ogQPyVHKT8pjOcQp1RDonrmIzr4/jMJNedcRNEOO7KwNzQtgJXVqiHyDLUIonw7
	fO59TPrH42ZrGgSI9ltzK3ywxaGxtK3M6aTxFI7xGZ+wTI8IIhatlpkJFguvvYoWRU8y
	vylNl0gk2QJd6H+A22EI1o2nSFi5Jyc4v9QwgitlNwCeOcdT0CDToQi6RWrNAUPT7sEz
	8DpYLVqcfjag2JjkDkIhrJgPwyDKnWaK56CPT4KLEx5fld9XzIhYGG26vvqwUdteQbAY
	Y1Jg==
X-Gm-Message-State: APjAAAVGqeS7DD62HIdPhXppfXA7R7uWOw1FZ/VzlekAbsCBiPdFgI4p
	Drf5eTF7gEo46ZD6tomh9+bncEnpH/c=
X-Google-Smtp-Source: APXvYqz5dqTUc6sr9jp28ZB/tZIOJ6KlHs9CX31Df0+PG4vIa/8SPhcky4H/tzs2st5A0+vsOCtSrA==
X-Received: by 2002:a17:90a:c301:: with SMTP id
	g1mr2750953pjt.67.1577754418904; 
	Mon, 30 Dec 2019 17:06:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	k1sm47345844pgq.70.2019.12.30.17.06.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 17:06:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Dec 2019 17:06:48 -0800
Message-Id: <20191231010652.3206534-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191231010652.3206534-1-raj.khem@gmail.com>
References: <20191231010652.3206534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/8] renderdoc: Upgrade to 1.5
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
X-List-Received-Date: Tue, 31 Dec 2019 01:06:59 -0000
Content-Transfer-Encoding: 8bit

Backport a patch from glslang to fix a build error
https://github.com/KhronosGroup/glslang/issues/1869

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-glslang-pool_allocator-setAllocator.patch | 31 +++++++++++++++++++
 .../{renderdoc_1.4.bb => renderdoc_1.5.bb}    |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/0001-Remove-glslang-pool_allocator-setAllocator.patch
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.4.bb => renderdoc_1.5.bb} (90%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-Remove-glslang-pool_allocator-setAllocator.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-Remove-glslang-pool_allocator-setAllocator.patch
new file mode 100644
index 0000000000..6ba1e42687
--- /dev/null
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-Remove-glslang-pool_allocator-setAllocator.patch
@@ -0,0 +1,31 @@
+From 49dd914109fd1ee9e1e917890bf18f85dd95ff31 Mon Sep 17 00:00:00 2001
+From: Reid Kleckner <rnk@google.com>
+Date: Sun, 29 Dec 2019 23:17:16 -0800
+Subject: [PATCH] Remove glslang::pool_allocator::setAllocator
+
+TPoolAllocator is not copy assignable, so this setter could never have
+been used. After a recent change (878a24ee2), new versions of Clang
+reject this code outright.
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/glslang/commit/0de87ee9a5bf5d094a3faa1a71fd9080e80b6be0]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h b/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h
+index 0e237a6a2..b8eccb883 100644
+--- a/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h
++++ b/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h
+@@ -304,7 +304,6 @@ public:
+     size_type max_size() const { return static_cast<size_type>(-1) / sizeof(T); }
+     size_type max_size(int size) const { return static_cast<size_type>(-1) / size; }
+ 
+-    void setAllocator(TPoolAllocator* a) { allocator = *a; }
+     TPoolAllocator& getAllocator() const { return allocator; }
+ 
+ protected:
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.5.bb
similarity index 90%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.5.bb
index 784f6fbb8c..5f81e841dc 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.5.bb
@@ -4,9 +4,10 @@ HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9753b1b4fba3261c27d1ce5c1acef667"
 
-SRCREV = "214d85228538e71cc63a0d7fa11dd75b1d56cc81"
+SRCREV = "a94f238e37cfe2f142093eb8e5da7775abaa88c6"
 SRC_URI = "git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x \
 	   file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
+	   file://0001-Remove-glslang-pool_allocator-setAllocator.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.24.1


