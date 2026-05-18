Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CCACD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:14:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2389.1779124456525933116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 10:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gRLjfiBf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95986d85e0=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEGJlR1524251
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=I38QRwYlsbR2wSASiTmeUHTVDDBrcckN+wyNtRlVDXQ=; b=gRLjfiBfWC7R
	zgv3yOjoxjJKk7DkwF8C7OHpSt3xk7HjsxnOar5u4knwYmY6GuIDg5oEyPFOK0La
	ldKqZvVdJaerGEASK5dbCFHTlqBonhjm2bde2ruR/GY4GJ1IZQSzNQLEti/kvuCq
	JkX28xXFfwBREN8ToqnCL/KjZgFtMJZD/xQ364ymyzHxmVnIG2suxs9nY5jgjAs9
	B9SVN/tQkHhHKz7lXDCcZQXRwXkZD67N0Ro6qaL8DqaPi3v2PE6foNbOGE67mahz
	f3u2qLJNNlPNWce2RUEVeORjd0vh6t+Ch5jbsMLShZ+NaDhgK+mYlxaVS1B9BjQK
	GMfv+J4WGg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3ga5js-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BO04KzHOv1VHw0nKxXOMuslpAWzrVOZ4efHbmZGjjNKqEBnx3e+nuxLfOqAwsRzig9knSeL9KI9tlseHV/Shi6f/vNOuweP5qaRlsQ21GXz3FZ2TjwSfqiXnjxYecC+cBDFrAcXjk/I1SiueSQraidRzutf5RuCU1Rb/QD/P/WTAOqc4WCxTkkqt/fRlulnEmt1mxAwDGhh1VWpA8VLLMkFJy4mtwHtQHRSFw7e+8/32iH+VV+lMyw5vc+u0docT1rgdt9TGnG8RNz6iSA0LVmBqXEbhCdel6QCpGaII+D0PVI0d/Q+RRY9sLR04K1//mG1OOdIQcNqxaJb30B5b+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I38QRwYlsbR2wSASiTmeUHTVDDBrcckN+wyNtRlVDXQ=;
 b=IGL/un32h+LvAd1Rh1BuZENkSHUhtchL6kNTlY7/TFMf90nLLqOZBOO3+EvAceJl5uMJ6BZ3P+CzTa274J5L48EPW+jdpGq6YNHsCoDf0pMMxrQztezT8WcFH6hW0DRBpkTfpVGlXsu5TXLPlD8/O/PyjubfeXo+2/PS707EbVeysgE0G0B6XnfBowuiEj0gPPF5MJ+Hy92z2WOjNJwQH3GxvC7uUWWO8nW1lfINQaQHUMBqnrq3YtXaBllGpELqOktqXHAvKVO7SuVZgAdUgsP9jQzk49j6GXgH5HqIoW582eF5S8hQLKWeKBGP/y25y+YRTllOJXEjwtvNHNmSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 17:14:12 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 17:14:12 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/6] dnsmasq: fix CVE-2026-4893
