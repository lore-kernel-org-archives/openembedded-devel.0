Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A651BCA0FF2
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 06:45:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14813.1756363525629496790
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Aug 2025 23:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DUryxYz4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03356deeff=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57S6NrPH3319873
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 23:45:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=tCtJshwdEBN+hIipobWW
	1kQDmGd7zf6zFRhWoHULh48=; b=DUryxYz43MHzuGFloH99Wi/RJqCVKjXnjd15
	cld0vSpRecOoKW+lS9o5AsIW4K1Xc7M3NpjTeQGjiyVKqoaKp1gGLGbcIyC8HNGN
	L2YH1BOtEdeESMztk32ajrtVxA0AOhTG8iqa1KvsoPrHtJXl0+4MjoTQBx3QVVEH
	8GjOXDwbz1+aLskL2jL8jDB59jJuqwcAc44FbOvj4vL6D1V1GU/tBhOI8NG34Eyk
	E43GV27dYgIUSQNKcPqYtkCOLnASIFfRmEJjhHbEAdd8JXCAyAY3KcF5cvAqf4Kj
	l9zhcWjkcYjKkVUojNQObdZpJqIc4DBV7b0arwmscEdgFm4m4w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x25cwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 23:45:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 Aug 2025 23:45:24 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 27 Aug 2025 23:45:23 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-frozenlist: disable the support of ccache
Date: Thu, 28 Aug 2025 14:45:23 +0800
Message-ID: <20250828064523.114335-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jbxDbDPvSXmiRGpj61apeaEd38T9Nubf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA1NSBTYWx0ZWRfXxMOkBXccZVLv
 p/Ib8YJd4vovCdiJdRO+y5GEuwgTzbQk8ZBRhIyAPOH5nRWDOZSI9Fo3IdlqcLWsJF5VkTzvVA8
 DJAYX+2N/eGXXHr/IoFTOlU/Sdz9YVgJFOHB4j2RpbxvAs4l3E2deeg4gPugyWb4O5R7ejPikqW
 MT0c5HTeTWRt+FbGQXTsKTYxpN5xIg7n8on1hgdkmsoX+tC2mB1apVJeoxZvF9yN+3nhzrjiq1D
 2Nat5TTedZ26cdxrrkwiHxvpK4mkfqQhBGboyIgV5SegQo8IIkYEo9QWH0LiBiBiRFmOqzzwuDP
 spxWdQ2pEnvuc57eUMB0JBCr0Y7n9DwjpVWD9wzOlq8hCDN/anVdyrZl0lfpyw=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68affb05 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=o61SJuroe5Y8OR-TlL0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jbxDbDPvSXmiRGpj61apeaEd38T9Nubf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 06:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119127

From: Changqing Li <changqing.li@windriver.com>

With ccache enable, python3-fronzenlist do_package_qa failed:
ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib64/python3.13/site-packages/frozenlist/.debug/_frozenlist.cpython-313-x86_64-linux-gnu.so in package python3-frozenlist-dbg contains reference to TMPDIR [buildpaths]
ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib64/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86_64-linux-gnu.so in package python3-frozenlist contains reference to TMPDIR [buildpaths]

Although we have set -ffile-prefix-map, the buildpaths is not replaced.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
index 7d813a026c..363dab969e 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
@@ -11,4 +11,6 @@ DEPENDS += " \
     python3-expandvars-native \
 "
 
+CCACHE_DISABLE = "1"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


