Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8271AC5AC67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:16:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14094.1786607299102133257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 00:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ourjajBc;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=g2Hw1gTg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ashwin.prabhakar@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g7Ld1072366
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 07:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5JBb6ccLjck
	3OXd2yFfPIbavBWRg/IQyx2waEM2n7HQ=; b=ourjajBc4a4K6GUpdQL8qHYM1D7
	mKHDXJtZApci2e1DDg9KixIfSOc5/BNg5ByCJoUR5bb+PzXB7UFDir/GBGhbcp3A
	oxthP7r3giCOTpWJeLy0+NlhkAkx750mKqmnMH2LG3fXQBcwmS/1VSK4MWIQeQih
	vxMHTwiP8+9gyhcCXuvavv6+XYVuSzF18CTU0f6Ethtnbsl8KX2iaqj44TPyVILS
	9QHTTs0DcP0TSn0e9kgVkNIzmMkj9LEz4RnLj04Eocx5me0lGmav2LzeOaqy4JNH
	Rnb8r6N56GfvEvvjzndsVjvIBPTLP4C1MLUcIMqAEPA9/SPAyl0bt5FKJfQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14syh734-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 07:48:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso7165311cf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 00:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607297; x=1787212097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5JBb6ccLjck3OXd2yFfPIbavBWRg/IQyx2waEM2n7HQ=;
        b=g2Hw1gTg7kRTKWpvn0US1ik4OK+QiG2E9bVU2Fblnx1R56Q5XXZNGKNs6u/fYWG8RH
         4P8lLW7iFWBhNEt11JRcX5b01/r74BIIQ8rtmJ1ePIzFK4Ywa/WW6fFECiU1oHGuOeem
         oE4Srn89OpDCxzhYj/uawcQVjfaPuhZmInE0l35JExdiHapT+9sgWNLpaOjfddc87YHX
         Czw1YPPWZ5yym2tv+ahUASE8rAQGOqv14bXza6zS8dJciphnbOCsUmOa0nB3OC0nSFpy
         5QwS9HXYp7evcfwi6jUsn73+5KoaMLR2Jm+VB1PJ1c0CEnGoA6Sv3BFJK+zkCOepD0u4
         IHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607297; x=1787212097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5JBb6ccLjck3OXd2yFfPIbavBWRg/IQyx2waEM2n7HQ=;
        b=E+Tz5aiRbBcxqzjhB9NMxFWVZErfrvUMmkAJsQupP66G6Sgzu3wfK7HyaElp3fx4an
         XTazbeeC3iBaqOZhnSVN4YpIC1063ubFhoNuwKwV/SomqzlE8VNKQuEhsAj79m5zV/+R
         Ie3EazajItuJfeJjIOru30jTA5oj80217oV0Go5tpnqOtSBgkPicAjoAT5NrkeXgVgcz
         9LjgMW5IBFpDzUdq4ITilTr3sghoQlDq96aDxNpu5FrJwm8PYp1o55QLpPt1pJDfxsZQ
         lOKCjM0W0bKSc68WYYoPrEaqyevEd271lmylQiLUT+oPMntavAyvDb64lbd4YLGzFp0J
         7rgQ==
X-Gm-Message-State: AOJu0YzkJ6J3HYRCl78ph9WC39IGsV3SIpEL81mgQ+QZW0qgnXPfgQHC
	CffrkdPq4YxlxHFNz3QfiRsffAwvIRHgC8aDGH0aFO0fszeOkqPvm/EeMocyfbw8CFbkK9c4G1G
	bfr79rKQjdqtXDEOe7FbYlh2dNAKf5H3/MSA8kUoXQ0ARQKVCEDBGCkp+ez/MdDjP3ItOlP6M9G
	ps7YRnJ6Ta5gjRWVZX
X-Gm-Gg: AR+sD12UvUW2nQ/tuz9zWRIEvGQYKOlvk9ob3N/OjIj7ZO+Qo46NuF/iGBygCENlB5w
	2F3IoHez5NY/RyAB4Nk49KuwqNFcSe9zzGVDy1DY0knJnD0uKoqL3k8BMJRyfx8al3fS1lRBsli
	0/LSJQxmLM6gQRa+BQGvfvUc4Dn2b/oetWaloJvjI18gBoXxlRNVk6jDVBp0HXcwRKEAisNbuKX
	Wbf3P9/tG1awAqNoH/1KjjV7cMvGVJnwmaH/CkjPrqK6riA13bI821eWqP2O2mHx6qLadUOgPHe
	OOqwHqd65hgzAwITIt/mSbn82goKiAUgxwvttAI5oEB4HQJaFA1ZiMeXQOBY9JXWfis0UtUVcE1
	YFAgGRBkcETLXiM4iqSmFK8gDt2w7rqQ1GzISZb1I+yoc1XolhdehllIs09/ckXY=
