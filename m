Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D593CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 11:52:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30018.1761565919461495310
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 04:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b0x6CYHS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2395d885ba=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7FpMs1021443
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 04:51:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RtbJAgeDd1XcoTuIt3tD
	1jGutsCaBlxsymPwynaSoEE=; b=b0x6CYHSSWK5W5ijb5FCYyXGUWrjt59paIqN
	S4HGM17UBfjpVG1iP0O71hqCeO4y9ySSvo0S7vPT3q9uRG0YrpwslFDq4YghTd7t
	xJnlUBDWShLO1if/osYS2Lr8ilovy4H8XLr51CJkgCwDncI8AUSvNAKwNOHhy8cI
	W7JWNadd4L/yqxWM7/41rb9M6ScK4/e27uW5nR3dtXgW7rVuCVIrtVClgM+B7WBm
	l1C4WlgAc5r4ylQZoBSwmU/KA3SDbGzW1Y5C/KaX/D5Ny73Vs5ovDXO4wcy8yrXb
	v1K3VkX3wg90Vzkj/vJMw0n1asuy4qmT8sqeTwEx230CkqwQIQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0su1hkrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 04:51:58 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 04:51:58 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 04:51:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH] libcamera: insane skip 32bit-time
Date: Mon, 27 Oct 2025 19:51:57 +0800
Message-ID: <20251027115157.1941609-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SuadKfO0 c=1 sm=1 tr=0 ts=68ff5cde cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=O7o7S3CWejkxAzTINhcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMCBTYWx0ZWRfX3cyj/1C0OwvR
 M9tj79JjMjRWiRNre8UHEHCpf9/YnE28EAIhYTCMJir7vBGGK1eSl+SooG9HrI7VsN00yUeFDf0
 gmd4ri6UqOcJqlcRlY/rON63dZU9/XOzxvAho3VCgdgPxFj9tNMFqHKrIkS3hgDvFkD1K9akJxz
 QwqKTvs2arZpr/Ip+zRrHVrJG4wqQJ5i13FSDLWEad7JtKhZC68sJuOR9WFdVaE1rfusRYddLIg
 1dFVTEsJ0AUwhRHcGTQEKrYhn+IvGV8rKu5Pij+MO+93nhln8g7gWqhx4t1Eqv9NA5+BbI83Ltd
 q14PsSO/yjaf8pWTS55ItQ65hjC93JHrWhq3HoXuoEl8GOv4lzhZ9pPWLvKjEu/QvKq00RTBuiP
 tvRAAe7cXhCKyx1CYIFiojlI5aCYOA==
X-Proofpoint-GUID: 2JLIDsV7WU8Iw3kQa3IyS4bpesbjQn0s
X-Proofpoint-ORIG-GUID: 2JLIDsV7WU8Iw3kQa3IyS4bpesbjQn0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121038

$ echo 'MACHINE = "qemux86"' >> conf/local.conf
$ bitbake libcamera
...
WARNING: libcamera-1_0.5.2-r0 do_package_qa: QA Issue: /usr/lib/libcamera.so.0.5.2 uses 32-bit api 'sendmsg' [32bit-time]
WARNING: libcamera-1_0.5.2-r0 do_package_qa: QA Issue: /usr/lib/libcamera.so.0.5.2 uses 32-bit api 'clock_gettime' [32bit-time]
WARNING: libcamera-1_0.5.2-r0 do_package_qa: QA Issue: /usr/lib/libcamera.so.0.5.2 uses 32-bit api 'ioctl' [32bit-time]
WARNING: libcamera-1_0.5.2-r0 do_package_qa: QA Issue: /usr/lib/libcamera.so.0.5.2 uses 32-bit api 'recvmsg' [32bit-time]
WARNING: libcamera-1_0.5.2-r0 do_package_qa: QA Issue: /usr/lib/libcamera.so.0.5.2 uses 32-bit api 'stat64' [32bit-time]
WARNING: libcamera-1_0.5.2-r0 do_package_qa: QA Issue: /usr/lib/libcamera.so.0.5.2 uses 32-bit api 'fstat64' [32bit-time]
WARNING: libcamera-1_0.5.2-r0 do_package_qa: QA Issue: Suppress with INSANE_SKIP = "32bit-time" [32bit-time]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
index 8b8d6815c5..0c6941213b 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
@@ -83,3 +83,5 @@ FILES:${PN}-pycamera = "${PYTHON_SITEPACKAGES_DIR}/libcamera"
 # libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
 # both 32 and 64 bit file APIs.
 GLIBC_64BIT_TIME_FLAGS = ""
+
+INSANE_SKIP += "32bit-time"
-- 
2.34.1


