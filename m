Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id BCEE27ECB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 01:47:42 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w26so927942pfq.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 18:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cs6hhHORDg/pTKobjLpisIqECchtUL0ghAKg2y+1jrQ=;
	b=Ia6M19GdgPWQVqafINltYx3ckjf0O+V2UG7RFJPZkVQv0LsvVe2FIYhQ+S3xLiw7uo
	H0FyQ3sGZEQ6aGyLCMVeNzi4RZxnLjPW3FOiZaVm+tRtQgVYpu/XWopTvl2KItKPEx1P
	1xYTMFRqlqHi+R+KVWmDbsn1AKzHef6U17lR0ZAct8cIEANGAGIKFybJPOTtdmJGe/Ia
	opQD8Tf3y/h6ib6MR7qZG/gY3EB+/F4UofCYzaTbbkOVUk3FHaK0K7vl+XnMRjnu2CLE
	oNRB53jWimrGKheRLaf1ENFGeWuSLzlVEuDFvmRDth7T0htWRsRNCtheO8YmYAmIUHc9
	+Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cs6hhHORDg/pTKobjLpisIqECchtUL0ghAKg2y+1jrQ=;
	b=mk0DBNmB05HBcwV7zhYt7jU5+v6ZQPWv2ME5cWaSzhXgV9RS4vhQFl5Ltps69ExYT4
	j9N2JeCK8246w2LPIx9HZKxh4v8pPdtWNxsKQQq1jw3H4R2ysKJIpUAuiqutJzxXuSWf
	uNlJXo/Vzz1ewVXi+TEjCJi9KCPWjt2ZM13PlFQASbdCQNt6qUlLRUTUPNR0ovJiQhrI
	nF7Bptke5YsA5kRZWOeE/hdWG0q4r3W71/009/8txy14uTYGHr2zesRrJtjh0KSTGXJo
	LjTon4ClcVkRG14H6njV311l0PjfbPuZ59VjSp++nCBcjbqaEA4f3E2kXQLPJDciWJsf
	7UNw==
X-Gm-Message-State: APjAAAWAYDFpCZeyJ2WBhYIKuhROwxADlz6rjquAI+ZsADI+GJeusF6I
	RVD00BfvJIhBR8EtCB3bGOkTv1bowiI=
X-Google-Smtp-Source: APXvYqw/IZgWwYmZA1xDmvvuG6CfOWb94aUuaMufPVs2OgMzKtmg3OS/75TQUuxm0VMqJSlZo1A8iQ==
X-Received: by 2002:a63:f118:: with SMTP id f24mr6211894pgi.322.1567043263342; 
	Wed, 28 Aug 2019 18:47:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id j6sm424062pjd.19.2019.08.28.18.47.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 18:47:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 18:47:34 -0700
Message-Id: <20190829014734.44623-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] bpftool.bb: Disable SECURITY_CFLAGS
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
X-List-Received-Date: Thu, 29 Aug 2019 01:47:42 -0000
Content-Transfer-Encoding: 8bit

We do not pass CFLAGS to build and fortify sources needs some
optimization to be enabled, its better to reset the additional flags and
let the build system add them as it needs

Fixes build failures like
tools/include/tools/libc_compat.h:11:21: error: static declaration of 'reallocarray' follows non-static declaration
|    11 | static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
|       |                     ^~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 39c478a954..e58bdd4933 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -9,7 +9,9 @@ inherit bash-completion kernelsrc kernel-arch
 
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
-EXTRA_OEMAKE = "-C ${S}/tools/bpf/bpftool O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+EXTRA_OEMAKE = "V=1 -C ${S}/tools/bpf/bpftool O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+
+SECURITY_CFLAGS = ""
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
-- 
2.23.0


