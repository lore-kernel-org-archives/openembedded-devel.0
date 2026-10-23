Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1293.1792722727278045306
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 19:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ftbivhJr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=idB+qNeo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F9Bg1792135
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 02:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o3OROpUJSwCFTxlHgogCTjFMQiZeNg1qt6M
	p/Icgsd4=; b=ftbivhJrdtMU8hwn5HWEzB8b1maUNTkP5/p/N65M7QkzykajpBx
	lsnT3HHfdmHm2BBPtMTufKMyI2VHQwjV4rej8w4wLx5Mt1ZtzmkBHyr5HRo4IMJv
	FdHFiOa0lglmBxdbp906TVKlhivqlXdGtlwm+rtJkjOaLDp2Ky94HcaXNk5NNl7N
	Tj04oMhWBf3InzlxhwFurbe5pbQbpVkaTl9QWBl2wfRpO+SMuzV7tWNsg+znHAJV
	bcktbNtKEDf5vrTW6U1vat3N31zkByHFKvdUQEvFSy2o7EC3vwvWBautOYDjoC3m
	Sw8+MkBt2rqy1BBCAxfJiuWLKhzruYVan3A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0j2j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 02:32:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so407535a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 19:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792722725; x=1793327525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3OROpUJSwCFTxlHgogCTjFMQiZeNg1qt6Mp/Icgsd4=;
        b=idB+qNeoMVANDWHz66RppWmRDwGeAzgDWV1F2RJEs6Kof3R8mdIJ1ugLMt83jgzUKP
         P8Ep2etcJm+3u6UhLC4N7p4kB6mQo7E/W18Zi8t/QvYy2G0jYRkEQ75VP0vnNFvpxWCk
         byQ6eql77/5EADOCOqJhxDfKWPWKcrh5bopCBm+leKnPZsZzrlJvIkN5Muqk+FKHSKh+
         SqL7nOxeX+F03CrvD+oKf7TknwYjbVKevecj2Uyjx43M/JxhJBVBv+jiYN4E5pcJ+kiJ
         7gzjiV2N8ExIuoplwu7EJ8d42ZXSAUH1LG3ZdedqpwyBUGiTkviruopf3sqPC0LhENLI
         ssJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722725; x=1793327525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o3OROpUJSwCFTxlHgogCTjFMQiZeNg1qt6Mp/Icgsd4=;
        b=zgZJJmVqpQjmbSMo/YxyxPP5Q+TWxb9qFXZPN5va1Y+B1iq1pc/nPtwFbgU9WQOgtJ
         xHtk//2SjqtHAqPHmLcf2AzRJ3LP8zcqdob2pNvTCtFTM1YHiDRVW6B0/6hAqRY+diGY
         AHgvtWidh93vL5Qa41Hh3nmroVoIVE+09JM0HMAJhTJb92qEJgYvEQewSuweNyPz7mZ1
         bBjq2bMWGrqooDand9jTmHLYR0g8hO7RQcLO5z9JgAk/zPcZRpVMLwAvduTHsKQLAVeu
         aV0RT0An99LrTSshVna4sitIjYWut+xNx9QR/P/ObnpagN5JAsfCTOL02aGKadh4Oa3c
         BXZw==
X-Gm-Message-State: AFq9FYKgHB/x5gyirQeb7N3toDv+vnH1HxH75Fa9AAQuQj83XG6uWbNr
	xLZyy82cE05tmHlPQAeVdBXMprQEMcK2DzoGIxyVBTqvb6BoVt7YgsYOROYxhc0fV4GhlqKWSQ4
	L2vn1yW09oQ3M/srNaZKpF4SV/ALo+BVh8nKfhQo9S5exwmZjZGzpKsvA9uUEwTRsysDUVREZ03
	6tLuaOjA0tlwoBtjoouhE=
