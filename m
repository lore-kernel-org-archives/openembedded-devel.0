Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06D5C54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 09:52:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.100068.1673344336371992272
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 01:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WUZiIdoI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0374116d68=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A9ow9E029918
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 09:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=BiZNp/cOhr31sAYYW7vrdhDLMKI52Yt58ByAZHusY0U=;
 b=WUZiIdoIPfwtp+z+McFEgE4OAZJORz6UehbBdQX5UcSSfUShMfTKWMpBGqyrZ5E07Mfd
 nMne1Hs8U5ZcbCLodFFksoHwr3PDXzUx06wZDLEgqqYqBcPr1XAyd5ueBHbto9o/o2k1
 95q2BuSzwRLRoFy7IfKBBSZhHpyHG2JIMCZnFce4w/r1TMCY8V+Ft/yKWa3Lc54bqGkn
 WS8mamieQcggyzlQgq0twShd5/ytAC9sUrYkqCWHcGl6wvOtJl77D/c4Fa3rFKhkG7gS
 KYHM9GiNbWRYgNOJtlFMmYHlhBjqzJNq2IjNkDJynKALhun7K08d/4qqvGAvIiFgrOd6 rg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mxwy2jp22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 09:52:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWxT5jzaoI3hCI/5SQg+y9shz8COVL0m4bjZoGLqHmZGcxQa75mp17rIy7pTp8D2G/5SIa37pt1eCo8FKcrWgphD+IYZEfc5eMfdcAljf5yuKDKwLgN/g9dgtUcXxdNqLBpJc5wWZOzAe4TkI7Pyy+sbTWL356Gc6nebC8vI6TNkqQ6bnE51oEYIHenWJzxRfxoUyUQEJW/O++6FIh4pCEK00+OUUkRNyChQ8ayO7ef+IlJQm+jSayfwUvUZNHwLIHtOWsFELfqvq24ii6/tIrUxlB8TWsbbX5cRYE0boGMRJ4GD9ob6U2zbtEXdfBkvDuU+T8HLHzoYtzrrZD+l4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiZNp/cOhr31sAYYW7vrdhDLMKI52Yt58ByAZHusY0U=;
 b=RtY/azsubnTxLodxHab29Bl/KIGnMC1TvnfritLl5JVYMY0LaLzwqjpIALXB5VstxgpveE/WzAIilhJHhIP/Ed7YYG5Req/1ltQZzdMLzuXWYle1MgOPnf4jjeqhzgJJqlLxVhbI5/l5v8q2IGvUqj0L5ONAzDX8HVwsgG8wUlk/evTdxGX/VQ1zwbzu0NLkaDArMJz0WP/H2jtPZi90E+LAhQpbRGE++E5I4rcu/G1QNjncvq38S6c6oFTcywL4O51OLJlSvjvUpnrwOzFIWh4RnxfbXCKWs/RwNMjseQQjFOkyOoJ4MkYZfhIcMSDLqbwUBsymRqxT83cuErxF+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:52:13 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:52:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: upgrade 5.9.8 -> 5.9.9
