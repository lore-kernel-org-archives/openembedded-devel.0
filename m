Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB42CC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 06:05:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5339.1785305104261262422
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 23:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oyCEyKCt;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc97653887so7719415ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 23:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305104; x=1785909904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiD5mQVradz0s+5nZUCuKiqIkNVz63sXjUMYe8FI2LI=;
        b=oyCEyKCt7keezvzb3RUcViPHiF23bX5B+MJhuWztqL91pQS53aCtwj2SUviuhfvhES
         oCV5KCUpOkpy+o+oA1F/4UX8YnzG5xvKfnkspqI2+/ZuLiQmNGE4t/9+D8DWS1+mzYpN
         LLAEtI12BqI5u8+nv7Ye1ZcBaApOxpfDpagUSR8f+b+Rkh3UoQ0dmMFpG+6Ni94QxsQW
         CiabzOJ5uE7N/RLBDm3c69wWhoan/kRYoXRG1NYM2UN44ZTGDEMZDkS7GyCniIlkycaT
         wSFSoQqEQnCUPeyvVneLdUE1Bl5JJn6DeirnDt4559fbfIlenxh90vPsiP5ogMy7vgbF
         OFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305104; x=1785909904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiD5mQVradz0s+5nZUCuKiqIkNVz63sXjUMYe8FI2LI=;
        b=QDqavLMfY0+3Djk4X1t6QdVEKbm2v21mHP63iUdN/KW3R5kEczsp6euLcpU/546CM4
         0hv676lIaoqj+T8qBnhEhfk/bGoHQk29oin3BaFNXujClKw5EVGKc2ndSwOGJL3Bn+GN
         F7C87dwthOWd5x78KK1rb4K7Mk273ozBjGtOrNYaxm6LmSQlbFmez2+Ff3RAQzWVOpUL
         PKxDzhhahxuFSkdKWS/8wx0LguJ6eVGQk8xeSnCzM9YrOBmXhvlzbNC5ZECVCAwe8jyt
         50UP2avfX3v62ED2Ye1HxW+/pBX2w5XJQZmIzFi1W0sqyTrUR7Ik5VaVOz+tclsk3Zy3
         +V4w==
X-Gm-Message-State: AOJu0Yy2gz7T3Q7C33sMF+c7diF6LAbVNbIryHBf0fCwbUQRAIiLchoS
	ujAz3kYpwr8z+mqLUH9Q72aQb6OjZwQMW65/J5fRiJEiQ4Ozbc8/TSD5J90mqQ==
X-Gm-Gg: AR+sD13HsuAcJo3vYLthh987DnlTC2c7RZdjoVfgYDXrMm7C4F/sGxCnDB71OeRstIq
	LIAvdzHBX2uQQdtc/ZjLTqCgCbAZuoWoIRcOkVazetZuOBxdBbmss41K/qrbueMbTKa2mhtDdey
	ZG04yoqAgfOmsMv7G7l5YOu5iynhayECGTfzaDCgLbmZhw+c/mCK1wcyne6UlRIdkNE97/kcieM
	mP5GqbZfin2xgsHUDpewshI4jgPCqYITLigUFBVuWnBvz6BVbsQEUG19JR/gmyga+SQRVEPPdYE
	q4aiFMY2ixU47w5cCdedasBKikB4On2KZL1cXQHKGFJ1byBUTicGaqSyFG5oGyzyiG4rxdDCvu+
	6xmfdWEDywZgpSexTcUcrqk42rc++Bs4ShmonYKGssbWaoOztWklGlUsZV6ly3Gxw/UYWKiu2ZO
	HSH3dJyowMe4IPoT8MEIGNxF7x81hCaTSpWkNYr20tOHzw9IdUQt4XXDvoGyWFj0QiKP07zXDs0
	JiPu6Vz1prg1CVaNvlZWk0J9/9ch9Q1jMYFs0M18zpqiAnY9IHYvkT+hOPoJZMkycSbi7RT2Pnr
	URfpf2XlmgmU8W56Xjm2R50wfYIti5nzQS7l08Cwy783AswYouSsUrKg0LujYYQWJ0D3r1bVwkL
	eJg9GDcL8KaIC
