Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD771C3DA63
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 04:45:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.54685.1721969123012226933
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jul 2024 21:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79375d0117=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q4U2QT014024
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 21:45:22 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kca3h911-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jul 2024 21:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tcmv7VY19e6s0HTLU99uf64hNXUwDqlg14ejAc73Bc2TlRjN9nKP+c1ygGldeSLxA+1viQlyQ0yi66g7vwrK7DlW7cMtftm8mfJXkvkD1YyvdpV5XS7Zwc2uclLiKvI+qGKdomkBbNz4509usnxOF7JfAiP2t5C8CYzXVALCP6ammvghrU+yevGMibnL+/bEXDPZ3WxTJy3cUhdrQnMg3ozSyvPeqQU5Lcao6uwxXsD9j13Hpewkml5pVhZAEEzcj2/DeG44Y5qMRy5zHdxKGJ1agSLfMJqahzPEp7tKZnDZVnZ9olcApjObTlzEdPldY2N9k4gHgFClB2w7XiqgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JYEjoWnQBRkaeWH+kqPj2d7ca5gO8WoMg+OhJQg0kk=;
 b=TVCccXjlOaL54xXVmfijn77Kx777BUAkh4XGCkGPq0QKRrpNh2W6AN3PG4HHMwUBtS+C+OgbAqxLU4JRjorfJgVkfD92n0fphrp2wqwDXhxD1jD4lm1DhoAlMfspV1+O3K0cgoKaeWySFqWE1pnB76gvrznfr4KMNJA0K2F6GV19kcl44YxiLe7g2QUNddthYAn8YctHO3kNGQ+l8KPy0qtqUKYcNrKQL0cBiOXA+59rQZt2xgMmY6HmxK1dw+Lg/IkIwCQJSR+IEBejvdY6O94LT+yzPZbTePmD0crcB/QOvykMuLKYoofBJJYghwLLLvaUO+yiPpC8f9BoSw1OtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 04:45:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 04:45:18 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][master][scarthgap][PATCH] python3-protobuf: remove useless and problematic .pth file
