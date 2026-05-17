Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36C4CD4F25
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20211.1779006258138332709
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jXTtXzq2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ADND1d3l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5iwA22717505
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oJWGCnw/Kd+
	RnQBwLxZBHFt0NnrMNTRU6zTQNadKkuA=; b=jXTtXzq2o4JAE9m308ZoNbjPEYy
	GixdBUCQ43+dnnBvCrsb0J0+8zKxks4NaMWGt9G/jjDdFBNnYuHVka9ROJltkkRG
	zSsDpd5/JG3t2Lvzm4dtD/JpjAcsKXE1hWsHufCs1cM2387z7rKSY8Uzz5YySqLP
	zewzKk7LJOKAi1wCJBqJBiTB6YDUF2QDez7c5N+bxsVEGOlxi+OZ9wNODOFTnGC9
	L4loty5pEFtXdhT0/MERMax9iTCsDit6x0jVqedgfxSKdo80kCOw9Z1FVpQ3H3vv
	Y0u377RVdf0YBGhqgZ9NPBpHrUjAZuKR7nUhETEwuevCAX7HYfr3IG1wipg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw2g14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366122e01fcso1055135a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006256; x=1779611056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJWGCnw/Kd+RnQBwLxZBHFt0NnrMNTRU6zTQNadKkuA=;
        b=ADND1d3levJo47euEklqKpzubZuSszJkngKDUCjgcK5wTGILfH7Lq6ua9GGUTax9/m
         6xan+YZ/cqkcDWcP9IuHoWxW28nQjfbm7Q3D9TI2hFuDCrs53k5XXa2vpftSS04v/np0
         Ao6LxrzJkEOrHZgmz7x+y/wCWynAsoZXUoTFC3Wk2IJQl/bp0WZJd/MXbHZGZGfZ8Jor
         aNV1ZER4L9PBqcHl4YZLyWLedrQeWIrS2MzKJhCcBMemWdTxUmvvP+5JO+EBNHqwy0tq
         E+pEAzmYmRZOkjPpsIcZAeyDnB2AOJ1H0/+uKRDt0gNVZoD79KqJttRCXXdZyE3/5bt0
         rzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006256; x=1779611056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJWGCnw/Kd+RnQBwLxZBHFt0NnrMNTRU6zTQNadKkuA=;
        b=rCjDy7QRrROkyXr1/WpsWsls/lWHpl20qDdfEfn1OyLSzFqx22FUM7pQ0SLz5DHhzI
         OG81a+FneIF5b3RFyiE0VqUfw/5Z3yjNJ9yY2PqLM4P8ATf3TKA1+H5sPjEwNPaTS6XZ
         oCOiTDiagxS9J96Ja/yQVefLQ0lwFK5JCeTnXx5Bs5ytUcIfiydCZIhIarMAToxnmWHX
         L8Z7p18PmBBZX2FLj33xjw4Qe8oBKozIwNmIi1f7PNBHQOO9WXkn4QywXNqkt3BD9LLs
         o5S+m1rQZT3Ks3vy4Y6YeTOyy1G9ZYwp03YXtQIPBRQce0NJRlZ8akYaT/ZD8XFNEDkC
         gWVA==
X-Gm-Message-State: AOJu0YwJdqSdT+jV6NEgrkcDlCRl1n/w4pxwu19uiRwgEGhEBHMAoU0h
	lNNvwuTIwjUsKOy1QGRq0pzsZOnZ7D69wdp57KGgVvurnHlQtVOuq95drDR4ZuTwYciGophWXlQ
	Ku+IfqtbiIdbFqdTJlHsL228uUM0Gjnejz4gej0B41oxAoQRlMXcMCtN2NvJpJtDLs1kKm2OOg7
	79SmJDwlc5TgodpPCy+p9Huw==
X-Gm-Gg: Acq92OGHt7flbHhUk5+miPU7rYpy1eYFlhd/P0Gu8AXIQs4gJOf2w/GunPp17eObfPi
	CN6twlN4RFyySjGni+E/JyZtdVSsjpgK+YT75ojGUniDLAbBT3x6XftufjkO3YY7iY09E/rOok8
	yzF0WnHG1Ep8Ltbxc9P+2n+I2PKUgQ50RsYy9g3GjZ6IDfHDLg4rh3KI9H7j7Dn6N1wdoNlrvRw
	tWvYpctg/x0KFhAOYq/V2OdBh8euUz+WhImKNEt+KFyCoGKvEPXJ6yZEHOrdEASUl4KC/n7krkn
	on4hUWc4grB7RwWIMKzwZ0lKfa/BqZqixcLdNHkj+gqxVwDWtFV7EWbJAz1SlEfVYLSoGO+N4o4
	i9Sx1NLj/TsJDxNvoopLKqwGQ8trExFx5dWJVr3WauHu0/tA6YmGt
