Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64A0C5AC67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:49:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14727.1786610838181184597
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 01:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YJ2iwth1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Y+1iXV16;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ashwin.prabhakar@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g42U1530133
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 08:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5JBb6ccLjck
	3OXd2yFfPIbavBWRg/IQyx2waEM2n7HQ=; b=YJ2iwth1d7LqPDk8fzOEss/ypql
	cHUvnkY7egPdC/mxa6/SNDoFqSbzwM+0frKZ0omKOJktwt+tg2dkfBHiV3IeT4ej
	PGpUP7PWNNAbbQvnmGeHlYUv7yEqjr6578BDsQqhdndLjIro8a8t7rc2iaKXy7QK
	MkJ0YdtZZcUE5+cZZdA56plkGQ7NOxi7vTT3FcC2tWThaMuYeSUmooQYYgXNwwid
	uOf4Z9XrXQ6fmomC6DPVxLJ4sImOXGL2OjCmwvk/yOl6pJd8+jsxT2Ga0rWtJata
	O2foQmQJa7xsmq6b/AVJEmhf83psienhWPyapuQgWc0ci18/vEMH4jma72Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143hsj43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 08:47:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so32890321cf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786610836; x=1787215636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JBb6ccLjck3OXd2yFfPIbavBWRg/IQyx2waEM2n7HQ=;
        b=Y+1iXV16+spbWpQtMlbbUObdYnWCWHKvIv5eE8oPg5KhJp+umBiRL9RG9U+YFmZ5s6
         LajxlEAv5Y1nCU1DSO5sUD13edlq2cCbKhfOxlQnL2gS5nvmRjtCGBelKcFXcTwM2Va7
         Fd5DdqxW5eH8JBK5DWKtoqOsYuAUolLHmNq/2LhUW3hGU/Vj+0nwHyFehmaHCtP4fQzh
         d5BsEOlJ72eOi3bGCMNyBDhCCTaSOJKMdcguyThwXP9kekkfv+OM0pio9i35qkf26IOP
         xitgag7qzMM0LQdvhTGUTj8zwF/sn1m5DLiOWFBTSPTC3BmOaW+oS59gieAmnxa/2X1J
         fHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610836; x=1787215636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JBb6ccLjck3OXd2yFfPIbavBWRg/IQyx2waEM2n7HQ=;
        b=ptNl2D0sw5JLKsCuDOgjl0Zi71l6hZw8BEnUesuO7CI+UvMZFp9wscuvOSUNFTqbn2
         CT4sXsEmrBRUxd7qN5OCmWgke8P7j0ywFYG2Ca8WoTqqiYa0GOD2CJkukWKM5402IBpP
         D6Z6YOXCJWbWWW3fqxk/eUHWVHxuWU0Yf/v+l6ylKc3jHCYZTH1+fOM+87NnqQrBduce
         f+zolYygWYAAiLsK/GKNonjOBk7O8AGsWMvhqd3gSkXONnWz3maWPzfEDGwM4XwdNoVX
         +P+O2I885tyz2JMtB/LXGRBu8V5fE0CKBIKZUcLbpRDF3tpz/klTpuzcQIqTblTFcCcw
         dDUg==
X-Gm-Message-State: AOJu0YzuT/MHpKpjRRmcFKgXgu3qGYFSGz6yoej82aV0Mk178GFpoUVs
	5W/rxvMQziXZdbsNcLrdMEtVrmWkPgpx2prJn0L8kK0oCNOOUxx+lOlOLe0Puz4Se38+dyLOWLJ
	3VyxeCkyhT/VIpeep7qQpUPbt6GZa+/XpPv6zkBiQXxBlHCELhJAuMgHJZVt3StHT6JJ1/q3UxE
	dD8RWFG+VpPAGFdldJ
X-Gm-Gg: AR+sD12x0U3eXVTKKWta8CNw378s1kdisUkGvheAOI+DX8CbyibkOg60s6MZv7OPpS8
	BciMPdoRBZ2QSImVOzzL9prH1wcVKBukGvJt5P9nYpUGOu83pCQCnfZIrhQA3L8STU+PQwsVxos
	jHam6QRc6jDBodZMLAFOu/zAW/5A24m9FD5FZZFuSuzNipI4K3bkgl6vxGSU5Zt1hHUa8Zbl7pp
	+4vq9Me1PKV5ZVGvtTEUB+XwuR4LoCNjiJnZUM/5ejxMG4jBnHDnlu2fiRlSI+FTgcJPIrsdWrf
	xzUK0DSSgcrpLsoxiX8SffVBWxmhHtRB+ucNJUtkhT5XvQkinihOqxTtUHB2ay7TEFJAZsEXYbz
	wKw+kWQ3eG/3iRWImRILa7+TkhcoTFzZKAz2w3m1O0QlmA6CwuCtTGhlIvnFiBwU=
