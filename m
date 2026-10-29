Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5626.1793252780862880809
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hWLA3JUR;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BYirGFgK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gvmv2974002
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DLw0LPkJt9nWdL+S8Q91I7jr52XW5uq/LEs
	3p02yxCs=; b=hWLA3JURYhOrOZO2RaRaQXNHSyUYO+7OPMT/UXKnBT16e307ZM6
	U4/dY8hUtdwFmhh73DQNidyvlIpCuut4kebrfxylBNIipN44NMmMQNom1ChO4f+v
	nLjsB+xX3dDJ2FteYhzjg/ESZ1NTSav71lYPNQiWQqOpMQKwyNMyEECkmXey9DXI
	sSaicvszF+UZuXyL7PW1M0q1ZbYYaT7gi19fAGheNUpyB3TrzIS4YxFndG7IQyZ9
	C65kNB5QRbbhuXovz5XtCjbRpnt5Fla9yFuqeVmN61g66P6kAoZSvzeM3H0NDZf9
	m1V69cUaeduvI/tZeF2X49p4z9I8ME5kZbw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpab7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so2607217eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 22:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252778; x=1793857578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLw0LPkJt9nWdL+S8Q91I7jr52XW5uq/LEs3p02yxCs=;
        b=BYirGFgKP0V64xaAWD3XBG1Aqz+PtLcLfik3ZQN6KEAckPBa6QATGh0KUlYwj69NpP
         TsXA1HRKpfghDNomMW8rsrwwYoZD9js+PW9P6b32QjZ9CetQay8xSo637OtHiYoWmAFn
         X+H4T7715e/vzf7JonBTDuJjKj97Th8n8e/sPlo7JEPv+wge20Warn73rIK7QbfnfelO
         ptW91pt6sWhJi4XhyFX8+sg95mHPcwYctBIE4K7tkxNOrH1NDe5sgPaeZysF2xuh9biD
         dhSDIO6QeI5u6jnX2mruHdbZ1OhkTSZqVSEvj0qAwyME/ZBpeMWv5Y2c3sng5JjqHDek
         ernQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252778; x=1793857578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DLw0LPkJt9nWdL+S8Q91I7jr52XW5uq/LEs3p02yxCs=;
        b=iW0Ky8M9MM7ItqkZVUYP7R0+depUxihoq9FQhAqZL6WxyNZnLZRXSqpjjskZB4C3yX
         j88kgewbC4ZJXG0QcrAPirgh/j+B2aDbiA1BYEHvG+1siTxgkSig8SE9scemUp6aOC9j
         KTCOG2/OlzWGJIHA/t8W9N4qsG+AJuAi2DkDuRN+aM0PC0zQSPhLk5F5LH1A63fScfNo
         Usp4AMYynFGOES7z92ZzYO3ltoAm0XIo9otADF3UZpCfJ6KFfYxkDHRS+m3vd6gwVLj6
         uR+EpIngowG8CohyHKgOCJb3qF/oRojTD+fycGRckSvhxa5pbJLGEXy7/fy1H76nx0fq
         vUtA==
X-Gm-Message-State: AFq9FYItASsxhdMqh8Eo9UTwNjVD5mHTtAh9+KtyAFohRN4r/Uescxmj
	OoRdblVtR4Kal7ft1nirn6+i9IXVT4lXtlvnznLntY+z5ubtndHgdNPeISJP05zrnFT/MryLiqs
	pLBE8QXa2ksMjJ6ihr7GgL/WgP60akBSKNl4XMfRNm0uYCCgDHESsHiuSOchfIo6XedOmi4KcE3
	eaBpBxRakcpmqoM0yOBVN+NA==
