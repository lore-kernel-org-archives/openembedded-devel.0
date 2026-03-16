Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C16CF46436
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:32:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46374.1773652241431213065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lrq/jWey;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=X4kb+ZtI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7msI0041580
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8t0raL/nOgxJpPmf9MgTTNjN/ShZspREhb/
	tfCBoNcg=; b=lrq/jWeyQSKlme/2EEPQmD1Q1oXKmup30rs23TgMWtvPrC9gtuC
	POjV8WdWBODONdhqP5bzzV5el/LDQ00HTivOzZPJFLlYR2p3joLi4Ni1asOgxvN4
	egEofKMYNVnkTuHuWOw910pkvmRomyxfEX6pF77BdfFCQzi3jJShIe36neseYcee
	gvSWQT675x/OkF4xE4aGtI1E5NiC+fSVMSXTt1KEOymn3KEI8kHZ1SkErIIHxa+1
	Z7HvrQOl03BkuZh12Fs4dL1Wb3c9I7sisTqwOaIwZL3VMsg2KRpkrbSRjwe/xboC
	Ka32Sg+Kwn2Z9iLoozxIyIR4yMKeeTVRvTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt805g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:37:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb6291d95aso5006689885a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773650234; x=1774255034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8t0raL/nOgxJpPmf9MgTTNjN/ShZspREhb/tfCBoNcg=;
        b=X4kb+ZtIW/QCGtSxemngr05G6GU4I23VtqJhdA2rbkEymisYpeyb4iTDNajDTuJPhf
         yO9vlc9cEVSL7MFaW/CKuhoZyZh4rv0PBX/euu0BuV/cwU2P2BO6TDofec6kNynbIlhD
         sj7Hf+9BGWCFaTJo24Jipt17FPhaH9yqiAXKeZKb9mKrXMHQRxUI15pqiz+olUVtqTj8
         S/0nYIl5cL5GiF8j43ed83J7zDMxUeyz87vPiGgxu0bAUYI3LbWibd+mQ/Ux+8HeuRsx
         iUf/B1g2ygwkAW2kS9I2/WCQtWblC8l+at5crg0WC5lKC4ocUh8brqgvLVBswcPINsjk
         D5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650234; x=1774255034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t0raL/nOgxJpPmf9MgTTNjN/ShZspREhb/tfCBoNcg=;
        b=Z/a8Bvoa+liwEEKBkQCe97kHCe2+Xn5/uNhKg3iBJqPd2ZZs3vbKLE/zNMIURAUCPI
         gN/o/9zcyUuGHOOsIXeOAx3ChNBLv8QH+GZKsadFZMyNmarDx+63pZMSoWWD64uRLbcp
         5WycnE0yGiT1XhKM7dE0QZ/oJK5pq4jSRuSOAzVR7C6Idw1mMWhBrSIDwRtg+0lzVujy
         zpQAtYvenpwKnaHdzg8dqG10b2FVU8slu4gENSwr6vofNqVkNMW9RYYSBEcylH8bzLw7
         A+53/49CX5+ocbtuRkly7jOLWV1Th6N+w/xmFX6oCn7PkUJ9rOZ5JdXcHyG51MB9+65F
         yElA==
X-Forwarded-Encrypted: i=1; AJvYcCWPCBn94+h8LXpfluDWVhxtytjiqFi68TrOU3iLuIQKkpzvtxJh1zvp7qaheQEOLDgaBmcU/rjSYi3pZltHsAusKuE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWr4f1EOszMSvnab3pUEg2AwsRuP3yZQcRMe4Q1wjP2xnTeQRQ
	kpqDb42jTHV6JXyLrjXqiZMHFRc6+l3DkGAoDwhPNHShXkO43bTgyEfXxEwRkGPiwDmBFcrlq+3
	VptsskU7OGmf39wjBe8J3ZPpzgaENKcmnnGyHilqtygA88MRAbMeufCoPE+LASMq5vZ1OM+W2n1
	CnkJgeDz6E
