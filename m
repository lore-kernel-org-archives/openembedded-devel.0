Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.687.1794204043415692742
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HJZ7jbos;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=AtlV5pw9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KAGp2936989
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TI3pdjkCtrX
	GvQur/cGVb+NGxdk8G88MowFfmecEmP4=; b=HJZ7jbosgRr8BibzZAHOknZtQ/N
	N2MZxBCxbf2KVH5SBXbqf4GYFo0TRkQpwlgwfulU3TnDJ4MiKWlvcv7VfJ8Ja5Ue
	1FiEn44T1wQNWvd91mBCMo8vfCAfCgDGkci+fvFhSgz0e7L16aNqKsH0ybr5YHlF
	Kl7RIb9TsO56hNlXbbI2+mcx9nWqlyZps3BAmpTyjY0QXBEUZxlvheKgQ41s6+TS
	z/L7qtTvlYf8CSVvBWt2zMVXuAytMFcFwQRE1F3Cw/092CfQvEnTTJm38ukx8fY2
	9t0nkJBALRkh4KtyApPYXa2e+QP9xwCE9/jkvryu3apXGkJUwZHjakcMscg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagw08x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1199243eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204041; x=1794808841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TI3pdjkCtrXGvQur/cGVb+NGxdk8G88MowFfmecEmP4=;
        b=AtlV5pw9P/FYs7akCYEj1XH4GeLXFhd73YlhXozZacfl2zaLa0fs79i4SwVgVl9J4L
         GRA49f5Ix9lN9KUCUaiYOKpoZWq+HYr3hitVvxFhBj6wX8AV9j0TaYUFAOfB4hS2WFaq
         Gj74sYgX4kXVyTmn+OHf9FVxraUrC068O80Hs9SpWRTxRjZTToy2HCBlsxar6b/2h50e
         3bL70xty2KEdQnn/UtjNkBubEDSm658kXL76+T0F8q7EJBgOHdCR+h6pxuJwrYHZVvHR
         EvNHLAs5oeceXd4I+YHbl0fzR4NMqo2rTDRUbRvmK9hR6aPhN59FmNVbUCNGIDYa/0eh
         VzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204041; x=1794808841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TI3pdjkCtrXGvQur/cGVb+NGxdk8G88MowFfmecEmP4=;
        b=bGOwoUA9bePwab2VG6WI5jrWOdLKTwIX/KSFKEQcXtHp+HUNYZjWm+MpHylMP7Fe6v
         yAUwgDzXygpf1/hmoYFVx7xCN9r56UFw8l3koM/GmgJM9Gg1ZLez9iYgi4wqx61YnX2r
         NYFnqXKhUFB9LCVvB1Jzi96UewNSog2hG5Nl8/Qhs08CHipNzqQItVFgD6lQpivCgqQ8
         PsGX2XXdhQKXoN0njDzKaIGfwW63yyZogejAL7SlQegq6Ef02Qlj8wwbClHUlD6VyWOA
         P0/icwng1g23sb1aoOrJ0HnCpF7oaLndOD1YJRFtQq1JlmoIab+LmUI6eo2jyfb4qFYa
         bmqw==
X-Gm-Message-State: APuU4Z8Bd46WnflB4kGAPrx+Ur2fb15Zqs/MeKudHFW4onwKmnjLOyl2
	IY+esNRoHHB7OjVSKd9audY6rNvAz7HwJmyNBoDvGAPBLjSgwnqw/C+wf7nuccw5qah9kTbh4cn
	fuMUyClEKfKiqW8CNetaka4qSp0ewxE3v963gb9sp8MJfQul3h9VWLxV7gSqmKQiwgGsYeEwt5B
	I3MVW8LARe25CGsQyRQWGvMg==
