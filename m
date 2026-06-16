Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1937FCD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 02:58:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146180.1781578716320092583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 19:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hmT0V4Ol;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0627e9f081=li.zhou@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G2PiQM2680139
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 19:58:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=kP2iHpYl2
	Z+IV4I+t0voQ+72/PeiJjetzLbaQFaGfcQ=; b=hmT0V4OlFoUHnt1+fmOR5UXFu
	+30IED8seSJESKyBDH37mP+zXvwSDPvyMHKYCGxboo4tKQ4UNG5EslgEzshMVFpY
	cJ4JtpFrZjeENm7Z9hK+jetoZAG297ccq1wsi02ettnOi9WnqtL6sP4z6/D2v8MG
	iDHgziWUoYupW/+07MlmjcwUFZ38oHlN2V7O9yUQfECB9X0aAF4Je076ngfNB5I2
	mEwaWp+h78AJFRCG37Ig/7s9e26JLUh1+X/u59gYj8VWBGFpfrldxAqePt4sgWAu
	45vS9yyNM4jNY4MJCQldPOl0E92t5kI/HMy0w4pdLQbh6w9eQIzPT+fDq/zVQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es6qduj5f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 19:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zwj6SU5E08WxDNrniXTE6HWnfyp6mkmbtv+j0dWmxXilWa2AyFd/JN61caSg9hDGdV6qcj6SnBfY2LaPVNp5Fx0WLRczFI92bMAwBxyWY+/pTKnnJ5pHmnF2qQC/k+8kGuh5QbTq+1Ois9fg6LVqXavlarFb/zIy6FfHF7OjGu54rmk4spnaWS/TNZywoRIb3IL+5q135eL6NhpA8R307juiv6xM8UZwALLI7vFmRGunlosSUebR48P3ne/pxBLcHH5yMfy3yYrCXGf4Jc2Pui6zBj0oi6tO/7GtVDJGsvKt8wipqhZDuoXcVjxeQcNa9MSI8lk4GPcInDJ78Ew6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP2iHpYl2Z+IV4I+t0voQ+72/PeiJjetzLbaQFaGfcQ=;
 b=RwcnWMwEYXRaQsH3VyyIXkIikW/pZUCcRQHA5WR3Ny+ome8LGc2m9sXfCTtmhD1B42nILuUDtKoPdzE5b62aaTJPpMxfvu/DIK03OQWViYBHV4jLZbtET5uPYMSa1gLSL5SKwmcQARpQJOK+bawW/GIOsPs7qH7K+VXLKyHorRwd+WBFvGq50cKWN8GFechiGkbHXUP2opGs+BL4XJ14zVDobKPYj/h1fUhhNobCse6xHC389xVNd6NkXBZyDGdPrx4nKWSUpUBh/F00x8OioT4/O7t5/nPFFGV7aMzzLT8377PZ4SJLKdJIy+VXiC/xa12XBLwk7uUolRp71WQ4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 02:58:32 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 02:58:32 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [oe][meta-oe][PATCH] minifi-cpp: upgrade libsodium 1.0.19 -> 1.0.20