X-Gm-Gg: AYBFou1CCucUe5yg1AzVEsm1vlfCrfXb3jsOeft1fIqyD2blPfhsncU5D0KWz/tSKGt
	bDO9pzzZUyV0/d7eRtwJhbEOz9lDsXw0sKTWnE9VLH0q9ZD+K7cAu85QIuRrU8ULv2D+VOoQ1hC
	31NFFfI0mHBROP8GUSyZrgYNjWfU5FnJf7rYymq64Pj5hIMc/ssYWaGux29OWAdKqm0BjrIZQmB
	hiaJuv0ythntyhtqCapW5PDPd21v8JJoX9tXwgfsguKyPS9vL1DmJIGmb7FflZyD+C1MRq4XRqw
	2l0eZuJeawyANu3uCYKk+D2323hjvvAc8UuG1A+/rfYu+bEQRmaeI38Q+bI+NomSQ6L0VFv/O6f
	9JVpyeNqxEdhKct0ZY/mIgYVjLSJe2hFnTxeDgAqdsKrZl6eaS/ZabJAzZfYGYptKO3IfMNDBNa
	UZvoVHwSlN55MlSR7PASpSM+xXWLWEfDMXwFH3DA==
X-Received: by 2002:a17:90b:3951:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3adce13361bmr694201a91.60.1792722724442;
        Thu, 22 Oct 2026 19:32:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3951:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3adce13361bmr694156a91.60.1792722723510;
        Thu, 22 Oct 2026 19:32:03 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49544f1sm6599267a91.16.2026.10.22.19.32.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:32:03 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pahole: fix kernel BTF generation when OBJCOPY carries options
Date: Fri, 23 Oct 2026 02:31:56 +0000
Message-ID: <20261023023156.4143024-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vh2JSlu4AjfYTJGo_3k6MKc8CIF4iOPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwOSBTYWx0ZWRfXy4FppCIOGBGX
 WoIgciX6arQn/mR+RT2STcj96YEGLhXPEipePF8Z5rKiMuRyC6KujBD74vpsA6cUbN9MeKCXLb+
 sentd3Z9Uwm9LdWiVDOz7XfuGXE0xltOZzMJMIuLAPWqATxkMrS24kElSDVoDlVBIY2Qn46mztM
 EacEjIXdhIC/3x8PQ5MBRlrw4lpqxP/uGoWb7bZXfTATtY+P2vFlrXCalJhw7X8Gb05r0RUgm3x
 Kn9td33h+WdXyHsiOBgQkzaddDZ6hv09Fb3aAALLfcNPAmK/tceabYWme7idzfEngN2gyaRqEON
 j3NbevUJOEfdvxYZ+PKBzQZ6P1KLCt+psA3O4Gsd5HPto4LAr1ea4Y6klXDh7sgMwig01IfIp23
 rwvLb/KBL8XaxD6p/lQukCjfxL6gLhUihim4+dNXkr5sixsBvZEaQh3AWV10kZuxjLWqWuJ/8vz
 KvKqeI/djAvr3Fa8scg==
X-Proofpoint-GUID: vh2JSlu4AjfYTJGo_3k6MKc8CIF4iOPM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwOSBTYWx0ZWRfX/QuyPdeyzXPp
 xeLzThWVWSLuyWxEwAc7z649wprAd1lVGRWwoSrrwfzdYVSdCphc8HBjPoyStSwNZu7v1Noq3TC
 k+2C5dBgo1GknPjUJG2QaRR62ZKzHiE=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adac725 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iSD8GLCBb1DYbCuR2FcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 02:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131323
Content-Type: text/plain; charset="utf-8"

pahole 1.32 takes the whole value of LLVM_OBJCOPY as the objcopy program
name. Kernels up to v6.19, such as the 6.18 LTS, set it from $(OBJCOPY),
which ends with a blank in OE builds, so the kernel link fails when
generating BTF:

  btf_encoder__write_elf: failed to add .BTF section to '.tmp_vmlinux1'

Bring the fix submitted upstream, which splits the command into words.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 ...objcopy-command-into-words-in-exec_o.patch | 181 ++++++++++++++++++
 .../recipes-devtools/pahole/pahole_1.32.bb    |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-dutil-Split-the-objcopy-command-into-words-in-exec_o.patch

