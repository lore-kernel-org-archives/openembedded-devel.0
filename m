Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC5B7E13D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:40 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id z28so8335521pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GZkLbfLClF8sXBdoRt2eRBkFRWYffaNPvezQd0ZjoU0=;
	b=ibC0rm2l/R7q3hb8+UVt5XOuEb+PTaN5p9xh5GvdbuFPsaikYBY1eaJ55SXwSOktEY
	qwwkZHM1SVWpwW4QTchBvhrYOZ/yFpVGjlAP5jtBgIw4VGb6E9TNiYExM4bkuXt/EFVX
	El0y2QPDNUMmaaW1L4kJsMrN81Dz0sRKVnRZap/2dx1rXZABe7xXoS/gAnfd8nTDyQ6c
	i91eLpIi/OdxO9RszAKElmoZYl3TQcIEyzR/BS+9mB+uaSmJmx+d53SbT5e6N+NfSA2F
	zBtPKMzN2uNWHF0qFofdqhS8+MAcL3HV+Tr0b/0NstYtx4/B5cXJhletJfAc4rRbnzY4
	I9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GZkLbfLClF8sXBdoRt2eRBkFRWYffaNPvezQd0ZjoU0=;
	b=sAgDGjq+xlLBPCqJcI6sZjovMkS5kcvdptx1MAhsgw9SqUtpKZnhhUEmO1ThhzOVyI
	Nxwf4KHwvyBYW3qyQBxTm1oOCeownKRsFM1/Q9odRemp3jJAcq5YmEay01lUsQl58d0Y
	eHuCcetXFJrNAccycUr6Z82FVSD6D7+WBGKDpEw/A+ADn4UIwY1uylrKIa82hASbDH7I
	wsDe2ZgAWBVhXCw3AMLkJCraR6TWD9cdoqeNbyziPxBAWSFwwRQyRRcFg7bjwpKbeYvg
	0a3Vll+2V5SbzI4zb8dgEIdoUwibXJ9bgzoGgB+KeT5eVjR3jn9PClFhadKii/Ax6LnB
	48cA==
X-Gm-Message-State: APjAAAW6OuXzfF0hjGkcqefw/trXE3sim6q/svUPCB1LDODG8U+cYyJb
	C3eimW4G5vxud3PTWq/dPlZigC6+
X-Google-Smtp-Source: APXvYqw5tfil/sqXFSuAIR74A2esPksQFai7AfQfEYJWLD7SJdp7ffWgO/89o3aAhNCVvRpI63o4uw==
X-Received: by 2002:a63:2248:: with SMTP id t8mr35957468pgm.358.1558411001269; 
	Mon, 20 May 2019 20:56:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:04 -0700
Message-Id: <1480f646842d013ddaa1d45584a3400a0b759b9a.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 04/34] postgresql: fix compile error
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
X-List-Received-Date: Tue, 21 May 2019 03:56:40 -0000

From: Changqing Li <changqing.li@windriver.com>

configuration:
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf

SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
DEBUG_BUILD = "1"
EXTRA_IMAGE_FEATURES += "dbg-pkgs"

with above configuration and option -Og, postgresql compile failed with:
| make[4]: Nothing to be done for 'all'.
| make[4]: Leaving directory '/tmp/work/mips-pokymllib32-linux/lib32-postgresql/11.2-r0/build/src/fe_utils'
| {standard input}: Assembler messages:
| {standard input}:58887: Error: branch out of range
| <builtin>: recipe for target 'tab-complete.o' failed
| make[3]: *** [tab-complete.o] Error 1
| make[3]: Leaving directory '/tmp/work/mips-pokymllib32-linux/lib32-postgresql/11.2-r0/build/src/bin/psql'
| Makefile:41: recipe for target 'all-psql-recurse' failed
| make[2]: *** [all-psql-recurse] Error 2

replace -Og with -O to fix this error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 85f1917..6e20231 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -72,6 +72,16 @@ EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
 EXTRA_OECONF_sh4 += "--disable-spinlocks"
 EXTRA_OECONF_aarch64 += "--disable-spinlocks"
 
+DEBUG_OPTIMIZATION_remove_mips = " -Og"
+DEBUG_OPTIMIZATION_append_mips = " -O"
+BUILD_OPTIMIZATION_remove_mips = " -Og"
+BUILD_OPTIMIZATION_append_mips = " -O"
+
+DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
+DEBUG_OPTIMIZATION_append_mipsel = " -O"
+BUILD_OPTIMIZATION_remove_mipsel = " -Og"
+BUILD_OPTIMIZATION_append_mipsel = " -O"
+
 PACKAGES_DYNAMIC += "^${PN}-plperl \
     ^${PN}-pltcl \
     ^${PN}-plpython \
-- 
2.7.4


