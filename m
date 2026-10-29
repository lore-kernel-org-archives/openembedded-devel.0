Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5612.1793252788347342578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aR6uqRyN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fcHZ8+76;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6KY3282385
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a1n/K76mLeA
	sdc8KHlVm1KFEu+AU0O6r3Du+FWpJeQI=; b=aR6uqRyN5GPoQ2PRqXjHqspldsP
	onA/zzk0hc5gAFPxCyEsdDthTwqeB2XdZUqwdOb/e1PnE8pH+J/+jRUDLsJasjNP
	y8/dY5fuScVd2m0td2gd33xJo8bS3HKXgZE9aW3yqFw0wqcT4lHHe0m7VDGfMPPD
	8QyJijE5nLyZcGNN/4GxoW4PDWfcyFtE5oVkXnh+nYSOwxxVxn8KTUpg4qPJTQmK
	pKBCIR1osKRx4bVM4NX0oeAF80y2ab7tknvoHV16ISKdvI8aavSODMlIQBw4hRGi
	NaWN3hQaElUNT4XnLf50W2GsGLdqhbJjs4GMgPq0xdO29LmKZcUd1EvDhIA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpt2y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso3822290eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 22:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252786; x=1793857586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a1n/K76mLeAsdc8KHlVm1KFEu+AU0O6r3Du+FWpJeQI=;
        b=fcHZ8+76ruz4a9F/FvD1wWpfNN84zmMi9gAjtlyUiCLahkuG/IL9y/YPOFz5qMDdRx
         CSubIDpNAYybhzvQepiZVR+HyKDzEuUDWvhtbkChOiOcPAjkValQvf6PSjIdeaEyjeJD
         /wHmblZ8pJKZZd7YJwPmcTS4t6IiZ/5NVtWELs4ZhQcgudYw6KLwgn++a6NZGYcrvOBL
         t+JEG3Xno5yvYg52OiQ2E+PoqgHicetVUJ1EgE/tez4t/abB5d2/hV2HaqOmD6sBus0m
         OPneM9Y6CJaFdgxLDW6pIIMXFgDaDCPj01A0JCO/P7XSCmeSbmRpf1U0//EI/qhXgMXm
         W78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252786; x=1793857586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a1n/K76mLeAsdc8KHlVm1KFEu+AU0O6r3Du+FWpJeQI=;
        b=ygomOfEVf/rnQkKoswer0+rjhEnigASF2l2G+Xa+grt4lAbGH9gv3r671YXmNHwDGk
         thtyGL/TxKiIUnc7+SW6JZF60btENubR6E+XluJUb5LS2oJxuukkoyAVh/OgJHsVixu4
         KMfgdSjcgqZvIiSXKa8mPAyaO/LqfxdGXkerLD6L+dQsAxCToxCZoV0aw/PlwwvNzgU1
         82gj03iAIvoIRkissOgqGfcf5hxDihDLL0lYjopY35BOLQFt7RzlEklWk88fTg9u3BpP
         5FL937SHQjKvG52prxXcHaBoyD7j/keqZj69rOqICvjehRFJ9OB/6lvxS7+6/3/fGodN
         OaNQ==
X-Gm-Message-State: AFq9FYKwp6g1FGxxRW3G/83i3A9polD6UP8KHlTcmCqJROq/cakED0JV
	zwie3yz1oWXU/EOMn4vXaFO/GBO5SFE61mpMGNXf56tQCveCe2qFeGD/VMOnmHK7b1ukiaPN3Z8
	zOF/hTXQe6bg9BJVwWpQIyA+0leXzVt2jUgl3bQ/DE3AcpBvTmGJ7bH7uKkgjgh7GMudkgUAQft
	4LtY4k1XWPpZ4CkC50Sg8nZA==
X-Gm-Gg: AYBFou2Dd8UG0X/ckr0A+WApu/Ovah+2fNRWtuJNGiGaH1m/iyqU8HIELX8MxdOFckW
	ktAWBlX1HFQUFEp13vbT4w33G4pML2xVdfuTLI8wZZqcxRnksnftKrvZEgxWtI/PIrhCi0MZWiO
	AQGex/oqTtCqvSC1+7lZL5hJ3kNeN9GDCzKApwhoA6IGd+bMJId4AAzkbd2Ue6yQ4P6AcLD/adA
	mvkp/Yd0iVkovaLfsxaUrBmT14gTLXveTYhs/JTa0xfdAQMqj18boXpgksjrDtafzfocQyb0fS5
	KXMfXeIPdL47a0iBLGJwgo6x/wFKhAb8cjgYqGtReFIrLrfk42QYjGPJX7CFfbmihRGzbk2NhXH
	63oS3UCb4FtaIjuMo3/om5hFhr7d2IY6SKpeMTFf83MW96SMHuZNPertL3fkqexGJ1TqtoT0Lqd
	mVn68m
