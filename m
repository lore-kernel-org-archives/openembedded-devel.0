Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89F8C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 01:08:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10256.1784855277579735670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 18:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JNM7IOLA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fNXoPlfx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLe4pi1350957
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=prveF33sHdK
	g8cFGevQI5hdl3XDbEf6QY+TgFicF7+A=; b=JNM7IOLAEwbHKA6AQUcv/OfqYO1
	9AiARH2gGVsSrVfyCtpXkT5Tp61KtQDG6ybijY7sD2jzGrADYKKBUCoArf5CLGOr
	DUryH0vkwXhx00yC++iPaiuDoIFPqsO6EcnxVfIK4CaKhAvrq/WjBet6ybub3OcD
	JVs49LERWVKS3nrPmpNmd9eTB5xl4Y0npd71x8XctusED/fnPqbja9Ncaj8cFXD1
	YKf51AxjLAADMA6H3lAjZX6U+8nd16ETQryJPdXEa5hoHgDR+HBASVNVnXEeDbf9
	cy7xYX5IpWHibUTyE9J3xlN9P1/lvnT6/sTwX/74XmQfdPLq7DfBrd+FgEw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa09eaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso1500618b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 18:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784855276; x=1785460076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=prveF33sHdKg8cFGevQI5hdl3XDbEf6QY+TgFicF7+A=;
        b=fNXoPlfxiHlDWGaCzCu6No2RX2HmyPieUU/+/o4c88SauoeQ8r9Ip6iY7ubN/NzCqN
         n9rAEBhpJE+yCHjMYY4B8jrIfr1TXPUJFiOGiO3TyLa2e2jWO02zVSHa4Div483NijRm
         IFIjmq8SavCggICl6y6zX9koK5it8Qb1tu8D5dK9aeSgAQZpsg4DKhgDPjrIvhkbtNQU
         +1oOjl2gRw5Sj3iyUWFQj80YUo56X4Dg1moiWH6SSBVLhBlll6CCbBrb2sUCjkWrigIs
         sDrC6uaBO8Ukx9ZI4SHHcMyBGbgOYQHRHgxo4tRkZhhzzJy5ZWEYMTMkhCuDN/PbrmGF
         nn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784855276; x=1785460076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=prveF33sHdKg8cFGevQI5hdl3XDbEf6QY+TgFicF7+A=;
        b=KmLdQGzi26M4e6vPhByZWkd6YXATYAilMmWhOJzOEP6L/C/ik0V5PsD5292vvUZG1/
         GPJ+6KZzupJyx3laFfV/2J05Vq/3EdM83axxMLIbQPp9d1iv04ddk1S+jUAsyoKTtQPv
         63A7vOWA+z7rsTaXBu2vTz0TAXZN6a78bgJwZh+lun1GLz/EXRUVXvMai74xO4cyZfHp
         sq4qyEe6oS+jMo157h+zxT8IIdQulK9xcERkDNnHt0nWAqVeVsOUd204gBBKpI2m+gwG
         Hc89T2toU8Qe5b834XHqxm+LQpG7BOtA5L7PAq4fL7zUV3QZai3LEuRm0QdCfY7NRTZO
         BPLA==
X-Gm-Message-State: AOJu0YzPFMegc0oCvPcoC4VPLVO+WJrKhmI9VC4wlImfNgDe4npetpf4
	rXaKil/FT/xpx+paxsq/7BOXstdUhMy9AJt9KNv8izY7M5nsoevYe1UWs/NAlU7fkEAOfq2sa7O
	nuJZUE4qbqFOnuS2adejkgSouWdQtNxDdW2MuoI+BfY5/aZh76VtneCeDe4njOqCQ5Sg6MEYD2Y
	XGvOXWlnbJzHbWpScFoHxYaQ==
