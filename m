Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5628.1793252787346140668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lCYjVNKX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eXhobRNi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H7It3829254
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3pzAbDz0a6B
	bEEiatqD0j5B/u6DqDw5H6N2waJWGlnw=; b=lCYjVNKXKCLo12etJVxglqiQRKP
	TDAQO6lD3w+89Mrus+doXcBj+YbxBWmn3EXI63zpmA8CC7VrUgVfr/2wVYedJ6ip
	7PZS5ACQIldYAXCV2KpE80ZyuAkbWHp3QNVjVXwTeuhgHc9wPzmlI776etJYdrVP
	ouIC86SBxVuV2dfIYshHwNFxOeDyt0Rm8kQJMBrWCTbRveMO64AOyuD0v6Asl3zc
	kgNZG2AYPGGMQfqKMB9Dzk89xwa16QVfZjTdnRsneKB/++RA6WAKhCIErYf0MXBn
	IwuzqJzQmEaXDuq/ojrP9IV5tYCBq8vuvie+4DgF2whI/I7ZIjQba7msc5w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp945m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so2607324eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 22:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252785; x=1793857585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3pzAbDz0a6BbEEiatqD0j5B/u6DqDw5H6N2waJWGlnw=;
        b=eXhobRNiQMDLxGD7FYGyDpIXvZZ4Ye5FEFQZHlE79CsZENR+Jqv55/r8fuiLJcabUH
         YGRj8mf+p6VyNbIErl3gxc5oNtXADfKqmQonBHeTFBEN+ry0TR7uMjCEZ9CdZixvX/CI
         KI3nSYY8Bsz2nJ8+1vZ6rzG3bhBG0gvxNtV+ZiJzhTXHsabSY722rtjLZga8aQC61tWa
         WG/wSS2Dcyk7/sMzZy3i2PbFsYAMd7SOUIyJqNqeHXdjjGtsuwKA/KfVGOEVDinuv4v0
         SXG6+hPQZlkj6Q6Hu/Yw1pFdKZMKhn4BFL9vTDEypLezH+NSfrnuDuOLLoGX/pEdahy+
         0XfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252785; x=1793857585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3pzAbDz0a6BbEEiatqD0j5B/u6DqDw5H6N2waJWGlnw=;
        b=Elz0GgOjnd2Jo2guprxhkFqFM1SWld75QVjRZctsQaKaIOWmBVcddtdjAxdOl8CNlH
         SK0PEF5GkLVpIq/2u5wNZbP4lkC4vxDwHPcKoztu8l1LNE5JKycxRbVKb0Ss03h0nOtm
         fWliSNr614MoBVbt7o6veCFZTEtyKGaNttoanPOU7CIWgAq+KUFcaVqYAHzH1HsHETpR
         HAAJQn4pm/N0coCbF29cb3sP5wxSJuOtD5K3QrNe6ShMzAbp1aE63UZGbXxfZmB+z+nI
         o2rvnIDHM83IwpIlaVMEqBkaZvcGsGmPZRr0ppjE/N1gh0rS72DaKkf7umUDp80wwOTy
         /HWQ==
X-Gm-Message-State: AFq9FYLMSNIv4Go5rwFh1lIeLkuwsWiViVIbUAE0N6Nr9AEhnKBMcLPm
	wko8TLGBgFF/NQL6WQf6DM9HqVaLW5pzYQDRy6+07HWZbYYFQjt2KbiDjyr3a9SJNMU+iJh1lth
	DbeQqhLEmWGvQZgYh4ntdl9NR/r2RDZnBYUE4BkMeI3oUKDUw9vW/E3it4h2WtItRrZvMuIzj5K
	R3eoLJRjISyltwSj2+6YFdkA==
X-Gm-Gg: AYBFou30CMdbV1MR8bnCgCo6+6uVQGwAxz+J/4DsGkrtIv4IontR16itiziDuioQUHK
	ksD1qs/VUhiwmbFzcy2fC3TFbLRU2P+ZRRJtXGUOZIQsRw26coS+5z1IUaT0BW6msRSMIamX+q3
	famFC2lzDBa+sFHTUzYyHIpTjN21ymHglR6VPJ3i9pM8Mw5BCvsVnngjkEg3h0/3h3QTsZI2i/u
	uX48QpEwvJ2yoq9Ppp4tT0MNVdIRkI2bRDgUQKtjAFahtD2WYf+L/zui4jNXDbDaiKQszfqmb1G
	Cz9ApDfrJn+nFcr1AD2nYPLVuwnZm/hoq3TYEoSKMJa5a3aPDvrpGxEtzk/5rCGZOtGsswZyCzy
	fQoc/xkopaAK9lsRfGDc4fmoKC2ndXl5jzWjGyttoxfkNtl+P82PP/ctge6kZT3jpY0+t8Jeq+z
	THb9nZ
