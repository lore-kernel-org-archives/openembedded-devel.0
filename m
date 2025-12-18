Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A29D68BCA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 02:22:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32114.1766024530023047640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 18:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nT9BMOJa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Xiar3861732
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:22:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vlRopWok5djY8K4WEVPn
	wsINaEhFDqoLQmUBEHMcWHc=; b=nT9BMOJasKSQ8CkCOt/8awE8os+pLr6q5O6Z
	N+WP0IQHx3rmSLO5/pBpTi84ZGSqhxd5H8bNekjoaxj01a2oOEGi2nqmh7iEKGnG
	y/5/KAaAMQXur1VUT6H8UfpOQ8B7P5BPA3C91sEuJviUuNa8WZvfGfeu4o52yNX1
	UF6iVWPcGvwEMWK9Dia2eRv4ZhxVL/+e3MvPBP9OUdDslh216L/uJsLAaZUrYUeC
	x31KaA3B95sobTHWYtoWT4G4W4VwTykF5anGHA+lVa1YK6oKolCFZQWryj5ixsH5
	i/z/1To3rkmwbPLr49dq1Hzzm0fhQgGSFIdTBb5nTjw8f6iCDg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0shc7t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZopSi3J6geitbXnksGcIsT3mB67RLxd/7HMeFDXdaEiyI7boaxckkFm1356fsqf19amMWFkvWq+iI79Q+7x2PkLwWpolEfwIukc1ir3spOZZPeFV9fYCQwsMhZha0MnLAyCaAUoWQpBa8B35ZtUZPBfeE1u0dylUKKAdEkEw3cf9uVYaNvB+ZJ8ImZFofJNGF4oZ65yUqpBDe8LZxWkaMWobLn/xRBQ3VvlUW4dxj/w9WLpdbbPdSeZcw0tl80NW84C3jLBru+vq30uV7davroJWK+srLmsEIkk1o39j4Dj7YT+7xyTPFMdNr36jnNymOF22kIJdBZs/1zjwu301Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlRopWok5djY8K4WEVPnwsINaEhFDqoLQmUBEHMcWHc=;
 b=lUQZ9LYmukSlkMYxauOloY6jLRQ5xWB6Ey30jGEnAalp6N6zyOx4z7WHi7bojzvJT804lDH5EeHyOjKwlwPIZV/SY41Gylb1hvJtgs2NXIsRkZyl6nzrYIaF7BgS0laIky/XWl0D6o1ITRejF3Z+BxGG+aa9E1iTQqwF3dmjMjpEWvnyNWttQERZ6r1AeHvOsY6cCzNQNN/jFNvIprOIuNX39BCDEo8WayPq8Ua/s29R5/tC2ljSl/oeNHdFEFlbtdiR/QNry9GP0bM5lIAKwhW/5fwuPD/sW2Rx00JI/jIqo/b4j/Pemzgc7q2TBFco7wi0XwvXuIApYv3LcPIh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Thu, 18 Dec
 2025 02:22:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:22:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tk: upgrade 9.0.2 -> 9.0.3
