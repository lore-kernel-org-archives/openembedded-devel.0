Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5379C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 17:40:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.247.1633542007861168180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Oct 2021 10:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=m7b/XQJH;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5913098f32=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196DvGes010098
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 6 Oct 2021 10:40:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ePdMRAUjKP5svNaIkD2MOuJW5XEYk4BknlNTKaRCZl0=;
 b=m7b/XQJHHQha2K1fk7Z4ESVsOb3eTNF870t+e87NfjEgp4J4h8OeBUHppWxaVgj4EkWN
 sEDCfHJaOZ86aqnLnV1hprLnkvLuE3verw3R1O32auXPkNYruGaGUFDZCpA2beCM/OSd
 QjOERalpZccugmEPpnV4MjQdL4+M74DZ2+LuxpabSwbrgTygnrhtxXrGLbXwKjNQvPMq
 XDoBnsYPfNSsKVxwIrGVNVArPfGn7+U4PEBMVAFHXjah/hRK/XyW9nyVZs2AncLwF4MU
 JHaClUPoFJ8A/FX+1/a84zUHCXkwqQ/yaT2uFntz8MIhAsEpJuwAbO04U3oBi7LuuZv0 oQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bh2x70tmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Oct 2021 10:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPeI1NGVmH1eftFR7optQvGSu3sCILPjmM1WtNE3kfwFIKr2huJ6LyQinEbJOoP+hXk7WgGaGk1CusJm/ebctzVSGFJZsZ+3dq5jKlCJatkA7tYRJwoZOhyN6o1HCQ4U1i26gGX5/asPKZpKDMonzZZD8k+jjqAGI62SETs+WTRhTa1B2c+5Xz21r9WbRt8QBPwVbUkEIaJaWw5maHPCehN7sqXVtPCoryMzlO2jBPdosiXPNiV0edcmz3NHxo2mel+/mlSAl8/9y56VUmMyr6yc8LlufK8CxM1AEbSqYm9OMxLh9Fe6guB/J4bZvVFKK/K9FE188oQyLRmpkVNvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePdMRAUjKP5svNaIkD2MOuJW5XEYk4BknlNTKaRCZl0=;
 b=YUd8909+V5LpAb6MBKFQML80aDCEa50L8ugBaYusZLYwG5XM1z7TYhLAJieH2J/W785YmJN3zWVJzQhMFltc2KuYGv3Gff9xtb/Qj8MAJpmP98KSoUG+Bwc10dGpybI62q4q/uul7vCmDyPhDjJkvq3VBTeMwWiki1rOSHt8nDMey67zKaLiNuNEzvhklsrpAO5+VVmDQnuFxTC9uvq62q3IeZrlGKXHNK0gb/zrFTS4HivF2sX2e+fL7+TEaU/qxe37D0wefEU6sVpQhgOEAPe2Ll1jytTDy296FlqcICY3/w9JVgLRo0V6mDOzgtdZCiwGAbsrfZODn15ZQ3KB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 17:40:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4587.019; Wed, 6 Oct 2021
 17:40:05 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott][PATCH] python3-pillow: Fix CVE-2021-23437
