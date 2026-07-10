Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15F2C44501
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 10:27:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8876.1783675094920282808
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 02:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=J96BTa83;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jWpJEqwv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: priyansh.jain@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dW2c4194194
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 08:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4TcgREvRil0ajLuKqsvkKFXhEzQmsUSAspp
	nO4eisNU=; b=J96BTa83G9t7J48+2hhtNa7csLjAWbefsvkIASDpoW1XdRt0mP/
	U9k3hYjx3JFiWpaQZkptZjpQQL4rnpaZN0pbqmdalsmLMlfNObWg5L8EW9ZWUxxV
	Qrq1kz5Vl8mnodfmb3jx5dvU1ZlPAxMTMcKYhlKM+MP6rn0xVy11aytvF9glcE1K
	nlmseJS2VVrf19PzVcCi/ycZDoiYZS53lPKEfLpLnUjgM1aQuRZ+d0+8LaWmCxhp
	1spIVhF1ndgNK6DzO//u+ZxCVgISc+5tE3t41jqWDdLbw69z8krvCQ50orZBJ+JL
	Yx2WOqQvvH9Gsg6QYmw8HTD2/RKO4SAZUmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24udab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 08:40:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811ae55313so749536a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 01:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783672831; x=1784277631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TcgREvRil0ajLuKqsvkKFXhEzQmsUSAsppnO4eisNU=;
        b=jWpJEqwvj/H5kbyN7Hbqei4HYzlVvOP/hBzwRYlph5V7HArOmQ7nM1Dnv7JKC668qD
         vWTL+IwfKC9JtSYYrUvg4D/QLW7gTChUF7aDcjHwIs0WmBrMe+shGgv5ytRpDvNCOOt1
         hEzIEEsjMW+E0jsoBp15217V82oJrZ+mcxK0SROZ9QlYZJB5kKQAuZRvtvazfvCxYbRe
         Onn+Gzd1tYQ0vNz0B+P6gYaNm+lyBGxVX1mvKzCSKdYdc/MFP4Ld8mZqbvqz3LjDrG/L
         FbavenDyzniAFUadgGUmMeG5TuA0s/1ycrcXG9g/CTZZl69XR3B737mtGtf/TqZTt1Dz
         YxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672831; x=1784277631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TcgREvRil0ajLuKqsvkKFXhEzQmsUSAsppnO4eisNU=;
        b=l5wE7BhkLVVembbDeeejHMGDYH6hk+7MbayR7PeD4iIIhw4PwV5rr2eSmnDgxL8Txp
         mX7PAvXJUxNjl8FDEJUUGJr0Q6U/IdqfZ/vuHZ/QTha0K+f4bCslpaDvUZY2t51PbCT1
         x4MyhPj9qM5mG2lVtJ4ckS6gOL53//7eQupWIaoWNdxwIaaAFtKKZX05Kxxsu2B7/FpD
         u6aO9uOhZMHh9M6ONDtG20QX9SDPNGjwh7Ht1OiVwCYnWKqgS/H6F30IDxEaTYNLBOoN
         ssYqzjLcvvtg1VTJOJ9xiwiG+jzvY59fxDoEySRTAity1hqlKqlnT9ALZiPX/oiXKMgB
         0D8w==
X-Gm-Message-State: AOJu0YzHOiXcVp9FMqPd687RZFDFN12X5l+GmSYgX0b4s7/AHhGa5CIQ
	em0d6yaT/wRRolbFxK4SI49Xs1T9NzDQ5AsSWMkNNwFlPfxviXa9cBq6/7sT8vCNLUARuNfuHX9
	YHtTfkaEDAMW8m7uPve/S7Ia9P0y90zGQdmo64DwtQxXNA7+jJCCdnpJgrNLRN3P+ELycbr+0Hr
	FClwB6ql5Pqu2+Ayf6
X-Gm-Gg: AfdE7cnO2kqXqUxc48aFnJbwoD2jiiuC3crt79Tib/1E8Y5bP8Rn66i/audt+iUI4Mj
	6tc0Peuxrk4maOMXoNdxDlCeJMBCeGlnGzkjiJPyCo23JnIhUQkKDI0eBDBU2HijJCrH9aSN/pa
	mDbd9ArNUWZGXFoMj42yVtvRI/DqJKvSGQMJb/X2gfqxjiRCkR0V/c9imf3kzBhKAL/gbw+wJe+
	9VXINmDDhaVL87hmfmSV0EGOhrEmYJo4AKl/Us30EeezTfgEUALXvGEyzAwnoeVwl+ylo7uFXRt
	tDLY8rZl3xNwxvYYUXMshWLCdEF1NdDwESlR8ev8nM7632RGRC/1UgJGTV5kBaJRYuQ0r/pkLB8
	E9hm4ismNoN0FP59VLXyWyilL0O50fvdsbI5nTsdwVVVZ
X-Received: by 2002:a17:90b:1cc3:b0:37f:9cdf:f03e with SMTP id 98e67ed59e1d1-38941fb5880mr10908063a91.33.1783672830498;
        Fri, 10 Jul 2026 01:40:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc3:b0:37f:9cdf:f03e with SMTP id 98e67ed59e1d1-38941fb5880mr10908012a91.33.1783672829498;
        Fri, 10 Jul 2026 01:40:29 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574ca88sm2387768a91.7.2026.07.10.01.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:40:28 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH] thermald: upgrade to 2.5.12