X-Received: by 2002:a17:90b:2f4b:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-38f6a5181b3mr5391309a91.20.1785305103535;
        Tue, 28 Jul 2026 23:05:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412a92bsm2278342a91.5.2026.07.28.23.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:05:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 5/5] exfatprogs: upgrade 1.4.1 -> 1.4.2
Date: Tue, 28 Jul 2026 23:04:55 -0700
Message-ID: <20260729060455.3993973-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
References: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 06:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128548

Upstream changes (NEWS):
 * dump.exfat: prevent a heap buffer overflow in name parsing.
 * Install lsdosattr and chdosattr in /bin instead of /sbin (covered by
   the default FILES:${PN}, so packaging is unaffected).
 * libexfat: use __builtin_popcountl() throughout and add an internal
   exfat_count_used_clusters() helper (static lib, no ABI impact).

No dependency or build-system changes; configure.ac is unchanged, so
DEPENDS and the ptest install steps stay as-is.

While enabling the ptest image (meta-filesystems-image-ptest-exfatprogs)
on qemux86-64, the upcase_table test cases (present since 1.4.0, so this
is a pre-existing failure now exercised) failed because they used
`truncate` and `xxd -r - <file>`, which are unavailable in a BusyBox
core-image-minimal rootfs:

  truncate: command not found
  FAIL: to create corrupted image

