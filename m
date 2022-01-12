Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEC4C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 08:11:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20490.1641975088154283230
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 00:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=MCSvV19p;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8011dad649=zhe.he@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20C7lkKp022642
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 08:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=V4CdHafouiiLPlGuJm48xqSlImURRl4K+BDc6LNBdWw=;
 b=MCSvV19pLjKvImqYo18lS0qIRFu+cxIzmxeUtjHypdFdv5aIj2hnhDKheEfs+Li93piM
 Ur3ZoNre1nri5otKPKUjO2yAz7P/xeEj5TVG8z0uUTGkKkUNffM49OUUCHgb09AjQuQA
 c/PWxedhF7a5SqDjfZ7rjubnk5UbjkrE6QWo5dtEL1Hphvgpt57o6YkWyvwGHdn7FXLS
 9LWNMM5GW/pK6k7/DdVYRKK17VtDqyr0VyvIa3aypSSa5l9WV2pQ6/+KdCECazKJ/D2q
 bHrbHFBMsFnXkZ06J372TcFjYJb7gnRBZMVC1SNwpK5h2xPcqFMyleRURSsqssgeNblY ag==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf000w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 08:11:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Myhz/Hg2K+34nH13d9Bmd9lE0lz+aQWDsjhT6wZnGWkgjv4jfKYIHqJPnerWYeBCJr42vF48rPZO6aommi1FZWc+ZEhlNd389MAKQ5Wy26493R8TPpQ4rWY0QddOd0YEa0A6K48ybv8Wc9xu7puYxlQmaILy2ZoJ0VvkS8OSt3XUcuRq9ZLIAngphfOrSgnkEF8++zgz8XSfWSmQudgcpo4OmJuQ3dphMjPrvSHLBjWPbeP2QQnmbqpsA+SP7xzPI9X3+PoyYOBGsS7XWXO+8qrkgjBxNlIE+uhW1Ecyj+Ag9RnfFiVEWbnUAVgSH8bO621Cnv5YZHs0QNzXCm3NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4CdHafouiiLPlGuJm48xqSlImURRl4K+BDc6LNBdWw=;
 b=MrQAA+sekIbwHU9u79vZx2c7OiHTtJTgV3Gqqk24/au2Ivzx8loMcllVH6tHR+82SI+PJ2BgNM0plQVemdxSWfYw2LEOr9jFcWajcTds6l5jGNh7Nsq99ZUlWFc/NNz9Pbu9HDLFLjpEs58Nf8Q7AEWVnQEDHKkeBM9OZmjz/ve2ANWLk7MTBUKlmdFtWTWV5pZCAnsQTnngHLQbzHy6WLbq/YKyc0f2pOQtmYo8zTroeU2jeXwGbpoclC/O+JM6i7xMx8pJKYQ2yidMZHOo/gJxxqAEe/jZ7jcNRYLf2IRpOnd1AkyjwNqNnN4JtcD2qLJv+sb4dqgV19CbnvqfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 08:11:25 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 08:11:25 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][hardknott][PATCH] protobuf: Fix static init fiasco on
 3.15.2