X-Received: by 2002:a05:693c:881a:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36a202869c9mr6457490eec.5.1793252786018;
        Wed, 28 Oct 2026 22:46:26 -0700 (PDT)
X-Received: by 2002:a05:693c:881a:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36a202869c9mr6457458eec.5.1793252785253;
        Wed, 28 Oct 2026 22:46:25 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239d3073sm15670298eec.29.2026.10.28.22.46.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:46:24 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 6/6] frr: Fix native clippy failing to load libatomic.so.1
Date: Thu, 29 Oct 2026 11:16:12 +0530
Message-ID: <20261029054612.2642345-6-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
References: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX2otdGs4W6SNH
 Zlfwoc4k2gk8d9kc0+5JvHiCS/xaCfvBl3id9duypeh5uyVVAZIdFUJQWo78NEpAfJUDqTnsUmo
 Ur1UObYcLixzDUtGCObQ9EYPJJk6QewBHG4yhqv23MbczrOFHtOpjre1jljCa82VvNTcOAiNLzK
 i0Hi86nHlDeLF8lg5lozcvSA8ck4h5wAY7KFjTSVRCaus5xnUgnM6rTzocRiAAV4Zdjomhrjj7p
 hLHIx2i/aEfFs7Z9518dRnh3gw5lXLCT0mqKuCOjnvfxLSK8QQfo4yIO2SgKxEWkNdGYQZqzI/F
 ltfBPFp/KXyZnfZ5QbHNRfr2ZUoDZTTHvooksmGivy5moNz10YBMT1OP0/XVXBQbtbPMZRmbuLG
 wWCpVELpnZBI51iAblF2C/tPvcfov6rvGqrArDt1X24IJRxfsYf3A0LNAuzT3MkCoB0CsHTSKAI
 gaVnQ0ThNJwsFaqswiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX8SMPH00Kl5Uq
 QGH+UFOKIrdCmwDxwzLJzEaPvVZXM7utc4uMeDRbmJqKi8DGmfNc24b2ruDFe8GA3gB7jz55GQd
 xNWIWQtbIT/ysAiCgwlF+qwCScRVGtA=
X-Proofpoint-ORIG-GUID: ZSHw3nlO8MtSchuYMzE-fRSW3B8xJoem
X-Proofpoint-GUID: ZSHw3nlO8MtSchuYMzE-fRSW3B8xJoem
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae2ddb3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=myS4-9Of38x73851HoIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131637
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

frr's configure links libatomic whenever the toolchain merely has it:

  AC_CHECK_LIB([atomic], [main], [LIBS="$LIBS -latomic"], [], [])

This probe only asks whether -latomic links, never whether frr needs a
symbol from it. On x86-64 the atomics frr uses are inlined, so the
resulting native clippy references no __atomic_* symbol at all, yet
still records a DT_NEEDED on libatomic.so.1.

Nothing prunes it: ASNEEDED is part of TARGET_LDFLAGS only, so native
links get no --as-needed. Nothing can satisfy it either: clippy's
RUNPATH points solely into recipe-sysroot-native, there is no
libatomic-native, and uninative only rewrites the ELF interpreter.

buildtools-extended-tarball ships nativesdk-libatomic, so on hosts using
buildtools (Rocky 8, Alma 8, openSUSE on the autobuilder) the probe
succeeds at link time while the loader cannot find libatomic later, and
the target do_compile dies executing clippy:

  clippy: error while loading shared libraries: libatomic.so.1:
  cannot open shared object file: No such file or directory

Hosts with a system libatomic in the default loader path, such as Ubuntu
with libatomic1 installed, only avoid this by accident.

Link native clippy with --as-needed so the unused libatomic dependency is
dropped, making the frr-native artifact independent of the build host.

Fixes [YOCTO #15590] and [YOCTO #15590]

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1c1e7a0bc7977f2cd7c3d8e95a8dc1ffda20b365)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/frr/frr_10.6.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
index 1cd102f0da..8f53cf68d5 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
@@ -67,6 +67,14 @@ LDFLAGS:append:mipsel = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
 
+# configure links -latomic whenever the toolchain merely has it
+# (AC_CHECK_LIB([atomic],[main])) rather than when it is needed. buildtools ships
+# libatomic, so clippy gets a DT_NEEDED that the loader cannot resolve later:
+# BUILD_LDFLAGS has no --as-needed, there is no libatomic-native, and uninative
+# only rewrites the interpreter. Hosts without a system libatomic then fail with
+# "clippy: error while loading shared libraries: libatomic.so.1".
+LDFLAGS:append:class-native = " -Wl,--as-needed"
+
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "frr.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.55.0

