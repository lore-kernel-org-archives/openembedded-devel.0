Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E264CD4F25
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20218.1779006278270478128
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TIUZGxL1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bLyBuDKH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNoAmW2006438
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iD/Qz9q2JaZ
	52jVE472UnLAa5YX1C4PCMTAOf6VKtdQ=; b=TIUZGxL1ifn80I5Mra1KP7IPmDn
	AfdkPhGkqlKi5A3QMckdlfs1DngZ8WZQZCA1fNcpJU1GInnliZPG0a0HqJUwU6uH
	J76dYQaAYpvKXiigMzwtpxwV/sTM8g/BT0t6TLOLk/WfJmpM3i5n1ANrSkDy4fRF
	J3wI7dQbBCLiutdFtySqf6nHSpKvzXTTjH68vOZfsKXpg2XpdocBE1ZCEPkfFaTG
	tBh1RJfsYNQii2OCIHbpLwPpJwz4jeggxawJPe8Xm2ffQj8S5A0OtaVd5f27MIk0
	lF/ljUJpqSig+oumynOPOBBLFwsPu8jb4md4dxcMp3X1GGZrQUtL99wDDfw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw2g1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so958740a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006276; x=1779611076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iD/Qz9q2JaZ52jVE472UnLAa5YX1C4PCMTAOf6VKtdQ=;
        b=bLyBuDKHSXc8rky01vt7XCt2fIGm61bb9/mcg35BiFVTpaPdlCwNcvuUeyuJGWsxeU
         L52eN7gn907ktYCwASoIScR7leK6vU3Zc4He02rqbGgYMBWVUSvW4dYC61AzyROUTEkr
         lzP6LW7UeSWNpxPXp2g/+sepXN37uUtzXsKjJTphJUvZF2lQjqcX3QvboD4tFmA6dzJZ
         SlkQfJBHDE0NuMdHkZOpgvOcWIrY0g8IFd/fJHOngQ+TIA4d6xlp4vMSo4YXkZfvPkIG
         IlDzVaKFWHuFh8C15dNMMNh1a900bf9FRbpg0wWcwWrCXrVx7aS70uEPs4QyiiIVCf/r
         cnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006276; x=1779611076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iD/Qz9q2JaZ52jVE472UnLAa5YX1C4PCMTAOf6VKtdQ=;
        b=NywEAnEAhl8D7fXaTp4N/h9MRV7eymWiZq05enjl5XNAFeqZFj9l/mcJ2/SB9lHrKj
         Q6FwrwYGV/iGg7eQe3UhCyxfkOidEOUBImkko3VLL9e1Gg70HtMgtHmCOauj2kRDNhTi
         WuxRD5PuTvU3hSqtYm2yV0rSSiWZDa2zLglvAfOLh464xZn4Q3Xm11U2jSisMueO5jFS
         1p18dB9Nfctf7YzD9ewTloyCyIv278/5XJpvWBc2nP0Te9qs5wrVOJYo3uY+A7kxycBr
         Y6JB0Cgd44ZKR0aRqNK3ZUdBABenOxGLvwyys6ju1Ljm6v+FH0ZNjz5p4ajUnl+bHtXu
         rmYg==
X-Gm-Message-State: AOJu0YwVv7Lb5dGby6h8nAPWVRTstS3/DbIaB9yEtDOC8wR8XWtGbxZu
	armN8yeCjUUkBZUmUQ/QYTyynaM7jGgjWm4L92fhPFQVZW0vgnXGvoSoiBy5caK5ylRcx9Ee9Ge
	Jr+raPQxLSIQ97mgsZFvFoXNyPjnFCu1muMlWrNGjgAM0nHkGASVoJqYoG8L1NH6UwE7WO4Pu3t
	4ptVck4KVBRTfLQpnQ8BVRhw==
X-Gm-Gg: Acq92OGlnFxFYI2FaLF8w2oFewMnjHAUX2CQ+I0lVsqGmhMjMlEErKOcNpdH9Cj89Ss
	cBNyCGWJS/NBz+tgfI6woNopEHY4S10hpSI6HjfqrTz7//vyiKPN4YfnNsK9/11YKiNd0VsNFJw
	DyaYzH2kvefkE/gVJf7FZm/OoY+k8fKWcQl8fyc5TlNvx8c+GdYsCV01t0vL/pZYAO1HxpO22Kf
	rrt+g+cACTlJHLeddWgEtsqPmgJj1VjKdki8mpUlYNBJXVGOqk4EnK81jsWnbWwPn1Q2lvDymsP
	jB77VSGlxICeTyJahhOMDCbGRAEa4PaLPpI1RRgQt+9wmehHqbtDkzIoPVmh8uyfs7xEdvKxQ5E
	WP4qXm/4SO4ogcRQDPK0ytFR28+5oVXkl4oPqGMfsZhPjG65yHY6t