X-Received: by 2002:a05:693c:368e:b0:369:d992:e3 with SMTP id 5a478bee46e88-36a2013b2b0mr6321532eec.32.1793252784391;
        Wed, 28 Oct 2026 22:46:24 -0700 (PDT)
X-Received: by 2002:a05:693c:368e:b0:369:d992:e3 with SMTP id 5a478bee46e88-36a2013b2b0mr6321495eec.32.1793252783710;
        Wed, 28 Oct 2026 22:46:23 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239d3073sm15670298eec.29.2026.10.28.22.46.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:46:23 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 5/6] pcp: Add readline-native and ncurses-native to pcp-native DEPENDS
Date: Thu, 29 Oct 2026 11:16:11 +0530
Message-ID: <20261029054612.2642345-5-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
References: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfXx4IRAmxJnec7
 qYTMth4plqsaZ/0mQIrDnHUH+DRL5Vl/yhRtopTEzkXu6MbF+9R3RAPY53LKAliLgheuWSkF+IA
 wNvixN9dVqFhgIC1yb5+3QDJ2P1DD7XePpSlIdcUsHWjW7zi9tB6fkQ6gkfV0BpTPZeP37zePG5
 UVt0F+Cnc3msTMJc2UwglkiI10TnFissmiWfCf+fEg4eHlnYph6A4qkR1JrVYJcLCkbRQ0f9Io6
 ZnbCeHGQUiTn2HKzaPMmNnbWR111GRflpWxK/9JGXNZxmEbM5vKzEot4dUQVwwCrXD4yt4BRdD1
 hAZ0AOWkjgYevXxkbZOP7k049Cnh3VcBO3m7UMYn8qf8jMApETMEKGwQ2KjSdTutZN5R7kOnGrB
 gk+AWietU2dbPX3JEVEAdCYG/aY5rpDUKtGCwuHRCw7W22O60mXCc4TfcWVIm5y7jYPTp1tZxW3
 Iop2+MoQOnk8LGm66Og==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2ddb1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NHFlQX0OANvMoQo-VLIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX9BOyn7RNJfMQ
 zgNAPlQTBmRQpdJM+Tw46OUbzJxh7wvi1MY1gS1CpI4nnqfCZLvWyfLmk78HkhZm7ogfSqtcZ5A
 hvJytb21LKK1TRrg4bnMVti5cWCUN3U=
X-Proofpoint-GUID: PfXSkYT5ihQTT_ms2aGJnYnDu2qn8s30
X-Proofpoint-ORIG-GUID: PfXSkYT5ihQTT_ms2aGJnYnDu2qn8s30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131636
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

pcp-native compiles the pcp sources src/pmns/lex.l which does
'#include <readline/readline.h>'. The native recipe only depended on
python3/setuptools/flex/bison, so with the header search correctly
limited to the sysroot
0001-configure-Limit-the-header-search-to-sysroot.patch
the build fails on hosts without readline development headers installed:

    lex.l:25:10: fatal error: readline/readline.h: No such file or directory

Depend on readline-native (and ncurses-native, which readline links
against) so the headers and libraries come from the native sysroot
rather than the build host, mirroring the target recipe DEPENDS. This
makes the native build reproducible and host independent.

Verified by building pcp-native from scratch

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 155fd062e2bdb54061d457f7e2e4e20eb8248038)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb b/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
index c4064d8330..e25cf2e8e4 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
@@ -1,7 +1,7 @@
 require pcp.inc
 inherit python3native native 
 #autotools-brokensep 
-DEPENDS = "python3-native python3-setuptools-native flex-native bison-native"
+DEPENDS = "python3-native python3-setuptools-native flex-native bison-native readline-native ncurses-native"
 
 export PCP_DIR = "${D}"
 export PCP_TMP_DIR = "${D}/tmp"
-- 
2.55.0

