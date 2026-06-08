Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504A5CD8C8E
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 07:49:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49138.1780904956117660835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 00:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Dn0A/ZSW;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=dWb1XZUR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OdM92385840
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2026 07:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bINe37UEHJDem/6gPELBzk
	ccXxf5fRHDk3PzNlvaAYo=; b=Dn0A/ZSWiwOUFDc5ThlEtucSJS8vft8wAsJLq6
	aNsORVhjgCr1BJYzEZk3wSma2DBbHTYIEhgtiVIUmreCqLJj1OODeSHSbyKRKggl
	MartOuNGbocf+Frhsd6HV7HLDff4XzSGxPxBwAbOoLGo25iuJ1mojtYYkWQTKsWS
	1akwSDzRT5N7b02M8pyHXthfLMoPgf6xpkLxqOGkJL1OrMQJ0sAI2RkbM+m3UsQd
	/mdD41pbrNSgH2tXIQcVgEZexxH5FQXdFZtD8PfzjzmVgrZ3IKfjyPS4KbLkzgNt
	JjBQ8BtSuOUhxW14GXami0QFjvpqgXoPZhF33HNAIIvP0DqA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8xd6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 07:49:14 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso1666728241.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 00:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780904954; x=1781509754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bINe37UEHJDem/6gPELBzkccXxf5fRHDk3PzNlvaAYo=;
        b=dWb1XZURQ0TMtizmM9NaLk9JT20BvRyClkn7QDBXeSG0XEwRXJamB2U5n9MaxLV4aR
         9REO5vJYaJkBGkL+j115Mob6IlR6/u7VSclpTqRJe95JpHO4IwTPcBksehZz0LUfDH8K
         QMghcKyv9Cu3xJZdH21cOmjKJW8DowQd67JT8MO2v/YTifnd+FlwDdy2HvCUPEfWKwkv
         80Fz9iNOt+rvMz+XUYww7U+N/FDUGAGf4dAtRjmUbO//aOYUKSrWhH7PRucf+/Y/05Xk
         SYQy7wCPsyrE3737bH6QtP3Hjp03Zar7XkVGDuBama/baXryQ6MB/Vk6pYy6YfG1W73T
         +akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904954; x=1781509754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bINe37UEHJDem/6gPELBzkccXxf5fRHDk3PzNlvaAYo=;
        b=IEr1jKsL2jvT8GWKL4LvOaivskbPkWNsQLWclPXDZPxACIu1g4aCYC64n1QRSg02QA
         by+bEHdTRZ4W0Lu21+XylaI5RE+F4sxvSbFLP5WNAt4qB17dSHbumnnwfrbdL3/CjfjN
         BaqbRHgK30r0K4V/eExv+PfJDWkOWRIg8GC3vcn5udKnTHrMR5jvRPfYYrGFfYIc7l7y
         xo3Wi3TD22x30tMn7pU7DToWWOvGV8CctKaJnQUM9wgURJPVJ1fTjI17g9f0Enjx1HPY
         wSyNj2tVRS24UKf/aMK1UXg6orrknTKtw9LMj8haXpGeKxDxq01HG90hCx2mLVFNC05p
         fJHw==
X-Gm-Message-State: AOJu0YxTWOf6RzDmB2tz4FlMfvAvYEKy+kJoG3tNRbm6M2PcMq+05DwO
	FPdoklOczY9yryVkfqJv8NtHphhdGU1/fBQXdpdw6nl0ozuSlzSDClBfv2xMDm32eD9DIaKHZa0
	X7lW9C4agH5l5gmavciiC/hD/1+bK+lbV+TqWGsfYCZVAkgoidhERaogTUffgaWpZ0Qf8ggV4sz
	BrqEad06605jRV7ySs
X-Gm-Gg: Acq92OF5Tk9McV2czS4BY/NnEHaFyuZG6WmOLoLjUEJvhJYvdqrX9H3AST06M8K3Y8m
	oEJ249bL1dQK4DVFyNc5L55xqU50wsIKFS5HA6Sq7tjn3pQznz5YKtKU6Zl+ww6rq3JwEWmKDIO
	c6esFzl6mWIjP3LZBbYNYpvBG3t1KNATJJ7Nbm2p2aDnn3quEk1amdIfwAytXXe5kcWPLUZXWVZ
	N4h0oCBmwFdbtQK+HeALNzpL/C3eFJWnGaRo9LekZRIe5eE7bbMHyUetezQ3wVlwgeR5L/d8Zoe
	o01KWnPUHHWszvwxG3jxIGuszRU43+NEYvtvC/WvmfH7rJYCSlLqokVa+HbIV0+0B2mb2tAMXO6
	qsfq7PQ//p9TwOzd4FLdSPjyBwQICjXaIaQDfkbwIFJjDEkHIO/+KNn5cUBFyqHV6CVtWxRl+BL
	D8qgApSMRpAsDWrjTNJNN4vNAOuN+EX9q4UuhIcCDcigBWTA==
X-Received: by 2002:a05:6102:5615:b0:631:af51:7d8e with SMTP id ada2fe7eead31-6fefb0a009fmr5689346137.17.1780904953909;
        Mon, 08 Jun 2026 00:49:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5615:b0:631:af51:7d8e with SMTP id ada2fe7eead31-6fefb0a009fmr5689336137.17.1780904953198;
        Mon, 08 Jun 2026 00:49:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8edf44sm3571965e87.9.2026.06.08.00.49.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:49:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] mariadb: fix building for the ARMv8.3-A and later systems
