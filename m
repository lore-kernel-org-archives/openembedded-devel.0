Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2355BEA4FB1
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 11:20:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33135.1771844994469432209
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 03:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UHAX30ZO;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Sr7sIk5i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NARqa03683223
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yQbXdqSgvhcL6buzfxYKugjF1EEwcBQFN5v
	MbxC0png=; b=UHAX30ZO90j0RNhqOvCQqcT1AVt52nGhcDl/MPmjtnQbJ2YaAT4
	IYuUQgHL2p8RVd2V3px4KyrQyF3ae/qm+ElvGDg+9DsbP/pa8U2e16sM8Q3fxpI6
	eWqd7kAR1X+mnVhH9fvWKkc2vzRcInbnKyvHYhSO/mLxkVBmdJaMy/9CzCOY5yhr
	gg0GiXiGyjbreX5uvAh25awco1kj1HfqL2D5mv+yhf+94Jn+mDNLcWQCrY/rj74f
	/X9G/kF2NW9wl6DgnRHqUps7Kh2YcFubTC11Fl1NJJOcP8JfvXhq50XoQShDajFl
	3J5DLzq7RQcIWS7MubIPyUMijMe9E7S+Pwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8meqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:09:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so3993196385a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 03:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771844992; x=1772449792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQbXdqSgvhcL6buzfxYKugjF1EEwcBQFN5vMbxC0png=;
        b=Sr7sIk5iXGXpXk2dGBYhLNJZAWx5A7QCaHlojrZUQJj6/IaMOrrbnfV+59hrAjTAHb
         wNAoHnjBW6IVNSeDCmb2/lju4Pmd30YUiptsE7ee1AIqIMDG5X3t6o69oCel+1BktTvq
         60Q5C+6dkufh5EVoN8/1BBTTNk89foimMb3p/+EiZu1EeSo3gqUSdZi/7go29zwe9H6i
         983LDe06JE7tQt7p0wIZIxOSgg/1UPFWgKOU/AqV4HcGGjAU/8lwHcl3LwYHM+26BFtt
         3Vkc8TSqKzIEGBf1uXlViU9Dk+Zx+jQ1f/xhhDJDDgUoVWwGY0BGVFeW2Vvg4+jlLftn
         spQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771844993; x=1772449793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQbXdqSgvhcL6buzfxYKugjF1EEwcBQFN5vMbxC0png=;
        b=qLbVs2TFV08UZDUvXFxG/D2jPBoJzbhPKJZjFRlEYsKvfO6kSbEvJ63u95m4bomzn2
         YjSTsGLPEVee2RbicHPjqDimuM2UhRxsH6LTfth7mCLF9WdVN5ZReb7vkdGN/nKXe9Zu
         u0vuu0BGpvuFfvGY30iYwi4A9RFo+4WZI2zJUG/L4u4YqVnNBkcVORQkfBAAa+iIYgmM
         f77Y1tprF0Hxw0OOw2Zi1FaOUQlrHFqPoMDJnEO6LBtYEC345/Auh3h87cEwLUdMQ2Ej
         OOS3eHEysMttXCf0HONwadJZRgs7yV+6XsDloXXd7B+GCZP9+fhI5uaDP83JRqPLSsTP
         eH7A==
X-Forwarded-Encrypted: i=1; AJvYcCU0JznGbqi/dhd/oTDRx9t1/2VdWE3HtBWsc16Y4lBOcLE1ErpqQDFdT2OIr0Ka+ELIl63LE4OvL5SaJVAWMl1k8Qg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+32WrQdwpHTu9sWXYlhQNAsSLNQNxKowctF6oyQ4XAGrzrvNM
	zgQpWVFDy0f7cIdlwETD6ye9iaQNQ/sy5BmUOhHmUHeaOy3iZJoLPqs4ZKBYCJJPKw/2GBj8Kwz
	v9s2J3BXQuP61sAnfNrpSfzBHiDXoJidJxMlHLKkaNy7QFttIuf5Pjsu+yFMw+d9jDJ0FKDOwQM
	yRWlhv6p/V
X-Gm-Gg: AZuq6aJgud/4yjO5DMXbAIJSLA3thWSWBjALIh0YNyVAxLk1ljjjyzKsDpDDJfsUOsm
	iZv1E/VyFVIx7BAfrSTG9zPVc4dGAJUXRmwBH0ZgAXibfFZ6Y5TG0VtLHKVL6vu18a3dVW1k9UK
	ytlFZwtDEawLHrIkhoEJbbHoR/AN+b0GyAPZQ1Gy5uukG/txKXebuerZDOm6PN2in7nnFoY/qo8
	lnokt7poFppduG+NZLdN3JVQNKCQKTpPBKHOGQ0S+yq9A1jeHFafFco7/RVfUqUp7oIDd8A2uHN
	mvdAco1U0pLtc9B5s51WJFV1THWdfyVpB3D/+S9/tpI4Zbki7we4WELgp6uypfJT8L0BfrCzyLv
	Kf+3IRO41o5ZWFt+921LdymAMmokEutMdGX+owsX3O41TOYNsby8=
X-Received: by 2002:a05:620a:480a:b0:8ca:3c67:8924 with SMTP id af79cd13be357-8cb8ca71e02mr1088673085a.42.1771844992538;
        Mon, 23 Feb 2026 03:09:52 -0800 (PST)
X-Received: by 2002:a05:620a:480a:b0:8ca:3c67:8924 with SMTP id af79cd13be357-8cb8ca71e02mr1088670385a.42.1771844992104;
        Mon, 23 Feb 2026 03:09:52 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42cc594sm112961415e9.4.2026.02.23.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:09:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libgpiod: update to v2.2.3
Date: Mon, 23 Feb 2026 12:09:45 +0100
Message-ID: <20260223110945.144724-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-GUID: JqgkdpJNkxkGwFWXEzU2TAQEW5VKl1iT
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c3581 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=_Ed0vQDxGRLn-HC2BrUA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: JqgkdpJNkxkGwFWXEzU2TAQEW5VKl1iT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NiBTYWx0ZWRfX6e2vpIkyjHuD
 rVijpNc38ucA46CK1MKq97G0Wy3EjD30qIWSg1N5mRqOkEOr8OTXMjhly+GHSqK6i+k1qQLhXHt
 RB3u675ZpNHWzDthZZo1cXzNeFlHJ12zbYLxqxVAn4FD5V8RbIO62UC2d4Z3zGkK025YN8H2P9Q
 j3A9z3ilIc9LC6k4cAC7PRnbcabmvjtlV7VMyxjhBzVaw597l+NF8MXbWeaze4m8XQUYWjI8UyF
 HTsNTJBS3zpyEPViziKn84DvfiMjQTSVYjRy9J5Oq7B954w39A6/4OGmJQEa13FithcLb2gkwbB
 8kFRYl3kPsd1wf3s8M9R/6m+blXsBzcqJeCLpjKANJOENVsp44Lo+NjEbuW6wir7lJiLZVEnbzX
 5ugLgTTRz3xCb1X2jzZeDo5FZjfZ+FITr7JuD0sy+RefjxgV+aSesKxH8zIWPO5QhO6hZiPtEHr
 9HfT+cPBsdIpTWTY54g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230096
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124547

Bug-fix release addressing a couple problems in gpio-manager and tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../libgpiod/{libgpiod_2.2.2.bb => libgpiod_2.2.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.2.bb => libgpiod_2.2.3.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
index 09b0928dfa..a23d65bcaa 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
@@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
 
-SRC_URI[sha256sum] = "7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d"
+SRC_URI[sha256sum] = "70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
-- 
2.47.3


