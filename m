Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EAAC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:17:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5184.1745583449486395702
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210385b2d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PBGAvd018199
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 05:17:29 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhauqqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 05:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIJty81EelXlMQWuQ47OL/tHfRqMwc9oWFy8SIEn+9ogvnotePl6bUznkyixxxfUGKxTQ5cpN4jWXCOyeDZei2I4zZZM3mmXPP5u8St2AbeNaJwRjXI8FN0XD2oRAzXJh6Z1GmbNqWToV4zFYA0xYWHa6tace5ifwWy7OPWnJ/oWgafgTm6tF+ImBjWIN1dc4eqjqPdRCTVYRUWfzgtNussJWPUEWjG8GrPRuX7c7VKHNc4r5ol5e1GYYxRj1ZHeaZ3oQy3WdTNBUOJXFGgzOmtFnIajmjiws/BVwPZb926WPEHBSDDzsO89NwPJfmGdZRAkVdNmg6gY7+ssJisNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY8o+yfStBKfCXeVRoYHZxRn2OVrUuOCGKEX3uR0ESM=;
 b=QyP2/EP1a4IRVPZjLEhtUUAkyUF7HMJKbuiY9k5Z8Nb9E/+fFfnw4XJIIaoenceL7g3z9sz6WEMm4sRbrkXT70JkFO4zEcVOPq0tVrlAL+4llvhaAGUyuhmr08dSRU6son5CiLYQUy8ravOa6hr1jvEseMuLQS5waA9vZOlXpabM2OsC1gNCXo20omDbHxVEf/PtWDChrqqhESF2akra4w5KjJqA4qCoKGeAMkcBt9x364IpCSdBVSOzwi7s68adocy/78xf2a0ZMMcLTHIeTMDVPHX+xtX9ojcqr8B22S+ncF4eEqoMTlxKAabwJiSdXCtiDlJiEkA9eezFePuipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.26; Fri, 25 Apr 2025 12:17:26 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 12:17:26 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe] [oe-core][scarthgap][PATCH 3/3] perl: upgrade 5.38.2 ->
 5.38.4
Thread-Topic: [oe] [oe-core][scarthgap][PATCH 3/3] perl: upgrade 5.38.2 ->
 5.38.4
Thread-Index: AQHbtS0uoUImaoFnxEek00ddales17O0TZvw
Date: Fri, 25 Apr 2025 12:17:26 +0000
Message-ID: 
 <DM8PR11MB5703EF84D51958D72EB4F98884842@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <20250424152453.2431217-1-archana.polampalli@windriver.com>
 <18394A8DBEED35CC.24164@lists.openembedded.org>
