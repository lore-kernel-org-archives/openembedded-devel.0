Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6305.1793788286407104420
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CPuznK8e;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YZ5O0lqu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KZs21874561
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Nov 2026 09:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5XH/gN9vOVXSaWXDljW4n7qzZKHu2HY9bnz
	D7qSJagU=; b=CPuznK8eghrYg75ze9fIb65yA1dmgoaxMk75DjOwOYS0zGTn8nb
	pCuffLjt1MzjU6Er2WON/cljc09xiMPCujWyzF8dDgriVwYTCFno6E3aeDw9Vsi2
	Cp6eJSUBCyv24EuVnQBuvH/TlBauQAKJ+8Um991uOIJx4PeWSpIR9DwgUkwSU2Sm
	MzulGma0SRU6+i6aJaM0dfUG8JrE+EiwyhCxWel2RRJvDL33mh1H6XJ3F80zQ5zn
	EoFINbIQlQqF+FNWioyR5mg1n+yjSRQclXvsh7C2e/L9igsK5rFzeZBBjgp7l2Dl
	WAR+MruFtACjJOmFr3mddyZotFeXb1tDNdQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mu6sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 09:38:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf45388253so361747137.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793785111; x=1794389911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XH/gN9vOVXSaWXDljW4n7qzZKHu2HY9bnzD7qSJagU=;
        b=YZ5O0lquoDxR5qrX2fehtOO/WU8c4aUyVFib93fsa/FobnnHcygfZKvZT4tmPsH3im
         BWsAqO8P3N9bGsM753bHb5glBcO7If/cST727mPXaot1d6K9OzKvCn0HcVTuC/cISTO3
         Ll46eTCKVVRwgwIEx5TBjcYHDeqVLB73vs3zx/nGQ+1wNEaGljgfbHF2FKZod1Se+NxL
         LIKNQUoJXtly0bti7+zQa6GIuu/g7EDeXHgb1GvbkPRTdyp3r9QWJp/lceRxIh/rdk1r
         +ORV5JKvrSTdpYGb+vTLjDo9Cbmm15ufwrzQMY8BI3PoQAz06ZIDFp7ct+nvuAtV/VHh
         uYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785111; x=1794389911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XH/gN9vOVXSaWXDljW4n7qzZKHu2HY9bnzD7qSJagU=;
        b=ybFMen0/uAoxt1XHb4pJTcDiazFGnXUmElm8ex2mj4UV1gpu+wS5wkkUWZBrFwgBzX
         FxyHjRhjVO5ELFBGfQK6Lf/PmvDumVM+8iIXeg7a/wut7J4NoOm5lDkwDVEXzIRM3JD9
         ivWpGvZwMJRBYkvu1hyieKQBB+MDKhYFo9A+L5jNAbFvKg4A52aX9FcvZtNfWpTmxOQk
         WuN7GBxcAa7Or2h6jGwEJNvs0+TEo2EDmTRbUnQq8Ahgo0fsA1O5PFA6lLIW1efMOpqW
         noR1jxBS+R/Qeerzgxelgzpb1c19U/NQ/wXSTBSacvb24ul+6ppKRyZLMUUZyTRyOrW8
         iucw==
X-Forwarded-Encrypted: i=1; AKwUvBwofXF7MR6VLCCcIRQ6aoajzxredKRdoSrMuG5A+vMH28geUad24f+vaRgavXLvFDuczGFPp3l0OpXZvQ+Z83hc0QA=@lists.openembedded.org
X-Gm-Message-State: APuU4Z+bIdYycuadd6g7xJEzQzbEVZ2suzBRPyCc4niYQgxmM1CLVWhl
	VYNaf/54gS3hO1iH+/3P3YuNdbjes5swcnkszEpDM9wBM+AQreVQJDoUU7xBVMHDqt19DIN4BO1
	h4WVoA+1zy6pIHlH+q8pzPsJt2wdXpYMT3f1LBQvsx45mlfmGi+CMZKOmK2N4eY9cg1zmpmAlxD
	sK7rHrB3BL
X-Gm-Gg: AYBFou3qteZ5fol8X56uZOTJbffEZJmum4pUudIw43DzhaTbJVbE9QnvlAB3fMwx1wW
	++aJJLcltOMkgdkbuWo9349IzQoy07EPlrLEsSNlV7wLXvVBWZapQmJoqHjEbKyq3jWM5bai0qv
	BBTkLA5fxWXFR/KLhN7UjHJAZ6qznI+pNoT7+IC62TYCZ62qyTH4WCAM8gyC8V+ME8ow/+m/V0e
	rjmtOKUIuUQa1Dp6xlHlU6H07IBmhmLQfZ/C7fhFOqbqyThB5MjgxA0ym4Usu/7ZMJu540dAqFM
	l4YiN0rT+CJq36H5UxsM7bvKqWFneHoIbN+cvw6k5vc8oUErWpCLuZaz9kJm4SuDYZYut5hiGqB
	cCU5EXbjgpbR2LVFiZxWSSd10BtjZUxIa9VfZMRLZzDx0+/K90LHoab87oKYZwLWNDmZrHi3cii
	g8
