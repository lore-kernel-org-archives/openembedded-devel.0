Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569D5C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 10:01:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.47626.1754560866507139994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Aug 2025 03:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03146cb354=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5777oOEx1154670
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Aug 2025 03:01:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7htp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 03:01:05 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 7 Aug 2025 03:01:03 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] poppler: upgrade 25.06.0 -> 25.08.0
Date: Thu, 7 Aug 2025 15:30:37 +0530
Message-ID: <20250807100037.2287466-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=68947961 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8
 a=Fi7xCRcZbbY3uOdkh6oA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Skl0OBuKnm2bySNb2ZeVBRpzsVChvnC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA3OSBTYWx0ZWRfXx0ejo4xh6j0G
 INEPko8s3qycO1gjeQmTdna7DE16zuaexmP/qUcCfp6aTv5HAyWN/LwdCd6dyqGh8YD+IEvtXyp
 igdZy9QEX6wo8VxowLrSyQI14HzCwnu8tMGq/V5QehdQuMdT9DiFued6tNEsT6FGOmbTUK8nPJp
 VNcHijASv5+PcZQst5yHMfOAxWiG2XRowMrXjPjUBVSSRwt4PrBUHMDF7BKsAQZnowszlI0tfjo
 rEuHO5+GLjFi/W5IBh2fhfO62pv8iiU0qF0nlBB7ak7LynfDcES3l7WbbhcMPq0tE+Hcygk2JOr
 6Q0w8lE+t2mSy7h81Qc+MtKZSB/ndOSIx+6DFJ95NLMqDKcXbCXbzi8xogkEjU=
X-Proofpoint-ORIG-GUID: Skl0OBuKnm2bySNb2ZeVBRpzsVChvnC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 10:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118897

From: Yogita Urade <yogita.urade@windriver.com>

This upgrade includes fix for CVE-2025-50420.

poppler 25.08.0 changelog:
==========================
core:
* FormWidgetSignature::signDocumentWithAppearance: add imagePath parameter
* Fix parsing Distinguished Names that end with a hex string
* Fix crashes in malformed documents

glib:
* Add poppler_page_render_transparent_selection()
* Add missing since to the documentation

poppler 25.07.0 changelog:
==========================
core:
* Changed rendering of malformed documents to mimic what Adobe Reader does. Issue #1602
* Improvemenst in signature validation in the NSS backend
* Add more detailed output when signing fails
* Internal code improvements
* Fix crashes in malformed documents

utils:
* pdfsig: command line option for allowing PGP signatures in GnuPG backend

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/{poppler_25.06.0.bb => poppler_25.08.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_25.06.0.bb => poppler_25.08.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_25.06.0.bb b/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_25.06.0.bb
rename to meta-oe/recipes-support/poppler/poppler_25.08.0.bb
index 9ab9b926b7..45f94b0ae7 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.06.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            "
-SRC_URI[sha256sum] = "8199532d38984fab46dbd0020ec9c40f20e928e33e9b4cc6043572603a821d83"
+SRC_URI[sha256sum] = "425ed4d4515a093bdcdbbaac6876f20617451edc710df6a4fd6c45dd67eb418d"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
-- 
2.40.0


