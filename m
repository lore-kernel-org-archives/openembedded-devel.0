Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04696C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:40:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12825.1786898409000253527
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=o4QNWd4E;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Q2/Y82IE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GDknAN481417
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hNcvYAH3ug9sO/fJiCY76lt1PjE9NSfo8ug
	W9gHysxo=; b=o4QNWd4EXCi4vjnLz/u4MDWBVyPitEMzb93kjMJ53SwBQ9y0V5m
	heRLYWRleGXNluIryx8G6d1z70QmsROZw7DAZFrXLjfaa2GtHESeENEYqoAT+tFA
	p4i55S+HFsJh8R4QDyob5LLR8+Q95aHxASSY6p6gUyvy1tki4mx9eh31mqm+8KK/
	39pg+SreGfEbpRUnDyP2U4RgxFKhyii6lV1zcOzcDGADM9q5H72/6WMKo2wjCsSr
	qcV5SP0yabLbylye3E5IP44YakmaFyFEnt7Wa57Yly8GfHywHSTf5aCEs50jAtBq
	AgrZI9Lu9XI1nwbzGQDm5H4uRyDSKB3dvBQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfbsvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:40:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3012468a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786898408; x=1787503208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNcvYAH3ug9sO/fJiCY76lt1PjE9NSfo8ugW9gHysxo=;
        b=Q2/Y82IEuXg/hSQGP1N36NVuvZdaTMqYxWYCbbMQ7d6m72pBenKn+iYxKOVaE+nm4i
         mmrW4zAlKrBCU5eNaUtE9nARDZe9mSrYv759q5DXgBiIbIyWmSrvTnbH5cw/S4bDgwVu
         RdTx+i+yONpCyKdjdEY3BPYypq+ZSjdVzkIV9P29c1bVN4SEQ6Luo27FUv5LtzpXyii/
         Ywe9i4z4TihWy7kolLSGoRMFZrJIyuL/DkbQy8CN2zDLQnJwfvUNvQPNroISkVbzjJMS
         l5F5U9A1VlwnzpwLyC7oUSJL1ZqzqN61ji8rqhqkBUmAGzzTQUdNz1U/YTYtOF0MyAt2
         s+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786898408; x=1787503208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hNcvYAH3ug9sO/fJiCY76lt1PjE9NSfo8ugW9gHysxo=;
        b=sBIxwobk/oW1hvgiQdVBgek9YJ8RiqKRPqCrdpl8nsdRaEx5tNnBFtPYvU9EdXSQOX
         jknXk66G5zPzwPnQObW8U/c45mnKpB/BzOnf0qasxBVet2P7qFJbSepRw7139Bmcrovv
         /3I6X4SH15qD1J5zC7R4v9AN1Uyjz27sxFgHa+YKsXaakJyR3n711kwwZ0RFj8tpJpTr
         xfOjx0XszYhoYkHld1/xhNuNE37mfeemVjHJTsWfEhcigbGVkVPMltc1xv11MBzmAQJT
         ykudyCaOY+cwFVDYgABDKh1Fk9iD7m2YyCATn9/yP6jT5infYsf/y8GeaKuF0IrDo/JV
         78sQ==
X-Gm-Message-State: AOJu0Ywo+BRA+wZ3LZvXBqTqa2xMdYw5BIDRWJjF8u5VwQGLsK4ENoSi
	Bf9z1oGG2RA7ji+j9pd7EpViS8Rg6C5JHd3CIiF9R2TYkCgwcLQItZ8+ngar4HOJrmnBiiNAZX9
	hDhjKcaqSoGXLHCGe2uKvEIBoY1QYaP1Ry42sWoOvKD8Jaziy/lpKOHVFfbs7OJtRn8AQN1pAvJ
	MsC17kV/4CYWnoZNY8
X-Gm-Gg: AR+sD13rutfFnshkz89YAbr0U/ONwLGKSb36bSJSbH+LTRM5SjnXUyGmWXPL2gTs+8a
	YS7gT7rfFHENbPa+xVakv47n26DYh4DQsLpSnrk9ImhE+RSicGDA+JC1MgMz7izYSU7TruArrnE
	reSWqh1lroT8aHVM8vyVK0UK8rH0sIvhXPla+4jdsP09l1odZ+H5X8O6RO67N4Z0IY9Xq1m2JLx
	ImkOpnkoBppAdoyO4wDl7ZUoFMQCZw8F0oRCCOVxayf2S1hLMHlB957e5tgdb6nU2U2pyi+V8de
	6z9fsF3Ly0DGeclkeHwH3spZ03aK82hQ9J29gLqcDRBlxTgNo2XZuhV7Pk5YJCnYSaTVKTm0BkA
	/v3kNXHWmRnQc/wearoDs8KGPzihW3i73gWA9sHtm2XWK9wx8y7KuxG1mNdX486Cxjxhj0YGgC+
	HLLzz1WBZLyzzV0kIjX1zzblShRbj2ARRhP9w34qc=
