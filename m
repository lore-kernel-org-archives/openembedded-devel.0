Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB97ACA9EDE
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 18:26:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1275.1791829567306258094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 11:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=e5pOC23E;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fE6gRPcy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv3Id1591674
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 18:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zds0OcA9LfQHjjur9GAq3yHmlbHH5con50K
	GBfhXvxU=; b=e5pOC23EIt0D6TheGsi/OfcwZwrCLrmWwOycuCQDYxjoteYD2sa
	yZ14FAgTvPiT7yKYzgQd2ENeOM0LsYvWH0B2POIdCs7A3aN8R5H1BFbkVvjfi7/u
	cRZmtTDtBbcPVS46/ReotlVQtzCrFr9c1Oi2vyH/HmKg5aDYRPH3x2cu477TgCh+
	Y7D5iYz4KQ1AOjWEOgrh17sR2BxU1A+f9gwz3/FeGzhEv7vmg0m1Brwfwhif2FNg
	TX+n1laZtBQvDnl4lglWaRoUoodK/z1ee18bLF3xDI0HT8RGdD7Vjr1208zShhGf
	S7Tw8wOAH5tJ9DLdLxiALALUvzyw6RTzEog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfct75u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 18:26:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac16335199so607815a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 11:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829566; x=1792434366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zds0OcA9LfQHjjur9GAq3yHmlbHH5con50KGBfhXvxU=;
        b=fE6gRPcyAiiMLIlkZYqyytatbQRaZtEli8aEFJQgct9o/efHD5OfWNl45mHBC7JwRW
         HNKDpmVO9hswOvB+MKTLgZZ81a7B77s/nbSxhuysVS7H9xGFRE26vO1Z7DUvrlvnzVaj
         Cf7wW3zn4+/hU3KEPVCfd51mzvIDoFOJuuajwyzgW3qdRMvoB2MvCdWoEo3q2qWzMmt6
         MVY2ynnzA5eOhHb+JWGSCKGvXUVDErsteGrjBsuQFtnTufBojm/GIzp9oQchI9qJuR2e
         5KDuPuXcyH3bBh3SRlDr2hShFvZl7K95xFJ81fwNqLLQJ7qu9UmZukigrK0KJ3Sb4Xn/
         qZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829566; x=1792434366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zds0OcA9LfQHjjur9GAq3yHmlbHH5con50KGBfhXvxU=;
        b=MU+pwVVFctvvNIGIXkcYZbM5Pjf/ZlgSWZOaQbPyw2c15Jac18ZmdF+jgeoLUv5Y6+
         KCFy5xFsIrol+U90yLCgxoqxkI481s7xCvBUw8SxYYg01VK6x/O1J0QVy3roCHDm0SrL
         3cKlExf5NDzB5C/yD/ZWQ1b44kqNzWMm3s3FsEd7FACIjhEj8CkkeZ3qzIZyzySo32Ob
         DWsAy6QjUVdDQdBVoQLiZrkcaV1QRkTSUzG36s56XFkO4EFrxbYWSof1EiHjZnFgOir1
         cbOKGeQQhDaxqVloW6KttMj5ZP53FObhpVC/g7zuJYffyuPViHWNnbN7WR/uuKGv9pEq
         4GjA==
X-Gm-Message-State: AFq9FYLpikYxMxaTvt5erOhundbSS/uJ8GefvokpwWJPEkPVFrKnhvwE
	MXBKrFJDngWdNuhDpTASbe1hrGPBq01pSjv4BpZ8PzOr6/QbFTQ1f8HVIXBqdsy76ZIjmHaasGd
	bFZQ39FTnnlNKabSQzvAiZPOGBr9Zi3uxHryhM4lKiLTrrqvCSv+rQ+ZoGDWMUIWAKkJkvctvUP
	5OFQJkPo69kMuGKRhxJyP7/A==
X-Gm-Gg: AYBFou3stRboAAvs0Kt7qECygxmVARI2Lw/EFeKaCKwlmi9RtE7aj1tQhLZ0pCVPRCJ
	e56yUa06Q2u2levIqMTCV0zp98n27eOlfaJ7sSZxIANNKOoGHhyIVArss1KnFdp+yhIy4CvoA7Q
	oMGvAa0mbGtyNlZVtfXNa4o6VpvYUQcDBlprOpWiiO1jRJ+twqzJCSpCShK+al6w1WjseS5VNJK
	M45HkbXWXG7HNEdfSayDp5CKUddz66bzEqZ9Zo0A6pIpdECKM838nQZgYW2d229I+088cnJvoqv
	f5PG/E+xq7Yf1x3tcw18qsI0tDDThw2fATSYtz3D6/mTKEuCKQQBXvsbol3nXQmm5VSxwqwGq7w
	BlmynoeUMaql7xzr2jWzH7efp1nr2MtXeaZ/HrI0esfUoBgW2MN+ldBV1uxKeX90HC2wLLunJMk
	bepBLYsbo2EyGuGVLP7PMoPyM6L24yRTFZlT7icw==