Date: Thu, 25 Jul 2024 21:45:05 -0700
Message-Id: <20240726044505.4034731-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b06fc7b-d4a5-4412-c6bc-08dcad2dbfa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4XjzaVL13JaxGuYhs64ynOuaQjTtDYfr/wSgvxQ3RGoaxo7eNrfBL3JEm8EU?=
 =?us-ascii?Q?gj1/MX1xGU23ON+G0XiEWdmNTT/kzYgkFpu7pIL6Je0Mja36XYjwMpa1xf+V?=
 =?us-ascii?Q?UzL/af8eyZX7O02IiSQ4RYZBok9/KBlGAsFkUsdx8Et+wVao/mydkXnPnggJ?=
 =?us-ascii?Q?mSXlAdxw9T9TiWdW+pw1AOXwe0U1deX/Xiq7Rv/lmYPjRjGqeEl4Y81hXzw3?=
 =?us-ascii?Q?0eJMFTMJByYn0MA1q9dL6T1Ck0Ra3yqgMhP0DFkd07U6d4QGSpM4I3th2uo9?=
 =?us-ascii?Q?LHu5f1AUqQCyBLJBzD94gYqjbjuGHeQBTg9QJc5Hpr6QTXNXzFAtvcS6Gl1k?=
 =?us-ascii?Q?Lv3icwsrtYrCjFRdOTWZeOWsUqbPn39ZpDmMN4os7P1oxJoLcltFEvyiYkxQ?=
 =?us-ascii?Q?x5FRbDVfR2WjWTVVScqTWe6rdJZflgUcIOS/c6Ec6VosDiMD/FOhXbQMk/a0?=
 =?us-ascii?Q?u5Xq145eZ8om+9u42Avh/9qIfco/MLW60PjELYTNTTDFtpEba9ZBtPEvN3/T?=
 =?us-ascii?Q?YVU5ewslD8SHtd2N15tJ2OQJuDTUca13t+4ttmfvZx4qy6S/YjuZpZ7HOjv5?=
 =?us-ascii?Q?Hw0ihRmrq10i0iB+v1kFFRAZNEIzFz63ZBWK0e9BV2tMEd1EOAV6nd+51uoF?=
 =?us-ascii?Q?fw4utEkYvEvaoxwVL8Eo9D/E+0PgeZ8qGd3uOi4aSDX1xXDVwOYWmFnkg4Uy?=
 =?us-ascii?Q?t15GeNgE1/h4S1aEEzLgelaKFQAprYRd4FurFhSKOuWV06YZ5DCqxsksIslt?=
 =?us-ascii?Q?APcITBxsXsgC7HVoYLMrs28Jh29LQbivZ1UgygzEmCsoN/sJnIRjGV2iP91/?=
 =?us-ascii?Q?weK4JhZE+k5Y9QAUKm+yb83ZaVJzG3qR9g0zUH+NfXCPlHL65U8BaDZzh+hH?=
 =?us-ascii?Q?ttORe5azqnNKduXWfPk7F0BeSPv6RSqwmGRDfm5bdZ4RMMLdLLDA2cwXK94+?=
 =?us-ascii?Q?yrUGxWncwWjvQ7AeeBbgT2zuuZcZpd7O5/dD3oXG5LQt7aUNN9HGvYlKFkto?=
 =?us-ascii?Q?PL34hN6yWu5dsI9OUMyBdcPq1PnAnU30eazMTIPxCS9boRhgMXayMnapQE+A?=
 =?us-ascii?Q?k8KGp8v93kiwPpJfNzG6yxZYbQwwRn/brNn8TWGBa3lqPSL3mR28Az7ZjLbD?=
 =?us-ascii?Q?YwX+q3Qwvhc/7yxTs2Fs8eZSERMUHA08pwS3NDHt31aBwe3FhnRw7463fHt5?=
 =?us-ascii?Q?tZoD0nxgcelOgINE5W4NUVNU3e7swtIk3bzgjRGeupYXb6LN1GlmZRMJ1ciu?=
 =?us-ascii?Q?R5ZmoJzaCvtre3uPqmKDO4S1wsGS6W2++i0EmBnNwGoyA9Uzja7khO8mCyNR?=
 =?us-ascii?Q?WRN51SzWBHawUd5WSqRQgSmHDu2qL/1pCh98Rn9YvLWLtgGN315rG6rPtEww?=
 =?us-ascii?Q?GS5vEfo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AKeR31lE4hV8xaOZZs214czUf/FLcnE+XIGgMDxK4gNPiq3gx1S1Pt5okcnS?=
 =?us-ascii?Q?zDHS7myQl7vkWT+OR/CeHwZ/5KPg5uUHDa6Oy49NTSCG3hmOQh0kIHf9Pcxh?=
 =?us-ascii?Q?lFa5hnjAtbnVDW+4YS9QQBcITgPYpCr+rMOnpaZqMWMyDpxoaIfrUMH1Hsg3?=
 =?us-ascii?Q?kEGOKlsuabunJuSsk4ky90Du8bq/G5SoqmIkvHL7bV3ZQbGOSNKvYU9LT1ff?=
 =?us-ascii?Q?ebn6s17bkPkp+dOysp9MFqxTXW82Ml9Ib54yHDY/4WOFM96xhORkr/b4GSUw?=
 =?us-ascii?Q?CHwbrWyVibC6sgle2amf2MWxbzAhKxDNoqwHE3g7bxVHfo7PgRpvFlgWY414?=
 =?us-ascii?Q?8ijbaCvbiZfr8zCLM8eZIWhAoUnx0mFUCizequIE0OxBFOjEysgKNWcbL1Pm?=
 =?us-ascii?Q?Aa4o+GSXptGwu61pybinfCHVz3OpTRZMtv8LsvyBevcLxxb9UqeSh1WnWseX?=
 =?us-ascii?Q?FAT5BQ1HT41aBMOCARKbFtzp3ZqCDqJBCOgW/Lc9023JdlQKx2uWQmHP4cZw?=
 =?us-ascii?Q?CmTeVnlQ7G5F2hFG83aEiol6SuoBDcBPcriRPt+tJJ6DRyIJFmmOFp8DfPC4?=
 =?us-ascii?Q?gJTtRhDMkGY1Pv0HuoAwP34BrFseVeS1HetDk/nMd0idbIZe+pc5IknSIYg6?=
 =?us-ascii?Q?v3gslIlc+M0rmk51x3CTXEusdHHzZzdwG9EQFZVdAU032G/l01jmfjnlHkZz?=
 =?us-ascii?Q?r8zmt9bsHdUN6KC6xp6Rus/jMloWh8JrH0acuJ+um/fJ2R/q6YclQotDd+CO?=
 =?us-ascii?Q?9utP0d4vj5vUAFMfP/uSsNoMifkWvOIjsb5ZW7NUVEkc3HlzXyNySwJLsPpo?=
 =?us-ascii?Q?/0ddajguRUvLo+pdRqFVeR3wOSXb31Wrc/AatfPCFyfRVHEYF4ro3LS/CeKQ?=
 =?us-ascii?Q?s74tgvTrySLGbhl/zHdADH9WNw4mNwUKw+w/Mm36yt7oxKXzmd5QZE1aFtlk?=
 =?us-ascii?Q?vla4lQ1QwaS1ltKmt8I0XcUkPLQW2uLtISRAT5kFTusUzuQ8TbBKlj8btA0y?=
 =?us-ascii?Q?tEkEo0DlQrUVfONJjaGnBXAsJjDCm0a2Ju5P8mA39hNgpW/uYDzLawJ1jUDi?=
 =?us-ascii?Q?kAngM5zSrNwL9HB30pb2kgbx3Gs1Pss4YHMs8O1ued8iTRdRftMjbx/pOeok?=
 =?us-ascii?Q?0JB+ZtBDd3YgmS19GP7KxqtGIBFbfC254H3QhH+oPmo5MeGAxWz106LXF78P?=
 =?us-ascii?Q?g2euqtq023RUD4xNiSqJjjZDEjTi7yevoELtyEt5GQ0Rpu3vxXcYOggVoAhX?=
 =?us-ascii?Q?Fr4pgaTFukwvp6RhY4A3dPfQZuC7Fdx/gC1BEnHblG0ranL+X21obk/zm325?=
 =?us-ascii?Q?7yImv2zr8DUafZaRlwVxSN3BuEgnCIKKM07dOzQg1z2BLPlaLMn7KmVCExa/?=
 =?us-ascii?Q?iwhAwL3VXloz+K0HNtzgrbkcdwNtIqc4rQm4+Lpe1sJ2KUsRwHK+TfGQICsq?=
 =?us-ascii?Q?TtNBJxjMNxaB9U5bZ+CVk9oayaZRHKMjhm99o/aAN1D0Q72fTF/NIB45WRry?=
 =?us-ascii?Q?vsVk24UUzrKJfHnE8n0a80PHqH1KvyOi2HgmnFoEf+NvjdRnhHyFW2onOhb2?=
 =?us-ascii?Q?4h5vMw6i3QXZ5WJ3pEIkENgAth7HmS5+dAj5QTx4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b06fc7b-d4a5-4412-c6bc-08dcad2dbfa8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:45:18.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xeKnyJrBQxQI/1oKC6tNYIYKOPb0jtL8IVvHTV/RuXnXlub2lw/4TFrVnW0TAxJlaitb+fin+dpxXqPxa+ZWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
