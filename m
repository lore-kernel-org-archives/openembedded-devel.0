Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54397.1795443277980391499
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=O3YHwUUI;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Aw/l3rlr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKx7n2442746
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yq+8CLj6n+Q
	Ohgc+A+wxn8denR73Qza52hiO8QZleus=; b=O3YHwUUIfHiQ4bu7YKeJtVLiukL
	+PJ1eBqTLX60P3ZScZELZ+MvqoyxNXNdpgGwkthIH7AOcvfeJrZVB0R6WWtU0VO7
	qofFeRv4ZuTqgcwZWAx1QW2FLLM53cAzn+wrwyNTqpDf5P5l50Mh/zcVyXHeILDe
	wGoIASn0tAgOuh7wR0aMcMvaAR0ey8XrQ7lKnV/k3/bDpvofq8LD4CID/CmFkeyf
	JHqTU5KYNerX6L+Ri+celPqiKN1mG95HtBKVbte2Hv4kRtcxOp+HVxbYmzlPfo+6
	kjoOYmniARnxqzOXFZXX0vVyI7ag5BubHPXGii0wIKfrvWyd+H84GYs9A0Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k1ra6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b53bfc9534so894953c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 06:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443275; x=1796048075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yq+8CLj6n+QOhgc+A+wxn8denR73Qza52hiO8QZleus=;
        b=Aw/l3rlrWA5KJuqP800B5RpuMW51t8qSUQug6+0ME0Bt5WhnhUBjmxW21b9M2qJpEi
         w8Eoz7I3ncHlv9wkeboiKGtYhM+FvNC+kGtjJpjcRxQnkumapP2ryJ+QUqap+ZQl/ebg
         BP+axBCmsYZWr5FVjhM7pz1MgU91Y1RF8mvfLZoowRIQW5OKrmqinBlfllkm6uNttnBM
         A0U+I7cbHgnYvjLxuhR62+9dAj+yGh3aGvtpeRAyzdz2Fl1EdX4WJxET3XWv/lHCVmxp
         pBxRMF2/uubb7Aed2oVDaJ3FN0POXBdtx8U3KhLnR4siUyGcIit5zZAJ5qDuvQb9kX3g
         qqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443275; x=1796048075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yq+8CLj6n+QOhgc+A+wxn8denR73Qza52hiO8QZleus=;
        b=PReXc6RxccRCTxbqdfN3IhQYh7uLtwhgpu5HZT1Ku0ie6aoP67+qzD7cjzcixDD5zS
         hlecSrL1AniGHt7jenKlE+C1K4AYEoFbzLoG5G6G5YIJIF0I/jaNIri1k804QrvwvYSv
         o+qtb9KVXolVOl+rrRrGOqi54H+TZQ7lwzD21GNsIbaCG1Q/HOkILxe0BW7fVDUd3kRs
         whsC9M5kZQo04bNbN0+eZY5aWFCrZCAEwdTMWgbGrri3yqHObHVm1ve9wui6e4Vv/H/W
         HNQJns+4SRJ898QN8R7tFhAAKuMc2d01HBmEXB29I1pc8f4VKNVxDFBmmwAf5XVMoGtu
         +A+w==
X-Gm-Message-State: APuU4Z/U/gGGZfI2Wwql4elxd/z6VgGsef8PVIpM6IL1pXUBV91tEKzn
	Rtf/bsqEqNN0A0VFM6TwzjT+PTdgjGAs6zJHAnDjb1kqIfUMpqP6MwgPC5s/3ygvK8Aq6BSYhdO
	plCfWML0o58/I3lwIHdWXJHEPRj6hu2/Ms7EmEcQnzQBu0/hMxWROY3MLQJrKEr8jhxZ7Tk6ftf
	KH2EmfgqnTorfAQowQpHo=
X-Gm-Gg: AZFdTZehTv9bFFz9UwAzGitk3xA/jg+SEZ4UpMQAsHD/CPcxGHOcK+2O6EtqwYLuajW
	j+/9qNeACGaGod09lr4tRQb214QqadVPsB+NKSmHaIGpDfR3U2iEYsv+n6hHMOG/+qoDtWI2J/a
	Y+hIBLpI4OCRtftW772MTAoQaYooL15hIGjAsLVZ4f82VBqeVif+DpLkUo8civEog8H7gy9LdsD
	t0a9V5CJ3vdQ9n3dJX51AZvSqtd408AugtEHJxxJWDRzVRkBOLwOyzzNJFB9A+L7jO97lp73hZM
	gnGvU9fL6CK73QiLRES916xIq+pQUfQdaTVPdVHXAHb3wXRG4fKRGwaYVlZHrFxO2EJzHRk07UQ
	YE4BHTU2qyrACL9xTpa+yfGzdIPyorYzrFd1S2mtw0a3XdM7kXx2MNW1imYeiJS0PJBlYftSaaL
	0mlJ2L
X-Received: by 2002:a05:701b:221b:b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1b5568de77fmr11044221c88.36.1795443275274;
        Mon, 23 Nov 2026 06:14:35 -0800 (PST)
X-Received: by 2002:a05:701b:221b:b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1b5568de77fmr11044195c88.36.1795443274354;
        Mon, 23 Nov 2026 06:14:34 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33218644c88.7.2026.11.23.06.14.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:14:34 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-oe][PATCH 4/5] pcp: Add readline-native and ncurses-native to pcp-native DEPENDS
Date: Mon, 23 Nov 2026 19:44:18 +0530
Message-ID: <20261123141419.1377088-4-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
References: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX/6IP3/BQW5/l
 lFPhAtVs5blak8RxFZBj1Dlynh7+CJRZ3mY+47Qf6nI+wBtnMebP5JqA/B1ELZqXiqFwQ06XANc
 peLlhWh5ymXSwTSezBzU4WiuGQ050MI=
X-Proofpoint-GUID: PyXwBZ2v6n5_FqYXR33tM24vyxLkdq3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfXwaNhJh+QTRKf
 jeOFLiFgN0GPgFXhA7erHCiJpNHmeda65luUjEHHrNLTunH+6Vk88bvab0WGK+E7hZxu/Hw1KYx
 nZfSDEPCH/wvr9SA0LUp2FqqG0BVEKtr8YHmXph2rY7F4wjjgP09DDKuV2Sv8EjlWFhDCh4RSD6
 VJJ7jUhJC+zOFxA3xf8RvIvghgjyLsy+npXx67cl8zWGgFd+o0hMV0YCL9pn7caVvnE2LV1PQJ6
 8XcN1Alh2cx9cOLiLZLSFRiC+sfiljfM1H4kogK6Zuo6oOOCw264MBMiShBdTxOa+Nf5TWXqYtV
 s2Vt04sO0uBRSwnF3EOIOpdW72A2ROSAbIr/ez5I4UHYQYLlCokoEkFn9O4TBr//E4q7shDYai7
 5VnilrPKD6Du0Wx3Q5Yh+ScoKGlbhLsBWR4Gm6Ajh8mzEWT5eP7Ml8gzqQwlfk/soEP9K4BcKUJ
 4jyZl8OdmMKayMG14oA==
X-Proofpoint-ORIG-GUID: PyXwBZ2v6n5_FqYXR33tM24vyxLkdq3c
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b044a4c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NHFlQX0OANvMoQo-VLIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132898
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
 meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb b/meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb
index 2f37b099b4..fc2be4bb1e 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb
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

