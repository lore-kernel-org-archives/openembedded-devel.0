Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B73FCD4F48
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20214.1779006262128112618
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=U54yvtfK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=OlQqtCEl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2uF5n1325206
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WP7mbYT8iGs
	dljDprOdLvV7AkmyodO8tf+VCD58Coa8=; b=U54yvtfKTvY2gi59rQYRp16LZRz
	/FP1eZTXRuhgpktCnm2FxSvq3xwtWhueB63tKqIrv3n7B82+kYOLEczDTOYiGcaM
	V0z0dKSdZoZxnHjMMyXKoZtCd9W2AJ+MYi2f/O0u+xoL8E9aclrUGGdC/Fl7GxTB
	1AeV5jiKMpLOMFIO2GTR0amicAJQo2UyABpO0xh57s+YCq/yjRGBb3oHvsl+wONl
	3AqmFxlREkdUhWQNzDakYp97WUGeAlAU8fHKv6zGlDwl08WMHUebzu1e0i28RGse
	v47KkC6ttFVMfAIVSqz3mVsaLr7L4CggiKdJQPGpsfoIxaNkWq4QAbBs1Fw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7tctp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so1161357a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006261; x=1779611061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WP7mbYT8iGsdljDprOdLvV7AkmyodO8tf+VCD58Coa8=;
        b=OlQqtCElcxdkGz+J0we92Of7J+AsEo1lIuQOSsjNfg1ElCRsSDr0k3ifTJD3q5RhhH
         WT5zqpgDhlBnBww/Ju5cGUksAwF6Pd9e1GJ6c5ACRY3AFpsIE/x+j63h0u+nvuQZlUOz
         Ln2DXjkXTwPfEn8owCwldN/WcF3S7zEbZlnlppaP/rEzuI19d0QyHkcNKV0arApV9c6g
         qRSRF8RE0PYwgMPNCSesByGlk1bBurwKAzKraxyKTzXBDuhH5owAYV37U76xCep8kOp8
         OcVd9Cdskmeq+LKe//OLMXfMQtK0AT18b6EJrVPRdw8JFoA6qF40qmhPEv1GJS6Ed+xr
         VZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006261; x=1779611061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WP7mbYT8iGsdljDprOdLvV7AkmyodO8tf+VCD58Coa8=;
        b=n/jFLpMpqGV8oiZQBXCdRI5e0uQHw9q0sIln3xXVsz0nFxObfwHRarDa5lNFSdvS9u
         m8+2M2uxBWINRK5jK2311DRz+H3lbFPAuOujrVWBxBd78Q+ToC7MkwqYWU5qfCC9hngQ
         QrXXxtYdYPeOU33DSZZFjlkE5+thfG3PcDvlrWXmlLvbcmbBKM14pkn3f3/3gr00uiwp
         MJdCAzUdPMrbH8fAa3SxWVqU11c4VRxJpGBxjY02r2Kq25Sm/7vqLdNCYePl2s1DDINk
         AHWslkPiATYMVTxFrq29uRNYBKe7nXYE30fwHe8FSAPDRCqtSvCPhZqO9H1RoDF1wUla
         r6FQ==
X-Gm-Message-State: AOJu0YwFDjRl3b+TeXVV1/3znN7jl7ZrpdLKpP9L/5E+HK8Qrra+F424
	ISSMXKOYsrDi59wkg4Y5qsFw9KuL+dlwUj6ulUgYlHL6kjF0lmwo65kRWyvM1LaEg7gJW/WmdKy
	zLqe2uHJ5uNJ1rYJdQb4cF0SVCL3B69aFElszcQEie7O9GOpFl05SdEd/VpDgdhZPsNp+KaFad9
	Yl1FyoAOLXKsA+szK5uQsxyA==
