Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821EAC5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 01:03:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9595.1787014990293537222
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 18:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RWuQt12d;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=kfXwJK3x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkSY53058790
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 01:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k46A7Ir/QjT
	b+nHZQISIIObeEqaeQhVTxjDABU2C/Cg=; b=RWuQt12d4QS0JXq/XjuDuEplUZW
	tT+6gZSNiMtjMsZkHt6LcFy/JtPiR6L8it1PZpUiqo5Fvtq41l0LxpYSHk8mDmT6
	iJCFb0RRLdHD2zffXH8ubYe6BcYkLDOYFPUyAYxBV8h+7gZDdRCGoRLuNkIYBCUI
	jF5QFOCIOzBLRMTPEzRrlvWLmug/tJ6QyOS/KAS8oTy9wsZr/jxeQOcu5AR9/9te
	FIF+6HAuc5xb/oH9B6L2liPNd2HSdFSNpCyTsmVKxaweo1nYyhVPHl839KXVWPj+
	UgKVtMTE0rLy9FpISMQN+X7SQQtveEooABshSLQnI2b7W+SQyYbRV6e5BEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7kmy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 01:03:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so6457539a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 18:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787014989; x=1787619789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k46A7Ir/QjTb+nHZQISIIObeEqaeQhVTxjDABU2C/Cg=;
        b=kfXwJK3xJPbOQ78xEVB5Dz30lS2v4gw7J39kylvvFRvEZXQxgB4SaZkqjJO0dn1aM9
         lI3020lM8GbF2n2/llIsEtDBqDnSQWMNSknsyQyKtWfoaMTflH7d+FR3jHMFMSFtZrVx
         /yFZXA06k+AXuGeP+3RJPI7NdRE8EasdyEum36lhd9K9KdQ2CFv72Y6P6UuCYYtjXXLW
         Ak87NLqsn8jkjcIB/8QYFJ0Z9KR2yQndFqIOtn/sOCPmqtJPueUKovpFmr32OcihOJU4
         p1Cj7eqrjktjodG53xeSu9mVdbmkY++jPAxlz/LrEt7C8NIZrkLLVT2HITOG5HAgntQa
         de4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014989; x=1787619789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k46A7Ir/QjTb+nHZQISIIObeEqaeQhVTxjDABU2C/Cg=;
        b=Teb7kjS0Po4JeXws/VeS03QmTBXf5UaZgSfQ3ChyiZC8eP+Nvq0lpsUWXbydrWD6Sw
         eH6OaEQbGnyyUlv2J4be0++CfpBXuEFGfxl+2o7js1oV9gK9xVv1Qr6Egvx49Fq516gK
         wKh6Z0GxDG1wXgRI8HaZf53+FK2nNC6FpGZs2DP2N/qVMW3eGKCCNPaR/pe7RBmVJj6e
         MJbZVAy6HBn3G7eDx00EgUnjsNBwpjXkrAcQ2F5KSl5TjbPH4Ae2JWiXdQdDbNG5romK
         iQ5XTfQ1fnjn6L48PlhjHuebSja5vy3/Lveq5nt245G2RAnmyYyNWuuBsISHhYMvQyrh
         oNcg==
X-Gm-Message-State: AOJu0YzeRxjkM82Oqd1ZyGkgaEedqN29hHwAX9dn8rzn57mOSD3wNw/6
	DbYMYUgJnK7EIZsjcWSM+Sco0+mLJ6aHwSU8O7WSowuZJ85YFvFBuHul0UceZJs3d00n/pj79Uw
	46Y73BrWiIcdqF2o2N2bbVdFqvrbLlDCauHvXY3vwaxNEh/OveEG5KM6ukEB91hHD6z8GILEzEu
	ITOjrJWX6mpliGXK0gySI=
X-Gm-Gg: AR+sD11p8ZLl3FLuQMgBvGckYXiiW7cCbdp2N2hPPUuDvbj5vEmSzP+2IuGHiWsE4H1
	EfPBq7L753O6Q3+NdFqsj8/Z8hZeiRUDa3Tv8q+FeNuwNNLTWFrNbEx6TagAVSoW+VEphVh7kQ8
	festCFkdROo1pyw9AkAXloRMmQADfHnqLnKc0ATk2aHnT0Q5LOhZkyFTuW4cbUGzyjWUDYIJtuj
	2Ebv/j+hEvWh/8EiMXDc5kOL1YjCV3sGhhgR9LM4G/rQ8a53z9/EsA9Twa3WJpo6uPMMeWaFYkx
	TA+sl2ZWjbw39n7Cwq9mWbP/LWNrIHcSXNm37bCgtBDEEzr/gfuk3NCy8SkN4/TdNSeQczaauDX
	/UAM61fGPCdMarwb1JKQ/lr+OPkvakSWp8fqHPU9rBpDI4qbF8q5LIt6yY7VCsTPluwzkqQanEI
	pmoNFZ1pJ1j/36jzy7QOS3+7Xt6ON6ha2k7CYjgsk=
