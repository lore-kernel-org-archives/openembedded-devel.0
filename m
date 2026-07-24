Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBCDC531D0
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 01:07:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10255.1784855274936452464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 18:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dhpRh1pc;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GP26qy/j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeBGR1351100
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CCLUVWJAW/qz2Y+CN1ddyN4N9gd5806AyMk
	fSJs8xjU=; b=dhpRh1pcMJak3EVkUlL+C3gkV/i612j63i6NLshprLF0DsLqU9o
	hT6S0dqUwr9GuC5Iw64UTl7BMwTYW6JpDIRJk3Ove1AkdrrUdf3HYlltuaVe7JCX
	x/c4t0QBTZQavWiUoE21HgimCxKCnK//+b/Gj/HoiGTUGuKOR9SPjsxNZORMUTnc
	kIv22UC0j70+RtuN7XJmGAsDWRcjgtFj407+ipnyjopKSRVO+TChzYm3YzgJWXiD
	YrbJF/XvUKZduhLB2zfYnsNrF4hqI3CxhV+C77kcFqQoBsT+0mGv8xvbUj2Ff8nB
	NkG5o5WQFaD+7a+Fg1RHxnsoFNbz2saxXJA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa09ean-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1186148a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 18:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784855273; x=1785460073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCLUVWJAW/qz2Y+CN1ddyN4N9gd5806AyMkfSJs8xjU=;
        b=GP26qy/j5bI+/Lat20xJEUYnNEVlJHMLfbZAS3RHFzPsgh1XcE3csxO7HHVS7q+wO1
         IT2JGMKb11RFaxiFYX08u/5RtH2PXfLnC80SNUK9l/72RrPEK68fBanav/u1px/Odyrq
         sBvnVL+ROvyPYygvtn9DEHN2X4XQBEIJn+UmyA0e4uCiEbMs66PnxQf6TEaKtYQJ14gY
         +2GdE1GllMohxqRcLaBOKom7y3/ytyZi+ZDvT63fevEv5N7evVV9gTbbx092/ReASRMU
         6mo60TyBg98tQGWj7jvzDxv/8U58a8l6StKw87Ene6l5q0A9ZcIaKS6zA34uTSq9Pxzk
         ZD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784855273; x=1785460073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CCLUVWJAW/qz2Y+CN1ddyN4N9gd5806AyMkfSJs8xjU=;
        b=I3OcIg3z3LctrrG+Y1ZaCxpkHv25cjN5QeaNV72MJZI8+MBQ7jPhU/lcfaF5vYaJ5d
         qvvtDzeuwcospxXVHiEGvau34CAV60wzGZyDX01bY4NkDStNuKW/619I1VjmYYG7p+7B
         Km3RN7w+HQ38z/zN9lpKNwM87ttUjC2kmVWfqPLQ8YkD/TklSINGM5oY++fiYXyrBb+Q
         a7FDL5qswxPaKbT/tKO3C8tYuLaga90LHOlqQpawpJzJTklsA5wttcTXZTUOpU1AqULO
         /drR5D/SXBCWjItXEVPosghAsUjCl3PkCqPw2gpLlZ32ZzkG2fu3R0ZgxDSx9zvC2rJD
         e7kA==
X-Gm-Message-State: AOJu0YznJ4viMUk+ecd1d9DovCQWZMLZ77cZHDHxuzuT2ihcLfPLzsEf
	8fxb2jWbqwu4D9gKzREP5DT0YgW9fnKPxqNCDc22TN5kzBFG827XfWtmxGUDYNQ+FM+s5ZIwzAr
	DPDXu9VxABAAOfyLGoMlD6j1IL35eC5tFT47EWZepwgsd/0BiammyHvVrdni7ZSlFJlZHP5vj4l
	n8JsiOE464y+AE13wf4ZGTYw==
