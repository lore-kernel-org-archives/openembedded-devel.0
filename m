Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C567C87FD2
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 06:29:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45132.1754548184075862911
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Aug 2025 23:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03146cb354=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5776Igvi1002708
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Aug 2025 23:29:43 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7hp3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 23:29:43 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 6 Aug 2025 23:29:41 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] poppler: upgrade 25.06.0 -> 25.08.0
Date: Thu, 7 Aug 2025 11:59:14 +0530
Message-ID: <20250807062914.2838677-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=689447d7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8
 a=Fi7xCRcZbbY3uOdkh6oA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2uJRb1hNY_1oA6YYz3SspzxPdfPgQlhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0OCBTYWx0ZWRfX0G28dbiRATd6
 C2RufUHhite9NeYCtPl2tvm1z3kv7XiCZaStNlwicw5BZb+nJDxkaTroj68zX63GBmR0DZdPT6v
 OjfC23dXWPfCmIoKTv2isl2At7MOHS7bWSGqIzYRcrmHA//PA/69jN/jaC++G3j9FxpgXYkB5fZ
 pa/Dgk3eixDK2HHoCntCIWOUwt0kPufz7I+RoAfGdSta1UOdqx/iQ2SX2KedRw2HNRZ3kpObzYx
 j3awEKoMPoD4KKg9DWx72fsCP7u4wAQnGocvoaaV8ie6Hb5UYbOO6Rfs43ccUI8HUGiQ5I8KlQT
 hqofiey+x+nduSezC/NnQoMadtzETyXcrJsgOjd0FkNZ8vXcFw+3T5Bp/GrAuE=
X-Proofpoint-ORIG-GUID: 2uJRb1hNY_1oA6YYz3SspzxPdfPgQlhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 06:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118894

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


