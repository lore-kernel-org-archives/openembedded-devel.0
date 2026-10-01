Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51008CA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9570.1790856327426184423
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LMbeFAOJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691B9dFS2542266
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 12:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=eDZi1+lHfITO+ZlBrEJoVcoAJnp4Pncnc3M5q45WQuo=; b=
	LMbeFAOJdrVCcP1YauKkdN+G7gANPdoPm6CQDbty1dmOxcqDdbDHjadb38aUFWFN
	EZoAssYlQfHGisbylTSmgdQc7Eq/HAk3FPjSVJxss078cnvg/ZXn5jCzETTjiCRK
	MHUtHWNqYdZGPXnk/GtBPTe9sXgujNWwtW3Qvln8RHpzgTKENCbBjnLMFkB8sWnr
	63/v0RCaP5wJbtC8mSIcducOoMlvF5+NeMd4X97D1CB5216f3GPcLjxX0ZarLvWA
	RrOYIxgDVXjyTtB81IwTi5M9FNjnxAxCgDQpltG5/fmhT4Jxd9Xg/9HOq/84uTJD
	MKfyW1loRuadVrNkh4u2gA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022098.outbound.protection.outlook.com [40.107.200.98])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515gx81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVQQi94EFMaRIserOKiyBinTUetNLUhxwQwQ9JbUO1yl2LIicmYlm3IC/wbK92WSNaf80zZAZtulrn4K4Efk5YCBy4kitvVhttPnfGUhFk9YEPPWZrDJOnApIfFOatsdQJtUBW9vdrPXBQr20pUqjsBK6sRM5JIvTpktDPG5iJ7pvjNLmprLi5mxWHfWrd1pA3iBp+tG9Sx10wPP3vk+JfaL+FSY9fj6rYZ55vISiZgTwkccxAims7TY1UfboRKNrsEH6HQLZ7GDRH3Q/PMRDc9V2s4v2wtO21Xg7TnFyKtw3QltiPY219PqQQ859fjPB1bCeXyS5mKjMtpxAhUTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDZi1+lHfITO+ZlBrEJoVcoAJnp4Pncnc3M5q45WQuo=;
 b=gPGA2RSYust1du97uaum4Cw/reno94YxOJUidO2GkHz4u9Aoke6DeP1nfjeOLvqu/jSdOcEYGcjoFpkUiAAGS8NnIBy4DLVGCXBhqSbQgEXrmszz7BxujVF0/RjD4F3rt19i83jAb4e3jxG5SNR3t8h2onmbnQE5KlZo5BDR/zrJS/slevSeEit5XO9CNSioelNA/YSZlzm42803q9IFbmNul9yv96nq5t5CMcLTSJfsec4l5NAww0R/qrHYGoyY6El6Q/yqYSZBbsYZTC8R+TejOoAnyJ0unaU6x7JuxPRfwGVJafzMZHVuKguFv9Fhe6jzKQLWt4CltYzhpX4vVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 12:04:49 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:04:49 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 03/11] strongswan: fix CVE-2026-78126