X-Gm-Gg: AR+sD12tMzG2DVjHO6Foz0fi2Jn5dTsR3m8hTThL7avagKqKF6hlgiudTvYYMLRO9mj
	78TCydXNpET+mujK4JgJ0mbuIWFek/+d+kkwsEV+7SMpTz9rDYxLZ5VJQmbCzKgCGFxgAP98Vzj
	5fcefyWiY+FjGQXhV4V5mBWVJL9YWMP7IupzSfjsAN0PRuxgc0+jVxSzaZnB99derKSStBwyyM8
	D1Gr2q7F6QifdFjwJnYXxfdudGueNSnKlj/ezS/sOxZ7eXPoWnjxgLVQHIQkRJE8nqYWbaQoSmp
	Z1mhvOe48R+PxvtdrNEMDGOJijvi5pcwcPEb2ZXOPQn69YttHkReppQpgLvKvuOvwNPbCBAsnya
	j6bmJqbXNQNkvKdRmSt9rmZ+hdYnMscU=
X-Received: by 2002:a05:6a21:4a97:b0:3bf:6ac8:8d29 with SMTP id adf61e73a8af0-3c44afd5d11mr6104243637.21.1784855273464;
        Thu, 23 Jul 2026 18:07:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a97:b0:3bf:6ac8:8d29 with SMTP id adf61e73a8af0-3c44afd5d11mr6104204637.21.1784855272772;
        Thu, 23 Jul 2026 18:07:52 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm44906934eec.21.2026.07.23.18.07.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:07:52 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 1/4] ltrace: fix PRIb64 length modifier on LP64 musl
Date: Fri, 24 Jul 2026 06:37:43 +0530
Message-ID: <20260724010746.2638347-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 11AeiuAQtZS1roEKwMNdOYFosjdaQkzA
X-Proofpoint-GUID: 11AeiuAQtZS1roEKwMNdOYFosjdaQkzA
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a62baea cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=A0lzc82GcLC8t735N8QA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX86h/JKyjg18h
 zxZQBR0wVxkeNlX1oBaMyeJYIh0gHDa2fdtysHDbMvVkGIJ1tQwwjYo/xeGRDdhKjCQ0fcCNEm9
 jakf4BOpH35VUctlkBRXkUX6Fb6x7YB2MLjgKpf3859KYm9IiTZo4Lj+mmYA28jRn6pSOtCZ3+h
 NaAXD3QyGqcJPjJ1aN4uEk2Xz/dvYKqqaIqOhZZ6BMQ3WUPtEcatN3P6w2sIb+klHor/ff8ISqA
 lZ6RQ43vJdojvZOg/x2C74WsIuoXIDNRd6vt9Zz5IGPjW1pN/VUR63GEAMA6M4enkqEetKJHOrY
 0rW4XKaE9R8XThdfWtWi2PPz1ELLVQegz53mYkDAucCSR3fsxGz+kDU3GLmEWq7K3p1YupgKqVq
 obEfj58drJB0ZqIRYrxVfnZeloZ3msoQgq9O+j6H8QR9gyKNrU8cuxfjeOkFlW8Jvv9NunqEO3K
 2or7sw0wy1TGRp5qKgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfXzT+O9wNtJmZS
 fTuBTmDq7DCxJmIZBt5bvbiqF9D/SVER1C5hbKq3FsZnmM73IOvibcoi0izIt7m03nf1Y67Eokt
 JV9M55e5LfagwxHLA34nYhsa/dZTwFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128419

From: Alejandro Mery <amery@apptly.co>

lens_default.c defines PRIb64 through a fallback that hardcodes
__PRI64_PREFIX as "ll". That is only correct where uint64_t is unsigned
long long (ILP32). On LP64 musl targets uint64_t is unsigned long, so the
resulting "%llb" conversion does not match the argument and do_compile
aborts under -Werror=format:

    lens_default.c:90:48: error: format '%llb' expects argument of type
    'long long unsigned int', but argument 3 has type 'uint64_t'
    {aka 'long unsigned int'}