X-Gm-Gg: AYBFou0GA7OJTZLfoIQoSKlOxkrcyOXfikLiYNHm1CF8XOJ2pRTZgbBA8RuVOM0RE4U
	pffQnBnEzQtK09qqfyJ1z0e9sCD7XQkDg3TLNlT3A+1TCKg5pXk8EpxGNlVPJ+qfheSq+sc0Xcf
	TzftGdvnb2FuNk0kAhJ8UZTeJ01wyij32yvGlHYPwcCYMF7ouXu+vqbQFviDjdsN0WS2dYEnQRi
	hj/CO9kfUlZGO43OOEefRasTw8dedFIN3bnQc9DXieEHtwYW6H3qMsUCnEJFdWN4SClLIV86jvL
	CLBpP/vU3rNGDcud6N2I597/AAfaC8/j/W6+uDBQrfaqCZbh7ax2f/SP+/ICWbC7w3XjApLsVhy
	NByseLI2CXhq4ZZ9zK5jmIav1Gl5srBgVsqDJlIY7esWGDNr/PdrA+rVpgFAIl8lwvEhWbuLim7
	hnGmg=
X-Received: by 2002:a05:693c:8943:20b0:36e:371:8255 with SMTP id 5a478bee46e88-3724fa74cabmr5404329eec.0.1794204040974;
        Sun, 08 Nov 2026 22:00:40 -0800 (PST)
X-Received: by 2002:a05:693c:8943:20b0:36e:371:8255 with SMTP id 5a478bee46e88-3724fa74cabmr5404287eec.0.1794204040351;
        Sun, 08 Nov 2026 22:00:40 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:40 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 04/10] fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE
Date: Mon,  9 Nov 2026 11:30:24 +0530
Message-ID: <20261109060030.621745-4-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX3rek/bZkT5uT
 /zBZceDIfbVff3AxLCLebulVCin6UCfVFThiJDB0iFG782ajyNDJHggq+TmKxXRtc6ioo8E7u4P
 vBlzndRGn61m50zfRdxP3aMsWaYqFerXXjjrBY43fZxVMCeRPlY9f+g2baVt9LLPEfFmC5Geqlv
 Lc7xF3bj9+KITAagc7QENcXSaGuuAqcb8S5vFWgUl2oQLjcqvgch+YLRzbzdpVH0+UaBegsK55I
 X3J4Q5KO9Qtn2fYc8kRNOw7+rpqCdDpQyqtPnVQWOrF7Emwhki7MgOJq/gURZooJZrQoREbX6Ac
 kgobs3Bn9gq1oJELrTLXyYSBVTMEdotlNsF2qBh5XScU8h6QznN4RuGMGT1Ao+Y0SRFsYE30fYt
 e7mfvVk7++ZA0/2kJJ97ZYnXd0B58Rut4lhMU1iPfdEGoynuH6vX7VrKW6NuAgTL/1ov/QnTVV/
 8QnjLIDP0TKCt+qdqpg==
X-Proofpoint-ORIG-GUID: jigccw8_wNa4J2cxXQSdzh0_9ZQ8tSs4
X-Proofpoint-GUID: jigccw8_wNa4J2cxXQSdzh0_9ZQ8tSs4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX0b7ZluR/4nho
 3DfxVvC4gw0pkNXfeISbXxvsefUq2kObzIShwtl/PPJrAx5xIq5mmvbbleCI8CMcV1WdDd7BZm2
 Qk1+eU+Vv4IXHf7LiySupK10JHvK1no=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1618a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=GTAnj8xEAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WGv5TK1KmbtKlv0jq9kA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=Wp4qs7tHXlEjurn1qSZC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132041
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
---
 ...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch | 43 +++++++++++++++++++
 meta-oe/recipes-support/fftw/fftw_3.3.11.bb   |  1 +
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
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
index 83010d3e7d..dc159f7764 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     http://www.fftw.org/fftw-${PV}.tar.gz \
     file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
     file://install-bench.patch \
+    file://0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "5630c24cdeb33b131612f7eb4b1a9934234754f9f388ff8617458d0be6f239a1"
-- 
2.55.0