X-Received: by 2002:a17:90b:2805:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3933b7c8671mr31754162a91.9.1787014988654;
        Mon, 17 Aug 2026 18:03:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2805:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3933b7c8671mr31754124a91.9.1787014988134;
        Mon, 17 Aug 2026 18:03:08 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e319fbsm6563086a91.2.2026.08.17.18.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:03:07 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH v2] redis: fix build of the bundled xxHash with -Og
Date: Tue, 18 Aug 2026 01:02:58 +0000
Message-ID: <20260818010258.2340707-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816163958.3664646-1-ricardo.salveti@oss.qualcomm.com>
References: <20260816163958.3664646-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX9qS79/wTn96S
 EpMt/ug36kBFGRsMnKfb7M4l1Xk6EvEESMT02rQW08R8M3tNjAcgzBiQau7PG3TEoEpDVIKH/QQ
 ffZJEhBh8NgUmaFxKa8YM99bG3GMIwU=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a83af4d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rB5iEDbmOIZJ_rTDmNoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: mgl4CliPV04kTCHQ9rdM-I2B8HefSyug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX33Qbxmu98sDQ
 KrIl0UMtjNZ0LYZPuy/wzEFPRbkIyahx0f+JxJ2ThrZ8N6m1HgBt4C4HfpOvkrYSvcYTnVKUesj
 YGDVcpnFSqs6LbSoJeNhZf8K1BDK+DJmbk6wsEKu4AdQDKhGeV4kd3omweC/n/5QjJq49ZvoX3j
 zDgmTpPd8qpcyVuSA7vshE7bvdVylyTQVRkNZGsHztMf75lmDlzq0LIJuZ/cSspps6DqgE8btu3
 n5VIl4RaYLhUTIH9RBs/zvXw2TgGn8YQhSWdRQ7kZ0ZFrzIpkVwNC9Wlk2bvUagJT5LYR91P0vv
 fpFrPwmgt7OkD4fcfSBvH3bX8ofntm7OGVPdUFU56DwZ3lSxelt4xS1FeLKpHPjsLKF7NnIaGyU
 J39xI9Bl4ChiGJLwx4uwSavzUW7+wOp2RsDghfeRvOjKJ4HAXhJGLyF0JiNeLqBresnk8benNlx
 q4y0TgudmlXx4V0YvdQ==
X-Proofpoint-ORIG-GUID: mgl4CliPV04kTCHQ9rdM-I2B8HefSyug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 01:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129198

redis 8.4 started bundling an xxHash snapshot in deps/xxhash, which is
built and linked into redis-server. The snapshot reports itself as 0.8.3
but does not match that release: it carries RISC-V Vector and LoongArch
LASX backends that landed after the v0.8.3 tag, so the system xxhash is
not a substitute for it.

Its XXH3 accumulate and scramble routines are marked always_inline but
are only ever reached through function pointers, so the compiler has to
resolve the indirect call before it can honour the attribute.

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

oe-core already carries exactly this workaround for the standalone
xxhash recipe, added in 3464c67cd3 ("xxhash: fix build with gcc 12")
for the same -Og inlining failure, so use the identical expression here
rather than a second spelling of the same condition. The bundled copy
needs its own because redis builds deps/xxhash from its own tree and
never links the system library.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
v2: align the fix with oe-core's standalone xxhash recipe, which
    already carries this workaround: use the same
    bb.utils.contains(SELECTED_OPTIMIZATION, '-Og', ...) expression
    with CFLAGS += rather than an inline python conditional on
    CFLAGS:append, and reference 3464c67cd3 where oe-core added it.
    Also correct the first release that vendored xxHash (8.4, not
    8.8) and state why the system xxhash cannot be used instead.
    No functional change.

 meta-oe/recipes-extended/redis/redis_8.10.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_8.10.0.bb b/meta-oe/recipes-extended/redis/redis_8.10.0.bb
index 6176dc45be..63bf6d11a9 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.0.bb
@@ -43,6 +43,15 @@ EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
 TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
 
+# The bundled xxHash marks its XXH3 vector paths always_inline but only reaches
+# them through function pointers. It drops the inline hints on its own when
+# __NO_INLINE__ is defined (-O0, -fno-inline) but never for -Og, and recent GCC
+# no longer resolves those indirect calls at -Og, so deps/xxhash fails to
+# build. Upstream xxHash closed this as not fixable in code and documents
+# XXH_NO_INLINE_HINTS as the supported way to compile with -Og. This is the
+# same workaround oe-core applies to the standalone xxhash recipe.
+CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
+
 do_compile:prepend() {
     oe_runmake -C deps hdr_histogram fpconv hiredis lua linenoise
 }
-- 
2.43.0