glibc never reaches the fallback: it defines __PRI64_PREFIX itself,
wordsize aware, in <inttypes.h>. musl provides the same modifier there
under the name __PRI64 but not __PRI64_PREFIX, so the hardcoded "ll" is
used and is wrong on 64-bit. Reuse musl's __PRI64 when __PRI64_PREFIX is
absent, keeping "ll" as a last resort. glibc builds are unaffected: the
block is skipped entirely.

Signed-off-by: Alejandro Mery <amery@apptly.co>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 09a7b1507297a437bb1119dac80613649cfa1886)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...t-fix-PRIb64-length-modifier-on-musl.patch | 49 +++++++++++++++++++
 .../recipes-devtools/ltrace/ltrace_0.8.1.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch
new file mode 100644
index 0000000000..b644efff94
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch
@@ -0,0 +1,49 @@
+From 1a03dca3000616aa61d2c8137068706c9095a653 Mon Sep 17 00:00:00 2001
+From: Alejandro Mery <amery@geeks.cl>
+Date: Mon, 20 Jul 2026 20:13:56 +0000
+Subject: [PATCH] lens_default: fix PRIb64 length modifier on LP64 musl
+
+The fallback that defines PRIb64 hardcodes __PRI64_PREFIX as "ll", which
+is only correct where uint64_t is unsigned long long (ILP32). On LP64
+targets uint64_t is unsigned long, so the resulting "%llb" conversion
+does not match the argument and, with -Werror=format, aborts the build:
+
+    lens_default.c:90:48: error: format '%llb' expects argument of type
+    'long long unsigned int', but argument 3 has type 'uint64_t'
+    {aka 'long unsigned int'}
+
+glibc never reaches the fallback: it defines __PRI64_PREFIX itself,
+wordsize aware, in <inttypes.h>. musl provides the same modifier there
+under the name __PRI64 but not __PRI64_PREFIX, so the hardcoded "ll" is
+used and is wrong on 64-bit.
+
+Reuse musl's __PRI64 when __PRI64_PREFIX is absent, keeping the literal
+"ll" as a last resort for C libraries that expose neither.
+
+Upstream-Status: Submitted [https://gitlab.com/cespedes/ltrace/-/merge_requests/69]
+Signed-off-by: Alejandro Mery <amery@geeks.cl>
+---
+ lens_default.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lens_default.c b/lens_default.c
+index 0de6f37..28df811 100644
+--- a/lens_default.c
++++ b/lens_default.c
+@@ -64,8 +64,13 @@ READER(read_double, double)
+ 
+ #ifndef PRIb64  // Underlying format supported by bookworm glibc, but macros not exposed until 2.38
+ #ifndef __PRI64_PREFIX
++/* glibc exposes the 64-bit length modifier as __PRI64_PREFIX; musl as __PRI64 */
++#ifdef __PRI64
++#define __PRI64_PREFIX __PRI64
++#else
+ #define __PRI64_PREFIX "ll"
+ #endif
++#endif
+ #define PRIb64 __PRI64_PREFIX "b"
+ #endif
+ #define HANDLE_WIDTH(BITS)						\
+-- 
+2.47.3
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_0.8.1.bb b/meta-oe/recipes-devtools/ltrace/ltrace_0.8.1.bb
index 77bb61830b..aa377e2ec8 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_0.8.1.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_0.8.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://gitlab.com/cespedes/ltrace.git;protocol=https;branch=main;tag=$
            file://0001-proc-Make-PROC_PID_FILE-not-use-variable-length-arra.patch \
            file://0001-dwarf_prototypes-return-NULL-from-NEXT_SIBLING-on-er.patch \
            file://0001-trace-fix-1-bit-bitfield-assignments-for-clang-Wsing.patch \
+           file://0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch \
            "
 SRC_URI:append:libc-musl = " file://add_ppc64le.patch"
 
-- 
2.54.0