Date: Mon,  8 Jun 2026 10:49:09 +0300
Message-ID: <20260608074911.2452562-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: iWK8ut6FycpXYwevC7FPZlrUY_SjDZXf
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a2673fb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=hkEv4HZQAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=kcCo3kFerqr1tpGepnkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=NA03pvyaApPJG5valX87:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MSBTYWx0ZWRfX4pqlhOMyo4wz
 6xSETHBWMNCgH2zJ6TwyCp23mVV4qJE1lkMm/PM0VwlgLIkZD/KGu8/KrDIzb1GRxfX5JOzj6Qb
 W0m73oqzfpwZZXGiSm1pXoTRV3fO3zzry15dW9LuLJ51CO1ffyMay22IRXU5B5SV6uUOp9UT5mB
 3Yh4PX1KN6BDq2y6WiLQ8cq5aZADGVQ6WnwPaUsa8FrkEfsRgjTQwSdWAgC4ZDAV8pJT+9iKs3m
 Fp2gOwltQif3Q8LcK15JlazFqj+NVHeBxxwiJcbfN0hqai1+YGOWl7JcMWsmhWbexlms2gahqhG
 RRDPW5uoJkPng9cmVpQYghSz3z/bOI3WI/T+JCSwoBhFtdIo2A8VlKGHQnxB/Sw6qf5QxvDdSU5
 P0Rny8i4JSUto/PLkwBq1qJElM+JIgIgRpfTUDV8Nrir4Oj0v9lEoHQLkP/YCTys1tZiI2DgX0Z
 QNWHAoMsjriRBEX6FPw==
X-Proofpoint-GUID: iWK8ut6FycpXYwevC7FPZlrUY_SjDZXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 6586OdM92385840
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 07:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127421

Building mariadb for ARMv8.3-A and later, fails with:

Assembler messages:
{standard input}:169: Error: selected processor does not support `retaa'
{standard input}:271: Error: selected processor does not support `retaa'

It happens because the pmem_cvap() funciton manually inserts the `.arch
armv8-2.a` clause, making GAS believe that retaa instruction (inserted
by GCC) is invalid.

Replace compiler dependent version by using the generic sys instruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...b11be28ae9b2432b2a661bf38a197cf9514d.patch | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432=
b2a661bf38a197cf9514d.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 9470184d3d43..87378e27f170 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,6 +25,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
            file://riscv32.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-b=
uil.patch \
+           file://c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch \
           "
 SRC_URI[sha256sum] =3D "14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9e4080a44=
8f00f87a9f0a4a6b"
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661b=
f38a197cf9514d.patch b/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2=
432b2a661bf38a197cf9514d.patch
new file mode 100644
index 000000000000..a58b6f112f79
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197=
cf9514d.patch
@@ -0,0 +1,52 @@
+From c21bb11be28ae9b2432b2a661bf38a197cf9514d Mon Sep 17 00:00:00 2001
+From: Daniel Black <daniel@mariadb.org>
+Date: Thu, 21 May 2026 11:54:35 +1000
+Subject: [PATCH] MDEV-39692 innodb intrinsics fail to compile on ARMv8.3=
-A and
+ later (but not ARMv9.x)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Assembler messages:
+{standard input}:169: Error: selected processor does not support `retaa'
+{standard input}:271: Error: selected processor does not support `retaa'
+
+It happens because the pmem_cvap() funciton manually inserts the `.arch
+armv8-2.a` clause, making GAS believe that retaa instruction (inserted
+by GCC) is invalid.
+
+Replaced compiler dependent version by using the generic sys instruction=
:
+
+__asm__ __volatile__(/* dc cvap, %0 */ "sys #3, c7, c12, 1, %0" ::
+                           "r"(u) : "memory");
+
+Co-authored-by: gemini-code-assist
+Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Reviewed-by: Marko M=C3=A4kel=C3=A4
+
+Original solution: https://lore.kernel.org/openembedded-devel/2026052011=
3418.2523208-1-dmitry.baryshkov@oss.qualcomm.com/
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/c21b=
b11be28ae9b2432b2a661bf38a197cf9514d]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ storage/innobase/sync/cache.cc | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cach=
e.cc
+index c5e67709e22b2..064c29d6f0205 100644
+--- a/storage/innobase/sync/cache.cc
++++ b/storage/innobase/sync/cache.cc
+@@ -82,11 +82,8 @@ static void pmem_cvap(const void* buf, size_t size)
+   for (uintptr_t u=3D uintptr_t(buf) & ~(CPU_LEVEL1_DCACHE_LINESIZE),
+          end=3D uintptr_t(buf) + size;
+        u < end; u+=3D CPU_LEVEL1_DCACHE_LINESIZE)
+-#if defined __ARM_ARCH && __ARM_ARCH =3D=3D 9
+-    __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "m=
emory");
+-#else
+-    __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "m=
emory");
+-#endif
++    __asm__ __volatile__(/* dc cvap, %0 */ "sys #3, c7, c12, 1, %0" ::
++                         "r"(u) : "memory");
+=20
+   __asm__ __volatile__("dmb ishst" ::: "memory");
+ }
--=20
2.47.3


