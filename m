Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5611.1793252783486105363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ToBlAvgF;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eyVsSthj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GqYZ3294103
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7u7pUi/Aodc
	F/MLRSTbhElgDiL2C5Jbvsz8ogJtEqzc=; b=ToBlAvgFjsoH3TTi+6hsJS1xhiJ
	9ZAG9BjVgZkdvIz9rFYIWpCtohaVN5IteSDf+Cuhcy0CdFRF5FBczVB3KPsSjSkh
	hZwIS98R1cg+sERA0HLDf48WJg2W53nrtEum3dI7lWVAwSPDPkXeHLXLcYlPriLm
	2WbmAZdPj3AIX43lJ8x6n6at9ny2V4syBeAM86vFxAEhJbI4l16NXPrhdASe/o88
	wvM9jdnZv1FhMSfoiGFDLgZU+uKaBj6Y05CQs5hXYjbyQUTBDQE4x6yCwO3qTo23
	NmVX+O/gTL/TEjzMLJ2l2cDyhm0TPWUCsexLNQ8GEdYtr1gIuXFVTNWXqPA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshr996-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so1552671eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 22:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252781; x=1793857581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7u7pUi/AodcF/MLRSTbhElgDiL2C5Jbvsz8ogJtEqzc=;
        b=eyVsSthjgGjo7e1ofX3RYMO5jnGhhbpaGyju7HzlfMmdLPUNd0RHk+74M2H/lMl2qd
         5rv5sHMeD1sFhLU0YrtPXxsQe9Rl6sHZRFCzvR75jGoO5rz7vI136D0gKT+NT/gHCtaY
         iCOcxAM6TjJDyMREsbOH6H7VFzq3iNPewMVBqBKlBt0GeNiWRv63it/aXKBo4WYeRbXZ
         TeHg89LllNxsICcMxG83sybT0TQjv1Jdn36RE7o+Vtqsrw4xg8mi8dWaNyWMC9iY2sU3
         NZsfkoTxufCm5/yXCrpZpViSs2JHkUKbLIvjcWeKqRrO7pWwsDptdug6UuPvLPiCeAMo
         ygvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252781; x=1793857581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7u7pUi/AodcF/MLRSTbhElgDiL2C5Jbvsz8ogJtEqzc=;
        b=EI9Oh6uTCCbr4LBKPzbYTfaZdrvqakrb62u8DVqrzjvl+JInUvyCsb5EXDka3xRZxl
         iUdZblW4He9siZy/GeG9AHvU0O+tiNTmHgvKbgZ3XeRtCDXgWtX7n3v+yLRX3B2U5RZu
         nendE4umZGYE2506xi44TzK+/BHp9BjBN4+oz2Mv7u1F3AbQBuGt9ddmBrsDU3LiTmMd
         dX7Cea7pgaYZ+Ap7UtLxOmN5zQzmkGxHRR4WQwgehnXvOydl97ViqxbJ8dujy2Qd+7uE
         YLa9sPopenu6bP5HHEFQzhTGB7EeGuEyooudB05bSlnIRAG9mq0HOmwzRdka4ZbwSCUI
         Hubw==
X-Gm-Message-State: AFq9FYI+l7cNn0jUUksK9cHow56L9yGS2H8uW6iXRxlb9+fJlWJcqnjW
	mGQO/E5f9rXThRf1oxMpIMWCbMFtyvaagfjXbucIkSK31MUNzF0RkNaU/aot1ayGHMwa8mUbI2a
	uiDq1pJu3ImIydwqGg4e/Lzw3STx6/aY/pRaWlAHPmp2NLKlGN+WLK0AuWY0HjHfCU4dB1Scm9h
	98SwZxHIaTK5AxQtMbTOxVVw==