Date: Tue, 10 Jan 2023 17:52:02 +0800
Message-Id: <20230110095202.528276-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0180.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA2PR11MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: c548f739-8254-4a6f-4122-08daf2f05990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+MDJ1YxPrCtn58w59Owj+1qPSPo7Dw+dEKbu9fOjBsHtNBehQaPUzEjB/VHEjaE3r6sMwsAiRQ163QkW8xXpBXm8SnR7DFkd1LYzVdPlFAqTpT3D+mzwgbVwHFi13aK7bKSQpy1WSZIDfX+uCt1SsJS51Lkb4IwOYWC23svc3dr+Nn/vRG59KPyaNBZVrWCeUAB5V2QqYJJ4V2GMFHT+QV05MpXMbNNYkUIuZ5375tPAwXBtbj3UYQLEsSxrS5L8mmZwFyrq5JdYPbXbBG3iHTV3PSh3pautbLjBlNhJZXwtFOd0pJ4us5R4kKpAzMa8BD5k36oMPdpplvkdmHiircSzbcDxrXfB1+LVOcNWSmWurqAauyU0/nuyRtwPiMVL6xto20Vl2yW+TxkfnQdBVsB0OpkNBBblfMVf1vToWriLbx+X42d88sIQjttjJqeb+dhk+UhCNOG+uqnJqGAmlGlPmgSLoaQ2cO9B4c5Ge0iGJLWvNH6Bi36V+9bxwnkeah5LMYi/N6FJL+CjC/kQUl5vqMirUT6z5b/98UHhwN4aapJmQ7W4wOzFkx9zSccx+wGc0QHrj8qGcPuqq/eAQ1TBclKBcZLGoJ7N8TLVcOLMNoZA2wV8HAK7jhW5mGkc2v4Q3QLubEyF0h3oCmoNDqYln5LWKeN9QpNez4HWDzrFvHNxAnj+YB2jE/2z6K2zorNSlll0eKvRdDoHwQiabCPXRNzED0FFcA+gBH+uuy0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(396003)(39850400004)(376002)(451199015)(66946007)(41300700001)(2906002)(44832011)(8936002)(36756003)(5660300002)(8676002)(66476007)(6916009)(6512007)(66556008)(316002)(52116002)(6666004)(6486002)(478600001)(966005)(6506007)(186003)(26005)(1076003)(2616005)(83380400001)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sn6cOBxn9BHWj2+fJSrBQnyybvNPtMuNq3TltwWLrRYzKjzhBWU48cgrVEqU?=
 =?us-ascii?Q?zm+cfBdKLHJ4O+l5tF/oU2DIK3SafAv9ByvYRC3rNa9ae4cuVAsuA9hsh4ck?=
 =?us-ascii?Q?Yr2zgjesx6RpsNY2sFYflBmNrErSAzPIP2uUTrenuwTA6GCxS1t9iuKs4CQS?=
 =?us-ascii?Q?+w0Vap8D6Ki8U/R0xmkL8rmWq8i7q4toDd3NFzV9Yj3skio5G5GbEMEoD8XE?=
 =?us-ascii?Q?Zx+WU2wCzi98a2ft7ws6h1p36Z0Lga4Yx55oaA2deYarOnEHeiGaUHuaiPpO?=
 =?us-ascii?Q?m9pV7chutDeDFa3KRbT52tSsOu+vQvqdw2Sye++jvJfe9lXD4RPEiJPm9Z4e?=
 =?us-ascii?Q?bQq3pMqvoajSoKOzXITkieyCuABBtaGEgH9DOvnYEb0JdhKwgMG/MF238okp?=
 =?us-ascii?Q?t3JhQ6ZcQsCU1nz30ZB1Ca1p86FkY2eLE6W05gUKcQkoGszvaVkwNlDWt/67?=
 =?us-ascii?Q?Ro71e9j0gPMPoZ+r3xlPvf/SAGfu1vzws+2U17tCmlLsv4ZxuTsUw57kEtZV?=
 =?us-ascii?Q?NyJ2gidSlVhDNUtd6g30xXk2/7Spj5JtfkiB/WNfRZgLWrcTVimw/t0+MbOr?=
 =?us-ascii?Q?a4B8GRnBcjsyShulMZ/3IO99M5Edb/DZjkyVR4h0DVIvk5WGmgKM4vR4423N?=
 =?us-ascii?Q?/jqWGHd3UBitkqIrG2/SwPN7faE8ZLdkFL5i+xtQAbX6GdFS94kJAK3O5o15?=
 =?us-ascii?Q?XMlsLyZahaPMiy7jBE5Ip3qG23hhySf7jeimTz62qukDPVEOPoeNiVCAcqrc?=
 =?us-ascii?Q?VpbNT+Y4LfLWzAzObM+DaFGcWuLf/gUnNlgbtKDcCAKLQ4Tl/922rW/FJ9AS?=
 =?us-ascii?Q?CWudFYKUyeSJf5G9b32DOo4jAoa2eEtAIL+dMThQ+mLJ3y2tOXjaQ1JSteMJ?=
 =?us-ascii?Q?VW1J3dDNNnWmaZUhQN+i10a2TVDcASoR/qlaQJUfBKyDUw24xTy03m47g99Z?=
 =?us-ascii?Q?A2RGKWmZD5KmXEvkx8P9Gw0YMsJXB/J5aQ8lsILL4wDfLPAYgq+AB5qJAYIA?=
 =?us-ascii?Q?NQwdcEHPa1p1kaez1aSUgvC9P/hKWGjA0lByeLlbG79Tq7iwJvYjUG3RH+3p?=
 =?us-ascii?Q?v/Xlstvc00z0afhVMV+1VTFD4NyY+gz/7zChClbgVAErVJ2pyfMYseNAZ7d3?=
 =?us-ascii?Q?Kno6/vUNbzezW/rMrQCXjF1RIQs1kn5/KCwjt7W+qdbl5sn6Jarh8ZWrXVcS?=
 =?us-ascii?Q?DINQ+fVySm9+fRrQ/ZGwjG1/p3Rum3Or7eD+cj72EVyhAwsWhzXbN76jzU/W?=
 =?us-ascii?Q?l86pa6Vkr17FlWx9o303IS+/A7fLlIQOF0LioRrI7FpwDAediQe0n/m3JVrv?=
 =?us-ascii?Q?4AT1gQQjacD5pCyjM/4SXTqDNFcZIPT+nXqe0v7ZS8koDAzC32jL01lm4cbd?=
 =?us-ascii?Q?Twd51PYxlxzGuGP5bbFRL6icxX4OivE/4ELYpXG8b8/98gcAYtWpbkQaHZTw?=
 =?us-ascii?Q?r0Za340EATmTRodu4QIMAD0oiQA81jqoXJ/UU4S7UogicGEO2hEl1GQ0sey5?=
 =?us-ascii?Q?mniTb3f1a4aT8qSLeALoRYWZ0hllU7oLhE1XfITFBypHNlnro2bFTmcQCVQb?=
 =?us-ascii?Q?6EpLGHoI91NwAwcmsNhtMI/9Pl5aNKuRqMBoEsmw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c548f739-8254-4a6f-4122-08daf2f05990
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 09:52:13.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nz7qE/AkjyDO5oitgBSutmBBiR3GTVke3MzH9PtFOQH6yPWQ1y5RpUwpOpPB06wg1wLRmorypmbFijkUDOGtBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
X-Proofpoint-GUID: 6_Lj-nVXeEVWJAkKfXyOVaZv5-z3FlnE
X-Proofpoint-ORIG-GUID: 6_Lj-nVXeEVWJAkKfXyOVaZv5-z3FlnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_03,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 09:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100515

Changelog:
https://github.com/strongswan/strongswan/releases/tag/5.9.9

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
index 266d43aa6..a11cd5a6c 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            "
 
-SRC_URI[sha256sum] = "d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c"
+SRC_URI[sha256sum] = "5e16580998834658c17cebfb31dd637e728669cf2fdd325460234a4643b8d81d"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


