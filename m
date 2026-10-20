Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9506.1792507814517479843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 07:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VGU87lX5;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1517bda04a0so2811079c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792507814; x=1793112614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jF3lMdLK3IMXNBW1zsaMRURriloezRqYE5QDtaZX3Mw=;
        b=VGU87lX5psFeyn1m4P6pZXBHwURxu7QbZekACVNPLtZryljWTr2+dx65jfqzo1Ed6i
         zo47lGDoFsc9ojClkmQVWeoemQ27wZGN+BCFEH5mo4IPng3aqe9HkyNAA9KRR1CaseKZ
         zdZ9QgtF9P9qq0To3YjRD/ZxbqjHeYIdiP24OZhd51QueiRqgggIqXD52y9ptgnuRsPq
         Y8ZIEf6+7WIiL4KxDHBb0o44QNJHyjCBWF8Zwr+qNI8I0ytdpZFRfokRF3GFIOy8Z38V
         Shy4Kx+gGsCjUsD3RftTI6rba/Hf1zpvYhJxkwYunZq/LK4tU4hJdUvNQGtkRwm6pUAe
         Kl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507814; x=1793112614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jF3lMdLK3IMXNBW1zsaMRURriloezRqYE5QDtaZX3Mw=;
        b=FPaD5IoKedlC/c3gQym1/RZZgITMw0nO2xePvMVE8zCGKKex9CM/zRsKpm8f8I23tc
         76+hY25Ph4G83guHFR9jITgnkH9xX27K39ayOvuhW2K/YIgou2vHANcJgaIodsiwRDqC
         yjT7RhW4nKNgnv91lY9JC1E2B2Z+cMbDErA2smBM2ydGUygAnON9mzFlNnOkKjFtdd1z
         qLjCx57RHlhOubEZuKctROpB7XrD6yxUO9scybErvy2JXCkQ0R/E51nKKLKVZ2YowExx
         xraKD/jOcX4nOrfyW4sxQ2vw1bV1vBLYFQE5p0UGSn0tgrKa9u2lUt8NqJRfhueu9ZPu
         Q9Ew==
X-Gm-Message-State: AFq9FYK5VgSJjKDHOXoyrCRhFJgcpQX3CXiL/yhzfklySdoe6ZU5kWAX
	QQ3PnIbCjwoBMePUyL6E3J0ghbqMAr0+o68f6GqSNdaGlOghhdie6JX87FdU6DQb4Jw=
X-Gm-Gg: AYBFou2V2EpVxP14EMZi3FuGyJlVmivAl6F56awy+xi3cKxF96n9RvGAr2uqw+Yff5D
	tiA09THP1vpqKN/YrPC/EgEsig+k3gdymDBc+kHa0LcKkseEaKqRZss/bI4JQ1vP/0LhRvk7hIF
	ABRUm9LbPDMb9I3Qs8buMWZ0n61l692cJo5/2mZQKDjFrcYrlRs38xeDImOn5P6NjJmxmX89rnM
	3qDm4CVz93eQblPCYF5zUqFzroQYsz+dic0aKYC2qBgFSkNKl630Q0ZOlQjyLPOHm1tmUUnXvCG
	YzQNLqfb4vL9b0iDqVrXPM5HD7HbMCGFBm7Kw6wWP1oI70T3dfpeLKsYlSLayZ8j3T1Mnx/qucw
	5SERAL96XcHQfjV22a65US2JNb8I+iUEq5idtrk8QlWmOnpqaDM93q9YplsWmfC2PqXULmIx12K
	vUSYKyocus9HlsSdjQqAkgUB/88wdE+Ebw30bXWcU5WDh4UywBpMhVObqqXYn4AepuqSF21zMcT
	Kt4CQVKmGXkEj3IAItwuSV24m3/YxodIxA3opV5mO075aGmLVw0mddLQHqT2dWrS3r+dEpKeWZW
	SW8lM+PUHZFBigDdCA4yerY1zUEFZ3VK64vDyrO5Q7ahF4kizd1AkyxcP63KCSaA7pXid+v85ny
	H+PvO3rnZ+3rwNQ4jwFyQoiFfn8NglJ8VVoHopenkooNCAtYM+sfwun0ausbimlCstvBFYFcIuS
	95fczh8EgFPkHYz2Ws36LY9rWZ5a06li5or/KWmrRuqXezLlp5ln1l3/Jb
X-Received: by 2002:a05:701b:42d1:20b0:15e:9126:c60f with SMTP id a92af1059eb24-18512e25085mr16365079c88.29.1792507813438;
        Tue, 20 Oct 2026 07:50:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm43888996c88.12.2026.10.20.07.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:50:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/3] leancrypto: Fix FIPS integrity digest generation when cross compiling
Date: Tue, 20 Oct 2026 07:50:06 -0700
Message-ID: <20261020145007.2409602-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020145007.2409602-1-khem.raj@oss.qualcomm.com>
References: <20261020145007.2409602-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 14:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131176
Content-Type: text/plain; charset="utf-8"

The script that inserts the FIPS integrity digest into
libleancrypto-fips runs the build host's objcopy, which cannot read the
target ELF file, and it hides the failure because "exit $?" after echo
returns 0. The library is then installed with the placeholder digest,
its integrity self-test fails at load time and all algorithms are put
into the error state.

Make the script use $OBJCOPY, which points to the target objcopy, keep
the exit status of failing commands, and tolerate a missing .init
section which llvm-objcopy otherwise errors out on.

