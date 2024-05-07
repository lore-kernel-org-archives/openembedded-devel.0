Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AF9C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 23:19:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3478.1715123945545146973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 May 2024 16:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oEUIHJQS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5857885c58=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447LrMln006230
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 May 2024 23:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=cSO8JVwEVne7/utZj8VTgteGYsXJIUxXsfwtzPk8y+k=; b=
	oEUIHJQSV7EFtItzxKgtv+taEHuR50FBmHB4LDOwbEfhEZmkDEBEGTHAgvwiwkB6
	GUHOIzVy6LcUsSS3nnUmTkOgSVI175DNzkBfJA/RauBPuW5fegcAMufSGGaUhdGC
	ifuVyy+Fa/QKcfPOu8GMxWJ3OigsuBQ96rercNxP3hFEqQ+3UKt8MALTiIwgtcHb
	harn4Hefx6RTsmMnpzFlJFT2W0DW8sSZgkUncPUl5amoB5Z4PTPNrwdvcMQgUt99
	NXtjIj17YhlAFWI9lv4CGJ0PUvXwyFjk8RJcieN4aouaS9Q/vGINa72cvADFQsK7
	AeGHF4NEGRbKYF+LOObrMg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xysjxr7b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 23:19:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0/nb9W98G2ZXuOK6crIUOl+hGdwWpEaTjCVemZ1O0J90REJ1sUOKajCjlpCk35/en11/Pu5CmW5qQcbauLnY70F+/L9rKaxDL7sbj4vZrb/bXA7ijgTd7QjFpv9ca2pJAoSwoIrYYrwy/60KV7CwSzu08LOQ7tR/TBZC6oryvZEabQXkKwZLXZyQbsmXI6ncro7Y5Gi8PAZUvBn6asQ9vN9CBjkDo3IYvAN0Ra/30+CkPP0F8TXOBMa7xTbCTLjjFhwK9k/CeGP6pp21grVFdAGWxT5eS6qBU0kTliBSYsa/kpg8MxxKItOlEMtGHiUFUFrNQrRjIhc22pZYtjxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSO8JVwEVne7/utZj8VTgteGYsXJIUxXsfwtzPk8y+k=;
 b=HQfEfm02sXqsZ1QncrOH5g5K0+X18jM3jxnFWbkZ3yLy4YuAfyFSkXObp8eY4im14uSqpmUe4pkE0ZP3xFjoZE29sezIx4QEuLPSV+59WH9gqIZP0qdlYA1mMSGaX7Y9Hx+pmxNsM99F59jVg/u6xYOyY999DBJ4PfxG5UFESa8ILmZAoQmUNlVu/dR+QpvE0PGWWEnZ9hdBcQhXPXcwSXF7oD8MHa8++ux3ksPyZJhQ2VHXRLmFKVuqrxH68ineEjE9TrZnfyGkpw/DdtR0GO1LrZHzEQJuluY8f7OvuC6Fu9r8y8NSLVZo0A8pAseK0pTiwU4kg9+p98NfyonXcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 23:18:56 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 23:18:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.19.5 -> 4.19.6
