Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A1DCFB440
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 05:11:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.46442.1728277893297846261
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 22:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0010d85dc9=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974WPH2001105
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Oct 2024 05:11:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422tp41pp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 05:11:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK+C092B60y9LoxSLHV7k4bE2ekZ40noqwlGU0nXmAmqb5lrPRgO6SEcwosgvV2Nz0CuPhokkQYZ19IDRhCl58furJ+5TRfxBbhB55p3Rybxb3tMaXYDFuUgUBXZO2ZuciWbWBP0zwFLs4a/7dE7dosPgB+f+G4oHqDEjw/lpYJndnyo95pbMnNtxGegW6bHaAz/xCWDUSZTvlGSV3f3WcKLAsXL/KCnUzc+jXJuns4bIraGnzUOpMkXvnLPYMvRV/wmcxYcNXdAjIKJNukLtY4ytr8x489WIfD9bV2Lk4GBAGh0xVJWvMDupnmTq6L+Z6IP55PQ0dL1zj+WdMFnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+DqXV9ocIZYZ8avEcTRPlNz0D6UAubE/XdYlKQfHmA=;
 b=dqCLTfGJj+RJf1l/Ogj1Wrlx/KThzFou0crV+wraCTfRx7edDNUX7do6aDGc9t94bZGNZXuIBHQmbXTyB2D7pG4WSPRPZgZOWK4154SDqv0f7phgcNokY+Bf5lJo4mG5UP27UKFPwRlRpOWjlLO4eiMCq4TDtI3v7Bk/D23DTDGr9f7STAisHRVO5NjIRqzBMog54ZbeRpq8cITv63dHd9oUdn8yncRxPhhslch3T45DJpEbYur5YcLhXGvo/B50fBoQdblBKmjwW3v8X1AoEtH7vy2lrWsbjeC/xLRTYdKiFeb0O3GCYrvPXt/iwTiog7Xs9oNVWCqEf14ad8yNOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 05:11:27 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%3]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 05:11:27 +0000
From: "Urade, Yogita" <Yogita.Urade@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Urade, Yogita"
	<Yogita.Urade@windriver.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] frr: fix CVE-2024-44070
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 1/1] frr: fix CVE-2024-44070
Thread-Index: AQHbCPSaXKlnta9KAkWYUNj7tKMlMrJ63K1g
Date: Mon, 7 Oct 2024 05:11:27 +0000
Message-ID: 
 <CY8PR11MB7169140B12429FD24C6BC4C39F7D2@CY8PR11MB7169.namprd11.prod.outlook.com>
