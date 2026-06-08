Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35BECD8C8E
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 07:28:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48493.1780903693529574683
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 00:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lxM1oYAP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=061903de4a=li.zhou@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ttma3490463
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2026 07:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=7VLZoAyI+
	355D/tMlSPMd8M2fC6Li9kSJvMeZzwHxvw=; b=lxM1oYAPp3Y5FYxqBW3wrbXV1
	GIi3e3hATwhzWJVG0lgwHlgg/JBEDCsBOUFi1VSWWnlBovwfmhW6A5IvVMgChttg
	uVdf8bvrNFuZXC8AVkxiSvKLu7KNaeo2ToR2JxfVe+Gd1uCjgZprP26OrgW+K99M
	LHnTOIo9mX7oatLHAFwS/9tiNqX44ivnxemN3TDt39XtrQ0Uy79CL4bNj7qU/mMi
	120tAu6mDX5/XyoJbohzPE2AQkbScZjmTM5jMggd+mP71vfE+MuXI+Y2DQN5+XkA
	EIDtqJ+TRHk0uYMRcUQLsi/tQosm5wfxGbMwCWsgXZe1OGWFLtOiSi4Oy9H6w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emah7aau3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 07:28:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6d9cMf19UYvvTLtmUFsHit8WzdYz3tuCDy+80/EY9oO0k2KK07qqVSZmmJWiUT9hzzDJUSpb4EHyLEC9kCT9zv1gFCG7NL+9Zln2h34QfZMBwlcOhD5xQ9PG7xd6btJ7W+NZKAUWOggi7+1KanqxMJCoO1hfJDlZ7cbTz58jOnSqJWh1TWL8H2xhdKLnlZCGtpOJg40mtjdpDlUfQEMwuJ2Rb4Ucwadn/wzNLHT5XJUJUEZ4YqjztFYyHlBBJ3oP+WT1WiFP8HWoUNi//kkNgkmZg+pFAHhZEnMJBsD/v4TDX4k1HJwSQR84uwnsaj24YHrIAFrI6MIL4c79ylOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VLZoAyI+355D/tMlSPMd8M2fC6Li9kSJvMeZzwHxvw=;
 b=G70F7gQl1y9WVclHCyAcnSm6Phe3IXhBHZUQbByLJKKEMB/MZ/BEade5rrXquYgCz/DxO+Eh/bPvjxHLCj72+Y6El22SI0Z5Z/o44+ThaGheHCZqunstNPl12qgZRiKxzMIBdqfTD08lqz/RsUc6aLwwkJFc+1u8UOiw6viIlMBfE9vle3xQX5D1Nq4faa98geurbmfaJGcLOlaiuNQviiRvKYlusGiyYzokn6OindaKebsEMHYGpNeLWi24srYFxKhmCtUSDiGW1Y1DkkhBEUIwwXVIpuVlDYeQTuQMogh3PSpNCZP1dqfAwcZdYKD+UGIYKXaQLZ4Gk5RDSZXcfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Mon, 8 Jun 2026
 07:28:08 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 07:28:08 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [oe][meta-oe][PATCH] minifi-cpp: upgrade 0.99.1 -> 0.99.2