Date: Fri, 10 Jul 2026 14:10:23 +0530
Message-ID: <20260710084023.3571533-1-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: geybMaZJFu68TrKgKedqXxezu94n3aT5
X-Proofpoint-ORIG-GUID: geybMaZJFu68TrKgKedqXxezu94n3aT5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfX0DYY+fWK+aDc
 EkEH9qQXuvMCs6omSTrLjX1H01tCv8gr3HwVFKtrE7mpBYZLSVA/HALTfZxaFnbPTC9gLbWztzS
 FYRvc7mndes7nTE0WeE8JxkwlfUo3MQ=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50b000 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=sDEmMUPcy-J4HkRIiVcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfX8Nm4bs5AynOX
 ggydTM1NZtFhiN2/NyC4kaAWUe2vpbbKWCeQGw/+eO0ZtPp0P5Rb+lnhWl+yyyi0XhSUhraS+/7
 Axs0zTH4IPnl6yqGvYAgmrz80PQUXkBYxbkcYFZNHwhVIVLpC+0sTvgkquZkyOarb1dAtuwBNKM
 t/W0y6D/O4n04rKP0V5LRg9wFcQGovCvExAP5ytKcdmP4h2CC/CrgtL6Pj6nJLMdakaryFi5hu0
 aPwMXEOGjuipotBixG47jUE6GQWkLD6DmY6K+g+GRvTWMy0H4lDVfsVypr76JEbnjgduudtrDHl
 o3bcCQ/+3hO4NqXxtp86cNeGWFRMqvtD7u6rMmhyWnJoNkeiz6ya2KII/DfdCekxQfLiRs+60IJ
 AZYlH2l6teErUy4+IapHNgmVhJ3O/H1ndAzZ5KVAgt12HwSUqs04y213uNWCjqv3jP62hMc40Fp
 gLJHW8SqkKvyEcE0Bgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100083
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 10:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128155

- Upgrade to 2.5.12
- Rename recipe to thermald_2.5.12.bb
- Drop backport patches as they are included in 2.5.12 release:
  - 0001-Refactor-Intel-specific-logic-into-separate-files.patch
  - 0002-Invoke-parser_init-before-platform_match.patch
  - 0003-Add-ARM-backend-and-enable-ARM-platform-detection.patch

Upstream 2.5.12 includes platform support refactoring (including ARM
path), additional CPU IDs, parser/data-vault robustness improvements,
and security/hardening fixes in config/sysfs handling.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
 ...l-specific-logic-into-separate-files.patch | 829 ------------------
 ...ke-parser_init-before-platform_match.patch |  41 -
 ...nd-and-enable-ARM-platform-detection.patch | 234 -----
 ...{thermald_2.5.11.bb => thermald_2.5.12.bb} |   8 +-
 4 files changed, 2 insertions(+), 1110 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/thermald/thermald/0001-Refactor-Intel-specific-logic-into-separate-files.patch
 delete mode 100644 meta-oe/recipes-bsp/thermald/thermald/0002-Invoke-parser_init-before-platform_match.patch
 delete mode 100644 meta-oe/recipes-bsp/thermald/thermald/0003-Add-ARM-backend-and-enable-ARM-platform-detection.patch
 rename meta-oe/recipes-bsp/thermald/{thermald_2.5.11.bb => thermald_2.5.12.bb} (81%)