X-Gm-Gg: ATEYQzx3UlLpVEvdYH2mDshaIAxOzn88eWFOEJJZZ5/uH1WewazGWdTsOCsBSTFNR10
	uHEngqOEkQPnq5QJPEzOW0JxIQ10Fc/3M+nJRUhUc8EHI/jRoOqDePUt8Wlqhf+9mzagRN+EW7c
	2kH5pzmkrSHOuIZL5C7xPfvpUpreONu1NiNpARfMY2ydw43s5KGIvbX1Lf3y5tNwIskrNF/O6rw
	0Mnuz6H79uFUtZiDc2QOGS4A6IdROqmL3MWJcbgO6HsJkMp+gh4FEPEXFJNmP3l/kgmYlZGHVCU
	7NX7yJKiB5VG901LWwm09nXgAWPWfAYeriXy30uejhC+qRciamtoYVqJMZ5sWOLy5E6an0ZMTwq
	97nRtK88Qn+0QOSv0w18xVhJgkquwkdu9d6AdAHnIX9QGlu9Y2s0=
X-Received: by 2002:a05:620a:4005:b0:8cd:942e:82e6 with SMTP id af79cd13be357-8cdb5a7b3edmr1644720085a.18.1773650233755;
        Mon, 16 Mar 2026 01:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4005:b0:8cd:942e:82e6 with SMTP id af79cd13be357-8cdb5a7b3edmr1644718285a.18.1773650233367;
        Mon, 16 Mar 2026 01:37:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6bb4sm397176835e9.4.2026.03.16.01.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:37:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-python][PATCH v2] python3-gpiod: update to v2.4.1
Date: Mon, 16 Mar 2026 09:37:03 +0100
Message-ID: <20260316083703.38648-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-GUID: TAhwZMwP470rrDMSPgFCil6wrVX8EavR
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7c13a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=xwGg-rVqGctdFVeOhD8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TAhwZMwP470rrDMSPgFCil6wrVX8EavR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NCBTYWx0ZWRfX7t95qBmXFn2g
 spxZYMVdty8dWCtY6XQPG/lv94mYAxgSrrZA2AlbprexEAtu6M/7fOWeaVe22QhuMu/OWqw/Lyi
 t7Q83rovBNAOewh8SLRm6HvUiYYx+96QQU341F4rEMlk8XmUj+IVU/sH29A/j/hrpb+X9vSNOvV
 XrIwlSUJgaNy8h1hcwBrR36vSHAWcglTI23uUZdh0jcgg/KuWv1+1V3FFFKtuQGXvGeOV4r+K41
 wuj/WE2jtFHOIDuV6H1bDplf/Q0C6vMY4KjW5cBz1KwkxZzEUxAQrI3wzDQSfvVczA+cn+i3GPQ
 5deZ1bpcm3WBTp31iBiEzFhUuKC1lrfS44k9RY5TxeleFekWeytXOslF9ZL62Lrc/eU1jGRdtHe
 jqAiFPy89FQi4VZmKncVMY/wtD6HET4RahE0vmBIzqNo9V12yWl3pSlzveMA8WSgNLZ+9GUecRR
 Lc9ARFXXQWmsC7kdIkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160064
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 09:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125269

Bug-fix release addressing a memory leak and a couple minor issues.

We now ship the license file with the dist tarball so update the recipe
to take this into account. While at it: trim the LICENSE value to only
include LGPL-v2.1-or-later as the other two licenses cover tests and
text files.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- remove the no longer valid comment
- trim LICENSE

 .../{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb}    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
index 405951fe0c..61a3fb929e 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
@@ -1,13 +1,11 @@
 SUMMARY = "Python bindings for libgpiod."
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
-# The actual license files live in the upstream libgpiod from which the pypi
-# package is spun out.
-LIC_FILES_CHKSUM = "file://pyproject.toml;beginline=13;endline=13;md5=0fbc720d3e48432ee239eedb6adb0f07"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1"
+SRC_URI[sha256sum] = "d29a1e8b2a065f7ed82f00a96009bc1486fc705bb2ad25820a8ae962ec6d7688"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
-- 
2.47.3


