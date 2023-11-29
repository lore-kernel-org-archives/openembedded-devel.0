Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAB0C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 09:25:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28361.1701249942074598426
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 01:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AhrWeFPA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0697b54c63=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AT9P0lI029081
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 09:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=3UeLfWmMSSCJOF21Ek
	Fp95wOlbqTR7NeMAWQGcX8Yr0=; b=AhrWeFPAhnu6gNp0A/Lg5BuGUyWerKBI6S
	FH8PJgzxVwT5j8RTzrEgpbmCy465GHnE542Oy6dt6naOulHbmA5BUra4UUoJk09/
	i+Pv2eTD0wHOukuIuvToGeud0xiYYziLJpdkbHvZ7n4EewSaj9c/YmRGxgdybKBN
	ZunPtgiCM6+Qie6Y4HCocTIHEu605FMi91LoC5Z8vR8Hobwdi3jAvoVQjbRpr5S+
	JZYuPB5WKgE0oI3KHRPM8+TjmcCBYc04cZ2FUE6lUj1jVOqosSZaBsVpED37GAn6
	xim/ZwzPkTUohP0yEpWhvRRr2gv/SRUqJjWGhiBIRJ3+lE0fHysw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3unvm5885h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 09:25:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6j71WOqP1/r1w1GYF+Hsfud9g9mYL1IO4sbEsIgQU9FK53WzZIB14e6lSwN+p0cSZNad3/OZD3sjhKL5pJuZ9mSkqvQO2mrufhUS60Utj8EL8IA8lDlLZmMKBVJ/2GmtZ+coJUKnfpMjC/zbiV31QPEpMnBEbYVs+r9b9x0aweTHu0WgIuShGhWqbXagNUExy64eut9V67u75bZfYVPJHSws0b4ixmZoFtvNw9B48ck2TSUKYZbG5WFqlIuC9XFbxrbnda/6dGB2KELnyLpt/r85OLkSv0NwUIW/jzn974WiftLwwYB8DkQIUxFozt/qisIM4JHt3/kYJePsvxycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UeLfWmMSSCJOF21EkFp95wOlbqTR7NeMAWQGcX8Yr0=;
 b=G7UBgnf3Boa9Js9DCPyrMhFYhNCFN0Nw3wuwwZ7nQLjnGHVwr9AWIyjEpfPfyJ1SM3D+AEtdibpVFacAzpJ9U6gCoI9QQoBUu1yG01YMGHL+06e0QFXrE9b2Z9ZXj5T/s8Q0lsktUlFktlWSqNBfQa/8fNpIdyjkWVtn2xY4vAyNevVPz3m90r80uzfcocGdoD98uFymst0xWt9+qrrOoXist8Y4eM0JUhacnpL3QtPyVKTLSs4/G/bahyX/8Ldz8ocHeQFymaFE2YCBIgJXe/OuppJRC7qNE/USIQedqUGRZSHuN9nV7F6LORckz9aKmFifz/A7raokNSEGPCk92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 09:25:37 +0000
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::9faf:5e6f:eaf4:7374]) by SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::9faf:5e6f:eaf4:7374%4]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 09:25:37 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libbytesize: update github branch to 'main'
Date: Wed, 29 Nov 2023 17:25:25 +0800
Message-Id: <20231129092525.37981-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB7155:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: de244c10-194f-464f-8ffa-08dbf0bd2536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KYNkpQCH2/1dy292oTE8KR7fuq9iBaLqnnO0gHRKGC7T/j9mOqR7cmTB0O9m4f/wPsCEjMZXkSwIyzz1CZOQ3hChjYtDaVt+1VS9DWcoqVjtkqkmjsgBXLssuMl/eTdG8i4Xm83WKCIxnzYVZN6tQ0WZzBoj1zVC4ih5E9p6X1moeUKtHLKLz3N5mavX4dIDdtviA2fMWNaZLb6c3NMc3mpFnDNegI+DGYTVv/kwNOhZyVyi5Pmt9THDJspHqdIqprYrSKHdyacxFPXUKX4bPURUZdYEFv1OHOjbq9EZizSsmcXdEagbEy7iQHmtte56NYah7UmA0/1OqDZmSp+YD4F17GY6vlYbLrn1nXQBawvueMwaMMEcyizgrSXNriuaDPEOYY7POuTEA98TXXU/Js29uTTY0mbxyLV3grHFVJrUwzV3iu4ZQF2rAMXoPziVvNm7ElpG+jAGtIvMopvo+ULXpQYm6ZqMhu7zX0OguHHDluQN2uc9ImjaueA4ntPX68ElmgRCpgxfF73m66Jljaf2y6I7VsDYCqQpWTO9Gh3pCkioSNrZu0O13BzAZzPYAYnyzTr/5HrGI/WS2qRu6ON0DOsYq12Z4Iq6Nmy4y+1qZCp5bKgRM+n/3WhAptEyD/Zy+xqDG+blOv5MTGy3PPfPdbA6IOn96i3eWQflDaM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB7155.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(39850400004)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(5660300002)(6666004)(2906002)(52116002)(4744005)(86362001)(8676002)(1076003)(2616005)(26005)(66556008)(316002)(6916009)(66946007)(66476007)(6512007)(6486002)(8936002)(6506007)(478600001)(36756003)(38100700002)(83380400001)(38350700005)(44832011)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d+xf+axwAKRHgn5R4r9maaO5MawjWZoOyGcORfp273cQWfNltl4s1CyhxIaY?=
 =?us-ascii?Q?1b8/KRZpHS5ldyLbtuRiHkqvOOLDJuXDP35QPKgSrIvok/f2z61ERNlkOjXX?=
 =?us-ascii?Q?7ZD8GqICj+zeiNiE5GXu2mdsytRL4pzF8mn5iIc6xO88oFosHIA0BmWM9a2t?=
 =?us-ascii?Q?/9IFApckWIyqNFtRKkFSHTRqg29zffXHdPLrGIUj1bmtG6bt33IdhD98rDyU?=
 =?us-ascii?Q?kT9cxeuhgziFPhILbZaWdsPneY21Xvy97p3JsUkvQcup87QNrInV0vNwTOgM?=
 =?us-ascii?Q?GLRmP0AAyLa2pWeW5VyzN4YzDnF//r1Eclbf2G4MK2bTuFRKRfdT17Jt1qT6?=
 =?us-ascii?Q?j9cHdFhuULh+AjbzGQbL7T40lVEe3TRiclPaVlCivGduhQD0m2mrUgqogGVa?=
 =?us-ascii?Q?9RQybuxISxUaV4A3NujdHD7oSLpW/Yc3WsR6l/FOKPSfehueZeIvMugS8VqN?=
 =?us-ascii?Q?0BnCk8uwnvtQozdT+xFFLejc3MUlbhKJSF7brcNNFzM6BI6LHQ241S2C1+Yp?=
 =?us-ascii?Q?B5hyPkdjYcFE5zpoecY7UsQOMpSQ77l+8jdtMSjZ1CttEl/jAs3YVEJQYm5t?=
 =?us-ascii?Q?T/7QCUUregt2ApyA2KAB06wiJcldc6hZ8Ah83C3+8Qy3PAvXDdB3ZsnoW9YY?=
 =?us-ascii?Q?icS0AvYHyaBodoPGmEzhjuyFtH0pEKba4S9BT6b45QlwkvCaTqzebPAeFpAO?=
 =?us-ascii?Q?WBo77OFGNpxnxB7YkhLGOuX2bOT8ty8A5Z9tkkQJEHw/F8Y5xyVwWWy2l3/M?=
 =?us-ascii?Q?WkBkgSDFmNVW9jzRTRkmaoP22O8ickdArxc8YMw56aYwwvA93zbgz8tg3Byi?=
 =?us-ascii?Q?Yl2gIUOiR7nDg2M8nEL3J2mzBGCr2D/ydSEpbygl1pSIkC+/gocGWXuXmlaa?=
 =?us-ascii?Q?l44ykYQ8mnty+cb40cni1fxWUZKL5V/Vo82ntFQDNDUnwOHIk+lX9Gk9vVxv?=
 =?us-ascii?Q?emQ7CrTi4D9CAJFNZZrgJY/CqjXWp2ACoqpqkdLH7q7ceQ/o9kMT4/e4X4L9?=
 =?us-ascii?Q?YvMs0W/pZiBZcIImSTYfVUHT4jxa415FwwI5lwviQkCCW6YVHxYm9x/Tm7D9?=
 =?us-ascii?Q?BSZ8fJgA+pqlnVZ0jkOshnaKz2Ns3JdFb/xYoWAQqAmRst2Ww7AnadIPBGi7?=
 =?us-ascii?Q?j4lUbOT0o5NzGQ0jxo3RJqfv6+DmqDA05WyXonGa4Lr8OHeueVJzofFLcV91?=
 =?us-ascii?Q?F54K3t9IV61Lw+cQP8zoHjFB/iExt6WzYGf0CHGsba7sA1+M+vTEIoBowdRP?=
 =?us-ascii?Q?5jXJxDNLmHcwKl3LYR0UzFColRJkYUhckNCRPAqb7TtecVGAtjwuBMVk418m?=
 =?us-ascii?Q?O7TgRki7QpO4pg2h7cfhBWWl9tP1SbmMbvmZtKDSBEM5qJ6zcn8KJMcbRsPA?=
 =?us-ascii?Q?A+tJWm0K1h2MB1O6CEp1u2VgF2SuhOwpHuxUm03bD+YLDt5plrvjPyISMqDK?=
 =?us-ascii?Q?q+CEVsn5+U/62mIMFp1QTcACvbM6revIpMuwrsU8rKX48n6W9II56F1fTUz0?=
 =?us-ascii?Q?YiAGUHf11R3Aqi10n8pHaMpYvcrtAP+Eqdcd+eXVdojum3D3fdVZuEr4kSXi?=
 =?us-ascii?Q?9oL1GRplTKjVTQjiMT+wm43tmE3WQDL65GqETJMQuSZWA0GPOXhWFcX+tQjJ?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de244c10-194f-464f-8ffa-08dbf0bd2536
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB7155.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 09:25:36.9749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIarps2SX3Yo1Uo+Pv809I5YNuxwoRJjlL88V9wQbGyu44uoarKqlIY7Nv2HY2vhMjl4TqRFX80CRMYce1+LXzdzRp8eft9MBOGpdLDl/M0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
X-Proofpoint-GUID: tUSQmhVkrD4SKFHSoEMC2yOVa8toWYsi
X-Proofpoint-ORIG-GUID: tUSQmhVkrD4SKFHSoEMC2yOVa8toWYsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=737 clxscore=1011
 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311290069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 09:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107133

the repo of libbytesize doesn't have a branch named master. Change
the branch from master to main.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
index 0afe8a6c0..58ae52cc6 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "12b8e6bff611eecb0343ee8a765151e7d9d3547b"
-SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master;protocol=https"
+SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=main;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
 
-- 
2.25.1


