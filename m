Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAECEE36B7
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:44:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68362.1770975860700473160
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 01:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=djCmBUzy;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fMcU6jex;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D9fIwr3027114
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 09:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fiBro8nxt07bPQywRHZlboB0HoTNfrDu/4k
	XVmWaSHg=; b=djCmBUzy3owjfQT8nfY9MWcS62+I7rjAqNOjOZkkjl64rZXLABJ
	9mwwR4Cdqi4a1NHktWyjzWWxHOKWp2aecxUt9X3oz40SveYaq89T9HwXOx+Rwipr
	PciUv3yizzcR7Wxvy/egy9ufqLVRSYPV3HwiP6MsEhJvqPj2UodWKFlM6G0YUCDl
	u0/ou9oVZOHUfBhWyJIoLLntXlzpfYQ4Uh25OnZLw96+YcRPGlzffNU3EZ5Yz6bM
	7HW8QVJsKl3SIksXoivGXiGTauJzlsBG2KEnJQUYN43Wco+D3PHOiNcK2HLjmiiv
	COfmTJzZzswILIMdEmPWfAQu9sA1oV9u9Xg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca1hn00ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 09:44:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71655aa11so358443285a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 01:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770975859; x=1771580659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fiBro8nxt07bPQywRHZlboB0HoTNfrDu/4kXVmWaSHg=;
        b=fMcU6jexOwBtF526quRZM/1Q/VaUPXCipmrVlDrzTlPPGpMRAZ4zm+63VVEZOUjzMD
         IavnXuaEQenu2AWQlqQxRr1hKM3qrd28Y/IiiBzoQd9/UiopRkXAillDvH+1BgtNNua/
         S+16RbGGAEkOZs+S5vl2+PnGje9YViPTnuG4VQOfWMaO3heGBS1eBfyFiennRMuyfHWL
         E/kZxHg7QDQEVMOs7pUQRgu5sWIlb4L5Hy84kmKSoeKfaX1bUP2i7ZK+9WDsmFqna4B5
         ZjY/+QcIrL7NoZdOR39W2lcjJSDSTYhxSTjk80E5oLdBSOSrMsXuupBQh2nhl1sgDxU1
         UUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770975859; x=1771580659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiBro8nxt07bPQywRHZlboB0HoTNfrDu/4kXVmWaSHg=;
        b=NidXlJ9s8L6n12ex+foQQvL8BTr/FstEkPYJ/8nYyf0eXsaBC02Zp64edWEpv8Idqz
         iLq5WZLrZT3ZacjlYZ0pe+7PRTsORhfrhvpEKIxvAUhDaOYlTipQDM33FsNULrcLOrN7
         Z4gn2hxCr0hgsdIUQlITshLc+MQF+Bp+pHTb4Doev1tAml2b6T2qcQYYE4GqD/18SJi0
         5afNajL3hn2enymb6X01hgcyKFPlZfuPmkAD0tbRQgR1jlPkO04dIFn3UZp5mg00asWr
         IOBbGFAGfKsco2OxKF47GgWzcENOiIytepjEp8oTw9W8cOUYE8qF08YuIo+WPCLm5TeQ
         +mUg==
X-Gm-Message-State: AOJu0YyZQLVp6G+bbCMZ0/g8NLEF1sSYWD3fLo+HE+D3NWmrhCqXSFRO
	BOVILH5ezrOgoY0TAE/cykksBxPmg30qsS1yOJ/Qs8Cy8+dLcPwpGcHXJawlkoLJNuQwhwRbJ8D
	cjlXCxNCmiUzfJ4W/kYl2zblX0xPojBP3BguJVJgmL82uRqToNA+GEhNibSN4qKyPgRRoy2PCBb
	W2hy0nv4LvV03I4sfM
X-Gm-Gg: AZuq6aK6HoR383YALfUWqyOgorlxZtJ2Qh1FKMJ0vidq+8xLkv4VNYeNfyn4i0pF4zz
	oNl64Bjo//y2RNR91wMyuzm/G/YiP+UFHzXKlpx3WoaA0CMhdcf1cgUVSwi1IvF9mbuyFbeNrVY
	ja3xnNfc/U+YLF+liuMyU8DExtQYn/WzyymjaNfdf6YkKSp4Vk/4R66XQ7g30RDHpyqNl5uESVp
	jBCK0BjSS9FohBIy4j5amKiu7WBwmFsAdVl6N3eqxN0q38c8jOdWdxNGrxYKKUoFqIZ2VA3d7eV
	T/yWphus937EpJTW/5Y+RywyEdxLtEKaZgBqRcQ0GqJ+yeGkdHWIq2ckzTm539v4LmB4nlgUfpP
	35rmkZ5lTZx+oEg5lm4r145HE6qWNnkYvztXucr1gO+DwmAQub9aSFoifUYfOnLytzaWkfQPXkW
	0brrV9BQra4q0bSWOBOD+RUVZQZPuUsCiOtoc=
X-Received: by 2002:a05:620a:40c2:b0:8cb:313f:5ce9 with SMTP id af79cd13be357-8cb4249217amr126427285a.81.1770975858746;
        Fri, 13 Feb 2026 01:44:18 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:8cb:313f:5ce9 with SMTP id af79cd13be357-8cb4249217amr126424685a.81.1770975858190;
        Fri, 13 Feb 2026 01:44:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5acb0esm1435563e87.67.2026.02.13.01.44.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 01:44:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] vk-gl-cts: ensure that the SRCREV is correct
Date: Fri, 13 Feb 2026 11:44:15 +0200
Message-ID: <20260213094416.88437-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wt0m8Nfv c=1 sm=1 tr=0 ts=698ef273 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=vJFsDkwi2ydU_hCt76AA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: V4ifpFvTJ0qDy0bzGYK52fSX006wkTC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3MyBTYWx0ZWRfX+ycwvksx8uTa
 kImW4vUxXf3OP80lD94SUuJMfy0IPBsagvqRSvNQtadp4SfZjWBzeJJXNOB0sW8d8fmyFkblYq7
 b0bQDMW85QYy99D7+Odc4u/4FnaM9Cw0cLbN/hQvDJGy/jOGPw54IC16ikPk1PQSKK47gjahQxt
 9de11VVE8mLetShQbhuOLOWKmeVGapoyO/QYpck0Xi5IPt+IU/YfxDJeZBKo6mCwQs5N+n2NYRs
 xOxuUEGnzvmMHMlXUqOgscsgozoj+VJrya9d0HZfbe+c0ZPBJZV3DJn2QqL400XReoEd6GI7md1
 VIET0geRmszPZyNVCxoaSuhkaIQ5RxC9vQmeBlpnvRw2LqIXbUs0+ha9TbA1wgyt0DXYzQUjAlW
 MNl1wz8o2l6DOe4OPtHr/w34gKKYFi4NJep5s4R0R8C9ODLSMrHQdmS4ZDLfzZFlqdlTNRcl8Sp
 Z19JBQGZqMyxT5H64wA==
X-Proofpoint-GUID: V4ifpFvTJ0qDy0bzGYK52fSX006wkTC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 09:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124379

Use tag=${BPN}-${PV} in SRC_URI in order to ensure that the SRCREV is
correctly updated together with the package version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 67a0dc564c22..d6484ecba0d8 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -1,7 +1,7 @@
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
+SRC_URI = "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1;tag=${BPN}-${PV} \
            file://0001-use-library-sonames-for-linking.patch \
            file://generate-srcuri.py \
            "
-- 
2.47.3


