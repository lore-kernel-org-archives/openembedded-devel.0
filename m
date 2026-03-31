Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C251BFF60CB
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 05:55:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13993.1774936544357141988
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 22:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AT+ry2s+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8550d9304b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4SHho2006267
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=H+2meXivR2E2xDHeSvNu1Rg76C4/Usk3izwjZHGkMW4=; b=AT+ry2s+D34n
	95L7Ksosr2fHT/OuUp9TS6BXFK3hC4F+dK4q7ch8D6iiionI98EDmTLHGvXcLWfi
	OO1iSwjsSWNIQyNU1b0Pg+ckx9LXktGPh2tqm3PK2yfZjdA+mKp8whkzoJnF/D8k
	daJeAJZzb6pso0zkX8Yu7vCEYZN9PXuSg/TKj++XzLbkzmuTu0lXh5JHxvT1uxv6
	rkfinXOhzANwTex2IQnILCNqQM/e947YL1OEsgZKi9monMjDneC00+fZPLMWH9Tc
	sYwInmFNAqaDErIVOs5i3WG4MD4JVNkxn4SnMj0c/UL3gvys0kyF3+5ThPTwkTrJ
	SR8Nsg9CiA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646vu76d-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEd9uqoBuaDlP6Isuz5YtVF/n9IraGbfe+/pvU1bwXAP97xVmGInY41pUazAdymy3cfIkqW33SZZ8rVaa9OfAgnG50iMQekr7m4+LSlQ9es4P5ix4zvX8YpqmcgfrN6bsaVFXzdIF105KR3WjsQnO1zC95xDxdyy118KpW9HK9Oaixcqt+0XRtnBW0ZAGx7bqP4kDaybJwAbVhij51iXGt/z45WOpW0bH2vXq+RcpRvDWBV7L+pHG6tMtCxAMSwLGXpVtB7KXKGH9YxQYsJVr/6RykMycrdg3iWM+0Jc/zD4AJCHK0b2si0KKx8zjaA+gtnGWcirSC7alHSQmHkYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+2meXivR2E2xDHeSvNu1Rg76C4/Usk3izwjZHGkMW4=;
 b=UqeeJu1vgb5lebpO0faFERXiG09GC64rFqIJKohN/F5KM/EkRWnJpobiNJJR5vKCiUaZcM7H1aVsgJCCEfyoyqHlxrzuTqaTr8WQ4em6vLnNz8TV4WYgUlFwHb79djI7LI5I2/EUhf7twvmDfb+axzNiN2RMXYPk3jhPlme4p0l/yHU0SR07qqxQDZSLb5mBtdVLqN8jFQhhvgbVdqHT+yiEkF7fG9yyBKUIx2r1iFzEri37Zyn8tk+7bEbmkD88tbIUY1auK/WaKecn+ukIeTpGlQHoXO0/38c2bOs7MOadyRVOLxXxYtjUHn278MGQQqsg71opKrKnLtt9JHhssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 05:55:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 05:55:41 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] libtimezonemap: port to libsoup3
