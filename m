Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5610.1793252781977413407
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GzJ0qS8F;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gvq91yrt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HEtk3282666
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LQN+BoiPd9I
	ToDzGextpY69L8nVB3aXrLxP9Sh5yod0=; b=GzJ0qS8FfAzYgH60R17uw3Psfzd
	ma13DGzR1YW4/I5ANWVSVPO1C4msAFgi9umdjpgcdsHXgOiDdAen3zu8zNimj6gd
	/uY2pOFo/KC+u+M+/i19ohd+4wtZxdDfSFu2fdYyza2VDQDEtqoGolGrb6ne51SV
	JoO0f1ZyWGMqm0SjwGqy4yehrNSpuMua0lijD5ghp7rCCRVqBpFJSM/zI6qbIXGl
	v6OEpDw6Dg3kmILK01+cAUHcsRqBTgnRLcandT7UAcosqsy3W7L/PCRBvQjrUXAa
	WuFzatIocKC1f2UICngVxcRGLi4YYpFROd4PBBK4nY+HfUdfpOdMCSDvfwQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpt2xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so2658748eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 22:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252780; x=1793857580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LQN+BoiPd9IToDzGextpY69L8nVB3aXrLxP9Sh5yod0=;
        b=gvq91yrtdLnNKg6jjq1IXDeTvhTs3sPTRjDIeXKpEp2QhHCTRxzijOmTW4nZvPbLRV
         xEhNDVLCpxTd0JCtBltKlufEyUCbWHazkijKeOyUgV/JNM7CLr1qeyaYMRWziDefM53E
         Al1eDSSU2CRk/Lo1nM0ZYb3dM6rSahxcsakludVd2b6uRk/BuZpAv2nYONuZ7lLamk02
         Ifn3oCNEVO5aNTNHYL3damtfjeu1z6Zqr9w97I13wk+dR65zDBxge/qYGjmOGFnICW+P
         3/IXR1hLinL/2cyXAltcHlBYwM2KETmaI6AVIicwrpB5vnSBOvCDRVNtFWzEilbp2fIl
         GZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252780; x=1793857580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LQN+BoiPd9IToDzGextpY69L8nVB3aXrLxP9Sh5yod0=;
        b=YLPpHmZxYPJbl0/NpjqH1VscmIJ0Oyi60cEUWKsj49OoprNUeHTSeMrTXL/E/W1n+F
         NiUlsP3sYcBUTn+cbdjsvWxhmSg81Z4oKmOvZjEPTW6dimXK9lg+vEsNjkDVQitX3GQj
         V+4fv4iYhunT+/dlSWsN/KXUrGggTXFeX/xWbnR5nkAF+EjeXVRUNrZ5dmGsaoQ9/Y8K
         X6toyvwlrkIwd4iIKfFu9/Eic34Aenea9KucQxnAGz1aS0bGXVZp+8I0ROROE7u6u5yv
         IHJVsnMrUhFKKqDG5LayCRnpJ9Hhuq5cjVikpRCL2bgm8SDvefIfX7H+5KeNBxB20cW5
         qYZg==
X-Gm-Message-State: AFq9FYLj5zzccJu+Gak3QEEElggml5dYrcUl2A945ikz7rz5LoIkVIlB
	TA8JIViQIUQwaZsNUcfFKDlUPqOgjFmpurcXUN/afOhIdXSCZM4tmzebWqtWvL8gKLTVcEOMawk
	Oi/pzyN0JSouCnFCXAI84R6bdwE7kWpuXbgseGJ+pBw8lYxCFZYTLCwk3P9YChGcoNmiJV4bEec
	ooid08buqzghLG29UFvhZN2w==
