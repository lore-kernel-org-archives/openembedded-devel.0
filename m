Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CC2F532E7
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18823.1774357191106686146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N7XKIo2h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3ASKs3548742
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0HoiBKAv8DhPM47PryjLrpE17Bwb2HMNx847MrYLLB4=; b=N7XKIo2hggLh
	La+OrrmAklrmFySRAI9bmMuDSfaPm5hka2vofXDAh442oXdL0+JOVRzwGc+4TsYd
	yd7gge6GZc87onVQwLdm5mRmj4wy9qNh9cCBPuf4U0i0BaLaLqtiVsVQ22QuN5MZ
	jlPI/Jt75ls4YQ8qkNq8Qw+jEkV45M9+SvUk3pSrE6glcIUhu5nYgs53UlAeeG+s
	rhjKplH+ctmQbGAUYP38YnCttKWglHeGcL//NN929yJviPNGfydDD2sryW7nih+G
	KEyN1ypYluEuQ2TSGL+7XdcB8HCFnYBBOGr+h2gYukob1PxzdXdKWVrrMYB0gBxK
	NBD8vHui6A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6ubgy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8nMZLeJqmjGnxMEIp6INrwNpotz9+QSY9rhUcMOcvPLikYehojftwQ1VABI/HX815fDgrBZog3DSm7IqVN0YzTXIXx56waWEDmBzHdFc4N9nh7foklZ6A+ZHTbzxCv0LX/rjKIqCeEO4tlSBSPd1wscCF+oLarPLqGwMZInbZ/CW+NZJs35QSbI7IfKj5uNtGSo1mOsU5WeB9mqXTQdbPAb2VqHoEQlj5/RPsv51OPPdH8J2WjJWLSMfYUy8vg8U2u9HoNBN2uZ75l6oYg62wNgXKyJLN3lc+AiXVRcbM2upf9MkDwgMpdUhT4cow8WmVqws/Y89fwBvpvVfyZMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HoiBKAv8DhPM47PryjLrpE17Bwb2HMNx847MrYLLB4=;
 b=UC6FR9ZDsQFooVpXTXeTvpyFAR8aOK3PxLwJ9y/d4WLL0PzpGRGaJ4Vl+0UG6kejiCvjpBtWRB/x6Rig7WVFFpKM4SlEfPTm5QhNq1XrgNmQZOHgyhmbJFL8jYkQtL2ukN4+Fom55ItZHSZ3mFi00vJ8Zl+MwfJ7P9aSKTyEw5glnoRdz9jN7h4ObCYJ/VZW8SgumKvi2uQHalgDh+rP5DPpdEc7PbCnY/YuMEq5JVuYgrebQoGrdpXFLE7cvB7Gv+V8fCJIYPbpWAg/ENICg2t+tDz3pgtX0QGqmebxyN0nhF2lMfabbfsdbErRy14GqRnxiHY3PLQIweBUknzchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:59:46 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:45 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 03/15] xfce4-appfinder: upgrade 4.20.0 -> 4.21.0
