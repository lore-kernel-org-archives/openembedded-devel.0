Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068ACCDB481
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:01:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9859.1763089302389222551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GLwIt7sH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eZEorb6Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb7lt1620946
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6XViAlqyc3srsD2nrN57Ige2cRHrFZqhpcA
	YLtH8lkc=; b=GLwIt7sHsZMsBNRzynk8eOdYgq9oGPTtHRAKenIImBEd0kfTKSB
	gf3MmESi7e7+MAl9U8IC6tiGXixtnx/rC7pQROuhKztwShfB6ZtURdmK6JCiJ1m6
	TEEnAhabJouuAPGx6MVnywFUINFAGPY9V46Hy5wJx8xNblrHbo5ZCzCR7l3VkxC5
	uDKxioaWlncCJGFqJXNl0mdll+h4QwZ2vZZOG7GxhAbrVczRtibw5+Ki/+wKqj92
	nGTJjs4/26sZoSk6IaWimiiF0mC97KTo5shnjKtf10n/bpZ8nXHU2dU7BCwMoEyb
	QwMsYiyyGpCZcVU0ZIODuTUXjA9+j2zYY7Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h0k6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:01:41 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9372401215fso3495582241.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089300; x=1763694100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6XViAlqyc3srsD2nrN57Ige2cRHrFZqhpcAYLtH8lkc=;
        b=eZEorb6QIo15Zn0oNdk4jqNYh1FSuQCQjQxA1FjDvlmaL/1vBRFg0TLJP/SIUBzBcd
         jF0F54PFhADgDzvSsl2JqDxzjNAzCIrFFUl3En2UaZ/uMV0Ied62b6zxMUijiyl2k3UK
         ajD3MtbBueNcj0E9P4khuyDlY5lxR2HXyM4n1nCTrwP91waC3u1oNmhoX4ayUSivkuFX
         dFRBuynP7ufoejS8GAFPk7YPteTjjJYSHByDi/26yDWLs01OgIKouLQnb9mRsN2zmIu1
         +Hg+NW/rSKuPUQ7e+C9EWH5MfVBlIHoev3qHInqVbHnF0LaG5GPVW9PXoGVPDRmez0Mn
         PrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089300; x=1763694100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XViAlqyc3srsD2nrN57Ige2cRHrFZqhpcAYLtH8lkc=;
        b=RdVY2sJlevtu9U65qO59mC5QlVsj0twvxPFQZDDH50IOF4lj3SgVK3Roc6CrG0TgZq
         RLo7dtz8zAyyAAdzxQwOwaEOeHwMuIgqwV86ALoYpzkNW57gQQWZTvN4N+R4q8IUI43W
         lber31ZovaXesN8FvZ4yTlb5E8QOxZZjYVhJ2PGIYH1W3eaLBH0my49VK86kxAxXrOCz
         sWHbxbyvFuV2Q/A4cZrCdfOjE+wj1ctn2nt+eHgvbt5nkDll7ALZbkbj/pPCi5k24egh
         pKjfT7Ol8d5IMLKCXzguKhxdu+PXHX63KAFoCSl5v2gQdIM+T6t1Cm5bdUX6D/ac2rA8
         IY+Q==
X-Gm-Message-State: AOJu0YxIb0bWA8y4ihw+X+AbFuJW+peesjMWL2K/kR97H7rAQ0HsTgl+
	B09IsHdyWqNCd8rg+Ji8gG5y6zA7vB7TVrlVg8ydnde2NUg3PIWsPXmjuSz2jpSE+foIBOnTAaq
	M0PoDp2pSWwxgZsutLWtWz6hlZpHQVNI6LummO4Wcwhp1XF0K9ZXVncEWjdCjqOTikmIyNLN2sF
	hWmmB+FwBuvyqkadjm6+w=