Date: Tue, 16 Jun 2026 10:58:16 +0800
Message-Id: <20260616025816.2665796-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::17) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f926d95-3743-41a6-b733-08decb532646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|12006099003|25016099003|18002099003|38350700014|3023799007|29003799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	UV3EfQqWAF7aL8JCFnQXAslqMA9qZrHpn/aUErVNuV5hF09zySryRpXGoQTY460iEQUrgHtaZcIh+HuPr8kt2e6oUFSmZNuotK4Jb4BE7fZwvn/ZtrXBHS1rZRrwcZsRvfma43tT8/aVJsqQwjr6o/IB5ROenirmmDShaTgPiZYItIwBqWSJNpyEPyQaPqKgrK7uBe4nUosi5sxJcpUK8jLEDNxgteN0kWvXo3S+3JdPdBxaMK22bMUdP0+yo/vNSeSqelZN6rAT+qSfAVRLzMhzBeh88wmrw39xEEE1faLj2TwIX896OihauBX7Mra7AhlBokyH0YchYR7XCwVw8nCck/9bXEpRq5YdJtnI7G+If8Ilu+r9RUUpTrhE0GKW5UAxLcsiGpOhitTNhHrh9PE+/0W/WOHiwnZAKALAPQTsCTlDKRUdo+aO+GlklKOFxcdpERThFTOUWjYdydKTKaLLYnTXjOgIzvAXrjahPS4aCm7zBZKMUL3nP8Q6tLrMFP3KqknEXM3eqKweZN1Rpj5trLzzVH3K/YjRjfvmxfXATH3mdqgEXzLjpAyMbMF9odNrEi5SbNPh6oPSdzjia4DWdqdjBoxSk9vz+43q86/ez2JKo1B/imWg9CawiurPFzBcA8H5jFyRNcYctW9ayA/5NUHsHVQX1mBjBzOb8DQb0wbjdEvvgtY7tmGSkbZDOhQfZx5BehLERBfh+5yeHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(12006099003)(25016099003)(18002099003)(38350700014)(3023799007)(29003799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y6Hf3dg6qG0yx4D1FQ6yt5E86OJGQXZY417xWBt9/7nl7nJOdS7pUXG44uCA?=
 =?us-ascii?Q?L4yryVxN/3k25sU3Iu4dXaLfV6qV6LMLMM2WSMBNS0TZzuoQFR5ssCRruuxO?=
 =?us-ascii?Q?h8EVepShiY3HPZoaV7C8p0oMcQ62TFWiMFioGrx8vJl9uwWj3QfJg7niW8tI?=
 =?us-ascii?Q?GCS15P0XklaLRGHJKpA5zp2HpplqQicysUdyNOvn+oZTJ2ilfp2+6gZpkiws?=
 =?us-ascii?Q?ZgDUgPOIkJtel5h0ylJqm4HiFpvEN79Tl8cZzxtTzV6Y9+egomsTA7mKkIVD?=
 =?us-ascii?Q?TtaXumd5YYMGT+FBQTKRiKs/+Bbvo4kk7k3bvMnstMqqQyHayrs9AILgFamy?=
 =?us-ascii?Q?yrNzfXcNu3O8GR6xHe9x4VlKCJ68sLDttguK8s7MLEfnmatdoaS91lFvmLl+?=
 =?us-ascii?Q?orDVkDUIhlQCb1nv28CxjxM2ZFCZ6Xdqo52QtB8pRcNAV+xc54uRSrJCMFgb?=
 =?us-ascii?Q?wq7MEDI9e67I4ZEgnl7y2j2xn0KmkQWtlME0jXZI5vQHAmtzELMuF+U7PVWW?=
 =?us-ascii?Q?UxP9elDoI0PgPZlLkile9/H0Xl5C9N0hUsI5ASvw75Pp2I+otjtpg0kAEFsk?=
 =?us-ascii?Q?e/SGgRMQSGJXvXjMHszQFICvJX/pzUtj3iBBEErJPsE9PtYbbrEn7vlK0A/T?=
 =?us-ascii?Q?1IlaM22q52J+3/PdmY35/sAty9UNa5HGby3E22byjbo+VUoslw7p55P3qenM?=
 =?us-ascii?Q?IWBFt03NaMIisTM+6yq32f2brXF3JZ5bJAZaAFDt9wgjiZ6pbn8QJi0FBh8q?=
 =?us-ascii?Q?fwO80wlc/+5ABeypu/AtPh/tJZuO58J0t32VHS0ggOH63vFVO/7X7U+9dp+o?=
 =?us-ascii?Q?VOWqCoM+o+Im6cmx2wnUkOW4zQQo1tkz4b8elMapIL4b/SxAuHLlqfWgPuoq?=
 =?us-ascii?Q?TYvLc37WRFQUrWaJpk5oodcn32gNzWEBFE4ewLxg6qEzHJBbxBClAokMRj24?=
 =?us-ascii?Q?RfRTCrbeIWr+M91Y7xb5CiE2QzcrTHahSsqZ6uNAOV0XVPmBG07KCq8OHpLT?=
 =?us-ascii?Q?YT9iisMFqBXM3sH5yL/A/5pYO9/uAnwVmRwGsK9QhOXq8jRZorSiEpkT7/rb?=
 =?us-ascii?Q?UhWIv67H51iYs2b3vzU7iTBJfaB/05TRyur44bp/8aodLogQ7toJzoh84Rxh?=
 =?us-ascii?Q?hIc6C0bcOgL8ezr1j1vJ5++OFl3Ir0wjJSpqRQxPIAkPxb3YbqMUxOL4kOm2?=
 =?us-ascii?Q?YfF8aT4e8c31IOB/GCAQ24SG8ndxUEmg5xwYHTnjiT5gilNMWKpGPx4wYjRa?=
 =?us-ascii?Q?NDH8ivtqNZs/m65kM2NOa2g5hHBoBmSXRkpLI5ktTxk/uBaqkVwtrjEvLKyR?=
 =?us-ascii?Q?djxPgC6p6K9MOrjkc4JnpM2iNxlumqUieC999GqmiuuwRL7XY0lvYTmkMiJK?=
 =?us-ascii?Q?XoxKz2hfe476bIH5+SzZEjfyJtKP2gETX9157hEUzXoHAg09L7KGnujXmdaI?=
 =?us-ascii?Q?jc4b773HNkF7va9jCZn+URbUAi8TBnB3udkvSIfINUAelPQhlINEokwcyDFu?=
 =?us-ascii?Q?yeCytrSKW6j5Cn5Tk5tSKuclBwgKutGqvY22WJB1QkneQK6W/LNQ0eZQduU5?=
 =?us-ascii?Q?9U77BDW0lTmgraBVwElotxfOGg/151RNHSya3IJrXw+boGGoFxeweMKN5Xzv?=
 =?us-ascii?Q?vbaqFZ779mMM8Rjrh5JHzt1IfbfXJaWoBHDZiELiDzuIi5MlYPle6CR904wO?=
 =?us-ascii?Q?WfrW3kI0cB8Csxc+XlP4nNXtymNaBbKwTXwPnm0hcxTnfEc1INZPu27FXgPa?=
 =?us-ascii?Q?ZbVxOwIXBA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	OTXMpmI6OEu2Pt/mvjULS90Tjdw3TmwBNln6psgUWnMRuQKj+m9x6sm+S+DE8zZCizQdvYKO9QzP2ceshAZ4VZ531r9fUNQe7v9A11ZziXCj0Se9j7a34L293oWup84MNH4zbnPxCcH+IAyuMJ2+Jy+Sn1Cp5tFSeDs1oN/n6gupvIY6a5QHkUKT1ZK6DRiwiHLMUj3oC/JoLtsvK2wDkkqn7xkoEjPJFsPgoNfkVxrw9C2aDEuMQX+x3kkwF9Z54aCjy4Tf+/AsFWN0KvwkZnDmNaN7Q+Flv/oL+wXcvq5+0kG+/BXhSwbv7WF7ItJYOnVQ0awLnjs1mjFtJ+DP2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f926d95-3743-41a6-b733-08decb532646
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:58:32.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zef5xOxyo5mOK4VVbhS4DzD8IPAs6uI8ykjL93UuDW0vfxzvBEijoJ1OZWdPekAo7ApUhnsEtX2mbop3fQ57g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-Authority-Analysis: v=2.4 cv=DLq/JSNb c=1 sm=1 tr=0 ts=6a30bbdb cx=c_pps
 a=d2CTHFLGvf7JoJ8RUfZBgg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=3ngDpdnhAAAA:8 a=t7CeM3EgAAAA:8 a=95DwTBdXAAAA:8 a=wgvufiy1OPiYv7rUFXAA:9
 a=O8hF6Hzn-FEA:10 a=aupxLwd5jg1hj7vrjLfh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z7Plre_t_Rr_WjS3YmDd:22
X-Proofpoint-GUID: TSGCHOfUKxnplkq-D0NS8eHLB2bWe-bq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAyNiBTYWx0ZWRfXwkQgyTaIw6T9
 fwquVntQbl8pKJ/fydNIS4eFiq3SpudUQAUqGdtv75pvutcjfzT2ziGESc+Uomo7i/zyjvFx84i
 ssoR/hrd/BGS6KYHDikgXLlum7PJl1mw4SjxJDGVcyxU5MAtQg3VxQvsyjkHrqJQQEFxf0Wkxd7
 bU9Cs4OS6NU7rVpjutNFL0o+ry0OH4/jf+ojY+Vyy6m4i8C1mVA1+jwB6L0O79knqwDHUTW1eG1
 BCW/lc4NVIhC176v44yGsU5BEl9hQacVrrlZVYteBhZF0GVadmkEvSZ6kXAi/FhhpQzkCjFZhiL
 yk7RD1wSQ4rCOWu3MXYIXUDE6j9YOXZCdxfLug7deNQTi2AY9GqRszFXXqJ1owvHE5u+SzWthIE
 OeiDdly8kxG8r592YBfAwK/I7p4f0MtyOykjJubDyFYh9+49RB5psDDcDSehtYPyDW97zI0+00a
 I1cpxU5Jj3OQ/6x8C2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAyNiBTYWx0ZWRfX9GBZ8XjLCWji
 MupoeegYE4y/grTHv9nF0BJCmvqC2ga8xDJ6nlDpJDtkW8kKV1tG+OXmVcbAv+cyOkJC1MSByGB
 4udUkDyPBT5CsHTfirM679gq65YGQufISTW4jede2gl3U7pw5vlf
X-Proofpoint-ORIG-GUID: TSGCHOfUKxnplkq-D0NS8eHLB2bWe-bq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 02:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127601

Upgrade libsodium from 1.0.19 to 1.0.20 for minifi-cpp third party
dependency.

Updated below patch for upgrading:
0003-Fix-libsodium-build.patch

Removed below patch because it is in the new version:
0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patcha

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../files/0003-Fix-libsodium-build.patch      |  20 +--
 ...iler-attributes-after-including-arm_.patch | 141 ------------------
 .../minifi-cpp/minifi-cpp_0.99.2.bb           |   7 +-
 3 files changed, 13 insertions(+), 155 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
index db2434723b..7a02882c12 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
@@ -1,4 +1,4 @@
-From d48ababf341708885ecf687ebc46bb1d84ca868d Mon Sep 17 00:00:00 2001
+From a4e49b4b5b11e7246d0e06da583ba8fdb9ed40d8 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 19 Mar 2024 20:56:05 +0800
 Subject: [PATCH] Fix libsodium build
@@ -9,18 +9,18 @@ Subject: [PATCH] Fix libsodium build
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-[lz: Adapted the patch for context changes when upgrading
-from 0.99.1 to 0.99.2.]
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
+[Adapted the patch when upgrading minifi-cpp from 0.99.1 to 0.99.2
+and libsodium from 1.0.19 to 1.0.20.]
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- cmake/BundledLibSodium.cmake | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
+ cmake/BundledLibSodium.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/cmake/BundledLibSodium.cmake b/cmake/BundledLibSodium.cmake
-index 001a90dad..87a3244fd 100644
+index 001a90dad..73b712512 100644
 --- a/cmake/BundledLibSodium.cmake
 +++ b/cmake/BundledLibSodium.cmake
-@@ -60,14 +60,12 @@ function(use_bundled_libsodium SOURCE_DIR BINARY_DIR)
+@@ -60,14 +60,14 @@ function(use_bundled_libsodium SOURCE_DIR BINARY_DIR)
                  TLS_VERIFY TRUE
          )
      else()
