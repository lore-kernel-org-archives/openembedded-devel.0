Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427FACCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 10:50:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13074.1760525441645721848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 03:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RQP3WDXn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23832ef90a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F50eYS1102122
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 03:50:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ypw97Cc/b5INJnEU0+Zi
	JDa/Lzhm0KYMIVd6ZRdA2O0=; b=RQP3WDXnLONY1Sc4ItER2xOC5u++hL/2ecHq
	S3nkcXn/MxXVaODsfzIWxOJshlyUncdrBFc6E60gdoLMs7maUlWvEbpY/eqTIqp2
	MYI6yFm7kxcVR9e/7SbqAKvsOQz12DLOFApUSycgW2IrTtImRKo5HDmN9XHY1SQF
	mj5dJTAODjHuGTYcnm8ejhqOdz/DRQkVlFceI1gR/0kz5Dl8NMkXMBUvLWoqqtCV
	Clq0GHuDFlol4VYmawxQwlkIv6hrz+okHGiNP0Bofd+pZQ4EALHdVtovfdt1Zj4Z
	ATyXgWqCyfTSV8PB3bTHOXsWf3H/l+dhfitWzDIq6wN8dsqm/g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1mkmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 03:50:41 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 15 Oct 2025 03:50:39 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] poppler: upgrade 25.08.0 -> 25.10.0
Date: Wed, 15 Oct 2025 16:20:16 +0530
Message-ID: <20251015105016.2904403-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA4NCBTYWx0ZWRfX1MGW/+or7R1R
 w0BHrbGEIlZuTW2yD5Ir7rYuJfp1VK+UZa2QapJ97I0au4wMY/i1ALw1c4IOKDsdYFjbAXbCdFf
 ipkynd9eB70sohx1hVIYKVzYEqeX3jxBQjJO+zOPVLvOqPqpnN9lQyABeqWLETRsJy+YrwQOmm8
 AkBWZoaVPlKg+m8YmXalzfgUseqwBjTQWlXWHhiuCfgKyXSr+QfQZ877SZR7AFwwmNEwzr2gasX
 t6ENQeBj2pIgzN6000sDiBvuV+xGbqJq64Eox37qOnCcKCVMBguAAr1h3rGYzI8qxJtX/wk1q1O
 VGKY5w+NIm3zAywsTSTCwUbPaUgK6GOYTn8vRFbsDASdmMtBL4bo53JvLvBbSgHouw00Z6cA/ko
 6EUHoeAP78mcV2KV+IlXA6bOO3cSIg==
X-Proofpoint-GUID: KzbRgeH39J-WMGdZv1FyrarSmFvlXuhW
X-Proofpoint-ORIG-GUID: KzbRgeH39J-WMGdZv1FyrarSmFvlXuhW
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ef7c81 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=PuugbkLkHdoYriwtOMgA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 10:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120704

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


