Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB35C4332F
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 14:02:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.874.1633442548445349223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Oct 2021 07:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YaNv+wMN;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=591229368e=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195CuvSL012816
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Oct 2021 14:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4IqtbTRfD/E33JAKH2Dwn+9ivsLslZgE7xBZJ8YuPlY=;
 b=YaNv+wMNZf68+xyHChGipA/5WWqGyAGB6w7I1XMxih6h8dadO2Chf8wYSYqTqnp5ueBV
 oMduNUOZhv2qA82/QROyBJMSYtjJs3i5K41ROcvUDTX7XO6/tMXZp78eGs9yDRSuqR7t
 I3Usr9n/oZffYnqs+FhyTtu0C5ti7sIYdjh/cFhNUYaAQODzfAzIU22ijtvI88gdq4Ot
 54rSemtUsK113rar33U7NSDNvnIcG/zmmVMfK6E5t6wCDzKWxdPCYLqN23qPMSzAnb1e
 /8wEwsqo1VQojpcZBZgb2dubOZUyxiuVnzvdx4qJyI6WB/i8TbBgRKTEO5CjA9o4UG2E UQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bfxmus3xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Oct 2021 14:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYEpvnWaG50766DoZkjaYc1bHhHIdxa0QRU6+TGKBSY9weftpbOYmj/BghRWruQce0HSwvIxAmfADA20Jm0UInw2kzbYIPhhnsu0BXgqpDkATCjTiKprYT3rPL5AhRiyk4p6Y154U/ibB6ExSjc+egtX+Pgj6VrNY/pMWHTb96jp1+18QZI23ljAVYtD0suUO8UFJP3yuYiTs4/fFBIpjcr4nLiy7PBRMtBMAAvVxTDpWvcOhQZMeV23iGZLR4Ddtxei6v3OawGIu0aF0jWG7Yjsq7BNklFUrPTZY2/a0L/G4SRa55Ytez4Zywr7bjTp0/l6Z45h/rE40xdBhxoTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IqtbTRfD/E33JAKH2Dwn+9ivsLslZgE7xBZJ8YuPlY=;
 b=Y0NsWqx6EtS4pdr2lke+2eRqWDtlwljEt3fGiG+PTrGlYrlx5ajzVXrP+l+eynICBYmw2iNO3WzOQdcMOsxAVFSKo+KYWq83mjLax+UFXTYst4+Jrh2nXwkojKQY7ILF0sd/p44H+QwuQ9sEWHraQbzs6IzAFPpKiBX7N9/DHwBwnFKvH2JTdElrkgM2Y32P8FqqCx1rztnXdlUPc64mPBlyd+cOZc7Kkr6E5EmCeWawLL2B9rdDUyrU6wg97i4bbMi+wQdKUWHZwp++9hzNTHIvLH9plGjz79eQdGp4B8OlL1YEY0MINZA4u4Zg2pW1k5L3kB3FJ2DxjwWncAMMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Tue, 5 Oct
 2021 14:02:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 14:02:18 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott][PATCH] python3-sqlparse: Fix CVE-2021-32839