Date: Wed, 12 Jan 2022 16:11:06 +0800
Message-Id: <20220112081106.9277-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR01CA0103.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::29) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39ade847-850f-4751-d363-08d9d5a32058
X-MS-TrafficTypeDiagnostic: MW4PR11MB5822:EE_
X-Microsoft-Antispam-PRVS: 
	<MW4PR11MB5822416BDBEF63675B8EFF668F529@MW4PR11MB5822.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T1qiKlBE2srWC9D01yv3iVVj6/qL/YBa/R7cdjaJHdE8EpmelohpVAJcGSBUb5zOsVKLamIPezpWk5Tnl+3L9DmTLAyrYPzd9BeTI/UoGMiG9iVJKuZNsrqSN3Okwt5pj3S748Dsuatd5xThUPKwr0zAEM3PAPezNhLMddtndS1ovQ7yTFv1rLreEGi9kwQBQc6jQsDtGxqKn0t1iZEmU56XY/PL7O3kHq3DXGIXCo9VGBFwtBBr4f/L1dDHpOGF1TEtSEdyKramszGzOGQL/J+YE+uELQv827BScbmq2+zhXK/11qMt2l+O4v6sBfysdgaajxZdxXmx694BdsNzUnvXVXJqEJtL/xIega/95NpCrG3Sf9c9lKzauAfk2X8M+d2ihIiNndZWGTWozWdFwxAq4PxD6UhQaBBFQhpsA1+/FSZLwkV3Uq/E6C2RNfPusWFkgmxfy/+NnmWXIXTB1iEhWLqmBBYsmgsUEGMiYqRmxGwRN90Mh6pJWUYbFB8dScifKICRM1eqKDS/jBgm/+EzLBS+TpZp5Gx4dONyZPuucfE7tMEwAwLUTkNbv1IWjRRjxUKL4ZloP11W6z4Oe6lvdBmsRA4cXbfVQ4D9xLn/xjR+qdKpjtH1e+lF5qZ4k2uw0fY3INyaQv9WBOS57CHWvJxoiNGmdqlpfFzz6cHI0njr0bRwjV2+M2V/lDAPscqJWbFdnA9RXQ13NK62AA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(36756003)(52116002)(83380400001)(86362001)(38350700002)(66946007)(66574015)(316002)(6666004)(186003)(66556008)(6916009)(66476007)(8676002)(6486002)(8936002)(2906002)(38100700002)(6512007)(5660300002)(2616005)(508600001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NkV1eW9Ma25EOGwranhhK3FhaTB4N29GTndUSWNOeE0ycUdmeDdkSnRYYWJK?=
 =?utf-8?B?dnZNalV6QVM3SlFwVmpVcUNBTWxhcDR4TXFadEIxcTFpQ0tEOHc0NXk1a2Ft?=
 =?utf-8?B?S3o2OHU4ZXZvYy8vMlRyZUFKNCszbFF4ZEkrZWppc2x6ME1TSlZFK0oyQ2pE?=
 =?utf-8?B?YXIySHlaVGdsbDI0MVVTcXlOTVUyTGRZVCtWeUNKMXpjNk5vMWk2bS9UeCtL?=
 =?utf-8?B?aDNOeEQ0Rmh4MDJjcTd5dGEzMHRVeGZjVmZxcmw3K3Y4ZmRHMjVYN0d2cGov?=
 =?utf-8?B?YTVuaEROYXhtb3V1OEhRSUhPNkhRNFBqazdBbjhlMy9lN1pUTHhXdUJVZ0lU?=
 =?utf-8?B?bkZJRWRkL05ndFRzemQ4Tk13dUlTeUdURkNiV1A5Uk8wcW9YVE9yRmc0N0Rz?=
 =?utf-8?B?YU5RMzhwUm9pU0owUVEwd2lHOEFUV2g4SEk5Q29JNTdibXZIR2tUR0VZdU92?=
 =?utf-8?B?eDNQRTFwTHlUYUJxb2lnVG1FN3ErV2F6YXNSUkszN3YvK1d4cW9vVER2T3By?=
 =?utf-8?B?YVJHWkJld2JCbDgxRVFIMkVHYi9tNmQwWmtqK3VnVC9QdzcrM0pmdjllbC9n?=
 =?utf-8?B?OFRGU3JpMEh4WjY2R3VZZk1PV0owdG9OdTFsTHBUOTlSbm5tdlZ2M3ZzRHBC?=
 =?utf-8?B?bG9hRjFKTzRuak1kZnhtTmMrcUF6RlpDT3pIeklPbWE5T2xueEkzR0I2c0Zz?=
 =?utf-8?B?RUFzVmRDZkVjWDVqRzkxZTdEbk9zOEdiRVE3N0RiN1B0cCtIK1B5T0ZwK1Ra?=
 =?utf-8?B?anJwbVVjYmlNQmtLcDdrYmtBYjBTS295U3Z5bE1VbFE3SXhuYTdSd1huc3R2?=
 =?utf-8?B?bEo2a3QvcDE2KytSQU9COU9XblhuSXhraWt2d2lEbGV2dkJFdjNma28yWENa?=
 =?utf-8?B?M2hKcUJpU1hNSTdSQmNZQitXVUhqME54UGhubFFZOUVybFdWOGh0OWdiV0hY?=
 =?utf-8?B?ekFnVXphY1dFTEdUK0t4b2NZa1NxOTVpdXVrem9GNGszbU5EWUpIVXhGSVpy?=
 =?utf-8?B?OE4zYU5uZFRrdExMaUwvRE5PSE52eFlzYjZ6LzRRbWlaTUJnaGY5UiszOXVJ?=
 =?utf-8?B?STBPdkplTzRGdHMyRUZQaS9ML3dDY2N0TUVaYmsyZEdIaFFDUnhQOVNVMktU?=
 =?utf-8?B?K2ppazNpWCsxbXJDdHZIdDBiemw1ZlBzMkJRcWlsRXY1eGh2MjBmR3VOeFVC?=
 =?utf-8?B?RUxMRGtZckthV3h6TzB0RWNrZnNncXAwcGI0RlhFSHJRcVRsMGVIT1RkbTkz?=
 =?utf-8?B?NWU1LzFoMjJQVThvNXdsckVyUzlwbTE4dDRSelNSNVZIK3c2VDhCeG5DZUJD?=
 =?utf-8?B?TjljTVM3cWhaUzRtbTIrUWVQU01mQmF6Kzc2ZkZjbWdTdnhkOXZuMTJzNUlo?=
 =?utf-8?B?dHQyQ0R6ZFd5ZWNVeXgwMDNBd0dsbVZWR2kzUjloRUpYeFV0dDFkR2V1dUJQ?=
 =?utf-8?B?OHlCdWFJM2dDRTQvcFhsQzI0Z2tVMm9tZGRxaHlwb2tZVll1R0pKZmpzSzV3?=
 =?utf-8?B?ZVFCQlZmSGpXQXkyL2ZqelhmTTFKNmpRMmR4N2RuS2NLWWNSQ1R0WWRtays2?=
 =?utf-8?B?YmNiNWtHVEc1YTdTMGp1ZVdsT0JvckU0UDZtY3dEaC9RZ0EreUZmNHVPOXhm?=
 =?utf-8?B?V2hpR1gzVXNGeHM1ajNaZDNtWm5NdXBkbFZUaktXWFJDTGwzYzN4M01PdUh1?=
 =?utf-8?B?eUhrV0haUWo3WnVFcEh5VEdodXJMKzBvNEp2SlZsZlp3Vlh1ZmpaVUFQNS9L?=
 =?utf-8?B?LzNZTEkyUms1aEJtV1RFUEZhMkYrUXdBSkRNSEh4Ti80M1ZkbkdHTDczY3BF?=
 =?utf-8?B?dXpmc0JEMnFjSGFXUUlTVS8vc1N0NkpKc2lqcW5EMHJmWEl0ZjNsOGxWTFda?=
 =?utf-8?B?Y2xDeWxNeTZGNFJsNEo0YmpMYUMyd1VYQm9aSFM0ZWpaVWs4UlA2b1ZXNnJu?=
 =?utf-8?B?U0pRSDVTTW5ZQ1hIbzNIUVRMUG1nT2pvOTgrc0MySlZkS01OMUlqb1NETG5j?=
 =?utf-8?B?ZUREZVFJdmRURmZtekxhcXNJNytEdEZCZUYweTVmSGV3STNKSUEwYUVwb1lI?=
 =?utf-8?B?MVFPMFRDVTViQlYyWXJobzViRTBqQ0loaldaUURsS21xN2VkQno1NVJmZTEy?=
 =?utf-8?B?NWREWWhDV3NRcTZycnVjbEdnUHlWRFo4eFlIN0hPSkljWWxYOCszVWFENkxt?=
 =?utf-8?Q?etKlz4JnZIJOYM1MU5XvXhc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39ade847-850f-4751-d363-08d9d5a32058
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 08:11:25.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r/7ENQMyU3suwdbA5f5FEPqJFxCVnPN9LLaf40/DsJXDFjMv17CDYiZ7Z3QmYY0pI2qAaWBeRLjRIr640DPghQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5822
X-Proofpoint-ORIG-GUID: wmhPhRhQjG2yXcad0u7CIh-2n5f36IvP
X-Proofpoint-GUID: wmhPhRhQjG2yXcad0u7CIh-2n5f36IvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120051
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20C7lkKp022642
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 08:11:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94779

The protobuf 3.15.2 suffers from the C++ "Static Initialization Fiasco"
issue. This patches makes the extension attributes have a higher
priority than the attributes, so there's no possibility of random
initialization orders.

Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>

Upstream-Status: Pending

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...r-init-prio-for-extension-attributes.patch | 81 +++++++++++++++++++
 .../protobuf/protobuf_3.15.2.bb               |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower=
-init-prio-for-extension-attributes.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-p=
rio-for-extension-attributes.patch b/meta-oe/recipes-devtools/protobuf/pr=
otobuf/0001-Lower-init-prio-for-extension-attributes.patch
new file mode 100644
index 0000000000..9f4fd71796
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-prio-for=
-extension-attributes.patch
@@ -0,0 +1,81 @@
+From 00362d12edf1b7fde723b041a4569dc659e65ad1 Mon Sep 17 00:00:00 2001
+From: Jani Nurminen <jani.nurminen@windriver.com>
+Date: Fri, 24 Sep 2021 09:56:11 +0200
+Subject: Lower init prio for extension attributes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Added PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY in
+code generation for extension attributes.
+It has lower prio than PROTOBUF_ATTRIBUTE_INIT_PRIORITY to
+ensure that extension attributes are initialized after
+other attribute.
+This is needed in some applications to avoid segmentation fault.
+
+Reported by Karl-Herman N=C3=A4slund.
+
+Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/google/protobuf/compiler/cpp/cpp_extension.cc | 2 +-
+ src/google/protobuf/port_def.inc                  | 7 +++++++
+ src/google/protobuf/port_undef.inc                | 1 +
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/google/protobuf/compiler/cpp/cpp_extension.cc b/src/goo=
gle/protobuf/compiler/cpp/cpp_extension.cc
+index 3792db81a..cbec19d30 100644
+--- a/src/google/protobuf/compiler/cpp/cpp_extension.cc
++++ b/src/google/protobuf/compiler/cpp/cpp_extension.cc
+@@ -174,7 +174,7 @@ void ExtensionGenerator::GenerateDefinition(io::Prin=
ter* printer) {
+   }
+=20
+   format(
+-      "PROTOBUF_ATTRIBUTE_INIT_PRIORITY "
++      "PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY "
+       "::$proto_ns$::internal::ExtensionIdentifier< $extendee$,\n"
+       "    ::$proto_ns$::internal::$type_traits$, $field_type$, $packed=
$ >\n"
+       "  $scoped_name$($constant_name$, $1$);\n",
+diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port=
_def.inc
+index ae9fef425..f1d203707 100644
+--- a/src/google/protobuf/port_def.inc
++++ b/src/google/protobuf/port_def.inc
+@@ -154,6 +154,9 @@
+ #ifdef PROTOBUF_ATTRIBUTE_INIT_PRIORITY
+ #error PROTOBUF_ATTRIBUTE_INIT_PRIORITY was previously defined
+ #endif
++#ifdef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
++#error PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY was previously define=
d
++#endif
+ #ifdef PROTOBUF_PRAGMA_INIT_SEG
+ #error PROTOBUF_PRAGMA_INIT_SEG was previously defined
+ #endif
+@@ -596,6 +599,10 @@
+ // Highest priority is 101. We use 102 to allow code that really wants =
to
+ // higher priority to still beat us.
+ #define PROTOBUF_ATTRIBUTE_INIT_PRIORITY __attribute__((init_priority((=
102))))
++// Some embedded systems get a segmentation fault if extension attribut=
es are
++// initialized with higher or equal priority as other attributes. This =
gives
++// extension attributes high priority, but lower than other attributes.
++#define PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY __attribute__((init_=
priority((103))))
+ #else
+ #define PROTOBUF_ATTRIBUTE_INIT_PRIORITY
+ #endif
+diff --git a/src/google/protobuf/port_undef.inc b/src/google/protobuf/po=
rt_undef.inc
+index daef09bc4..d0c613b55 100644
+--- a/src/google/protobuf/port_undef.inc
++++ b/src/google/protobuf/port_undef.inc
+@@ -77,6 +77,7 @@
+ #undef PROTOBUF_ATTRIBUTE_WEAK
+ #undef PROTOBUF_ATTRIBUTE_NO_DESTROY
+ #undef PROTOBUF_ATTRIBUTE_INIT_PRIORITY
++#undef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
+ #undef PROTOBUF_PRAGMA_INIT_SEG
+=20
+ // Restore macro that may have been #undef'd in port_def.inc.
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
index 62c6ee0159..ac4e1ad84b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/protocolbuffers/protobuf.=
git;branch=3Dmaster;protocol=3D
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-l=
ibp.patch \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
+           file://0001-Lower-init-prio-for-extension-attributes.patch \
 "
 S =3D "${WORKDIR}/git"
=20
--=20
2.17.1