X-Received: by 2002:a05:622a:986:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d73c1bc13mr43462251cf.5.1786610836439;
        Thu, 13 Aug 2026 01:47:16 -0700 (PDT)
X-Received: by 2002:a05:622a:986:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d73c1bc13mr43462011cf.5.1786610836109;
        Thu, 13 Aug 2026 01:47:16 -0700 (PDT)
Received: from qualcomm-ThinkPad-T14s-Gen-2a.wlan.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f8cddf8sm593341a12.28.2026.08.13.01.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:47:13 -0700 (PDT)
From: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: ashwin.prabhakar@oss.qualcomm.com
Subject: [PATCH v2] assimp: upgrade to latest master to fix GCC 16 build failure
Date: Thu, 13 Aug 2026 10:47:12 +0200
Message-ID: <20260813084712.1532932-1-ashwin.prabhakar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMKF1srEpQ50APyZuoa7XjhjC52wRTLa8HZy2BbUPi9Qs3JOxA@mail.gmail.com>
References: <CAMKF1srEpQ50APyZuoa7XjhjC52wRTLa8HZy2BbUPi9Qs3JOxA@mail.gmail.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7d8495 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=1Dfise4yaFfiQpOBiUcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2MCBTYWx0ZWRfX44rY1OHWHLwu
 IDielRJ/jHfvnVmt/mytVjlQC7LAhCJYnW9nDH/H6A3IKTkj3Grl5BZqk9gMLDmo5WPSrprSXgn
 SQ4cGoKEkIO2juE3x2GV5ooKLXsLYSDMmFwfRiHFDtImC+P/R+pLTo4s/bvpbo3/89GA/ktGeRu
 yY6aho9kMkyprB3YVj9TiB17+9hqa+Sg9yzWYzS/lEx27pfj8p+0E0w1u4gIXRt1HVtmvbdb292
 M5EfYpcr+4cxC2fVGW7Zt3r2N0q0XAUKb62O7yLwGhkbaXdaWPWrO1TVUhK5Vfxjxae2lLxa8nl
 Mc/mwei8hvTqJ/ibolgl6cS07hQ/Q3iFmH1Ha1vELBIoUb0Lj7wyRkgHoJfmdJqsflizk/aVqf4
 3M5v6kGWMlSEni1IjtA+C8QkmQzIn2dlwAMKHZdjxUKBYSStBF3T5Fw00oEwFTn0YUGS1dPCrl/
 kpX20oga2AwXAu+7JGA==
X-Proofpoint-GUID: aLX-vmF5DLmgtDhUi3NIopgmqQYIvWjm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2MCBTYWx0ZWRfX7Lu5wthjaR0q
 WQG7dnI4LX+rbATTwbXf9kaxNgvIy3ypMR4ZI15PBGtsMefiSOu2VPcfuIUNOse3+VfMKmqsLdX
 dA/RVY3KVFbp82DPIaZdRfhrIJPtYuc=
X-Proofpoint-ORIG-GUID: aLX-vmF5DLmgtDhUi3NIopgmqQYIvWjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130060
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 08:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128937

Update SRCREV to include upstream commit 3edb90201 ("Fix two compiler
warnings (#6669)") which removes an unused variable 'qu' in
MS3DLoader.cpp that triggers -Werror=unused-but-set-variable with
GCC 16. Also drop -DASSIMP_WARNINGS_AS_ERRORS=OFF as it is no longer
needed with the source fix in place.

Signed-off-by: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/assimp/assimp_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_git.bb
index 4cf2d1f787..b2d7a573de 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "git://github.com/assimp/assimp.git;protocol=https;branch=master"
 
-SRCREV = "1962da5ac484434524e7a25d566046edd932f901"
+SRCREV = "fe1965b3e73f7c241265e8e5b3015764936a6ce5"
 
 PV = "5.x+git${SRCPV}"
 
@@ -20,7 +20,6 @@ inherit cmake
 EXTRA_OECMAKE = "\
     -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
     -DASSIMP_BUILD_TESTS=OFF \
-    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
     -DASSIMP_LIB_INSTALL_DIR=${baselib} \
     -DCMAKE_INSTALL_PREFIX=${prefix} \
     -DCMAKE_INSTALL_LIBDIR=${baselib} \
-- 
2.43.0


