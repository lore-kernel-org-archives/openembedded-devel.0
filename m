Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64BBCD4F4E
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20204.1779006271151249132
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VNBlXvje;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VKgTUU7K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GF2vL41255259
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GEZFx8C+3uf
	/pKkkNxdCycR4ekqBOmd9y4knix+bEJM=; b=VNBlXvjeqmbbsAPm/CzPowvPVa5
	pEqGdj8iOHMWJTF6Ko3ig+/EOmWdhXtxOlyeV4VV6WNiPc1P05DWnJVGQaDdGje3
	1o7S3+S23GACayEhNovzU57htj42v+rwnITKWQO3HCQbKE2F/UVWkkUIVOsIsaSX
	cNpFB3uIzIHeoixptoOs3euPrsVz3yq9dWMP1kvfRuTG6jLOHBHd2h7/kozbn7+A
	QUtm0KHKD27cMOKVzERRh3bzqqKTe0577eSrKmOYTtJ4jv5maQG0neaHkxf7Yj/3
	4WrT1h9BeTLH40fL18qkCsO4bhCvaorhe1eSCExeBQ/O4hHHbAG0Xk7r3Zw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvchcc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36603ad6709so903807a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006270; x=1779611070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEZFx8C+3uf/pKkkNxdCycR4ekqBOmd9y4knix+bEJM=;
        b=VKgTUU7KQLUohLXcC407HNaIjUDqT+hgIRnT9k/apWW76ULMi0LXVFElAJnzi+hR8c
         21gvxbvaWVHYc1rf2V2W21ZgR4SPc7rP3rOakhewpjCd+OKaR87XboFUI4WXaNoXqwSl
         BBSn/ZF3QQ+mkKxu53PpkG9odjf4kNKu3m2I884kqc2crzFHguMApZ7KVg+AS1VoQsWk
         mVJS3NwanBrbKRPL3MSnN8RLN24vp+TMfBjTwAgATwxfA7Ekv0455RsFYRZfI2GWBgh4
         aPsQwD31FnMSqeqFlr8E0gWUIvhWBfQUHTRh2duGrGqpUdBh198trKP/JjQoW0d+btsl
         cabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006270; x=1779611070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GEZFx8C+3uf/pKkkNxdCycR4ekqBOmd9y4knix+bEJM=;
        b=c8yUxTsFQDzWLPUbix10LZJhb6zNQl4bZaOMv+2gNL1X097AEe1USAVsI5u8OK6phX
         z01rYFdtzZ80RpHikMZEzZenosvVTicaXX/tJv7INOV28jFiFg3MpsVjuJ+y8F3TgsLe
         1Da7QcmiXHBCMxENnYRQBVspEhdpvffALrkA2ibLegaaX260sAWf6TPPk1zqrYzRjE8c
         YJpnj+FjK8lUs/y5EROo501brgbTdnCNDPxFQ2SAmFQAZn0mlKHF/dfgua1gt/+JkVfm
         +OsSo7sZq+ffihHOfmWFAUk2C2mHogNLXDER1+UCnOQkIR/itkqWj6algwxEeB7aiH6N
         8p2A==
X-Gm-Message-State: AOJu0YydKuUdAb50Gkv5aO0wjZ+A2BJH+RRT1nFmDtIYxA7PSdkD415o
	gz1aROcGdxTaniEOFx8djq2j3tbIGTIY2BX4L2GkXcF3Ai+0BA0n3ikM8SzUN+aQFBzEuZaIuuJ
	j3LlRNieoUjyNwCDYrPy70JL0rwj8c8ukVOYP1+M/82T7+OT8/8A+tVCZAeq+K8i4NeCVp+SDuR
	5hGBbN9Zm+rm9bg1y+10/uyg==
X-Gm-Gg: Acq92OE2KnPjGn0CQlGoi9XJU1Ob/0uFSRxh405f88gSq6E1PXAzRiZMaCDyuLI4FeD
	z+TfS6SGsOCjn1Jl/D+MN8P/Jqj+Mge+lseJM/Ua0WHAJ3kMIVzggvnXKEgFl0iKzJPXkMeewRN
	7II+plTFULv5XBvdNclJyhIuAZb5fxdlsKt7koTvFkN/nTVYU21er/1GPW3XOMSoMVmmcxdb4VN
	G9dACaLND/QJc79xw9bsBiwGsjiWGctXjgTJ3JzxoyMv36J8u/+JmWD2X5fhWZyDgff8v7/LU6B
	yxtwJB8R+/XijEqvJLK8xpHqK90SXDNtT8xYkM6GmhANH7dsuBjcn0pTtNjBWtjCdpGKQB2p/85
	TjO7BHdjrrYDg1CSjQ6gLc2NBxqUY5LWtqMO6wX5J8XTh7RR7rElk