Date: Mon, 18 May 2026 22:43:35 +0530
Message-Id: <20260518171336.470608-6-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
References: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 670de26c-c22a-46fa-9c1c-08deb500e0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|11063799003|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0KqVK+t3+Yi/Gg9GnVQhPHAtpp4bFJLP8ybejOjLYiwVovRcA/HC5GM+BwiU4SqRtO+K0M/mop1c8ToF/5OYGt0DfykETSss4NqWnM23FnyKun1FcXkpavsE9/rvfmPnG/Q/66rJ83LSJUjpP2AcgLUXMB6p4qN9JDicD2aIsLllpm/oLTpBJan+igsOxmlogw3GjHa8hwdmDPopSvAnVYrFfHQO3hvsI24BpjJD4YjjZv8U2+gYvDo80MJ+EtdQME+9dsgEO5EMX9X5AH2fLIXHg+VX+BoCLAD2V3f9/lZyXuPD74VdNdlWP/GoobEn0jEpZVBUE+1T0dfl65/2wuwkUQ88hk8DxcJk4eukLa54lCKy4So4awBUnRjRc87yMdvYNCQAGX6OzQJ4ZcFz2/TGSYXw3s24TvnU0r4Ev6S+begTrnJqsl/vUjnP/yea6VptjG2+7NuMOBYg6Nm7aC8vHjXLj/8iFg40+BRxQRWCbHAjpZ+CEfD0fKsx4RIAgSn3JjqM2TI2ljy84bm794rbSuousJUkoDmNxRmkOEUJ7dswmeN8gauK7gcZEjMxpg7xkGieoEBL5AXs9ICyDEW5zft4lvqbiOOiS7YfE5MuRJa3zHFhksGLKTnt0YeXOokwsVCS/X01Vl8pijfoVBaUvguaCG6p7kHetKT31ggCbmE9UnBejrNcPcOlYDsSvQcACbjL2utGzGEI/oRwtw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(11063799003)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eO22PsO2bzAjC6uDG92P3zJFfr2nTd/W4PK2p0EefzWU8gBWBo+RjWnUqKsR?=
 =?us-ascii?Q?gPJWy8rHWkhHCFMVfHgpJgQCb5fVqSDahwd4oAhe4C/0Jiv2fP3xkZ+mP7mp?=
 =?us-ascii?Q?7eaHi8e9+SLMRXYood6h3cLBlp4s8rOJpaAZrWMaXDo82idMRqmpNRQqLlVg?=
 =?us-ascii?Q?julfoVWjHzHS+AlpTrfcvyd3oPcS8W8clunqYAm0cfY7NFose/uwbW98bO28?=
 =?us-ascii?Q?YqOLgLMyWQzWT2uNjZz+svjYfIGuy7T7Cu7Hi9tjZDkJgMST/rVM/HMqkaD9?=
 =?us-ascii?Q?T+980tB2OJMOjH0tM0LY+EDyH++vjIC5PaO6RVN23r5E7KLxjxYPs8Q7JKNy?=
 =?us-ascii?Q?eOPWkYG4Foc45zZW/FhidLW1EELjVf+Pm0R2sgkyQHvQc1hZbf6DFVifuUsL?=
 =?us-ascii?Q?beG7Lsy5YMBzE0BMUj/Jg6lyG1SZP6SHvnpFSYtvHudnniP4MpPGcO5AELit?=
 =?us-ascii?Q?wrAGwlBeOotzmI2uqdg5ZZUUfp4zFE5Av7Vg7f7EfHcarxn5oBiAwlmu4T4G?=
 =?us-ascii?Q?9j1qInbdNrx5FwB9Ld+OqHWeqGqbgJ8jZZhmPRTkda3n9SqH3tU3EmPJw2Ik?=
 =?us-ascii?Q?mAqFprKKNN3/gl8kxnpTdu1uPdogygi1rbEDmqVEgmI3Lx/zm0E7x7vBmC/J?=
 =?us-ascii?Q?r8Po/fstDqm/AnEQ2rW6xXfxz6lLxDm9Mdex+20vb6eQkJIu+xR0SNj0UBLC?=
 =?us-ascii?Q?lA55e8C1RdqufIlu3/6m2UOa5/FFIdRnU5C93FeMUF8MB2FqiNUED/K/zMR9?=
 =?us-ascii?Q?zASCfekwJmz4mQvS/jtA6HEpIZUn3D/gqvxxdBuTjDrhlevEZmdvrF3MBFpl?=
 =?us-ascii?Q?l6y+kdA82VQGUcqUPwEBnozI7ZP+Mq6WAI0v1dTdcSLPsSLc1R24/Ksgu+2I?=
 =?us-ascii?Q?AprLMCDSOlqwy3qlzjhZzNwhPyb90TrHfkBnDfUQ7iDIpfByahgtLA3nv/sd?=
 =?us-ascii?Q?OiaJ1Xo61DA2PqK6t3ZFujCW7yL6OJOmyvUwgE7+FW1wpBsO2dVm/S/f58jC?=
 =?us-ascii?Q?8zrhSeBSJiwDzFwC1/ivU5TAz4yMo78qy8R1oLmzYcr8/dmp7TPRiwr/sYSV?=
 =?us-ascii?Q?U1SLu29kEoKgep60049uRoOqXxhx7Nu41R/bD1PIts+aFvSKgfg64dqHqmdH?=
 =?us-ascii?Q?m55jh6w8sri357qAYzRNsE2tM93fQzfK6KF+dFQ4VfcaZIA3ez6YgRBIUJZV?=
 =?us-ascii?Q?hxHJ0bK/oTDoVZsHchQ7wdAeNO87tEbK1U/HPSSnCS6Iaw3YuB4rKpC90wnO?=
 =?us-ascii?Q?kDph3Fr8aqeTWjMn3kD2Q1KHnZk2npAcEDGv8O5WLV4NNUliZT+bKYwnV++Y?=
 =?us-ascii?Q?O3uRBtkwrA/NROKbZqWKEBOX96UzbAQRtxu72zM9mzmDnAfDJ8EFafsW1+wh?=
 =?us-ascii?Q?XCwY9YySMqVMYDFybrZmGsadM/AJHvzmxma0aLawUy3hsbV2Tqa5nGzicsza?=
 =?us-ascii?Q?mmnp4/S4z/o1EE5mABajJ7Mkt8ENGZ4ePpu4h78i3MNaCM7we7Qvhjou4StF?=
 =?us-ascii?Q?yPwTVG1oc+xu7BWdPFvgTl0DWiYoMIfEd//g//IpNEtlIyVO2WopX5LDFyFU?=
 =?us-ascii?Q?25yQ+sIgKlN8+5gfkAXp1fdhKXApwYVMD5d7bGGwGxukAxYyFdvzUcZB4kME?=
 =?us-ascii?Q?ZOLNRdHp6G1+RRyl31ijrCKJh9pZdDhOPNeRl4Wlnck7xpJ2jHWgV5OYLMjh?=
 =?us-ascii?Q?onmXAprkQNd0EMVUEB4bDjgrmVhkK9h7uGFfrdQnJeioc+RHttJEYHG2np2d?=
 =?us-ascii?Q?zrYMWwguwGN8mDkZB7zUFc3I8LlTgHUPCBqd6Uf4ZYbdt91SBm46?=
