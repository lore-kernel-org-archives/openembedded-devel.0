Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390BC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:48:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.27487.1747763325608279054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 10:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ch8tEBsh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGjCXg031860
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auD1XPjXCRh
	mdxhJM3MOJr7RO40Kxw+vF+pnSq6GnyU=; b=ch8tEBshQwPsCgnCDdaN6ZWEvjo
	/NQQ3O19vYQI0yInlM3hFGKp0w2QDdmu68CtQz9AOw5nAfYXa6Pov3FaJVbgUNuk
	mGGlqtPDma6M0KphhoP0Xf8VWhBkHdD4fVMPaLI3j7sqmp+bhp18iUetq14zexPu
	D6Uj9ROpZJia8dHkVquFtlvfs/nd3s+UXc0TMrwoaXqkZ49ZqpVxcrtvJV55ViEe
	uUVAm3lo7cv2lI0QjQxdxiOR2KMAY1mzn4hWnfJm7kRzMjO20k6868tQWie+4P8S
	/cQLthhwCWDsIDYHHC6NMVYM5yZsOnpDcz2QZrTDTuIpYJBoNRRDLX/7R2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0072n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so56292446d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 10:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763323; x=1748368123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auD1XPjXCRhmdxhJM3MOJr7RO40Kxw+vF+pnSq6GnyU=;
        b=rGappANYH1l0sZGZ0qLQIWlfiW3Kn4GW6qyjM7pczD3oeR9t+1iqnigv616kh9mVkg
         F0L3Xst4GXpLSEm+sUwqNRVLQIyF+sS9h5OSWtpOaQ1EM/kUd4iHiIIq6w2B8vsHSKaB
         ygqZHA0RP3W3oGbwCa5nyaA8BYStsgS90xPNbM68IsbydfpI2n8EfuyD8nJPc/SbyS97
         64FRo1ltKImDsxt3K21KcBgJi5JVE+fOPVRmTdBJ/Lt1gTs1USk5VDABFdLZwiettEDy
         3U2XzJomiAzn3ZH40CYWq/5wC0NO4eDkzPnL24SYu5ywXoQsgYZIjX4905aU0ept78M4
         5u/g==
X-Gm-Message-State: AOJu0YwiZS1OgNDk9LGmVMt15OdzxbeF2nl5aa+OPZhZBNxrdH0EK6Fg
	DNp4qsWjTJfaTjcElF0/ej38mE+jO/P4Hsug7qP5eNbQsNhWe8V3GjDC8Z3bc1oZhnXVTI3sggE
	HELtOZVd0pahEIHtlkZR2I2XJrYC4LyoP5d7wSOaFZsxJ/1pu/CnqlbjnzlRS0E0s40XqB9aaOM
	aPLjfRcS5nHVT/QaslHZU=
X-Gm-Gg: ASbGncsrQyzHs3UfcGVnXBTstPQBqv2r6brBsJrH+VFC1FpgLCQUOCWweSAsw9AX8zh
	aIo2Lk4EwaR+iU83lwIBFQ5LfS2gHLy3ix6+lYA7plkXVo9iLMZcnVOyyKkMIfdQdy1Juy3NVXv
	ItYxV32ITlcOH8IvpZXHqYBa8nhmN8vWKQwbLHcfYIQWZIE1WWBjx68kmtJLRhZsPJ5Ujf1l09k
	eV3Jn53WFaemkf9X7pOorb6W4BRCVAe0X06w52r09/IigKZdcYihcwgkq1oiTX8nVsmWLgQRZ/I
	HFCjOgEJ6x/5qMkA5hyuNT1rgTGw3+s2OjoVCpoMkuoZeoOqecDSgk3Na75FUMOjOPWiKm1jHIL
	FK5MD10ymWL9TFtc/AkjrTRBC
X-Received: by 2002:a05:6214:2a83:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6f8b0849362mr248147336d6.4.1747763323635;
        Tue, 20 May 2025 10:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFZIKKvYP59f+gzSq+qzI4dfjxKTxnxj5dtkSVIz56cpz0qt61KTMy94+g9gWUc/7A8QAhZQ==
X-Received: by 2002:a05:6214:2a83:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6f8b0849362mr248146976d6.4.1747763323146;
        Tue, 20 May 2025 10:48:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6e0sm2441815e87.223.2025.05.20.10.48.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:48:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/3] libglvnd: pull in libEGL and libGLX ICDs
Date: Tue, 20 May 2025 20:48:38 +0300
Message-Id: <20250520174838.1187294-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520174838.1187294-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250520174838.1187294-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -ukn9VT1AwDEYzKtXhYlUBSbSDGHzDWR
X-Proofpoint-ORIG-GUID: -ukn9VT1AwDEYzKtXhYlUBSbSDGHzDWR
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682cc07d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=-TUwe_Tb8dWRorOgwa0A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0OSBTYWx0ZWRfX3CGQr4CGqwC1
 nh+1B+wjyUs3eQ87aXD+a24fyKsvnCgvt7ydpLG306eS7SC5reb2K/G9YgRLpJKgNom2ftnw3cb
 WaJDgpHXfGpJOBiq8O+KHd95NYMPwCTwLTwmX/mPx6kQcnPdyeFgWgSnB7Sv9WnLyEc7DGWtoio
 hxe5Qfqfdfoe6CGh0Zq27SzK3t4Dh5+es1l3y2CpI+9SblW1AUyRez2YzCDWOq6q0No9hw7U2vd
 xdDSOoSAqLfQlPNbSkSH3XtUXNnkMMZuONqak0bmmhuSOK05hMAY1AQroNI7tOe4D3VHmz8rLdt
 2tAzG6j/JQYa0yEysIwfKwgLAq4DkURP1MeDWJIs+kRwO0sOrTCj1rNRio45IcXUDkGyb3XT8TR
 iKe6J+cggfjlDrFyrhR3NDILQAyxpsLaXKX+1twsh1Z+f6CPpz0+Yn3rr4SaprwYO/e9UCnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200149
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117519

In order to function, libglvnd requires vendor-provided Installable
Client Drivers for libEGL and libGLX. RRECOMMEND corresponding virtual
packages in order to pull default implementation for the target
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---
Note, this patch depends on corresonding OE-Core changes and might be
applied separately, once corresponding patch lands to OE-Core.
---
 meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index 8f8035896376..a737a735b7ea 100644
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -22,8 +22,8 @@ PACKAGECONFIG ?= "\
   "
 
 PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,libx11 libxext xorgproto"
-PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto"
-PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,"
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto,,libglx-icd"
+PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,,libegl-icd"
 PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
 PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
 
-- 
2.39.5