diff --git a/meta-oe/recipes-bsp/thermald/thermald/0001-Refactor-Intel-specific-logic-into-separate-files.patch b/meta-oe/recipes-bsp/thermald/thermald/0001-Refactor-Intel-specific-logic-into-separate-files.patch
deleted file mode 100644
index 86f6874daf..0000000000
--- a/meta-oe/recipes-bsp/thermald/thermald/0001-Refactor-Intel-specific-logic-into-separate-files.patch
+++ /dev/null
@@ -1,829 +0,0 @@
-From 4cf42fc89ccdbcecdcd30b32a7ca8040be55c253 Mon Sep 17 00:00:00 2001
-From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
-Date: Tue, 27 Jan 2026 14:58:05 +0530
-Subject: [PATCH 1/3] Refactor Intel-specific logic into separate files
-
-Thermald currently only supports x86 platforms but is a very useful tool for
-controlling user-space thermal policy on a wide range of systems. As more
-SoCs and architectures adopt user-space driven thermal management models,
-the limitation to x86-only backends prevents thermald from being used on
-non-x86 platforms.
-
-This series adds support for non-x86 platforms by first refactoring all
-x86-specific logic into a dedicated backend. This separation enables a clean
-and modular structure where additional platform backends can be introduced
-without impacting the existing Intel implementation. Once the backend
-abstraction is in place, subsequent patches add support for ARM backends
-and integrate them into the new platform detection logic.
-
-Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
-Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
-
-Upstream-Status: Backport [from commit 4cf42fc89ccdbcecdcd30b32a7ca8040be55c253]
----
- Android.mk                 |   4 +-
- Makefile.am                |   5 +-
- src/thd_engine.cpp         | 125 +++----------------
- src/thd_engine.h           |   6 -
- src/thd_engine_default.cpp |  79 ++----------
- src/thd_platform.cpp       | 109 +++++++++++++++++
- src/thd_platform.h         |  58 +++++++++
- src/thd_platform_intel.cpp | 238 +++++++++++++++++++++++++++++++++++++
- src/thd_platform_intel.h   |  38 ++++++
- 9 files changed, 476 insertions(+), 186 deletions(-)
- create mode 100644 src/thd_platform.cpp
- create mode 100644 src/thd_platform.h
- create mode 100644 src/thd_platform_intel.cpp
- create mode 100644 src/thd_platform_intel.h
-
-diff --git a/Android.mk b/Android.mk
-index 0b279f4..c14fa4a 100644
---- a/Android.mk
-+++ b/Android.mk
-@@ -43,7 +43,9 @@ LOCAL_SRC_FILES := \
- 		src/thd_engine_adaptive.cpp \
- 		src/thd_lzma_dec.cpp \
- 		src/LzmaDec.c \
--		src/thd_gddv.cpp
-+		src/thd_gddv.cpp \
-+		src/thd_platform.cpp \
-+		src/thd_platform_intel.cpp
- 
- LOCAL_C_INCLUDES += external/libxml2/include
- 
-diff --git a/Makefile.am b/Makefile.am
-index dbf86db..2e76187 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -75,8 +75,9 @@ thermald_SOURCES = \
- 	src/thd_gddv.cpp \
- 	thermald-resource.c \
- 	src/thd_lzma_dec.cpp \
--	src/LzmaDec.c
--
-+	src/LzmaDec.c \
-+	src/thd_platform.cpp \
-+	src/thd_platform_intel.cpp
- 
- man5_MANS = man/thermal-conf.xml.5
- man8_MANS = man/thermald.8
-diff --git a/src/thd_engine.cpp b/src/thd_engine.cpp
-index d2028c6..319f50b 100644
---- a/src/thd_engine.cpp
-+++ b/src/thd_engine.cpp
-@@ -35,7 +35,6 @@
- #include <errno.h>
- #include <sys/types.h>
- #include <sys/utsname.h>
--#include <cpuid.h>
- #include <locale>
- #include <memory>
- #include "thd_engine.h"
-@@ -44,6 +43,8 @@
- #include "thd_zone_dynamic.h"
- #include "thd_cdev_gen_sysfs.h"
- #include "thd_int3400.h"
-+#include "thd_platform.h"
-+#include "thd_platform_intel.h"
- 
- static void *cthd_engine_thread(void *arg);
- 
-@@ -53,11 +54,10 @@ cthd_engine::cthd_engine(std::string _uuid) :
- 				false), adaptive_mode(false), poll_timeout_msec(-1), wakeup_fd(
- 				-1), uevent_fd(-1), control_mode(COMPLEMENTRY), write_pipe_fd(
- 				0), preference(0), status(true), thz_last_uevent_time(0), thz_last_temp_ind_time(
--				0), thz_last_update_event_time(0), terminate(false), genuine_intel(
--				0), has_invariant_tsc(0), has_aperf(0), proc_list_matched(
--				false), poll_interval_sec(0), poll_sensor_mask(0), fast_poll_sensor_mask(
--				0), saved_poll_interval(0), poll_fd_cnt(0), rt_kernel(false), parser_init_done(
--				false) {
-+				0), thz_last_update_event_time(0), terminate(false), has_invariant_tsc(0),
-+				has_aperf(0), proc_list_matched(false), poll_interval_sec(0), poll_sensor_mask(0),
-+				fast_poll_sensor_mask(0), saved_poll_interval(0), poll_fd_cnt(0), rt_kernel(false),
-+				parser_init_done(false) {
- 	thd_engine = pthread_t();
- 	thd_attr = pthread_attr_t();
- 
-@@ -742,112 +742,23 @@ void cthd_engine::thd_engine_reload_zones() {
- 	}
- }
- 
--// Add any tested platform ids in this table
--#ifndef ANDROID
--static const supported_ids_t id_table[] = {
--		{ 6, 0x2a }, // Sandybridge
--		{ 6, 0x3a }, // IvyBridge
--		{ 6, 0x3c }, // Haswell
--		{ 6, 0x45 }, // Haswell ULT
--		{ 6, 0x46 }, // Haswell ULT
--		{ 6, 0x3d }, // Broadwell
--		{ 6, 0x47 }, // Broadwell-GT3E
--		{ 6, 0x37 }, // Valleyview BYT
--		{ 6, 0x4c }, // Brasewell
--		{ 6, 0x4e }, // skylake
--		{ 6, 0x5e }, // skylake
--		{ 6, 0x5c }, // Broxton
--		{ 6, 0x7a }, // Gemini Lake
--		{ 6, 0x8e }, // kabylake
--		{ 6, 0x9e }, // kabylake
--		{ 6, 0x66 }, // Cannonlake
--		{ 6, 0x7e }, // Icelake
--		{ 6, 0x8c }, // Tigerlake_L
--		{ 6, 0x8d }, // Tigerlake
--		{ 6, 0xa5 }, // Cometlake
--		{ 6, 0xa6 }, // Cometlake_L
--		{ 6, 0xa7 }, // Rocketlake
--		{ 6, 0x9c }, // Jasper Lake
--		{ 6, 0x97 }, // Alderlake
--		{ 6, 0x9a }, // Alderlake
--		{ 6, 0xb7 }, // Raptorlake
--		{ 6, 0xba }, // Raptorlake
--		{ 6, 0xbe }, // Alderlake N
--		{ 6, 0xbf }, // Raptorlake S
--		{ 6, 0xaa }, // Mateor Lake L
--		{ 6, 0xbd }, // Lunar Lake M
--		{ 6, 0xc6 }, // Arrow Lake
--		{ 6, 0xc5 }, // Arrow Lake H
--		{ 6, 0xb5 }, // Arrow Lake U
--		{ 6, 0xcc }, // Panther Lake L
--		{ 6, 0xd5 }, // Wildcat Lake L
--		{ 0, 0 } // Last Invalid entry
--};
--
--const char * const blocklist_paths[] {
--	/* Some Lenovo machines have in-firmware thermal management,
--	 * avoid having two entities trying to manage things.
--	 * We may want to change this to dytc_perfmode once that is
--	 * widely available. */
--	"/sys/devices/platform/thinkpad_acpi/dytc_lapmode",
--};
--#endif
--
- int cthd_engine::check_cpu_id() {
--#ifndef ANDROID
--	// Copied from turbostat program
--	unsigned int ebx, ecx, edx, max_level;
--	unsigned int fms, family, model, stepping;
--	genuine_intel = 0;
--	int i = 0;
--	bool valid = false;
--
--	proc_list_matched = false;
--	ebx = ecx = edx = 0;
--
--	__cpuid(0, max_level, ebx, ecx, edx);
--	if (ebx == 0x756e6547 && edx == 0x49656e69 && ecx == 0x6c65746e)
--		genuine_intel = 1;
--	if (genuine_intel == 0) {
--		// Simply return without further capability check
--		return THD_SUCCESS;
--	}
--	__cpuid(1, fms, ebx, ecx, edx);
--	family = (fms >> 8) & 0xf;
--	model = (fms >> 4) & 0xf;
--	stepping = fms & 0xf;
--	if (family == 6 || family == 0xf)
--		model += ((fms >> 16) & 0xf) << 4;
--
--	thd_log_msg(
--			"%u CPUID levels; family:model:stepping 0x%x:%x:%x (%u:%u:%u)\n",
--			max_level, family, model, stepping, family, model, stepping);
--
--	while (id_table[i].family) {
--		if (id_table[i].family == family && id_table[i].model == model) {
--			proc_list_matched = true;
--			valid = true;
--			break;
--		}
--		i++;
--	}
--	if (!valid) {
--		thd_log_msg(" Need Linux PowerCap sysfs\n");
-+	// Create platform instance using factory method
-+	cthd_platform *platform = cthd_platform::create_platform();
-+	if (!platform) {
-+		thd_log_error("Failed to create platform instance\n");
-+		proc_list_matched = false;
-+		return THD_ERROR;
- 	}
- 
-+	// Dump platform information
-+	platform->dump_platform_info();
- 
--	for (const char *path : blocklist_paths) {
--		struct stat s;
-+	// Call platform-specific CPU ID check
-+	int ret = platform->check_cpu_id(proc_list_matched);
- 
--		if (!stat(path, &s)) {
--			proc_list_matched = false;
--			thd_log_warn("[%s] present: Thermald can't run on this platform\n", path);
--			break;
--		}
--	}
--
--#endif
--	return THD_SUCCESS;
-+	delete platform;
-+	return ret;
- }
- 
- void cthd_engine::thd_read_default_thermal_sensors() {
-diff --git a/src/thd_engine.h b/src/thd_engine.h
-index f6c9edf..2e024ca 100644
---- a/src/thd_engine.h
-+++ b/src/thd_engine.h
-@@ -67,11 +67,6 @@ typedef struct {
- 	unsigned long msg[MAX_MSG_SIZE];
- } message_capsul_t;
- 
--typedef struct {
--	unsigned int family;
--	unsigned int model;
--} supported_ids_t;
--
- class cthd_engine {
- 
- protected:
-@@ -100,7 +95,6 @@ private:
- 	time_t thz_last_temp_ind_time;
- 	time_t thz_last_update_event_time;
- 	bool terminate;
--	int genuine_intel;
- 	int has_invariant_tsc;
- 	int has_aperf;
- 	bool proc_list_matched;
-diff --git a/src/thd_engine_default.cpp b/src/thd_engine_default.cpp
-index 0e2a35c..62c2e67 100644
---- a/src/thd_engine_default.cpp
-+++ b/src/thd_engine_default.cpp
-@@ -40,6 +40,8 @@
- #include "thd_int3400.h"
- #include "thd_sensor_rapl_power.h"
- #include "thd_zone_rapl_power.h"
-+#include "thd_platform.h"
-+#include "thd_platform_intel.h"
- 
- 
- // Default CPU cooling devices, which are not part of thermal sysfs
-@@ -795,7 +797,13 @@ void cthd_engine_default::workarounds()
- {
- 	// Every 30 seconds repeat
- 	if (!disable_active_power && !workaround_interval) {
--		workaround_rapl_mmio_power();
-+		// Create platform instance and call workaround
-+		cthd_platform *platform = cthd_platform::create_platform();
-+		if (platform) {
-+			platform->workaround_rapl_mmio_power();
-+			delete platform;
-+		}
-+
- 		workaround_tcc_offset();
- 		workaround_interval = 7;
- 	} else {
-@@ -803,75 +811,6 @@ void cthd_engine_default::workarounds()
- 	}
- }
- 
--#ifndef ANDROID
--#include <cpuid.h>
--#include <sys/mman.h>
--#define BIT_ULL(nr)	(1ULL << (nr))
--#endif
--
--void cthd_engine_default::workaround_rapl_mmio_power(void)
--{
--	if (!workaround_enabled)
--		return;
--
--	cthd_cdev *cdev = search_cdev("rapl_controller_mmio");
--	if (cdev) {
--		/* RAPL MMIO is enabled and getting used. No need to disable */
--		return;
--	} else {
--		csys_fs _sysfs("/sys/devices/virtual/powercap/intel-rapl-mmio/intel-rapl-mmio:0/");
--
--		if (_sysfs.exists()) {
--			std::ostringstream temp_str;
--
--			temp_str << "enabled";
--			if (_sysfs.write(temp_str.str(), 0) > 0)
--				return;
--
--			thd_log_debug("Failed to write to RAPL MMIO\n");
--		}
--	}
--
--#ifndef ANDROID
--	int map_fd;
--	void *rapl_mem;
--	unsigned char *rapl_pkg_pwr_addr;
--	unsigned long long pkg_power_limit;
--
--	unsigned int ebx, ecx, edx;
--	unsigned int fms, family, model;
--
--	ecx = edx = 0;
--	__cpuid(1, fms, ebx, ecx, edx);
--	family = (fms >> 8) & 0xf;
--	model = (fms >> 4) & 0xf;
--	if (family == 6 || family == 0xf)
--		model += ((fms >> 16) & 0xf) << 4;
--
--	// Apply for KabyLake only
--	if (model != 0x8e && model != 0x9e)
--		return;
--
--	map_fd = open("/dev/mem", O_RDWR, 0);
--	if (map_fd < 0)
--		return;
--
--	rapl_mem = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd,
--			0xfed15000);
--	if (!rapl_mem || rapl_mem == MAP_FAILED) {
--		close(map_fd);
--		return;
--	}
--
--	rapl_pkg_pwr_addr = ((unsigned char *)rapl_mem + 0x9a0);
--	pkg_power_limit = *(unsigned long long *)rapl_pkg_pwr_addr;
--	*(unsigned long long *)rapl_pkg_pwr_addr = pkg_power_limit
--			& ~BIT_ULL(15);
--
--	munmap(rapl_mem, 4096);
--	close(map_fd);
--#endif
--}
- 
- void cthd_engine_default::workaround_tcc_offset(void)
- {
-diff --git a/src/thd_platform.cpp b/src/thd_platform.cpp
-new file mode 100644
-index 0000000..25ce094
---- /dev/null
-+++ b/src/thd_platform.cpp
-@@ -0,0 +1,109 @@
-+/*
-+ * thd_platform.cpp: Platform detection and abstraction layer implementation
-+ *
-+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License version
-+ * 2 or later as published by the Free Software Foundation.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+ * 02110-1301, USA.
-+ *
-+ * Author Name <priyansh.jain@oss.qualcomm.com>
-+ */
-+
-+#include "thd_platform.h"
-+#include "thd_platform_intel.h"
-+#include "thd_common.h"
-+#include <cstring>
-+#include <iostream>
-+
-+cthd_platform::cthd_platform() : detected_platform(PLATFORM_UNKNOWN), machine_type("") {
-+}
-+
-+cthd_platform::~cthd_platform() {
-+}
-+
-+void cthd_platform::detect_platform() {
-+    struct utsname sysinfo;
-+    if (uname(&sysinfo) != 0) {
-+        thd_log_error("Failed to get system information\n");
-+        detected_platform = PLATFORM_UNKNOWN;
-+        return;
-+    }
-+
-+    machine_type = std::string(sysinfo.machine);
-+    thd_log_info("Detected machine architecture: %s\n", machine_type.c_str());
-+
-+    if (strcmp(sysinfo.machine, "x86_64") == 0) {
-+        detected_platform = PLATFORM_INTEL_X86;
-+    } else {
-+        detected_platform = PLATFORM_OTHER;
-+    }
-+}
-+
-+platform_type_t cthd_platform::get_platform() {
-+    return detected_platform;
-+}
-+
-+std::string cthd_platform::get_machine_type() {
-+    return machine_type;
-+}
-+
-+int cthd_platform::check_cpu_id(bool &proc_list_matched) {
-+    // Base implementation - to be overridden by derived classes
-+    proc_list_matched = false;
-+    return THD_SUCCESS;
-+}
-+
-+void cthd_platform::workaround_rapl_mmio_power() {
-+    // Base implementation - to be overridden by derived classes
-+    // No workaround needed for generic platform
-+}
-+
-+void cthd_platform::dump_platform_info() {
-+    platform_type_t platform = get_platform();
-+
-+    thd_log_info("=== Platform Information ===\n");
-+    thd_log_info("Machine Type: %s\n", get_machine_type().c_str());
-+
-+    switch (platform) {
-+        case PLATFORM_INTEL_X86:
-+            thd_log_info("Platform: Intel x86/x86_64\n");
-+            break;
-+        case PLATFORM_OTHER:
-+            thd_log_info("Platform: Other (%s)\n", get_machine_type().c_str());
-+            break;
-+        case PLATFORM_UNKNOWN:
-+        default:
-+            thd_log_info("Platform: Unknown\n");
-+            break;
-+    }
-+    thd_log_info("============================\n");
-+}
-+
-+cthd_platform* cthd_platform::create_platform() {
-+    // Detect platform architecture using uname
-+    struct utsname sysinfo;
-+    if (uname(&sysinfo) != 0) {
-+        thd_log_error("Failed to get system information\n");
-+        return new cthd_platform();
-+    }
-+
-+    // Create appropriate platform instance based on architecture
-+    if (strcmp(sysinfo.machine, "x86_64") == 0) {
-+        thd_log_info("Creating Intel platform instance\n");
-+        return new intel_platform();
-+    } else {
-+        thd_log_info("Creating generic platform instance for %s\n", sysinfo.machine);
-+        return new cthd_platform();
-+    }
-+}
-diff --git a/src/thd_platform.h b/src/thd_platform.h
-new file mode 100644
-index 0000000..25746c3
---- /dev/null
-+++ b/src/thd_platform.h
-@@ -0,0 +1,58 @@
-+/*
-+ * thd_platform.h: Platform detection and abstraction layer
-+ *
-+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License version
-+ * 2 or later as published by the Free Software Foundation.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+ * 02110-1301, USA.
-+ *
-+ * Author Name <priyansh.jain@oss.qualcomm.com>
-+ */
-+
-+#ifndef THD_PLATFORM_H_
-+#define THD_PLATFORM_H_
-+
-+#include <string>
-+#include <sys/utsname.h>
-+
-+typedef enum {
-+    PLATFORM_UNKNOWN = 0,
-+    PLATFORM_INTEL_X86,
-+    PLATFORM_OTHER
-+} platform_type_t;
-+
-+class cthd_platform {
-+protected:
-+    platform_type_t detected_platform;
-+    std::string machine_type;
-+
-+public:
-+    cthd_platform();
-+    virtual ~cthd_platform();
-+
-+    // Virtual methods to be overridden by derived classes
-+    virtual void detect_platform();
-+    virtual int check_cpu_id(bool &proc_list_matched);
-+    virtual void workaround_rapl_mmio_power();
-+    virtual void dump_platform_info();
-+
-+    // Common methods
-+    platform_type_t get_platform();
-+    std::string get_machine_type();
-+
-+    // Factory method to create appropriate platform instance
-+    static cthd_platform* create_platform();
-+};
-+
-+#endif /* THD_PLATFORM_H_ */
-diff --git a/src/thd_platform_intel.cpp b/src/thd_platform_intel.cpp
-new file mode 100644
-index 0000000..622a9ad
---- /dev/null
-+++ b/src/thd_platform_intel.cpp
-@@ -0,0 +1,238 @@
-+/*
-+ * thd_platform_intel.cpp: Intel platform-specific functionality implementation
-+ *
-+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License version
-+ * 2 or later as published by the Free Software Foundation.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+ * 02110-1301, USA.
-+ *
-+ */
-+
-+#include "thd_platform_intel.h"
-+#include "thd_common.h"
-+#include "thd_engine.h"
-+#include <vector>
-+#include <string>
-+#include <fstream>
-+#include <algorithm>
-+
-+#ifndef ANDROID
-+#ifdef __x86_64__
-+#include <cpuid.h>
-+#include <sys/mman.h>
-+#endif
-+#include <sys/stat.h>
-+#endif
-+
-+#define BIT_ULL(nr)	(1ULL << (nr))
-+
-+#ifndef ANDROID
-+#ifdef __x86_64__
-+typedef struct {
-+	unsigned int family;
-+	unsigned int model;
-+} supported_ids_t;
-+
-+static supported_ids_t intel_id_table[] = {
-+    { 6, 0x2a }, // Sandybridge
-+    { 6, 0x3a }, // IvyBridge
-+    { 6, 0x3c }, // Haswell
-+    { 6, 0x45 }, // Haswell ULT
-+    { 6, 0x46 }, // Haswell ULT
-+    { 6, 0x3d }, // Broadwell
-+    { 6, 0x47 }, // Broadwell-GT3E
-+    { 6, 0x37 }, // Valleyview BYT
-+    { 6, 0x4c }, // Brasewell
-+    { 6, 0x4e }, // skylake
-+    { 6, 0x5e }, // skylake
-+    { 6, 0x5c }, // Broxton
-+    { 6, 0x7a }, // Gemini Lake
-+    { 6, 0x8e }, // kabylake
-+    { 6, 0x9e }, // kabylake
-+    { 6, 0x66 }, // Cannonlake
-+    { 6, 0x7e }, // Icelake
-+    { 6, 0x8c }, // Tigerlake_L
-+    { 6, 0x8d }, // Tigerlake
-+    { 6, 0xa5 }, // Cometlake
-+    { 6, 0xa6 }, // Cometlake_L
-+    { 6, 0xa7 }, // Rocketlake
-+    { 6, 0x9c }, // Jasper Lake
-+    { 6, 0x97 }, // Alderlake
-+    { 6, 0x9a }, // Alderlake
-+    { 6, 0xb7 }, // Raptorlake
-+    { 6, 0xba }, // Raptorlake
-+    { 6, 0xbe }, // Alderlake N
-+    { 6, 0xbf }, // Raptorlake S
-+    { 6, 0xaa }, // Mateor Lake L
-+    { 6, 0xbd }, // Lunar Lake M
-+    { 6, 0xc6 }, // Arrow Lake
-+    { 6, 0xc5 }, // Arrow Lake H
-+    { 6, 0xb5 }, // Arrow Lake U
-+    { 6, 0xcc }, // Panther Lake L
-+    { 0, 0 } // Last Invalid entry
-+};
-+
-+std::vector<std::string> blocklist_paths {
-+    /* Some Lenovo machines have in-firmware thermal management,
-+     * avoid having two entities trying to manage things.
-+     * We may want to change this to dytc_perfmode once that is
-+     * widely available. */
-+    "/sys/devices/platform/thinkpad_acpi/dytc_lapmode",
-+};
-+#endif // __x86_64__
-+#endif
-+
-+intel_platform::intel_platform() : cthd_platform() {
-+    // Intel platform specific initialization
-+    detect_platform();
-+}
-+
-+intel_platform::~intel_platform() {
-+}
-+
-+void intel_platform::detect_platform() {
-+    // Call base class detection first
-+    cthd_platform::detect_platform();
-+
-+    thd_log_info("Intel platform detected\n");
-+}
-+
-+int intel_platform::check_cpu_id(bool &proc_list_matched) {
-+#ifndef ANDROID
-+#ifdef __x86_64__
-+    unsigned int ebx, ecx, edx, max_level;
-+    unsigned int fms, family, model, stepping;
-+	unsigned int genuine_intel = 0;
-+    int i = 0;
-+    bool valid = false;
-+
-+	proc_list_matched = false;
-+    ebx = ecx = edx = 0;
-+
-+    __cpuid(0, max_level, ebx, ecx, edx);
-+    if (ebx == 0x756e6547 && edx == 0x49656e69 && ecx == 0x6c65746e)
-+        genuine_intel = 1;
-+    if (genuine_intel == 0) {
-+        // Simply return without further capability check
-+        return THD_SUCCESS;
-+    }
-+    __cpuid(1, fms, ebx, ecx, edx);
-+    family = (fms >> 8) & 0xf;
-+    model = (fms >> 4) & 0xf;
-+    stepping = fms & 0xf;
-+    if (family == 6 || family == 0xf)
-+        model += ((fms >> 16) & 0xf) << 4;
-+
-+    thd_log_msg(
-+            "%u CPUID levels; family:model:stepping 0x%x:%x:%x (%u:%u:%u)\n",
-+            max_level, family, model, stepping, family, model, stepping);
-+
-+    while (intel_id_table[i].family) {
-+        if (intel_id_table[i].family == family && intel_id_table[i].model == model) {
-+            proc_list_matched = true;
-+            valid = true;
-+            break;
-+        }
-+        i++;
-+    }
-+    if (!valid) {
-+        thd_log_msg(" Need Linux PowerCap sysfs\n");
-+    }
-+
-+    for (std::string path : blocklist_paths) {
-+        struct stat s;
-+
-+        if (!stat(path.c_str(), &s)) {
-+            proc_list_matched = false;
-+            thd_log_warn("[%s] present: Thermald can't run on this platform\n", path.c_str());
-+            break;
-+        }
-+    }
-+#else
-+    thd_log_info("Non-x86_64 platform detected in Intel check - skipping CPUID\n");
-+#endif // __x86_64__
-+#endif // ANDROID
-+    return THD_SUCCESS;
-+}
-+
-+void intel_platform::workaround_rapl_mmio_power(void) {
-+    // First check if workaround is enabled and needed
-+    extern bool workaround_enabled;
-+    if (!workaround_enabled)
-+        return;
-+
-+    // Check if RAPL MMIO controller is already being used
-+    extern cthd_engine *thd_engine;
-+    if (thd_engine) {
-+        cthd_cdev *cdev = thd_engine->search_cdev("rapl_controller_mmio");
-+        if (cdev) {
-+            /* RAPL MMIO is enabled and getting used. No need to disable */
-+            return;
-+        } else {
-+            csys_fs _sysfs("/sys/devices/virtual/powercap/intel-rapl-mmio/intel-rapl-mmio:0/");
-+
-+            if (_sysfs.exists()) {
-+                std::stringstream temp_str;
-+
-+                temp_str << "enabled";
-+                if (_sysfs.write(temp_str.str(), 0) > 0)
-+                    return;
-+
-+                thd_log_debug("Failed to write to RAPL MMIO\n");
-+            }
-+        }
-+    }
-+
-+#ifndef ANDROID
-+#ifdef __x86_64__
-+    int map_fd;
-+    void *rapl_mem;
-+    unsigned char *rapl_pkg_pwr_addr;
-+    unsigned long long pkg_power_limit;
-+
-+    unsigned int ebx, ecx, edx;
-+    unsigned int fms, family, model;
-+
-+    ecx = edx = 0;
-+    __cpuid(1, fms, ebx, ecx, edx);
-+    family = (fms >> 8) & 0xf;
-+    model = (fms >> 4) & 0xf;
-+    if (family == 6 || family == 0xf)
-+        model += ((fms >> 16) & 0xf) << 4;
-+
-+    // Apply for KabyLake only
-+    if (model != 0x8e && model != 0x9e)
-+        return;
-+
-+    map_fd = open("/dev/mem", O_RDWR, 0);
-+    if (map_fd < 0)
-+        return;
-+
-+    rapl_mem = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd,
-+            0xfed15000);
-+    if (!rapl_mem || rapl_mem == MAP_FAILED) {
-+        close(map_fd);
-+        return;
-+    }
-+
-+    rapl_pkg_pwr_addr = ((unsigned char *)rapl_mem + 0x9a0);
-+    pkg_power_limit = *(unsigned long long *)rapl_pkg_pwr_addr;
-+    *(unsigned long long *)rapl_pkg_pwr_addr = pkg_power_limit
-+            & ~BIT_ULL(15);
-+
-+    munmap(rapl_mem, 4096);
-+    close(map_fd);
-+#endif // __x86_64__
-+#endif // ANDROID
-+}
-diff --git a/src/thd_platform_intel.h b/src/thd_platform_intel.h
-new file mode 100644
-index 0000000..5753afe
---- /dev/null
-+++ b/src/thd_platform_intel.h
-@@ -0,0 +1,38 @@
-+/*
-+ * thd_platform_intel.h: Intel platform-specific functionality
-+ *
-+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License version
-+ * 2 or later as published by the Free Software Foundation.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+ * 02110-1301, USA.
-+ *
-+ */
-+
-+#ifndef THD_PLATFORM_INTEL_H_
-+#define THD_PLATFORM_INTEL_H_
-+
-+#include "thd_platform.h"
-+
-+class intel_platform : public cthd_platform {
-+public:
-+    intel_platform();
-+    virtual ~intel_platform();
-+
-+    // Override virtual methods from base class
-+    void detect_platform() override;
-+    int check_cpu_id(bool &proc_list_matched) override;
-+    void workaround_rapl_mmio_power() override;
-+};
-+
-+#endif /* THD_PLATFORM_INTEL_H_ */
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-bsp/thermald/thermald/0002-Invoke-parser_init-before-platform_match.patch b/meta-oe/recipes-bsp/thermald/thermald/0002-Invoke-parser_init-before-platform_match.patch
deleted file mode 100644
index 6f72d0cc01..0000000000
--- a/meta-oe/recipes-bsp/thermald/thermald/0002-Invoke-parser_init-before-platform_match.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 857fbdf3e9079cec04bfa5fe7a93a432485b5cab Mon Sep 17 00:00:00 2001
-From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
-Date: Tue, 27 Jan 2026 15:26:24 +0530
-Subject: [PATCH 2/3] Invoke parser_init before platform_match
-
-The initialization flow currently invokes platform_match without
-calling parser_init first. As a result, the platform matching
-logic runs with no parsed configuration data available. This
-can cause incorrect platform detection, or failure to load
-the expected thermal configurations.
-
-This patch adds the missing parser_init() call before
-platform_match(), ensuring that configuration files are properly
-parsed and populated before any platform-specific matching occurs.
-This makes initialization reliable and aligns with the intended
-dependency order.
-
-Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
-Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
-
-Upstream-Status: Backport [from commit 857fbdf3e9079cec04bfa5fe7a93a432485b5cab]
----
- src/thd_engine.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/thd_engine.cpp b/src/thd_engine.cpp
-index 319f50b..da52a5b 100644
---- a/src/thd_engine.cpp
-+++ b/src/thd_engine.cpp
-@@ -318,7 +318,7 @@ int cthd_engine::thd_engine_start() {
- 		poll_timeout_msec = poll_interval_sec * 1000;
- 	}
- 
--	if (parser.platform_matched()) {
-+	if (!parser_init() && parser.platform_matched()) {
- 		parser.set_default_preference();
- 		int poll_secs = parser.get_polling_interval();
- 		if (poll_secs) {
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-bsp/thermald/thermald/0003-Add-ARM-backend-and-enable-ARM-platform-detection.patch b/meta-oe/recipes-bsp/thermald/thermald/0003-Add-ARM-backend-and-enable-ARM-platform-detection.patch
deleted file mode 100644
index a444c585ab..0000000000
--- a/meta-oe/recipes-bsp/thermald/thermald/0003-Add-ARM-backend-and-enable-ARM-platform-detection.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From 1931a12e7e44b6b85a02a5d8158829eff4b9cc92 Mon Sep 17 00:00:00 2001
-From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
-Date: Mon, 9 Feb 2026 16:11:31 +0530
-Subject: [PATCH 3/3] Add ARM backend and enable ARM platform detection
-
-thermald historically supported only Intel platforms. As the
-codebase is being refactored to allow multi-platform support,
-ARM platforms require their own backend implementation to
-handle platform-specific thermal controls, capabilities, and
-configuration rules.
-
-This patch adds the initial ARM-specific backend files and
-integrates ARM selection into the newly introduced platform
-detection mechanism. With this change, thermald can correctly
-identify ARM systems and route thermal management operations
-to the appropriate backend. This establishes the foundation
-needed for future ARM thermal features and expands thermald's
-usefulness beyond Intel-based platforms.
-
-Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
-Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
-
-Upstream-Status: Backport [from commit 1931a12e7e44b6b85a02a5d8158829eff4b9cc92]
----
- Android.mk               |  3 ++-
- Makefile.am              |  3 ++-
- src/thd_engine.cpp       |  1 +
- src/thd_platform.cpp     | 14 ++++++++++++
- src/thd_platform.h       |  2 ++
- src/thd_platform_arm.cpp | 47 ++++++++++++++++++++++++++++++++++++++++
- src/thd_platform_arm.h   | 38 ++++++++++++++++++++++++++++++++
- 7 files changed, 106 insertions(+), 2 deletions(-)
- create mode 100644 src/thd_platform_arm.cpp
- create mode 100644 src/thd_platform_arm.h
-
-diff --git a/Android.mk b/Android.mk
-index c14fa4a..5d38c35 100644
---- a/Android.mk
-+++ b/Android.mk
-@@ -45,7 +45,8 @@ LOCAL_SRC_FILES := \
- 		src/LzmaDec.c \
- 		src/thd_gddv.cpp \
- 		src/thd_platform.cpp \
--		src/thd_platform_intel.cpp
-+		src/thd_platform_intel.cpp \
-+		src/thd_platform_arm.cpp
- 
- LOCAL_C_INCLUDES += external/libxml2/include
- 
-diff --git a/Makefile.am b/Makefile.am
-index 2e76187..61741ba 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -77,7 +77,8 @@ thermald_SOURCES = \
- 	src/thd_lzma_dec.cpp \
- 	src/LzmaDec.c \
- 	src/thd_platform.cpp \
--	src/thd_platform_intel.cpp
-+	src/thd_platform_intel.cpp \
-+	src/thd_platform_arm.cpp
- 
- man5_MANS = man/thermal-conf.xml.5
- man8_MANS = man/thermald.8
-diff --git a/src/thd_engine.cpp b/src/thd_engine.cpp
-index da52a5b..9024650 100644
---- a/src/thd_engine.cpp
-+++ b/src/thd_engine.cpp
-@@ -45,6 +45,7 @@
- #include "thd_int3400.h"
- #include "thd_platform.h"
- #include "thd_platform_intel.h"
-+#include "thd_platform_arm.h"
- 
- static void *cthd_engine_thread(void *arg);
- 
-diff --git a/src/thd_platform.cpp b/src/thd_platform.cpp
-index 25ce094..647b079 100644
---- a/src/thd_platform.cpp
-+++ b/src/thd_platform.cpp
-@@ -22,6 +22,7 @@
- 
- #include "thd_platform.h"
- #include "thd_platform_intel.h"
-+#include "thd_platform_arm.h"
- #include "thd_common.h"
- #include <cstring>
- #include <iostream>
-@@ -45,6 +46,10 @@ void cthd_platform::detect_platform() {
- 
-     if (strcmp(sysinfo.machine, "x86_64") == 0) {
-         detected_platform = PLATFORM_INTEL_X86;
-+    } else if (strcmp(sysinfo.machine, "aarch64") == 0) {
-+        detected_platform = PLATFORM_ARM64;
-+    } else if (strcmp(sysinfo.machine, "arm") == 0) {
-+        detected_platform = PLATFORM_ARM32;
-     } else {
-         detected_platform = PLATFORM_OTHER;
-     }
-@@ -79,6 +84,12 @@ void cthd_platform::dump_platform_info() {
-         case PLATFORM_INTEL_X86:
-             thd_log_info("Platform: Intel x86/x86_64\n");
-             break;
-+        case PLATFORM_ARM64:
-+            thd_log_info("Platform: ARM64 (aarch64)\n");
-+            break;
-+        case PLATFORM_ARM32:
-+            thd_log_info("Platform: ARM32\n");
-+            break;
-         case PLATFORM_OTHER:
-             thd_log_info("Platform: Other (%s)\n", get_machine_type().c_str());
-             break;
-@@ -102,6 +113,9 @@ cthd_platform* cthd_platform::create_platform() {
-     if (strcmp(sysinfo.machine, "x86_64") == 0) {
-         thd_log_info("Creating Intel platform instance\n");
-         return new intel_platform();
-+    } else if (strcmp(sysinfo.machine, "aarch64") == 0 || strcmp(sysinfo.machine, "arm") == 0) {
-+        thd_log_info("Creating ARM platform instance\n");
-+        return new arm_platform();
-     } else {
-         thd_log_info("Creating generic platform instance for %s\n", sysinfo.machine);
-         return new cthd_platform();
-diff --git a/src/thd_platform.h b/src/thd_platform.h
-index 25746c3..096a55e 100644
---- a/src/thd_platform.h
-+++ b/src/thd_platform.h
-@@ -29,6 +29,8 @@
- typedef enum {
-     PLATFORM_UNKNOWN = 0,
-     PLATFORM_INTEL_X86,
-+    PLATFORM_ARM64,
-+    PLATFORM_ARM32,
-     PLATFORM_OTHER
- } platform_type_t;
- 
-diff --git a/src/thd_platform_arm.cpp b/src/thd_platform_arm.cpp
-new file mode 100644
-index 0000000..a43ef9f
---- /dev/null
-+++ b/src/thd_platform_arm.cpp
-@@ -0,0 +1,47 @@
-+/*
-+ * thd_platform_arm.cpp: ARM platform-specific functionality implementation
-+ *
-+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License version
-+ * 2 or later as published by the Free Software Foundation.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+ * 02110-1301, USA.
-+ *
-+ * Author Name <priyansh.jain@oss.qualcomm.com>
-+ */
-+
-+#include "thd_platform_arm.h"
-+#include "thd_common.h"
-+
-+arm_platform::arm_platform() : cthd_platform() {
-+    // ARM platform specific initialization
-+    detect_platform();
-+}
-+
-+arm_platform::~arm_platform() {
-+}
-+
-+void arm_platform::detect_platform() {
-+    // Call base class detection first
-+    cthd_platform::detect_platform();
-+
-+    // ARM-specific platform detection can be added here if needed
-+    thd_log_info("ARM platform detected\n");
-+}
-+
-+int arm_platform::check_cpu_id(bool &proc_list_matched) {
-+    // For ARM, we assume the platform is supported
-+    proc_list_matched = true;
-+
-+    return THD_SUCCESS;
-+}
-diff --git a/src/thd_platform_arm.h b/src/thd_platform_arm.h
-new file mode 100644
-index 0000000..e970803
---- /dev/null
-+++ b/src/thd_platform_arm.h
-@@ -0,0 +1,38 @@
-+/*
-+ * thd_platform_arm.h: ARM platform-specific functionality
-+ *
-+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License version
-+ * 2 or later as published by the Free Software Foundation.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+ * 02110-1301, USA.
-+ *
-+ * Author Name <priyansh.jain@oss.qualcomm.com>
-+ */
-+
-+#ifndef THD_PLATFORM_ARM_H_
-+#define THD_PLATFORM_ARM_H_
-+
-+#include "thd_platform.h"
-+
-+class arm_platform : public cthd_platform {
-+public:
-+    arm_platform();
-+    virtual ~arm_platform();
-+
-+    // Override virtual methods from base class
-+    void detect_platform() override;
-+    int check_cpu_id(bool &proc_list_matched) override;
-+};
-+
-+#endif /* THD_PLATFORM_ARM_H_ */
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.11.bb b/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
similarity index 81%
rename from meta-oe/recipes-bsp/thermald/thermald_2.5.11.bb
rename to meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
index 0425d1c575..de6e26ec8a 100644
--- a/meta-oe/recipes-bsp/thermald/thermald_2.5.11.bb
+++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
@@ -12,13 +12,9 @@ DEPENDS += "autoconf-archive-native"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea8831610e926e2e469075b52bf08848"
 
-SRC_URI = "git://github.com/intel/thermal_daemon/;branch=master;protocol=https \
-           file://0001-Refactor-Intel-specific-logic-into-separate-files.patch \
-           file://0002-Invoke-parser_init-before-platform_match.patch \
-           file://0003-Add-ARM-backend-and-enable-ARM-platform-detection.patch \
-           "
+SRC_URI = "git://github.com/intel/thermal_daemon/;branch=master;protocol=https"
 
-SRCREV = "5269afcf3e021e4e1b672b4640a0358f4ae5821b"
+SRCREV = "9996a1a1cdd01d32cd411459368a177f463d0047"
 
 inherit pkgconfig autotools systemd gtk-doc
 
-- 
2.43.0