In-Reply-To: <18394A8DBEED35CC.24164@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|MW5PR11MB5931:EE_
x-ms-office365-filtering-correlation-id: 0a5decb4-71f0-4719-ba1c-08dd83f3246b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?GjFuBsK2uhux4V+gy0r5XdGO0LP2uSyFSESCL8HWguNFeVCl0y7i9A31D2r+?=
 =?us-ascii?Q?5IDiWCmB03Ywy+X8Kl+5aMnIwKzBMNSMUYIlqa4Qx+lW04JhhyRBbCntwAQX?=
 =?us-ascii?Q?IdvzUl41QsTureqjy5ex771bnpM2bc/x6SugzU03WYHL9dZ+bpP5jLpL+fuO?=
 =?us-ascii?Q?CrFbeTIZVQGVbwZI64rmXBV3grOhL4oRPiMfz0M7OyKy7Ck0gnKa819vLvTP?=
 =?us-ascii?Q?FPHDAnXg4KJOwm6tSgRmv7H4bDlJ2C6bs7yvdjE236GLR5b2FfRfAxD/bjt0?=
 =?us-ascii?Q?39/zBBxcbu+EKztGwNqytqQmomhDv3y2i/G9MImC55RlqvH5z6tOeNZBdbOn?=
 =?us-ascii?Q?PIc82Mvo3FJXa4ev9BSBB2sqOVS8TkupaOErIHpM5ViT/Vt2YW/2FiQqP0vi?=
 =?us-ascii?Q?ahYAByhPnHb3A/4t3bsYy4PMhZoGXGncp1rFet9StmRsP3LyTdkUpFWFiBQE?=
 =?us-ascii?Q?6wqbcYfRENy/8/OZ6SrrRR8VtFSAOl2faoFtj2Thh/ojQKmMjGr5ch/9yjZI?=
 =?us-ascii?Q?/zzs6SfBoVC55hwiqtg5fAYr4NwIgFDm8ecTgozUdsiSbjRjOsOLlH5ML8JH?=
 =?us-ascii?Q?Z+jpuswA4g+DiiQtt9TpPM4j8z0byWtN2OtZ+ZhWrtwjksjYDSm3ib0tjobO?=
 =?us-ascii?Q?ksplhGEA5+p9Wygym+K064xWaIbNc78euoNx2faM42oZz+b5kqnpTARi++sy?=
 =?us-ascii?Q?CQUUkWsf5gSMAll9irwNFL+MpYOSqAZQBz9FN64kkUJkiFpI2ysPeH3223Kt?=
 =?us-ascii?Q?TLPP/vyQIeNF2sufu2xlenFtm8DgMayzKw0D0HvLpXTvo7KjS8AGwAeBHJ5p?=
 =?us-ascii?Q?nrQa0u2Eb0yLm/6OA4EXQdwc06pg0cG59adA5tdEqFKI+WyTc9hLqgaHof3u?=
 =?us-ascii?Q?JrDM/5soq1n+h2XDdS02bEM+L2t4c+TJdvbTbf9gDYzmONYQLz4LBiksOFcV?=
 =?us-ascii?Q?M6xKFBYaG49LIJ5J2G51rAaS9gpDrPpPYjmpiGQt1fGeOaHRrGOc3uUu0q/X?=
 =?us-ascii?Q?dhXjg6Vt3/wMir5Il3qrlJI2+uFD2C7YOVZ59r3Y8kfNVgrcS1XFu5uTfIK1?=
 =?us-ascii?Q?EOtoNJ/86oyOqRkWziitScbd3PzGFLxdCLUhISU9NEbYFlqC14o2rOjtgGqh?=
 =?us-ascii?Q?Mh1CQ71DUhFiWxAECXTEaQZP4Aa3moJASXdiXvydLsrVqvTfvmdFDz18y1Qa?=
 =?us-ascii?Q?t3lT7vNAngoee2Xc6igUMWegTAZqgx3Cc5xryQO+Vj8tboXgfeY6ThzGoBvX?=
 =?us-ascii?Q?fxVbZfZsgbikEo25Hl4lCbvgHGXhXmdQbxDgsP7ODG96AaYhHYYiR2bRStZ6?=
 =?us-ascii?Q?N8eIMyThU81+Uy1pIRlyN4amGd8NfYImqbe5T+Rra9GMW+Yvihs/D8ErunjU?=
 =?us-ascii?Q?l1adr27V15mbwmpncGlHSeWhT4IjPevThYFvhUiO/6VSgX44EkjJfBaQmW6t?=
 =?us-ascii?Q?P7mKhzD47HI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Zfg2+uAyCH4fkefv9IiRqtdtSc4JrHg1MuTFWci0qF2Z8DIB6n5c/7HvW8vQ?=
 =?us-ascii?Q?nbKxORNnhd18t/+Er0gLyFg4KXXYWrcxoj8jL090zTVN92ORIUbdU+lijl1j?=
 =?us-ascii?Q?FnYOWb/L0oXAxA45pPS+3+xLi7gvAH0/W3Vvd5AoC8DVyUGkVTZv/xLVT89E?=
 =?us-ascii?Q?1ezGcIW1mZte4rqxXXXH8xsDRm/enjpCei1JC/kYaA/oxOTZ4Syj2WeOoIzn?=
 =?us-ascii?Q?lHG+lw0kSgs50SRd9kJREVzMFqC0vPgsZixb7dGskW6r2zvw4XRmtqSuLXLC?=
 =?us-ascii?Q?7xaFW43P2sczKE5z3tIFIxwWfC2R8OnPsA9I+nqeX1zoJNs0QriD5cXD5hSY?=
 =?us-ascii?Q?QM1xvZ+KtvOpSjQ5PF/SrYcFBW/+ZV9YJFRS0QL60C2iOkFpVbLU4mZAW8Rz?=
 =?us-ascii?Q?LPKvkfZGEicUNNRPbH1v5PjWOS8RuYuK5Btbi3/KmcGh7IK2WG4bXT06exqy?=
 =?us-ascii?Q?TJOfW17Y43liGKkBO6Uidcjsz7qdMU9MPffXYzYyXjMsliJuVzjYB3MqAxvP?=
 =?us-ascii?Q?9iZPjXeXDXS1cSlGL5cRx5fqeKjTqfIuXCVSkn4EObp3zDt6UMbEeS+TMXsB?=
 =?us-ascii?Q?YnXAk3fBn1vUiIfzso+QGTrKKFXhfJ+r/eq//kYFy7qNJa70bnHTiiSz9gTF?=
 =?us-ascii?Q?lRpU71D1RM8uOGbXcKiHhA5SpN9XTDpgQxWw6ht6FhVX5gglNxeoPqEhP/S7?=
 =?us-ascii?Q?yv6UjOIqRJMpdrgLgXyC+NKJ41W6qbUwjf77I8EAyJ+3f8fKSAgIs2giz8tP?=
 =?us-ascii?Q?t6S1cv5k+O02XlDkPeYx+2Jw4rbWXl311dhtg9oppeAFzeb0+ZuiWcnDq8H+?=
 =?us-ascii?Q?wGeoSHVRKVWROb42rBjrj+TPBlWGcQQstcr77dxhO4+BZL1A2m709hWVPCZB?=
 =?us-ascii?Q?Gjthdc0syvpkbT8b78VVvNmEK9BB4GI3NtqG0D2//buZCJsj9hrR/tdtu2KH?=
 =?us-ascii?Q?F3TZceXjSmeiKvFUfoieFopxjnAJyby2Jifl1TcgE8ULSuWrq4j/DlYtWLMX?=
 =?us-ascii?Q?f5aAyP9ldnwNHwW7D9joZfIOar9hpuwQ0nohc5mXVs3ry/Mma2T3lI280hca?=
 =?us-ascii?Q?IwyDFM1RLhecIlbVdZMfK7uy1iVD99/dgbRAjg0iOpmnDmyCKvQtz00C+WLp?=
 =?us-ascii?Q?whKv4po7GOWWd/S6pS1Bs7m224Pmtal3Ljbfup+ngVQCb8/FbT0Iq/pvNGWF?=
 =?us-ascii?Q?VjOHags6Iu/rFew8qHDZu9TNwkHuAPLEHsC1p8Yk1UFpmT+Nk4OZ97ouoyAB?=
 =?us-ascii?Q?4ag1JlGaEPCVcetV00SExQXKXo0tx0oTo1M9NhRmwzgas2R1uSqNbZVVeBpr?=
 =?us-ascii?Q?uwGGnpyHURFnLVtcCM8wZENU9nqR/EFSxL7DdGuif19LfJ77iUMy7BRSuiHI?=
 =?us-ascii?Q?+RNxvdlatsZ4kmMfteH/AXOyS3VLL7gUdaIXf1qKGw9Wg7LsiSBRKOIkbSm2?=
 =?us-ascii?Q?Ok03jbhc5sPnBqgkO0SfH/4yGjJIqpitO5jl0OTSI3brh02S16KhrovuwaKi?=
 =?us-ascii?Q?ic/IUPL092DktXXnhB1c/HCucrOucP6Z8+rn8H7+alObdcpSwGXfRqSx2dwJ?=
 =?us-ascii?Q?Jh2uvczvl8dh4s/nmyKkEtlTEQiV1dWOpbdNZgJUclbq1GEOO+7RYJqd2biX?=
 =?us-ascii?Q?pw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB5703EF84D51958D72EB4F98884842DM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5decb4-71f0-4719-ba1c-08dd83f3246b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 12:17:26.7730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GuEQS8x2pyOggjVnboxGRns+YHg/m+0gVf4ftAz3ROmq0WbSUFw5UzrXVCo8d+blFZHte1PtLRoLRV/xZreGSMA1afKtQIFOh+pm1x5zB15sCD5AILT/R03RYsWETK0C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