Date: Wed,  6 Oct 2021 13:39:06 -0400
Message-Id: <20211006173906.803601-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0327.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::81de) by
 BL1PR13CA0327.namprd13.prod.outlook.com (2603:10b6:208:2c1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Wed, 6 Oct 2021 17:40:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25d9e628-f5bd-4572-3431-08d988f05535
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816E80DB36FD09F71BAF85F9FB09@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gdu6cWc/R8bu05/ht8sd6EdDKBC3QyYRwi9eNxo+acojRm7c9SMMbm302mxPkEOCtQxFzV4rHViiJPi/1wDwUIV5Nmq3Dmqwlwf4vdStW1ErpCfPl6AL3RRwjEZIEYbcW7KLx1bkzxSM0ZH+e96jsIjewfcurNsgbn+GaRtAu9GFv9Aq2sW6Pm4yAqJfY2nlB/Z8PhhOAEXYyeGQWgOdlGjbb++mkvTHEjI5riPApSmypClrq3msYmhQTALPUOXtAuMJ79Hpf1LN14vZApIHIlNc3MkcUy9OUvLiU0uGfdT+V7v6qPNjBzJGRkg7m/xeILOh80esgtiG7YRFGf8eFr3FB1bGs6LPWwihvWol/aFiCg0bhxWcbtV/SHmVa0yoRhh0+LfY32DVTfFvZyMNunjbZWyKwv3R4uZhCGXfxSarBWJGDjGpMTbreYie4aZJQoEUqmkIL/YFre+8o/ZBj8+i6bmWKGbayhLT/TFGt4LSbo7LuF90aKyJVu9udNZZGFK2syoqtQWZuTtaBBBQOUn+11ISDCXMvxojPqrxWHQDJP7Ki/WIuNbLqZgEjBmig+JU20L1vBP8c+oLSjJScykWipoQ/VCvpDWKVMn2L/+5ZWlc5mdCXvaVOQbCZwSw5K/LjzUKwkMTEcHEyvjTLHT/O5ttJWoImy4jiK2atKpCDhVXYxExHBQGgMp3vUOobopVPgEQWkTFOdrrkus8AVN2Y7VJfrfXiv5zmJ9umuk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(186003)(8676002)(2616005)(6506007)(6486002)(6512007)(86362001)(52116002)(1076003)(66476007)(36756003)(66556008)(2906002)(83380400001)(8936002)(38100700002)(316002)(66946007)(44832011)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4jl6ZAKOJODInT3zHjxPFPXisLk5E3r/iWYnppUHD/welOhW86PSZ8YS/D1p?=
 =?us-ascii?Q?Pt3xD2ashoLDG+djzqRq6sHveHz3cjfId+f50ZwqHMCFGpTXDt2pwqYauy4i?=
 =?us-ascii?Q?F52Tjuw9EVoFvzFScGKVUp/sbFqqYshqyIn6guAYZ3uE+JQK82z2xjSLKrzC?=
 =?us-ascii?Q?CbftLPDa/e+dJg8zYQFyTAI9dGMOx6BcxoUV3glEj3+vVvBphvxkuD8pl+dV?=
 =?us-ascii?Q?jDvr3MyP+pkjKS1INgNbEJs2Khg2exT3y62LA7YlGxJpYYUod/fNV3dd3oo4?=
 =?us-ascii?Q?rM2QOd8wer92oZToRPJMAe1G3riWdSTfpTFBlvTXn/7e2wxeXq+tVVstJ3Rv?=
 =?us-ascii?Q?FaMtgSOeeguUBuLCWPYGbeFO4XKRkA07BOei5awYqoot+ZLJo1ue2je4YnTj?=
 =?us-ascii?Q?FSGJzLHJoQb8VG4cFvCHaEcXAuWSvsFu7pM3vQnqEfGw1K8g6Rk1b36xMXbI?=
 =?us-ascii?Q?US3diNLsErP2jkdq/p5Pb0HWDV8iacjgqnOmUSRgEcwQllsTsIHLOngYkKaI?=
 =?us-ascii?Q?l0bS1KXWcpjU2Mo0YtHImJHl4aw1E/YX923o3SIJ3WHCFIpPB8PkzJ3mHfmD?=
 =?us-ascii?Q?cxNagTpUXFgHTd/uFncOXKUnc1Tmqxe7+SwIr4WLfpZ3FftufROQqN/a9GtV?=
 =?us-ascii?Q?Bi3WEzHN6sjut8xCQl0qw4Exhyg42rNiUEvvRNUNe17mChWdCalwmou1hEu7?=
 =?us-ascii?Q?QQYKO52+61WS86uwKlb+PNW1DheFj4J3bhiOnqGVNPPphb8wzsEp8oqYdT0+?=
 =?us-ascii?Q?b7dgLtQv0Xqef6Vl2O9jA5oS1cSWH1+l9kw8zL3D7GhkKEchAyLn9duJv3Ld?=
 =?us-ascii?Q?ESulclEqffFJ8eAU6iAkFkRnBPy45ZadSuxuZNKpVb0kdaUs87lY1irfpCkh?=
 =?us-ascii?Q?cKymcLmAUCi12pJNYgFxJPpmVXYLzrg9Ks32PgeQCzezRdgmmOwvZ8wI2e7H?=
 =?us-ascii?Q?j+oYFpVrObRf3Yvl7Q7ssnrJn7ggsjN9uLx+tElO28Tx+pRDvtTmhZYlfzWB?=
 =?us-ascii?Q?CYrVZ7SqC9mM/Ogi5zH/dEk6YWiU4Olc4mhWhlb2BNdtddLlvRkKasch0Ud9?=
 =?us-ascii?Q?llqGBXJ5xHlrVGnbLyJxtFI6kldwpm8QSxlMJsFWqIAmPZa4FjpoPcgVEs23?=
 =?us-ascii?Q?oIQiRa8/HN5zgyETcZ8wkjFqmYqvjGgYV9ARGcgcf6H/iG/hZOlMZQgnKg5N?=
 =?us-ascii?Q?4skBMdujSZtmnuh+ZyZRboUcXcCWVha7dODFstteHi681vAygQwe4j7c3/bR?=
 =?us-ascii?Q?BrK06eHhssymJM27J5q+41H1XVAAmcCRxy/+dQBxApz5tVPuZPWWC3mX306W?=
 =?us-ascii?Q?9o+KhqQdQjMdLh8bKMSNF5oSgxmjFWforbCvSYUpt7Qwkw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25d9e628-f5bd-4572-3431-08d988f05535
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 17:40:05.4013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BConIvrv6rqPiPpTxhA6/taBX4lthfbHKt2NUuCOZBTWizPuv+k/8/UjnXb9zObDigXKH/o7nDinY/YCNertIqVfpeA4V/eQzKjtkoQz4ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
X-Proofpoint-GUID: tjurLSjXaFrQfpuBPUwTm4N1grOhlnzZ
X-Proofpoint-ORIG-GUID: tjurLSjXaFrQfpuBPUwTm4N1grOhlnzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=963 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110060110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Oct 2021 17:40:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93202

Backport an upstream fix since an uprev would include
potentially-breaking functionality changes.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...Error-if-color-specifier-is-too-long.patch | 49 +++++++++++++++++++
 .../python/python3-pillow_8.2.0.bb            |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Raise-ValueError-if-color-specifier-is-too-long.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Raise-ValueError-if-color-specifier-is-too-long.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Raise-ValueError-if-color-specifier-is-too-long.patch
new file mode 100644
index 000000000..91e16f541
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Raise-ValueError-if-color-specifier-is-too-long.patch
@@ -0,0 +1,49 @@
+From 9e08eb8f78fdfd2f476e1b20b7cf38683754866b Mon Sep 17 00:00:00 2001
+From: Hugo van Kemenade <hugovk@users.noreply.github.com>
+Date: Mon, 23 Aug 2021 19:10:49 +0300
+Subject: [PATCH] Raise ValueError if color specifier is too long
+
+CVE: CVE-2021-23437
+
+Upstream-Status: Backport
+(https://github.com/python-pillow/Pillow/commit/9e08eb8f78fdfd2f476e1b20b7cf38683754866b)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ Tests/test_imagecolor.py | 9 +++++++++
+ src/PIL/ImageColor.py    | 2 ++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/Tests/test_imagecolor.py b/Tests/test_imagecolor.py
+index b5d69379..dbe8b9e9 100644
+--- a/Tests/test_imagecolor.py
++++ b/Tests/test_imagecolor.py
+@@ -191,3 +191,12 @@ def test_rounding_errors():
+     assert (255, 255) == ImageColor.getcolor("white", "LA")
+     assert (163, 33) == ImageColor.getcolor("rgba(0, 255, 115, 33)", "LA")
+     Image.new("LA", (1, 1), "white")
++
++
++def test_color_too_long():
++    # Arrange
++    color_too_long = "hsl(" + "1" * 100 + ")"
++
++    # Act / Assert
++    with pytest.raises(ValueError):
++        ImageColor.getrgb(color_too_long)
+diff --git a/src/PIL/ImageColor.py b/src/PIL/ImageColor.py
+index 51df4404..25f92f2c 100644
+--- a/src/PIL/ImageColor.py
++++ b/src/PIL/ImageColor.py
+@@ -32,6 +32,8 @@ def getrgb(color):
+     :param color: A color string
+     :return: ``(red, green, blue[, alpha])``
+     """
++    if len(color) > 100:
++        raise ValueError("color specifier is too long")
+     color = color.lower()
+ 
+     rgb = colormap.get(color, None)
+-- 
+2.33.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
index 40745bb76..8b3a2996f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
            file://0001-explicitly-set-compile-options.patch \
            file://0001-Limit-sprintf-modes-to-10-characters.patch \
            file://0001-Use-snprintf-instead-of-sprintf.patch \
+           file://0001-Raise-ValueError-if-color-specifier-is-too-long.patch \
 "
 SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
 
-- 
2.31.1