X-Received: by 2002:a17:90b:57c7:b0:369:2e00:1ff0 with SMTP id 98e67ed59e1d1-369519c6663mr11202490a91.6.1779006276200;
        Sun, 17 May 2026 01:24:36 -0700 (PDT)
X-Received: by 2002:a17:90b:57c7:b0:369:2e00:1ff0 with SMTP id 98e67ed59e1d1-369519c6663mr11202468a91.6.1779006275700;
        Sun, 17 May 2026 01:24:35 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:35 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 24/29] hunspell: upgrade 1.7.2 -> 1.7.3
Date: Sun, 17 May 2026 13:49:52 +0530
Message-ID: <8eacf145c84c7a81d93e009b88045fe0e608d952.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX21GZ3E2qEhQ3
 91AOfn6OcVG1blHT1K618Lg2Uxhrj0BYxEefWwDILiBV/PXq2gmbaRBa/dNcU2b9pWqelZiGB54
 +mY8TrsZ9hwYe63Y5TVcMByXTLsJTbpcMqwW9nlKO0BgFcYswJjizpW+sj9hYO5xYJXVYH9S8Iy
 GcyM0hpDldqIqZ2ifxMqHCQExkQPuw+uaBXKqvOKbDKixR0xkjNODRDDheuM87LrsVLPmLGRHkP
 2rUOimSatyJOIyQsuz6bCsNO9JxeqhKp14KswuubrcFtBgU5bsrN6JqRQ6LkYf2hZwNYB/8El+0
 AZNHE1u8AZuMqv+L9A9YafMMFU2yiNj5lPP5Od6i09iURbHLChxQxI9/z9Cj3N5Ru2qsT7e/TFG
 1HfWlp1Y2lX+UXO5X61ug4qSC3mK+p7MPUGN/+c5cs4aJTeKSxBUzisyJ1dma7/vFa/Bp9V7WHj
 zCDEW9FWvgVX0Ev4f8g==
X-Proofpoint-GUID: 5ylBb17KN-B7NrtKM0MUCbiNEhsHTcOt
X-Proofpoint-ORIG-GUID: 5ylBb17KN-B7NrtKM0MUCbiNEhsHTcOt
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a097b45 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=_E6mNdttUbGOu7EeiOwA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127037

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix stack-buffer-overflow in Hunzip::getline
- Fix stack overflow in compound_check on Hungarian dictionaries
  under certain conditions
- Fix UB when SFX condition starts with '^' (#1095)
- Bounds-check continuation bytes in u8_u16 (#1110)
- oss-fuzz timeout/OOM hardenings
- Fix #715 CHECKCOMPOUNDCASE considers digits uppercase
- Fix #748 hzip: cannot write file
- Fix #1024 std::string bounds check
- Fix #1044 tools/analyze crash
- Fix #1076 flags 65520/65521 wrongly rejected
- Fix #1058 don't suggest the input word as its own correction
- Fix #1002 exact word marked as a near miss
- Fix tdf#125600 dotted-I regression
- Partial Unicode table refresh for Mc combining marks (#1057)
- Add Hunspell_add_with_flags / Hunspell::add_with_flags
- New SPELL_BEST_SUG flag, MAXBREAKDEPTH limit
- Replace clock() with std::chrono for suggestion time limits (#716)
- Improve exception safety (#587)
- Document analyze/stem/generate requirements (#554)
- Report iconv direction on private dic load failures (#619)
- Show dic load errors unconditionally (#1012)
- Rename es_EU to eu (#1113)
- Build fixes: out-of-tree, Windows ARM64, MSVC hzip tmpfile (#919),
  --disable-shared with mingw32 (#698), iconv on msys2 (#723),
  ncurses with separate tinfo
- New fuzzers: hzfuzzer, persdicfuzzer, parserfuzzer, affdicfuzzer
- Coverity-flagged fixes
- Merge in weblate translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit dad06c74bb94e509ecb03b89fb6655cc67604968)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../hunspell/{hunspell_1.7.2.bb => hunspell_1.7.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.7.2.bb => hunspell_1.7.3.bb} (89%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
similarity index 89%
rename from meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
index 67a51f5c9f..94ed985c42 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
-SRCREV = "2969be996acad84b91ab3875b1816636fe61a40e"
-SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
+SRCREV = "c5f98152a274e25b5107101104bef632b83a0cc9"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
 
 
 inherit autotools pkgconfig gettext
-- 
2.53.0


