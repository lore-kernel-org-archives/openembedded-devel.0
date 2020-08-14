Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.12378.1597383437930750830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sqt1o+zf;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d22so4017610pfn.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IuKb8NQXVKdgZvuLT+L0xtRkBGSzE2JJsPjRdc+bTOI=;
        b=sqt1o+zf2orbf3WMsMh9aVubws6cdVsq1HnnunpDm8ho/rJyfc/DgogKLtv4tHzKk0
         FJYikOZWIY7D/ZbWBkRdm+BlwDcQnEB/YtrFWZyOETkRLZFfceqEimNJVbKQ3qx3eQhS
         FMU66YVKA98t5BvPbkYkhJwCBoSYBuiYgQu2FxU3EXEpIbaOMHLxAy5uyxTgDe6r3aYm
         4ckDB8Vd0Vx3pLniPW92h/h9cUt2ut9uFgjyNmM8OYv0HlauLNf1i38tQYnRzklSJ9Gk
         IsiPK+XnnWbtbOXb5MYoh/ZuhY8k7icJG3+duW2O6e0my+6WLykVUve1VKuqCDpgDd7t
         ClEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IuKb8NQXVKdgZvuLT+L0xtRkBGSzE2JJsPjRdc+bTOI=;
        b=Wvcbohw8NOg0YG1LJJFC8KJryQiinljb9on28wc+A0C/zefZMJz0XrsSlS7jKrw+5M
         DANgwNvwSPnjEb3kFxS7on2QVU8TM0aZCtM9Pqawn0tuqfglc17i24fNDnZQQkIU/yqq
         zvxoeinvwj2v3IabhxhWGpokwGCApX8zmZTYyFXLuRkQsBtDK/QkCfVYuP7LFVnmEiF/
         TLFoVqDoReF9WVOuOU+IFrvxQxLrNmVOTAn7DOrGTZ3Neu0h40t/Jw6gti3B8CPQ6YBG
         92Be6jQTY010fh83CLNGlpkYuVZ308MG/egWhWVpqnsqDnthIQXuDoKPBlESKmfLlaZk
         vvOg==
X-Gm-Message-State: AOAM530cXyoR8GU2ZdeLy8jxfnYari4idn4safYuOGUue+enaJUGOjNW
	kEvVCccYfYY75YnuGzuWL7A+jHmZQAat8g==
X-Google-Smtp-Source: ABdhPJyXB6S2rNkAmkCC2ba1sLH1fu1Ak7x8dIgUjFoJwyDqsjp8BtR9tM1/2JjMzGtiBF17FYrtAQ==
X-Received: by 2002:a05:6a00:2247:: with SMTP id i7mr652058pfu.217.1597383437013;
        Thu, 13 Aug 2020 22:37:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 17/21] makedumpfile: Fix build with -fno-common
Date: Thu, 13 Aug 2020 22:36:53 -0700
Message-Id: <20200814053657.1701247-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...move-duplicated-variable-definitions.patch | 104 ++++++++++++++++++
 .../makedumpfile/makedumpfile_1.6.7.bb        |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
