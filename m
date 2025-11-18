Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C1CCED603
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:42:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9472.1763462532165552062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nxHcUhen;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=P4xPpVsz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAW77K027447
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9Y0mTxP5Nh8
	UeLGu+Yr4Qh2KkDYa5OYDQks560g5E18=; b=nxHcUhenn1dsGlBHW2qCZIxKHye
	8FmlZQCr49DpvqYI5uvfoKZPARf9ZQDbIqaBjDOaiCf3I7o48m0imQTuGYdgleeB
	AokTzDE4xqNpZEIx/ZH/PjV6mD6dHlkilCqMnb6VtNsUK8khkje5ctVPwQyLbMdT
	/huCLIjd0RQuVhBnKxV8pZhxwoxbObscdOWMerjPhj5ftLEqcKl7b22zlsls/laS
	wfJnjDA8Ql5Q4dlVfKfWzE5CNJQ9DcPbylhs1g8diqkNO9iaDUap9Ucw7D33ljk6
	JjO62uSzo5kZIEriDQWEjPXawzS9bzeeOcfogyipeyViHcEpKx74vU4+KUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t2ssc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:42:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dde580c8so180551515ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763462531; x=1764067331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Y0mTxP5Nh8UeLGu+Yr4Qh2KkDYa5OYDQks560g5E18=;
        b=P4xPpVszuXsi/yDWfaFVWulIguOxYkopaQrTha48kkKozfwFz4W+gG/NH7+z+aXSCa
         6Vpp0rT9r1Bz/c8aZNd5jJdZpBQIXcX0t8YB559pTV9fS2iVySVugTnZF6aL9DR2zsDj
         4908QftZIFpHYIIlv/yxrFlrJPTLCFE6dZJglJu4bwSeFTfW4pcQ3sBdgMtgYHF73tFx
         j/Uf+C2whU7ehxRq0zjGDIuMraVj7VqWJLIFB7CWdYA2SaQaZGqbdHc/6/qnVBo/PO+N
         QdZlISMlv8Og5aj5v0tFa7yaiSJNtYGx/aqjHvn+RkVaovQA1/7wmsEHAY0QE4ef+9KU
         d47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462531; x=1764067331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Y0mTxP5Nh8UeLGu+Yr4Qh2KkDYa5OYDQks560g5E18=;
        b=tGCUbX0CawXMjNm/EHuqJyFJkZUVRqM1aPoYdfYKgtV4XRj7KkhOXSTFmCg8nX+ZLB
         tEqp6hLufpP4zVItnXPWY8osA8P6Al/vdUbtPw1J8besdCH8m3tDQvI8dQz7rAu8Qm7l
         mw71mW200g33pXeypLf8hxAW9GNaE0xF+uXezSJWVL3DLqSm63BZ5Y79voUbhsZrYNt2
         gEWyFtO0nHLL37ClDGyLijYpGBffJVqopa0NMRjQBeQKNgfiBAI7RwUNPDayWq1mC6GX
         RWmVFKSCa0ytUUsL7X3KW11tl12V6qgEQDyl2JobBnCN1Qzx4pFjPVz9wqz8fHJgMUCj
         dNCQ==
X-Gm-Message-State: AOJu0YwrxRYl4ntHN9ivXjpiys28iCCCNiFanzrOck4SIqcKHxF4LXXL
	OoM4Fsq7XfSvPuRyrA4KPNQIOQLwzgiZpy+y44dwdtcdeMf3LajO+j0WzyYN0rRjJ8hD84RqCAW
	XKiVGSaK5z+6SAThufIpznP1NI5FIpdfqRDfbHfs+CDEZYI0dhmrFwCTuan3z7nbPRl7RGz5813
	XfmHr67GefQR6/9mqMdVQ=
X-Gm-Gg: ASbGncs4Cmi1K4uS7fPfYUWjtzl/wD4csqf43tvOqld4h7up9GjPX+l34UInf+G7KKt
	t7EEiIBStE7R+d/xjXd/KllddV76b4rtlhya3Le4KyPnofNA6L8/Xi0eMyQeWkiDkYvpNyfnsT0
	E8xwwFKy/gApL4164a6NLtwNFSPSz01evBsGY8nt6VW5ihh3S1Gk7eOXAAqZ0JLm/Ectwdu+YTp
	vP4tQcrad+GmuA3lEIT3dHqd6M6w/VJ400nGWFy2TXV5yp3WbouaZkcSyAjOhg3G+s3czONxRF0
	D9FHsAeuE4LSBEXIrlN9hiX09/dAIVVlI0/3uYt+M1hdjvXAML59ZNomj/ySLxghNeRmtk6B3+O
	0u6GBYCR3m0TNXrRUrEG6PlQEHUDGxamqZdTM01l+
X-Received: by 2002:a17:902:ebd2:b0:295:7f1d:b034 with SMTP id d9443c01a7336-2986a6b851dmr173302305ad.4.1763462530906;
        Tue, 18 Nov 2025 02:42:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpMLCwp9o9BUZtzv1IS3Kv1u6lQlTyGiwccrc+U5uUv15JRZlKbj/PMBbxV1rh42YygySTqg==
X-Received: by 2002:a17:902:ebd2:b0:295:7f1d:b034 with SMTP id d9443c01a7336-2986a6b851dmr173301985ad.4.1763462530219;
        Tue, 18 Nov 2025 02:42:10 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e0794e56sm21680725a91.10.2025.11.18.02.42.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:42:09 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/2] libforms: Remove buildpaths from fd2ps and fdesign scripts
Date: Tue, 18 Nov 2025 16:11:57 +0530
Message-ID: <20251118104157.529919-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118104157.529919-1-anuj.mittal@oss.qualcomm.com>
References: <20251118104157.529919-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4NSBTYWx0ZWRfXxdP2XIs2iPjU
 YlOTvvrmu1eFWNXTVnkRClFQJKVos0Ct9rU7IU0iJ1ztiV5SKJsdE+J5s37aZPsUpayHawqSOoC
 s10BSQk9DY6mrChhmXz3DXIR+MRE5OhVqvqKq49+yyYS+L2jkw85+BWBg9CdJmsr47CC9ylfmfb
 F3CFoEYxy3+TIwUi3ddG1ALX0kE5CiYO8FR9C2A3okKjyaOmhPcc44ghtXP2pTltzrvSwc53k6v
 qfkQMwN2ZTwIYt8mQmOVXl3XcBHCCZmzBEwjmadx3oYAeCi4kymgTMEZd6DCWrWeQnMYIRDGl+1
 OsJ5GSiOE8/TPxzgmTo0fVweyGqYXmn6yc0DMIK66kilPyVEyfJpejFsbRc4iLNVlVeR8xW6CH7
 /nx08yIPE5aVcQvieWz6QiPxOJHxmg==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c4d83 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=TQ570a0gQl1C9hGtw_4A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5g6BH44J_LPSFGIw2uBxt6R1zA2iiaS2
X-Proofpoint-GUID: 5g6BH44J_LPSFGIw2uBxt6R1zA2iiaS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121850

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 181409fef4042d0e67060e3c36448d124958f109)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
index 251c07adf0..db648ec8c2 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
@@ -24,3 +24,8 @@ DEPENDS = "libxpm jpeg libx11 virtual/libgl"
 RDEPENDS:${PN} = "bash"
 
 EXTRA_OECONF = "--with-extra-inc=${S}/lib" 
+
+do_compile:append() {
+    sed -i -e 's|${B}|.|' ${B}/fd2ps/fd2ps
+    sed -i -e 's|${B}|.|' ${B}/fdesign/fdesign
+}
-- 
2.51.2


