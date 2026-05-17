Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B395ACD4F4A
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20217.1779006275110534074
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oAV86Vp2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=H8VKi+wK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5J1Y32566446
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O6ZRleDo7zx
	1zFwVb/EUkU57f2AdnD4ZKOOnGxxaKgQ=; b=oAV86Vp2DnzeV653WNiWmsTjE7/
	VllD/Jf/0NIvnstvoy5yz90PSr9VFWNpem9cgIBHoCnaphgfOBnIpKfrsL/PAzE0
	+JbcYBa3Km9B6mTrQ5MiWPRVaSibGCV08YVMCeu1QgFDTtaFszHc2VyeMgBlxYJM
	HTJyaIOsr2jDTvSzHfUw5r7dK3A/i+4Av5e5RbJAN5cp2k2unXfZwHKVO9gQdte+
	/I5Xm3FfZniAHOOM3bGuRrcey6zOENCTS8t+WltjrWqqtfrDwccwh8+q6s1vbaED
	5uPH+StV8dSkRIEU1sawMky1jlVZqUBJOimpylW98uRX4k/8btqhfRH3scA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqtg4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so827537a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006273; x=1779611073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6ZRleDo7zx1zFwVb/EUkU57f2AdnD4ZKOOnGxxaKgQ=;
        b=H8VKi+wKTxG2cMy09dqVqcvQD5vHfd3A3vMdelC9K4PoTi/1i2i4qIVbrhZIoC1nZx
         tn8D8jAtZcwFDTDZkvBwGOVDHDRTW0mkZEbD92ALlA9hCrt24Zu+nqF3XgY5rHsNVS1b
         A9xOS9w64dMnIRgTRKvBH2np7lFy0HY1incEeID+eK0NYp52eDEC2SKndswN22iBUMbk
         wbcOlHBhNaqydhaVuoMAFYym61eyD7pvjAxWtEb/zdEX88uZzAukhz/1l1Ip6ChV0RWV
         rpYdo8KVqJSYH75OpF9agmGNlpLXhusTyydBh2hDxal9JtnznBiu8XxZ9h8r1oxuFTqq
         MK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006273; x=1779611073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O6ZRleDo7zx1zFwVb/EUkU57f2AdnD4ZKOOnGxxaKgQ=;
        b=owZdDiir+q/tJihr3wPKpmNysNIkuD7s+Gsu2GsGhXC9+6y9DKmbkUjIdAISKLjJqd
         BBCtSSFB7kh7Rxv47BHVfIkuhsPxMJI0VC9NcPnNZDAch+Lv9hkOlxkEFO67fzQsnd1S
         mnmsI3GOr8/e2j4uzJr91n5bBnp3NTljCgq2Qf8pfsgpHLNMVOxZaTW5Vs/YHs/7o/xx
         wts133ESByVF4apDCCo9GiGuQSgbKUhvTifKEXJPziJf+TVcVD7UZYjO8Eliw1Zz2C27
         pGyEoPPWj2XBlqujj1v5FBrGmR0wAiCNbeT62c9PUWqKG3p4JbY9H4u13MTLwz8JBlSD
         8JRQ==
X-Gm-Message-State: AOJu0Yy2csvjOo//RCyitWBPqtTA1Qe7RE0sdoNl96CBfxTXVnGcurYH
	jFy/6kfrOZyBNmipmGdBYEJqbFvXgsvbP1ichYtlaKbAd0nzlf8rFyGvMCYOmB0Su3vgc7wA010
	CfkLPtzx6wU27QUx3Au+FxNuP+/w3D1QYA/Ko6E0nYs0eRpewRCHW0PbV4zm73MZfZFHa/OmXhr
	v+HlvXgu23dwvkhCtQvIWkyA==
X-Gm-Gg: Acq92OE01BFxP56Ja41gES4vBddpqMstC/D8L2CYVEpAh4y7xXJeDBmHA67GAnl81Lb
	yySYrxBHmuonbOmT+tmrirz0eSW7U08W3MgQk4lyjo2dT2rij+Z6Njol51kqYTlrx5RtJy1Jxeh
	iz0OexoSMidgNIlNln/HnKuULbGp4vQ/cI3RBzj1OzmKzlo0EQwzWLt54wRGSKS4kgq+0wIBaBc
	DbVJa2zQXeOfe/QZO2GQluwsHPR35TasGQozmnSwdyODFzKTSPnRS1XS4asylwX7YiigrQiePT9
	Ojw39kn7EFofe1ErCP2gWptlPwEXiUZ+DlEmOEoAb9sPFg7HaHx6eHUsXU9ONB5IsUzv/rV7L9M
	Tqtm/1sq6y+RnK5cHuNJnPS92E3k/CG8BhCtZ5iuZcTl1NfQY2X+I
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36951ca51ecmr10874920a91.19.1779006272930;
        Sun, 17 May 2026 01:24:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36951ca51ecmr10874910a91.19.1779006272430;
        Sun, 17 May 2026 01:24:32 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:32 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 22/29] valkey: upgrade 9.0.3 -> 9.0.4
Date: Sun, 17 May 2026 13:49:50 +0530
Message-ID: <bb9e2765f78d8710b1c703c520ff37f11cd34e4b.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w1uos_RIZ2LMzC8R_av2TR5bBbpHS5u0
X-Proofpoint-ORIG-GUID: w1uos_RIZ2LMzC8R_av2TR5bBbpHS5u0
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a097b42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=kFum3Rcb3WsNiuCoE4wA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX0S9z4oA2mIhC
 AHyq/boNmhykPCfN0oSlaXFy7qF0tXGYnn1y/E4pUS91J78hBvq3HHvU2NxsEXU2H1KFK2Yowfk
 ccXq5B+6G4/8XVm5lilWQEjsz890h29+IMW4TLT5dFID9QAoYyqPkFWdNKyRiUT47Z6U1mY6/FV
 wdzSHnBW7NuAvdhwbT+lcrsQ/lbssd3IaCf0IveKXidBWlCNsciyrNerWcWQIuTPr0G6LSw6viS
 VHIT5c2MCEuVVJ7iIxpv6+XN8DIULyOlWxY7ehqM2ULopI6ePHgDqhYfHkPdKfKkpoO5I1+c7Kz
 R3OJIaDy1FdqVeG/0ikLcu7As3SSRvq0yKzKUM4O8zMCOobaMncNufjlzO8ky8zLn4Qc+RyPc53
 YF4+c2Qtjq9e5fyv/LyLVbesMHfcVLN14I0vDlWMcuTBk8dZntTqaub57GYztSVSV5Xznt5XyHc
 Camsx2M8ftyVIDQcBvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127035

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
(CVE-2026-23479) Use-After-Free in unblock client flow
(CVE-2026-25243) Invalid Memory Access in RESTORE command
(CVE-2026-23631) Use-after-free when full sync occurs during a yielding Lua/function execution

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit d47ea6487bec792fc3eb01909e4426cb610f22d7)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../valkey/{valkey_9.0.3.bb => valkey_9.0.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.3.bb => valkey_9.0.4.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.3.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.3.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
index 1842befdee..93e37a922a 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.3.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "6e63ad9ccdceea562a6ea9ea9df9160c0d1109d6"
+SRCREV = "1cbee84ba69b54c3510597965fc4320ce716a6f4"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.53.0