new file mode 100644
index 0000000000..49777bcee9
--- /dev/null
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
@@ -0,0 +1,104 @@
+From 399f2c9a3acd5bd913e50a4dde52dee6527b297e Mon Sep 17 00:00:00 2001
+From: Kairui Song <kasong@redhat.com>
+Date: Wed, 29 Jan 2020 13:37:13 +0800
+Subject: [PATCH] [PATCH] Remove duplicated variable definitions
+
+When building on Fedora 32 (with GCC 10), following error is observed:
+
+/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2010: multiple definition of
+ `crash_reserved_mem_nr'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2010: first defined here
+/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2009: multiple definition of
+ `crash_reserved_mem'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2009: first defined here
+/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1278: multiple definition of
+ `parallel_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1278: first defined here
+/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1265: multiple definition of
+ `splitting_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1265: first defined here
+...
+collect2: error: ld returned 1 exit status
+make: *** [Makefile:97: makedumpfile] Error 1
+
+These variables are wrongly defined multiple times. So remove the
+duplicated definitions.
+
+Upstream-Status: Backport [https://github.com/kraj/makedumpfile/commit/399f2c9a3acd5bd913e50a4dde52dee6527b297e]
+Signed-off-by: Kairui Song <kasong@redhat.com>
+Signed-off-by: Kazuhito Hagio <k-hagio-ab@nec.com>
+---
+ makedumpfile.c | 8 ++++----
+ makedumpfile.h | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/makedumpfile.c b/makedumpfile.c
+index e290fbd..ae7336a 100644
+--- a/makedumpfile.c
++++ b/makedumpfile.c
+@@ -10954,7 +10954,7 @@ check_param_for_reassembling_dumpfile(int argc, char *argv[])
+ 		return FALSE;
+ 
+ 	if ((info->splitting_info
+-	    = malloc(sizeof(splitting_info_t) * info->num_dumpfile))
++	    = malloc(sizeof(struct splitting_info) * info->num_dumpfile))
+ 	    == NULL) {
+ 		MSG("Can't allocate memory for splitting_info.\n");
+ 		return FALSE;
+@@ -11042,7 +11042,7 @@ check_param_for_creating_dumpfile(int argc, char *argv[])
+ 			return FALSE;
+ 		}
+ 		if ((info->splitting_info
+-		    = malloc(sizeof(splitting_info_t) * info->num_dumpfile))
++		    = malloc(sizeof(struct splitting_info) * info->num_dumpfile))
+ 		    == NULL) {
+ 			MSG("Can't allocate memory for splitting_info.\n");
+ 			return FALSE;
+@@ -11077,13 +11077,13 @@ check_param_for_creating_dumpfile(int argc, char *argv[])
+ 
+ 	if (info->num_threads) {
+ 		if ((info->parallel_info =
+-		     malloc(sizeof(parallel_info_t) * info->num_threads))
++		     malloc(sizeof(struct parallel_info) * info->num_threads))
+ 		    == NULL) {
+ 			MSG("Can't allocate memory for parallel_info.\n");
+ 			return FALSE;
+ 		}
+ 
+-		memset(info->parallel_info, 0, sizeof(parallel_info_t)
++		memset(info->parallel_info, 0, sizeof(struct parallel_info)
+ 							* info->num_threads);
+ 	}
+ 
+diff --git a/makedumpfile.h b/makedumpfile.h
+index 68d9691..7217407 100644
+--- a/makedumpfile.h
++++ b/makedumpfile.h
+@@ -1262,7 +1262,7 @@ struct splitting_info {
+ 	mdf_pfn_t		end_pfn;
+ 	off_t			offset_eraseinfo;
+ 	unsigned long		size_eraseinfo;
+-} splitting_info_t;
++};
+ 
+ struct parallel_info {
+ 	int			fd_memory;
+@@ -1275,7 +1275,7 @@ struct parallel_info {
+ #ifdef USELZO
+ 	lzo_bytep		wrkmem;
+ #endif
+-} parallel_info_t;
++};
+ 
+ struct ppc64_vmemmap {
+ 	unsigned long		phys;
+@@ -2006,8 +2006,8 @@ struct memory_range {
+ };
+ 
+ #define CRASH_RESERVED_MEM_NR   8
+-struct memory_range crash_reserved_mem[CRASH_RESERVED_MEM_NR];
+-int crash_reserved_mem_nr;
++extern struct memory_range crash_reserved_mem[CRASH_RESERVED_MEM_NR];
++extern int crash_reserved_mem_nr;
+ 
+ unsigned long read_vmcoreinfo_symbol(char *str_symbol);
+ int readmem(int type_addr, unsigned long long addr, void *bufptr, size_t size);
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
index 8d1676a4c6..165e192cb1 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
+    file://0001-PATCH-Remove-duplicated-variable-definitions.patch \
 "
 SRC_URI[md5sum] = "808ef840ca49ca6bfde77c097cf429f5"
 SRC_URI[sha256sum] = "e702fbdf62b4cd829a76e46f3e24eb3fc7501918b85ebdcd8baef4f53d6ee2c8"
-- 
2.28.0

