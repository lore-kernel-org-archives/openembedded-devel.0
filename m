Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79791C5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:49:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11100.1786708191319524740
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MopCYCuv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PDX1hv6L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAb5MA1467159
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 11:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rdehUTNzjRkIpL3kabm7TFwPG9FtR4TtmVq
	Zu4P8y1s=; b=MopCYCuvLy8fpJ6L+ThvbVLCBjVv/D0Z8iyjEoRZQve+GyOL50x
	HEf+P0u10t7AXMZdSZ+jiW4DM/hx6CUgB+4HgO2CM/VEhph+9gCwj2mw8VRLOMW0
	/X0AXv3Yqk6G/hZnbuDdNK1pEqjLUTI9TsX7zF5PUl4DMSLrSpBVzeyOo3zlN40k
	eA3FSeGVIOrNksC4gwQonvJ0XnbKiRH5UNF/buiz1hkj2O8aZLDS46ykzIZ587Rq
	AFqCXx9l6FfdHnvZAJB/HQBbVliQ1XniEaF9zuBkD1h6AxVXydF8JnsusC/AcMo9
	Os/ZotYGOVW5dMvyQdGWpc8aNC+A6OvrbNg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexh2cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 11:49:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1344663a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 04:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786708190; x=1787312990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rdehUTNzjRkIpL3kabm7TFwPG9FtR4TtmVqZu4P8y1s=;
        b=PDX1hv6LX0NYDcK7KDS6Jey9sTpqPEPGn46s5AX/3T1W8IoRuYWWNIWdg0taDVHrBG
         HDIRSfs8z53o1BUJ4ugTCipDH24+ZSvTj//4m4jcSgtMMlvxjd4wrtNQf0penKKLVFfx
         MEu7dV/bf3LE7cs+b8l6lB8pzLPQRzVzpn+iAIJ3PoocEIBDDs5VdUlKD+12mGICi6+5
         DQfHFu+SbLmcFNbA3YvKJaO2QLFuu2wlijRL2HEkvOjLQ3uZmIAPHnKlnYJEPwNeuGEF
         GE13eHRvPoDNfjNxFu0BQZUF9Lu6Af7TgjUlQUvs3kmBM5LldivH4eheUUiRZIgN4z88
         VtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786708190; x=1787312990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdehUTNzjRkIpL3kabm7TFwPG9FtR4TtmVqZu4P8y1s=;
        b=ULjF0KPquwSnnnJy2CU7LWWCeAhwY8AFVuYV3+xTMb8a/oNIaX/eDiwhSpoXuou5eI
         j80t5kmiP0Kbbnx8eMM9TbmMy+H1HXEfbNhNPDDl8syuvpdvDI78JcbRVsbRhYvXp/2F
         OdumexBZuOnfcd8x/eUsAHlKBfANW3oXKbHu+EjLtGiYkt3g0d359sCsmeEMpyAfv2v9
         gcknxm10rhJUVzAM9rp5X0OUOurgxynPpvYLUMwJ23JDj90vyCtWUYUr87taXDK1tD+J
         xuXOvFZyE8sz91HIVCTU6kVSCi41EcSbncDaKOKelAAsxmrMGGWe9p1yeHbOWDm3/TeH
         Mdvw==
X-Gm-Message-State: AOJu0YwtXKvbriW8G7p6x7ImNGRoZuBKc2lfZjyWpSOqZQ9YqWmxfshH
	XpItXydnWscSRoNCL3cnwsklXAeNDNZOtM83vn52yIK5aumTR/DYzx74nRyNc9yeA2tb9dqJyoX
	pk6W6PN8cJPtAHELtHJNqx1bjDk/P35WlLXoanC1jJWqyfAm5wP/JQrix/+hDKqQA9WfZALC5Fv
	hM11MJDFOiW4lXI92L
X-Gm-Gg: AR+sD12d23ORbXnlxjGMyQZGlx8WQM3paWgSp+0wJIqnOCrs2Kugxy30wJREu7og4yf
	ji8nITUmUPrRFqPNZzFZ4Aa5mWn1hquluLCyoT5tGRbXuIGiZoM1UktqbbQM5Cm/WaxhmxE6DAu
	G/+yI26qyTRN4cjgWBjgYBoAApUmlLmUyej185gzoSDGlqK2fy3X4frQUNkYnfHgNVbiZHRHgrP
	m7TMgvfonitRhdfq+6RmM5ClxbulJ9jI4eaYjG1jxabRB1/LLoQeXJt2kQVe1Tq5IMPbNhq156g
	GKxEW/QLJ63dTTMIYMtb4+RRSEUdXmFGZ2ALNePHAx5Und4INeVg1vTrFAFDjPR3eHmMHfTdC/0
	DFEEhg25HBZZX9je4QDWsCu1DEMV+pUTicfq9d5OzZ/p37dezs9V9TXZV2Pvp+bm2jDsW7EQ=
X-Received: by 2002:a17:90b:44:b0:38e:2e16:859b with SMTP id 98e67ed59e1d1-3933bcf395amr6087880a91.20.1786708189507;
        Fri, 14 Aug 2026 04:49:49 -0700 (PDT)
X-Received: by 2002:a17:90b:44:b0:38e:2e16:859b with SMTP id 98e67ed59e1d1-3933bcf395amr6087825a91.20.1786708188933;
        Fri, 14 Aug 2026 04:49:48 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebb888cbsm2353230a91.9.2026.08.14.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:49:48 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH] redis: fix module_tests build using host gcc under cross-compilation