Add 0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch,
which rewrites those scripts to size the image with dd and poke the
corrupted bytes with printf|dd (tools already present in the base
image). ptest result on qemux86-64 is now 23 of 23 passing.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...le-use-dd-printf-instead-of-truncate.patch | 230 ++++++++++++++++++
 ...xfatprogs_1.4.1.bb => exfatprogs_1.4.2.bb} |   3 +-
 2 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/exfatprogs/exfatprogs/0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.4.1.bb => exfatprogs_1.4.2.bb} (88%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs/0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs/0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch
new file mode 100644
index 0000000000..cac60c2325
--- /dev/null
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs/0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch
@@ -0,0 +1,230 @@
+From de421347db0026110c4997ef48bdd16f50a5a65b Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 29 Jul 2026 05:34:27 +0000
+Subject: [PATCH] tests: upcase_table: use dd/printf instead of truncate and
+ xxd -r
+
+The upcase_table test scripts used `truncate` (coreutils) and
+`xxd -r - <file>` to build and corrupt the test image. In minimal
+images (e.g. Yocto core-image-minimal + BusyBox) `truncate` is often
+absent and BusyBox's `xxd` applet does not implement the two-operand
+`xxd -r - <file>` revert form, so the scripts fail with:
+
+  truncate: command not found
+  FAIL: to create corrupted image
+
+Every xxd/truncate use here reduces to "size the image to 32 MiB" and
+"write one constant byte at a computed offset", both of which `dd`
+(with printf for the byte value) does portably with tools already
+present in a base rootfs.
+
+Upstream-Status: Submitted [https://github.com/exfatprogs/exfatprogs]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ ...le-use-dd-printf-instead-of-truncate.patch | 111 ++++++++++++++++++
+ .../0001-TableChecksum-and-upcase-table.sh    |   6 +-
+ tests/upcase_table/0002-FirstCluster.sh       |   4 +-
+ tests/upcase_table/0003-DataLength.sh         |   6 +-
+ tests/upcase_table/0004-EntryType.sh          |   4 +-
+ 5 files changed, 121 insertions(+), 10 deletions(-)
+ create mode 100644 out/0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch
+
+diff --git a/out/0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch b/out/0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch
+new file mode 100644
+index 0000000..2cec31f
+--- /dev/null
++++ b/out/0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch
+@@ -0,0 +1,111 @@
++From 65d12741714de046a37ef3cf4ae2c1660235901a Mon Sep 17 00:00:00 2001
++From: Khem Raj <khem.raj@oss.qualcomm.com>
++Date: Wed, 29 Jul 2026 05:34:27 +0000
++Subject: [PATCH] tests: upcase_table: use dd/printf instead of truncate and
++ xxd -r
++
++The upcase_table test scripts used `truncate` (coreutils) and
++`xxd -r - <file>` to build and corrupt the test image. In minimal
++images (e.g. Yocto core-image-minimal + BusyBox) `truncate` is often
++absent and BusyBox's `xxd` applet does not implement the two-operand
++`xxd -r - <file>` revert form, so the scripts fail with:
++
++  truncate: command not found
++  FAIL: to create corrupted image
++
++Every xxd/truncate use here reduces to "size the image to 32 MiB" and
++"write one constant byte at a computed offset", both of which `dd`
++(with printf for the byte value) does portably with tools already
++present in a base rootfs.
++
++Upstream-Status: Submitted [https://github.com/exfatprogs/exfatprogs]
++
++Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
++---
++ tests/upcase_table/0001-TableChecksum-and-upcase-table.sh | 6 +++---
++ tests/upcase_table/0002-FirstCluster.sh                   | 4 ++--
++ tests/upcase_table/0003-DataLength.sh                     | 6 +++---
++ tests/upcase_table/0004-EntryType.sh                      | 4 ++--
++ 4 files changed, 10 insertions(+), 10 deletions(-)
++
++diff --git a/tests/upcase_table/0001-TableChecksum-and-upcase-table.sh b/tests/upcase_table/0001-TableChecksum-and-upcase-table.sh
++index 57390e1..507d0c2 100755
++--- a/tests/upcase_table/0001-TableChecksum-and-upcase-table.sh
+++++ b/tests/upcase_table/0001-TableChecksum-and-upcase-table.sh
++@@ -3,7 +3,7 @@
++ 
++ img=${1:-"exfat.img"}
++ 
++-truncate -s 32M $img
+++dd if=/dev/zero of=$img bs=1048576 count=32 2>/dev/null
++ mkfs.exfat $img >> /dev/null
++ dump_info=$(dump.exfat $img)
++ clu_heap_off=$(echo "${dump_info}" | grep "Cluster Heap Offset (sector offset):" | cut -d ':' -f 2)
++@@ -14,8 +14,8 @@ upcase_entry_off=$(echo "${dump_info}" | grep "Upcase table entry position:" | c
++ 
++ # Make TableChecksum field corrupted
++ checksum_off=$((${upcase_entry_off}+4))
++-echo "$(printf "%x" $checksum_off):0xff" | xxd -r - $img
+++printf '\377' | dd of=$img bs=1 seek=$checksum_off conv=notrunc 2>/dev/null
++ 
++ # Make upcase table corrupted
++ upcase_off=$(((${upcase_clu} - 2) * ${clu_size} + ${clu_heap_off} * ${sector_size}))
++-echo "$(printf "%x" $upcase_off):0x7F" | xxd -r - $img
+++printf '\177' | dd of=$img bs=1 seek=$upcase_off conv=notrunc 2>/dev/null
++diff --git a/tests/upcase_table/0002-FirstCluster.sh b/tests/upcase_table/0002-FirstCluster.sh
++index 9dfb1dc..ae84555 100755
++--- a/tests/upcase_table/0002-FirstCluster.sh
+++++ b/tests/upcase_table/0002-FirstCluster.sh
++@@ -3,11 +3,11 @@
++ 
++ img=${1:-"exfat.img"}
++ 
++-truncate -s 32M $img
+++dd if=/dev/zero of=$img bs=1048576 count=32 2>/dev/null
++ mkfs.exfat $img >> /dev/null
++ dump_info=$(dump.exfat $img)
++ upcase_entry_off=$(echo "${dump_info}" | grep "Upcase table entry position:" | cut -d ':' -f 2)
++ 
++ # Make FirstCluster field corrupted
++ start_clu_off=$((${upcase_entry_off}+20))
++-echo "$(printf "%x" $start_clu_off):0x00" | xxd -r - $img
+++printf '\000' | dd of=$img bs=1 seek=$start_clu_off conv=notrunc 2>/dev/null
++diff --git a/tests/upcase_table/0003-DataLength.sh b/tests/upcase_table/0003-DataLength.sh
++index 68742b2..661d218 100755
++--- a/tests/upcase_table/0003-DataLength.sh
+++++ b/tests/upcase_table/0003-DataLength.sh
++@@ -3,7 +3,7 @@
++ 
++ img=${1:-"exfat.img"}
++ 
++-truncate -s 32M $img
+++dd if=/dev/zero of=$img bs=1048576 count=32 2>/dev/null
++ mkfs.exfat $img >> /dev/null
++ 
++ dump_info=$(dump.exfat $img)
++@@ -11,5 +11,5 @@ upcase_entry_off=$(echo "${dump_info}" | grep "Upcase table entry position:" | c
++ size_off=$((${upcase_entry_off}+24))
++ 
++ # Make DataLength field corrupted
++-echo "$(printf "%x" $size_off):0x00" | xxd -r - $img
++-echo "$(printf "%x" $(($size_off + 1))):0x00" | xxd -r - $img
+++printf '\000' | dd of=$img bs=1 seek=$size_off conv=notrunc 2>/dev/null
+++printf '\000' | dd of=$img bs=1 seek=$(($size_off + 1)) conv=notrunc 2>/dev/null
++diff --git a/tests/upcase_table/0004-EntryType.sh b/tests/upcase_table/0004-EntryType.sh
++index b34661f..74d40a7 100755
++--- a/tests/upcase_table/0004-EntryType.sh
+++++ b/tests/upcase_table/0004-EntryType.sh
++@@ -3,11 +3,11 @@
++ 
++ img=${1:-"exfat.img"}
++ 
++-truncate -s 32M $img
+++dd if=/dev/zero of=$img bs=1048576 count=32 2>/dev/null
++ mkfs.exfat $img >> /dev/null
++ 
++ dump_info=$(dump.exfat $img)
++ upcase_entry_off=$(echo "${dump_info}" | grep "Upcase table entry position:" | cut -d ':' -f 2)
++ 
++ # Make EntryType field corrupted
++-echo "$(printf "%x" $upcase_entry_off):0x7F" | xxd -r - $img
+++printf '\177' | dd of=$img bs=1 seek=$upcase_entry_off conv=notrunc 2>/dev/null
+diff --git a/tests/upcase_table/0001-TableChecksum-and-upcase-table.sh b/tests/upcase_table/0001-TableChecksum-and-upcase-table.sh
+index 57390e1..507d0c2 100755
+--- a/tests/upcase_table/0001-TableChecksum-and-upcase-table.sh
++++ b/tests/upcase_table/0001-TableChecksum-and-upcase-table.sh
+@@ -3,7 +3,7 @@
+ 
+ img=${1:-"exfat.img"}
+ 
+-truncate -s 32M $img
++dd if=/dev/zero of=$img bs=1048576 count=32 2>/dev/null
+ mkfs.exfat $img >> /dev/null
+ dump_info=$(dump.exfat $img)
+ clu_heap_off=$(echo "${dump_info}" | grep "Cluster Heap Offset (sector offset):" | cut -d ':' -f 2)
+@@ -14,8 +14,8 @@ upcase_entry_off=$(echo "${dump_info}" | grep "Upcase table entry position:" | c
+ 
+ # Make TableChecksum field corrupted
+ checksum_off=$((${upcase_entry_off}+4))
+-echo "$(printf "%x" $checksum_off):0xff" | xxd -r - $img
++printf '\377' | dd of=$img bs=1 seek=$checksum_off conv=notrunc 2>/dev/null
+ 
+ # Make upcase table corrupted
+ upcase_off=$(((${upcase_clu} - 2) * ${clu_size} + ${clu_heap_off} * ${sector_size}))
+-echo "$(printf "%x" $upcase_off):0x7F" | xxd -r - $img
++printf '\177' | dd of=$img bs=1 seek=$upcase_off conv=notrunc 2>/dev/null
+diff --git a/tests/upcase_table/0002-FirstCluster.sh b/tests/upcase_table/0002-FirstCluster.sh
+index 9dfb1dc..ae84555 100755
+--- a/tests/upcase_table/0002-FirstCluster.sh
++++ b/tests/upcase_table/0002-FirstCluster.sh
+@@ -3,11 +3,11 @@
+ 
+ img=${1:-"exfat.img"}
+ 
+-truncate -s 32M $img
++dd if=/dev/zero of=$img bs=1048576 count=32 2>/dev/null
+ mkfs.exfat $img >> /dev/null
+ dump_info=$(dump.exfat $img)
+ upcase_entry_off=$(echo "${dump_info}" | grep "Upcase table entry position:" | cut -d ':' -f 2)
+ 
+ # Make FirstCluster field corrupted
+ start_clu_off=$((${upcase_entry_off}+20))
+-echo "$(printf "%x" $start_clu_off):0x00" | xxd -r - $img
++printf '\000' | dd of=$img bs=1 seek=$start_clu_off conv=notrunc 2>/dev/null
+diff --git a/tests/upcase_table/0003-DataLength.sh b/tests/upcase_table/0003-DataLength.sh
+index 68742b2..661d218 100755
+--- a/tests/upcase_table/0003-DataLength.sh
++++ b/tests/upcase_table/0003-DataLength.sh
+@@ -3,7 +3,7 @@
+ 
+ img=${1:-"exfat.img"}
+ 
+-truncate -s 32M $img
++dd if=/dev/zero of=$img bs=1048576 count=32 2>/dev/null
+ mkfs.exfat $img >> /dev/null
+ 
+ dump_info=$(dump.exfat $img)
+@@ -11,5 +11,5 @@ upcase_entry_off=$(echo "${dump_info}" | grep "Upcase table entry position:" | c
+ size_off=$((${upcase_entry_off}+24))
+ 
+ # Make DataLength field corrupted
+-echo "$(printf "%x" $size_off):0x00" | xxd -r - $img
+-echo "$(printf "%x" $(($size_off + 1))):0x00" | xxd -r - $img
++printf '\000' | dd of=$img bs=1 seek=$size_off conv=notrunc 2>/dev/null
++printf '\000' | dd of=$img bs=1 seek=$(($size_off + 1)) conv=notrunc 2>/dev/null
+diff --git a/tests/upcase_table/0004-EntryType.sh b/tests/upcase_table/0004-EntryType.sh
+index b34661f..e7098b4 100755
+--- a/tests/upcase_table/0004-EntryType.sh
++++ b/tests/upcase_table/0004-EntryType.sh
+@@ -3,11 +3,11 @@
+ 
+ img=${1:-"exfat.img"}
+ 
+-truncate -s 32M $img
++dd if=/dev/zero of=$img bs=1048576 count=32 2>/dev/null
+ mkfs.exfat $img >> /dev/null
+ 
+ dump_info=$(dump.exfat $img)
+ upcase_entry_off=$(echo "${dump_info}" | grep "Upcase table entry position:" | cut -d ':' -f 2)
+ 
+ # Make EntryType field corrupted
+-echo "$(printf "%x" $upcase_entry_off):0x7F" | xxd -r - $img
++printf '\177' | dd of=$img bs=1 seek=$((upcase_entry_off)) conv=notrunc 2>/dev/null
diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.1.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb
similarity index 88%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.1.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb
index 89603a8c5b..47c06e683f 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.1.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb
@@ -12,8 +12,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch \
            file://run-ptest"
-SRC_URI[sha256sum] = "85c133e8802cbc1191bff2477a67b376192dfb9f94bb254c05dbae79fd958f2e"
+SRC_URI[sha256sum] = "47c7c8ddeccbf50d39b903353f2cb3df79134367a4fd764fe2ce3755ff5877bf"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"

