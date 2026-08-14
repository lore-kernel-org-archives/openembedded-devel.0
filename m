Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB7FC5DF76
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24354.1786747562778179564
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VaK+Cjxr;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1087062b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747562; x=1787352362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySGHLcSx54B19zhkVzHd/gViSf3LxnnxHz1QDPofhiE=;
        b=VaK+Cjxrhk//bIHcOH9e0KuwWZnvBtwsBAkYZBeeLi4sA9e2SDkEjYCctvn4zuJAca
         wW+/jWVn47soOOccNOUjbrW4KZ8KXCd5nz1TE7lslsLrXfshJOTkf+c4v/DTh4oE66gC
         FxlwDCLd5xCfsd45ZgE8NxR+LVoYSdbWoElepevby4KhCNYtlRXGn70XFZSCCOqFsjEj
         Qr127ncP8rU/YEGONtDJdx8jncX+dfL6LUMy+T5I9Katqj97aQKOFHgDOba9lE/zzTjl
         sSqR/Sn4Tt1KIcAsOAJiOvdLKITpckIxw4cbC2amZjfEthirKB6BzYbwAhljrA01TVwh
         VHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747562; x=1787352362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySGHLcSx54B19zhkVzHd/gViSf3LxnnxHz1QDPofhiE=;
        b=njyO7sZ/dR8mXrBe72UhH0EllI+TPYGhGQu94l1GPKHh+QZ2SWEsWptMZ7f0Gd+MJz
         KuFuFnKzG6wTpcqvZqs4D8mdySX3QB6jQMshA8/fNKZRqDN1K5wx0H2tzxQRlMng9iF4
         deTE2wsTVC767eMdpkJ4hu/2ApfabCGVR6WG3jN95kxJNFFY5IzHvER4sPLe5ofdfyra
         3QFXyqRLzYJyrFciSymd0lZ5cQdVQEMov/rCiIhD5KfAGtgPi2pniK9FdClzVboFV7DD
         R+bAQiBbCjDs/nUZC7iBQbY1ReFkVe9nHd9LLp1f2ZGruC2/tz8fcQl3SwD+1rZNDXFa
         Ipzw==
X-Gm-Message-State: AOJu0Ywxuc3o1BudMSK/0cvYWjUIxQHa8ZOWD8Jm0Fm6wtzu5BkQ4lEf
	28sSVVN68nGvmEjEncPysEaprP5F882Yl2ve3pGlXyX2fx4BmYPaXSEEOAouz79O
X-Gm-Gg: AR+sD12w/r4eU9xhkq0axuoUQSZC8Z585n7S6mH/C9kd/Zf/nleTPg1p66zhwMCclhK
	5hBtCL3xk3CLPOt/ThzHQzlERhkDgdUHMQ5v9rxmQCm1IylMO/0kTU3bHXBh30cLpJVivT1phIq
	TA4VSjocMAj9CLk34mO9KEsZ8MPIaQKJiJ2vGhLDMM3DnAKnbJVwvhbzBrj8pRqhzMspENhIkph
	fdueQzkIJb+w+xF+uKoTWk55kEhRejyI4lZ8jARgjDW1hAjTTiyMAKis+L7eazqiIvQSBZeSdoK
	VfV14zvTcAAmxVInPgPv6Bkel/ojGgAH2VTB2+bzCx0SLPjF5a4GSNwHd1km/njwGhtzJUznBOL
	06zaj9LvhhzSeLBVMeIVCa0KOs6aooFIJ17FALF7Sonw47/JS8ppiCyNcppj5OtwNVnB+60RjMf
	ZwJHBzT2i9xQV5tbbb6E9zZ+vnl6duUHD9A7x4M2G3bsMQlZ26i36oxohNSoT9w4R0rCuzDCZyU
	R+0OapAsI93f2We3Y7kQlTdZ5SvinEs+ckxaX5ZIdTDTBFYO8HbMfVYd+A2gKWohbCjIdO8FDVX
	gwfhE3P7krwWXQdEVLuskk0FnZM2fj7YmQnDG1+4XX3ksOTHbAxlYJ3SzZ5aMBmbsWwM9eMhja4
	iTI2Yom6xi6XU7scAihUoqohr1yaDU3PaEYRguZIu0X9RUQ==