Date: Tue, 31 Mar 2026 13:55:20 +0800
Message-Id: <20260331055520.444552-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331055520.444552-1-changqing.li@windriver.com>
References: <20260331055520.444552-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 1677c09a-1f53-40e1-f43f-08de8eea23f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	UI1RSId0eMV62CdfDHTEN1DQlqxmr2KEUZFkCxoyB4SIjnwbNpj4hEH0F27YWl+RSLes2MGmKwdh18pvosu7XAA3N88Nw4WmGBBghljP7/YM1iOo0E1WowC6btXVvkV7NvAuJEzy1jOSF7yPMK2flZc/MyDXF2KPn+57e77p0psVoATVKHlWO3ZUfWkbFheAouglYWv4ISJ84AAOmKwkX4l6HP/Lq45InIrDmZ7yAiCWR2uDn9beL1VQbBuKLlFsaDIso6oFX3L9DpswLqXXAmjKSc9d3eRyYwngEU5E54apa+y+UYWEqefaefP/0QrPlVyreOaGSKyjMROCqCiG+zlaBwAAqv127jFexo7vSVHbpyIoryC8jFE/jHsQrpUSHMDGH2V/qIZzSyM40dU+kUX7N8pC0mXXidi8GKlb2X0M2S26wb5KtuMitLRjonvX4lPOe7RmxFZD5xNQtNKoVE+sjs9y4PC4+yi6+7tNWzbSTaQx53Cml84affll7eu929aLkeNGbMKDefxTffFfNQjA7w1Ngr+mElaa6Tu4OTivVeVvQxKmg6ZA9L2cadSUHwpHNHmdrxJYgC/kujni97yS0gtZFezhqR+FYh5g/dCZ9mk06QBn0Bc12EkVBlpt2EDnSkNoU2vSjIwsUgdC6WsAhCgfeoDyfAktT9IUhMpk44yGpne3mc1vRJYtxeEEve4sRrH2p9zAG4U+0NfivWwmvStAwcgFJQHGe2y/6zk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ve5+ouvHenTTQGo44Y6I373ikfS16eFo5pttLgVnGEbgdLeIr61B+5V6RTrI?=
 =?us-ascii?Q?8vPF3dadyIGpp+4a3Bu7XkatVnLhJpbxaw/Jd5lc7qBH3bdieR0uFBQIuCTb?=
 =?us-ascii?Q?tkmc4NrWJi0dzz95ldmZ3bES1/G11Aw6N2S15+HpxffAGcNh4G7rbLeheDsI?=
 =?us-ascii?Q?dqvv7RpCaLzV1Q0flVElLXC1K9oa4DiscatTvFIbRVaZgOX6o8deThHjZQpd?=
 =?us-ascii?Q?SzH+6obdIe0xcu3w1/aMEx9Z2qyOjEbP562aWMA64ZWhU/OgVeAnEZyrAXyR?=
 =?us-ascii?Q?+g6G2Ev6q/hSNGIqQPSMzxwnWDv1KVmzZNfImkZP6Wy4rJQmn3okJ4JH4qbo?=
 =?us-ascii?Q?wLEf0OTK//vOIb3Pp4NIAyy174qIrnSayNAu7fDYBJYs11Tvc4V2LHqMKrJj?=
 =?us-ascii?Q?Fi8uxgG9rIqFrvSdjXOpY4OOre7zpr+rSmtxERKobTJiBhYW1DymOrFw1O3I?=
 =?us-ascii?Q?xcXWdj08IETkv9M7bKVKAJdJWlGx9toXktdUUcBodYDjWTWSWgABsUGc9Sz+?=
 =?us-ascii?Q?hz1X2JF6QX1gdRzvJ7L/1XZovVyJycFxhEQQy2Ytm/dPrYCoN5l0qvCTyXSa?=
 =?us-ascii?Q?PPy15mPw2i9/egv3uaRbHLkwS9fs7au1VygRzUdzYogcjwZROQal45Rj0Qu6?=
 =?us-ascii?Q?iGOlw3uqmABCPvlXLCnd96A6/BuqO22BXih02S5IGB8HlEwtzBdlmQbMem/y?=
 =?us-ascii?Q?5YXYSXmGuxrDa8KSrSHnLnR4pJ8zt4NYLgGXON+u2NwjZkqnhJ3w7moU/lTo?=
 =?us-ascii?Q?eMj52azGsc9eaeJicKNyz5D5OsKqY4Vk937T3VNHQM4G48+Veul3S6RaqwIH?=
 =?us-ascii?Q?B7dKNpixQHTxMoEoWVvLGXuiOCDVklnO1uhoUk54YPqnSCYrDoyTVMEqG7j6?=
 =?us-ascii?Q?/0v45uOevzqECgLHNkXPpeS0vU05FbzmjlHKx1pEHGBAo8oZiqSSAZLIbg/c?=
 =?us-ascii?Q?/W4BF6wFKILSoEskPm9DUVq/jfQnU0jp3kVEkTcrlIZtmCPOD6qTBrKsRl1I?=
 =?us-ascii?Q?7b67w9z8rvoWKgDvV7+p8sevwamh4aWQX2MSp5KpseL5KG+vRq8TQyS+Wljc?=
 =?us-ascii?Q?smdzqCVBm4z35e9WeLoGCsDjCtJmp7gsGrtxlN2AYuiseodmGYv5W1+4ZVwI?=
 =?us-ascii?Q?leJwxtYOmSuqqfM7Pxb9tvNgJvC2E6i1ulPqL7UPwsXZsdxcZacb/dYtC2xv?=
 =?us-ascii?Q?HUn72rdUC1pOcg7rxoOfZx+sHrVxtlsJ3/YPrvuA/fc673/iKuI5Z0bzYfZ9?=
 =?us-ascii?Q?WBYGVf89Ct9O7fadcRVw0dmIHhQrUaqxwh4lQAHPZ153ev+eoHb4UAdsbJat?=
 =?us-ascii?Q?Sq7wQeB0ZNbYRmqbP/OASL76MTqJ3wfIxgc40nNy0QLhtDhxvm0uYBmUfT4K?=
 =?us-ascii?Q?Qf7zcDBTyT2XLj32BAYSPWXdQ5IV4o8Nvp2fks76P3X98xkHcO9taeCAAn2p?=
 =?us-ascii?Q?L75K55ZPkZcGlz1uUVlMdrv918YLjYt4U0rNJHYoQvIZpZvrH7EWHSpeuie2?=
 =?us-ascii?Q?1dpVi2PmokJnPgzoVBLQ4vRlJujyvBlKhwdd9pGFMk4IkhHBpmjeKgL4LtnJ?=
 =?us-ascii?Q?hPvcnI6GYxN03PSLOaOG9lPYhCjClQ9z29T92UZBkp1uZocCReb6PZph3bVg?=
 =?us-ascii?Q?XnmdB28gc/oNSM90+fIvwshFh5Da83hmN4jGeQXYoDOYOC+YGoCeCiIqVMz2?=
 =?us-ascii?Q?HrU/e2u7wSvXcL/YycchdICYY1R6XdKED+BLJatgxKxOHppAHfz4biXjZjza?=
 =?us-ascii?Q?zyMrY4mtDE7XvVTPJZP4iLfPH/DGwi0=3D?=
