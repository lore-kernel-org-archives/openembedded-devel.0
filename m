Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4898FCCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 10:52:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13106.1760525569070737621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 03:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=soBmssfC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23832ef90a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59FAGDh82381211
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 10:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ypw97Cc/b5INJnEU0+Zi
	JDa/Lzhm0KYMIVd6ZRdA2O0=; b=soBmssfCP1RA8Jfg0zQBjDdnEH8c3z0HJVa5
	1E45ixMEGtMzLAO+lOUjDlM2xkh9YXj+sPmoEHgmfTjMkrMop3plfNP6PBc6M+h+
	jNUoN5p0CErW6UN7juWfFhklx2loCHRXV+k5GTdgd+VeKFcLTAbOsE4IGChnq7ri
	bLEhylqGC89zmQjyWx/VCU4jsxan1kvX3L/AI2gvom2C59g1NSkJrHUGpJN5ifp9
	7FOhBZ7PWcCD91iNO4TvPNoY5HbT13zUasR3oVtI4amJzyrEspE86oHamifbBXiA
	17EHiceFvfF/iZSkAVGMbQI78OInq+Zo0vWyatrOT+w6kI4zAw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewmv5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 10:52:47 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 15 Oct 2025 03:52:45 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] poppler: upgrade 25.08.0 -> 25.10.0
Date: Wed, 15 Oct 2025 16:22:24 +0530
Message-ID: <20251015105224.3330995-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: 26EQPgI50hB7YEMP27z5jHzolLvpGQ4t
X-Proofpoint-ORIG-GUID: 26EQPgI50hB7YEMP27z5jHzolLvpGQ4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA4NCBTYWx0ZWRfX2/BV2mcW4tRQ
 TzkXSsizEegYsbxLWiR2qbXiOLtYL2RmaO/z30QhVSMw9H7GK5PClnx9G+dDAlktGWxe082S/Yi
 uMH7pzZAIK0ImkJkf9d76ZEd2d+7dF992OJfiAatQOv4IcVytVWb9h/d0VmnP1bIxGA78eU6ehH
 XQU58QRHhHVpNmxTiOGW7Xe8u0Nplz9zJSAeoELkqqzSbXzpI64ud/JBvd806Q7sngfx89xk/YH
 e9F1J9cLzjY8ocm+9jD9eY4LWGqwATKUMxszkL1Ao0Bnnl1CfBleuOOu9vEbz2UCUApptxhFgqK
 wEM/VK8nJTGBkwT3J36Te8bezBPQI91gqRCc1AcjmaEASCU/qucIRVD1hDU+hz0cGliGDvhtEYp
 WZa0XK5Ay+9QbUFK0hd1P5Jj0Po0ag==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ef7cff cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=PuugbkLkHdoYriwtOMgA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120705

From: Yogita Urade <yogita.urade@windriver.com>

This upgrade includes fix for CVE-2025-52885

Poppler 25.10.0 Changelog:
=========================
core:
* Fix image signature getting lost
* Don't embed substitutions for base14 fonts
* Form font improvements
* Handle signatures padded with random data
* Add feature to Ink annotation to render with multiply blend mode
* Internal code improvements
* Fix crashes in malformed documents

glib:
* Fix signature text
* Add feature to Ink annotation to render with multiply blend mode

cpp:
* Added embedded_file::unicodeName function

Poppler 25.09.1 Changelog:
==========================
core:
* Internal code improvements

build system:
* Fix generated .pc files when using old gpgme

Poppler 25.09.0 Changelog:
=========================
core:
* Speed improvements when reusing the same document with different output devices
* Speed improvements when reading from network file systems
* Internal code improvements
* Fix crashes in malformed documents

glib:
* fix ODR issue with enum

utils:
* pdftohtml: Fix text positioning. (Regressed in 25.07.0)

build system:
* Better pkgconfig support for static builds

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/{poppler_25.08.0.bb => poppler_25.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_25.08.0.bb => poppler_25.10.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb b/meta-oe/recipes-support/poppler/poppler_25.10.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_25.08.0.bb
rename to meta-oe/recipes-support/poppler/poppler_25.10.0.bb
index 45f94b0ae7..29a5f33e81 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.10.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            "
-SRC_URI[sha256sum] = "425ed4d4515a093bdcdbbaac6876f20617451edc710df6a4fd6c45dd67eb418d"
+SRC_URI[sha256sum] = "6b5e9bb64dabb15787a14db1675291c7afaf9387438cc93a4fb7f6aec4ee6fe0"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
-- 
2.40.0