Date: Mon,  8 Jun 2026 15:27:44 +0800
Message-Id: <20260608072744.3252900-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0053.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::16) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: d5218929-97e6-48ed-53c2-08dec52f7ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|12006099003|25016099003|18002099003|6133799003|29003799003|38350700014|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	nO7/QVHlaoKT2HkVC2xMSDHeJtcuao5os7rDDN0zoT1Pup/6rBYPfx/HoQbPcYsujGi153g9EG46iXGnPEhAnKjnewShaOut2u0FRm/zWOyXzDVm5Ea1KI0CfcSTYQQYhhRz0sSem8gJCgoReFKXnphXulBiONQPygRXQqUSMw1HTHm45rqVbqMzKYnI+f+Dml8k6HBpvhjFOj9UB0wCC8OuHVUm3u2hdkBrBUsWF0ai/b7RTjC4mAF0I4O83B5GsqSmry7OtWnq7+33fPIvVot5t6yP7m2CviFQuXSQGDPUd/OhZNCxSsbSCsRMXGYZA+igt+uMY5sZ77M1ywXQAa8HGGCszbCuaCORGDJ3a/5+hhTuVeGN2a5P2pQ5GRFOvftJARPp71TzR8ToIjaLkbuliHLb24dKeF77/5q1bITZw7ePUKoLeZmaJCiGRUepHncInSU+IixyY5j4upasUYB87UEJKJtc0YIjDOG6/FK1Vuk4q35+FrXddGvT/zGB8TA6i8c61rDRhhBH8SId0RY99BbK5HaQBkSkiDAPmqnIfYBy+wB39sCuK/7Ijw3eAOo616huA9VjrWlJmbmGzJUXU3A9pQ5Jt1JbzJa6PO4xeAUIr2QTqvkaUh2w9RI3EhQ8I16AWlZAnnvbRGEkUSsqc/VqLj9kGzzVvfQwpaY/NEpzA3JEC+lHf8fLKdL5MEUo6UGNA0vgW2ag9jyXrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(12006099003)(25016099003)(18002099003)(6133799003)(29003799003)(38350700014)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8TCVXflyi/YXmk1COmPRQQ/jWRXJV84T1Z+vq5bt/exVimi0T9fNENDk2x30?=
 =?us-ascii?Q?I9R3DLcvoqOwxN7h3ciWrRNSP8F6kLWrj54c1OXaLO2tEeVWRsw+BQ1k8paf?=
 =?us-ascii?Q?1o4cdTXAVsSQFpNt5WUNNZGEw5rZ9VEIVijQJuMVHVhDUSpBlQwXqMu12gE1?=
 =?us-ascii?Q?KnP3qkzWe9cETfYnPSxhvNY1vB4Orc+6P7ubfGMlXEuP23BPnqEp3kFI8PO4?=
 =?us-ascii?Q?xQFDdOzQ9atXoeFUsJkD5a01zxuCcwx/6O9qfbkTqHIueGGvE53+6shrWexz?=
 =?us-ascii?Q?k7idc4Tab6Yn7dYM9RgKrhWujC1fEgXODZC7VSeQeklQ5noXuy5a6qC0IZTM?=
 =?us-ascii?Q?TRonwt6sJRcZ1JEuFaG6dmHDI7KVtQtcb0c3WJ3MyO7Ka1EjTgVl2jbphXnH?=
 =?us-ascii?Q?CTQwbUH8nJguZQWSAzdvSim2D0dt2vkOGeqq9SJ6+XXXkVfi6JNCPAWCQ57C?=
 =?us-ascii?Q?iazm8H9cSTNyOfzseZxrJZ7x83FDvZEEAAdo8xhQS5slArxgjhDKdlOLZ3IE?=
 =?us-ascii?Q?t4RPcMnQ97iyBN4TnhjblG7BRz2f6FX76KHADxr8VJ022ZSACdzZTlZRzVhN?=
 =?us-ascii?Q?GwIOwLUzujd4lLEmRm6OyYyphVsAVl2KxhQaVGosKXoQB5Qc2XGp1YVgmm3X?=
 =?us-ascii?Q?4QPVPsh6VIJXMs8RHCzFykbR2hUaXWE3suSP4wxrevZQVziOKOoU8tacR/2O?=
 =?us-ascii?Q?rV5Qelyt6EH0Ra8gTtn7FlIWTwIBbd9r6Fmh3e9Dry4EWuLa9ip1EVROLBGr?=
 =?us-ascii?Q?xG61YATIxQO7SjQpxFe3V5m95ma6q6IMduYr6Y1qxIPCbWojys3S0G9xwz/6?=
 =?us-ascii?Q?j8KDvh7WbTGO2nRA3p7TSX9fRge02mJoVT97T0W/CFzBTb4t/FJKSRMlrEWU?=
 =?us-ascii?Q?Yv/99pYwYX3uUVVTu9J53omy+8kGrgrK2/fe3wsFgcHVksSg4l75bUQbV4DV?=
 =?us-ascii?Q?xV3MGi19NV4zcsz/Vrm4tw6K7m0BiZrFWXz/mavdb/O7zdKV0tkLT1e2HBRa?=
 =?us-ascii?Q?Id/U/fNQMDrBjveRJfaNqb2YGoxS8tdozEQvwcFLA7LgExxcEAmOtsSMfEgZ?=
 =?us-ascii?Q?mW07TGSpzcXGH0CvZAYc7KDj8SNVnK6Yex1B+LPxReK/+rLnbSHZvwks8yVS?=
 =?us-ascii?Q?oJ+sd/6Ky8kjzdDEYxbnSlcPzhJ5Exk/r1wWc1KCjNPQwRk/YIERAlTHARVw?=
 =?us-ascii?Q?unTZCDptioh1FJEykUpizMjTCQn+TA2R2KoswUVXf+zKT571qN/65J3+Uxhv?=
 =?us-ascii?Q?PUSMwMtTnUmFak/+9yYuHzBhk/n6mk37bXKYimoyFf+VBJtV5Y2pev8yI0/1?=
 =?us-ascii?Q?rUYGVjfIAFry9Yq9CtnKpydTodOboBMwh54Pnp4IAhthEHK0L2jx+VftOk/m?=
 =?us-ascii?Q?yy8wof0IAuXtXapUZOTps52CTzvAdEf0YydpC/qZo5l8RXkU7cCYzWGEnXfK?=
 =?us-ascii?Q?latwRvVB4fdy6+8s/eHA9QpLcjxQ0QrRyN1035Gb+YX5BBV8LjWRyesZcbl5?=
 =?us-ascii?Q?ygrf1sg1Gda8rwIqIixT8D20YfPNwg0R2V9DafyDVXCHRdE3nQVOU0GVU0CT?=
 =?us-ascii?Q?gCJMHk+QeSN6k6tuXm0QiDL3PdoENjaj9kMebNlicVgT7gb9+rm5wNBVk3+J?=
 =?us-ascii?Q?TbzuMlWjktdA2SfRJov+tPPKt9go1I8emioQ8L++8nrUt6cf4EMSusLROoob?=
 =?us-ascii?Q?UCjUB+I178lG0B96chtqddcG08C3OLiDC+Jy/60D9Sv4symoQjYIDV+QUmE9?=
 =?us-ascii?Q?8pTeGiA4QQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	JwrFo1lN3+8cGuv7BBx9ImG8Wjy36g8FhOH21To2+sL5Fk5czTDhcZtP55s6EtdG3PMJvirgAfDfe3iQsm+jOpd2KSX/3fBz6O5hdfr4NHQgSb8y00oa9/0lErZGcvg3KaqhcR2sUoSqZ0S7HmY/noI/e6iHvA66lMSUnHgMoSsrWUfZWwi1WBWhg3zBe0yE1So3Sfck7cKRaL91Y+O8wXziYEKFUMxfk58VKx2FTzwHbGfwHx5WCziOYhydo+ghBq2bakWRIa0baEZJEke1YVwxr4pze43n4ieSjV05CFbtMIJtbDUFHsYehyzdeJRC3+5QcXtGB8NJUnsIgjEdTg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5218929-97e6-48ed-53c2-08dec52f7ced
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 07:28:08.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVnFo9Sq5kMM2BULq9hIzGP8XIUCUNp3J2UhxJss0SGRENICRMThl3+mQlsUey/f19KEse7zn0+bU1Qc8P0HAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NyBTYWx0ZWRfXxU/xusvi1SWv
 IElcYzX00n79KL9z+EEH9p8Mf9NX7D7yuhERbFqrQsRDmjzGznG6Vk2QbkphoD13gno09h9uVUj
 wPyZiy1dojr2k2m20nLY84hGy1YZhT4VIMrwFnlI0lHNEpVHSvvvzzg8WhjBPaEGBV5I91c2Qas
 kKS11MoTqG81DzViJBZYuBa/4idj6tE3vgRO0zewTPazSNlnGyddFRZh+FGDNLXp08oYt3icYL9
 sCNPPHmYjCcIBraxB1618cr1QMnBP1hyXDywd+oSXq7Yhd8OsgUz18VJ+zohITdGeWnevY1j1pX
 fzDlc9UK3ihVzplYL9WVS334bRGS6El8BCaC4A8DGQlJV/GEPKc01TCUWuPH9I7GV9oo4bUHUzC
 GJo22LxepImwJwPmpVKqG9hzxTUm8gkIaFuxygMOYANVFnRVIVlT6ta/cCyUHgiBlgeMQyNYtpV
 VnIPKuFXN2SSC1Zlv7A==
