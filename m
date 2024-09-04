Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7940CA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 05:33:05 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.43306.1725427984510432627
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 22:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qd9mIM7p;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5dfabdbef52so3711319eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 22:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725427983; x=1726032783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoHHWav2/OZZa7ctDUN1dRll8RONiSQFhP249WvVqAk=;
        b=Qd9mIM7pwQLz2UNJmBQ3JphP8GDISjcw2iRLbjFrQ/fWEsX8P9MIRDFFZxnt2PdQIF
         /Fv/i5G50TIb9B13J9PRW/6LNoHON7lDYWz29y76eSBp6yZwCYBjzfMTYuT+6L+DEevK
         bM0/hfFjm1G2wvradfoS4MWM55WQeCqp8yJC77dUkKcOURnjeEVfUObsSFLUhMlQKuxX
         GrkAKFhcKaUmewf3M0ne8fjitkHIltGLAv+kwbItrpHG+XU+HteVCvZfudqOR/99iFfC
         HTpbM9OZluHa9dzghO1tLVpu+tFru9m4cTLJZY51YYVmhgmTug3/Pcuk8PtZL42pz9DH
         DZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725427983; x=1726032783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoHHWav2/OZZa7ctDUN1dRll8RONiSQFhP249WvVqAk=;
        b=Muc0+7z1n4olDLU+e1bZRmhwc4w2j5APh4o1mq0RhvguPADpkcrbwEPZZkYiAtLBaf
         UjDXtWAoAccmZjRepNqc8BsScBKK+ykxLImBwdH9Flom8fSB/Dh0dYKKpvdJfzGFfNac
         vwwNnkrl4HVt5PjoN62ZHX4r9NKVtfh0s6kK/iQZeNXf5HE5sAOQM+PrpVQDhrnvxxzW
         PS74zEE1MZgMnPoVO+zqsX3d+zcSuQjLkqqP4g7pY00PZcqnNoi1MrnWOfGdeMkuY4n5
         JLaHdB/jfEE2JND38ImKAkZQuLvdvCnoDINDmlStpvQNdAbdCCbaf+0WS6LNfQu0mqug
         OVZw==
X-Gm-Message-State: AOJu0YwwmTcWYEY6LZ78pOBLNI9CWB4n2PCmarCVTVqWcCMl7swQsfDD
	MWWsucrpBb3p2gyoQdpIFtJtrjsgeWw7sqTEg/1NAA2c7JoVf0WOvKAAPLDp
X-Google-Smtp-Source: AGHT+IGnBUOaLpK5oWxBHAaWk0DQ4fPq4A9uIy0Dt63g4wTdy61r5osJEqKCblFzxyYUgeDem1zRTg==
X-Received: by 2002:a05:6870:a101:b0:270:27e6:6f1a with SMTP id 586e51a60fabf-277cce5603fmr14549911fac.41.1725427983252;
        Tue, 03 Sep 2024 22:33:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778589896sm776515b3a.128.2024.09.03.22.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:33:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] ltrace: Switch to gitlab SRC_URI
Date: Tue,  3 Sep 2024 22:32:57 -0700
Message-ID: <20240904053300.2085710-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904053300.2085710-1-raj.khem@gmail.com>
References: <20240904053300.2085710-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 05:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112085

The github mirror was a stopgap, now ltrace is hosted on gitlab/cespedes
drop already applied patches upstream.
Add a patch to fix VLAs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eachable-code-after-switch-statement.patch |  42 ---
 ...001-Fix-tautological-compare-warning.patch | 261 ------------------
 ...-struct-pointers-are-null-initilized.patch |  46 ---
 ...01-ppc-plt-do-not-free-symbol-libsym.patch |  29 --
 ...ID_FILE-not-use-variable-length-arra.patch |  34 +++
 .../0001-replace-readdir_r-with-readdir.patch |  36 ---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  10 +-
 7 files changed, 37 insertions(+), 421 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-tautological-compare-warning.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ensure-the-struct-pointers-are-null-initilized.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-plt-do-not-free-symbol-libsym.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-proc-Make-PROC_PID_FILE-not-use-variable-length-arra.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch
deleted file mode 100644
index c896e3ebb0..0000000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 95ff340a74af16cca89fd5c5ca99890821053209 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Apr 2017 00:47:16 -0700
-Subject: [PATCH] ARM code has unreachable code after switch statement move
- initialization
-
-Fixed
-sysdeps/linux-gnu/arm/trace.c:173:33: error: statement will never be executed [-Werror=switch-unreachable]
-    uint32_t operand1, operand2, result = 0;
-                                 ^~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- sysdeps/linux-gnu/arm/trace.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/sysdeps/linux-gnu/arm/trace.c b/sysdeps/linux-gnu/arm/trace.c
-index 5e51e91..f974d1f 100644
---- a/sysdeps/linux-gnu/arm/trace.c
-+++ b/sysdeps/linux-gnu/arm/trace.c
-@@ -155,6 +155,8 @@ arm_get_next_pcs(struct process *proc,
- 	const unsigned cond = BITS(this_instr, 28, 31);
- 	const unsigned opcode = BITS(this_instr, 24, 27);
- 
-+	uint32_t operand1, operand2, result = 0;
-+
- 	if (cond == COND_NV)
- 		switch (opcode) {
- 			arch_addr_t addr;
-@@ -170,7 +172,6 @@ arm_get_next_pcs(struct process *proc,
- 		}
- 	else
- 		switch (opcode) {
--			uint32_t operand1, operand2, result = 0;
- 		case 0x0:
- 		case 0x1:			/* data processing */
- 		case 0x2:
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-tautological-compare-warning.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-tautological-compare-warning.patch
deleted file mode 100644
index a599d0e191..0000000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-tautological-compare-warning.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-From 0af8ced6376f2256b9daac301c851e1c99c3b035 Mon Sep 17 00:00:00 2001
-From: Adam Trhon <adam.trhon@tbs-biometrics.com>
-Date: Fri, 12 May 2017 13:39:11 +0200
-Subject: [PATCH] Fix tautological compare warning
-
-By default, gcc ignores warning from code generated by macros
-(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80369). When
-ltrace is compiled under icecream the warning *is generated*
-(https://github.com/icecc/icecream/issues/202)
-and the compilation fails (because of -Werror).
-
-Upstream-Status: Submitted [ltrace-devel@lists.alioth.debian.org]
-
-Signed-off-by: Adam Trhon <adam.trhon@tbs-biometrics.com>
----
- filter.c                        | 4 ++--
- sysdeps/linux-gnu/arm/fetch.c   | 2 +-
- sysdeps/linux-gnu/arm/trace.c   | 2 +-
- sysdeps/linux-gnu/ia64/fetch.c  | 2 +-
- sysdeps/linux-gnu/metag/trace.c | 2 +-
- sysdeps/linux-gnu/mips/plt.c    | 2 +-
- sysdeps/linux-gnu/ppc/fetch.c   | 2 +-
- sysdeps/linux-gnu/ppc/plt.c     | 2 +-
- sysdeps/linux-gnu/ppc/trace.c   | 4 ++--
- sysdeps/linux-gnu/s390/fetch.c  | 2 +-
- sysdeps/linux-gnu/s390/trace.c  | 4 ++--
- sysdeps/linux-gnu/x86/fetch.c   | 2 +-
- sysdeps/linux-gnu/x86/trace.c   | 4 ++--
- value.c                         | 4 ++--
- 14 files changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/filter.c b/filter.c
-index ba50c40..a65856d 100644
---- a/filter.c
-+++ b/filter.c
-@@ -79,7 +79,7 @@ filter_lib_matcher_name_init(struct filter_lib_matcher *matcher,
- {
- 	switch (type) {
- 	case FLM_MAIN:
--		assert(type != type);
-+		assert(!"Unexpected value of type");
- 		abort();
- 
- 	case FLM_SONAME:
-@@ -137,7 +137,7 @@ matcher_matches_library(struct filter_lib_matcher *matcher, struct library *lib)
- 	case FLM_MAIN:
- 		return lib->type == LT_LIBTYPE_MAIN;
- 	}
--	assert(matcher->type != matcher->type);
-+	assert(!"Unexpected value of matcher->type");
- 	abort();
- }
- 
-diff --git a/sysdeps/linux-gnu/arm/fetch.c b/sysdeps/linux-gnu/arm/fetch.c
-index b500448..8f75fcf 100644
---- a/sysdeps/linux-gnu/arm/fetch.c
-+++ b/sysdeps/linux-gnu/arm/fetch.c
-@@ -317,7 +317,7 @@ arch_fetch_retval(struct fetch_context *ctx, enum tof type,
- 		memmove(data, ctx->regs.uregs, sz);
- 		return 0;
- 	}
--	assert(info->type != info->type);
-+	assert(!"Unexpected value of info->type");
- 	abort();
- }
- 
-diff --git a/sysdeps/linux-gnu/arm/trace.c b/sysdeps/linux-gnu/arm/trace.c
-index 5e51e91..e76bf63 100644
---- a/sysdeps/linux-gnu/arm/trace.c
-+++ b/sysdeps/linux-gnu/arm/trace.c
-@@ -701,7 +701,7 @@ arch_type_sizeof(struct process *proc, struct arg_type_info *info)
- 		return (size_t)-2;
- 
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 	}
- }
-diff --git a/sysdeps/linux-gnu/ia64/fetch.c b/sysdeps/linux-gnu/ia64/fetch.c
-index 171c7a2..ee2fbc7 100644
---- a/sysdeps/linux-gnu/ia64/fetch.c
-+++ b/sysdeps/linux-gnu/ia64/fetch.c
-@@ -409,7 +409,7 @@ arch_fetch_arg_next(struct fetch_context *ctx, enum tof type,
- 	case ARGTYPE_ARRAY:
- 		/* Arrays decay into pointers.  XXX Fortran?  */
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 	}
- }
-diff --git a/sysdeps/linux-gnu/metag/trace.c b/sysdeps/linux-gnu/metag/trace.c
-index ad5fffe..7a843d6 100644
---- a/sysdeps/linux-gnu/metag/trace.c
-+++ b/sysdeps/linux-gnu/metag/trace.c
-@@ -142,7 +142,7 @@ get_regval_from_unit(enum metag_unitnum unit, unsigned int reg,
- 		return regs->ax[reg][0];
- 	/* We really shouldn't be here.  */
- 	default:
--		assert(unit != unit);
-+		assert(!"Unexpected value of unit");
- 		abort();
- 	}
- 	return 0;
-diff --git a/sysdeps/linux-gnu/mips/plt.c b/sysdeps/linux-gnu/mips/plt.c
-index c7c10ac..ca2307d 100644
---- a/sysdeps/linux-gnu/mips/plt.c
-+++ b/sysdeps/linux-gnu/mips/plt.c
-@@ -651,7 +651,7 @@ mips_stub_bp_continue(struct breakpoint *bp, struct process *proc)
- 		break;
- 	}
- 
--	assert(bp->libsym->arch.type != bp->libsym->arch.type);
-+	assert(!"Unexpected value of bp->libsym->arch.type");
- 	abort();
- }
- 
-diff --git a/sysdeps/linux-gnu/ppc/fetch.c b/sysdeps/linux-gnu/ppc/fetch.c
-index c6cbd71..5db5675 100644
---- a/sysdeps/linux-gnu/ppc/fetch.c
-+++ b/sysdeps/linux-gnu/ppc/fetch.c
-@@ -502,7 +502,7 @@ allocate_argument(struct fetch_context *ctx, struct process *proc,
- 	case ARGTYPE_ARRAY:
- 		/* Arrays decay into pointers.  XXX Fortran?  */
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 	}
- 
-diff --git a/sysdeps/linux-gnu/ppc/plt.c b/sysdeps/linux-gnu/ppc/plt.c
-index 5f81889..781da03 100644
---- a/sysdeps/linux-gnu/ppc/plt.c
-+++ b/sysdeps/linux-gnu/ppc/plt.c
-@@ -1085,7 +1085,7 @@ ppc_plt_bp_continue(struct breakpoint *bp, struct process *proc)
- 		break;
- 	}
- 
--	assert(bp->libsym->arch.type != bp->libsym->arch.type);
-+	assert(!"Unexpected value of bp->libsym->arch.type");
- 	abort();
- }
- 
-diff --git a/sysdeps/linux-gnu/ppc/trace.c b/sysdeps/linux-gnu/ppc/trace.c
-index 5aab538..caa6035 100644
---- a/sysdeps/linux-gnu/ppc/trace.c
-+++ b/sysdeps/linux-gnu/ppc/trace.c
-@@ -217,7 +217,7 @@ arch_type_sizeof(struct process *proc, struct arg_type_info *info)
- 		return (size_t)-2;
- 
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 		break;
- 	}
-@@ -231,7 +231,7 @@ arch_type_alignof(struct process *proc, struct arg_type_info *info)
- 
- 	switch (info->type) {
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 		break;
- 
-diff --git a/sysdeps/linux-gnu/s390/fetch.c b/sysdeps/linux-gnu/s390/fetch.c
-index 4ad5951..4721c30 100644
---- a/sysdeps/linux-gnu/s390/fetch.c
-+++ b/sysdeps/linux-gnu/s390/fetch.c
-@@ -266,7 +266,7 @@ arch_fetch_arg_next(struct fetch_context *ctx, enum tof type,
- 		return allocate_gpr(ctx, proc, info, valuep, sz);
- 
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 	}
- 	return -1;
-diff --git a/sysdeps/linux-gnu/s390/trace.c b/sysdeps/linux-gnu/s390/trace.c
-index 78b04c3..24f7801 100644
---- a/sysdeps/linux-gnu/s390/trace.c
-+++ b/sysdeps/linux-gnu/s390/trace.c
-@@ -213,7 +213,7 @@ arch_type_sizeof(struct process *proc, struct arg_type_info *info)
- 		return (size_t)-2;
- 
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 	}
- }
-@@ -226,7 +226,7 @@ arch_type_alignof(struct process *proc, struct arg_type_info *info)
- 
- 	switch (info->type) {
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		break;
- 
- 	case ARGTYPE_CHAR:
-diff --git a/sysdeps/linux-gnu/x86/fetch.c b/sysdeps/linux-gnu/x86/fetch.c
-index 6868101..ae2ed79 100644
---- a/sysdeps/linux-gnu/x86/fetch.c
-+++ b/sysdeps/linux-gnu/x86/fetch.c
-@@ -523,7 +523,7 @@ classify(struct process *proc, struct fetch_context *context,
- 
- 	default:
- 		/* Unsupported type.  */
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 	}
- 	abort();
-diff --git a/sysdeps/linux-gnu/x86/trace.c b/sysdeps/linux-gnu/x86/trace.c
-index 6a1a6a5..d8d2115 100644
---- a/sysdeps/linux-gnu/x86/trace.c
-+++ b/sysdeps/linux-gnu/x86/trace.c
-@@ -145,7 +145,7 @@ arch_type_sizeof(struct process *proc, struct arg_type_info *info)
- 		return (size_t)-2;
- 
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 	}
- }
-@@ -158,7 +158,7 @@ arch_type_alignof(struct process *proc, struct arg_type_info *info)
- 
- 	switch (info->type) {
- 	default:
--		assert(info->type != info->type);
-+		assert(!"Unexpected value of info->type");
- 		abort();
- 		break;
- 
-diff --git a/value.c b/value.c
-index 2125ba9..30edb4e 100644
---- a/value.c
-+++ b/value.c
-@@ -363,7 +363,7 @@ value_set_word(struct value *value, long word)
- 		u.u64 = word;
- 		break;
- 	default:
--		assert(sz != sz);
-+		assert(!"Unexpected value of sz");
- 		abort();
- 	}
- 
-@@ -414,7 +414,7 @@ value_extract_word(struct value *value, long *retp,
- 		*retp = (long)u.u64;
- 		return 0;
- 	default:
--		assert(sz != sz);
-+		assert(!"Unexpected value of sz");
- 		abort();
- 	}
- }
--- 
-2.12.0
-
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ensure-the-struct-pointers-are-null-initilized.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ensure-the-struct-pointers-are-null-initilized.patch
deleted file mode 100644
index 9def41ca60..0000000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ensure-the-struct-pointers-are-null-initilized.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 67a8fa478a4484bc4dbfb3ac74e11be1dd5af594 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Dec 2019 19:35:48 -0800
-Subject: [PATCH] ensure the struct pointers are null initilized
-
-Do not delete if pointer is already null
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- expr.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/expr.c b/expr.c
-index 4059a32..5ffd0ad 100644
---- a/expr.c
-+++ b/expr.c
-@@ -189,10 +189,8 @@ int
- expr_clone(struct expr_node *retp, const struct expr_node *node)
- {
- 	*retp = *node;
--
-+	struct expr_node *nlhs = 0, *nrhs = 0;
- 	switch (node->kind) {
--		struct expr_node *nlhs;
--		struct expr_node *nrhs;
- 
- 	case EXPR_OP_ARGNO:
- 	case EXPR_OP_SELF:
-@@ -236,8 +234,10 @@ expr_clone(struct expr_node *retp, const struct expr_node *node)
- 		if (expr_alloc_and_clone(&nlhs, node->lhs, node->own_lhs) < 0) {
- 			if (node->kind == EXPR_OP_CALL2
- 			    && node->u.call.own_rhs) {
--				expr_destroy(nrhs);
--				free(nrhs);
-+				if (nrhs) {
-+					expr_destroy(nrhs);
-+					free(nrhs);
-+				}
- 				return -1;
- 			}
- 		}
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-plt-do-not-free-symbol-libsym.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-plt-do-not-free-symbol-libsym.patch
deleted file mode 100644
index 4793e561c0..0000000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-plt-do-not-free-symbol-libsym.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f47672bed5905ae382e80b09dafca9a8da45aa67 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Apr 2022 18:44:36 -0700
-Subject: [PATCH] ppc/plt: do not free symbol libsym
-
-delete_symbol_chain() will call free as well if sybol is non-null
-it also fixes use-after-free warnings that compiler emits
-
-Upstream-Status: Submitted [https://gitlab.com/cespedes/ltrace/-/merge_requests/2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/linux-gnu/ppc/plt.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/sysdeps/linux-gnu/ppc/plt.c b/sysdeps/linux-gnu/ppc/plt.c
-index 5f81889..7c1c025 100644
---- a/sysdeps/linux-gnu/ppc/plt.c
-+++ b/sysdeps/linux-gnu/ppc/plt.c
-@@ -687,7 +687,6 @@ arch_elf_add_func_entry(struct process *proc, struct ltelf *lte,
- 		if (libsym == NULL
- 		    || library_symbol_init(libsym, addr, full_name, 1,
- 					   LS_TOPLT_NONE) < 0) {
--			free(libsym);
- 			delete_symbol_chain(libsym);
- 			libsym = NULL;
- 			fprintf(stderr, "Couldn't add symbol %s"
--- 
-2.36.0
-
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-proc-Make-PROC_PID_FILE-not-use-variable-length-arra.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-proc-Make-PROC_PID_FILE-not-use-variable-length-arra.patch
new file mode 100644
index 0000000000..3e166f0deb
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-proc-Make-PROC_PID_FILE-not-use-variable-length-arra.patch
@@ -0,0 +1,34 @@
+From f2f6082cb112cf3b8a6a5bfc989e4a4f6a1bff27 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Sep 2024 20:41:20 +0000
+Subject: [PATCH] proc: Make PROC_PID_FILE not use variable length array
+
+This helps in compiling with clang which is not happy about VLA
+
+| ../../../git/sysdeps/linux-gnu/proc.c:70:3: error: variable length array folded to constant array as an extension [-Werror,-Wgnu-folding-constant]
+|    70 |                 PROC_PID_FILE(proc_exe, "/proc/%d/exe", pid);
+|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| ../../../git/sysdeps/linux-gnu/proc.c:59:11: note: expanded from macro 'PROC_PID_FILE'
+|    59 |         char VAR[strlen(FORMAT) + 6];           \
+|       |                  ^~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux-gnu/proc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeps/linux-gnu/proc.c b/sysdeps/linux-gnu/proc.c
+index b954997..f37e4e8 100644
+--- a/sysdeps/linux-gnu/proc.c
++++ b/sysdeps/linux-gnu/proc.c
+@@ -56,7 +56,8 @@
+ #define	MAX_DELAY	100000	/* 100000 microseconds = 0.1 seconds */
+ 
+ #define PROC_PID_FILE(VAR, FORMAT, PID)		\
+-	char VAR[strlen(FORMAT) + 6];		\
++	enum { buflen_ ## VAR = strlen(FORMAT)};		\
++	char VAR[buflen_ ## VAR + 6];		\
+ 	sprintf(VAR, FORMAT, PID)
+ 
+ /*
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
deleted file mode 100644
index 65c7d535eb..0000000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 64f98f84fd88797e219f9dde1ca387fee4b509f0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 24 Apr 2016 16:58:17 -0700
-Subject: [PATCH] replace readdir_r with readdir
-
-glibc 2.24 has deprecated readdir_r
-
-https://sourceware.org/ml/libc-alpha/2016-02/msg00093.html
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- sysdeps/linux-gnu/proc.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/sysdeps/linux-gnu/proc.c b/sysdeps/linux-gnu/proc.c
-index 953fd86..edb716d 100644
---- a/sysdeps/linux-gnu/proc.c
-+++ b/sysdeps/linux-gnu/proc.c
-@@ -242,9 +242,10 @@ process_tasks(pid_t pid, pid_t **ret_tasks, size_t *ret_n)
- 	size_t alloc = 0;
- 
- 	while (1) {
--		struct dirent entry;
- 		struct dirent *result;
--		if (readdir_r(d, &entry, &result) != 0) {
-+		errno = 0;
-+		result = readdir(d);
-+		if (errno != 0) {
- 		fail:
- 			free(tasks);
- 			closedir(d);
--- 
-2.8.0
-
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 63971970cf..a3ddf2a76b 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -11,27 +11,23 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 PE = "1"
 PV = "7.91+git"
-SRCREV = "c22d359433b333937ee3d803450dc41998115685"
+SRCREV = "8eabf684ba6b11ae7a1a843aca3c0657c6329d73"
 
 DEPENDS = "elfutils"
-SRC_URI = "git://github.com/sparkleholic/ltrace.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.com/cespedes/ltrace.git;protocol=https;branch=main \
            file://configure-allow-to-disable-selinux-support.patch \
-           file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
            file://0002-Fix-const-qualifier-error.patch \
-           file://0001-ARM-code-has-unreachable-code-after-switch-statement.patch \
-           file://0001-Fix-tautological-compare-warning.patch \
            file://0001-Add-support-for-mips64-n32-n64.patch \
            file://0001-configure-Recognise-linux-musl-as-a-host-OS.patch \
            file://0001-mips-plt.c-Delete-include-error.h.patch \
            file://0001-move-fprintf-into-same-block-where-modname-and-symna.patch \
            file://0001-hook-Do-not-append-int-to-std-string.patch \
            file://0001-Bug-fix-for-data-type-length-judgment.patch \
-           file://0001-ensure-the-struct-pointers-are-null-initilized.patch \
            file://0001-ppc-Remove-unused-host_powerpc64-function.patch \
            file://0001-mips-Use-hardcodes-values-for-ABI-syscall-bases.patch \
-           file://0001-ppc-plt-do-not-free-symbol-libsym.patch \
            file://0001-Fix-type-of-single-bit-bitfields.patch \
+           file://0001-proc-Make-PROC_PID_FILE-not-use-variable-length-arra.patch \
            "
 SRC_URI:append:libc-musl = " file://add_ppc64le.patch"
 