X-Received: by 2002:a05:622a:1194:b0:52d:6cf5:1c01 with SMTP id d75a77b69052e-52d73e2d702mr36432121cf.36.1786607297171;
        Thu, 13 Aug 2026 00:48:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1194:b0:52d:6cf5:1c01 with SMTP id d75a77b69052e-52d73e2d702mr36431331cf.36.1786607296257;
        Thu, 13 Aug 2026 00:48:16 -0700 (PDT)
Received: from qualcomm-ThinkPad-T14s-Gen-2a.wlan.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f73f7c0sm605986a12.0.2026.08.13.00.48.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:48:15 -0700 (PDT)
From: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [=PATCH v2] assimp: upgrade to latest master to fix GCC 16 build failure
Date: Thu, 13 Aug 2026 09:47:21 +0200
Message-ID: <20260813074813.1531783-1-ashwin.prabhakar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMKF1srEpQ50APyZuoa7XjhjC52wRTLa8HZy2BbUPi9Qs3JOxA@mail.gmail.com>
References: <CAMKF1srEpQ50APyZuoa7XjhjC52wRTLa8HZy2BbUPi9Qs3JOxA@mail.gmail.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7d76c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=1Dfise4yaFfiQpOBiUcA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MyBTYWx0ZWRfXzj6fIPaSarWD
 rXudu8lWIXXNnhlAUdV7uBzxZi36hIcKwQy5uJkM/otBckdg/IeQdPjgNaH96GZJIp0enOVvzE8
 USZCblbuLc5LhuwLh0YgALOE4Q7GjYLvNhJtNLv9+6Jrlab7mSVqkg/JyOsUICtbdlMaY4Yp/Y3
 xTr4wsVCKMuVbKRxoa6Gkbi3NgJTgtar+sVXZXdztE40T0V2ZRF7HpIH/uNoT4JzrukXp2D/wxa
 CmlY44Pa1P7wEB3u/2Kg12e5rQ89tvD0My3L+KU87Q1rGgLwnUwQTHSdzFKH78/ShHdxwujEprI
 XPbpn4+zCDz1mDnyBHBfAsBT7gOVBQ8w5ZdeTSMWWVyBA0qfdojFI1UJMA4jJOhQOfsPc6eMQhE
 hSJLI46QPB8x+K9DUdZjs87pPBVbJNWUp7DrPu3ZVdvCvanQBs02hjEFNmMQg3m5S1LvJNn3hCV
 Y+gLIsWXu3tZXzV/VRw==
X-Proofpoint-ORIG-GUID: f_i_a3piCmikXKCE1YEl0ofZyhkvbY8f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MyBTYWx0ZWRfXwYQhJFqZKjUF
 7WoxRR37KF3If4yxbigbve4OcUELPmeDIWA93eNf4+kxM8Lx+7lsJT4019C9Jg1WmINnXAwfHSM
 nafV9qJhAiWJU6DBYYcOfGBJUQICPBA=
X-Proofpoint-GUID: f_i_a3piCmikXKCE1YEl0ofZyhkvbY8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130053
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 08:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128936

Update SRCREV to include upstream commit 3edb90201 ("Fix two compiler
warnings (#6669)") which removes an unused variable 'qu' in
MS3DLoader.cpp that triggers -Werror=unused-but-set-variable with
GCC 16. Also drop -DASSIMP_WARNINGS_AS_ERRORS=OFF as it is no longer
needed with the source fix in place.

Signed-off-by: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/assimp/assimp_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_git.bb
index 4cf2d1f787..b2d7a573de 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "git://github.com/assimp/assimp.git;protocol=https;branch=master"
 
-SRCREV = "1962da5ac484434524e7a25d566046edd932f901"
+SRCREV = "fe1965b3e73f7c241265e8e5b3015764936a6ce5"
 
 PV = "5.x+git${SRCPV}"
 
@@ -20,7 +20,6 @@ inherit cmake
 EXTRA_OECMAKE = "\
     -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
     -DASSIMP_BUILD_TESTS=OFF \
-    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
     -DASSIMP_LIB_INSTALL_DIR=${baselib} \
     -DCMAKE_INSTALL_PREFIX=${prefix} \
     -DCMAKE_INSTALL_LIBDIR=${baselib} \
-- 
2.43.0