X-Proofpoint-GUID: 5TngxF3kuNuf2GOBNfgHOA5sQDyIDR6m
X-Proofpoint-ORIG-GUID: 5TngxF3kuNuf2GOBNfgHOA5sQDyIDR6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4OCBTYWx0ZWRfX6LAuitEXd81p u9dezJfJ5Xn5Fn4ihm9HokKmsRsr+qt0CLBlG/eJ/8/60duMoE3lPgfa2T4Lcc9hWvDNqeC9AgL lcvC/B9sl24GEqgS65Ezy4+7qgOrPQlsBO0Bj4lnDR9g+YO74ObpEH4uEzx3Zdsx2bMITFShtXW
 s335vkOqRbQ0jzy7VsUReVd/Oqe3kxco9Ehby+zfmVL6rNJMF7yITJ7y14qz0uaOBDv5FcV3Yvx AfrHcsMOd8ExSjk88lD0sJT0bzwyYx/FNqN0BeRIwA7glnl+fcWCRhGGDmZTtLGeNYfj9vQf0hd BnrXw/oHmAoZeX9PcDAjxYNAkBcOcs8SksSmPYeppqKohQ5ap0I7ZAkTOC8FfJShzK4bLK3pCKt
 JROksQ0/M3D1fGELGYwJSY42manvVdRnpSuSCRWyS+a0fgA1pcqsl4VAQ3BGyTKz/82yV0mg
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=680b7d59 cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=_IEhM8lNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=W--2V7L1KeMcrOQ6b88A:9 a=CjuIK1q_8ugA:10 a=Grrnp93B5iH2oQg1:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=WN5SZLvFwbRUu1hQBHWk:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 12:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117128

