Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0787CD4F48
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20210.1779006255836913164
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KQ3p4v1C;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QxhVN+B+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1haGw2531321
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AWJHrSU5/xD
	Jao28qYxP9jv4Dsjs7iyXUpMunzc1Lgo=; b=KQ3p4v1Ci+GCXxRJ+oJk0C5B/h3
	cCgByJNzoEiYAyPFanN4gtPA/ZzQ7o6IIySgpqYtuJqQCKUyNxyKx/ITv7p1WoAx
	BHLzkKnBOqXEkKqOGbwFNlJlF7+8utgycIzS4XHpSaqMByEl7yuk/P44kRS48KYJ
	++TJVbRrPlb+sErO3VLUx+D6SizWjlKoaRQVlu+0pefCxd9huWf/YJh4DDLdYHCq
	sZlNbloR/wAw055FRIjLMjWFJGptR0sWyoyjGfMhcbzc44JPb2/w/KFEGW4JxAuD
	vB3AhcF+8DJl9qdP/o7O3Kb4bMsX5w4ZiGvZ5dn4UQKc0/my+DwxYh+aDrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvchcbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so614210a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006255; x=1779611055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWJHrSU5/xDJao28qYxP9jv4Dsjs7iyXUpMunzc1Lgo=;
        b=QxhVN+B+zPfxNE9MZ0vuSev+SSpTOtA+xn5fguc7kkKaS3lEbzkc6xJqg+ln0e9CKe
         9vL5t0tXpHoa2F4qwuOabJnxAH77YaikkyG+tVMhrR7oEWfeifNWCBqasZcqhs3qBym+
         5ZbhC7Rkq6EWJJcTk7q00LouYJaaJZKABP5Mf41qrrEFnq/rdu5ZUm9bq/valQHauRZE
         wSas3eMcyS/oZIEOSaw3xvZdSbO+eSFgCxKIyI9HlkPWDpjHwPJLYE3j0ECSjsfSaE4s
         54omiaSLzCARW0/ySBcxx9pYHh8dJdVZ9g/eR0FjnDTuXtTko2RpzAx+LQPDlswalhTt
         dREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006255; x=1779611055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWJHrSU5/xDJao28qYxP9jv4Dsjs7iyXUpMunzc1Lgo=;
        b=E1Xoymtr3xdRMmatS05CXviW6r0TQXrF+GamIVTmThsMLWqyjtUvpI0X4SLoN2kLfq
         nzlf3mgfSQkWcaM3Y5Euwggqk/ZYZ+PDq0YYBQQsXN8UxsGLHxuknrXk+1IC60CWi9oh
         k/MmI1MD2v+SGb8syKzPUVwiI5jcQAen6jLd4xWNaUAXymQFZoYoMufmJENpXsaIXEQU
         4mjVupWqTDCoyBrWbI/LQcDyN3VDEhT50d+kvFF6AZBBoCX8e/M8cHKzkYbEy06Eq2HK
         CK/waz0gcAf/XQ1EeKB2VrRhSxj9q0U/bgLOmkfTMoIC5nd5NLz7Eae/Mlhjoy5Es/YT
         C0WA==
X-Gm-Message-State: AOJu0Yw3PGglJOUpypL5jPIXXXithWGqtZJXL0QHfnAvJduM0LrrRS1Y
	2RAJtdmlaBGQYxXQQGcx0JyZupMxHXuLfT/X/c58ndssNPRMz3nW43/6oS27DD2a1ITmRWUB1Rf
	X5mXCjzvJwwMYSMM2zmA+TcyP5lZn+iCbJ0iP1vl0loA3gYv7Q2gIM1AkbUxHn/q+ZK16zmvaJJ
	dczvJAJ+Yi1T4aX0pcoAaeBA==
X-Gm-Gg: Acq92OF1KTvmMBldkNixwiUi/kbyJrXOZ2uBJC8gin1LxFmu/UBV+XUOQLM/qJgOedq
	1/2M77o5ah2a0vHYInMojBHev2HQdqh/EkhgvcmaSeeUjuM/5DUEmRRaZMbebqYFYuaj82s/zIP
	xKqgeFOc/VR3OX8dofBwWAnooIDckVjuBMQLIah0Jt5NxpCHSF2gNgN/JmR7RyEp2dPGGrHgeKN
	dBWDoSAA7pgKmvUxJnDCAeygP1p6GfYiGe/EVW+L/z8uPthHbIO+ePYb9qBlsnSsTvkTfJ5csBX
	RfGWuC0K1ydNXDz/1oEDEZ+RC5WXV4jfPKLC0Iq1cans9LGQxMxTItPDTKc0KZMUfymem0d6+58
	SMUPv5VibVOOkS/tXnyYVXpvBoIUf2Hp31o0m1Q9OwdFE77tzMtT+Bkwh9msEbZc=
X-Received: by 2002:a17:90b:4a8f:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-36951c990ecmr10375159a91.26.1779006254746;
        Sun, 17 May 2026 01:24:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-36951c990ecmr10375153a91.26.1779006254205;
        Sun, 17 May 2026 01:24:14 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:13 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 10/29] imagemagick: upgrade 7.1.2-19 -> 7.1.2-21
Date: Sun, 17 May 2026 13:49:38 +0530
Message-ID: <2616b586ba03a72e540d92210c8b2cfef4bd9355.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A04bA--voTrmDN82MDDYG-BkR7N2HXS5
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a097b2f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=sAHW2hXpAFzz7hO7mpoA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: A04bA--voTrmDN82MDDYG-BkR7N2HXS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX9Inkfn75mSsI
 k419VKrYlBnEge3m+RsswHxsUinz0h0bQFPewHfJGHsil8MiZqvkEF0P2q5z4NBmrgYJ71Dwp7u
 h7if/8rVxFEQbyW5hpT5XxtxGnCpO5zQVoqX2X2CMtO2uzLeq7mQTSPsz0Qao57x5/JG3v+R3dZ
 b9eOMv355XRKzWNBumuuX1HPwhkQjBCaLeEIZ1VYPTjRJRvsxLmgzNxHzurwaioUd72bbypIXoj
 6vhBzxn9U1TrUnZdbA9tEOz8c7tVGtTfJXr+TfaD7awl/plkojJmUS+GvteFIFH3moAg8LIXr6L
 Ufyemu7c6ETyCWzlrE2kMrulTKkaLb8KenVOMtORKeXNsSgGbe68gZwyzIOkWSCB6/+yz/WAHI4
 ek3EAlluDzqbjs1KELI1QEHUhEG3UJxkhcyyYE9tvb38KC1zfZTLvsPL8iBwn9+NFWwZA0LxC8R
 xjPmcR3ykOPF2VWhUaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127023

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 963f73979dd6dfd9359fded795e968de31b66acc)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../{imagemagick_7.1.2-19.bb => imagemagick_7.1.2-21.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-19.bb => imagemagick_7.1.2-21.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
index 18c23cb0d4..bfcdb2495d 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-21.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "9fbd2b79450e930edb95e8158d412e57a7b27e83"
+SRCREV = "c86de049cefb8dd739e16f0e2fdc1ef8d2006d59"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.53.0