Tested by loading the riscv64 musl library under qemu-riscv64: the
integrity test now passes and FIPS140Mode is reported as true.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...lder-Use-OBJCOPY-and-report-failures.patch | 96 +++++++++++++++++++
 .../leancrypto/leancrypto_1.9.1.bb            |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/leancrypto/files/0003-FIPS-checker-builder-Use-OBJCOPY-and-report-failures.patch

diff --git a/meta-oe/recipes-crypto/leancrypto/files/0003-FIPS-checker-builder-Use-OBJCOPY-and-report-failures.patch b/meta-oe/recipes-crypto/leancrypto/files/0003-FIPS-checker-builder-Use-OBJCOPY-and-report-failures.patch
new file mode 100644
index 0000000000..4aa2432db6
--- /dev/null
+++ b/meta-oe/recipes-crypto/leancrypto/files/0003-FIPS-checker-builder-Use-OBJCOPY-and-report-failures.patch
@@ -0,0 +1,96 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 19 Oct 2026 23:09:52 -0700
+Subject: [PATCH] FIPS checker builder: Use $OBJCOPY and report failures
+
+The script that inserts the FIPS integrity digest into leancrypto-fips
+runs the build machine's objcopy. When cross compiling, that objcopy
+usually cannot read the target ELF file. The failure is not noticed
+either: "exit $?" after echo returns the status of echo, so the
+script exits 0, and the library is installed with the placeholder
+digest. At runtime the integrity test then fails and all algorithms
+are put into the error state:
+
+  ERROR: objcopy command failed: 0
+
+Use $OBJCOPY when set, as cross build environments export the objcopy
+for the target there, and keep the exit status so errors fail the
+build.
+
+llvm-objcopy fails when a section to dump does not exist, and some C
+libraries (e.g. musl on RISC-V) provide no .init section. Extract the
+init section separately and use an empty file when it is not present,
+which matches the empty range the linker script provides for it.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ addon/fips_integrity_checker_elf_generator.sh | 34 +++++++++++++------
+ 1 file changed, 23 insertions(+), 11 deletions(-)
+
+diff --git a/addon/fips_integrity_checker_elf_generator.sh b/addon/fips_integrity_checker_elf_generator.sh
+index 10628f5..1675f23 100755
+--- a/addon/fips_integrity_checker_elf_generator.sh
++++ b/addon/fips_integrity_checker_elf_generator.sh
+@@ -9,7 +9,7 @@ RODATASEGMENT=".lc_fips_rodata"
+ FIPSDATASEGMENT=".lc_fips_integrity_data"
+ SECOUTFILE="extracted_sections.digest"
+
+-OBJCOPY="objcopy"
++OBJCOPY="${OBJCOPY:-objcopy}"
+ CAT="cat"
+ CUT="cut"
+
+@@ -43,30 +43,42 @@ touch $RODATASEGMENT
+ # Extract sections
+ $OBJCOPY							\
+  --dump-section $TEXTSEGMENT=$TEXTSEGMENT			\
+- --dump-section $INITSEGMENT=$INITSEGMENT			\
+  --dump-section $RODATASEGMENT=$RODATASEGMENT			\
+- $SOFILE 2>/dev/null
++ $SOFILE
++ret=$?
++if [ $ret -ne 0 ]
++then
++	echo "ERROR: $OBJCOPY command failed: $ret"
++	exit $ret
++fi
++
++# Not every C library provides an init section (e.g. musl on RISC-V). The
++# linker script then defines an empty init range, which matches the empty
++# file created above. llvm-objcopy fails on a missing section, so extract it
++# separately and only when it is present.
++$OBJCOPY --dump-section $INITSEGMENT=$INITSEGMENT $SOFILE 2>/dev/null
+ if [ $? -ne 0 ]
+ then
+-	echo "ERROR: $OBJCOPY command failed: $?"
+-	exit $?
++	: > $INITSEGMENT
+ fi
+
+ # Merge sections into file and create digest
+ $CAT $TEXTSEGMENT $INITSEGMENT $RODATASEGMENT | $HASHER -b - > $SECOUTFILE 2>/dev/null
+-if [ $? -ne 0 ]
++ret=$?
++if [ $ret -ne 0 ]
+ then
+-	echo "ERROR: $CAT command failed: $?"
+-	exit $?
++	echo "ERROR: $CAT command failed: $ret"
++	exit $ret
+ fi
+
+ # Insert data into library file using an atomic operation
+ trap "rm -f $SOFILE.$$" 0 1 2 3 15
+ cp $SOFILE $SOFILE.$$
+ $OBJCOPY --update-section $FIPSDATASEGMENT="$SECOUTFILE" $SOFILE.$$
+-if [ $? -ne 0 ]
++ret=$?
++if [ $ret -ne 0 ]
+ then
+-	echo "ERROR: $OBJCOPY command failed: $?"
+-	exit $?
++	echo "ERROR: $OBJCOPY command failed: $ret"
++	exit $ret
+ fi
+ mv -f $SOFILE.$$ $SOFILE
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
index c5c7bc104a..17f7f0a7f7 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=htt
            file://leancrypto-tests.sh \
            file://0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch \
            file://0002-Linker-script-Handle-a-missing-.init-section.patch \
+           file://0003-FIPS-checker-builder-Use-OBJCOPY-and-report-failures.patch \
            "
 SRCREV = "65eb4e7e84e3a5499460a66b1623ccf6c59628b1"

