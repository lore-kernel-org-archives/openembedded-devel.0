Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C08FC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:43:52 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.43558.1669902222062068835
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=up43WBqk;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93349a59e9=alex.stewart@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1CBUs0011177;
	Thu, 1 Dec 2022 07:43:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=LiVYeubg7oYMpQQbHCP1tZ2m5LXW1rZS+Q7y92ae7VI=;
 b=up43WBqkFQN6gd+SK7DebLjDZalungOdTijs+yRGJR86s2xH4mMhQ4bb5L865+eRsi80
 rdss8im/GwuqPvlSxn9CpGfUaoY3HRISA6rGSWhoPsL321Qybbgpu6VJ+Q2jY4pz5Va/
 RzmNyCEQs1OcNQToZVAXoC9Ibfiz2jcHTmTHSdtQH2LxCEvkWOrMjv74GkGvHOTvpA+A
 qfN+mHD3b8HzkJs4y08wpWMxRdvJ1tdyAB0q+pg4fC5hfwQ3nJwl+susD33zKTB8kClq
 F5Qh6PkHpJEnqspIsXn2KIiUbuigtTuDVnq8jsvZt19G1GqEBds8gk8jyWMcvOqNC1qL 7w== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3m6k769274-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:43:41 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3Dg7VE3ONm0Sc4VUtU3mAxBlaId59R3KK0hPAABhxJfhzwDc/mSqByp1GagQhG34p7IZAw3vACS4GZulsjLcH0fk1QBLbIgGO5Z23yyWkioI3nrYBd2RYTZwokIljphYbGBCBwKpZ9JnKR8YbEPch7VRNVJIB2Lq/rTUZRpQdDPUYI6nEBylQ/0qasOnQ+EfUDXy5HfShmkCM9rdQL1Aps0ncgPpOyBUp1Ii1hgDKnVeT/07xpqpIybF3cuOn5m0UzQR+5gf9iQ5wTZxuBk9/zMWyTsvjn68hiHW31JuA5P16uKrauL/CHAP00ElcuBTRoAZiHyVH/mCcAf7VIIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiVYeubg7oYMpQQbHCP1tZ2m5LXW1rZS+Q7y92ae7VI=;
 b=TUvRUOGBir0867tNPjsxJbbfPK2n2hTwUIN8IrVo7ChHAMoHMA2Yrkdb5doWPuLCoJwxtiqe7MVa0ZmmbSNySZ5ROKN1sJQb5hTXYQ/Su7ZZkgKCRV6Xdeoue6KVnSHpACny1TUT0sUUvNf/TiuAoM9nzSJZ3hggvYlNtKJqFeAxQO8rNycMtVeiOfdj6uttRtycoWzuLNB4RnmpXHG/NfhTrxt4+oKcD2hsa2AWWn6oBQXsl6iuJPmKe3QFQ+ZUcdVT90yrIEexUUM/HWEN40tVicb/613YM3I3GiGh7u5OrnF3KNZx/ioL3Ii1Vcf1Tkz9pa3tg3Y7CVwallwpqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiVYeubg7oYMpQQbHCP1tZ2m5LXW1rZS+Q7y92ae7VI=;
 b=liAdlOSVeB8O5fXj5XccDICqeMdDUvYX2Msu0cmaxwLKmgZHw4ai9WviTO6MxjwAdA/yPfN/nCB6rg3pocHr/fH0yCee4VtxEHtMmdXfgqMEF/B3B/Y8qIUCWBUrn66BhmV+1naJmzZHbOhmaZda0vrS2yJbZBRlDQXiKR8Yt64=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by MN2PR04MB6925.namprd04.prod.outlook.com (2603:10b6:208:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 13:43:39 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:43:39 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com, Alex Stewart <alex.stewart@ni.com>
Subject: [oe][meta-gnome][PATCH 3/3] gvfs: use native ssh client
Date: Thu,  1 Dec 2022 07:41:48 -0600
Message-Id: <20221201134148.116754-4-alex.stewart@ni.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201134148.116754-1-alex.stewart@ni.com>
References: <20221201134148.116754-1-alex.stewart@ni.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:806:23::31) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|MN2PR04MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b03f4f-33dd-4eab-d249-08dad3a20d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jXc2Pk2OT0Q3ENZsfP8lNsjJGjBdwhNoNAxQi7Wn0bzox52xhfwbShyC4hfpfpoz/EFY9RL3YrwslYJ8bvb37LvAzpGg8nL4UkfrZ+mvZZivcmaCfq2lR9hqJqRzPGeIeIvwbQMehGAsrPu37UxmUNS1ekkuu1UqwRwRio4qiRf8IETeejvkpm67J7ZBtVfyWs+D3mzjIn9ZixKA+MmJDgnz7jGQ5oqQo5nHjou22aglUu69910677QKSL/vGz8z2GycAZmSrsfa9+08h7v2Xl9BHhTp9ROl96GUYdf7NBisCobBttGBssRJLkNs77fEkcbmIlE1L9g/U/ji1jzgTDDcu7at670q9on05YTNxuARYCAWPjbB+80wi6GMVH6Wn9qPJIemtrsxTugchCZosAQgkULA7Qs/BNkDOeHt4l5UeivoI15DRHRH1lknJ2Q+EWfCgYHHS/ubW8UMYMd+vbMccd0OCzjmWPSXFWUyYNVlKQgSigiMGIOHQkVhzZTUA56RNNEh2MxFx8mIqeSt5VBnq9NOUhAujwJgGljGNhx98OVom6jGT9mbT+SVs1i1VpNcG9wS3Mo+tZCIREOILhmL4lGN1YDn6UrrH3pgZ0RZw7LYRDlpMBWUm/Q0WKCEOkqBZHrbKE/iPaDSkcYu6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(6666004)(2906002)(36756003)(2616005)(86362001)(6486002)(478600001)(26005)(316002)(6506007)(66556008)(44832011)(4744005)(5660300002)(41300700001)(6916009)(4326008)(8676002)(66476007)(8936002)(66946007)(38100700002)(6512007)(186003)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qbX3MjCGThbBuTKBia5GWY2vgWFdBzGtdp7a396r6GisJFIaS7ODUoHHfPBc?=
 =?us-ascii?Q?TKeFY5ZuMbaKIsJHD6qXfqTFyY0Lq8a/SMaXX3N5LeuhY0S+faWwK7FlHhs8?=
 =?us-ascii?Q?l3v84JS0LuhsK2r/izBtc26KWEbKApGAxgCPtpGHPaEt/kGzcL2ImPHzTCJW?=
 =?us-ascii?Q?hxHhNUVCl7sPRI5TeKTenC/5qGUW79HbZOdHP6AXrPCYV/Zzb1IjJHhUuWZC?=
 =?us-ascii?Q?mkM5yEBPJKt2wX7kycPPIKajVpQWlTnV9AfGIKvP6fqkl9ed8Q/6QKAMKXWq?=
 =?us-ascii?Q?bWXuDbGrGaCGrytkHBhlFNhHF6gDywRHdP2XDVLIslLfFSAw/WWl8qtBirI0?=
 =?us-ascii?Q?ZS2lX5Yy2bC6jnJz4NyS8tSKcuQsQLDWpYlG537cymRYmEjdL9Kl84dzTn6Y?=
 =?us-ascii?Q?C+XSacTa53KQp6VXdlS1wXsvjdx9iYW0CloJ8wxh1p7xNDy2xQq3pFBFpuHY?=
 =?us-ascii?Q?DGcyn1PhDa2MI2yEvxFwlpn5kO3mnDnb0p7Xy0+YUnx9axRpcv8F5R22sAQZ?=
 =?us-ascii?Q?z8aKhgoECmba/kxzuhpGfDTiHMYDE43s9QaVk7VEzENRLkNeO6oJ8AE+qKG6?=
 =?us-ascii?Q?KlWfSB1J/KFyQo7pHMQkXtOD0i/KtNHnbfG8taQFz9bLMx0FC0XWGyPPqQB0?=
 =?us-ascii?Q?nN3T5sSHr6v1hakoYmeCmDqtL+YA9qd7h/3fN+I0zmVpOYSBfEpxLKLY6T5Y?=
 =?us-ascii?Q?yRkTZchOADN6Zek6Ixqn+z61cyKKw0PQkYV9nE9LSU4A2v15aL/vC0JrrZy/?=
 =?us-ascii?Q?9pNro3JVB4St7StMBlCCMUD63J1hT00Z0S72MdMI9BgRDCZlDUUE1csb9zQ2?=
 =?us-ascii?Q?RPkA+StFZohseUO302fhA5Z4teCvR997kZ8xuWI9X7YewrlR3zt/SDu6XJaz?=
 =?us-ascii?Q?oebJqNcDT5FcA0PzUP4I07mHuByHIwJIpLBnbtWnA6c6Hs1RrJTh96WJ9FR2?=
 =?us-ascii?Q?XAMN0zrZTy8o+elUbcRQMmhYbS2CAlCFtadfTp31ftkFJCm07DA0E6Y5VRIj?=
 =?us-ascii?Q?oqxCt0439E2BofLz0XSrKuqBDdNrDe6Z52ohJtN+qk1ietlFg5XVK7uG8Yqw?=
 =?us-ascii?Q?zZpYJF8nR87rh5wReqp6laCmrGEdVum9xVWkpm+Er+43FAGIBE/jaNAr6AUC?=
 =?us-ascii?Q?nP4vB3ZJhy9vI208P1WWjRTbvYeoTCBs65g69CrNbmEy0OjOH3WegHjfN3lr?=
 =?us-ascii?Q?0axxO9JwgIZLufYQ4kIOh1ZUHC2KlN7VgcghT0my14AktYDV8ZdUdMJ65WX1?=
 =?us-ascii?Q?4BJrXAcm8v/rjEiCz8NleeBTQzig/naQ1KB6CWTYbcY+/sMfcaeYSRmFdpPd?=
 =?us-ascii?Q?Z4fkqgBW/GDCOlocL8ZrLO6+ccjWHlW9tkYuhGsDASW11AgJpEGHZlX/NpKZ?=
 =?us-ascii?Q?Xxr2PJ0BMHh20o5pwIEFIWY9h70klCbyNgUpftMSXfabaEzhczZtQ1bPN58p?=
 =?us-ascii?Q?IkSahE8Bx3a6Lf8qpHOF9Bu5YtyKmjd60juzJPjjU6Zr7KlQcq2M2aHYb+5n?=
 =?us-ascii?Q?SnO3heaxmNqXd5ANCFcg5qR4gpJqOV3pUf5kdYDUqImmTFGKFHopN0bNMSt7?=
 =?us-ascii?Q?cclW1KZR8rsyJyZdnFfubpmTQR93dgLaz8JhQM1p?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b03f4f-33dd-4eab-d249-08dad3a20d8b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 13:43:39.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7p9TPoJJRiQLVKdJjjF9pdiL3yyg6Ug2cXJCcx5fiL8DrOoQ16AbhslOI89cC9tMeCdZo05yzfAyQL6Ds4FqpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6925
X-Proofpoint-GUID: sPTeAHb-EwMtQI0l79a4_gt4QSjermXO
X-Proofpoint-ORIG-GUID: sPTeAHb-EwMtQI0l79a4_gt4QSjermXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=947 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212010099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 13:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99888

When the `sftp` option is enabled in gvfs, meson tries to find a valid
`ssh` binary in the build host's PATH during do_configure. If a -native
implementation is not found, meson will try to satisfy the binary using
the build machine's hosttools directly - which is generally undesirable.

DEPEND on openssh-native, so that an ssh client implementation is always
in the PATH during configuration.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index 4c251d2f4..9e29afd48 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -12,6 +12,7 @@ DEPENDS += "\
     gsettings-desktop-schemas \
     libgudev \
     libsecret \
+    openssh-native \
     shadow-native \
 "
 
-- 
2.38.1