Date: Wed,  8 May 2024 07:18:41 +0800
Message-Id: <20240507231841.1323600-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240507231841.1323600-1-yi.zhao@windriver.com>
References: <20240507231841.1323600-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0313.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::8) To SN7PR11MB7489.namprd11.prod.outlook.com
 (2603:10b6:806:342::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: dac44acf-44e3-4b14-34c0-08dc6eec1118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|52116005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SpuT6CXIkulkBjjZxjn+V7ofNE9heUwPvZTIlDeZEO96G+RE5GXRl+A4pxso?=
 =?us-ascii?Q?i4gKS34rYcRKMJVYzNyWayy1q+nNwmHTEHUdeQl2dfITMqb6usXuPXXGsz9T?=
 =?us-ascii?Q?LHq/AMuJslTLDo8ymg8ni3M6FJFqdlW132rOKCwbf/Z6mFFP85PyMmhZ3mFQ?=
 =?us-ascii?Q?w6TfyPdAZqpcVEEKWETmI2+UYoov4nL+zLsQ9a2UblriSZJTas1xiQfogRgO?=
 =?us-ascii?Q?zEq6Z4czrdMw3ImFzHyBZOI0VcPkNGYkSiEDroPtiVJaaRcYRNSpDpkGGsW7?=
 =?us-ascii?Q?xKeab6zsaYRFL2X4f+msBQZkw8U9LX4ImJB4ydpug6M5LzoXCi4Uv2GJqKj0?=
 =?us-ascii?Q?r78fjZjPeU8ANsuBy9YuCJm5FnG0nwjIjvGoDoquTJccIcRkT0bxINsroZTR?=
 =?us-ascii?Q?DcAy9ibjv58/cNPNZHv3SfWQm7uUayeuOF+AYDK7SHol0Kb8fPyJD1khacux?=
 =?us-ascii?Q?wQsMwuIBXYLvvP/2BwWtC6y4nhOkEywm/nlB6uq6rXqK1nEG1c/fJjjEJCib?=
 =?us-ascii?Q?fKMNPziQVWzdJAvK4JnXsK20OudqLIh7UuXqUTgmpCJLMXsUzTMd1UD6KNm0?=
 =?us-ascii?Q?P5HZjjKGBe8U02rUf29TbiHMTxMzyweNwY0wcgWAWU1hIP4VGePNjfenFNoC?=
 =?us-ascii?Q?JUVCR+nQIySoBJYYdxXofIP/+otAmjuvKTKZbSmj5A1guhu8wry96WSuEDo6?=
 =?us-ascii?Q?8nIbkQmd1D9VXSFSTWmnu28DKzxbEsZu3LPjVVObkLZJrrPsW4wJolODr4iB?=
 =?us-ascii?Q?ifogvnCRxvKTaZCkC99nDGTCcPsr0G0+n++HiKTrDISD4JdfG5UI5B/UoFfP?=
 =?us-ascii?Q?+v0TnRffZph4Tk6at59HfNZQDTIuPee66pNPgGMV+3xIR40AzuH0kYYMR0ra?=
 =?us-ascii?Q?S02FwISMiZuzSUMcYiCdTTfGUfAyFapRcx/VClRpqRq4Kv8XTKAR3QVUt9Tw?=
 =?us-ascii?Q?oI3vSQAfJLVw956nFX+EEYlE824Egy6GBSOWTeIaCDZjPpAxNiEd3YbSlmKt?=
 =?us-ascii?Q?uCjbLz4j4tdlTWV6CveIVwARTsBw3H6wH6TXJuuux5h52U94xG5e1WqXZOLg?=
 =?us-ascii?Q?261xIGePkk9IcON/R7bqbEIi1L7R/lryAyv7+bR2Ut1Nnx1ao6JVKRgn1p1n?=
 =?us-ascii?Q?tBFuqIbsNKiJ0tYRxvJWng0Mfc+VhxOaYbXhNwO7hanSpQI+ZNiDsIrA/msO?=
 =?us-ascii?Q?brnKW/CksWSOpbxiJSe5IKYwPYrMLMdvZBgkiuzHAW2ZDTqIQ66Hcpo2ZRSP?=
 =?us-ascii?Q?vYH9VGFT2EpRJp13iEqGZzCrylT4xwkEL53S6oFpjw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yIJnkRmxfvRkwqBVUqROmcJUxPPQPba3G4Ih/V3n8rCrqAGkTqLaT1mDlub+?=
 =?us-ascii?Q?snOAMtK4khADNGgXHzZVoXth0Lkm6F66Vl+JMcQvBZvX4rxDTl/qYBbG/trT?=
 =?us-ascii?Q?jwTGFPzBv5acYMeEWYDEb2hJnCx2bIU3DIC3t6d8WHBWW5TTmKpI/9r8tUDA?=
 =?us-ascii?Q?QFvs8SjExOR9mg6joq1vKGt3RC5BTXCAgovDzu1hHvuSR4qKN0avGeeM8tOz?=
 =?us-ascii?Q?6IewqTJw0n/twu5nVD+Z6DjAm/lWj4BngFRGOE/DKkCQ6oNdR3M1ReN2PKDb?=
 =?us-ascii?Q?xDgAW/YOvU0PRjYfwQLsQ2zJowB1Ennap5naj8zZKoZ195nyELSNDtUgsiXM?=
 =?us-ascii?Q?BheVwLaH2qytujeZKbcBvunMKolWFvjU04pp5feHwAE4grk/gOYE5PD6iIde?=
 =?us-ascii?Q?NWnf/VisKofbwCwp5l+gO5xlRM+RGGU06uOq9R3oMww/6GQ7nGZ2bUeUGMVV?=
 =?us-ascii?Q?qS90abOrdCU8U3MAc8mx/CBQ6Qxe9CiqJEcC4dVCjqmALtamizPG//+FHNS5?=
 =?us-ascii?Q?bcwiyQILRu2rC2A9V56jprd0PzkfxgTmZNzyg7SoNM6jsQyGXAYdfdrHgyEg?=
 =?us-ascii?Q?SYKgLeCACMsqSoqiL5YWZHz381TpbSNDNDUArq89/tsAthSDH9DdaXqsuVfD?=
 =?us-ascii?Q?4JJQyUTyroAvSWuq0Gdo3HUHhERXMbfKuYz01eA+1dCv7xyMWi8HI9kS0ftL?=
 =?us-ascii?Q?6GjZhEgOGFEzonZVFDilRpeGOHmT/V16ZS4SINf9FE/DkW2KCfWWlMg4fY5o?=
 =?us-ascii?Q?OZuuNzWysp0X2pD/6fI5bzwq4Y6bOCUcQOOhAGWXxuz1rn2kMp+834jCP78L?=
 =?us-ascii?Q?Oa+UEsalQ05GUw21MCnRZigQsKTK+LSqfWL2PxOvcBso7R54hp3te7n/ORni?=
 =?us-ascii?Q?n4J69csufmnjjQoempHMtKCcuATMp10+YP9SNu+gPlc3fDqeEsGN7hJtuo9J?=
 =?us-ascii?Q?2DnXeTERfA6cyOBTjhk/hE+yfz4/2wUwlyeiNSGDPxnHxnM9zxvoLG4oGncj?=
 =?us-ascii?Q?XSBB0fs0V7wBq7H0+EdVOvKGSb+1w3Is/NX34ACm1YoodukwxW0o77MzddiV?=
 =?us-ascii?Q?IJmx+lWQrbpKKBw/CTej5Sd5eOaI2dH75Lc4SIfb0PQ/Q+a1uV5PPogvzeEA?=
 =?us-ascii?Q?yDCb+0gJvE1YKHz07ry5Y448V+0bKBzEn9yk1+Gdaj2gVIcSJEgY5SV+88pu?=
 =?us-ascii?Q?NZfwuqnTPXpj4plCcu3afdQ5OhMBp3a+1m7dp4MN4qHdXpsKHJZMk6Ri1DJg?=
 =?us-ascii?Q?yt0E0fDBJxHOp1V19io3pH/m8eH4CzguZ3XY278LVSvlFlhbniGimdapONq7?=
 =?us-ascii?Q?fEcJFEnUDDkkcGAKSycn90YtpP3WJMX547iX9z/c9kIKS97dH5RRIK71ECal?=
 =?us-ascii?Q?J6O9jGnI+chm4WRdZqWO0vNpr58ZsB187bFmjrIcUBispQ/IrdvNkGnEfJOl?=
 =?us-ascii?Q?Q5ChWDNFy8nHWnqFJsasTMXtSg9AuLJZjXhmQwZZM3TJUQFNLWU27Mx0WCBN?=
 =?us-ascii?Q?X2eEHlvajXYqs+i0hbrofqtLTeyosZHW5oz8xXimzHnRCnQcYKp66bJvK2vJ?=
 =?us-ascii?Q?W+rpNZeMcZMK1lQDwfOERPC3LALz4tBDrNwdYyDT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac44acf-44e3-4b14-34c0-08dc6eec1118
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 23:18:56.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmKdtmBEj2CuaABEDBOrTZo2Et1U8AO/2y+9o7p9UwlK/HmWooy/h+vOdKSwSQzwqIxAkEJ4ykFnL2M1ETPjWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
X-Proofpoint-GUID: MUsJvpsW-F0tr2MxXrmN6WOxLwcwOzps
X-Proofpoint-ORIG-GUID: MUsJvpsW-F0tr2MxXrmN6WOxLwcwOzps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_15,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405070162
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 23:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110271

ChangeLog:
https://www.samba.org/samba/history/samba-4.19.6.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.19.5.bb => samba_4.19.6.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.5.bb => samba_4.19.6.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
index f5ef86dd4..bd0309934 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "0e2405b4cec29d0459621f4340a1a74af771ec7cffedff43250cad7f1f87605e"
+SRC_URI[sha256sum] = "653b52095554dbc223c63b96af5cdf9e98c3e048549c5f56143d3b33dce1cef1"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
-- 
2.25.1