@@ -29,8 +29,8 @@ index 001a90dad..87a3244fd 100644
  
          ExternalProject_Add(
                  libsodium-external
--                URL "${LIBSODIUM_OFFICIAL_MIRROR_URL}" "${LIBSODIUM_GITHUB_MIRROR_URL}" "${LIBSODIUM_GENTOO_MIRROR_URL}"
--                URL_HASH ${LIBSODIUM_URL_HASH}
+                 URL "${LIBSODIUM_OFFICIAL_MIRROR_URL}" "${LIBSODIUM_GITHUB_MIRROR_URL}" "${LIBSODIUM_GENTOO_MIRROR_URL}"
+                 URL_HASH ${LIBSODIUM_URL_HASH}
                  BUILD_IN_SOURCE true
 -                SOURCE_DIR "${BINARY_DIR}/thirdparty/libsodium-src"
 +                SOURCE_DIR "${SOURCE_DIR}/thirdparty/libsodium-stable"
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch b/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch
deleted file mode 100644
index 792a7888e3..0000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 3a59f8e5331bb6be5d298bc5c136a79102196c1d Mon Sep 17 00:00:00 2001
-From: Frank Denis <github@pureftpd.org>
-Date: Fri, 20 Oct 2023 13:47:57 +0200
-Subject: [PATCH] aarch64: set compiler attributes *after* including
- <arm_neon.h>
-
-Fixes #1321
-
-Upstream-Status: Backport
-[https://github.com/jedisct1/libsodium/commit/8f453f41f8834e0fe47610f2a3e03e696ddb3450]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- thirdparty/libsodium-stable/configure.ac             | 11 ++++++-----
- .../crypto_aead/aegis128l/aegis128l_armcrypto.c      | 12 ++++++------
- .../crypto_aead/aegis256/aegis256_armcrypto.c        | 12 ++++++------
- .../aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c   | 12 ++++++------
- 4 files changed, 24 insertions(+), 23 deletions(-)
-
-diff --git a/thirdparty/libsodium-stable/configure.ac b/thirdparty/libsodium-stable/configure.ac
-index df83ef512..be67d3417 100644
---- a/thirdparty/libsodium-stable/configure.ac
-+++ b/thirdparty/libsodium-stable/configure.ac
-@@ -398,11 +398,6 @@ AS_IF([test "x$EMSCRIPTEN" = "x"], [
-     have_armcrypto=no
-     AC_MSG_CHECKING(for ARM crypto instructions set)
-     AC_LINK_IFELSE([AC_LANG_PROGRAM([[
--      #ifdef __clang__
--      #  pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--      #elif defined(__GNUC__)
--      #  pragma GCC target("+simd+crypto")
--      #endif
-       #ifndef __ARM_FEATURE_CRYPTO
-       #  define __ARM_FEATURE_CRYPTO 1
-       #endif
-@@ -411,6 +406,12 @@ AS_IF([test "x$EMSCRIPTEN" = "x"], [
-       #endif
- 
-       #include <arm_neon.h>
-+
-+      #ifdef __clang__
-+      #  pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+      #elif defined(__GNUC__)
-+      #  pragma GCC target("+simd+crypto")
-+      #endif
-     ]], [[
-       vaeseq_u8(vmovq_n_u8(0), vmovq_n_u8(0));
- 
-diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
-index 825de8a1c..a01f60cbe 100644
---- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
-+++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
-@@ -17,12 +17,6 @@
- 
- #include "aegis128l_armcrypto.h"
- 
--#ifdef __clang__
--#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--#elif defined(__GNUC__)
--#pragma GCC target("+simd+crypto")
--#endif
--
- #ifndef __ARM_FEATURE_CRYPTO
- #define __ARM_FEATURE_CRYPTO 1
- #endif
-@@ -32,6 +26,12 @@
- 
- #include <arm_neon.h>
- 
-+#ifdef __clang__
-+#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+#elif defined(__GNUC__)
-+#pragma GCC target("+simd+crypto")
-+#endif
-+
- #define AES_BLOCK_LENGTH 16
- 
- typedef uint8x16_t aes_block_t;
-diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
-index e1ebd577a..058e2072b 100644
---- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
-+++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
-@@ -17,12 +17,6 @@
- 
- #include "aegis256_armcrypto.h"
- 
--#ifdef __clang__
--#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--#elif defined(__GNUC__)
--#pragma GCC target("+simd+crypto")
--#endif
--
- #ifndef __ARM_FEATURE_CRYPTO
- #define __ARM_FEATURE_CRYPTO 1
- #endif
-@@ -32,6 +26,12 @@
- 
- #include <arm_neon.h>
- 
-+#ifdef __clang__
-+#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+#elif defined(__GNUC__)
-+#pragma GCC target("+simd+crypto")
-+#endif
-+
- #define AES_BLOCK_LENGTH 16
- 
- typedef uint8x16_t aes_block_t;
-diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-index 0a5a12811..aa76f5cd1 100644
---- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-+++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-@@ -19,12 +19,6 @@
- #define __vectorcall
- #endif
- 
--#ifdef __clang__
--#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--#elif defined(__GNUC__)
--#pragma GCC target("+simd+crypto")
--#endif
--
- #ifndef __ARM_FEATURE_CRYPTO
- #define __ARM_FEATURE_CRYPTO 1
- #endif
-@@ -34,6 +28,12 @@
- 
- #include <arm_neon.h>
- 
-+#ifdef __clang__
-+#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+#elif defined(__GNUC__)
-+#pragma GCC target("+simd+crypto")
-+#endif
-+
- #define ABYTES    crypto_aead_aes256gcm_ABYTES
- #define NPUBBYTES crypto_aead_aes256gcm_NPUBBYTES
- #define KEYBYTES  crypto_aead_aes256gcm_KEYBYTES
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
index 6c64046161..384b453688 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
@@ -19,14 +19,13 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v1.15.3;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
            git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;name=jsoncons;destsuffix=${S}/thirdparty/jsoncons-src \
            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=${S}/thirdparty \
-           https://download.libsodium.org/libsodium/releases/libsodium-1.0.19.tar.gz;name=libsodium;subdir=${S}/thirdparty \
+           https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz;name=libsodium;subdir=${S}/thirdparty \
            file://0001-Do-not-use-bundled-packages.patch \
            file://0002-Fix-osspuuid-build.patch \
            file://0003-Fix-libsodium-build.patch \
            file://0004-Pass-noline-flag-to-flex.patch \
            file://0005-generateVersion.sh-set-correct-buildrev.patch \
            file://0006-CMakeLists.txt-do-not-use-ccache.patch \
-           file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
            file://0001-Add-missing-include-for-malloc-free.patch;patchdir=thirdparty/fmt-src \
            file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
            file://0001-Fix-build-with-gcc-16.patch \
@@ -61,8 +60,8 @@ SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_argparse_gsl-lite_date_asio
 
 # ossp-uuid: 1.6.2
 SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
-# libsodium: 1.0.19
-SRC_URI[libsodium.sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
+# libsodium: 1.0.20
+SRC_URI[libsodium.sha256sum] = "ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19"
 
 
 inherit pkgconfig cmake systemd
-- 
2.34.1


