Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B05FCAC5BF
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:06 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.6892.1758954784496728425
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RRYxh1FN;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-426813b9712so18702085ab.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954783; x=1759559583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRlFsOkrhx4by6HD6wv2M5NHLC4vg8Wc1x9w9C9rvXE=;
        b=RRYxh1FNqMvtbWZsT0WbX4aPatBv8xPJrGg5jKx7OEy0ZIm0bHFoW8Dde7n4P0iiJo
         NeYdiILmCpyWrvrPZjKkyWrz2Z0gQN3jdkuoRL6C1HKIYUWQRieJIFQGMMsynUzZpnsB
         em9oo2RFU4vQwS1qVnK9pOX1vcF5lAuc+gzZ2bh+nl4cF8E7FOqAa/MMAw3K+fIVNZ1R
         LPqzuqAxmK3c6kW/79SrFuhGiD2skNUi8XB09fOzwbUykciDJ70MTEObl1jYW4X2zU22
         KsR3Q+pHGd99/7ENgD8A1D3U2gsif4ToaoetpIXB9/6lQD2j8kYm3quDLXPHpn3sPioI
         JSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954783; x=1759559583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRlFsOkrhx4by6HD6wv2M5NHLC4vg8Wc1x9w9C9rvXE=;
        b=mHewmVzK8EAq6YGOxXYsAFyBFegxB2GkUNYH17Pwtp28tRFCWPJi0SPjkGFN0oNe8Z
         d63TEyctulNyfPfs4DbjC1CsVdd1AlokDr+thTrrwb0YFXOiGocQzgN4mYamVQa1rO/k
         xGncXqKfpeqMNQz5f3wlaXlkbr+Hsavicnkf7b8v3j71Eotllp41sZL4yIaD75WEQny8
         F0xkAagKm1XIbT4HGx25EhNTUAmDGTIst4tBkSYMRpiYKs3XwJ69J4HoIG0kW2+puU+i
         B8DoPAaT7gPNa6z+fzOaXfre/WEJyuWjZWxcxdWwoTogAkoCSM7Vs3Sbm2J/0YWXcTHA
         znhw==
X-Gm-Message-State: AOJu0YwUIQh4VWaeRoJur/HckfD+jKjYe5IDye3taGr7QFKn9O81Nj10
	LJLUglBWio5H/Y5Er7w3P2x+Nh4orwh8pTo8MYTNHodP2B8qKlg07Ql6230jKg==
X-Gm-Gg: ASbGnctAA14dQJe3dijguAfZNUDdt2TWSOZIt90UmebFTzlJzUY1TQdk+7OFH5fl73b
	FcUSMGte7xBbBX9xLGOCjuitglR/rN4rx5a1KB8Kg8Zf1SJwV9JdxkuBnidBd7Qlz6hHDRl5Df6
	xRHQ9krkAKi4Cvccy3Q25ZphzVmLcIHPFxdUfreKFpjqXJQFIy/KH/T8SOYhV/wvhakImCRMz9r
	oKgwpVrqYKjed7Q39FTPHveSaAJ/+kvTF2VoRJBCq7tKuyeVV/D/I/wSYZmh/aK+8pe7ek/H1b4
	bGLJIM2Sumc0cQoTThCkidB+Hb31QYQIRd298rSMMz1hXP49Ip8dm8ZidrSRTVHifGgwjn0rfK5
	qAXf/eN45d/k1K+GSlXszwFFj8DPRIVChfKvfm4pGXt1U3K6kvKyOUXcz4goipQ==
X-Google-Smtp-Source: AGHT+IF3c6Aces0em39bbdwNfhBhpQGlzmKX2lmoZcDzBl6tR6LrHcv5WYR1HJ2oLSSYjsIvTdnJ8Q==
X-Received: by 2002:a05:6e02:3e89:b0:424:8013:c7d3 with SMTP id e9e14a558f8ab-425955bde40mr137923385ab.2.1758954783510;
        Fri, 26 Sep 2025 23:33:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:33:03 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 15/21] pahole: fix a Segmentation fault error
Date: Sat, 27 Sep 2025 18:32:10 +1200
Message-ID: <20250927063216.1865627-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119969

From: Changqing Li <changqing.li@windriver.com>

Command "pahole --btf_features=default -J" will segmentation fault when
kernel-dbg package is also installed.

$pahole --btf_features=default -J
pahole[599]: segfault at 8 ip 00007f7c92d819e2 sp 00007f7c799febe0
error 6 in libdwarves.so.1.0.0[189e2,7f7c92d72000+1c000] likely on CPU 0
(core 0, socket 0)
Code: 74 19 ff ff 48 39 dd 75 ef 4c 89 ef e8 67 19 ff ff 49 8b 7c 24 18
e8 8d 13 ff ff 49 8b 14 24 49 8b 44 24 08 4c 89 e7 45 31 e4 <48> 89 42
08 48 89 10 e8 42 19 ff ff e9 30 ff ff ff e8 58 0a ff ff
Segmentation fault (core dumped)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 403b9a1717e6309f523049abc322bbb30069b10a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...r-Fix-elf_functions-cleanup-on-error.patch | 54 +++++++++++++++++++
 .../recipes-devtools/pahole/pahole_1.29.bb    |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch

diff --git a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
new file mode 100644
index 0000000000..dad5a9646a
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
@@ -0,0 +1,54 @@
+From 6fa2b7de3e647e64c5d693aea7f3bacbfa964f53 Mon Sep 17 00:00:00 2001
+From: Ihor Solodari <ihor.solodrai@linux.dev>
+Date: Wed, 20 Aug 2025 09:00:03 +0100
+Subject: [PATCH] btf_encoder: Fix elf_functions cleanup on error
+
+When elf_functions__new() errors out and jumps to
+elf_functions__delete(), pahole segfaults on attempt to list_del() the
+elf_functions instance from a list, to which it was never added.
+
+Fix this by moving list_del() call out of elf_functions__delete().
+Remove from the list only on normal cleanup in
+elf_functions_list__clear().
+
+v1:
+https://lore.kernel.org/dwarves/979a1ac4-21d3-4384-8ce4-d10f41887088@linux.dev/
+
+Closes:
+https://lore.kernel.org/dwarves/24bcc853-533c-42ab-bc37-0c13e0baa217@windriver.com/
+Reported-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
+Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Link: https://lore.kernel.org/dwarves/acef4a0e-7d3b-4e05-b3ca-1007580f2754@linux.dev/
+Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?h=next&id=fe6738f4b46b63dcdc5b15b252a014b3eaba16a4]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ btf_encoder.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/btf_encoder.c b/btf_encoder.c
+index 511c1ea..2f8c6bb 100644
+--- a/btf_encoder.c
++++ b/btf_encoder.c
+@@ -162,7 +162,6 @@ static inline void elf_functions__delete(struct elf_functions *funcs)
+ 		free(funcs->entries[i].alias);
+ 	free(funcs->entries);
+ 	elf_symtab__delete(funcs->symtab);
+-	list_del(&funcs->node);
+ 	free(funcs);
+ }
+ 
+@@ -204,6 +203,7 @@ static inline void elf_functions_list__clear(struct list_head *elf_functions_lis
+ 
+ 	list_for_each_safe(pos, tmp, elf_functions_list) {
+ 		funcs = list_entry(pos, struct elf_functions, node);
++		list_del(&funcs->node);
+ 		elf_functions__delete(funcs);
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
index d5fa3b4746..b5110d05f5 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
@@ -11,7 +11,8 @@ COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-
 
 SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
-           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
+           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
+           file://0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch"
 
 S = "${WORKDIR}/git"
 

