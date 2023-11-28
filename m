Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94A2C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:17:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28146.1701159417583569574
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X+nQFI2g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9696e8b7d2=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AS6HnNE028555
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=EUkTOlkXkGdYkFI0KW
	Lmwbolj3IKcqD/ZBRk7pl7P3A=; b=X+nQFI2gn4I89FXjjw7h9EDnmLDcP4XJoG
	KFTAPHpkDGWwkFStbUzawoKWa6RT2TrNzpPGzEmZsQAxJF868XEjllNVsmSCkDgj
	HjbCay/CCnx64V/gCwaQm7q5W0ROW+EaQrt8roJV7aBvOHOf8AIuCuNDwX9v9QzY
	RSrbkts4an2VgcoJUyMiHBWVFGC5HG0Cc1kDtBdGn07hEqWhLXiQ/1Llg5/5MAcb
	RKUoDTawvqegGHjajaNDdKglq034r660LAQe0+o+nd4xaYUEAcKfFr2vSGJV4byd
	LBJ/JE5t+KoCneyKi1OYML5/DLPKd2trfoPS60AgnIWvCRcXK2RQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk7w6je5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:16:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWnRD7eUl1Gs3opVWV5Xt2fsFMbk2CWovXtW/LYxB3WJVg5k9CkyiENl+b1+MT7rEtmjM821dK8/XkZVWgwIxsVTv9ohyQA1xiRhmznfKXO3rWd8WSeLeRxgrn2O/2YAe43MX41rQQXzZwJ7lyx0cKgMQyDtYDXnBWF3GaKF2fJcBWgN2SE5m3sDhMwBf6YvxMwgwccGtSIk8pKL7BvsRMrwYDwTKiVdpZEVPPYMb7AwLe8VTwK83fGXRAAW7cQSUZqzgIl+602UhLgkteGHhJlTQZiZ5RPlnoPUiMwXKp5iIdXOZoqMPo1DxcXkoEMAkYP4D8SAPVcy2J+gmlBncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUkTOlkXkGdYkFI0KWLmwbolj3IKcqD/ZBRk7pl7P3A=;
 b=b051wwwnIshOCsUKkjdFz5mh8S+OjR/hnxpiPtTw2VXU0lTIQT3tXRmT1l8wgmmqdy2ecHGaNyb+55dg/Z004J2MWlu0D2+VnWV4mpmsKjUEdbLbKHFp6DjhJ28we9GFhR5qLHxitYRxL+/08j3ePdl7o5lQUxeYWAJ9HdT7c9p+ESIOkHYZ0x1sSDD+ji2+vlhqoBeX0PAwM9Iu2gbS1NngyVbXb5XAbxLLfJP06fp4H0FY9YHLJImTc5Otn8sHzMUDNxhnxx3/Asn0o7ueXGP0XVTpa353PigcxUeN2wOkwCXVM/o0PiVD+CdMDGWeUjWEq762kGAYOwXpPzo/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 08:16:54 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d154:edc4:260:f6e3]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d154:edc4:260:f6e3%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 08:16:54 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: 
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] freeradius: make sub packages to runtime depends on freeradius
Date: Tue, 28 Nov 2023 16:16:43 +0800
Message-Id: <20231128081643.860449-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0011.jpnprd01.prod.outlook.com (2603:1096:405::23)
 To MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|MN0PR11MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b4a8f5-681e-42af-ec96-08dbefea6173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5WVqpM4TclWMS1G5wL5u/rsotT2eUWJXvSL6KcZdZyRulZmJQqyRzKJYeKHg9rx/TpGJME/HgsWElb6tSsVgPBbx1qKUgOuQza4KxJed4mC4kmXTCqwhZo7n0ij2ndoNRYBmLPKFH7Qhk4v+FjxWMyQHd07yBdj1Fo+aLe3RaehIULiyBY/qvXTqq3D0RpeNfoWt4tDQbdZWzRSsa4uGrjWu4cOxzhFzkgq33+QBBKPFKstJmmz4krvLeW4O9acWpTFYP8LfyrTMGDeTzXuV6cJAKZplRNcuKrheVbQjdZWHKeYCEsacg3Ax5CU2yLHvYIMNjnHsE+FdXCpKDbkcmfO7pkZF2shWcgQBDUBomtrGXlVir9vfWx4kK5u+RRtRWwZtDxi0qyozKwNq1ICokCg1YTrozc4bteS2/f7Lq/8PTFMPYG4l7xWdxvxN/WdMQU3GLWT+2uPnYiBMDjdokkbH3jiLJ8UGx1OVcR/geewzpjGAdIR6IZIhwZ6xflwMo2PYAwWcsElpgOrE0XTwOgIIXp7cvRBIcBzt4QZcTzCT0yAKS899IV8y/Uta3R4RZ7sIVjZ5Nc+6YEayb0ur6U94QKDagrgzKUt68jPAKhCT4bH3hyDa8k3L42bmqsn0wLkUC2Gl3KhkIFXrw6INvgGG3gT3KBr6kAvnxepUAzIdHpnIjRLeEU5db5VvOhmW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(39850400004)(136003)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(451199024)(109986022)(1800799012)(26005)(41300700001)(6512007)(83380400001)(1076003)(6506007)(2616005)(38100700002)(86362001)(38350700005)(36756003)(44832011)(316002)(5660300002)(8676002)(4326008)(6486002)(8936002)(66476007)(2906002)(66946007)(52116002)(6666004)(66556008)(478600001)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p4zrGigcrUNLZVExZi+34khgD5FiQ8knthTVAm+SzA9Hup/jdiCMVX6JvO4x?=
 =?us-ascii?Q?HO7uXdJcmEIQxMllH8Fk2FUjUIaSbT3kccNBnSCXwUIoCPGNAgz8Aj6WSmh2?=
 =?us-ascii?Q?VAGMgFMxvz9CxaYa2/gjNHMMfkYPUzqmyYCxShcZtgH7b0kPKsELAomOWMJZ?=
 =?us-ascii?Q?2gRpWADHEJrnSk34el3wAgcpLibx5aRs6fbjG9FZc1Pu3RAmciL6ag6B9Lcy?=
 =?us-ascii?Q?S7RoPaaItAjDNobXiP56YbEt9m4dAzObRpUTwXphC16YqyNfc2Kp6HzN9OWC?=
 =?us-ascii?Q?85fuPTzD4Y95pw8RlhibeZ8hzMla5LUz2jO/VjHDfcWp/eGpxJ7w6b2+ruRX?=
 =?us-ascii?Q?SCR6uMBnP84fE/ES/FhDpdP852m4Cw2aMxt/TZ97A5QbICQRk4VLR2u4WqFC?=
 =?us-ascii?Q?u5rcpJregmngXHywKTUKNKwgsDUxp+s7xbLYgARHa6B8f6qkndEWAd/CLFaj?=
 =?us-ascii?Q?veiTv2bSdW03Q4xW0PAgVsYupnpSFRRZ7JVbZ38JJYLYu9SCcARwQIIZKZtS?=
 =?us-ascii?Q?KyPmINi5Yx3l/0SDPIkB/CaBmiTB9UU4nhkWyPtUXB0FNxbkvFWFRT6sTtrt?=
 =?us-ascii?Q?JCf23Nhzvi5XPUsKqKqYFn7TiugyHz2uvrucyGN+U/L5vMQWeX83LxJ4YzJb?=
 =?us-ascii?Q?vi6trtwIv/+u/fpQGd0KiKiUxNaEHlOR62Gn1KBQdoLqzVLLWPLmNrgNydHP?=
 =?us-ascii?Q?Qh8Bdtgpro6j2TRCTsDvjpk9WTHfkcBJYjIhGtvSh49dPlrV+Ki0g1OXsde8?=
 =?us-ascii?Q?iG5NPdj5RYa+o9bTRUrrMjqucc3U+j+QstzgqaoLfmniW2lnJU/Npf3RYmNW?=
 =?us-ascii?Q?PQ3KqHkzvLscWWjnBU/AkfwKy9XaiPvhl/xhfCqEn6Z6MB4phDXOeOrHE4mk?=
 =?us-ascii?Q?lhCKmGxMgf4/U5CaTFBqY6qjNK9Z93yofhFNul6fDGfjc61A1DJecAkeatma?=
 =?us-ascii?Q?ohHERAijob/aRg0t72jRIDkilOacd/v6oaz4sMcw0iH7YJY4NNg9ThT9oySl?=
 =?us-ascii?Q?p0xhkWYyPFMnA29dJj2Y5DJRRDu+z5Ry4Au9FM0/Qe7AcVSsTEtvesPmmghg?=
 =?us-ascii?Q?HuLpCNnxlMVNd7jvoq27NtUblPdL8ZXEctBEin7r6uoXYNYXJ76hT6kSg56A?=
 =?us-ascii?Q?2iYsooE5sp+4IrVpGttDrqL1SK+oi6hKjT7qWBezxwLag1y74/37fWTgMk9u?=
 =?us-ascii?Q?y6ZvcyFNQbEDe5EaEsinIbBrYx+cyRGgcLmg7HT8YvargAVKP09742Zt8Gu5?=
 =?us-ascii?Q?uunAzu5vj8MYkhGA5KZgC5nqeE/oxh5Pd0Jw0kIFwGUJChu4jQbyKAXnmEFy?=
 =?us-ascii?Q?ucdkEYGiZxyPwH6CoR6FXgiFK1OVRtiNTj0IU8FdVIGL48sgaTbDe9I71PdB?=
 =?us-ascii?Q?dt/5LJnVb2WEIOFfUd7wxPeyzlJz7JrYrjkybgFGx7qgsluTTGouxcf3qV9c?=
 =?us-ascii?Q?fa81elndJKNfWEFzqmhospg5poEh1p+7xHmXgYcNCW41n6uXhjNMQiYTyUtU?=
 =?us-ascii?Q?aKuLBpqcR5BYzuh3ohSefK+cPWitnmoIvO/y2KEy0IyiSAqKwK6z4SY/tdza?=
 =?us-ascii?Q?6eqaC3ynIevcTXWGt06gTyoxzc9WH6zSpBp9RgRkIDzz6YImwRQE9iU1KP4r?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b4a8f5-681e-42af-ec96-08dbefea6173
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 08:16:54.1269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbu2Hj+wdTtlEozX+tJp2zqQU9jzKJgyPLEJWkyfrugyq5mOaFkZBli4DYA6P+S/MzHeZOrAH+iVF7Js1M7r9nmkPRvPfaVK80cZLJ9Tgs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6059
X-Proofpoint-GUID: eoueHcbfYtdhQM5miK7zmbels7_Rq2V1
X-Proofpoint-ORIG-GUID: eoueHcbfYtdhQM5miK7zmbels7_Rq2V1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311280064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107069

