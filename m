Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CB8C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:05:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30869.1787688320757968836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TvkD8bSo;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=g0cBA6kf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PICeSY2738707
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 20:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bbhl+uEqE4Bbokc/Hd3apq8mLBbop+CSaNE
	4B2LDhWc=; b=TvkD8bSoI1HENvEgZ8KpNIkP65HGjJl6wkK7t0Hd++ooUEJdrMV
	tClXSaiWakKeJReU5uYGaw0dcI2+Yldu5xTEwuvhY3asxeRpwa0KcmC6XZ0H8jc5
	PuWy03DIk4scy+5m8P3S6Jkw1XYrXqJC4bzuptEBaHFGEj0IRsXRNSuRuwqlzRwe
	FTB5WxkttET5OEwnIC+G3H1hl7IatUjlqa16k0r7aziTZqJWwNKp471zBFycR4Q/
	OPWqDLhdyD/EbaybaHZNEptldXJwin3gV3LslhBI9l1uoJAHnyu5SlxeNx+ihAEv
	6lMagNoyJYxdGFok8+bAfVll0LBH8S7DVVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mrc73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 20:05:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fed0652bso3263445ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 13:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787688318; x=1788293118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bbhl+uEqE4Bbokc/Hd3apq8mLBbop+CSaNE4B2LDhWc=;
        b=g0cBA6kfx4fISi9WLsLi1gxcQqhFiWYNuaz/Y03WlMN4Zn94IIziDbJnramz08Y2Mx
         yDog1NaFCvXJ7bRZw9kaoBiEOJuDMoaV4wh8DX7FtdV0twRqjxdGzdnHGsOlrbf+VqUB
         2jeux8ZRamk5nBwPRyG1cUwtjpGpNJH2JRLw+uVcbvSbWlM6AM9KYjL+fcVahIevqCRU
         9IWcPik7mB8YYv/9lAKn0BiJ+upMVvmFdmWR+qHg9jGdpzCtvJhk5dvb8dkQcH+Idmsh
         9AqQZ0YGPcYyHxAsKvH/4SBEnaTQjh+xR/QHeJzSVuIuHxMLKFeNX4vOG2A08v7zvPxk
         d20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787688318; x=1788293118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bbhl+uEqE4Bbokc/Hd3apq8mLBbop+CSaNE4B2LDhWc=;
        b=XzH5CI4m+k6Et4U8EpsTIxFWYIWt8EboCE8ehv9D7TfI+fQKHcqBTE/+A6PzAXTrJg
         GW9KPotaU09pYAbctxPfHxqdIcnRxdAEe4ZPEfdXoIh6YdNHNheSgO5DaidGqWLvqtfb
         1CzxWuq/Ui+tU+qTwyLe40BySbI4dr8zYYFHGKJN8rulCxeBqkdEmChOkysrUlaRJQoF
         sbnzApvOO9dqZUAVth96cSR9wrYPrIUzi39/DHQXhGDJ8JSgp7PIOEi2663NisFXM5HO
         atmW1HUf+iiYxtQnBYPcPL1/80qM+/Fq4CuuEoprFEgFpfcYq/CDbbIkhmErLyY0NZDV
         M7kw==
X-Gm-Message-State: AFuF++mVkUvhGyVNIPNhoJVeQg0BK/yINTXHLowFhjVc0yXPxTcU7EKy
	xOViR05oLClHF3mdCeznbPXc58Bxp6yc8bdRmmPQxlQwwLKIa0uh8uB8h7C0XWVZw8pQ2Dtd5yR
	o4nC1OO4dB1WUHhLKypOFELGoe2kFxvRlQjsaONscop17b4rUd7VySlQJ3egnuL/YLMx8hCB+DN
	dlABXSRppRZJUNffyIAbQ=
X-Gm-Gg: AR+sD13LfBbXmPOHEgVeOTM29DcWkbjSaufjAjwsjDELhYi131tbJJdExwudVE2YsQg
	J7NiNHuW21ofUw2Mh4nBv9QcHSDXsoMX2H+qmb99U9dmWNBWGz2F+hR76am+rdKV6yJls8ylNpT
	nhmTrOHAiZgQEO0JHlPikb8G0pJUN0SyUNgSIiATs/25kUPKpVKOswrI/XjUa1hOFK94KOkGEhB
	o6eLfoys8kVtExZFeGuNelNMA9d5BR7z1rJnVJxdk9MKJnKR0jCP/YQvC2FqTTNSmFd1zsg9lQy
	t83RqwG3o6vJU396EN7Cq8Vm6yOl5BHuyTVeFiNIuWWxPWbcxqur7hJJvco4AVOTx61O6yIAwaw
	QpKgeHBXEsHtnNO6yxJl3t4z2+7cl6upNlabIAir9eII7vV8YDXmrUGJn+uV43xUiKTB21FuA0p
	Yi/u3BWnHonHexr4s+1+fU8/zSZ2QPRCztEzfl3pc=