X-Proofpoint-GUID: AkrFVgqRF0qkJp4-UuihHKNkvWf9x-R9
X-Authority-Analysis: v=2.4 cv=NbDWEWD4 c=1 sm=1 tr=0 ts=6a266f0c cx=c_pps
 a=kezO0BecKy1es1U8+DqiPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=mV9VRH-2AAAA:8
 a=NEAV23lmAAAA:8 a=3ngDpdnhAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=_tHNZqXfQ3YYcJfoizwA:9 a=O8hF6Hzn-FEA:10 a=aupxLwd5jg1hj7vrjLfh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AkrFVgqRF0qkJp4-UuihHKNkvWf9x-R9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 07:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127420

Below changes are done for upgrading minifi-cpp from 0.99.1 to 0.99.2.
Updated below patches:
 0001-Do-not-use-bundled-packages.patch
 0003-Fix-libsodium-build.patch
Removed below patch for it is available in new version:
 0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch
Updated third-party components' versions to be aligned with new
version's release note:
 expected-lite	0.6.3->0.9.0
 asio	1.29.0->1.34.2
 fmt	11.1.4->11.2.0
Added new third-party component: jsoncons 1.3.2.
Added DEPENDS on pugixml 1.15 (use the version provided by system).
Added new configs to disable unnecessary third-party components.
Aligned file names and installation paths with new version 0.99.2.
Correct LICENSE.

