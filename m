Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE3273289
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:47 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id x7so60299770qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=3QL+vhylCitWGcrWWpQu2mYAhORbvmqq9jWIdTehchs=;
	b=YeUznoqMdAGmucgrxEwE5Ph8bbRwF3TDaNBxXmbi5a9cUFTDuaLzNhzhvNsgresbBh
	leDDSG54uA4R420j2Ud51H5XQqiFi0bTU6vdAK/mjbn+I0I4RGcmnZh/8dU+YfxuPwoa
	qTkt0LkfyAXUbeQ9ewZ6q5yT49W5hqgL/rXegNKLZoDQ9kuh1N9ZIxCuQs9kL6MxErQg
	zVnILeawaeHgJzTcT4LB0q4ghZ2yVZZxMfFDLpju6uvw+O1DknrpCyAhksZPrJOtBAhh
	PMsudmxRzlUWmnFq1khyxwJvI05qb8AYSsqtToIKRgpzGk420Dr2/nt88F18Mkp/g9de
	xNYA==
X-Gm-Message-State: AOPr4FWSxSS27mY4GqIQ2EVbyRGbimTPtRzk9RBh34ZOZerSkP8Nt40tl4p2FKJ6krbIOw==
X-Received: by 10.55.25.90 with SMTP id k87mr20364867qkh.84.1462543307819;
	Fri, 06 May 2016 07:01:47 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id e11sm5760663qhe.2.2016.05.06.07.01.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:46 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:45 -0300
Message-Id: <1462543259-7206-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 08/22] ltrace: Error Fix for ARM
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
X-List-Received-Date: Fri, 06 May 2016 14:01:47 -0000

From: Li xin <lixin.fnst@cn.fujitsu.com>

1) The error is as following:
     root # ltrace ls
     __libc_start_main(0xb6fbc018, 1, 0xbed8fdc4, 0xb6fd0b88PTRACE_SINGLESTEP: Input/output error
     2747 couldn't continue when handling __libc_start_main (0xb6fbbde0) at 0xb6fbbde0
   The master branch fix it.

2) remove unused patch:
     --0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
     --ltrace-0.7.2-unused-typedef.patch

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...-ltrace-fix-gcc-5-logical-not-parentheses.patch | 38 -----------------
 .../ltrace/ltrace-0.7.2-unused-typedef.patch       | 49 ----------------------
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  6 +--
 3 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
deleted file mode 100644
index 681c43d..0000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 876fe5680d77800426f8c4c5680a235732d722e6 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Mon, 24 Aug 2015 17:37:54 +0800
-Subject: [PATCH] ltrace: fix gcc 5 logical not parentheses
-
-Upstream-Status: Pending
-
-Build ltrace with gcc 5.2, it fails with:
-
-error: logical not is only applied to the left hand side of comparison
-[-Werror=logical-not-parentheses]
-   if (!need_data(data, offset, SIZE / 8) < 0)  \
-                                             ^
-
-Function need_data just return 0 on success and -1 if fail. So it is ok
-to just test if (need_data(data, offset, SIZE / 8) < 0).
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- ltrace-elf.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ltrace-elf.c b/ltrace-elf.c
-index c571d2a..7fe830f 100644
---- a/ltrace-elf.c
-+++ b/ltrace-elf.c
-@@ -218,7 +218,7 @@ need_data(Elf_Data *data, GElf_Xword offset, GElf_Xword size)
- 	int								\
- 	NAME(Elf_Data *data, GElf_Xword offset, uint##SIZE##_t *retp)	\
- 	{								\
--		if (!need_data(data, offset, SIZE / 8) < 0)		\
-+		if (need_data(data, offset, SIZE / 8) < 0)		\
- 			return -1;					\
- 									\
- 		if (data->d_buf == NULL) /* NODATA section */ {		\
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch b/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch
deleted file mode 100644
index 8f3c0ec..0000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-diff --git a/value.c b/value.c
-index d18db17..b98298e 100644
---- a/value.c
-+++ b/value.c
-@@ -1,6 +1,6 @@
- /*
-  * This file is part of ltrace.
-- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
-+ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
-  *
-  * This program is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU General Public License as
-@@ -282,9 +282,9 @@ value_init_deref(struct value *ret_val, struct value *valp)
- 	if (value_extract_word(valp, &l, NULL) < 0)
- 		return -1;
- 
--	/* We need "long" to be long enough to hold platform
-+	/* We need "long" to be long enough to hold target
- 	 * pointers.  */
--	typedef char assert__long_enough_long[-(sizeof(l) < sizeof(void *))];
-+	assert(sizeof(l) >= sizeof(arch_addr_t));
- 
- 	value_common_init(ret_val, valp->inferior, valp,
- 			  valp->type->u.ptr_info.info, 0);
-diff --git a/lens_default.c b/lens_default.c
-index ed3d0e1..5d00814 100644
---- a/lens_default.c
-+++ b/lens_default.c
-@@ -1,6 +1,6 @@
- /*
-  * This file is part of ltrace.
-- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
-+ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
-  * Copyright (C) 1998,2004,2007,2008,2009 Juan Cespedes
-  * Copyright (C) 2006 Ian Wienand
-  * Copyright (C) 2006 Steve Fink
-@@ -342,9 +342,9 @@ format_array(FILE *stream, struct value *value, struct value_dict *arguments,
- 	     struct expr_node *length, size_t maxlen, int before,
- 	     const char *open, const char *close, const char *delim)
- {
--	/* We need "long" to be long enough to cover the whole address
--	 * space.  */
--	typedef char assert__long_enough_long[-(sizeof(long) < sizeof(void *))];
-+	/* We need "long" to be long enough to cover the whole target
-+	 * address space.  */
-+	assert(sizeof(long) >= sizeof(arch_addr_t));
- 	long l;
- 	if (expr_eval_word(length, value, arguments, &l) < 0)
- 		return -1;
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index bc4e271..19899f9 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -11,14 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 PE = "1"
 PV = "7.3+git${SRCPV}"
-SRCREV = "37ecc41b58be3dbdd79592a76e331b5b371e4f81"
+SRCREV = "01b10e191e99d8cb147e5a2b7da8196e0ec6fb94"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=ltrace-0.7 \
-           file://ltrace-0.7.2-unused-typedef.patch \
+SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
            file://configure-allow-to-disable-selinux-support.patch \
-           file://0001-ltrace-fix-gcc-5-logical-not-parentheses.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
2.8.2