Date: Tue, 24 Mar 2026 20:59:15 +0800
Message-Id: <20260324125927.1070644-4-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c1a530-5de1-4ae2-1855-08de89a538db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	AkPSFcQGpQ0eFggyy51gWeeYiF4HIwu2GLPCnREQWR2TVu6lnaMKUeLPpQBwmGnRJj+HA/k+Obd1pfF78R7aKqKWhU2fNg93uFUGdNB8V65Z5NWeXUuGkktOxi/KXAGEQDbCNb+KMR4i0Ij5M8xmvAFhxsLTQqZunPL1e9RzNZC8BkQKjXtfMsq4ZXw9VYUiukYDmcrXHScj0kcSvlN751dwlmztQvOWIQE9hmCe27iLqPJaGtQFjFfRkTUJTnIBeTUbU14FDabY7oMdpXrIPg8qsr1Hzu3UaWwRY0nFtsRPB6RADqE2AXOUQ158xUdXYgcARv050UBkd8c0qPL+kQfighJJNcv/qYAsiAVA/XZWw5xmCuQkmtKRyAPTFx9RO4e9DKnZyDQrms6aHfnj5557gQ3E6dvaeB4L7dIIF6ZT22lfAgTQ/3XAuOYoc6LRKeOG4wfkY7QbM6/Rb1ceZf0aIhLIkiOQ+JmBGOFfqZjjtIQ5NPPRQ3HBqnBE43nouOlIjbj96AnoesKQwR2ByOa6Gtmg3P7j8rEDqDQR6ZQIWe7LqgaI1+3ZAZUE+ex0Xab8jD1Rq3vo7lxFIjTEaDidK+Q2K3JeVa4Kgxwx4f6PUtaGCMsD+f6Jq3xePctRJwnu4xIgeWDHhOD4c5gRS4JJu2orXhxQNfAJPleWLcXvTt2Dyxy6dz3z2uKoXNXSGtkLhEVT55Kjsdw2Z98bmQeB3TzYlZvIfbDKrYKNNBnuqhCV2WkHq2xsK3yaHB+s48Wl87TG1OVTTMViFKqczE2ioJPrcLbn9XPPNVlCZrA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l5ieOeuVWFcdbhmLNH7/6cfJzi23wxjkHomWAebDGZIv2oqpLKWaUEXexNv3?=
 =?us-ascii?Q?UXPJXlsi3p0R0mCtInj2zYz8HpaqIo+smG1Wd6Bike2MPodLNtQhVJp01xJe?=
 =?us-ascii?Q?8GFmWFQ/bQK0O311QzWtGDv1SWwu+MOUdErnc7SX3vg0Sd4tQbjME7dS0b4p?=
 =?us-ascii?Q?B+Rutr6q4XsCAlwbxl5dzoSbq5bp6PUntDU6uLlg7C2J9odz3je/MdF/WtG8?=
 =?us-ascii?Q?QJTIA25iEkjZ5+958ulVnT3LTQB5wnYs2zCG6hjIEkvttnzlpEtK7bBDHfBP?=
 =?us-ascii?Q?mbb79eQUie6MVnQRvd0qj84OkyejVo0BHfKJ7NvpqXULg1/9MeoBVVWCpgxJ?=
 =?us-ascii?Q?KrH00AvE/9BWpaE38sUpxPMnftW/X2nof07pnezlnPXD6XrV8oTIKGVRmXi7?=
 =?us-ascii?Q?J32V8QrQVjOSpZjz8DsBi/0qQHd7N/qnbjK7wtyQesMfp2s4/aufoOXV+fr/?=
 =?us-ascii?Q?iCiKtTWvYPi2xatpwasJXTlrabhRZS8hZJdQVQoyoiniYMxHY7uT7PEhGKb2?=
 =?us-ascii?Q?I2/fcg5cfqrgbl0zDUKmShLNp+Mx0keEVyUxeh2SXZSmkx/jWYps8GhKlB7Y?=
 =?us-ascii?Q?CffDBdfCqS4sqW/7xXhs/tsBSfrOen+pvE0QBO9SEC3X+hIOdsUW2ha/opUJ?=
 =?us-ascii?Q?7BrbrShU0s+ypaM6B2WywtNnN06uNjxrr/bbsdPD5LovpY7awyDcvL2F7Ldi?=
 =?us-ascii?Q?UdKoooVnNxFrnprjkKBDAnFWePqNQ24t1/JV3u3o6+UezwkSwXczDObcklRG?=
 =?us-ascii?Q?v7Agwtbiixkm3kSUSuJoVwHODenl0V521MkOcAUxtIbhwkowBl2liTgUEc2L?=
 =?us-ascii?Q?uhz4Zk7h4JoAOa65XNu1Y1RDMoOd65Zud9CP7yGsHibsL6ZjDJfDrN7YaC/a?=
 =?us-ascii?Q?1T7ntdbFfTBa8L8Ix8EsSw72xZpmx+yWQQUAeRa1pKht+gqXUQ/SVv+RHze5?=
 =?us-ascii?Q?jBEKFe4+xjYOe/3WtZAmw7cxDydeiqqjn2+vg3UDSmGeN3jW0Wp4UwfPTUkA?=
 =?us-ascii?Q?7EKmm4ANwGgnuxxXfI/50d1LJ6nz7mB0jrwcmQBQY7SHTrcZJkTo7VvVEnaD?=
 =?us-ascii?Q?hlpp9xqaT/j0qKoFuwHZF6sR9Mqgg9jZyN/z2ps4g1dUMiR2FYiNV0tJ66lv?=
 =?us-ascii?Q?i23K2l9pzNlZvVjUZtMfosPmtlE31VxkL5uVsvBUV48cZEs97hNMU08aSQ4R?=
 =?us-ascii?Q?O18i90MH+p4xRQ9OJ7TH2kcHjMriQuT70x3LCFyXJyEaU3/u6mcBtP/oNUSr?=
 =?us-ascii?Q?uLgp5hvMIFapp5Kd12yQJDvN4CKp7gl5Vq/89vAYcjGIhCSRlYMK4ONOCuiv?=
 =?us-ascii?Q?wREVeHM0wcjVdquOqmkZAQ5ECFxejtwmnXtOdyXhnVeeEUCNhbfUDFcifjr2?=
 =?us-ascii?Q?fBT0bhECFD/06E/IHu85oG0J/tt1H81JKP4Z9+266Y0w4eefYrv/+qnRDbl6?=
 =?us-ascii?Q?JEnqReKhexZn+26rIWRnXzeHPp6TXSjzTGxw32v6bARlUVKZCbvizdA8DsHp?=
 =?us-ascii?Q?HTDxY4F3oU2BVmo3aLoTnH3GoGzuHl5tazMR/DFh1tYO8YX2uwvru/K6sMxn?=
 =?us-ascii?Q?L5+2gx8luDNg52gZRsJUnEyOwTamsOTB8Z6XwVHX5XTEIJiMQWeduyMgu4Yo?=
 =?us-ascii?Q?qZXZlC6n+UTSjilZN9QHP8CWFmGK57VZ741v9cuTUsPN7bnbLPpUY/2jbX0c?=
 =?us-ascii?Q?ndjRQ9Y2sf0HsrfWPBBvk5FVMVP+qckhhRhrruzd4OZ5WtpIBhoawHMXWCso?=
 =?us-ascii?Q?ngphq5QQjw99jE1E4/W2PtvjROP+sBA=3D?=
