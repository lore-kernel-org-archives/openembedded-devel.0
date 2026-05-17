Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8177FCD37AC
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20206.1779006279419436872
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nWaBCCaP;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UzmwfoyV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GJSl7u1485026
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+cb8B+yY+SY
	I/zzUlyreUXsCWETbhkqfUsh3B/VEIzE=; b=nWaBCCaPrQvKeviVRycDOflc/0Q
	y0XPqKXtDUMuelOMN2ae9SjybudTfDkm9s0NsDo5PWoNJOkR0DwbhU60XNHc0KPp
	dJXOrnmBxHbEROmVoXLYrHmKSOUUFZaBbDM7nbFPDh5Fu0wLIWcDMYs7cRWAgodC
	+nJILgcEv619/jFdKyXIg3eJnbs0agsYDQlqW1rpkeTFT4uUyrHZL6Z919JgIjX+
	VN0qU7jI/DsvB5i8v1LktggOTv5t3mQyy1vE3Z6LRslEniB0W2rc9SUIZ9FTJ9yg
	aXtOYhkeVeAIgYKru31b9ng2CLSwK2XcOD1kR9dIdJxHTNdZFgERzlbHaSA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw2g1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3662668b825so2491382a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006277; x=1779611077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cb8B+yY+SYI/zzUlyreUXsCWETbhkqfUsh3B/VEIzE=;
        b=UzmwfoyVl7JQdaIdrjf6aL25n5n7YKLmLzmekSCTkBPBkm41KTeddWWbONK+AX/Wjk
         Hx9apHUnwHXHOgCFB9KHFOE9QA3YDUizxkRaUgUro4lhxZdaO+5Re2MdRmbAPlWsSMFK
         RITL4xyBlyKrpq/dTPVXhXLekTImtsq23HykrBkD9Z6cXJqS2rueOcy/aVmTyxKHVASD
         FLtvFyY8kam7FLMeAElylL/EZewFgwbBr//Zt4h0r8Ag+9n+KqF2Qv5tOCv/CDautlf8
         G8ffNOGgVrahd8SU/3Uu053sXqa49hkzXFVwIrkEq1/yLWeAEZGrNKQybA4N1AQ0Rcqy
         63Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006277; x=1779611077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+cb8B+yY+SYI/zzUlyreUXsCWETbhkqfUsh3B/VEIzE=;
        b=FIMcITYoUIw9DDwZvi4IquwNFH5KqePYz0WpSVE7MCttLwNbQYgrQPRmOMRIIQhp5J
         lh8HL5cZhL75go2nx3ITMU+4brlGJCg+guK8Siku6n5kZPHDgBXrVyM/AjFCQyMQIly8
         Ah8EY3jtL3s48XxRVMWExp0YgIoJH/T0b8AHCjC4D5GOu8FMVHuGxgIzidDThoLpU0UO
         LTK7TR9pZREbnTOdxoaxNvzNywSAtdEBQZJbKYvjucySY069cWdNzcPquan8DsaRRPGW
         RtRW21cKaDqCuiS6uJi/1rhWvoT9ZgFuvEHESGbh28sb1uTmsaFVOchR23lRMI2k3TGe
         m2Ug==
X-Gm-Message-State: AOJu0YzJgahHA2aOdOB//fosukCvmt9iYTPrA2nJfi4/TrGvnwe0+v1a
	bEQiBJ0dlkuxc7fsAJqec2sqEKQ9nmkpULTtPd30gvPBieAiWwixnIaKcD0vNIEv2n0Y5zfAKin
	X61AQzKKQC1uhKVHGarjQDSBo2VWEV7tkV9AFd18ef+/Y+WaPKzVCoDlRa2Sh0f1RbLy3noP17+
	NF0VTSly+Rr33sY6nPTcOSdA==
