Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A004E83054
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 05:18:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10357.1770095875323304622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 21:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CCzJO+ee;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6494efc79b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612NSgYS4145086
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Feb 2026 05:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Z5Yd5kkllSkwkajp9+lW/lMXCGSmJTV4UDrsWMCnT4o=; b=CCzJO+eeSvRb
	g6rhhQJbxB86V+FXVdq5SUUkoqTl/XzKHU3Lpnj4hgs0Vdjq/uaqF/B7LKdb7Oy0
	bsE8DEiTBVPBF3BSC+nP4qLkI3i/xxAYmXSInRiRa+YBpp5HpKpJxi9VYk4zfU2c
	Lf2GhAN4P3uPxQAGNd0ftm7Gl6+YR7KKeU2CF5x6i5Gf8eBCMEi3X+RcBftKTCcF
	m7wgUluN0Y14ELGdEEcCBnZuO9quhO74AdDVhaT7yb3IOxcM6FMTyWlM+XdkeJ8j
	HJdF/BASghwIefbJhYR0t/8oA7CjtGAewTXzPJh14PiePBq/TmI/7F3N9XCzUCxF
	v4DSj6tyHw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c188jtw4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 05:17:54 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Feb 2026 21:17:53 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Feb 2026 21:17:52 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 4/4] agent-proxy: Restore DEBUG_PREFIX_MAP in TARGET_LDFLAGS
Date: Tue, 3 Feb 2026 13:17:50 +0800
Message-ID: <20260203051750.2669415-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203051750.2669415-1-mingli.yu@windriver.com>
References: <20260203051750.2669415-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5RsdJhGCSg1cMz3gyUoX7drlYHtnAFc3
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69818502 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=VwQbUJbxAAAA:8 a=i-9a9D3IVuNCmu1U6-kA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzOSBTYWx0ZWRfXxRskaxEMAWjv
 69mOIV1FZiBvXv772BYBZuzqLYikZZfRliyv2smGjiD3YxmjCtrIgXVW8TK7CSQmN1zmd5uFreg
 mJewOXRK4ANrONpR4g3igEhx0cZAbrbPOixmWGlg2A1nRqXA4D/mR2elwWLJdvS8P05Go+juR0s
 1X5F53NYoJPqjoyLUuqaf5rFuzha9yO6XHNIKnBNorvEBLEqExnb+EFvKo9aHzwRkjSreG2ApB6
 vhV2Q3MR8wWnHDHfYFGnKP8acmvIFp3rYLaq0eC0rpztPPum7M9Xlu/GguNy2hrtFkGnyel0D1L
 j4lLSrDr5M86VrneDTRgVGCoxq7qVbTnDRP+nAEH+FEQ9VPtc3Xk7go63QaEvOrtegnmh+iSeJ5
 13RFGFCeiYvyovxIyiv8SihbNzJq2M8KVcvV83kkkFJVsB4RtYcCV91n1361bxuyxgErGTd0NAA
 hBV9P6h34SCVBLKNlgQ==
X-Proofpoint-ORIG-GUID: 5RsdJhGCSg1cMz3gyUoX7drlYHtnAFc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 05:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124096

From: Mingli Yu <mingli.yu@windriver.com>

oe-core has removed DEBUG_PREFIX_MAP from TARGET_LDFLAGS [1], restore
it to fix the below error.

ERROR: agent-proxy-1.97-r0.wr2600 do_package_qa: QA Issue: File /usr/bin/.debug/agent-proxy in package agent-proxy-dbg contains reference to TMPDIR [buildpaths]
ERROR: agent-proxy-1.97-r0.wr2600 do_package_qa: Fatal QA errors were found, failing task.

[1] https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
index 8e0d6442f9..2ad41da957 100644
--- a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
+++ b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git;protoc
            file://0001-Makefile-Add-LDFLAGS-variable.patch \
 "
 
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 
-- 
2.34.1