X-Exchange-RoutingPolicyChecked: 
	PTJDOHgqEgxgYLwMG6ugydz3f7nKGy48OXBgwkz4GvRpQWCqu+vOOah7dWS8+bGARJdXJp+inDPbrgJUiANQ+G042fsnnuauX1UJOIzP0L0XqwbT27sY3n7kWd/XbndPYddg6TtDRb4tV/TURGF2JSoYGBTRhOtAolnDs/0MDtVhzD+q0jPsefEzX2Q8YKrTeX/FnVpq9xOcDocgTl5gDhBRGAKv55vF/FFrnIu9esbfaYsbCwQDjIkQeLegJOenkUtkUHSbsUBCJbR2c7Z2keUOFzf4ZC/Z4og6MphOGxPKylNlgk+lmpGfE4f3v7mSCoq9C1iQ4x6WxxP0jFQzWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c1a530-5de1-4ae2-1855-08de89a538db
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:45.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1j9HsXu53HaJkIYkt37xkrLAQijyRdFb4OLNmo3OczCXSmLhRw6c6N5MKz29r6g8QYc+lAX0Er10cFCnh6JqkBzweueKdH/WCQJaQc77Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX+Oa9H0y2ODdo
 rOawNHdgUNUfI9ATnMiglB93tfz+6P17SNWQ8cXZAo9vq3niVqkpI+4aRT2LW8zGI9pfiPCuQw1
 7yFAXiEcVIruxrRXwPZNAJY+HjllNJZq6+2C2ieWhJkZa4TBffDDQmPd2AqdLDtq/NbPaAly+IV
 9876h/8HQnA1Ucbaarop0BjAE7JVCfdPPgoc2FT/zjpTgEsz5dyZBsxdLts8Cvf0ItQojkBR6OK
 69pYMONDuYSORw7VjxFOrUAQH9aeoJXOgzuk2P6Asmp+v+a82m+tdI5DkeYSo0Kup3CYK7MpPiN
 3iS0IdT8+OH7MuHN0USrGqb5ZSaysoz3HrSAfiTM/R78EKADF2FFQQN1iUIT9rs0h+3sgmVphlG
 KWemtQmlw7aHGyHLJnF/qQ3fgURaYFOH3sMQZc87F8A2fvCo1cfZmE0iQd21pnGxY6KumUtbnSP
 0bf1YRLibx5Gcco3U0A==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c28ac6 cx=c_pps
 a=vEsArsaSdKs0mJrCYyxDvw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=yOGt4t9QG72VL48Hq1MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: eZtJE-hrgre5aTBp273ZmtpBViDmqFp9
X-Proofpoint-GUID: eZtJE-hrgre5aTBp273ZmtpBViDmqFp9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125562

From: Zhang Peng <peng.zhang1.cn@windriver.com>

4.21.0 (2025-03-23)
======
- Replace deprecated exo with libxfce4ui 4.21.0
- Remove manual registration of resources
- meson: Add missing file to EXTRA_DIST
- Hide dash from list view when comment is empty
- build: Automate copyright year management
- meson: Check for headers
- Fix potential dereference of NULL
- Add support to Meson
- Translation Updates:
  Albanian, Basque, Catalan, Danish, Greek, Hungarian, Romanian, Slovak

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../{xfce4-appfinder_4.20.0.bb => xfce4-appfinder_4.21.0.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.20.0.bb => xfce4-appfinder_4.21.0.bb} (72%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb
similarity index 72%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb
index 0e01740e44..4d7a1e2da3 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb
@@ -5,10 +5,13 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfconf"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "82ca82f77dc83e285db45438c2fe31df445148aa986ffebf2faabee4af9e7304"
+SRC_URI[sha256sum] = "e3befc3e73d2315074eb88933f2b042c5b417f4f7f24be9bd4f4508a091037b7"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.34.1