X-Gm-Gg: Acq92OGVD3w4cwp09++zeUPgJYi5++AJ7FHqcba3e0flWWRKEc4kFFo6IsVcAURPXT1
	zuwrvO8HKDJcmR5Las5Fg2qrBphq80EzyR3NhvXcNlpQ3C3A2ZFv6TWDnR88HdB8NAxo1HUz+Wk
	3SAcL0LMKt++H27uuM5+7oCGZjehmzjg/hV2ZdIuCcAiHD/nhWJlhKyy61ocyRftPKvA+4CHLz+
	6CRtdQqBfQJU/NRuN3oqXSVz69ztK9dYPrv+rljA2wGm1808v1cugQJ0u6Z2gyF6CoZhGSc/MDZ
	s7yVP96FJw7XVoIlo3C0voK/ul+DHeH8PvjnDteIlnewB/Oaz1e5M0cPFU14COVIdij41L5nHPW
	34BlhvGs9BTxeJAMcE/cld4BiSyMMNudZOS+QEYA8pQbytx8RhxGS
X-Received: by 2002:a17:90b:4a87:b0:369:d22:4788 with SMTP id 98e67ed59e1d1-36951dc3ebemr10863728a91.25.1779006277516;
        Sun, 17 May 2026 01:24:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4a87:b0:369:d22:4788 with SMTP id 98e67ed59e1d1-36951dc3ebemr10863708a91.25.1779006277088;
        Sun, 17 May 2026 01:24:37 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:36 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-xfce][PATCH 25/29] orage: upgrade 4.20.2 -> 4.20.3
Date: Sun, 17 May 2026 13:49:53 +0530
Message-ID: <f32370958cda3ee46f7a8297e5491aa5fb9904cd.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX/tQ7uEZHnhUg
 jaeI7srMF4SOyck9AgTJ0Mob+SE65nPePQebHcyymWb2KnLhsh76nSwc26aqLSgc4hL3nOvbvPn
 UGIt4JNJP4Ucd+sd0B+Q146COQ/4hUunbo000GW71ZL+j8Xt64KfU8hdlopzeVySPGDqT6fVRLU
 J/YfnG8moWIkgpnHle6lZjk2BTTibhGJm+yAqL7Dj/DaUf4Ii9KRoVtrUF/a26lESDuMmZ3PxgB
 A19zYPM6wCghMgrcWmOXNVmgLZoANyq2mJDhDY10iTwmMo0GxiMJMybx/1l9OPik3ZwfdoCiSRj
 iuYGdhzLltLt74hWZVEHAcK4niQNTJ/m22rvYs00ElJKlA5S8yRjgIlxOcUFnJtv2DWcdN9xrUo
 PmmMdNyZtgn7+nsqY8eu6Pmpv+pl92bGU8sX1uhlD753oEXOMEuGZSq2zQT0oScudnr7DqWQkTm
 TkreJW5GcrKzK7rRFCQ==
X-Proofpoint-GUID: vfqJ4Hm-awKSfx6SG5hGoCCsA2zCOIzI
X-Proofpoint-ORIG-GUID: vfqJ4Hm-awKSfx6SG5hGoCCsA2zCOIzI
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a097b46 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=mIgUWLL_XJ5sh9hTMbcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
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
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127038

From: Jason Schonberg <schonm@gmail.com>

- Fixed use-after-free in sound command execution (Issues #47 and #48).

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3bdbc82938282afc6d49c3bf25beb2d0db073b6c)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../recipes-apps/orage/{orage_4.20.2.bb => orage_4.20.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/orage/{orage_4.20.2.bb => orage_4.20.3.bb} (88%)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.20.2.bb b/meta-xfce/recipes-apps/orage/orage_4.20.3.bb
similarity index 88%
rename from meta-xfce/recipes-apps/orage/orage_4.20.2.bb
rename to meta-xfce/recipes-apps/orage/orage_4.20.3.bb
index 461e471146..d3727f25df 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.20.2.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.20.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app mime-xdg
 
-SRC_URI[sha256sum] = "6bfd3da084c2977fb5cee26c8e94bf55e358da8e86dd2a83c6fa9174f24672a1"
+SRC_URI[sha256sum] = "d9f6a3bcd1fdcd83d8277bc1996684a02d06ef60492b69c2404815f3314d640e"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.53.0