X-Received: by 2002:a05:6a21:730e:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3cf83c17b2bmr1788556637.12.1787688318036;
        Tue, 25 Aug 2026 13:05:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:730e:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3cf83c17b2bmr1788451637.12.1787688317491;
        Tue, 25 Aug 2026 13:05:17 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1bec83527sm112501a12.26.2026.08.25.13.05.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 13:05:16 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: fix the install prefix
Date: Tue, 25 Aug 2026 20:05:15 +0000
Message-ID: <20260825200515.1831303-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE3MSBTYWx0ZWRfXwjcFnV/SNbC/
 gbwC+ew/IwRZ8aoOTKCEYpexJqGy1pzlKTHP4Ruxlcb9AF4oRsx/DIHzVRtjTFUKO3LssLSNUVu
 gXDRRTBnQUphj4Es+2XyaHVpJaVu61k=
X-Proofpoint-ORIG-GUID: JCxeh_MWkex2spqFEz6EYVeKDmun2REp
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8df57f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DTc3mt1XSLuoO12XzmEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE3MSBTYWx0ZWRfX2x9qz2xg9/47
 CRu6pK/MKCIBHekvSGf30o2kgihmRTTQi6sKkZ+sSDPd59HKMZYZC/UXuc4H9BT7heLXY4Tdsqd
 BEwGtgxvN3M1Fk7/jeSy8bF9nc4lHq2ABMb7fjmTYkTrY6+gpefjoOZdZ32nbHNittE99UeJNb2
 WXg6KKsn/98EUOtPN7n42PSF1D/H+GBKax/HOsfvX9hsOa2D+hhXvHDmsBgwYRP4kRTYjS+BxlO
 rovpLQqy5UzGKl1DAdBmT4MIUvK7F/6jldy7kkFQgvoaQslVrQ0vukY8kAlyR1oVUBOaM4jpwV1
 oboZb3qd1Nz4y6By0fSCSqQsCDghgsBf6xlCXZQ95RInlnHbnBDKxMQnRyUGYnzhcMHwFMQlp4C
 eWuLuddnJx9enzIRMAsR0AxRR7PqNG65pivU/nWQaJrhx91Z/psACLCK/OakeeEsm55aBUSsPy7
 gXwIdHzk9MerHo3l5Nw==
X-Proofpoint-GUID: JCxeh_MWkex2spqFEz6EYVeKDmun2REp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250171
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 20:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129474

redis 8.10.0 added "deploy: PREFIX ?= /usr/local" to the top level
Makefile. Assigning PREFIX there, even for an unrelated target, clears
the export flag it inherited from the environment, so recipe shells no
longer see it. As the install target recurses with "$(MAKE) -C src
install" from a recipe shell, the sub-make falls back to src/Makefile's
"PREFIX?=/usr/local" and installs outside ${D}:

  install: cannot create regular file '/usr/local/bin/redis-server': Permission denied
  make[1]: *** [Makefile:576: install] Error 1

Releases up to 8.8.1 had no PREFIX assignment there, so the exported
value propagated. Pass PREFIX on the make command line instead, which
is propagated to sub-makes.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta-oe/recipes-extended/redis/redis_8.10.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis_8.10.1.bb b/meta-oe/recipes-extended/redis/redis_8.10.1.bb
index 7c017e9579..d0220d228b 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.1.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.1.bb
@@ -65,8 +65,7 @@ do_compile() {
 }
 
 do_install() {
-    export PREFIX=${D}/${prefix}
-    oe_runmake install
+    oe_runmake install PREFIX=${D}${prefix}
     install -d ${D}/${sysconfdir}/redis
     install -m 0644 ${UNPACKDIR}/redis.conf ${D}/${sysconfdir}/redis/redis.conf
     install -d ${D}/${sysconfdir}/init.d
-- 
2.43.0