Date: Thu, 18 Dec 2025 10:21:53 +0800
Message-Id: <20251218022153.3359480-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA3PR11MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: dd8e2992-cd89-4c5e-e60e-08de3ddc3de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DHg8AeMBLZidtYF6XwJpbGQYUucm0XQduU85K/gKmrnv9ukOYwmp8OE2764t?=
 =?us-ascii?Q?y7Tl6YziJNg3jX2cQhl7bkyL64K8r0gvZ5QpgXf56t36G31ZUc58GR25sAok?=
 =?us-ascii?Q?JftqlxlN/mdt0Yk7Hzi9OGx6j5ljIC8UWu102H2Vrmwu0qITzf8P7AMBheBj?=
 =?us-ascii?Q?K9nWPDiIr0CsP/sAyGiYrai6L8xPIro4OtWyg+9JhEviamvDqobtLWfZAaI0?=
 =?us-ascii?Q?mjTD6eERfOA5BQPSx9y44lginfxSWJUqslGw7T5wnp23FkDld5MGbc+dmIKH?=
 =?us-ascii?Q?COEDCoeItWIlqPf8Y8dQEyl6RGwwCkSZJ4N/eEF1VpcHeb8lbv0iYRxb8Wtn?=
 =?us-ascii?Q?PIlOGJUs5BhR9/oTOI4eYfadfdhV9+Pya0D3XBXUs8Sv9lNYE/IrR1imEgQB?=
 =?us-ascii?Q?DMy3ukArG4bgLk/ZyG7hmx/K/1reLGd/JU69Ns+sK15QMBYaa2Qg7nrRn2a6?=
 =?us-ascii?Q?4rh4TyN/8YFAf2vjCAXUcQzg+rdkviD3QEQ6ZvP/dxqQtMpnxRsQ48BAXMz7?=
 =?us-ascii?Q?7/hgX0baY/4zedhQioU5GYe3FTaD7OQo4ejsILdqO+mTXRhCAjS+CsM6bIYO?=
 =?us-ascii?Q?w6OsQSLpLGxVgXa+GA8WgMkrhfyisG3wL1GBbKnNJMYtBlRyMtFJEieOVMMA?=
 =?us-ascii?Q?rp45MofhFJhnh7hQYfWYHNEnswEJziqxu/gsiqa9zyMZN3U1kyPmN9n4sl8g?=
 =?us-ascii?Q?IJaUjkbHQJWP5rxvguzsbVDeK4frGdGhEyN9Ng84zbwd9EB5pTyUE6GilWcG?=
 =?us-ascii?Q?Nl/WG7J25n4oqC/sfARcm3sm54LwHfhxUeK0USoKNoiCCvD3ziUXBGmtJiUv?=
 =?us-ascii?Q?8waFBYkSoD2nWAcWTk4HtfxoA4IHzZh1wEqypWPH5oi1suJx6QiLoL8jodFT?=
 =?us-ascii?Q?iFWUS5vdy7Oju98vBFjUbdHniMzu0X2EttklT4XXzGPiNd7X8wnLMixAdQfm?=
 =?us-ascii?Q?mihOCIWvwZMrdpoOZEledEcTokFeJhehtOuwO01wl/ZliWZLyQ55yUqWz55X?=
 =?us-ascii?Q?Rjnk9YcUS7iiWjFfSKx1MUdPYVLDm3wKPG2c1f7d0B66DCKNjUER+QclUUXK?=
 =?us-ascii?Q?dLqiBPkI4WrpscHHduVUI61pqenZExEd0mNxNZvts9hbpP67lUtZQsqEgjOU?=
 =?us-ascii?Q?bopDnoX3h7vawA1OOrekRVHkhr7LUgOHF4kP279vol4Pd9poSFlEas/QG37c?=
 =?us-ascii?Q?CHGkDieGorSczac0vZfSS4XmQGmKg5aasJNb0NF+psuu43BF5tbtCRfU1uMH?=
 =?us-ascii?Q?udWo/RsiUZuDmnYgChHHJA3SjmJZVG3ybWYrTMuefAx1UxQKHx45UPEXxzcs?=
 =?us-ascii?Q?OeB7cWbXi/ISESSquEZ+65XysAP7HoJToqzTd/7klERQJzWEyyEzmAEf+WgR?=
 =?us-ascii?Q?7LoqhgD71ebHA+N9Liw0coJcmkRpg5nD5LtTZbetWAs7GQTQV5/AvlBa1Egw?=
 =?us-ascii?Q?iPGw7WNqTmDSHSuuNmij7mYPgWNBAiBV53ZZ5yTmGbXupxsrtxawZw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YLHHRyYBf3nvNE2n45HCuU83m+QP873o9wzgy9buCP5bdR60Xqbw+tQ0EAax?=
 =?us-ascii?Q?jBMjax400pFcmW14ReMV9gn6Jikuio0Fpu+hqY7UGevQdov9ZAbeL/Rv2rnX?=
 =?us-ascii?Q?dYhiYp61YcuO95NiZ5BHS3vYEZgRDPSN6PMSwe7RAt9EC7Tz0qGd5ktPurP+?=
 =?us-ascii?Q?y/MYrveCfzcQ6ZGualW8FKT4HPDVf0BEyM2tHWVLTu5hQ89sbrEIi0hoAXPp?=
 =?us-ascii?Q?AzJFh7EeoSurvnw9Ku1bkJqePu5HI/6m4exLCARgUHZlZtABIHYwi+ofptAl?=
 =?us-ascii?Q?fkMKyABcN9HyurusvddmcyG1jOQI9HTNuvy4bgwJ/wcsq0YdruP27qLq81Dd?=
 =?us-ascii?Q?oD2xJXE1+QGbF3dT6MuxOXvyCQ6z/GstWMn/ZqgHzp3BT9ulRQjN32E5qdqb?=
 =?us-ascii?Q?81sMMMHl9PCW1GaIXNDE2M6qpPChIbaZAFd8kpJqV09MdSMIwCeV/K+Pi5oC?=
 =?us-ascii?Q?/hllNGEfQyM1ezjtLL9spF+nyQHC/oa2O68CgsvL+J068pv9ALXvxNwqjXkX?=
 =?us-ascii?Q?YxJ35AthIa5CVrZ2NeceVI/X8xQAstHQbIRRU9Gs2HGt+HaHd+vmBLSA9amM?=
 =?us-ascii?Q?fsHpNoADfMstnutVc0TBPNwWhXSipE1Wpoa+dryWOaSvLGYcslO7xStAEFWe?=
 =?us-ascii?Q?DjSrKWcZ1SBhvQaf7bL2zv6ENCKdeG+rYHyADAVJTq/PXwqEQDuFHP5GPHtM?=
 =?us-ascii?Q?7ZYNJcUuwXp4sx3wv2iXWtIwLubb1GgIMiQZcMHxt5vyKvJ5L9/N3tzcqxbY?=
 =?us-ascii?Q?qcV9xnQiHK6FfWBsjKZ2MkBmsOG+IPbMocRaLHy2uBhaDyoc/te6J5NVhfZ6?=
 =?us-ascii?Q?7cHm3AZ0SZnB7hYen2BjnHm3I5jy5KxbMWCEYgT4/ypbGkQ1QDeE6T9MXhqj?=
 =?us-ascii?Q?wLLGDfusaKhmTexqZTGXQYsSU5QKhDCPrzoDgOtKaZiCWPCqXM6eKqpGpaxM?=
 =?us-ascii?Q?YDAM9gaehRBQXM6c+7PxbJ9VAO/8hjuXe3r+aRDbhgrRhl3OIxDjcD41WLhQ?=
 =?us-ascii?Q?QEbswAu14V9iM71anyze/sZ9bQsozgRs7qippYGtxKSfLDLXxZmhdSlDIO1J?=
 =?us-ascii?Q?V5TFTcE4ABg/qed+w/6s7kTnMvw5LSdWfDINjSkAaAWqV4g7ykMztupeG1iZ?=
 =?us-ascii?Q?Y1OvSXqnPvDtVxmR05/lAstEXOBzpSW3iLBkR9U2flW/WLHIK2bdQDWk7KEc?=
 =?us-ascii?Q?4BkWwzbp/3I57mHKxaQLlbnlFthghu0H2rwo9Olzg3EaptG/MjNkcTdXh331?=
 =?us-ascii?Q?c6NbrBp7WvatdRSINVJB4/WBahvCvhtBuZkyu66bGvE8982aP5+3QBNVVzdE?=
 =?us-ascii?Q?rwGYtCM9X0znWWaEw8hLe1z15/anosl8k1zTKH1Uano6FUwRQ789rLCMhcIc?=
 =?us-ascii?Q?SSkLOMzQX3KIK4v2d8Jh88fKnTAcTJ7Z1eHelg9LMrvvCXqSiK2IwjXKdjl3?=
 =?us-ascii?Q?AowQ9AX+xlkEMcas5VpYpSj08ThlJ6QWib25cq3s0evIp+Fqqaii4UG3EB+a?=
 =?us-ascii?Q?zoAKx14hCeTnWnmnZhGCxzCAuMQBLZS/qbEOqkDk+gl3QERa95vWK1qQnYqC?=
 =?us-ascii?Q?rXOeshF0jmNR4hzX5SaBADB540AG5ldSx+0C6yyI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8e2992-cd89-4c5e-e60e-08de3ddc3de8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 02:22:07.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9M2C1o8WCXwz6xKy6agJ2l7+PA97xL4fOhFNIZDjCNYgP3XuoD9f0YSwe0fpyUUEzJecGv2Ra+qpo44dTO9Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