X-Gm-Gg: AYBFou2rCV5EXl7aW9qat+xPBpdqNhLcOC8Cm4NXRN/iY/ZFA4+mcA/Uil1Ha7kKX0b
	oqx6pxdrth+kV2j/wLdHDXdn/nWP1Yp/u3ifcX/dz4KLAtXcee3xGekeABLoMasbO0HZ4wiD21W
	uyjtOsx7yrs5yWehk2z6GoewX5K7KZ1aSluCa4SbMiysFRnqi8bqQuGMshhVl2iujk0iWmx/t9y
	1WMYihHktpumgAOR4NJt06WktwKDbeF0rGCffD/if5gZAslr1ebpcWb2OSQsc+5hS1UucYAmTD9
	wYVADWklLr+LT7/ft248QTF21jvC2g+grlzhyXiJufXGUdiBhvVtn6EUm82LzTIudKrraAHa7Qf
	8GW8Kdy5unQce0+/VHQmRDUc6HAr/Z3WyWN0CrHuScXYY8woDmsotg8VaIQlNKq/n+P6ohKvrSo
	L/X/UP
X-Received: by 2002:a05:7300:fa19:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36a2007c0c1mr6583987eec.8.1793252778244;
        Wed, 28 Oct 2026 22:46:18 -0700 (PDT)
X-Received: by 2002:a05:7300:fa19:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36a2007c0c1mr6583941eec.8.1793252777283;
        Wed, 28 Oct 2026 22:46:17 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239d3073sm15670298eec.29.2026.10.28.22.46.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:46:16 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 1/6] c-ares: upgrade 1.34.8 -> 1.34.9
Date: Thu, 29 Oct 2026 11:16:07 +0530
Message-ID: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae2ddab cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=tO0qcCukAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p_pR1EfkuHc1GyC3nJ4A:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: qG7gkMuMN_sdzl4cr6JZyxrX7q5OHt3D
X-Proofpoint-GUID: qG7gkMuMN_sdzl4cr6JZyxrX7q5OHt3D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX6EXM5c2zQZGD
 I3zcEkgONp1oEAt3L2wfVdJMcLKHGUBuFZg4heInCoWHsk9CDPegVcRTQ+mc7Mq8KvkLkFo8ZZ2
 n9+qUL20lZchzIOOJxHbjC+AHRvnoho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfXxHqtWYFo9IJr
 aTMkdiD6btgiPeaadpJyCQ31i/xfUgtNBkuP7zSs8/rhu10mL6wKyKrdK/e6qr4V8QWFIv+LT70
 7cHOIPjlwMZmBhLVCA9t8d4JUiO/hKDVVagxk+GUZiqvnv7b23vQd5iinqq8+M4fEtbRSYL2ARC
 RPVzjeWoboTk/n+pYien9X7LlXfU0EzmJ7wmrgJaUvG0BbeMryiot3DgUDwFrDocYTKeArjwFRQ
 4J2jmqW+pTR4YRry3t8PGsgmV9hhQBoXc29Bc9kfmGI7WKfQ3te3dM8zhY9VUup6TY8i4rInDuH
 Y68uuG873NGP9Y8bCU1M1icrLMTdhdHq4Rd2RPTxZK0Ee7rmN5kDrmfMTncXhTJu01RBNVIkUvm
 i8rTiZmGv6ZD4VDLoGAgH3sPuT6ULrPgzjH/arGhRRbk5QR9yvtwC1f92I8geUMEpHFEVMQr/UO
 PjgKhQpKXt1E6HC6R5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131632
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security release.

Memory corruption, buffer overflows, uninitialized memory, use-after-free

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.9

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 556ffbf22a9915e86f5923564ae75644ba0ba207)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../c-ares/{c-ares_1.34.8.bb => c-ares_1.34.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.8.bb => c-ares_1.34.9.bb} (93%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.9.bb
similarity index 93%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.9.bb
index b86b0976c2..386d916466 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.9.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "c222b6d681096f9444d2c4863d2c1174019e27cacca0a4a5c114d36dd7d7bf78"
+SRC_URI[sha256sum] = "9364b70a12eb59a06830fb488d9357f90100dff0d98b23ea3593a183d43e6f2f"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.55.0