X-Received: by 2002:a05:6a21:6110:b0:3cc:1d2b:2ac3 with SMTP id adf61e73a8af0-3cc71d195cdmr10600308637.26.1786747562033;
        Fri, 14 Aug 2026 15:46:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 017/109] switchtec-user: upgrade 4.3 -> 4.4
Date: Fri, 14 Aug 2026 15:44:03 -0700
Message-ID: <20260814224539.1523174-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129081

Adds Gen6 support across the CLI and library (new OSA sub-commands,
status query and capture-control variants) and reworks
switchtec_osa_capture_data() to fill in a caller supplied
switchtec_osa_capture_data structure rather than printing directly.

That rework replaced the run-time sized reply buffer, which 4.3 built
from a flexible array member plus alloca(), with a variable length array
declared as a struct member. That is a GCC-only extension which clang
rejects outright ('variable length array in structure' extension will
never be supported), so add a patch restoring the portable flexible
array member form and passing the computed reply size to switchtec_cmd().

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...use-a-variable-length-array-in-a-str.patch | 123 ++++++++++++++++++
 ...htec-user_4.3.bb => switchtec-user_4.4.bb} |   6 +-
 2 files changed, 127 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/switchtec-user/switchtec-user/0001-lib-diag-do-not-use-a-variable-length-array-in-a-str.patch
 rename meta-oe/recipes-support/switchtec-user/{switchtec-user_4.3.bb => switchtec-user_4.4.bb} (74%)

diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-lib-diag-do-not-use-a-variable-length-array-in-a-str.patch b/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-lib-diag-do-not-use-a-variable-length-array-in-a-str.patch
new file mode 100644
index 0000000000..a347d0799e
--- /dev/null
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-lib-diag-do-not-use-a-variable-length-array-in-a-str.patch
@@ -0,0 +1,123 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 4 Aug 2026 00:00:00 -0700
+Subject: [PATCH] lib/diag: do not use a variable length array in a struct
+
+switchtec_osa_capture_data() declares the MRPC reply buffer as a struct
+whose last member is a VLA:
+
+	uint32_t entry_dwords[osa_data_entries_out.entries_remaining * 6];
+
+A variably-modified type as a struct member is a GCC extension that
+clang has never implemented, so the build fails with:
+
+  lib/diag.c:2454:12: error: fields must have a constant size:
+      'variable length array in structure' extension will never be supported
+
+v4.3 expressed the same buffer as a flexible array member sized at run
+time with alloca(), which is portable; that idiom was lost when this
+function was reworked to fill in a switchtec_osa_capture_data structure.
+Restore it: declare entry_dwords[] as a flexible array member, allocate
+the struct with alloca(), and pass the computed size to switchtec_cmd()
+instead of sizeof() so the reply length is unchanged.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+diff --git a/lib/diag.c b/lib/diag.c
+index 62b2b7d..63769ee 100644
+--- a/lib/diag.c
++++ b/lib/diag.c
+@@ -36,6 +36,7 @@
+ #include "switchtec/switchtec.h"
+ #include "switchtec/utils.h"
+ 
++#include <alloca.h>
+ #include <errno.h>
+ #include <math.h>
+ #include <string.h>
+@@ -2442,7 +2443,7 @@ int switchtec_osa_capture_data(struct switchtec_dev *dev, int stack_id,
+ 		return ret;
+ 	}
+ 
+-	struct {
++	struct osa_data_read_out {
+ 		uint8_t entries_read;
+ 		uint8_t stack_id;
+ 		uint8_t lane;
+@@ -2451,11 +2452,17 @@ int switchtec_osa_capture_data(struct switchtec_dev *dev, int stack_id,
+ 		uint16_t entries_remaining;
+ 		uint16_t wrap;
+ 		uint16_t reserved;
+-		uint32_t entry_dwords[osa_data_entries_out.entries_remaining * 6];
+-	} osa_data_read_out;
++		uint32_t entry_dwords[];
++	} *osa_data_read_out;
++	size_t osa_data_read_out_size;
++
++	osa_data_read_out_size = sizeof(*osa_data_read_out) +
++				 osa_data_entries_out.entries_remaining * 6 *
++				 sizeof(uint32_t);
++	osa_data_read_out = alloca(osa_data_read_out_size);
+ 
+-	osa_data_read_out.entries_remaining = osa_data_entries_out.entries_remaining;
+-	osa_data_read_out.next_entry = osa_data_entries_out.next_entry;
++	osa_data_read_out->entries_remaining = osa_data_entries_out.entries_remaining;
++	osa_data_read_out->next_entry = osa_data_entries_out.next_entry;
+ 
+ 	if (data) {
+ 		data->stack_id = stack_id;
+@@ -2475,31 +2482,31 @@ int switchtec_osa_capture_data(struct switchtec_dev *dev, int stack_id,
+ 	uint32_t osa_data_dwords[4];
+ 	int osa_data_idx = 0;
+ 
+-	while (osa_data_read_out.entries_remaining != 0) {
++	while (osa_data_read_out->entries_remaining != 0) {
+ 		if (data && total_entries >= SWITCHTEC_OSA_MAX_ENTRIES)
+ 			break;
+ 
+-		osa_data_read_in.num_entries = osa_data_read_out.entries_remaining;
+-		osa_data_read_in.start_entry = osa_data_read_out.next_entry;
++		osa_data_read_in.num_entries = osa_data_read_out->entries_remaining;
++		osa_data_read_in.start_entry = osa_data_read_out->next_entry;
+ 
+ 		ret = switchtec_cmd(dev, MRPC_ORDERED_SET_ANALYZER,
+ 				    &osa_data_read_in, sizeof(osa_data_read_in),
+-				    &osa_data_read_out, sizeof(osa_data_read_out));
++				    osa_data_read_out, osa_data_read_out_size);
+ 		if (ret)
+ 			return -1;
+ 
+-		for (int i = total_dword; i < total_dword + (osa_data_read_out.entries_read * 6); i++) {
++		for (int i = total_dword; i < total_dword + (osa_data_read_out->entries_read * 6); i++) {
+ 			if (curr_entry_dword < 4) {
+-				osa_data_dwords[osa_data_idx++] = osa_data_read_out.entry_dwords[i];
++				osa_data_dwords[osa_data_idx++] = osa_data_read_out->entry_dwords[i];
+ 			} else if (curr_entry_dword == 4) {
+-				timestamp_lower = (osa_data_read_out.entry_dwords[i] >> 22) & 0x3FF;
+-				timestamp_upper = (osa_data_read_out.entry_dwords[i+1] & 0x1A);
++				timestamp_lower = (osa_data_read_out->entry_dwords[i] >> 22) & 0x3FF;
++				timestamp_upper = (osa_data_read_out->entry_dwords[i+1] & 0x1A);
+ 				timestamp = timestamp_upper | timestamp_lower;
+ 
+-				link_rate = osa_data_read_out.entry_dwords[i] & 0x3;
+-				counter = (osa_data_read_out.entry_dwords[i] >> 3) & 0x12;
+-				trigger	= (osa_data_read_out.entry_dwords[i+1] >> 28) & 0x1;
+-				os_droppped = (osa_data_read_out.entry_dwords[i+1] >> 29) & 0x1;
++				link_rate = osa_data_read_out->entry_dwords[i] & 0x3;
++				counter = (osa_data_read_out->entry_dwords[i] >> 3) & 0x12;
++				trigger	= (osa_data_read_out->entry_dwords[i+1] >> 28) & 0x1;
++				os_droppped = (osa_data_read_out->entry_dwords[i+1] >> 29) & 0x1;
+ 
+ 				if (data && total_entries < SWITCHTEC_OSA_MAX_ENTRIES) {
+ 					data->entries[total_entries].timestamp = timestamp;
+@@ -2522,7 +2529,7 @@ int switchtec_osa_capture_data(struct switchtec_dev *dev, int stack_id,
+ 				curr_entry_dword = 0;
+ 			}
+ 		}
+-		total_dword += osa_data_read_out.entries_read;
++		total_dword += osa_data_read_out->entries_read;
+ 	}
+ 
+ 	return ret;
diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.4.bb
similarity index 74%
rename from meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb
rename to meta-oe/recipes-support/switchtec-user/switchtec-user_4.4.bb
index 050c9d1c43..61d431178a 100644
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.3.bb
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.4.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6b07c89629cff2990d2e8e1f4c2382"
 
 DEPENDS = "ncurses openssl"
 
-SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "abe2a1d2367a118469a7b94bc4dd856aaf856eec"
+SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-lib-diag-do-not-use-a-variable-length-array-in-a-str.patch \
+           "
+SRCREV = "d995512f3bf1ceb98eefada813642d5ba5d62cd1"
 
 
 inherit autotools-brokensep pkgconfig