X-Exchange-RoutingPolicyChecked: 
	QigMfSrG7U/Em/gqBXmOLAgIRKqUhUXteAi8v0o7VakwnlCoTyrUMTGVRzPx/7EtRhXVzFsZ8U6hwfw22TGfXUXdX9ctbN/KiH2BYeXe5NW+lQ4UIMl8qR6p2tiiwsIvKC7gTnsB3wIBLsGmYzD1VA9Gd8EPpljnqEnzkAwSpKgWcK7FVIevwvD/+/woH5Ra1jVyTmjKcp6cKHgfNmRynbOpTqDiD3NgAZJ/02bkHBOReVyJys6CDMupp1Iku2G41hvKPuF7L8Wdx0ZhaoRCLoi+S9NieRaOHXp3FVA5RVtINTQ4dYbj6W4r5zNwTfW881VrBSpgumPuLogCG+kPaw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1677c09a-1f53-40e1-f43f-08de8eea23f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 05:55:41.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bI/9VEjNiAic8Egmc/H5MKel+ZkyiiMgh9kwveYhoVaBnueDMT89QfJ1NsgAyHvRO9bUCxYlsCfDqIYu3ws4e/gIDBgkIW4Z4ewP+qSyUP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69cb61df cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=xNf9USuDAAAA:8
 a=t7CeM3EgAAAA:8 a=UqCG9HQmAAAA:8 a=PdRzxzVcu2sVySQX5goA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: k-eLhxV0ZF_MNiNIOE5OSb7rHg0WQORh
X-Proofpoint-GUID: k-eLhxV0ZF_MNiNIOE5OSb7rHg0WQORh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA1MyBTYWx0ZWRfX123BXxMPRmD/
 UARxKQlLdMKJ96RhrF0fBS7MSYr/f6z+bTj4D8/LmGOW30yr2Dgjpw5CKyfOBCkWTcnJf7loJoG
 e9UIXcJtUQFYp2iNnBd09MD6UYU351KlugRNMm+X47F9G/rzpvRl/yydllefPapjsic8S/u1OI9
 zCTtfDZrjCPfv5uThXbMt480wan0a2qVf6zPA2H34gexusgKfdIDViq/aZaUtmIwNi8uX9vEBwk
 uOZcA9W0v9mr9ltRAEjdhJa9LEmNG4GktKNqzYBG/nfPUxlJrvsRtaGoiTbWvE6lxFez9YnqaxZ
 DcVktZ87EJVnG77j+zDpX5mumTrxpYmjfyomEu+Y/5sR/TkNXBJzOHn95QOQm9oBfXv0phuTGoz
 V5pUL6ObaIJmOx6gUxLQ8VswEABjRR+zznYQ3o4x/Fg0UoEXkWcRT+3/JlpCN2EPYip5i8P13GR
 TO7AA5CFx6SCC8hmUSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125876

