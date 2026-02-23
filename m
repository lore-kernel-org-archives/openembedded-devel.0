Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E554E63C8B
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 10:46:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32645.1771842535222666678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 02:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bjQJxUhd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=DLGklIMH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMsBjt2238684
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 10:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uONUQEKRLIAIXawhNST6t08/IhOlpxYVBnw
	m2fP63lY=; b=bjQJxUhdBWa72lo5mjfVTwpeksVCviMD86NU4MzXMvpWVUuBnxd
	DXjTWYIoNbnXw0Qy9xAcS/9MSTO6S8cjLtowX29vMK4cI0hJp4Ea2J/0BoZeuj4k
	4OBT1XjiVLWDfsBU46A08hvKT0JdJ093uh5PK/iQJvsqwzlVlMPB5bZG+tgatYlw
	u/nsak+V0JBnER2H4EqG3dvBQZ6MEkOOIiXVP98tBwdY3CQG4/ODVgccvOvRH3P2
	gbjZkmLys51xClpQHxdqYLQ3Dmp0DzNn9wh3ZnsN8MFZ5Or9f10FaArf7iXcohz5
	eDv0nFp2ubSGWr2vGYyqJGT/MAONqbusI1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum7t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 10:11:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so6466352985a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 02:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771841467; x=1772446267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uONUQEKRLIAIXawhNST6t08/IhOlpxYVBnwm2fP63lY=;
        b=DLGklIMHlLMkLNHZFAdqW/uzXRunt9U4i8DA+4feB9IPl5E9Ll15fuPNdaQjqkS6Wd
         IxaRFbzO5XUawYmt5pw3ekN23ItveimHmSCYk3C0Q8AyvTAGhv+K5WIwEw0jqTzWBy20
         23GvsxtdqtVsC9CdKhKLVYon5ESTFfSAetGwmfb41PB7K3Pu4IxY81+iOuBp8106KozY
         IkM571E26/YNj2aafDZoOp4DKReox2Qm7nAKesvmhEPtK6qYrqj16SsYqvhelvaMVwT5
         t0KHwLl69hQEaJha9K9ltbo9YVAEuG78b6WDwxakbNYnXXR/4ZSvUapeIcRV7QHVihXk
         J1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841467; x=1772446267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uONUQEKRLIAIXawhNST6t08/IhOlpxYVBnwm2fP63lY=;
        b=QGqH0VecdL+KAq67G+CVQ12DT0KNxf/OBwaJqAl9uDybmAY+z1mRbWjOLKioegVYQ4
         BtHZlU4TZAIbouUgCGqr0eFETvZtix07+8EIZ1eOxZyZ7FDG3XECsXT0xCO1ku9g6N6f
         EA/Wip6F72a2PMMXN+0S9S+SSI+PdtG+DAlnt4U/JWiiTyaUtiCSA5uS5+u9vmp92rVd
         KuFn47mO/QjohAupnt/Xuxh7EUibibIcQLDrBOqbNMvqwj8S2hAkbZeP7dKiNMZZmY6D
         5IZ3mp1+5wmhW+i13rycDB/3Yj8RGRCnAi9K6he7h74tieNAxmsUPAGjCblWnw4k3BvY
         Ha/g==
X-Forwarded-Encrypted: i=1; AJvYcCWEFb/qFSCDKVrT59tpCOIUdIV6g2Ug6g7JYjh8M/cGGu10nihDz9KOYp3B2lNoSU7VEXqKfkutGdlerop6oPFuRu0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YySfggSPjF66s3egkJ/hrMKzR3j1apuz3+Yv5EunLKCIR8CFykz
	ZZryoFXVd+/WsNbz1UGUSxkPIlC8jUeD1VrzWxL+KIY/gDRZhLYJt7rXF5pTZXlFSessP6kyx8G
	GMXVVx6JjN4cUcpJkkvDeqYMlMymOF5h1Dm3FSBnU52evxPQpK+lBG4/rxHIil+E6fShzXC/ZT0
	bUCHfzA0TQ
X-Gm-Gg: AZuq6aLV0TsuzpicjKt+snVRgUV9NryJjmnBh+ghpO7ClwqybxxacY5ZRSHpCtohfq/
	f8E6PaNpytul/Jz3OcLtr0mgXAclNo7qSpQMU5HmhZwT3imXJHVwlDUN6iiqb4SxvyG8hVPApWM
	STlTiZS7c+arqivTdGmj1YAJ6Q2FgbeH6GbOC7r116MJJjoraQp3zbwX9H+DSQ4aEfXU+JGE3h+
	fjsICZLIQxozaiywA2P1RzAhkrOw5UMzg1XT/nAEIozY2lhau99KUHZjA9T38rbSQ9HJ9xmsFPO
	1hWvohuI/qC/TzYzNPaGJADposmMwQ09n5JtkDTLqUGha4tNuzW/dloYG/uQ+oAZsf+z0GvuMCw
	pRds+ifI3CMiTck8icVPvPgdbZ9MoXdpU2UhPMeLGq7wbXrZoXgs=
X-Received: by 2002:a05:620a:1a18:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cb8ca0e16fmr891545985a.28.1771841467559;
        Mon, 23 Feb 2026 02:11:07 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cb8ca0e16fmr891544185a.28.1771841467110;
        Mon, 23 Feb 2026 02:11:07 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm17770021f8f.38.2026.02.23.02.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:11:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-oe][PATCH] dtschema: new package
Date: Mon, 23 Feb 2026 11:11:02 +0100
Message-ID: <20260223101102.92124-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c27bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=zNuulJHM2Z6BHlAdrG4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9oSNnFFFoKZLcIyncD7OCXCDqENp-DtM
X-Proofpoint-ORIG-GUID: 9oSNnFFFoKZLcIyncD7OCXCDqENp-DtM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NyBTYWx0ZWRfX7iAei8bt3HU2
 KQF1mYDBFJI5KQFUqzCMlzerGENXwt/irB6GL100YyqgtHACVKkkQwUuPPkba4VdCoL9NSRBTFa
 gK7lky+iRvM4hroxxxlLO09fo/3zSqfCiWfYB+nG05+w5ZR7BN/4dnUtjJq93DdHTrnx/7CrDT6
 WR954O8tieAqGhNxUjsAnfOedN7vMPB1XPYvykd99eHBXPdO6tZrpTDyZGzOKy+itKrJLgwTEAX
 tqEbzHtprVRwJ4D1OhYKY3xqH31pzO5dgjxlDuu+oX4qP9QbjboryByYHVU++RCg2m79/TkCf0I
 O0jXzaMaFRjWUY7W+5MvpXGxp3pnyuS8R/I3Q2GmsU0rUCsqFm/4iymAdmL9ExYBjx6rYJqFIVB
 rp8opAaRHD8OYmbZmZWiCoycDgGPWPGhtOMvmKGsX+VpbMGhITWYAjN/DjiKV0aerwKiCm+z3Lr
 FzhjFET741O3h6yG2Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230087
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 10:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124545

Add a recipe for the dtschema package - a python package and a set of
command-line tools for validating linux kernel devicetree sources.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb

diff --git a/meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb b/meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb
new file mode 100644
index 0000000000..c763aea2bd
--- /dev/null
+++ b/meta-oe/recipes-devtools/dtschema/dtschema_2025.12.bb
@@ -0,0 +1,8 @@
+SUMMARY = "The dtschema module contains tools and schema data for Devicetree schema validation using the json-schema vocabulary."
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "31a4927b8dfbb5c97edfc9569cda3b6737bbfd8430881e8cc48a0b088ced6147"
-- 
2.47.3