X-Received: by 2002:a17:90b:1a87:b0:38e:59c2:cbc5 with SMTP id 98e67ed59e1d1-3933b95700dmr16861967a91.18.1786898407753;
        Sun, 16 Aug 2026 09:40:07 -0700 (PDT)
X-Received: by 2002:a17:90b:1a87:b0:38e:59c2:cbc5 with SMTP id 98e67ed59e1d1-3933b95700dmr16861934a91.18.1786898407151;
        Sun, 16 Aug 2026 09:40:07 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e319fbsm1887765a91.2.2026.08.16.09.40.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:40:06 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] redis: fix build of the bundled xxHash with -Og
Date: Sun, 16 Aug 2026 16:39:58 +0000
Message-ID: <20260816163958.3664646-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OZ6oyBTY c=1 sm=1 tr=0 ts=6a81e7e8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ivUFQJVpqsxfdKv6E7gA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: NtUsLqWH3Liu4Q1YR9h_tMLug8QxZ7vd
X-Proofpoint-ORIG-GUID: NtUsLqWH3Liu4Q1YR9h_tMLug8QxZ7vd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEzMyBTYWx0ZWRfX+gYrnRIoIelp
 eE+uUEhBbyxUusRlIveK5ugZECWDNxRqwa8D52uwWDiaxGrjgqoe+ZaWs+F7UQJdH96dipLkSbN
 EMIZ9PncjzZ6BqYA5JJ9xiThzUJlIoY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEzMyBTYWx0ZWRfX9lxLkdKnwcdG
 V05V4C+HU5HUIcSH/eJmhPiMmtdspvtLkRwXusxzEGM1iW458BGmQEaYyed4mUqPpwAisIoKYSq
 kzySZE7hemkiPRBrfeRI9u2gNNgyRPn+aDlTIEaX26gXYvHw7RFrTS35RI0eqGavl9O8GmLfDMX
 lIxkRFpSyfficbnVRWwSnVWAxtcQG4Q01u11DnA3XDWfJqeRExXbV5kBI5LK2wLVHvIw/ZD4ULk
 swr8siM53dyPNt8u/f/xUwCh8NZkdu1VQFuDzQreLGY2Y3kAD3Cy712vI0nDRGSb3ZtwirSjTZ2
 2yRRjWREX20s3+euRGRVTWFcN/85DpyhiVqVh8FSOQt1BMAcKLbK1cuguj1p8EMGXIsnp3dP9Xc
 6xwG3x6VZu15iv+hDK/z3MmEDfCyZyZUyg9Kqs6JyPSmonL1Ok9cNR9pGjVRnSxMpUOUke3zM7m
 hJ8tvKAqjCTBiozNQUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160133
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129176

redis 8.8 started bundling a post-0.8.3 xxHash snapshot in deps/xxhash,
which is built and linked into redis-server. Its XXH3 accumulate and
scramble routines are marked always_inline but are only ever reached
through function pointers, so the compiler has to resolve the indirect
call before it can honour the attribute.

xxHash drops those inline hints on its own when __NO_INLINE__ is
defined, which covers -O0 and -fno-inline, but nothing covers -Og.
Recent GCC no longer resolves the indirect calls at that optimisation
level, so every build with DEBUG_BUILD = "1" fails:

  xxhash.h:5476:1: error: inlining failed in call to 'always_inline'
  'XXH3_scrambleAcc_neon': function not considered for inlining
  make[2]: *** [Makefile:108: xxhash] Error 2
  ld: cannot find ../deps/xxhash/libxxhash.a: No such file or directory

Upstream xxHash closed this as not fixable in code (Cyan4973/xxHash#943)
and instead documents XXH_NO_INLINE_HINTS as the supported way to
compile with -Og. Define it when -Og is the selected optimisation,
leaving regular builds untouched so xxHash keeps its inline hints there.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta-oe/recipes-extended/redis/redis_8.10.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_8.10.0.bb b/meta-oe/recipes-extended/redis/redis_8.10.0.bb
index 6176dc45be..3edaa9155c 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.0.bb
@@ -43,6 +43,14 @@ EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
 TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
 
+# The bundled xxHash marks its XXH3 vector paths always_inline but only reaches
+# them through function pointers. It drops the inline hints on its own when
+# __NO_INLINE__ is defined (-O0, -fno-inline) but never for -Og, and recent GCC
+# no longer resolves those indirect calls at -Og, so deps/xxhash fails to
+# build. Upstream xxHash closed this as not fixable in code and documents
+# XXH_NO_INLINE_HINTS as the supported way to compile with -Og.
+CFLAGS:append = "${@' -DXXH_NO_INLINE_HINTS' if '-Og' in (d.getVar('SELECTED_OPTIMIZATION') or '') else ''}"
+
 do_compile:prepend() {
     oe_runmake -C deps hdr_histogram fpconv hiredis lua linenoise
 }
-- 
2.43.0