ChangeLog:
https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=65145325

License-Update: Added BSL-1.0 (jsoncons) and fixed typo in
                concurrentqueue description. [1]
                Removed TinyXml2 (Zlib license) from LICENSE and Zlib
                license is needed by other bundled components. [2]
                No new license type. Changed protobuf from
                "within gRPC" to standalone bundling. [3]
                Added MIT license (llama.cpp). [4]
                Added benchmark (ALv2) to LICENSE/NOTICE. No new
                license since Apache-2.0 already present. [5]

[1] https://github.com/apache/nifi-minifi-cpp/commit/e25a247a4
[2] https://github.com/apache/nifi-minifi-cpp/commit/f28961cfb
[3] https://github.com/apache/nifi-minifi-cpp/commit/97087b22e
[4] https://github.com/apache/nifi-minifi-cpp/commit/8602b76d2
[5] https://github.com/apache/nifi-minifi-cpp/commit/54a643c72

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../0001-Do-not-use-bundled-packages.patch    | 82 +++++++++++++------
 .../files/0003-Fix-libsodium-build.patch      | 11 ++-
 ...MP0065-OLD-removed-in-cmake-4.0-remo.patch | 42 ----------
 ...ifi-cpp_0.99.1.bb => minifi-cpp_0.99.2.bb} | 62 +++++++-------
 4 files changed, 99 insertions(+), 98 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch
 rename meta-oe/recipes-extended/minifi-cpp/{minifi-cpp_0.99.1.bb => minifi-cpp_0.99.2.bb} (86%)

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
index 68fd1ee3e0..98044877cd 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
@@ -1,4 +1,4 @@
-From 4952f03d150770ff06f9a12ff42d8de680407649 Mon Sep 17 00:00:00 2001
+From ff886f41c471a4b7d97a5a4473727a8b1d8ba2bb Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 19 Mar 2024 19:39:04 +0800
 Subject: [PATCH] Do not use bundled packages
@@ -9,27 +9,32 @@ xz, yaml-cpp and libxml2.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+[lz: When upgrading from 0.99.1 to 0.99.2:
+adapted the patch for context changes;
+added using external dependencies for pugixml.]
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
 ---
- CMakeLists.txt                       | 3 +--
- cmake/GetBZip2.cmake                 | 3 +++
- cmake/GetCatch2.cmake                | 4 ++++
- cmake/GetCivetWeb.cmake              | 3 +++
- cmake/GetFmt.cmake                   | 3 +++
- cmake/GetLibCURL.cmake               | 3 +++
- cmake/GetLibXml2.cmake               | 3 +++
- cmake/GetOpenSSL.cmake               | 3 +++
- cmake/GetRocksDB.cmake               | 4 ++++
- cmake/GetSpdlog.cmake                | 4 ++++
- cmake/GetZLIB.cmake                  | 3 +++
- cmake/GetZstd.cmake                  | 4 ++++
- extensions/libarchive/CMakeLists.txt | 6 ++----
- 13 files changed, 40 insertions(+), 6 deletions(-)
+ CMakeLists.txt                       |  3 +--
+ cmake/GetBZip2.cmake                 |  3 +++
+ cmake/GetCatch2.cmake                |  4 ++++
+ cmake/GetCivetWeb.cmake              |  3 +++
+ cmake/GetFmt.cmake                   |  3 +++
+ cmake/GetLibCURL.cmake               |  3 +++
+ cmake/GetLibXml2.cmake               |  3 +++
+ cmake/GetOpenSSL.cmake               |  3 +++
+ cmake/GetRocksDB.cmake               |  4 ++++
+ cmake/GetSpdlog.cmake                |  4 ++++
+ cmake/GetZLIB.cmake                  |  3 +++
+ cmake/GetZstd.cmake                  |  4 ++++
+ cmake/PugiXml.cmake                  | 20 ++++++++++++--------
+ extensions/libarchive/CMakeLists.txt |  6 ++----
+ 14 files changed, 52 insertions(+), 14 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 50e31d871..fc1718dfd 100644
+index 5cf1c4e5f..36aee1508 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -265,8 +265,7 @@ include(GetSpdlog)
+@@ -285,8 +285,7 @@ include(GetSpdlog)
  get_spdlog()
  
  # yaml-cpp