X-Received: by 2002:a67:f141:0:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d2726664f6mr341022137.32.1793785110830;
        Wed, 04 Nov 2026 01:38:30 -0800 (PST)
X-Received: by 2002:a67:f141:0:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d2726664f6mr341018137.32.1793785110376;
        Wed, 04 Nov 2026 01:38:30 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm2742726f8f.37.2026.11.04.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:38:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libgpiod: update to v2.3.2
Date: Wed,  4 Nov 2026 10:38:25 +0100
Message-ID: <20261104093825.33421-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-GUID: cqvm4p79O6dArjsVBASxUKDr2X6K4k3h
X-Proofpoint-ORIG-GUID: cqvm4p79O6dArjsVBASxUKDr2X6K4k3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzOCBTYWx0ZWRfX7Z8uwjnt3W7K
 ILYuHwi+o4uJz3+nYZqchNnWfEpyoIsGXjX6RrWc+OR8SM5rJBdp5F8bfFv/3mw18A6OYF1Usi6
 VqLP/hHXPNLrbeu0n0Iv09hjzTNxNUC3XNkBtXf6cO/20AGHt//FDxYBXG+xOlqqTQPfNVrvN9U
 9J++KJYf0UCgbvmz91+6U8HiXUikHtF0EgCsxkjH+z5/RIooOPYyKWiouCNIPXbHdqj+rrLPuT1
 bO0E/EKONjHjt1v5jdPHbZNEx5WMnU6n+iC9KDveeijriNvyhykh7knYMRszoU7U7iuOhnyxIFB
 JiGMH+exiOIUmtEi56H2FLQO1UmyNApCtp5E3qFnDsi29D+fo9ityJRnMW0/i77H80Rhk/4cHgq
 iCy4sYjoh9OirFfxpkjZnPovLnfrJE3SPsmk0I6QfLp3ds1l87KcNLtJJQWf/9BlCWTnsfDo1pe
 dDTfcuUnG8/LasnhZLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzOCBTYWx0ZWRfXxSjZfOCtQoBd
 xbt+6s8P7hmu/w5uKyr4dn7KSp0L+5DD1OP5QCn9EDPbaGQnTZZP7j/lVBG/OnA18HYgH5Msh2k
 jiF6jFGNXzu1NiVdBps71sCJrDa8gGk=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeafd17 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=V1IuqoB8MXuX2cYcXloA:9 a=gYDTvv6II1OnSo0itH1n:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040038
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 10:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131842
Content-Type: text/plain; charset="utf-8"

This is a bug-fix release addressing a couple more build issues after the
conversion to meson. Not really necessary for meta-openembedded but
let's upgrade for consistency with upstream.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../libgpiod-2.x/fix_gpiodbus_license.patch   | 26 -------------------
 .../{libgpiod_2.3.1.bb => libgpiod_2.3.2.bb}  |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiodbus_license.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.3.1.bb => libgpiod_2.3.2.bb} (97%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiodbus_license.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiodbus_license.patch
deleted file mode 100644
index aa1eb0d8ab..0000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiodbus_license.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-dbus: fix the license of gpiodbus.h
-
-The libgpiodbus library - which is entirely automatically generated with
-gdbus-codegen - was meant to be available under LGPLv2.1 like all the
-other shared libraries in this project. Change the SPDX tag in that
-file to LGPL-2.1-or-later.
-
-Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
-Link: https://patch.msgid.link/20260925-libgpiodbus-license-v1-1-d7ddafca8872@oss.qualcomm.com
-Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=668a0efe918f9a763406239615175f759a6835f9]
----
- dbus/lib/gpiodbus.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dbus/lib/gpiodbus.h b/dbus/lib/gpiodbus.h
-index 025c9c8586818051719078ba9d240f6d8b39e016..7557a576a5e9c6703ef78054ddc62a8b270de422 100644
---- a/dbus/lib/gpiodbus.h
-+++ b/dbus/lib/gpiodbus.h
-@@ -1,4 +1,4 @@
--/* SPDX-License-Identifier: GPL-2.0-or-later */
-+/* SPDX-License-Identifier: LGPL-2.1-or-later */
- /* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
-
- #ifndef __GPIODBUS_H__
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
similarity index 97%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
index 49327591b7..524a40c822 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
@@ -25,10 +25,9 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += " \
     file://gpio-manager.init \
-    file://fix_gpiodbus_license.patch \
 "
 
-SRC_URI[sha256sum] = "e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30"
+SRC_URI[sha256sum] = "dc48fb87cd72019745acb201599caf559556b5d913844df0ed011067d19e9a6b"
 
 # Always build tools - they don't have any additional
 # requirements over the library.
-- 
2.47.3

