Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B81CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 01:44:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.3793.1758159897376791236
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 18:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Vrt5bAXL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HIar5w018840
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bSDy60kAbSk
	y5z7mUE5fleyzxHeRK+U/26O88CPgLD0=; b=Vrt5bAXLfWmq7fDXdmlaY2Pnj/5
	dv5dqAXqDx7S+EyqWatsIIp+GxZNlAnqnyAvFp2UU1m3RIw5XaSOWcjQfvzcl/IU
	6dnD9lRbIQOMfy+XUSPSaaVcGHErV81TYHgTR7UXfI2NnXLEoeWZBZmWaxPWt3on
	/Kt9ef8E6DnMq+xQAORcr4tm1zKOM6S8wKIDq9XrzjvCgHFeZGnVcdtS4fOM9tcF
	3979vVpFGsXrZXRjXrjK0n0EwCONdyNWcatcZ/Q+wG+tvdskWovfw6DmfDKtZbra
	JsLisp5O4LPe7RNfVz3VfCJmGSQWFDlyA9XE5btjnlbIoTRel6HzzCR2mxQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982de90ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b78fb758e9so8063021cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 18:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159895; x=1758764695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSDy60kAbSky5z7mUE5fleyzxHeRK+U/26O88CPgLD0=;
        b=JaheJ5QT5PyOPczbHKUJPeN33+iE/LT1UTydOsLG5Z279ZPIGBoLMf/xS6RdjtD+yu
         Iu8gZyjma7bC4hAl6TqrwadaPQWshqVdhzgEtLh/2ayA/HPyleB7XtEQsGAsT5LxQvts
         haFAAW68KLmYjNvwgweR0kzyug4UAiyEhG7XQAgzg4IdlLtwGc0Bg/DCq2Z2ndFS0h5r
         B3u39Ptu7rn1CnLnQ62UzxITfx/OrQYsCD0zlqo5zIYNuactUuLygPLq5dUJ/zeke1CF
         9vgnOgZ+CSX0yjPTEgjOaLGp0IW/B6n0lpB9EW2I5aBENShNbOT1pC+d/ICC3pbMQKbD
         dEgw==
X-Gm-Message-State: AOJu0Ywh9f2A27YxWjiPzVDzX8Dux/Lvw+cl/9S6MKJr9kf3qCgVAbWu
	8kg3un27vRvx81t0HQ5tYBa29oMcpizBr9ctcNVO80eP/oEUUKGSL5DxAPQsMcF7bivx4HH2BAo
	rHrKUMQ+YypNzpF4rYhAdHLQCByDnDVeq3B4JYthobpxiCQbZ5MAoikCOnSeW6r242HnbooQ8Zl
	NJaQqlJENXToA5Tc6H
X-Gm-Gg: ASbGncuFlXLoeUSsyAiMj3nCvXn4RImBevSwzsP8tr/lOjfmLQxt0Q5E+9T/4ttA6P3
	X4ypg2OKxQuZQp0/CP4PBR+UAJesAjxtbpTgKavA2hp9qKpMM95OD6ZXk48lvU7PhbDNwXzUvEV
	j535Ih0fzPKYaEdGlrasCVQ0zXptA9lF652lbOCux7dnWIRDedbYWBH2+5GvBP9dAnpcBIPgP88
	AXPj0uNbZsc9bMRIpbPwNPiU6AYkGJjJ4tRItRPKL7+u7OabTR2io6eod0CJMi975rYX0QfIbYo
	f+qGSOUmkOS/VvwAfJWiNGTZXbCjzUl7lUWwoHWJMuA9DbLoX+PJXujsamJoWV0q9l9QHEHScnU
	jXLhucSQiF4BCWGYYldBjs1Qz/cRUHVgGJGKp55QVbTg8kTs+ZGNJ
X-Received: by 2002:ac8:7c50:0:b0:4b3:e964:7872 with SMTP id d75a77b69052e-4bdab340f3emr20746361cf.16.1758159895290;
        Wed, 17 Sep 2025 18:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzyhkmajUiJQaPrH3WBvlnCnZ2CbksFQ1I28LunLCXeEE0rG/F1T/1Y0cktG/a10YbjUOovQ==
X-Received: by 2002:ac8:7c50:0:b0:4b3:e964:7872 with SMTP id d75a77b69052e-4bdab340f3emr20746191cf.16.1758159894822;
        Wed, 17 Sep 2025 18:44:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa577704sm2283341fa.70.2025.09.17.18.44.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:44:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 4/6] freerdp3: depend on virtual/libopencl1 instead of opencl-icd-loader
Date: Thu, 18 Sep 2025 04:44:40 +0300
Message-ID: <20250918014442.1436475-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cb6418 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=H5bU8IAR3BcYu3vuae4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: wqsmZt4jXOSRCQkAM3WOWYFIl9a1CayA
X-Proofpoint-ORIG-GUID: wqsmZt4jXOSRCQkAM3WOWYFIl9a1CayA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfXwf9r8G1LXES0
 a/uzodaIfaJeXqt6cKDceIieSVPrT7Bjb42wcAKkL2lqVYimhNQzu8ylc/nqqrj5xE6mOUETg0y
 8DwmUOjC6qmsxFEMPwj3KCKOc7OLZDCO7Fk25EA65ikrAxDqqOTU16iibifsVudeexZpXLOQ0vx
 rmUYj3te3I8fnFXlLFqMea8UlOpc3W1npwElvANzwlj3IZFpBsSSoyidCrw2MufMpw0rW7U+Q+d
 GaJrYA/8cXPXe9xw031kl4+sxxgnV+Fwp/yxM90cp1H2eGZCDJITn0Hm5Abq2fnDkMKagKI4NCs
 GQ67UAwo5foFWN5yRky32ZFPjs/BUCtGr/PHpoVqfe8rVAC0PWERVfzo7p3XBj2C9Xng8pljevK
 AMyObgEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119494

Make the package depend on the OpenCL virtual package rather than
the exact implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
index 7f58820eb750..43ebaf96ac2b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
@@ -49,7 +49,7 @@ PACKAGECONFIG[manpages] = "-DWITH_MANPAGES=ON,-DWITH_MANPAGES=OFF, libxslt-nativ
 PACKAGECONFIG[ffmpeg] = "-DWITH_DSP_FFMPEG=ON -DWITH_FFMPEG=ON -DWITH_SWSCALE=ON, -DWITH_DSP_FFMPEG=OFF -DWITH_FFMPEG=OFF -DWITH_SWSCALE=OFF,ffmpeg"
 PACKAGECONFIG[krb5] = "-DWITH_KRB5=ON -DWITH_KRB5_NO_NTLM_FALLBACK=OFF,-DWITH_KRB5=OFF,krb5"
 PACKAGECONFIG[openh264] = "-DWITH_OPENH264=ON,-DWITH_OPENH264=OFF,openh264"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-icd-loader"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,virtual/libopencl1"
 PACKAGECONFIG[lame] = "-DWITH_LAME=ON,-DWITH_LAME=OFF,lame"
 PACKAGECONFIG[faad] = "-DWITH_FAAD=ON,-DWITH_FAAD=OFF,faad2"
 PACKAGECONFIG[faac] = "-DWITH_FAAC=ON,-DWITH_FAAC=OFF,faac"
-- 
2.47.3