@@ -106,13 +111,13 @@ index afd38f3c9..0eac59ec4 100644
      endif()
  endfunction(get_curl SOURCE_DIR BINARY_DIR)
 diff --git a/cmake/GetLibXml2.cmake b/cmake/GetLibXml2.cmake
-index 5915b117d..18048715d 100644
+index 2a6c618f6..093b57a4b 100644
 --- a/cmake/GetLibXml2.cmake
 +++ b/cmake/GetLibXml2.cmake
-@@ -23,5 +23,8 @@ function(get_libxml2 SOURCE_DIR BINARY_DIR)
+@@ -22,5 +22,8 @@ function(get_libxml2 SOURCE_DIR BINARY_DIR)
+     elseif(MINIFI_LIBXML2_SOURCE STREQUAL "BUILD")
          message("Using CMake to build libxml2 from source")
-         include(BundledLibXml2)
-         use_bundled_libxml2(${SOURCE_DIR} ${BINARY_DIR})
+         include(LibXml2)
 +    elseif(MINIFI_LIBXML2_SOURCE STREQUAL "SYSTEM")
 +        message("Using libxml2 provided by system")
 +        find_package(libxml2 REQUIRED)
@@ -146,10 +151,10 @@ index 0968afc38..3ca1fe565 100644
      endif()
  endfunction(get_rocksdb SOURCE_DIR BINARY_DIR)
 diff --git a/cmake/GetSpdlog.cmake b/cmake/GetSpdlog.cmake
-index 747894984..6255e31bf 100644
+index 9fe3b9c46..60f5c01d7 100644
 --- a/cmake/GetSpdlog.cmake
 +++ b/cmake/GetSpdlog.cmake
-@@ -27,5 +27,9 @@ function(get_spdlog)
+@@ -32,5 +32,9 @@ function(get_spdlog)
      elseif(MINIFI_SPDLOG_SOURCE STREQUAL "BUILD")
          message("Using CMake to build spdlog from source")
          include(Spdlog)
@@ -186,8 +191,37 @@ index a0334b02d..0e7600c22 100644
 +        add_library(zstd::zstd ALIAS zstd::libzstd_static)
      endif()
  endfunction(get_zstd)
+diff --git a/cmake/PugiXml.cmake b/cmake/PugiXml.cmake
+index ba5a4df38..7a1a72b9b 100644
+--- a/cmake/PugiXml.cmake
++++ b/cmake/PugiXml.cmake
+@@ -15,12 +15,16 @@
+ # specific language governing permissions and limitations
+ # under the License.
+ include(FetchContent)
++if(MINIFI_PUGIXML_SOURCE STREQUAL "SYSTEM")
++    message("Using pugixml provided by system")
++    find_package(PUGIXML REQUIRED)
++else()
++    set(PUGIXML_BUILD_TESTS OFF CACHE BOOL "" FORCE)
+ 
+-set(PUGIXML_BUILD_TESTS OFF CACHE BOOL "" FORCE)
+-
+-FetchContent_Declare(
+-    pugixml
+-    URL      https://github.com/zeux/pugixml/archive/refs/tags/v1.15.tar.gz
+-    URL_HASH SHA256=b39647064d9e28297a34278bfb897092bf33b7c487906ddfc094c9e8868bddcb
+-)
+-FetchContent_MakeAvailable(pugixml)
++    FetchContent_Declare(
++        pugixml
++        URL      https://github.com/zeux/pugixml/archive/refs/tags/v1.15.tar.gz
++        URL_HASH SHA256=b39647064d9e28297a34278bfb897092bf33b7c487906ddfc094c9e8868bddcb
++    )
++    FetchContent_MakeAvailable(pugixml)
++endif()
 diff --git a/extensions/libarchive/CMakeLists.txt b/extensions/libarchive/CMakeLists.txt