Backport patch to make libtimezonemap port to libsoup3

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/port-to-libsoup3.patch              | 95 +++++++++++++++++++
 .../libtimezonemap/libtimezonemap_0.4.6.bb    |  5 +-
 2 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/files/port-to-libsoup3.patch

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/files/port-to-libsoup3.patch b/meta-gnome/recipes-gnome/libtimezonemap/files/port-to-libsoup3.patch
new file mode 100644
index 0000000000..7039be1795
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libtimezonemap/files/port-to-libsoup3.patch
@@ -0,0 +1,95 @@
+From: Joshua Peisach <itzswirlz2020@outlook.com>
+Date: Sat, 06 Aug 2022 11:37:51 +0200
+Subject: Port to libsoup3.
+
+Forwarded: not-yet
+Last-Update: 2022-08-06
+
+Upstream-Status: Backport [https://salsa.debian.org/cinnamon-team/libtimezonemap/-/commit/ed57d8331a7429487b9c8ea97cc7bd684ed5a2e1]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+Index: libtimezonemap/configure.ac
+===================================================================
+--- libtimezonemap.orig/configure.ac
++++ libtimezonemap/configure.ac
+@@ -50,13 +50,13 @@
+ GLIB_REQUIRED_VERSION=2.26
+ GTK3_REQUIRED_VERSION=3.1.4
+ GIO_REQUIRED_VERSION=2.5.11
+-SOUP_REQUIRED_VERSION=2.42.0
++SOUP_REQUIRED_VERSION=3.0.7
+ 
+ AC_CHECK_LIBM
+ 
+ PKG_CHECK_MODULES(LIBTIMEZONEMAP, gio-2.0 >= $GIO_REQUIRED_VERSION
+                                   gtk+-3.0 >= $GTK3_REQUIRED_VERSION
+-                                  libsoup-2.4 >= $SOUP_REQUIRED_VERSION
++                                  libsoup-3.0 >= $SOUP_REQUIRED_VERSION
+                                   json-glib-1.0)
+ LIBTIMEZONEMAP_LIBS="$LIBTIMEZONEMAP_LIBS $LIBM"
+ 
+Index: libtimezonemap/src/timezone-completion.c
+===================================================================
+--- libtimezonemap.orig/src/timezone-completion.c
++++ libtimezonemap/src/timezone-completion.c
+@@ -270,9 +270,10 @@
+   CcTimezoneCompletionPrivate * priv = completion->priv;
+   GError * error = NULL;
+   GInputStream * stream;
+-  SoupMessage *message;
++  const gchar * reason_phrase;
++  SoupStatus status_code;
+ 
+-  stream = soup_request_send_finish (SOUP_REQUEST (object), res, &error);
++  stream = soup_session_send_finish (priv->soup_session, res, &error);
+   if (stream == NULL)
+     {
+       if (!g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CANCELLED))
+@@ -283,8 +284,9 @@
+       return;
+     }
+ 
+-  message = soup_request_http_get_message (SOUP_REQUEST_HTTP (object));
+-  if (message->status_code == SOUP_STATUS_OK)
++  reason_phrase = soup_message_get_reason_phrase (SOUP_MESSAGE (object));
++  status_code = soup_message_get_status (SOUP_MESSAGE (object));
++  if (status_code == SOUP_STATUS_OK)
+     {
+       JsonParser *parser;
+ 
+@@ -296,10 +298,10 @@
+   else
+     {
+       g_warning ("Unable to fetch geonames (server responded with: %u %s)",
+-                 message->status_code, message->reason_phrase);
++                 status_code, reason_phrase);
+     }
+ 
+-  g_object_unref (message);
++  g_object_unref (object);
+   g_object_unref (stream);
+ }
+ 
+@@ -362,7 +364,7 @@
+ request_zones (CcTimezoneCompletion * completion)
+ {
+   CcTimezoneCompletionPrivate * priv = completion->priv;
+-  SoupRequest *req;
++  SoupMessage *req;
+   GError *error = NULL;
+ 
+   priv->queued_request = 0;
+@@ -391,10 +393,11 @@
+   g_free (locale);
+   g_free (escaped);
+ 
+-  req = soup_session_request (priv->soup_session, url, &error);
++  req = soup_message_new (NULL, url);
+   if (req)
+     {
+-      soup_request_send_async (req, priv->cancel, geonames_data_ready, completion);
++      soup_session_send_async (priv->soup_session, req, G_PRIORITY_DEFAULT,
++                               priv->cancel, geonames_data_ready, completion);
+       g_object_unref (req);
+     }
+   else
diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index 7c8e410b09..cca9e632f8 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -5,13 +5,14 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz \
-           file://0001-configure.ac-correct-the-version.patch"
+           file://0001-configure.ac-correct-the-version.patch \
+           file://port-to-libsoup3.patch"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/libt/libtimezonemap"
 UPSTREAM_CHECK_REGEX = "libtimezonemap_(?P<pver>\d+(\.\d+)+)"
 
-DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"
+DEPENDS = "gtk+3 gdk-pixbuf libsoup json-glib gnome-common-native"
 
 B = "${S}"
 
-- 
2.34.1