X-Gm-Gg: ASbGnctuykz54p7FrxKwfMmmugBYR57QchOl16gMzl9Q3zk5JSxoBGRRnG0wldYoIHZ
	sD38U3RIDFymSGz8RgLGWkVH2lRWhERa+c2Ti5CLbltxbSPAz+5BnseFIK6Ce+Rp9trn/WTEFZo
	4niqFdq0QniYvBmvxyUxId9iF2wE14Y01gaRqr2lGtmE+F5A2IrSA9EPMSNuivUGS0oJ3IxKYIg
	whaCnFEH/54r06ib+JbdZdencwu2TJjF/Syo0A8vrdAAKgjExXn7wHw9oGN6yEoC/apDGD4O7Pg
	pdlDxeZpGICaY/8YVfnNXvz0ll9cFJjfiK0UaPjF3Rn28SOi1sysJLyMA2Joqt137SkNH/6wltG
	uKv8k+vgYjHYM+VnjHjBhqxQJyDZB3npxBO7f4aUs
X-Received: by 2002:a05:6a20:3945:b0:33f:4e3d:b003 with SMTP id adf61e73a8af0-35ba12acd69mr2298569637.25.1763088619477;
        Thu, 13 Nov 2025 18:50:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvip2MVaG4O9KE4daHtmt62+/1b+2zw905vPdffonIW3g9vXtmGsxl8S40qTgFK/zUN8c+kA==
X-Received: by 2002:a05:6a20:3945:b0:33f:4e3d:b003 with SMTP id adf61e73a8af0-35ba12acd69mr2298535637.25.1763088618943;
        Thu, 13 Nov 2025 18:50:18 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ba611682cfsm610241b3a.26.2025.11.13.18.50.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 18:50:18 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][master][PATCH v2] remmina: add DEPENDS on curl
Date: Fri, 14 Nov 2025 08:20:08 +0530
Message-ID: <20251114025008.2043926-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JFFA2tWUfQuu1EANwBufeEP6AAYrd6-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMiBTYWx0ZWRfXzixotY/VxV54
 J5rVv1Tw+8Yrw2g5iSe6q5gClu5ALWaKxYqwqir/4vp4c8eNpaN8/cv6lXC/oOEkG+giUmaQU0u
 /KDzf9q/IJlmbtFGMtRvhUgiy08L6x9fXG19Inif1KbPRfMJOmGlylTnvS/s5bl5KTW1fPKbe4t
 yzO3Cz15cGZHg5EUoWY01dW7cpOa7p8V6bCfmt5vCkTnQknFdgMexNAyYhdF50r9vXL3vr8pz79
 +nxBiVHRU0zgz8C4ESOY0Nbx6PQUz+GIjE4swUteNKV/J9kyPAvb9HWtA3qOnuxZQ8G+X7N67VU
 XXnxa69t7PhD37XvghwYqRgUEPvJMMa55sBj7make2XMXiM2T48U9SLWDtVwBz3px33QzBQ6HWb
 VOsFSLmNtwHbZuKlDybD8ju1BSAikw==
X-Proofpoint-GUID: JFFA2tWUfQuu1EANwBufeEP6AAYrd6-Y
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69169b95 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fou6dX1CAAAA:20 a=EUspDBNiAAAA:8 a=2TNrCjRSqPdrytZh3IMA:9
 a=1WsBpfsz9X-RYQiigVTh:22 a=bA3UWDv6hWIuX7UZL3qL:22 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121673

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

remmina has a hard dependency on curl [1]. This doesn't result in an
error on branches with gtk4 because curl gets pulled in via vte ->
gtk4 -> gstreamer-plugins-bad -> curl.

Add an explicit DEPENDS on curl to reflect the dependency.

[1] https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce2ebc0411569529cd0296/src/CMakeLists.txt#L259

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-support/remmina/remmina_1.4.36.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
index aefd871354..b8a31fc012 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
@@ -20,6 +20,7 @@ DEPENDS = " \
     libvncserver \
     libsecret \
     libxkbfile \
+    curl \
 "
 
 DEPENDS:append:libc-musl = " libexecinfo"
-- 
2.51.2