--_000_DM8PR11MB5703EF84D51958D72EB4F98884842DM8PR11MB5703namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Thursday, April 24, 2025 20:54
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [oe-core][scarthgap][PATCH 3/3] perl: upgrade 5.38.2 -> 5.38.=
4

From: Archana Polampalli <archana.polampalli@windriver.com>

update include fix for CVE-2024-56406

https://perldoc.perl.org/5.38.4/perl5384delta

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/perl/{perl_5.38.2.bb =3D> perl_5.38.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.38.2.bb =3D> perl_5.38.4.bb} (99=
%)

diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devto=
ols/perl/perl_5.38.4.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.38.2.bb
rename to meta/recipes-devtools/perl/perl_5.38.4.bb
index b6c9cda7ae..e59022e2bd 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target =3D " \
            file://encodefix.patch \
 "

-SRC_URI[perl.sha256sum] =3D "a0a31534451eb7b83c7d6594a497543a54d488bc90ca0=
0f5e34762577f40655e"
+SRC_URI[perl.sha256sum] =3D "fb888accf8b50b5180e91166e5153608be294c57c1987=
8e95f7659c1f1f12758"

 B =3D "${WORKDIR}/perl-${PV}-build"

--
2.40.0

pLK@tY:ATbOf1"dW

--_000_DM8PR11MB5703EF84D51958D72EB4F98884842DM8PR11MB5703namp_
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
Kindly ignore this patch</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, April 24, 2025 20:54<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe] [oe-core][scarthgap][PATCH 3/3] perl: upgrade 5.38.2 -=
&gt; 5.38.4</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Archana Polampalli &lt;archana.polampalli@wi=
ndriver.com&gt;<br>
<br>
update include fix for CVE-2024-56406<br>
<br>
<a href=3D"https://perldoc.perl.org/5.38.4/perl5384delta">https://perldoc.p=
erl.org/5.38.4/perl5384delta</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;meta/recipes-devtools/perl/{perl_5.38.2.bb =3D&gt; perl_5.38.4.bb} | =
2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta/recipes-devtools/perl/{perl_5.38.2.bb =3D&gt; perl_5.38.4=
.bb} (99%)<br>
<br>
diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devto=
ols/perl/perl_5.38.4.bb<br>
similarity index 99%<br>
rename from meta/recipes-devtools/perl/perl_5.38.2.bb<br>
rename to meta/recipes-devtools/perl/perl_5.38.4.bb<br>
index b6c9cda7ae..e59022e2bd 100644<br>
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb<br>
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb<br>
@@ -26,7 +26,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://encodefix.patch">file://encodefix.patch</a> \<br>
&nbsp;&quot;<br>
<br>
-SRC_URI[perl.sha256sum] =3D &quot;a0a31534451eb7b83c7d6594a497543a54d488bc=
90ca00f5e34762577f40655e&quot;<br>
+SRC_URI[perl.sha256sum] =3D &quot;fb888accf8b50b5180e91166e5153608be294c57=
c19878e95f7659c1f1f12758&quot;<br>
<br>
&nbsp;B =3D &quot;${WORKDIR}/perl-${PV}-build&quot;<br>
<br>
--<br>
2.40.0<br>
<br>
pLK@tY:ATbOf1&quot;dW<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB5703EF84D51958D72EB4F98884842DM8PR11MB5703namp_--