X-Proofpoint-GUID: sFigNEsy6WWU84XUP4nNBUNhNjlr_nOU
X-Proofpoint-ORIG-GUID: sFigNEsy6WWU84XUP4nNBUNhNjlr_nOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxNyBTYWx0ZWRfX+dNg0KwVh9V1
 wOKsbWGRR1mwsLMKZSjGGvZBZPITQQB9SxAEg/c+EqpjS8bPplouukfT9/RA2dTdJ4C6j5mdxWM
 9pt+cZfB9hwM7bDdroj0cfad26wtEGrns4Fn82MKRZP+NdL/WLch0x5LXm1Hac8e9EpPIa/GtOs
 GJyUy0gHgLo+JREVSZwSxY4MQ8ZJdISEbil6jNLLhyUUxzyFexw3N1rfqPnGcqjqjEEtXYswt+o
 DDqb5yvEEfWIGhhRDcXWfnvoB4LmvB67APWhJcTRelRchh/mNo7m905T4kwyzwSxJL68IvtIB2g
 NZ30Z5J6vZGLdv/6rYeLmGvSoSMI0S0XJyu7GKgHC/woD7UBPFhNd8bREEgbgcsALSerc5NhhR3
 TrztaUUW+PvjLpIYmlOP8iHIv8c3tw==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=69436551 cx=c_pps
 a=fgNoY2FrYBgJmLE9YDNrYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Cd_a9bp0AAAA:8 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=tqgbwE4L1k5mLW3FGwsA:9
 a=VTyE1620iiVinhSXTNLy:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 02:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122732

ChangeLog:
https://wiki.tcl-lang.org/page/Changes+in+Tcl%2FTk+9.0.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/tcltk/{tk_9.0.2.bb => tk_9.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/tcltk/{tk_9.0.2.bb => tk_9.0.3.bb} (97%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.3.bb
similarity index 97%
rename from meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
rename to meta-oe/recipes-devtools/tcltk/tk_9.0.3.bb
index 16feb1182f..e059cdb8d1 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.3.bb
@@ -20,7 +20,7 @@ DEPENDS = "tcl virtual/libx11 libxt zip-native"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
 "
-SRC_URI[sha256sum] = "76fb852b2f167592fe8b41aa6549ce4e486dbf3b259a269646600e3894517c76"
+SRC_URI[sha256sum] = "bf344efadb618babb7933f69275620f72454d1c8220130da93e3f7feb0efbf9b"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
-- 
2.34.1