References: <17F6047E08F584CA.13829@lists.openembedded.org>
In-Reply-To: <17F6047E08F584CA.13829@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7169:EE_|PH7PR11MB8273:EE_
x-ms-office365-filtering-correlation-id: 1b78cdf6-2a62-4b64-2988-08dce68e7f1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Pfn9r8CEaXgnJrGlSA0IPk/aITbzxLQzXmVzTZoUi99f17XTkHI3+4f+859q?=
 =?us-ascii?Q?AUwtVu3pXDcjBeoeooyTrEmrLLEL5odlpin0jlViJNofunsA15bDMORUoSWs?=
 =?us-ascii?Q?Cz+aBOxJp4la24q95bdEXZkxNH/CjHaw+jX75qPBoMHW8MUJucIHe1Wcs4Lj?=
 =?us-ascii?Q?+mKnjHwA8P7Y3gP1L4KevlquUP+eoM8ZLGoktrTeNjnJ7OuFZO+oX4fmZFdV?=
 =?us-ascii?Q?1Y67YQl/RakcWGtX9Ec8IX1i7b6ZVAdcyO4+WWTxlALG7i1cAIaY2OJFAePI?=
 =?us-ascii?Q?nGySzI9DSGIUyOq+LFtXVwWHO5LkOhP4DI+eWdYTb+UPlA4VqTxhwMFODIzH?=
 =?us-ascii?Q?S6CFNWwfVw2+8sXnr9rjhUUNcbQuuuv6vsjxporF15KAFBCUBzJ1pSPLpcIa?=
 =?us-ascii?Q?kDdwED1FOmtrnBGYn3i66lgZ7O4Yl0J90tVlnTT/TBQ5sgEWKIOvu1ivSn7J?=
 =?us-ascii?Q?636EbpZP5rYuPMH8T+Hv/42Xl434MFomZ1WbTbaQf5Au4ilU8hTdB15iklOe?=
 =?us-ascii?Q?uWxmgk4PWgHjlD0TwjqvuBm6pzITWb+FEH3VsU8iEkbfOgW71axEXlq/zV95?=
 =?us-ascii?Q?f2CjeqaHIoB1Xg6fEAfJXBFkh0xomCWRZy9Weeutwy36JOGxrwe+XVdjl9Vi?=
 =?us-ascii?Q?jlhDvQuV0q6H0YPOdZ0SKMDZuc9L/DDLuUoEra6W+f0Jb2UyXtmrrWIlzbxr?=
 =?us-ascii?Q?CXCgS+D6q4NAeaUvUoI+qRrrP7J9biM8fwaxxaKH/sBtOMGA075IoamGkpIE?=
 =?us-ascii?Q?Nuuz3451FwcGTkMSjsYuNS6EHXO9IGKQLsbDJwDf8hvskqVHecAfC8RiftCp?=
 =?us-ascii?Q?s44TeyqkYzDwYJ1sK1R3ObbPNFWKZnxyPUeGQQUySOx5z5rg6hly6nduho8+?=
 =?us-ascii?Q?XopX6cDbQF2Sv/LFNIPCJAfRcp3jBABDL1wV5+lLl308NstG1IYv5/9cM+Zg?=
 =?us-ascii?Q?zpeFe04Vlusf6YWpHqsz92tYnMubYjU1ixd/VLD/0UclCh5A3Dv2vdzJ+Vgs?=
 =?us-ascii?Q?5VrZfPT48ak67qaGisu0tAFt/sPjc4D9FJpQg6vPiF3nCbVVI9Kory4uNoqP?=
 =?us-ascii?Q?0hwZjX0WYu5C1M1dbBfCKfY/28Vu+bjeNt+TUtlXmqbDVr5W5ch5RpYmz0Sp?=
 =?us-ascii?Q?sDNtulgPTR3ZsHXwHQlcsamhpF0H2gn8153UnTSMfIuZ09/8x9NSYz9mBci3?=
 =?us-ascii?Q?JbM5d2oDZjaCf4uOLlgQ+pI5WT/jsTE/UaqKDoGwgkoICyX0hBm+bbjH1ac0?=
 =?us-ascii?Q?1zAT/OC5QJRA3Fish2EB+G8HEdp9Fn2OFesvSztZ5Mk2qwDsZV62Jti60SOv?=
 =?us-ascii?Q?c7k=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?n5pRTln2SQ7vhjEc17INXNcPdwS4f/Eo7RNs1MNvxJFLib3gAVJwrLYpMyCc?=
 =?us-ascii?Q?gjkr7qbILKm9JFw9qPwd2JAiJksn1EzL+B67U1EMAGE4OZ3AvO5eGAQS3Q8t?=
 =?us-ascii?Q?Owl7Ouc68yZw/XNJ3asTyuRM+1V49O1NFhQ+WcpDSMcQk2yBqf66NZZlBfib?=
 =?us-ascii?Q?QePW18iZpkB8oPDzXIEFLE0t34ez1a+pZNFkpq9sRI+gFL/EoGimayvN0Mhd?=
 =?us-ascii?Q?bDX1yiRKOaJNnmQxqWAKVJJNdT1gzP25QZ4OZ2FJ8DVB+ykrZtM4NL6Bmq3D?=
 =?us-ascii?Q?6pLTpSEAXgNBaQl0rMgT7BdpbImb/SCvTvBxIfTxTUi3ewELcBTdOmMkOHgk?=
 =?us-ascii?Q?4LH4PIqZvOWoR7CS/VFtE9SHvZn8bhcXm2RuTLKaBuNSTfcZ7PJIeppAw19m?=
 =?us-ascii?Q?xx33JyXhc9kytmwmqf9k7hi8ehI0DZY+Su5Gu6tjKVrF5Ymou+eUE21jfFp8?=
 =?us-ascii?Q?PVgumby9neik8eUS2vOuMzMfM4RWsx9ARDVgv67cekNGxeMBtR/4Ufy42wNV?=
 =?us-ascii?Q?LqQUOM3VG4V2q2UPDySawosj5CrqrZUyxNoF+UwlVuWynaE/YkpmS/r0SF1A?=
 =?us-ascii?Q?ktm/V44YVT5hTR1MoBVYLqEhlUqyt6XwvPQwxwAwXQhC27/mmEJb8pW3Zu1M?=
 =?us-ascii?Q?wZOwcb7x74Q8XUZRQGfgWS9yLGC2ipxzvLw2UiIN+k7w/iKohG3hN7vONGhN?=
 =?us-ascii?Q?Q8nymXy1F6hbQ65ciqXjDrm0jVYgxwOOWVxUcHK3xSe+ubB+xcfgTC9jEADf?=
 =?us-ascii?Q?Sgrf+FvDHWMYCYPMwFQ+G/v49/yy7lLOQs6Az8TOsVeq4pxKC6h623/KGm1c?=
 =?us-ascii?Q?pFBr9HTDb3deMrVLCT7jukSyyTl2hfimCiAhoy2C2t7SHEhonVfcN1vrebBj?=
 =?us-ascii?Q?hgtieYbRB/a71ihjImOW31a1m6txb7zU4KmdVx0YZcjdZ/dCnvjeGiY9yPVL?=
 =?us-ascii?Q?hxIzSBndJSet9YyLJVZSOj3tTCDsQZc0bFIp9AutFjPzdTDr4rmSjsAo6+iv?=
 =?us-ascii?Q?pAYHXgd/esWAfBRx+cqwID9LrnzQ9Pmy6mm7a36EC3aaMtUZj8SnZSjS7NC3?=
 =?us-ascii?Q?2JVhyLVVWrSterQRerluDeZN22rn+eFm9Z8vrIpVBvJkEnAU4GyVA3EuG4FO?=
 =?us-ascii?Q?S4q8mW/j9HP4Bqm0Z4pSSAoobfcuPYrHXAhHxK7XLcilXN38UYkq8cciMbKa?=
 =?us-ascii?Q?Gs8p7qKmmsgNSX4V0uoEVRXleDQttZhkRNR90wu9kzPr3pENZ506j6FJtKb6?=
 =?us-ascii?Q?K3in4d9k3PxYn9PUSM4BD//7JBqbz6WbiDMahgBv/z/EH+GkYoUAdwf+Pq3o?=
 =?us-ascii?Q?fdeVpywgS+tQrf78KMXZ6VlXKJ8goEr8C9ZfOTap5mDdeFo3KGqq6druR3EA?=
 =?us-ascii?Q?J5fk/LeW7h50/GM6xmtght+vrSb9HkLNz8UoSNZ7xKFOcni3T7133i58Y2A2?=
 =?us-ascii?Q?Ll5g0LhQz+exPWShYqXMlHBK7bRNNKYDEalSSn5SVRkh0fKkM7uQA62j0d15?=
 =?us-ascii?Q?GVGAGrehygn05Z0BOi/utWEb6Z/M0B9gibINSCg3HqdhBF+5Acew7YrCSPjs?=
 =?us-ascii?Q?TH4MoCLh0uycLSDj/+T6Qy2Mh4Ojx6MeWln9KkmK?=