-index bf7b2a7f5..eb6b71091 100644
+index 14b75dcc2..ad2b13c25 100644
 --- a/extensions/libarchive/CMakeLists.txt
 +++ b/extensions/libarchive/CMakeLists.txt
 @@ -22,12 +22,10 @@ if (NOT ENABLE_LIBARCHIVE)
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
index 10d9965ef4..db2434723b 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
@@ -1,4 +1,4 @@
-From a19e548826e65a95a55ac6b9c12a83d3dcc0010d Mon Sep 17 00:00:00 2001
+From d48ababf341708885ecf687ebc46bb1d84ca868d Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 19 Mar 2024 20:56:05 +0800
 Subject: [PATCH] Fix libsodium build
@@ -9,16 +9,19 @@ Subject: [PATCH] Fix libsodium build
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+[lz: Adapted the patch for context changes when upgrading
+from 0.99.1 to 0.99.2.]
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
 ---
  cmake/BundledLibSodium.cmake | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/cmake/BundledLibSodium.cmake b/cmake/BundledLibSodium.cmake
-index 98d05b737..4f0faa879 100644
+index 001a90dad..87a3244fd 100644
 --- a/cmake/BundledLibSodium.cmake
 +++ b/cmake/BundledLibSodium.cmake
-@@ -58,14 +58,12 @@ function(use_bundled_libsodium SOURCE_DIR BINARY_DIR)
-                 EXCLUDE_FROM_ALL TRUE
+@@ -60,14 +60,12 @@ function(use_bundled_libsodium SOURCE_DIR BINARY_DIR)
+                 TLS_VERIFY TRUE
          )
      else()
 -        set(CONFIGURE_COMMAND ./configure --disable-pie --enable-minimal "--prefix=${LIBSODIUM_BIN_DIR}")
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch b/meta-oe/recipes-extended/minifi-cpp/files/0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch
deleted file mode 100644
index 3e916a8081..0000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 905676309a407b9a50118b31370b73ec411a6f8b Mon Sep 17 00:00:00 2001
-From: Marton Szasz <szaszm@apache.org>
-Date: Mon, 31 Mar 2025 14:48:01 +0200
-Subject: [PATCH] MINIFICPP-2553 CMP0065=OLD removed in cmake 4.0, removed
- override
-
-Signed-off-by: Marton Szasz <szaszm@apache.org>
-Signed-off-by: Gabor Gyimesi <gamezbird@gmail.com>
-
-This closes #1957
-
-Upstream-Status: Backport [26aea0d8280986713b441cda3fd3858c80d21f65]
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
----
- CMakeLists.txt             | 1 -
- minifi_main/CMakeLists.txt | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 70c94c2f..6673e331 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -19,7 +19,6 @@
- 
- cmake_minimum_required(VERSION 3.24)
- cmake_policy(SET CMP0096 NEW) # policy to preserve the leading zeros in PROJECT_VERSION_{MAJOR,MINOR,PATCH,TWEAK}
--cmake_policy(SET CMP0065 OLD) # default export policy, required for self-dlopen
- cmake_policy(SET CMP0135 NEW) # policy to set the timestamps of extracted contents to the time of extraction
- 
- project(nifi-minifi-cpp VERSION 0.99.1)
-diff --git a/minifi_main/CMakeLists.txt b/minifi_main/CMakeLists.txt
-index 62eb234f..1a2e9e0e 100644
---- a/minifi_main/CMakeLists.txt
-+++ b/minifi_main/CMakeLists.txt
-@@ -69,7 +69,6 @@ target_link_libraries(minifiexe spdlog libsodium gsl-lite argparse ${LIBMINIFI})
- 
- set_target_properties(minifiexe PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
- set_target_properties(minifiexe PROPERTIES OUTPUT_NAME minifi)
--set_target_properties(minifiexe PROPERTIES ENABLE_EXPORTS True)
- if (WIN32)
-     target_compile_definitions(minifiexe PUBLIC SERVICE_NAME="Apache NiFi MINiFi")
- endif()
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
similarity index 86%
rename from meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
rename to meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
index 28c1063ceb..4ac5b87ba9 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
@@ -4,8 +4,8 @@ data collection approach that supplements the core tenets of NiFi in dataflow \
 management, focusing on the collection of data at the source of its creation."
 HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
 SECTION = "console/network"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4c5fc3bbd872752266d21f5f167ce297"
+LICENSE = "Apache-2.0 & MIT & BSD-2-Clause & BSD-3-Clause & BSL-1.0 & Zlib & ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb72a6f151096df9e2f5f01b6bf9d735"
 
 SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=main \
            git://github.com/martinmoene/expected-lite.git;protocol=https;branch=master;name=expected-lite;destsuffix=${S}/thirdparty/expected-lite-src \
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            git://github.com/chriskohlhoff/asio.git;protocol=https;branch=master;name=asio;destsuffix=${S}/thirdparty/asio-src \
            git://github.com/fmtlib/fmt.git;protocol=https;branch=master;name=fmt;destsuffix=${S}/thirdparty/fmt-src \
            git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v1.15.3;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
+           git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;name=jsoncons;destsuffix=${S}/thirdparty/jsoncons-src \
            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=${S}/thirdparty \
            https://download.libsodium.org/libsodium/releases/libsodium-1.0.19.tar.gz;name=libsodium;subdir=${S}/thirdparty \
            file://0001-Do-not-use-bundled-packages.patch \
@@ -26,17 +27,16 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0005-generateVersion.sh-set-correct-buildrev.patch \
            file://0006-CMakeLists.txt-do-not-use-ccache.patch \
            file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
-           file://0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch \
            file://0001-Add-missing-include-for-malloc-free.patch;patchdir=thirdparty/fmt-src \
            file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "
 
-# minifi-cpp: 0.99.1
-SRCREV = "78d53ed154c71f1fabbaff0366d44ed3b32754e6"
-# expected-lite: 0.6.3
-SRCREV_expected-lite = "c8ffab649ba56e43c731b7017a69ddaebe2e1893"
+# minifi-cpp: 0.99.2
+SRCREV = "92fb88dca9aaff75b5c6795d25d6e437649c1c77"
+# expected-lite: 0.9.0
+SRCREV_expected-lite = "e45e8d5f295d54efe9cace331b9e9f5efa8a84c3"
 # range-v3: 0.12.0
 SRCREV_range-v3 = "a81477931a8aa2ad025c6bda0609f38e09e4d7ec"
 # magic-enum: 0.9.6
@@ -47,14 +47,16 @@ SRCREV_argparse = "af442b4da0cd7a07b56fa709bd16571889dc7fda"
 SRCREV_gsl-lite = "755ba124b54914e672737acace6a9314f59e8d6f"
 # date: 3.0.3
 SRCREV_date = "5bdb7e6f31fac909c090a46dbd9fea27b6e609a4"
-# asio: 1.29.0
-SRCREV_asio = "814f67e730e154547aea3f4d99f709cbdf1ea4a0"
-# fmt: 11.1.4
-SRCREV_fmt = "123913715afeb8a437e6388b4473fcc4753e1c9a"
+# asio: 1.34.2
+SRCREV_asio = "ed6aa8a13d51dfc6c00ae453fc9fb7df5d6ea963"
+# fmt: 11.2.0
+SRCREV_fmt = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
 # spdlog: 1.15.3
 SRCREV_spdlog = "6fa36017cfd5731d617e1a934f0e5ea9c4445b13"
+# jsoncons: 1.3.2
+SRCREV_jsoncons = "64b9da1e9f15eeff4ec9d6bc856538db542118f2"
 
-SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_argparse_gsl-lite_date_asio_fmt_spdlog"
+SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_argparse_gsl-lite_date_asio_fmt_spdlog_jsoncons"
 
 # ossp-uuid: 1.6.2
 SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
@@ -64,7 +66,7 @@ SRC_URI[libsodium.sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd83
 
 inherit pkgconfig cmake systemd
 
-DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip2 yaml-cpp zstd lz4"
+DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip2 yaml-cpp zstd lz4 pugixml"
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 
@@ -95,6 +97,8 @@ EXTRA_OECMAKE = " \
                  -DENABLE_KAFKA=OFF \
                  -DENABLE_BZIP2=ON \
                  -DENABLE_LZMA=ON \
+                 -DENABLE_COUCHBASE=OFF \
+                 -DENABLE_LLAMACPP=OFF \
                  -DSKIP_TESTS=ON \
                  -DMINIFI_OPENSSL_SOURCE=SYSTEM \
                  -DMINIFI_LIBCURL_SOURCE=SYSTEM \
@@ -103,6 +107,7 @@ EXTRA_OECMAKE = " \
                  -DMINIFI_LIBXML2_SOURCE=SYSTEM \
                  -DMINIFI_CATCH2_SOURCE=SYSTEM \
                  -DMINIFI_ZLIB_SOURCE=SYSTEM \
+                 -DMINIFI_PUGIXML_SOURCE=SYSTEM \
                  -DMINIFI_FMT_SOURCE=BUILD \
                  -DMINIFI_SPDLOG_SOURCE=BUILD \
                  -DFETCHCONTENT_SOURCE_DIR_GSL-LITE=${S}/thirdparty/gsl-lite-src \
@@ -114,6 +119,7 @@ EXTRA_OECMAKE = " \
                  -DFETCHCONTENT_SOURCE_DIR_ARGPARSE=${S}/thirdparty/argparse-src \
                  -DFETCHCONTENT_SOURCE_DIR_FMT=${S}/thirdparty/fmt-src \
                  -DFETCHCONTENT_SOURCE_DIR_SPDLOG=${S}/thirdparty/spdlog-src \
+                 -DFETCHCONTENT_SOURCE_DIR_JSONCONS=${S}/thirdparty/jsoncons-src \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DENABLE_SYSTEMD=ON', '-DENABLE_SYSTEMD=OFF', d)} \
                  -DBUILD_IDENTIFIER=${PV} \
                 "
@@ -147,19 +153,19 @@ do_compile:prepend() {
 do_install() {
     DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
     MINIFI_BIN=${bindir}
-    MINIFI_HOME=${sysconfdir}/minifi
-    MINIFI_RUN=${localstatedir}/lib/minifi
-    MINIFI_LOG=${localstatedir}/log/minifi
+    MINIFI_HOME=${sysconfdir}/nifi-minifi-cpp
+    MINIFI_RUN=${localstatedir}/lib/nifi-minifi-cpp
+    MINIFI_LOG=${localstatedir}/log/nifi-minifi-cpp
 
     install -m 755 -d ${D}${MINIFI_BIN}
-    install -m 755 -d ${D}${MINIFI_HOME}/conf
-    install -m 755 -d ${D}${localstatedir}/lib/minifi
+    install -m 755 -d ${D}${MINIFI_HOME}
+    install -m 755 -d ${D}${MINIFI_RUN}
 
-    for i in encrypt-config minifi minifi.sh minificontroller; do
+    for i in minifi-encrypt-config minifi minifi.sh minifi-controller; do
         install -m 755 ${WORKDIR}/minifi-install/usr/bin/${i} ${D}${MINIFI_BIN}
     done
     for i in config.yml minifi-log.properties minifi.properties minifi-uid.properties; do
-        install -m 644 ${WORKDIR}/minifi-install/usr/conf/${i} ${D}${MINIFI_HOME}/conf
+        install -m 644 ${WORKDIR}/minifi-install/usr/conf/${i} ${D}${MINIFI_HOME}
     done
 
     install -m 755 -d ${D}${libdir}/minifi-extensions
@@ -175,19 +181,19 @@ do_install() {
     sed -i "s|bin_dir=.*|bin_dir=${MINIFI_BIN}|g" ${D}${MINIFI_BIN}/minifi.sh
 
     sed -i "s|#appender.rolling.directory=.*|appender.rolling.directory=${MINIFI_LOG}|g" \
-        ${D}${MINIFI_HOME}/conf/minifi-log.properties
+        ${D}${MINIFI_HOME}/minifi-log.properties
     sed -i "s|nifi.provenance.repository.directory.default=.*|nifi.provenance.repository.directory.default=${MINIFI_RUN}/provenance_repository|g" \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
+        ${D}${MINIFI_HOME}/minifi.properties
     sed -i "s|nifi.flowfile.repository.directory.default=.*|nifi.flowfile.repository.directory.default=${MINIFI_RUN}/flowfile_repository|g" \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
+        ${D}${MINIFI_HOME}/minifi.properties
     sed -i "s|nifi.database.content.repository.directory.default=.*|nifi.database.content.repository.directory.default=${MINIFI_RUN}/content_repository|g" \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
-    sed -i "s|nifi.flow.configuration.file=.*|nifi.flow.configuration.file=${MINIFI_HOME}/conf/config.yml|g" \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
+        ${D}${MINIFI_HOME}/minifi.properties
+    sed -i "s|nifi.flow.configuration.file=.*|nifi.flow.configuration.file=${MINIFI_HOME}/config.yml|g" \
+        ${D}${MINIFI_HOME}/minifi.properties
     sed -i "s|nifi.python.processor.dir=.*|nifi.python.processor.dir=${libexecdir}/minifi-python|g" \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
+        ${D}${MINIFI_HOME}/minifi.properties
     sed -i "s|nifi.extension.path=.*|nifi.extension.path=${libdir}/minifi-extensions/*|g" \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
+        ${D}${MINIFI_HOME}/minifi.properties
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -m 755 -d ${D}${sysconfdir}/tmpfiles.d
-- 
2.34.1