diff --git a/meta-oe/recipes-devtools/pahole/files/0001-dutil-Split-the-objcopy-command-into-words-in-exec_o.patch b/meta-oe/recipes-devtools/pahole/files/0001-dutil-Split-the-objcopy-command-into-words-in-exec_o.patch
new file mode 100644
index 0000000000..70ca794834
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-dutil-Split-the-objcopy-command-into-words-in-exec_o.patch
@@ -0,0 +1,181 @@
+From 726ca024c9bfdeee542361ceb2e611e884955050 Mon Sep 17 00:00:00 2001
+From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 20:05:39 +0000
+Subject: [PATCH] dutil: Split the objcopy command into words in exec_objcopy()
+
+pahole 1.31 ran objcopy through system(), so LLVM_OBJCOPY was a command
+line that could carry options, like the $(OBJCOPY) make variable the
+kernel build sets it from. Since the switch to exec_objcopy() the whole
+value of LLVM_OBJCOPY or OBJCOPY is passed to posix_spawnp() as the
+program name, so a value such as "objcopy --some-option", or one with a
+trailing blank, fails with ENOENT.
+
+Kernel builds up to v6.19, including the LTS branches, run
+LLVM_OBJCOPY="${OBJCOPY}" pahole -J from link-vmlinux.sh and use
+${OBJCOPY} unquoted for their own objcopy calls in the same script, so
+an OBJCOPY that works for the rest of the build now stops the link with:
+
+  btf_encoder__write_elf: failed to add .BTF section to '.tmp_vmlinux1'
+
+This breaks OpenEmbedded kernel builds, where OBJCOPY carries the
+machine's objcopy options and ends with a blank when there are none.
+
+Split the command on blanks, like the shell's word splitting did with
+system(), for OBJCOPY as well. Quotes are not interpreted, so a path
+containing blanks can no longer be used, either quoted as with system()
+or as is as with v1.32. Name the file as both input and output, so that
+a stray word in the command makes objcopy fail instead of being taken
+as its input file and replacing the target.
+
+Extend btf_write_elf.sh to check that options in LLVM_OBJCOPY reach
+objcopy.
+
+Fixes: 6789ef8a16d5 ("btf_encoder: Fall back to objcopy when llvm-objcopy is not available")
+Assisted-by: Claude Code:claude-opus-5-5
+Upstream-Status: Submitted [https://lore.kernel.org/dwarves/20261022035604.3183589-1-ricardo.salveti@oss.qualcomm.com/]
+Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
+---
+ dutil.c                | 55 +++++++++++++++++++++++++++++++++---------
+ tests/btf_write_elf.sh | 34 ++++++++++++++++++++++++++
+ 2 files changed, 78 insertions(+), 11 deletions(-)
+
+diff --git a/dutil.c b/dutil.c
+index 38101f1..d333d41 100644
+--- a/dutil.c
++++ b/dutil.c
+@@ -248,15 +248,43 @@ int exec_objcopy(const char *objcopy, const char *add_section,
+ 	struct sigaction ign, old_int, old_quit;
+ 	posix_spawnattr_t attr;
+ 	sigset_t child_default;
++	char *cmd, *word, *saveptr, **argv;
++	int argc = 0;
+ 	pid_t pid;
+ 	int rc;
+ 
+-	char *argv[] = {
+-		(char *)objcopy,
+-		"--add-section", (char *)add_section,
+-		"--", (char *)filename,
+-		NULL
+-	};
++	/*
++	 * objcopy may come from $LLVM_OBJCOPY or $OBJCOPY, which the kernel
++	 * build sets from its $(OBJCOPY) make variable, a command line that
++	 * can carry options, so split it into words on blanks, as the shell
++	 * did with system(), but without interpreting quotes or escapes.
++	 * A string of n characters has at most (n + 1) / 2 words.
++	 */
++	cmd = strdup(objcopy);
++	argv = calloc((strlen(objcopy) + 1) / 2 + 6, sizeof(*argv));
++	if (cmd == NULL || argv == NULL) {
++		rc = -1;
++		goto out_free;
++	}
++
++	for (word = strtok_r(cmd, " \t\n", &saveptr); word != NULL;
++	     word = strtok_r(NULL, " \t\n", &saveptr))
++		argv[argc++] = word;
++
++	if (argc == 0) {
++		rc = -ENOENT;
++		goto out_free;
++	}
++
++	argv[argc++] = "--add-section";
++	argv[argc++] = (char *)add_section;
++	/*
++	 * Name the output file too, so that a stray word in the command
++	 * makes objcopy fail instead of becoming its input file.
++	 */
++	argv[argc++] = "--";
++	argv[argc++] = (char *)filename;
++	argv[argc++] = (char *)filename;
+ 
+ 	/* Ignore SIGINT/SIGQUIT in parent while waiting, per POSIX system() */
+ 	ign.sa_handler = SIG_IGN;
+@@ -278,14 +306,15 @@ int exec_objcopy(const char *objcopy, const char *add_section,
+ 	posix_spawnattr_setflags(&attr,
+ 				 POSIX_SPAWN_SETSIGDEF | POSIX_SPAWN_SETSIGMASK);
+ 
+-	rc = posix_spawnp(&pid, objcopy, NULL, &attr, argv, environ);
++	rc = posix_spawnp(&pid, argv[0], NULL, &attr, argv, environ);
+ 	posix_spawnattr_destroy(&attr);
+ 
+ 	if (rc != 0) {
+ 		sigaction(SIGINT, &old_int, NULL);
+ 		sigaction(SIGQUIT, &old_quit, NULL);
+ 		pthread_sigmask(SIG_SETMASK, &orig, NULL);
+-		return rc == ENOENT ? -ENOENT : -1;
++		rc = rc == ENOENT ? -ENOENT : -1;
++		goto out_free;
+ 	}
+ 
+ 	int status;
+@@ -302,7 +331,11 @@ int exec_objcopy(const char *objcopy, const char *add_section,
+ 	pthread_sigmask(SIG_SETMASK, &orig, NULL);
+ 
+ 	if (status == -1 || !WIFEXITED(status))
+-		return -1;
+-
+-	return WEXITSTATUS(status) == 0 ? 0 : -1;
++		rc = -1;
++	else
++		rc = WEXITSTATUS(status) == 0 ? 0 : -1;
++out_free:
++	free(argv);
++	free(cmd);
++	return rc;
+ }
+diff --git a/tests/btf_write_elf.sh b/tests/btf_write_elf.sh
+index 64ce128..dc512e0 100755
+--- a/tests/btf_write_elf.sh
++++ b/tests/btf_write_elf.sh
+@@ -14,6 +14,9 @@
+ #   exists from the first encode.  pahole opens the ELF with ELF_C_RDWR,
+ #   overwrites the Elf_Data buffer in place, and calls elf_update() --
+ #   no objcopy needed.  This is the "Existing .BTF section found" path.
++#
++# Path 1 is run again with options in LLVM_OBJCOPY, as kernel builds up to
++# v6.19 pass their $(OBJCOPY) command line there.
+ 
+ . "$(dirname "$0")/test_lib.sh"
+ outdir=$(make_tmpdir)
+@@ -115,4 +118,35 @@ if [ "$has_bpftool" -eq 1 ]; then
+ 	info_log "BTF content valid after overwrite (elf_test found): ok"
+ fi
+ 
++# --- Path 1 with options in LLVM_OBJCOPY ---
++# Kernel builds up to v6.19 run LLVM_OBJCOPY="${OBJCOPY}" pahole -J, and
++# $(OBJCOPY) is a command line that may carry options or trailing whitespace.
++# --preserve-dates keeps the old timestamp only if the option reaches objcopy.
++
++objcopy=${LLVM_OBJCOPY:-$OBJCOPY}
++if [ -z "$objcopy" ]; then
++	objcopy=objcopy
++	command -v llvm-objcopy > /dev/null 2>&1 && objcopy=llvm-objcopy
++fi
++args_obj="$outdir/write_elf_args_test.o"
++args_ref="$outdir/write_elf_args_test.ref"
++cp "$obj" "$args_obj"
++touch -t 200001010000 "$args_obj" "$args_ref"
++
++if ! LLVM_OBJCOPY="$objcopy --preserve-dates " pahole -J "$args_obj" 2>/dev/null; then
++	error_log "FAIL: pahole -J with options in LLVM_OBJCOPY failed (exit code != 0)"
++	test_fail
++fi
++
++if ! readelf -S "$args_obj" 2>/dev/null | grep -q '\.BTF[[:space:]]'; then
++	error_log "FAIL: .BTF section not found with options in LLVM_OBJCOPY"
++	test_fail
++fi
++
++if [ -n "$(find "$args_obj" -newer "$args_ref")" ]; then
++	error_log "FAIL: options in LLVM_OBJCOPY did not reach objcopy"
++	test_fail
++fi
++info_log "pahole -J with options in LLVM_OBJCOPY: ok"
++
+ test_pass
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.32.bb b/meta-oe/recipes-devtools/pahole/pahole_1.32.bb
index 331b93abf6..68797fc7ec 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.32.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.32.bb
@@ -12,6 +12,7 @@ COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-
 SRCREV = "fa725d687ce3a712ef296b46bc63ea57ef466014"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master;tag=v${PV} \
            file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
+           file://0001-dutil-Split-the-objcopy-command-into-words-in-exec_o.patch \
            "
 
 
-- 
2.43.0