X-Exchange-RoutingPolicyChecked: 
	bWXv5vwa1T/dmAUljenpdJV0A5xYrY13RnGox9n127j1qKSnolEKkVvl9S65J/gQgCIbtZwKMg4BrpYYMadN0xBI9nibCFUPjejZTwWxu8u570hULiNkVlZQVUOocRvTnbybP5QUSLRa+sE6dMvDeXFU5Ykn/NV7b1Yuo6V1+0EUhVSRbQWm/l9ouJ8LfCZVX83cASbvhUT24kVMk042B2HP96JJ64EMTukjUGld4w+CzCZu5f6qoSYmNr3kTSBtbUnAOv8BzrdW94JaDBllpLBOn1w2C5lD9roFwe4u96ZmfcXN4ZFQbbwyxF57Sg0bPl4Yl5hLZPOSrI69mVioFg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670de26c-c22a-46fa-9c1c-08deb500e0df
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:14:11.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKyZ2mygSUHUL0B07GfcQ+LlksbyZ9G4i2izQZMxAsH+UyOwa6TC7yBQfr8qURShnk6A+7an2odN4SAQXVgyt/4i8dSOITwhXCFE4nSgCjSLGmB3LWJZwD+nJC+r6dJC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
X-Proofpoint-GUID: WmeROH0-VGesKjvlu-R8Ejv4DF5XF9gy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfX+xrTXavSfcgm
 wKR98jp+8pW1PQqKS8q5o/ewBq3yul8uC9KZbb8Y4MOHh48o3tjA1QdvB+H+1fk7KHPpwnSw0hP
 XupXE9mmriSXLc6fywkx8vczh+vUYouRebYSqai1FKuXXHtzShObIOa5N+5zMfpyI2XEVo5m6WY
 btbhYR5cPbNxNR5v/T1EqlGScPlCjwUua9B9J0NEXapWqdDirBUEMYIudRjAOTmfAGfySzr+SYm
 nQEF9BUptrswqNDGXhL8OUVzBxkOsHPmYwvrxKSMXcwXqUH5h5totVrAtHTvizPycLTuMuutJho
 6c1uD0KFw5aptNpMY8C4iaZBDrpvOeO9boHHeEi2PCKCHIZ9Zc578ESjBAUXrbuQAW/2Z1xiDug
 OMZ4f32gO4f+Zk5x7sxKvhQQuIrcPkEfxE9OEr3GOViozdwXrp8ulnj2w/tbLkPTuWjXPyWcQkG
 iZK7W2zl+QMKWidSjnA==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0b48e8 cx=c_pps
 a=0b+utHCzfji0ILmZHHcyhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=omqxvBYPAAAA:8 a=t7CeM3EgAAAA:8 a=VBowi81kAAAA:8 a=0wWxVXDjqJTsSKFASuIA:9
 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uoxt2CKr5i4t67rzx1zf:22
X-Proofpoint-ORIG-GUID: WmeROH0-VGesKjvlu-R8Ejv4DF5XF9gy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127056

An information disclosure vulnerability in dnsmasq allows remote
attackers to bypass source checks via a crafted DNS packet with
RFC 7871 client subnet information.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-4893 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4893.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index cf900328ed..4ae650f7e7 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-4890.patch \
            file://CVE-2026-4891.patch \
            file://CVE-2026-4892.patch \
+           file://CVE-2026-4893.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
new file mode 100644
index 0000000000..af7e4119e1
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
@@ -0,0 +1,34 @@
+commit 434d68f2eb1a58744470698483a3ae09b5a9a870
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Wed Mar 25 23:22:37 2026 +0000
+
+Fix broken client subnet validation. CVE-2026-4893
+    
+Bug report from Royce M <royce@xchglabs.com>
+    
+Location: forward.c:713, edns0.c:421
+    
+With --add-subnet enabled, process_reply() passes the OPT record
+length (~23 bytes) instead of the packet length to check_source().
+All internal bounds checks fail, and the function always returns 1.
+ECS source validation per RFC 7871 Section 9.2 is completely bypassed.
+
+CVE: CVE-2026-4893
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=e3a26d092e47bf1d18aeadb758e4ca35c83b5f2d ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/forward.c b/src/forward.c
+index e2f64c0..208480d 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -724,7 +724,7 @@ static size_t process_reply(struct dns_header *header, time_t now, struct server
+       /* Get extended RCODE. */
+       rcode |= sizep[2] << 4;
+       
+-      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, plen, pheader, query_source))
++      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, n, pheader, query_source))
+ 	{
+ 	  my_syslog(LOG_WARNING, _("discarding DNS reply: subnet option mismatch"));
+ 	  return 0;
-- 
2.40.0