X-Gm-Gg: AR+sD13nDvNfhKILJUlNckgUh5lUct7FNVmFRuWF0P0j0Rs6OfQAY3xDbwPdKOSLKjM
	gRlU3f2W+V1Ip32dc6NHiTFLw7t0PJ7U07XMtKVSOprqV7yA7j6hbjpq2GQk9FMY6hOIn/HP/p0
	qc0rqj9AdwRgYhrzbpAkH++H2MUpJUczisW40L5odaZYymJgYAnE4IQRG1K5M+0Qi5hxSrhevbr
	KJbOnQWbA7jwyRhtA4GVlxIdk/vGwX6Xu4jSw1m4/0DfjId81JB7OYFDElirJnG3uRpwEMVxkcp
	kBQdJFPTAANcIIzVTftyA4gSdbhK94QXdKht2jjQoVYNUT5gp3PqrMPXzpof79skagdrfblMiwK
	WLaz/YNRt2l6qBGP6nc9f3wTYos9x3/E=
X-Received: by 2002:a05:6a21:730a:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3c44afcf899mr5894357637.8.1784855276466;
        Thu, 23 Jul 2026 18:07:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:730a:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3c44afcf899mr5894325637.8.1784855275976;
        Thu, 23 Jul 2026 18:07:55 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm44906934eec.21.2026.07.23.18.07.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:07:55 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-python][PATCH 3/4] python3-h11: set CVE_PRODUCT
Date: Fri, 24 Jul 2026 06:37:45 +0530
Message-ID: <20260724010746.2638347-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724010746.2638347-1-anuj.mittal@oss.qualcomm.com>
References: <20260724010746.2638347-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -ut6NoRUiHdk8PCofG8QDpEimkVFMGWA
X-Proofpoint-GUID: -ut6NoRUiHdk8PCofG8QDpEimkVFMGWA
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a62baed cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=8r2qhXULAAAA:8
 a=57SyGIRnAAAA:8 a=EUspDBNiAAAA:8 a=CNZ1mSPGx5UKLLnyq3QA:9
 a=IoOABgeZipijB_acs4fv:22 a=8gvLZcY7Nlvl4CGD_6nf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX9Mpr++eQc0vG
 GUV81DzS4G39aeYjrmvmwDioMqXGkGUF5lGov5ZDA3bxzRkZDjwIUSNFHlhDGjyw7ZSrOfIQQFU
 btm2aXsJHdep5QY+KECKRIGHHMMg3Egnp97JySEFTqVFLyhYL2uXb6vGmgLeasmT5TfQBM/XR0e
 5uZS3cYEvlxR89fV4cckIcyTQ1RcnjrC4bjsNV+dCxV4yS1H9dV8/6ve1FHHHE9ybBawm6Q6cbV
 cwXvQzURKQuWb4uWhQEWRbOu8CO6y6BNUEkK6acjt94Fv2SUm409QQl6/l9ibWdieFq8rn9lV24
 bN488QuJGT7/jUZcbyIwQchjm8scxZFG6Qfm01MqYF/Ysu1EMVuFZ2kfxCtOgNanOCbzWPdlHQu
 dpi8nySz0AN0lbbeHBRbB+wkgH+UdbvXwl/bndi1jrkvB70Ru7Ovw3ha17uWVVQAhlye5fTiVq6
 p1G0bcI6xKpBmmLsw2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX3h1fEviKSOg8
 JzfKZnQYXhSkTYpu6403Ct8qTUu0tHlD4A4ZnxAHJ5toO8nZe98FvuhWqN0VAi9e07S9DOd5+pr
 yXfOTyfDkgOFKuBlQZr/nKJhfI1XViU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128421

From: mark.yang <mark.yang@lge.com>

The pypi class default python:h11 doesn't match how h11 is tracked
in the CVE databases. NVD has no CPE for it yet; the only existing
record (CVE-2025-43859) carries python-hyper:h11 in its CNA affected
entry [1], so set that pair.

CVE-2025-43859 (request smuggling) is fixed in 0.16.0, the version
we ship, so it resolves as not affected.

[1] https://www.cve.org/CVERecord?id=CVE-2025-43859

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a9bfe001bdfe740e89cf8afd41e6348e31a07211)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-h11_0.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
index a47e6ab61e..ed1702ff54 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
@@ -7,4 +7,6 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
 
+CVE_PRODUCT = "python-hyper:h11"
+
 RDEPENDS:${PN} += "python3-profile"
-- 
2.54.0