Content-Type: multipart/alternative;
	boundary="_000_CY8PR11MB7169140B12429FD24C6BC4C39F7D2CY8PR11MB7169namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b78cdf6-2a62-4b64-2988-08dce68e7f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 05:11:27.1460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C97zUrCvc3l22B8q48nEFuVJJVvesqAwqbH8IrbXVXjR7OMdq5MwbshEbVwhLwt/d+HFIbm8zcC/USrbfGKWjg/Dq577flgBz/RZYJ6HicQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
X-Authority-Analysis: v=2.4 cv=XPtiShhE c=1 sm=1 tr=0 ts=67036d84 cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=87jn28RfAAAA:8 a=vggBfdFIAAAA:8 a=m1p1myKrceccj1hrJIIA:9 a=CjuIK1q_8ugA:10 a=VFHBDPvOS0K21budxBQA:9 a=28c0qFNyZtmyGDTH:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=aVDrfO6s1PESLM1EhDzk:22
X-Proofpoint-ORIG-GUID: mb9NhyWA-eyu2I7BiZ2-KQeaLPKQU-PL
X-Proofpoint-GUID: mb9NhyWA-eyu2I7BiZ2-KQeaLPKQU-PL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-06_21,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410070034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 05:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112692

--_000_CY8PR11MB7169140B12429FD24C6BC4C39F7D2CY8PR11MB7169namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Gentle Reminder!
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Urade, Yogita via lists.openembedded.org <Yog=
ita.Urade=3Dwindriver.com@lists.openembedded.org>
Sent: Tuesday, September 17, 2024 4:57 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] frr: fix CVE-2024-44070