X-Gm-Gg: Acq92OHZebHZlvJFuzkiqGaveWHdJ+u/h57tlQcmV2/M4oG2kuk64ZUfcwBWbvHC8+s
	ZXPpNVOU/A2giJNv5a0UIhe9TH4nMPXEWAlAgmHlr32SqEvI74wji6I+G4Sfjs3xPZntHCDkkhf
	9O3KVtBL1eJplyv9p1fZpBlDNu9tVPpXsLSN6KhisxZ2yDJ9tDvgNRA/7tvBL9vusmubxshkBLP
	1NwbSSwPs6+/3Xc4e4/awfTnR5IbV866P8fTSPdMDXfVodu6vqyMpUFV81Gs7N26F7wS4zakkeL
	W5xRHCob6jnNtBrIPJWcHL49aTKLKvgS7Fwknp54hcU1q5cirtb6NM74tSHfHLpQGk/gvVNlhcz
	EeNbktP48MqQSAL4V84mNMPVk6gVSNWC4PMS0P5LAmEP+Vja0/BAQ
X-Received: by 2002:a17:90b:134e:b0:368:5367:d681 with SMTP id 98e67ed59e1d1-369519c348cmr10493782a91.10.1779006261094;
        Sun, 17 May 2026 01:24:21 -0700 (PDT)
X-Received: by 2002:a17:90b:134e:b0:368:5367:d681 with SMTP id 98e67ed59e1d1-369519c348cmr10493771a91.10.1779006260610;
        Sun, 17 May 2026 01:24:20 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:20 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 14/29] proftpd: upgrade 1.3.9 -> 1.3.9a
Date: Sun, 17 May 2026 13:49:42 +0530
Message-ID: <0d15102e2d6f281e279ecf8048ce9d343c5b7d04.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX9PU0q4zBkF55
 UUJDs6V4EqpxHCGLc/hD1gPdayvjK7R/Ea7OsjjmRNrVbiys7w8w0TqH8MOUIKLwI00P/aQjn4M
 AVhX9mNNupcjlgB/hWtAvXHkkKoELf6bHQboWXI4ujlS2cwd9hQWctvzQCTK/DTM79TMXm3Uzhq
 8uU8YtCw5TwXugkfu77IgnZnh8im3lSzpbBoD4dE25np28sztPq1db1gdzcZ3ODf9F2LftneF8I
 +e2Cn6H3qOmGimkVOsA7LMJsYnPEiTP/dNfOpAjK1zNUyA4VUAFZMMyAY91SddRIj3m6CoBHc86
 73yvkI+gT0syk5xDwaVY48txHuGxWLdHsN2DKmJKHBmueMSbTAkvodDs5gR1X6Aih/ZsZEHiLLS
 QAF16wKUboTsR79P4pS5cli1vmF49jJzYv1OtOv0CMKa2Se9EiUGIFryU4IeACCcgMP5ZdvjxHp
 rCrV3cHoZYx/C+KZLfw==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a097b35 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=u_SgSZvrAAAA:20
 a=xHmGWb7dAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=bQCnkKiaBIXSCBY0l9gA:9 a=iS9zxrgQBfv6-_F4QbHw:22 a=dUxtNc5KqGcdvnm1qQk7:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: c6G66yO3ii_bWYk8n7tsFsaScL67MGRq
X-Proofpoint-GUID: c6G66yO3ii_bWYk8n7tsFsaScL67MGRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127027

From: Yi Zhao <yi.zhao@windriver.com>

Security fix: CVE-2026-42167

ChangeLog:
https://github.com/proftpd/proftpd/blob/1.3.9/NEWS

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7381ae9d2409bbf7c358db4834741651fd1e740d)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../proftpd/{proftpd_1.3.9.bb => proftpd_1.3.9a.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9.bb => proftpd_1.3.9a.bb} (98%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb
similarity index 98%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb
index d64e0a0495..2e164a574b 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "ae25959adb05ae1d6ebfa1f36bf778c9c34e9410"
-BRANCH = "${PV}"
+SRCREV = "ec8a5544e81df54e202f52f1f70d206439389577"
+BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \
            file://basic.conf.patch \
-- 
2.53.0


