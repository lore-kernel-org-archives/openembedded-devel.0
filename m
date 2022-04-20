Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D80C3527D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.3115.1650419654040888378
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=InG8k/2p;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id b15so533946pfm.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qhi0v8YHvV3P0mLBJ3Y5l3FT7yfwoZg8vCLWEarBVGs=;
        b=InG8k/2phfbdHMopkwiHHkaUch7faDMktQjzCNUId2g3Qv79B+jJiMBP9G0Z3SflA4
         7vRvDR6njVmYKEUq0KO94R5xhjutK5CFLTu2/booEcqU7NecRTpvjfn1Yo/2W4pDcUbm
         nYzB+MB6wj9ZWF1A7IYIhJffz2rb96X22X6rqm1czyIvq29RvtxCgZ0xzgVJGxK6k41R
         fVKIle9RyCymzCbn+mw+98I9E9PLOsVoCSE2LBq1l0xpXeCCM/92eWe1Hz1biUH6FSF1
         c6gnrA2eZqkq8yihM6/4Wo6XqNqieNQcJ4L4MtFwv8PY9lH+W177mWSBAZA90eOYziTK
         Q+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qhi0v8YHvV3P0mLBJ3Y5l3FT7yfwoZg8vCLWEarBVGs=;
        b=YsUxTh7+1k1e4UwdgZaPE6+wAFW0a9xh0P08z+tr4nI+k6BiQzxmV9+aQxXNe2QjmW
         Lol0XmDHpQL0TdAUrpoQQ1gOj24nH4U2BV3i9qXe7EE5je0SEFi6w9sT/ZP9Fs3MF14I
         uonQf8hvggw0xy4JXX3fOH/xiSaWgQ9fDMGN6on3bYWBmGSXABxrdAgw0Le2C15Y3zD2
         pJgtwGvke9ux+m0OuCtb+yvneiokxEyiZfFkB+IAbRxpBwfwp3mM0OeYmS3/U3Hd87Rr
         7Y9MqbVa70P5/xgVHTkph+w3kNWl0Yb17GnI47mu3IWnGHKRc+Al/8kUtc/uXthZ3J7L
         RStg==
X-Gm-Message-State: AOAM533sOlHSfobjnD9FugPfnMa0hujPjSc4CW0TaJmTeepjp4b8fgRK
	j09DtrgmMZzB2DZSqvj5+ga/IImFjkVIcQ==
X-Google-Smtp-Source: 
 ABdhPJzSZVOjVxpZU8lDyrKe7hDKTbl6FTDCuIOvcv3+l1t9u/AJ/wiOa69DZVSZInQbyqDndStz6A==
X-Received: by 2002:a63:de53:0:b0:3aa:8b0:b690 with SMTP id
 y19-20020a63de53000000b003aa08b0b690mr10158880pgi.580.1650419653165;
        Tue, 19 Apr 2022 18:54:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 bm27-20020a656e9b000000b0039e5d327f78sm17445212pgb.44.2022.04.19.18.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 18:54:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ltrace: Fix build on ppc64 with gcc12
Date: Tue, 19 Apr 2022 18:54:10 -0700
Message-Id: <20220420015410.3118587-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96709

gcc-12 has a better static analyser and finds additional use-after-free
case, addressed by removing the double free

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-ppc-plt-do-not-free-symbol-libsym.patch | 29 +++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-plt-do-not-free-symbol-libsym.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-plt-do-not-free-symbol-libsym.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-plt-do-not-free-symbol-libsym.patch
new file mode 100644
index 0000000000..4793e561c0
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-plt-do-not-free-symbol-libsym.patch
@@ -0,0 +1,29 @@
+From f47672bed5905ae382e80b09dafca9a8da45aa67 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Apr 2022 18:44:36 -0700
+Subject: [PATCH] ppc/plt: do not free symbol libsym
+
+delete_symbol_chain() will call free as well if sybol is non-null
+it also fixes use-after-free warnings that compiler emits
+
+Upstream-Status: Submitted [https://gitlab.com/cespedes/ltrace/-/merge_requests/2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux-gnu/ppc/plt.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/sysdeps/linux-gnu/ppc/plt.c b/sysdeps/linux-gnu/ppc/plt.c
+index 5f81889..7c1c025 100644
+--- a/sysdeps/linux-gnu/ppc/plt.c
++++ b/sysdeps/linux-gnu/ppc/plt.c
+@@ -687,7 +687,6 @@ arch_elf_add_func_entry(struct process *proc, struct ltelf *lte,
+ 		if (libsym == NULL
+ 		    || library_symbol_init(libsym, addr, full_name, 1,
+ 					   LS_TOPLT_NONE) < 0) {
+-			free(libsym);
+ 			delete_symbol_chain(libsym);
+ 			libsym = NULL;
+ 			fprintf(stderr, "Couldn't add symbol %s"
+-- 
+2.36.0
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index ad58428718..72bec301fb 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http;
            file://0001-ensure-the-struct-pointers-are-null-initilized.patch \
            file://0001-ppc-Remove-unused-host_powerpc64-function.patch \
            file://0001-mips-Use-hardcodes-values-for-ABI-syscall-bases.patch \
+           file://0001-ppc-plt-do-not-free-symbol-libsym.patch \
            "
 SRC_URI:append:libc-musl = " file://add_ppc64le.patch"
 
-- 
2.36.0