Date: Fri, 14 Aug 2026 17:19:05 +0530
Message-Id: <20260814114905.982788-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA4OSBTYWx0ZWRfX/MytgDlh1GNz
 YUhTelOsBCXoPTriDiviF/nzgGlj4sWcTou0l+3Ej/ypPy1V6+m+fd+ThO3ZjSU444gqCRi1lUh
 tI/vPELIbfrTnJlIgC/gmH9amH3d30E=
X-Proofpoint-GUID: VeSPFGcE4R08eQVGnFE0R5wjaozxRMkk
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7f00de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=7UKGVgRVAAAA:8
 a=EUspDBNiAAAA:8 a=qHOmHLONKkQmR7k3ci4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=8Ox4Rr8FuIIqx5qz5MW0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA4OSBTYWx0ZWRfX470wIe61ekZO
 Wv8wVqoOqebvo2uzqDT3eq0N0plmRLB6MGXyhCyNrXilBuXg05wRrJd8ODmeM3HYEIbMz0CRM87
 TMLEekj0eoLD9kYXqSfLGzgFS6PQIfKWg9AXQ/al/kjd791g74HKSpnNKNoBNdTvyZPuUG7hXtv
 bjjyHhczEIAyDn7e4vu9B898GNZvtAUeCJoo/6OYN6V7TQpQJPYMm/W4ABbgcVqp8pShcAgCfN1
 CBOsNdFoid7KitqKxlk/bzR6RBGhO5UkdL5UolGtxkzyZrrUcNPSd7xDFM+EEx0cfGsn9KGTLIr
 pmEcB59GoT/9q8cICryUJqV6Si0AAqrgY3mwnLoeIQbKbzRa7L4IbyFFLUFk4pOhb63Ck5ei5vv
 Aie2SZzAEioDCninPS2z4MGZi4VaD1jC/b+H/oW7YSlXcoT2GF0BfCX4iX3TtsfFAUtj4hXVwA2
 7uGpBFs1FFcDqC6iKSg==
X-Proofpoint-ORIG-GUID: VeSPFGcE4R08eQVGnFE0R5wjaozxRMkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 11:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129044

Since the 8.0.6 -> 8.8.0 upgrade the src/Makefile "all" target also
builds "module_tests" which descends into tests/modules/. That Makefile
unconditionally sets "CC = gcc" and "LD = gcc" on Linux, overriding the
CC/LD provided by the OE environment. Under cross-compilation this
invokes the host gcc with the target CFLAGS (e.g. -fcanon-prefix-map
from the OE cross toolchain), which the host compiler does not understand:

    gcc: error: unrecognized command-line option '-fcanon-prefix-map'

Add 0006-tests-modules-do-not-force-host-gcc.patch to drop the hardcoded
"CC = gcc" so the exported cross compiler is used, and set "LD = $(CC)"
so the shared objects are still linked through the compiler driver.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 ...-tests-modules-do-not-force-host-gcc.patch | 44 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_8.8.0.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.8.0/0006-tests-modules-do-not-force-host-gcc.patch

diff --git a/meta-oe/recipes-extended/redis/redis-8.8.0/0006-tests-modules-do-not-force-host-gcc.patch b/meta-oe/recipes-extended/redis/redis-8.8.0/0006-tests-modules-do-not-force-host-gcc.patch
new file mode 100644
index 0000000000..5ca268aa57
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-8.8.0/0006-tests-modules-do-not-force-host-gcc.patch
@@ -0,0 +1,44 @@
+From d854ee577bd9eb3b3f3752999aad865fa8611984 Mon Sep 17 00:00:00 2001
+From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+Date: Fri, 14 Aug 2026 00:00:00 +0000
+Subject: [PATCH] tests/modules: use the OE toolchain instead of host gcc
+
+Since 8.8.0 the src/Makefile "all" target also builds "module_tests",
+which descends into tests/modules/. That Makefile unconditionally sets
+"CC = gcc" and "LD = gcc" on Linux, overriding the CC/LD provided via
+the environment. Under cross-compilation this invokes the host gcc with
+the target CFLAGS (e.g. -fcanon-prefix-map from the OE cross toolchain),
+which the host compiler does not understand:
+
+    gcc: error: unrecognized command-line option '-fcanon-prefix-map'
+
+Drop the hardcoded "CC = gcc" so the compiler exported by the
+environment (aarch64-...-gcc) is used. The shared objects are linked
+via $(LD), and upstream deliberately links through the compiler driver
+(LD = gcc) so that gcc driver flags in LDFLAGS such as -Wl,-O1 are
+honoured; the OE-exported LD is the raw binutils ld and rejects them.
+Set "LD = $(CC)" so the link also goes through the cross compiler
+driver. The SANITIZER=memory clang requirement handled by the separate
+block above is unaffected.
+
+Upstream-Status: Pending
+
+Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+---
+ tests/modules/Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/tests/modules/Makefile b/tests/modules/Makefile
+index 0659497..8628aba 100644
+--- a/tests/modules/Makefile
++++ b/tests/modules/Makefile
+@@ -29,8 +29,7 @@ endif
+ # tough we want to keep the compiler as clang as MSan is not supported for gcc
+ ifeq ($(uname_S),Linux)
+ ifneq ($(SANITIZER),memory)
+-	LD = gcc
+-	CC = gcc
++	LD = $(CC)
+ endif
+ endif
+ 
diff --git a/meta-oe/recipes-extended/redis/redis_8.8.0.bb b/meta-oe/recipes-extended/redis/redis_8.8.0.bb
index f9d297a16f..5601e0ff0c 100644
--- a/meta-oe/recipes-extended/redis/redis_8.8.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.8.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0003-hack-to-force-use-of-libc-malloc.patch \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
+           file://0006-tests-modules-do-not-force-host-gcc.patch \
           "
 SRC_URI[sha256sum] = "88422181efb0c9c0abba332e3e391d409e1e13714b838931669235e5796f704b"
 