X-Gm-Gg: AYBFou10ZCW7aPFw704Qq/I8tDfzK2mhLeG+IfegHQBwWqkG6YnjS8izoGj4BL5Ujjh
	Sbnc0aw60JV+iIot6PKC2vsIF6njoHHSX1x7x1ZFDHzpiqDyRtfontSsXG9mcIz/DsHDYVzgEIj
	xQiCj0fH+oYQdAa73mLwpSyFcBhUnZV2uJPFFpnDfDKwTnqCojzc6OSuvMXkcIRAHLPjupktgbw
	JJaFo1Ln2o5ipNa07FULtvl5o2xPnHI/8H7vOcWoM6UWptxy9SKe8WTv9h0k+e9kWVSHHgxJasB
	Yff5wZnirK+wdtu42vmhRMQL0Qaqw57gP2ceqiCgrxsjqyuWSuHT3K+qgRnf1G4CSmq7A1scBKG
	pqtHqLxTf6GsU9bGu2Je2KuoUcHGnd5NBq1EyWV98JWnTambVFT75oTsXC9OD2DoqeXP9WtAG2b
	gQUXO0
X-Received: by 2002:a05:693c:41d7:20b0:367:3d68:8480 with SMTP id 5a478bee46e88-36a20115c41mr5959059eec.0.1793252779432;
        Wed, 28 Oct 2026 22:46:19 -0700 (PDT)
X-Received: by 2002:a05:693c:41d7:20b0:367:3d68:8480 with SMTP id 5a478bee46e88-36a20115c41mr5959035eec.0.1793252778874;
        Wed, 28 Oct 2026 22:46:18 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239d3073sm15670298eec.29.2026.10.28.22.46.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:46:18 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 2/6] php: upgrade 8.5.11 -> 8.5.12
Date: Thu, 29 Oct 2026 11:16:08 +0530
Message-ID: <20261029054612.2642345-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
References: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX3lYbXgGOHCTz
 M4YFI3rMhgmMu6Ko8vlXqZ5JRSDV4wbVG7DS7d9lJrbSBcDC8tcsdrULGBhRRlxRWAHHtk3lb1B
 qUGC6MabLPbmD8rU3On0DlSZtFGWF9jopmq73VD4mue0mYnZxTq3ntNBar0pgIYuCuzFOX/txv3
 yLkInU2RBIWsSx33vScMBvGcnQdslhw31f832iA+FwIjvzyiSCFr18vJVxhHPPI0xsMoVe+QhKr
 05a3PliddH5sDV8MPvey8Ic6/ajZ/F3Y3Ldi9awoyXqnyRJzn3GJkHUeu6ta5XXKhCks/7C3U/r
 hvPC3rP9EuHbme/dnY74rWWPb0KIHC/ude3fCRma0DZaAgRNCyVuMOGcRIXhPlJyKwEc0nU+w8k
 H4y60JTxK7tL2XsoI17RT1LNi+JRadf9TwdgJ4WzRfB/Z8XUdKwqMAxTKsdVBN7ThClfs5sOyA3
 MwfeP2OWC1+AM4fbkMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX59WwAtS3PAnc
 FUw3jIPmVN0Z2T+Ujdzp8LhjOW4PDB9mUZRT64hv6L2BKFvn3X4esqgQuIHRoV6nhFgr4wQ4dha
 QpTKxP99fhl6/E+pK65cZqC3K9dpZTc=
X-Proofpoint-ORIG-GUID: VnGIG4eJYyS7wyH465dhZ4Pbx8W3BfwQ
X-Proofpoint-GUID: VnGIG4eJYyS7wyH465dhZ4Pbx8W3BfwQ
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae2ddac cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=67BIL_jfAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xKIf62KCRASQS_O3hEYA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131633
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security update.  Fixes unauthenticated remote code execution.

CVE-2026-109618 CVE-2026-109619

Advisory: https://www.php.net/archive/2026.php#2026-10-21-5

Changelog: https://www.php.net/ChangeLog-8.php#8.5.12

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 898ac0ba1caaefb583cb3785c8c466360fc18f63)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.11.bb b/meta-oe/recipes-devtools/php/php_8.5.12.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.11.bb
rename to meta-oe/recipes-devtools/php/php_8.5.12.bb
index 831e926880..f9759cf7a5 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.11.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.12.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "dc940716a8c73e531c0078eecb955d595d321ec2cc9d47149cf0089ea6e18f64"
+SRC_URI[sha256sum] = "ffb60edc437ced63b5137e4984db379a8111c50049c711510d8b958277efc1a8"
 
 CVE_PRODUCT = "php:php php_group:php"
 
-- 
2.55.0