X-Proofpoint-GUID: dz7Ti5xE3hCBp3O6EtrQaHnSXY1hihIP
X-Proofpoint-ORIG-GUID: dz7Ti5xE3hCBp3O6EtrQaHnSXY1hihIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_02,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407260031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 04:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111437

From: Chen Qi <Qi.Chen@windriver.com>

Our python3-protobuf is installed in standard site-packages location,
there's no need for an extra .pth file. So this .pth is useless.

What's worse, this .pth file is problematic for python 3.12 ptest. It will
cause the following test case to hang forever:

  test.test__xxsubinterpreters.CreateTests.test_in_thread

I've filed an issue[1] for cpython. Until the problem is resolved there,
we should avoid packaging this .pth file.

In fact, Debian also removes this file in the rules file, though their reason
for removal is likely that the file is useless.

  rules:  find $(CURDIR)/debian/python3-protobuf -name 'protobuf-*-nspkg.pth' -delete

Some more information below, just for better tracking:
1. That .pth file is way too complicated according to .pth design[2].
2. The subinterpreter is not offically part of python, at least for 3.12. The PEP[3][4]
   has not been accepted. The test__xxsubinterpreter is a preparation for it.

[1] https://github.com/python/cpython/issues/122220
[2] https://docs.python.org/3/library/site.html
[3] https://peps.python.org/pep-0554/
[4] https://peps.python.org/pep-0554/

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-devtools/python/python3-protobuf_4.25.3.bb    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
index b9b03badd..c234ce577 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
@@ -35,3 +35,11 @@ DISTUTILS_INSTALL_ARGS += "--cpp_implementation"
 do_compile:prepend:class-native () {
     export KOKORO_BUILD_NUMBER="1"
 }
+
+do_install:append () {
+    # Remove useless and problematic .pth file. python3-protobuf is installed in the standard
+    # location of site packages. No need for such .pth file.
+    # NOTE: do not drop this removal until the following issue in upstream cpython is resolved:
+    # https://github.com/python/cpython/issues/122220
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/protobuf-*-nspkg.pth
+}
-- 
2.25.1


