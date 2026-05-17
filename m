Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C886CD4F48
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20216.1779006272713745771
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dsGzxxmn;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=buBlxQMB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2WsGR777359
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F3AZbBgx0RL
	FO30NjffVFopc+JXAkthFVZmb+TfLvxg=; b=dsGzxxmnX7ajTGCyOxk8Isgk8D1
	IrLoiCSyiNLTby/UT5U4DSAiMd+ctx1PDB9UsIUlQrgPye03iL4KEs8Z1pkh7FpW
	EBE+TWN/jQZAChsQBAzZ4DbN2CuKGmMxPYz0/osxTd1cw/lHAK2V+g+OnO1Wyfg0
	nnuIwYX1pE9d3CB9lbQm2nBoUnasqTFkRSvWmmsM489CiZKC2uhMMK6ns007WTGm
	+aeGkVT2KhcUWTImj+ZElFsFn/YJRBNnUG8mUk3p3ouynKN+l5XOi3vKm9aFHfAs
	Ra7f0OCMeH4Wu5elhtsEeSkUTazesOiqUPkSQC2dJSvF0Z/ObM311nyY2GA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvytghc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3684cb22502so894315a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006271; x=1779611071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3AZbBgx0RLFO30NjffVFopc+JXAkthFVZmb+TfLvxg=;
        b=buBlxQMBZZxcFX9bAALdnMMsL/DxlDlV9UxzpKgDNmxZzgsB/yNtU+SJpwt1AYVwiq
         EA9HL9MidZgLypJi4p6y4v4svsvHDq9yXvp2Ql+KO71tsx2BC7Ck0mZyUol2Y0JoS377
         xDP23wIOP//19Lqq0AqiE4/939dY98IUjAqqNLsdmUOAccJaKKjZvFJnrWzKJJvwJO2b
         /LdXXbJQ4vUyRJ1ToyhCziwRVy+4nZtkyLEJEq0G/3B0YqRXoJn8JIdtnu4vQy0XO2j3
         //kC1+XVpKLgGxXobwsLuk56nw0wPffmmhF/XfgXMR5uISzs3YaRbOJoQYc4Mc4tI6kX
         +/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006271; x=1779611071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3AZbBgx0RLFO30NjffVFopc+JXAkthFVZmb+TfLvxg=;
        b=aidoJPUzn/AswCaK8wL1wOfx1796DlfgYhbtmrj5Yq04oisQqrVi7km7BswDN06SPm
         EaFayTiGQ3KvGjNx8MFX/NZBKljbR4ihwgSUp8EnqODsO9Ez1lQL131mt5d1S5z+gNPw
         J6Zvyf4ep6p99u5Sqx/qJ7PmWcfBfWHxvoNisFGUkO43X4BSYl8Q498tybqj/2MJ8Ra2
         qNyTtO+48h6bSK43Y6FTktMPjouqWYaL8esjmM2rPIirXS0BIOY8PgdgHjP8C1jZCzWE
         lGEz4IPhjilD4u1p6JPi8lusJ0lbtRG3qKvN9Jn9JamGeO833rUqnTR8UZTpgqF2eg+5
         bvyg==
X-Gm-Message-State: AOJu0YxFZ5jxiFRBQNG63XZINjhm9U/dJBM0h1bEVwDPmYx3uhtWLwhg
	BMh8H702zpIFClCdWGel/GcLh01Zf8JeCxrPdFE3rtSXLstwMeqgFBy5UXLEYkRYYKk8eSNAUPv
	PY9d2o9d3WLZHIBg7FnLNNn+K08xYuRal+u2u5xKWQIjCIk0eSlLzFKx8zUSzNTbV/N457AwGd0
	gApWuSCjfIpImC7g64rz3/ZA==
X-Gm-Gg: Acq92OF87f0uhdhigJhPk12oJw2qeC6NlRQHbgUGOFr7crtgZMKyVsGOqGOaxO4SzdY
	VoYai0qxH3Gmb4uJQ3pBc8Hw9XSx/NmPmipciws9SMa0SG/1qMrs0aM2kyw2HVPpMlTcXjO7Zp8
	B8Tlm1YuhCHzIrph+dsRGxdVAMoc1XexjCiKMnp2tpBIfZ8jJI/bupt6L91uTYme37iyTFVZszE
	JtyM1GqysEUYh+dDweX/Xwt+yoOlAoVSjgVF+H6Mo27d00XRjHslD042s7eHqP+Twhrho7ovC40
	e5/3cfBtT4SCZcoBAFTzFOmWi3mXtXsvvC3tOm8Wmfv8KDar+CRCe68mcd3RTnErnMnlr3JQM6f
	OyRW5jSnCfmST//PNfK3shl/8DySH9GsxrDPOvT1JgN2fxK68zEOA
X-Received: by 2002:a17:90b:5110:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-36951dd286cmr10946144a91.25.1779006271567;
        Sun, 17 May 2026 01:24:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5110:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-36951dd286cmr10946117a91.25.1779006271045;
        Sun, 17 May 2026 01:24:31 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:30 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 21/29] iwd: depend on the regulatory database
Date: Sun, 17 May 2026 13:49:49 +0530
Message-ID: <b2657486b3af5472e3268361296da5092aa9dca7.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfXydH4Ct/z0Re+
 pSAN2Vv7UPsDkyzap4s62g6aMzs8G83KjcpH3qmXXX0gbz/f8Q5s3aQzEjIfFcRnrBuBx4bqmkK
 fSXWzM59oOQVKLFGhP5ivbon+KoH4zWKsOl5mtPW6wL2W6Uk8YO3TQXrlkLdA/z7NNQBS6Jwb5e
 j7lQ/8V0CUY90dC8nC54dSjhyCGS2QMos+gIVdTe4HEfcAKxEty3TcOd5DHXHAO0sy2rfndAtaQ
 EAU5n7mLAnFUv5Z5h8gmFZ6hQjYYdBaqfZft2Yj2X1qqkegXu9d2DKDw9U50lqJY+CmkHB41cdS
 zxuIvvVWZspIbZqYXiqFPl6jEv11KQ1STR2X+vGALViYEqRrrN4yp1QQG9gJmEKjT7b8pnFzP2M
 92FiyvStwW31y5okvOGLwFfA2vaQbb1wk+xNA0v1RzdZT2db6LO/+w8UfUFdBNrpHBNGQJohYBP
 25gOuPzf6cHfwHLXCoA==
X-Proofpoint-ORIG-GUID: -jE4cSaVbzKBSrVhAezy3OjDLjPC6Hzl
X-Proofpoint-GUID: -jE4cSaVbzKBSrVhAezy3OjDLjPC6Hzl
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a097b40 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=Jj79y-GU-LPksNrku4kA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127034

From: Ross Burton <ross.burton@arm.com>

Doing wifi without the regulatory database is not good, so add a runtime
dependency to iwd to ensure that it gets pulled into the image for the
kernel drivers to use.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 51ed0fcecd3c3a7138319b3e3bcb6315add30356)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_3.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
index a53137537e..073814d89d 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
@@ -59,4 +59,5 @@ RRECOMMENDS:${PN} = "\
     kernel-module-pkcs7-message \
     kernel-module-pkcs8-key-parser \
     kernel-module-x509-key-parser \
+    wireless-regdb-static \
 "
-- 
2.53.0