Date: Tue,  5 Oct 2021 10:02:01 -0400
Message-Id: <20211005140201.738928-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:207:3d::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::81de) by
 BL0PR02CA0049.namprd02.prod.outlook.com (2603:10b6:207:3d::26) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 14:02:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91bfb4a4-d370-454e-f265-08d98808be48
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3352D21F95847D7209FB87B19FAF9@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	acbgbQC0fMe+3hexvuGJ2Y263A06JiRUswz8iqS8Oto4th1p3T57BuRWFIJRUmCoOCwbP8z+SbWgEeCUvS/E79NgPXmGxhFkAl8fnzpsUUEgWd+4gBzQtnXG1HtBSdy0MdPEePju5lDOQ3Wy6qdXguUniItuq070AFs9K37NXEApBG5I/mMuNERj8oCA+DTzSGGEr1udPeBNzmBQwj1Xo6nV4eq4o45sEeg0inTy1qOR2HhA9stWWZf35vDXJ0rirDtlCd0iCRIbtFTvtZgg+JHN5mf4YkGnQeBdAi7LXMOJ70BdoyeUzFwGGXxRd0Vt/VD4L8x3t3Kpyts0beStri1eaILgcNKGVrY79UkAZa69ZZRNqdyFiAGdiOHcHbklET7amm2bGV9iUif8D854qSLPhBRWu3hyV/NdLdttAxJsN7nPJedlOEHRiNUsqvRR/aMpqHKf/2bkkPjm9JbDrJJLPLo2FbdtqOBT9E9rCXgaNAo8rJkGMs9BTBVgJCsR1Bj1vLNM0GSjIQj9/DPLu2PC41a5ofiBhWD4NGuQ+b3KS2coM0Re0OGcFyKfEAUTnzeBNCYzAhMP3COiki5knO8tUkkX3TxYmRb5/9K/s84uVYLQICGhl8jNa5BoAKnts6KeNtOPh/v+P4m8PwThZqyvIzI2rODHdTOh9YqBP433kohqaoRYs4klsMz3Fo9Vn0QGOLNqzHUVlGywRYyeSZaiQnDBub/xpn+PaIm6XSI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(8676002)(186003)(6506007)(8936002)(6916009)(38100700002)(44832011)(316002)(6666004)(86362001)(508600001)(2906002)(6512007)(66476007)(66946007)(5660300002)(2616005)(6486002)(1076003)(36756003)(66556008)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BbjZMb7HJgdjeP+Sg2+x6My1fY8VwaqvbiFAGpfgjpjnPiVmLRFG5bZTUHH+?=
 =?us-ascii?Q?5uRsogHyPAQwfCUpsTFibkAAdUK7lnlrpY0U0nzdxa5BWQ69BAmovaikZ/VN?=
 =?us-ascii?Q?+pC4Fihec7qRGVRXZhBqqaCPlc2v/NlxoEjZ4k55wC/IKlJDFzZvIaiqWmXj?=
 =?us-ascii?Q?IOcBs2EPnmuDPUAQuI4A17mg9TEMZbCYYHGdGMfrmzplb2lYmWe9RokGY14E?=
 =?us-ascii?Q?bs9a2GQDwD15MvNI9bZI5sloaTuD1POT2Etd92q/f6f4l2feb+LmeV/IxOK3?=
 =?us-ascii?Q?Q0AsGjeEA6mxx5iVBsj17DB38O/LiOiR+jQioocothff+ye8Z80TJNqLhKzU?=
 =?us-ascii?Q?/wp4KGpJ7MUv56cLKyNcGxmHPGv5qrtAhbF1mEM6QG+T610lzvm5NVM11iKB?=
 =?us-ascii?Q?Z0u5vXncLRd0jW2vAhYqQLeT98aKWLNuyaxOfbhUO0C259Rrg7BLNDvTfOhs?=
 =?us-ascii?Q?wGjAVsMLqSx309LEL6DHPZbrofYEevOT88eOnMdpSppmNAQAwbt+ZN/S23v1?=
 =?us-ascii?Q?vzbmaYJUBvsz22ucly+Q+sdirg2o2w87CTHtgTD/GvLiFOLs2YOpSHfU6c9s?=
 =?us-ascii?Q?w3Qd8GxjuzxG3WotA2xe0d65TDAdqTw64Z6zNzO9uCfy1qRW5Nygi5tXoQMT?=
 =?us-ascii?Q?m8bvyFsawGSnToXedRINwQUhRaNy2ajI37FWA/6SbtE83IuQxKGvsuUNY080?=
 =?us-ascii?Q?XzzkBvzj6xYdgF5Bs55ctPsZ+AF2v9j0AXrY7oBkbJnPRIzouhG+gc4KbFHY?=
 =?us-ascii?Q?Rr9LLd8unZRT8FC9XOgEhVd7duzagZwQsK6cW4krmKiPPaDEyRdYDAnZxwPS?=
 =?us-ascii?Q?4JdkeSg4EJ5EsEadn2KaJi3O2bhzMk0FsR4+MFaemKKB5YbZyRJHBBBmXu2o?=
 =?us-ascii?Q?E24G0wnoynEYYluSmaBSGfZ5d4QGg6Yb7GnRmyUdBKGakH0xS+oAgoGoKxXx?=
 =?us-ascii?Q?E0bdwmGiZsb2NRTO24w37mBVj7wcaL2KrEJ9mBYp3S87YoXQEL79evLxa5Kl?=
 =?us-ascii?Q?IjwN3wkNvNFBMvcSljWdSWq/Ht1eHp6MGsWh+d1C+PUQuTteOium6RcPUFkT?=
 =?us-ascii?Q?7iNYYHWCPTlQvhNXCu6bDtVXYeed8n/JfIfLWIdKnjdbtkxVUz1HbSRLGwMK?=
 =?us-ascii?Q?NoSepSCGk58B3KBYmunWrDRVnxwyC7hthS/33nmDombCf1pcpOLJHkc6Ibl5?=
 =?us-ascii?Q?LMBKpuBCyXmQhUCpfvwelQOQntzheQUoHKNyLxHQfbp5Ed29qWrThf1w0uMz?=
 =?us-ascii?Q?NMR1QQTvDZb7OJe3vQsbQp4a7vuwQOdXAOpGN4GwZWY5KfjaDBH0loKzlkhj?=
 =?us-ascii?Q?cWjANvoYzYedg7zUakU2G+//qmT+kA3zf/Wntwdh3bWweA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 91bfb4a4-d370-454e-f265-08d98808be48
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 14:02:18.4322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AfFNTE+/9WL3ZHZ7qHFD95ID1dYPYPulIDs8NXJA/GA6lxblxEAIUTb7uf5FrjXzExtzW/9088I3HgnWRjx02Vs5n+UR3cNQW1/gNSZQvK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
X-Proofpoint-ORIG-GUID: v1_h4myqCNDB9kJjRfDWfUlR4Km11FPY
X-Proofpoint-GUID: v1_h4myqCNDB9kJjRfDWfUlR4Km11FPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_02,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=876
 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110050084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Oct 2021 14:02:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93200