X-Received: by 2002:a17:90b:4b46:b0:369:b9db:b885 with SMTP id 98e67ed59e1d1-369b9dbc037mr509593a91.15.1779006270121;
        Sun, 17 May 2026 01:24:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b46:b0:369:b9db:b885 with SMTP id 98e67ed59e1d1-369b9dbc037mr509577a91.15.1779006269635;
        Sun, 17 May 2026 01:24:29 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:29 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 20/29] thin-provisioning-tools: fix compile failure on 32bit BSPs
Date: Sun, 17 May 2026 13:49:48 +0530
Message-ID: <3abfbefd4fb552fffb81c5ba844cd9054e79d71e.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IYI_j1KN7AjWpQBMvUVY_ponSLnHZigp
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a097b3e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=t7CeM3EgAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=iEsDI7ZdRBB_fFrSkYEA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IYI_j1KN7AjWpQBMvUVY_ponSLnHZigp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfXwsPpj13ISlcu
 hDMgjfXyFaO1XovnHvxvEPusztOD/kVZ2sekKT+xsx9fup1CRiwmq+IdDh8upOSQANMn9edy94W
 IhqKZAGA4ZG3xUNJyElY8GyMwcIoX9EVBihVVOxBBpWnmT16VBuCdyBF/KCsTh7cEgGZFiSx4S5
 Wd2XUooCTiDryHDSet2nXOmjwv8jdfHQWmrF8oYXSQBiEDZk7ivolRaOB25r+qGWlCj5grNVCxO
 OiElAr0paHjXKUMkYaAQ0VTJKlCogTiK6+MgLqOoWM3VTbyasd+gc7gMXmgYb4gbGU4aEnyjzIG
 SqmpNpFvoubCVv6ldm3B2SzuIzot3yw6rdyfWsuFPIggknGlkgVV03NOuW3ZM5djqZphUOcemJ3
 gFLx0GZgjPAsN6rPs4cdCfRyEX54L3xdkIv077IYOP8Vx7qXpj1/rKNkCS2AfCevRKBslFmm1jn
 QwbpRkvsBY91ZslXWhw==
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
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127033

From: Hongxu Jia <hongxu.jia@windriver.com>

$ echo 'MACHINE = "qemux86"' >> conf/local.conf
$ bitbake thin-provisioning-tools
```
error[E0080]: index out of bounds: the length is 1 but the index is 4
--> tmp/work/core2-32-wrs-linux/thin-provisioning-tools/1.3.1/build/target/release/build/devicemapper-sys-f88f57f28cd965d2/out/dm-bindings.rs:3:8718
|
3 | ...usize] ; ["Alignment of dm_ioctl"] [:: std :: mem :: align_of :: < dm_ioctl > () - 4usize] ; ["Offset of field: dm_ioctl::version"...
|             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `_` failed here
```

Inherit siteinfo to use SITEINFO_BITS replace TUNE_FEATURES
to test 32bit BSPs

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 4fe6bf337a732e3efd2c14472a8991f0d4eefec7)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
index 4d8d2a04df..bdfadc04e8 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     git://github.com/device-mapper-utils/thin-provisioning-tools;branch=main;protocol=https;tag=v${PV} \
     file://0001-Use-portable-atomics-crate.patch \
     file://disable-cargo-metadata.patch \
-    ${@bb.utils.contains('TUNE_FEATURES', '32', \
+    ${@bb.utils.contains('SITEINFO_BITS', '32', \
         'file://dms-no-layout-check.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/devicemapper-sys-0.3.3', \
         '', d)} \
     "
@@ -19,7 +19,7 @@ SRCREV = "8b663fb4c6fb8e52ca06cea57b986c5ba45f668d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates
-inherit pkgconfig
+inherit pkgconfig siteinfo
 
 DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
 
-- 
2.53.0