Otherwise install packages reported warning at do_rootfs
...log.do_rootfs...
  Installing       : freeradius-ldap-3.0.26-r0.corei7_64              1235/1236
warning: user radiusd does not exist - using root
warning: group radiusd does not exist - using root
  Installing       : freeradius-krb5-3.0.26-r0.corei7_64              1236/1236
warning: user radiusd does not exist - using root
...log.do_rootfs...

The user/group radiusd is added by package freeradius,
explicitly made the sub packages to runtime depends on freeradius

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-connectivity/freeradius/freeradius_3.0.26.bb   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
index e38ef2b04a..e3730cfaa6 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
@@ -286,5 +286,12 @@ FILES:${PN} =+ "${libdir}/rlm_*.so* ${libdir}/proto_*so*"
 
 RDEPENDS:${PN} += "perl"
 RDEPENDS:${PN}-utils = "${PN} perl"
+RDEPENDS:${PN}-krb5 = "${PN}"
+RDEPENDS:${PN}-ldap = "${PN}"
+RDEPENDS:${PN}-mysql = "${PN}"
+RDEPENDS:${PN}-perl = "${PN}"
+RDEPENDS:${PN}-postgresql = "${PN}"
+RDEPENDS:${PN}-python = "${PN}"
+RDEPENDS:${PN}-unixodbc = "${PN}"
 
 CLEANBROKEN = "1"
-- 
2.27.0