X-Received: by 2002:a17:90b:4a92:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-369519c71e0mr9363264a91.7.1779006256092;
        Sun, 17 May 2026 01:24:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4a92:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-369519c71e0mr9363252a91.7.1779006255617;
        Sun, 17 May 2026 01:24:15 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:15 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 11/29] strongswan: upgrade 6.0.5 -> 6.0.6
Date: Sun, 17 May 2026 13:49:39 +0530
Message-ID: <3ab4c074054b84cffd0c4a254628482520811ea6.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX7+glnJ+onPPy
 euBxnokYd63D8YZlkzxLVIGUJVVj1usGJL65EslbExB40R5kQm+SpWNdN7o3DXBQ/rk6zXPhl3H
 oeDmgTJdIygYfmm0IaKGpGh02fl89K7vb6Un2zYw1tKdnyVY8JIvAczVvZCQv8e/c72lx15hXTS
 N6W60AeWNP+wo35dfRGR5ETpR4aUYa902oIJOJIya4L7oeVQFQwZ3QkIM4IQ9QjZu36Y5fvwiry
 vZOxqb4H0pDkOb6d2mWN6YegjAA9Ty2QixZ4P+KY3SQKkOpf5lACCbGHyu8vniaiizrQj2739X7
 nEDtEFSADuSRvg1ZJ1DBg7kneD3cxXBdJ34aEMelwc701a1Z17eMiX5CmIKpPXGEZioxhEsnJf6
 8JHn7sjoKShU2N7+l5g1Yq0e/ZMQ1RSehQgN4GUodFgZIlvIwylgEfj1uOKpaImLo3QxJOZ1+tQ
 +eFI0517dQ1y8PIhcVg==
X-Proofpoint-GUID: F_tiJAF8IxtPnC9OFIHnB4aOVZ4couNp
X-Proofpoint-ORIG-GUID: F_tiJAF8IxtPnC9OFIHnB4aOVZ4couNp
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a097b31 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KiMCiSwjAAAA:8
 a=omOdbC7AAAAA:8 a=EUspDBNiAAAA:8 a=i5kyZJmLz4NmwFyFHpwA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sPCYT0qwnquSfqsKqTDE:22
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
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- CVE-2026-35328 - Fixed a vulnerability in libtls related to the processing of
  the supported_versions extension in TLS that can result in an infinite loop.
- CVE-2026-35329 - Fixed a vulnerability in libstrongswan and the pkcs7 plugin
  related to the processing of encrypted PKCS#7 containers that can result in
  a crash.
- CVE-2026-35330 - Fixed a vulnerability in in libsimaka related to the
  processing of certain EAP-SIM/AKA attributes that can result in an infinite
  loop or a heap-based buffer overflow and potentially remote code execution.
- CVE-2026-35331 - Fixed a vulnerability in the constraints plugin related to
  the processing of X.509 name constraints that can allow authentication with
  certificates that violate the constraints.
- CVE-2026-35332 - Fixed a vulnerability in libtls related to the processing of
  ECDH public values in TLS < 1.3 that can result in a crash.
- CVE-2026-35333 - Fixed a vulnerability in libradius related to the processing
  of RADIUS attributes that can result in an infinite loop or an out-of-bounds
  read that may cause a crash.
- CVE-2026-35334 - Fixed a vulnerability in the gmp plugin related to RSA
  decryption that can result in a crash.
- Made the Botan RNG types used/provided by the botan plugin configurable.
- The fix for the vulnerability in the constraints plugin now causes all
  certificates that contain excluded name constraints of type directoryName (DN)
  to get rejected.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b05b177ae5473395ab2fe6f341c0efd129dcfb68)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../strongswan/{strongswan_6.0.5.bb => strongswan_6.0.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.5.bb => strongswan_6.0.6.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 405080070c..daa6552899 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -10,7 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "437460893655d6cfbc2def79d2da548cb5175b865520c507201ab2ec2e7895d9"
+SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.53.0


