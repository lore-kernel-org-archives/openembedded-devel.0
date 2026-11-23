Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54398.1795443278594121149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mRCzL8wv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=D8oUnl8+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL0ff3072381
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kq3LXB3nI9g
	7HFW10/pvOApNFXGdF4PTpBNkX9v6ZXM=; b=mRCzL8wvgY9qcYbyoVLZZuvQ+JR
	d80Ah1n5YgM4/HqHZav3po62gJJfqT4Jv3LpFIXazgW4fwjTcZuiYR+otLsgPeYp
	qC1vfCFFHTsQUyYv97YvzRYz42iUtYj0zattCryUSioU69J3yyahqYvcp+jjSzf0
	SsgNrSBihCP5uH88Y+sdIk1Y57EEHeGRqDl+7zMXzRsqSqy4eJXOX7Db2NjNv2pt
	4eNKjSUyQhzKabpyOyjUC1gaCj120RO83YjXhGWSM2/s2EvnRSNOlgqpYoK8VCrS
	RC5moEsYhF+owRJkxQitvTGEqzzkEACLMZHE373bo6eaK8BnUOfM9bVyZKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sceu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso4451042eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 06:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443276; x=1796048076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kq3LXB3nI9g7HFW10/pvOApNFXGdF4PTpBNkX9v6ZXM=;
        b=D8oUnl8+SvhJ1JrXHgNNKGktCCyFOAKnEf4RzE6uwl+kY2qPS1wo927boEPiM7XP7s
         ZTP6wmONluqnaTDFydTMEXgjrjmlJJok36IZST8wbS7Wn68fdxKRhqoQVbmKWjoFLk/1
         CE1EPAE43LQrwiPI7PaRjhJW/XEo+vDjgUKtAi844BPqq3qFDTCSo6vWVD+etdkbUjQo
         hfU54b8wMBEdDq+xs3hJ6E3+R3Fnh/juJBKc7DLw/HzAef2WWdTqSLPdxoYF7QCkhGdI
         ZkaQR4VAcr3h/5KnKQ02JOD5ZPJXrkX3EF3olKnT4PWHs9KTk+IcQ5BJcA1FJnn1AYbx
         Kepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443276; x=1796048076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Kq3LXB3nI9g7HFW10/pvOApNFXGdF4PTpBNkX9v6ZXM=;
        b=Zalff7CuGO1WB+uR85KGval+3XSJlTCg5simVXm4lun5PPczvSnJgIZ3Z3qDkkF9Gz
         MF6nao5Wv6GDFCqCFPMDLnghC/Pwjn3pRRRz1VIwSY+o92QFtzcwfhPyk41o8v6DGY4A
         KVo6JZlIkD6HUZ7LtEIq1+KI/2iVMHYJL14hk3nBnGn+p8mYc5iTNToNqTs5xgKJt1th
         rxSAKBZeYuelA3IU0yMsWAhoaG3FQavwi5khrE9ELyp9k4o7jMW5VKaFZctniQQLe6qY
         Aj+C3h+K3jaRIMksQIuMV51hhn0WkIkBGtH+nF+C7vgupMG1wrRCW9JzN4817tY6nNsk
         m8vg==
X-Gm-Message-State: APuU4Z/T+Jf78jUrimIhmCzwok49XBioo37ZZTiPT1WGwa66Tmgf6bWi
	4Hr69MtI9maRpgRKcimdma/AtJOH7eZsLpvYsbDt3YE6EVTBWCIKU9zyRbQrD767XmipwkLNIZY
	mX6jV+j3sAiZJxEqET+Oa8pNR0syCmOO7NTkpAEYmQGekdJuZz1rlrlewCb7hfUtnt/jsBlSfV3
	W6gbEJKA+88IB1RnBLekM=
X-Gm-Gg: AZFdTZeYBPnJB/2o3J5Dc3ybj78kpwHEPGyaYIKpNwwhO9o97nvT3ofmAwVotZEPxs2
	9YDGvHn6Sm490bYT0Xu/k25vsTEVXHvMFP84bMoLXRpxNpf7AMTp65xId1oGKv6UVZMmRA/lNBB
	FY+9nPCiwLRJjkaZDXJSiCz3g67QfXLiTTXqbEMUK4EG/rBNnJ0ohJ30BNBmWHh96Ho1gH2CFaz
	M5DZuxA7ISW6Ap0WEzhVQkPW7Gg8kCPx1IVdwDFukDzxzAbYN1GOyAl0JFr54bnldM0w6UBYJ4o
	MslqPaibwDsXSho4QjSpM6y2HCakWjSRMC+gUnCaLVssNBmG1BUQjptCzUI5uePl88QJFAjDhxh
	1nsP8nm+0oKHn95KyZA83j5BznvQlqJLRXkiKt+dETR+hii+/3wMXQmDd4VvH01yeiSC8zD4weX
	/O+b9b
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr11560022c88.1.1795443276379;
        Mon, 23 Nov 2026 06:14:36 -0800 (PST)
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr11559996c88.1.1795443275749;
        Mon, 23 Nov 2026 06:14:35 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33218644c88.7.2026.11.23.06.14.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:14:35 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-oe][PATCH 5/5] fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE
Date: Mon, 23 Nov 2026 19:44:19 +0530
Message-ID: <20261123141419.1377088-5-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
References: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b044a4d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=GTAnj8xEAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WGv5TK1KmbtKlv0jq9kA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=Wp4qs7tHXlEjurn1qSZC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX6Jy4dicvpx+V
 MPKGU16FRuunIQsPGdm+mhJTu/7xrqGrr8LpXHHkIGslT7bpShYAZhXvyRF3n4eKvNu5vRdzNMC
 IhmfYVT/irp/E2wFwNjWieqAtMhIsoVeXct1gglJKAfpgyAJozsA02YqPCqTJA7PdcLPLH3XBB3
 6L/lNkXtie9btVZJGA68PXVy7lchGRVDPlX9botfzbw6H1zDMWV+l+qQPT73Z6BVbqZE797dxeK
 Hbb8agGJF0kHApWudc4cR8eKdQMkuQxhbdvhlllzVz1cWWfGJX/LkToeA9WDCIkGpWUtENTadf9
 Ens31zA2n1vnJCb791LdmiyfFaCn6bzpOKVkNxCM6Sc4hu8B3BP6ulkJEK8KIVOi+IopQ5n+tZ3
 qerAVzTjkeQisMJYbAchSpPb7g+8ZE+nBjURfq4CEMynaPFlil9bKsF+P+t21THkJsWAxpoUVhZ
 sCy0gxYq9ZsNSn/oD+A==
X-Proofpoint-GUID: aZ0ppjNWASo31RrIlr0w_5HUHPUd-REm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX5Q2msjKh9RtI
 GGO8E17+7z3rU0NgqGDhi9CIkR3hNnuMLbjQBC6cJODxmMgx64s+uTE1GFgfaDM8PrY9nnRsRx9
 ONRu4N+lyU5RnVETu6rpNt2babWZMPY=
X-Proofpoint-ORIG-GUID: aZ0ppjNWASo31RrIlr0w_5HUHPUd-REm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132899
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

musl defines CLOCK_SGI_CYCLE, so on aarch64 cycle.h uses
clock_gettime(CLOCK_SGI_CYCLE) as its tick counter. Linux returns
EINVAL for that clock, every measurement reads as zero, and
FFTW_MEASURE planning loops forever, which times out the bench ptest.
Skip the SGI clock on Linux.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cb9e4666b6b87916ce22d4b3287f4287db00ef4a)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 16b059cabda68c6d12e81d4ed39e5f9042d714e4)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch | 43 +++++++++++++++++++
 meta-oe/recipes-support/fftw/fftw_3.3.10.bb   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch

diff --git a/meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch b/meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch
new file mode 100644
index 0000000000..ce23ac4377
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch
@@ -0,0 +1,43 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Oct 2026 18:30:00 +0100
+Subject: [PATCH] cycle.h: Do not use CLOCK_SGI_CYCLE on Linux
+
+musl's <time.h> defines CLOCK_SGI_CYCLE, so on targets without an
+inline-asm cycle counter ahead of it in cycle.h (e.g. aarch64), FFTW
+picks clock_gettime(CLOCK_SGI_CYCLE) as its tick counter. Linux dropped
+the driver behind that clock id and returns EINVAL, leaving the timespec
+uninitialized. Every measurement then reads as (nearly) zero, so
+X(measure_execution_time) keeps doubling the iteration count and any
+FFTW_MEASURE plan never finishes; the bench --verify ptest hangs.
+
+Skip the SGI clock on Linux, which makes musl fall back to the same
+estimate-only planner glibc uses on these architectures. This also
+avoids the duplicate ticks definition with --enable-armv8-cntvct-el0.
+
+Upstream-Status: Submitted [https://github.com/FFTW/fftw3/pull/430]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kernel/cycle.h | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/cycle.h b/kernel/cycle.h
+index 83438bb..960eb90 100644
+--- a/kernel/cycle.h
++++ b/kernel/cycle.h
+@@ -437,8 +437,13 @@ INLINE_ELAPSED(__inline)
+ #define HAVE_TICK_COUNTER
+ #endif
+ /*----------------------------------------------------------------*/
+-/* SGI/Irix */
+-#if defined(HAVE_CLOCK_GETTIME) && defined(CLOCK_SGI_CYCLE) && !defined(HAVE_TICK_COUNTER) && !defined(__ANDROID__)
++/* SGI/Irix
++
++   Linux removed the CLOCK_SGI_CYCLE driver and clock_gettime() fails with
++   EINVAL for it, but musl still defines the constant.  Using it leaves the
++   timespec unset, so every measurement reads as zero and the planner keeps
++   doubling the iteration count forever. */
++#if defined(HAVE_CLOCK_GETTIME) && defined(CLOCK_SGI_CYCLE) && !defined(HAVE_TICK_COUNTER) && !defined(__ANDROID__) && !defined(__linux__)
+ typedef struct timespec ticks;
+ 
+ static inline ticks getticks(void)
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
index af7117da7b..9927c47349 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     http://www.fftw.org/fftw-${PV}.tar.gz \
     file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
     file://install-bench.patch \
+    file://0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467"
-- 
2.55.0