X-Received: by 2002:a17:90a:e704:b0:3aa:fc22:8aaa with SMTP id 98e67ed59e1d1-3ab3b0951e9mr8599977a91.67.1791829565263;
        Mon, 12 Oct 2026 11:26:05 -0700 (PDT)
X-Received: by 2002:a17:90a:e704:b0:3aa:fc22:8aaa with SMTP id 98e67ed59e1d1-3ab3b0951e9mr8599961a91.67.1791829564705;
        Mon, 12 Oct 2026 11:26:04 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm9685207a91.2.2026.10.12.11.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:26:04 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: martin@geanix.com, khem.raj@oss.qualcomm.com,
        Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] polkit: keep the agent helper units in the main package
Date: Mon, 12 Oct 2026 18:25:51 +0000
Message-ID: <20261012182551.974348-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U5nqRu_r0vybd8IeEtnGyQqwPWbAJ86_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MyBTYWx0ZWRfX3CTtdX4tLcgw
 Q/3ak/pQtHLQfTauFeMlyi9rXjdpnt5JKuMd1JEW5JZ3XxC1m8n6j5Q6rYiDm6yQ9H3CU0BVSc6
 UlpUjrlcSF5iXJQEtPkHervtLREEe9k=
X-Proofpoint-ORIG-GUID: U5nqRu_r0vybd8IeEtnGyQqwPWbAJ86_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MyBTYWx0ZWRfX9cktsF0sw2pJ
 4dUv5S8/sw8kadDVcSm9NpggM8xPAjtPacHv18yzmEOm6nVt1WggZIbJEhmVA+yyCWWILrTgiWE
 jKUx0DrMS6H/617UiKpU6RL277OaqGE+DpYAw14V8quxhcxwTIUv72YI6Xc7uy++1OYoWfnRdhD
 u2JE1Qjxmx7cEjjTcL3ZCrIAPjkW/sVZB0Oimf0EfSpqft0KNUOJynL8dopfAtZZBtfTE6TrQjq
 1ztsoeJFYOEPMqZyDnFEflKTFxCZeBwo7QHUonoQgsBs/VklcZ7La182mQQ4AmDt2vlLtAiiPuc
 fT+l00KS3SELZmDeiH2NjmjceznyPu0jPChTiivtp6ABiov4S8x6CrF23ZZFu6LSjgbzSkFpy1o
 6xWfKtGR0nHbArbGnsFIh4whgBd0RSCi0JFRiZzHO7qlNq9ggPMnCAcHkSvgrcVo8k9T+GVBSyX
 4HkWVo9bIfkWqw8XdLA==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd263e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=tBvkqsR5qO8VAAGR:21 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UFeFBDWMVFPhIVI_28YA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 18:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130765

Commit 3e423e21e5 ("polkit: enable the agent helper socket") enables
polkit-agent-helper.socket from polkit, but since 03420389ca ("polkit:
Add a separate package for polkit systemd service/dbus config")
polkit-service comes first in PACKAGES and takes the whole systemd unit
directory, so the socket is packaged there. Images that install polkit
without polkit-service then fail in do_rootfs:

  Failed to enable unit: Unit polkit-agent-helper.socket does not exist

Installing polkit-service as well does not help with rpm, as it depends
on polkit, whose postinst then runs before the socket unit is installed.

Only package polkit.service in polkit-service, so the agent helper units
stay in polkit with polkit-agent-helper-1, as FILES:${PN} already
intends.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta-oe/recipes-extended/polkit/polkit_127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_127.bb b/meta-oe/recipes-extended/polkit/polkit_127.bb
index 2089152826..acd4386354 100644
--- a/meta-oe/recipes-extended/polkit/polkit_127.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_127.bb
@@ -48,7 +48,7 @@ SYSTEMD_SERVICE:${PN}-service = "${BPN}.service"
 PACKAGES =+ "${PN}-service"
 RDEPENDS:${PN}-service += "polkit"
 FILES:${PN}-service += " \
-    ${systemd_system_unitdir} \
+    ${systemd_system_unitdir}/polkit.service \
     ${sysconfdir}/systemd/system/polkit-virtual-provider.service \
 "
 
-- 
2.43.0