Backport a patch from version 0.4.2 upstream since the uprev would add
functionality changes.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...-expression-for-identifying-line-bre.patch | 64 +++++++++++++++++++
 .../python/python3-sqlparse_0.4.1.bb          |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/0001-Optimize-regular-expression-for-identifying-line-bre.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/0001-Optimize-regular-expression-for-identifying-line-bre.patch b/meta-python/recipes-devtools/python/python3-sqlparse/0001-Optimize-regular-expression-for-identifying-line-bre.patch
new file mode 100644
index 000000000..735530a8f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/0001-Optimize-regular-expression-for-identifying-line-bre.patch
@@ -0,0 +1,64 @@
+From 8238a9e450ed1524e40cb3a8b0b3c00606903aeb Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Tue, 7 Sep 2021 12:27:28 +0200
+Subject: [PATCH] Optimize regular expression for identifying line breaks in
+ comments.
+
+CVE: CVE-2021-32839
+
+Upstream-Status: Backport
+(https://github.com/andialbrecht/sqlparse/commit/8238a9e450ed1524e40cb3a8b0b3c00606903aeb)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ sqlparse/filters/others.py |  5 ++++-
+ tests/test_format.py       | 17 +++++++++++++++++
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/sqlparse/filters/others.py b/sqlparse/filters/others.py
+index e0e1ca1..6905f2d 100644
+--- a/sqlparse/filters/others.py
++++ b/sqlparse/filters/others.py
+@@ -22,7 +22,10 @@ class StripCommentsFilter:
+         def _get_insert_token(token):
+             """Returns either a whitespace or the line breaks from token."""
+             # See issue484 why line breaks should be preserved.
+-            m = re.search(r'((\r\n|\r|\n)+) *$', token.value)
++            # Note: The actual value for a line break is replaced by \n
++            # in SerializerUnicode which will be executed in the
++            # postprocessing state.
++            m = re.search(r'((\r|\n)+) *$', token.value)
+             if m is not None:
+                 return sql.Token(T.Whitespace.Newline, m.groups()[0])
+             else:
+diff --git a/tests/test_format.py b/tests/test_format.py
+index 7117d9d..70bb805 100644
+--- a/tests/test_format.py
++++ b/tests/test_format.py
+@@ -84,6 +84,23 @@ class TestFormat:
+         res = sqlparse.format(sql, strip_comments=True)
+         assert res == 'select (select 2)'
+ 
++    def test_strip_comments_preserves_linebreak(self):
++        sql = 'select * -- a comment\r\nfrom foo'
++        res = sqlparse.format(sql, strip_comments=True)
++        assert res == 'select *\nfrom foo'
++        sql = 'select * -- a comment\nfrom foo'
++        res = sqlparse.format(sql, strip_comments=True)
++        assert res == 'select *\nfrom foo'
++        sql = 'select * -- a comment\rfrom foo'
++        res = sqlparse.format(sql, strip_comments=True)
++        assert res == 'select *\nfrom foo'
++        sql = 'select * -- a comment\r\n\r\nfrom foo'
++        res = sqlparse.format(sql, strip_comments=True)
++        assert res == 'select *\n\nfrom foo'
++        sql = 'select * -- a comment\n\nfrom foo'
++        res = sqlparse.format(sql, strip_comments=True)
++        assert res == 'select *\n\nfrom foo'
++
+     def test_strip_ws(self):
+         f = lambda sql: sqlparse.format(sql, strip_whitespace=True)
+         s = 'select\n* from      foo\n\twhere  ( 1 = 2 )\n'
+-- 
+2.31.1
+
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
index c8a64c109..aeb9c2350 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
 SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
+            file://0001-Optimize-regular-expression-for-identifying-line-bre.patch \
             file://run-ptest \
 	    "
 
-- 
2.31.1