Date: Thu,  1 Oct 2026 17:34:09 +0530
Message-Id: <20261001120417.1280843-4-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f735d4-108d-4ef0-d8a0-08df1fb43161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|260925021911599003|260925021311599003|260925022911599003|10067099003|11063799006|56012099006|6133799003|12006099003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/CaWWGAxaaXtIley+BpyFD4Zu1HRqh49pSXdSo3NomlQAIa/PxYZJnS9M2bDqrcyZLrtEMKkgIIupkzcOLUk011eQVjP1hr/RhiT6tXBUSl70RM2dnyvZoVEd2zv9nV6cR69/2zfNcqRduGp3cuvoLSVoAO/Au9IPd21ti3/7GE7o9l53zXQbaPVxmkivboFoy06Ww0EE+lrFKm0zm+lRrzINWhDPFVGaeinR69Xgjge4YCKt6qC5Wvuq7JxrzLG1HwaPMDce9LyvWuR4exhxJKy17KCTe2qJ0pxVTR5ephLBW1oHHF60DmAG79aTpwNe1o0tOeVKfYIo+tTwFrBylN2LfsIwg/2A2Ex80SNoBA1d20kx/SVrKbuWEtOWDSkNZU48eZOFEN0I1oxxlghNFjfDs8X/dgiAyOgAoWz9imrl5o05B8tCYEq9CcFOtJLw0Zlv46OSfOCmoxuKOBa9k3B+E+Wt/JD7SwRCXnW6dUumrahIPOoJl23V5FbLEdh5Ipdwj54u/X3xvVkCaZjbcVJRZGuAHHNIA3a2Oz8gdHzVXtBozbfU9exZ480lnAIrENxAdLsD6aySjZa1YHKA9gsgn8YlNE6vOgq7+xTIio0e+eozRY6f6hT4+wdBYRBgEaGZgqCLQ9b8s2MoyFBzN/iBFEBbSKaOsvqfDOTphE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(6133799003)(12006099003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SHeqPdMiCB9aumjKaFCVj8HPVYAV3WV3K0hzRggpQB5wUlFJ0fzFy3By7B5X?=
 =?us-ascii?Q?BB67vD/dbQWwfWWMeJanx5KdqJFAZ4H+xw9yPztasCBPBJ1NS52xfGUsXJDh?=
 =?us-ascii?Q?iqXErEKJO/cdzwVKzqu0nZE73kb/thVKm5F/VZjgajsF5RJ7aYFNNudS1HeR?=
 =?us-ascii?Q?7ddnWzPiGM0Ed7dfFBIAtzWNUuh7FiyG8Zjr5LfaP4LigYJ9IEBynH6iYVjT?=
 =?us-ascii?Q?nHNM/50K3vcnrHH0dg80EQNylg5A38IyOHdWyqgZOdehJToLKjkg6V4/jEwl?=
 =?us-ascii?Q?qIV49XX5Ryro7VVmeCondDHD1C1FvBwi9Seg213pU0VdjNGOx9IT9d6tg7ug?=
 =?us-ascii?Q?K1iuDOE0HuCT9Ls5brmPxdyeDEyoTgVvO1XwO3cfT/h4eKuiTyQK3wps1LNO?=
 =?us-ascii?Q?6f4gWxxINHpfmif+Wb4vOX+JZsp+XYGB4erL+DpF/fPNGPoQ8IBLYzEglsZ7?=
 =?us-ascii?Q?2p01iMVD1PBGwGvotWagNjvArFiIkjIlhhicDe+v+uVGkbzyzTrWCahTZetw?=
 =?us-ascii?Q?TVsTO74tBw+jhhquLTtBEDQloWOrMCbKTWBMftfWi7CrpR3/tE9B4Z0RjZ2h?=
 =?us-ascii?Q?7roBMYmOW6g76esN8SKHnjNuuloYgqTA/IW2MC2M2KAgNtvAchWPdRGvRyxU?=
 =?us-ascii?Q?sBKckH11xX1DwIMChDOP8AzmQ5FWeIeK2gUlDNNGDw3YHaQzruKBIjlSajUb?=
 =?us-ascii?Q?g+Og9qaXmuZuc7EkeUI6q8y+ax8wstofhTIkA8WMXvzdK6HOcwlXJqtrrS4e?=
 =?us-ascii?Q?pIcr3bU/yGmSOV25qyZeF0JvxGttSDo0umG9cXhQd9udCrwLy805g7Z1B3Nk?=
 =?us-ascii?Q?77zz5xgSykNOMpTDpJ5x1q358E9nEJxIKCon3XUUeuw7xdtZj86C5PqHgJSG?=
 =?us-ascii?Q?qTYLqpK13Bjt/IVFTmCWpTrSgCCSFqmA7GcUfV0SIwNypxMtPx09Nb2N7Rbx?=
 =?us-ascii?Q?kRZgXjs0n2fnzsPeWuMGcrq3TpZS3VutYmOn2/janxE34Kpha6R4caluycfB?=
 =?us-ascii?Q?0QGDsObDTtuQlwsuMZBXL1Tmx7Iaru2GIsh733ggJMSDUTDyCoh4kOSyxalZ?=
 =?us-ascii?Q?rF2mHYYDhWjBoEAVJbWHvNdqFI3Ei+pzQc6tb16fI568y0cxQaVsgFts76nf?=
 =?us-ascii?Q?DXGGiI3FN2DNGS771FFNbb/1u0Bz8Fv8U7pgbdu39tCm0TBQz7bhMHMV39N5?=
 =?us-ascii?Q?iZ/8U/3fh26AOoQNI7Rqw3pE57v1YW8xGllB0ch3f50XW90Brb00eI9DErsp?=
 =?us-ascii?Q?LctWQDTQANMGXtkp3UVoyLD6BuSSvX5nXLT1qMg9kDy53NhpTH+uqGMcx+fi?=
 =?us-ascii?Q?aqJUQdro/Y3bjP0XmyBIrIsmXUTpyB5EymC06Avycs1OWiYUl62nDvnLHnpl?=
 =?us-ascii?Q?PHhkKy2HaIiZTff8+jzCaZuxxF0JGtBEZfKVw6jObb1uKVQqoy0PhK2jEf0p?=
 =?us-ascii?Q?lok8IAegYzJn0bZkpF3Bhzq8BtWtqDOJN+q9F8jysVLLxACbzEeCnMOpmtlW?=
 =?us-ascii?Q?D+gyMbUlVTw4J5WnNe/PdeXQWEUn6l4YACl2DFkWmLAQaKeeyyD+9rETXgXX?=
 =?us-ascii?Q?BFLmHb1eBUPxVra7CVl8Rv2BS4vLs4aZy9hXdNvBMiVff2wrCAUnbC2nHSvW?=
 =?us-ascii?Q?C3LOyMaUNLNGCtN+o7Js/cw3BKW7SJ973ng0WcaLG66IjmGWIpgNB0z0CjC4?=
 =?us-ascii?Q?umSvsrK9dR8noMRASbfn0XA1yBI7IpySaP/q2Lf1IRkQD3bsfZUUKapji8RS?=
 =?us-ascii?Q?DgbG+A5YlMyMEOVZmZ9nr7gYjapqbiEKxXjdbPqe8wDrDHlc4qVM?=
X-Exchange-RoutingPolicyChecked: 
	nx/yrTCL8bC7r4/iFq5OxFMX6cxiQsnojtrarTt7jDj5zoGi74NcJb/bnFDR/1BR/DtbEjjEf++HcaL0OKETjU1Xl/SDuiu6v8RkHzvVa1SJYyBFNdHQOBN50cHsF10cANo86y+lwskENYe2MIPAAh4J2T0c9VNnlwMpwBALvPhk6YyA9fcRdcpTcUbTwqDdRCO5+AkLpj8KZx9DXaf6s7DyNdaoRDVmXxoCxsaWr4SyI4q77Dc7TGxVm35xH7YtUP7wqKLg4G9zh5YFFZvm8OI+zmCXNJHafSTIPG+8015+TUwSVzek0P/seSgC3rEyR+oGNBfu/i9TZg8/4jlg8A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f735d4-108d-4ef0-d8a0-08df1fb43161
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:49.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBlF4GanwDcC7vl3PEyJ5i5ylZDnQjVh/fZBfziaMaelHR08nFMqziW4nAVsAIDxUWm43vj2/g/VuowwSB2z7s/v8X/juxvClj34tl+UrHATqGRtO6sn0aMY4Gs29PYG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX3LmQHSpWUOSf
 /DGKeorhDywxoVN7SYw87eCwXVwBRiEBIF9mHYXBY7zQMnqS2SwwBdNc7WxAIy/ocuBfJs/EB9A
 xrH2Jv7uenaKdPaSlJZwDS9Ondc+6Mr7DJxPqfwjlRjclAwZdytD
X-Proofpoint-ORIG-GUID: 2nT9SVeOcFivEK9fffYZ5BMlo0J738iV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX4jckc0Jo0nO9
 9lAufgNbOFLEdHuZpfLHhZQuKZpkdr3k7GO5wjy6vUBrMKBWa8GMmq4GDI6Zruv2TjyjCXAr5Ir
 dRioHbLg79MLKuo4pzLJTWG7ZcajM99N5LrpH5SOEJ7mnHcepGTLlD049tqwvY3W6metz6dUu9R
 Y/67c2hWP71seUI2De9UJdTRWkeSUEePeUZtBrcsCFZTGWgTQeUDmBV+wlnnFexnu8RNa1iU3I6
 iF9NV9eHUZfqGbdnahkj9ASE90ZHg6HhGT2kIMZONXEZhD8UWA+eRNyAIJvWv4QUK/NZF4B1glF
 450uZQYkYsYCmRB8aRCCBU2wLMIsrFZZpT2k2IOFUl976fHU1dH4kk1EpYa3Em3aS6Xtqfn9cid
 fG5ZuguW6sl3PIxh87AMxVIRPMtHqfm5e3BLUZk64gQk5W6vq3ca0yL/IuuWXItdi/q67K9hfeP
 BobW6t3y/w3xNZ+/Dhw==
X-Proofpoint-GUID: 2nT9SVeOcFivEK9fffYZ5BMlo0J738iV
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abe4c86 cx=c_pps
 a=Z0C3GUl4QImALGAV7svfNQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=ZumAQrI2ZkeqxSiaTv0A:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130589

strongSwan 4.1.10 through 6.0.7 allows a NULL pointer
dereference in the eap-aka plugin.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78126]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78126).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78126]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78126/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78126.patch           | 39 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
new file mode 100644
index 0000000000..dec546d8ee
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
@@ -0,0 +1,39 @@
+From 632a7498f834ff07ecf7a3dd604c06f6b89dd768 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 4 Jun 2026 10:00:02 +0200
+Subject: [PATCH] eap-aka: Only accept AKA-Synchronization-Failure if expected
+
+This fixes a NULL-pointer dereference if the client sends such an error
+before the server issued a challenge and allocated this->rand.
+
+Fixes: 26e246769224 ("ported EAP-AKA branch into trunk")
+Fixes: 4735965fc048 ("EAP servers check if the received EAP message was expected")
+Fixes: CVE-2026-78126
+CVE: CVE-2026-78126
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78126/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libcharon/plugins/eap_aka/eap_aka_server.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/libcharon/plugins/eap_aka/eap_aka_server.c b/src/libcharon/plugins/eap_aka/eap_aka_server.c
+index 89e51c733bec..1140fea57907 100644
+--- a/src/libcharon/plugins/eap_aka/eap_aka_server.c
++++ b/src/libcharon/plugins/eap_aka/eap_aka_server.c
+@@ -505,6 +505,12 @@ static status_t process_synchronize(private_eap_aka_server_t *this,
+ 	simaka_attribute_t type;
+ 	chunk_t data, auts = chunk_empty;
+ 
++	if (this->pending != AKA_CHALLENGE)
++	{
++		DBG1(DBG_IKE, "received %N, but not expected",
++			 simaka_subtype_names, AKA_SYNCHRONIZATION_FAILURE);
++		return FAILED;
++	}
+ 	if (this->synchronized)
+ 	{
+ 		DBG1(DBG_IKE, "received %N, but peer did already resynchronize",
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 4a1e584d84..43be8b287a 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-47895.patch \
            file://CVE-2026-78123.patch \
            file://CVE-2026-78124.patch \
+           file://CVE-2026-78126.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