X-Gm-Gg: AYBFou16IFdYj1ucqDiOczWhRFmM+Iy81q3wkdJptItNC+BaAM4GFSzOisG4It15k8h
	yasKQ73AnhExa46X0o39DJD+ATqJuuqVVMDTf7lj54/hYBibYbGGsS3dt3UDQ3tO43zXzi3hqMs
	Sfbf9iU0YqsfDt40efU2WHH3gdhCqa4LFz/k9+9pdRMSe0HBplcFC5xe5FLcw7oKFyuUsLbFGrE
	KevMz2X8u5Rngr3h0C2h4G7r6MZQmpqXn5TowcDYB8H7ikYbdqa2YB3CX8Q7sboRMw6YyPV1/GK
	KvzGOJZm5D5pmfx74gnC4XtqwVhD7knfgOvPV8g1i/kuqM83lRcXE0Pfl1PeHw6kJyTppncL6K4
	4LuKXFodQfqztlHLKL5NFbVA0HuWHdCW2rGt+CLHYcHgIfWabdo702UURKbiQshUH33boD8w0S6
	MPl8sP
X-Received: by 2002:a05:693c:88d6:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a2043440emr6692534eec.16.1793252781077;
        Wed, 28 Oct 2026 22:46:21 -0700 (PDT)
X-Received: by 2002:a05:693c:88d6:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a2043440emr6692505eec.16.1793252780407;
        Wed, 28 Oct 2026 22:46:20 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239d3073sm15670298eec.29.2026.10.28.22.46.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:46:20 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 3/6] brotli: upgrade 1.2.0 -> 1.2.1
Date: Thu, 29 Oct 2026 11:16:09 +0530
Message-ID: <20261029054612.2642345-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
References: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Yvo035brSMzxZqhitZE22QUcZOuxjwUB
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae2ddae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=nZOtpAppAAAA:20
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=puEJAWS3Ic2CCawLBr4A:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX6e150J8O92/K
 68P2oHBIx7FeHNRZpppPJyYrOxHiGR+3mPd6AJVk9J7EDBr9zc7MniTeExGwRvXo8Zf9B0ZiLf7
 I+Mor7Z13PgCAmwNe0L0ba56l2v4j/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX77P614fE3SJa
 tEECtzvjRVQXhpyo/hKot3rDvx4noHvUM20t4l4qM1p5S/A1fxHaGV5SV3j9FS2QUVAfgnsaXGZ
 JBSjp3944/r72ubI3CUXshRCZu4QSvghsqEopNjgFmZsSKGmYubonmSaSZEXibIrTW4eVkfJzow
 rrAROelxGh24UA0VzdwPOxzwMhcFzlOSBwr7SPa0Ehh1aHBsh5OTi/J/l1Y1f7YcBdVn1ndhXw0
 VgrinPusEILspznY7S/DsC+bGv9WXpzgO1LT+7me8q6s4qqY7/Cuc71NBrm9xditpK1cAGL3Cx2
 u2quskLkm0ApjzzcADv7jpziuommxhkpIDzScIX0u7iDO8xXbgFBJ3r2L5mrXCquyoJCOdk7Agj
 71OAkRMsn9JYnIecvROXcsVmSRYUzEIPogWfBUXqdagBQ2hsjmRzijr+KRVknvtRrnY4qNJpngY
 GuWHc4puKkgqj0fSpIw==
X-Proofpoint-ORIG-GUID: Yvo035brSMzxZqhitZE22QUcZOuxjwUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131634
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security release

CVE-2026-111497: out-of-bounds write permits remote code execution

Changelog: https://github.com/google/brotli/releases/tag/v1.2.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b5d66bf60d7664e5fa15dfabcfdb7986ea83d386)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb} (79%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
similarity index 79%
rename from meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index 84495a3236..dca16cb79b 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV = "028fb5a23661f123017c060daa546b55cf4bde29"
+SRC_URI = "git://github.com/google/brotli.git;branch=v${@oe.utils.trim_version('${PV}')};protocol=https;tag=v${PV}"
+SRCREV = "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
 
 
 inherit cmake lib_package
-- 
2.55.0