From: Divya Chellam <divya.chellam@windriver.com>

An issue was discovered in FRRouting (FRR) through 10.1.
bgp_attr_encap in bgpd/bgp_attr.c does not check the actual
remaining stream length before taking the TLV value.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-44070

Upstream patch:
https://github.com/FRRouting/frr/commit/0998b38e4d61179441f90dd7e7fd6a3a8b7=
bd8c5

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../frr/frr/CVE-2024-44070.patch              | 69 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-4407=
0.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch=
 b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
new file mode 100644
index 000000000..e58df44cc
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
@@ -0,0 +1,69 @@
+From 0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Wed, 31 Jul 2024 05:56:14 +0000
+Subject: [PATCH] bgpd: Check the actual remaining stream length before tak=
ing
+ TLV value ```
+
+    0 0xb50b9f898028 in __sanitizer_print_stack_trace (/home/
+ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/
+bgpd+0x368028) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    1 0xb50b9f7ed8e4 in fuzzer::PrintStackTrace() (/home/ubuntu/
+frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x2bd8e4)
+(BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    2 0xb50b9f7d4d9c in fuzzer::Fuzzer::CrashCallback() (/home/
+ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/
+bgpd+0x2a4d9c) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    3 0xe0d12d7469cc  (linux-vdso.so.1+0x9cc) (BuildId:
+1a77697e9d723fe22246cfd7641b140c427b7e11)
+    4 0xe0d12c88f1fc in __pthread_kill_implementation nptl/
+pthread_kill.c:43:17
+    5 0xe0d12c84a678 in gsignal signal/../sysdeps/posix/raise.c:26:13
+    6 0xe0d12c83712c in abort stdlib/abort.c:79:7
+    7 0xe0d12d214724 in _zlog_assert_failed /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/lib/zlog.c:789:2
+    8 0xe0d12d1285e4 in stream_get /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/lib/stream.c:324:3
+    9 0xb50b9f8e47c4 in bgp_attr_encap /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_attr.c:2758:3
+    10 0xb50b9f8dcd38 in bgp_attr_parse /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_attr.c:3783:10
+    11 0xb50b9faf74b4 in bgp_update_receive /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_packet.c:2383:20
+    12 0xb50b9faf1dcc in bgp_process_packet /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_packet.c:4075:11
+    13 0xb50b9f8c90d0 in LLVMFuzzerTestOneInput /home/ubuntu/frr-public/
+frr_public_private-libfuzzer/bgpd/bgp_main.c:582:3
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-44070
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/0998b38=
e4d61179441f90dd7e7fd6a3a8b7bd8c5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ bgpd/bgp_attr.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 1e08a218e..ef45d5c46 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -2475,6 +2475,14 @@ static int bgp_attr_encap(struct bgp_attr_parser_ar=
gs *args)
+                                                 args->total);
+               }
+
++              if (STREAM_READABLE(BGP_INPUT(peer)) < sublength) {
++                      zlog_err("Tunnel Encap attribute sub-tlv length %d =
exceeds remaining stream length %zu",
++                               sublength, STREAM_READABLE(BGP_INPUT(peer)=
));
++                      return bgp_attr_malformed(args,
++                                                BGP_NOTIFY_UPDATE_OPT_ATT=
R_ERR,
++                                                args->total);
++              }
++
+               /* alloc and copy sub-tlv */
+               /* TBD make sure these are freed when attributes are releas=
ed */
+               tlv =3D XCALLOC(MTYPE_ENCAP_TLV,
+--
+2.40.0
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-netw=
orking/recipes-protocols/frr/frr_8.2.2.bb
index 03b106131..0823a7bf1 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -28,6 +28,7 @@ SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=
=3Dhttps;branch=3Dstable/8.2 \
            file://CVE-2023-47234.patch \
            file://CVE-2023-47235.patch \
            file://frr.pam \
+           file://CVE-2024-44070.patch\
               "

 SRCREV =3D "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
--
2.40.0


--_000_CY8PR11MB7169140B12429FD24C6BC4C39F7D2CY8PR11MB7169namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Gentle Reminder!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Urade, Yogita via lists.openembedded.org
 &lt;Yogita.Urade=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, September 17, 2024 4:57 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][kirkstone][PATCH 1/1] frr: fix CVE-2024-44070=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Divya Chellam &lt;divya.chellam@windriver.co=
m&gt;<br>
<br>
An issue was discovered in FRRouting (FRR) through 10.1.<br>
bgp_attr_encap in bgpd/bgp_attr.c does not check the actual<br>
remaining stream length before taking the TLV value.<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-44070">https://nvd.nis=
t.gov/vuln/detail/CVE-2024-44070</a><br>
<br>
Upstream patch:<br>
<a href=3D"https://github.com/FRRouting/frr/commit/0998b38e4d61179441f90dd7=
e7fd6a3a8b7bd8c5">https://github.com/FRRouting/frr/commit/0998b38e4d6117944=
1f90dd7e7fd6a3a8b7bd8c5</a><br>
<br>
Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
---<br>
&nbsp;.../frr/frr/CVE-2024-44070.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 69 +++++++++++++++++++<br>
&nbsp;.../recipes-protocols/frr/frr_8.2.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 70 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-44070.patch<br>
<br>
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch=
 b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch<br>
new file mode 100644<br>
index 000000000..e58df44cc<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch<br>
@@ -0,0 +1,69 @@<br>
+From 0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5 Mon Sep 17 00:00:00 2001<br>
+From: Donatas Abraitis &lt;donatas@opensourcerouting.org&gt;<br>
+Date: Wed, 31 Jul 2024 05:56:14 +0000<br>
+Subject: [PATCH] bgpd: Check the actual remaining stream length before tak=
ing<br>
+ TLV value ```<br>
+<br>
+&nbsp;&nbsp;&nbsp; 0 0xb50b9f898028 in __sanitizer_print_stack_trace (/hom=
e/<br>
+ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/<br>
+bgpd+0x368028) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)<br>
+&nbsp;&nbsp;&nbsp; 1 0xb50b9f7ed8e4 in fuzzer::PrintStackTrace() (/home/ub=
untu/<br>
+frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x2bd8e4)<br>
+(BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)<br>
+&nbsp;&nbsp;&nbsp; 2 0xb50b9f7d4d9c in fuzzer::Fuzzer::CrashCallback() (/h=
ome/<br>
+ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/<br>
+bgpd+0x2a4d9c) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)<br>
+&nbsp;&nbsp;&nbsp; 3 0xe0d12d7469cc&nbsp; (linux-vdso.so.1+0x9cc) (BuildId=
:<br>
+1a77697e9d723fe22246cfd7641b140c427b7e11)<br>
+&nbsp;&nbsp;&nbsp; 4 0xe0d12c88f1fc in __pthread_kill_implementation nptl/=
<br>
+pthread_kill.c:43:17<br>
+&nbsp;&nbsp;&nbsp; 5 0xe0d12c84a678 in gsignal signal/../sysdeps/posix/rai=
se.c:26:13<br>
+&nbsp;&nbsp;&nbsp; 6 0xe0d12c83712c in abort stdlib/abort.c:79:7<br>
+&nbsp;&nbsp;&nbsp; 7 0xe0d12d214724 in _zlog_assert_failed /home/ubuntu/fr=
r-public/<br>
+frr_public_private-libfuzzer/lib/zlog.c:789:2<br>
+&nbsp;&nbsp;&nbsp; 8 0xe0d12d1285e4 in stream_get /home/ubuntu/frr-public/=
<br>
+frr_public_private-libfuzzer/lib/stream.c:324:3<br>
+&nbsp;&nbsp;&nbsp; 9 0xb50b9f8e47c4 in bgp_attr_encap /home/ubuntu/frr-pub=
lic/<br>
+frr_public_private-libfuzzer/bgpd/bgp_attr.c:2758:3<br>
+&nbsp;&nbsp;&nbsp; 10 0xb50b9f8dcd38 in bgp_attr_parse /home/ubuntu/frr-pu=
blic/<br>
+frr_public_private-libfuzzer/bgpd/bgp_attr.c:3783:10<br>
+&nbsp;&nbsp;&nbsp; 11 0xb50b9faf74b4 in bgp_update_receive /home/ubuntu/fr=
r-public/<br>
+frr_public_private-libfuzzer/bgpd/bgp_packet.c:2383:20<br>
+&nbsp;&nbsp;&nbsp; 12 0xb50b9faf1dcc in bgp_process_packet /home/ubuntu/fr=
r-public/<br>
+frr_public_private-libfuzzer/bgpd/bgp_packet.c:4075:11<br>
+&nbsp;&nbsp;&nbsp; 13 0xb50b9f8c90d0 in LLVMFuzzerTestOneInput /home/ubunt=
u/frr-public/<br>
+frr_public_private-libfuzzer/bgpd/bgp_main.c:582:3<br>
+```<br>
+<br>
+Reported-by: Iggy Frankovic &lt;iggyfran@amazon.com&gt;<br>
+Signed-off-by: Donatas Abraitis &lt;donatas@opensourcerouting.org&gt;<br>
+<br>
+CVE: CVE-2024-44070<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/FRRouting/frr/com=
mit/0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5">https://github.com/FRRouting/=
frr/commit/0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5</a>]<br>
+<br>
+Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+---<br>
+ bgpd/bgp_attr.c | 8 ++++++++<br>
+ 1 file changed, 8 insertions(+)<br>
+<br>
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c<br>
+index 1e08a218e..ef45d5c46 100644<br>
+--- a/bgpd/bgp_attr.c<br>
++++ b/bgpd/bgp_attr.c<br>
+@@ -2475,6 +2475,14 @@ static int bgp_attr_encap(struct bgp_attr_parser_ar=
gs *args)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;t=
otal);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (STREAM_READABLE(BGP_INPUT(peer)) &lt; sublength) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zlog_err(&quot;Tunnel=
 Encap attribute sub-tlv length %d exceeds remaining stream length %zu&quot=
;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sublength, STREAM_READABLE(BGP_INPUT(peer)=
));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return bgp_attr_malfo=
rmed(args,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BGP_NOTIFY_UPDA=
TE_OPT_ATTR_ERR,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;total)=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* alloc and copy sub-tlv */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* TBD make sure these are freed when attributes are released */=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tlv =3D XCALLOC(MTYPE_ENCAP_TLV,<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-netw=
orking/recipes-protocols/frr/frr_8.2.2.bb<br>
index 03b106131..0823a7bf1 100644<br>
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb<br>
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb<br>
@@ -28,6 +28,7 @@ SRC_URI =3D &quot;git://github.com/FRRouting/frr.git;prot=
ocol=3Dhttps;branch=3Dstable/8.2 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-47234.patch">file://CVE-2023-47234.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-47235.patch">file://CVE-2023-47235.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://frr.pam">file://frr.pam</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2024-44070.patch\">file://CVE-2024-44070.patch\</a><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;SRCREV =3D &quot;79188bf710e92acf42fb5b9b0a2e9593a5ee9b05&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CY8PR11MB7169140B12429FD24C6BC4C39F7D2CY8PR11MB7169namp_--

