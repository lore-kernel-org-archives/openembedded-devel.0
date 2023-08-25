Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FB5C71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:50:04 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.139])
 by mx.groups.io with SMTP id smtpd.web10.9320.1692953401511744747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=KXEhamfl;
 spf=pass (domain: prevas.dk, ip: 40.107.247.139, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkSUM9d8LbKDw5tQaRBl4bfLr/xtSQd1H8T8sQqowHnvBv9jXRpkkwgqBWZqlsJIkmNhBhapiUDzSv9gsb6xC4nL2anazpXztbAcDwc++RF+x3pVfZJrunw0USexHd8gquH6pJJ0TvKBgG/+huSxztldDF0SXzwD0UVdCRmV8vRzvoH5AT1K2/V+CacjEax7G3ZVoasBl/nAxXIXdmWDW4hnV1DzBn0bCMNEvbslEByg7LeBDvPnglM5AL9zAWZViSvv/RBldzKSvJPJTMZSQm6e5KHzvtivsY7qSZh54/Rm8CHHSX+bho9AHcEtGA9JHtvHh2FVmr8bFKv3b+kpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOSUcxNzG0k2IuRn3laGGOB+465hBZZllVM9RcA/UVY=;
 b=E2wZj1DSK+I6+GRFQaXwCR1KOrmVx/TEh7omd4uynSdcJQctmtGb52wRCvEoKi/Px3o3jnWpWJPssIBc5LV0CKpIH7KmS5DhD3z5s+2v6SMhyln2B3TDV/ormDyMMRxG4EiyaIEQ5bGBiPq2j28S0DazJOqWirqps1iJpiXxbc1A712dJsI0sxMA4ELvWlIHo7j1PEHqPLB+JU8w9U2IQpKX6I+burwSmB1z1Xt6VwMfg0EX4CKuPjG0KEhwzXlQ13ZMC9z0R398uFB1ynYtVaJFBFb2EsSKiz9zC/1y6iVgqrSATcmlUyUtO7rYCsppjgr9Ly3QDZCGz1sqVuUS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOSUcxNzG0k2IuRn3laGGOB+465hBZZllVM9RcA/UVY=;
 b=KXEhamfl0eVU92wuLOL5Iql7YDgOysuY/wKaBaw8HjCCjMNdFBQznaIRGDL46dzwlkZzC9NJIWyfJZPeIOOb4dbTB0yvBJxBd7LtGwhtUefD1n7+C+X0TstwSkZKpi4VmmaG6KerPv2IR494w4GSK9RQcsKhxDdkDq6smEDAlX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10a::24)
 by DB9PR10MB8286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:50:02 +0000
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126]) by PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126%7]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 08:50:02 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [meta-oe][PATCH 3/3] snappy: add CVE_PRODUCT
Date: Fri, 25 Aug 2023 10:49:49 +0200
Message-ID: <20230825084949.18322-4-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825084949.18322-1-emkan@prevas.dk>
References: <20230825084949.18322-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0078.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::13) To PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:10a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB4576:EE_|DB9PR10MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e82d25-80cf-4fda-41db-08dba548455b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m4kfiinfcLHznYfBPk/XtqUlhrFrloF5gAr+beQg9uWd+I0OB9j7PPjPutb9Q8KGiG5nv4ce7CMnQF4A/h5P6l9u/KjCVqEOQMcv7ilc6yRJLRf80sNHCEKRekJsGyqLiiD5N5X2an9A3b+JQ8c0QOj1z35fD8/bot5Gu2hz46Gd9Q9NBmhalyr74Cqq2HZ0YJKOr1IJ5soE1xlpXycIATPj644sg/D30iJ2otNOlcoMOjcJ7fDuem8bnuDhSFOAp/oSoWW2sJsFqnobVK/Y3Z/Vq2/AmRkm/zT92vbpiG3HHZwXGIBbl4aID78WAkaswb3j9HvgsJp5cKOU4W5kWPrv8JXHnXBcDMckU7faMR2ElR+eCs28PVy3pWMfS1ZYgCDbS3+TAdPkgDlvkhLVMN02qwV1FOfAMBXIDkEY4PRPC05phbtCjV5GYjHed4pKFL1gFDhkPBXDANmxUGK4pTDtu+W3Idda1yYtLt/IfymRg958VPlj8ip3duYzNtZ2DUltXSudVlfmxpHXMdKm4wzTQeBuTXrVvlPtRk2Ibqr6peSia16MVOh/pp2GLcTJ7a2ewNqNV3x9YJ26ch2XB+JWdo1DCj5YZbP3X2wW+v4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39850400004)(396003)(136003)(366004)(1800799009)(186009)(451199024)(1076003)(2616005)(5660300002)(107886003)(8976002)(4326008)(8676002)(8936002)(36756003)(4744005)(26005)(38350700002)(38100700002)(6666004)(6916009)(66556008)(66946007)(66476007)(6506007)(316002)(478600001)(966005)(6512007)(41300700001)(52116002)(2906002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nQRnMN904NaWwrwtATT+peBOddygEy3uCD1vAGubBysN6rXcTHsTQU1o9RC+?=
 =?us-ascii?Q?PHoDWol7n8jkQjiJtVhCB0FcE4iPKN+c4Do4K5kYdhDDy0K8K9zx/ZUdQHQY?=
 =?us-ascii?Q?wxx9TxUG0D39aA9muCBfVE6Q8Xxpz3DM5v8S6ZkcPIO2LLxPGobl5TdM+AYQ?=
 =?us-ascii?Q?B59DKQ7asImNvVaFVQZLqh+R0R2QBgfQB/E4Xe6dc/wCtMQIlNiaTY014fpo?=
 =?us-ascii?Q?t9aankk/NpXT81htFcbHrx6fi7cpINgzLwWYNEN867FrWCg8/p02mR1BIq+L?=
 =?us-ascii?Q?0v0wIcZxYJ2c0WveaGIyXt/WR0ZcKSCSRHJHSc+/beqLa7X6326EeIBDoThD?=
 =?us-ascii?Q?L9v3ICL8jU1F2qPEg0HoB3GYH9c8BGmlddTnGUyI2kq/9WvWZqLNapqymMrV?=
 =?us-ascii?Q?iWwsrTmt3lGh8udiJN/Y2UaZ8jvi9T95YHyUDUtUUsDfn6Uoic9MsIlxnoiA?=
 =?us-ascii?Q?8rwQzFY7PbUpK4kUArW8sHG5PdtIntpUxLxrhMFzCCpk6sBq+dnpdrL9mZl7?=
 =?us-ascii?Q?2OQx4/Yc/AdxAysJyvuOzcPJ5OLoYl3JNdFv/jINlAY0KbSyOuoyyPDR2/eD?=
 =?us-ascii?Q?9BvyyBjQmAzsMhAEI2JMGlKWjySjCTVzn9JznkzEM9EDscB/vJm8RLV6zHdW?=
 =?us-ascii?Q?3aeuDEnD1/+0GkSUJuqeT5TGMj2d7SbTlJdZ+zF/dwFgClBq+wNQ/r8Yjscu?=
 =?us-ascii?Q?JMMyJSN3l2dnPm1J+B0uV/4Vowdy3npduhrpjFrr4oGy+oTxaZ6fC9IflmYE?=
 =?us-ascii?Q?XTDuUhi+cbfGzgC+tNLkL1eZZqDT81ObKOqLy4AV83oyJ+C0wUyH62GInPE1?=
 =?us-ascii?Q?zADrw4xOg9WpC/7OhvUjekpsMqOSXVRALBqIdmSXRPNz5A+SkQ7BYkCanIZz?=
 =?us-ascii?Q?2NZZiIs9h6kSitMz15ploujlWmcpwkagMMG8L+D5PzXTkf4YzyqaSOYcHEZN?=
 =?us-ascii?Q?wMv4a49eYCqtwRm76ROCqRVTYBvJU666Rx2dzvgGX71FbeyFp1iKSyNOP4NQ?=
 =?us-ascii?Q?gO4U+6ePK/g6w5pKNXBhOwTATQ+EqFF6tyGMyeZKZx5ysG6SG1Rj0anx+HXh?=
 =?us-ascii?Q?A1CkpA1U4vutbcBolRBQrkUDpm3gqFlVoXx65+WXniC8tFxauUTlTiHRHN59?=
 =?us-ascii?Q?FpXYdk+kiRd/H4L2QxlihynyuqK1b4k3x2JQ4mrcL9ip9KiDZkBHo9ZKb/BS?=
 =?us-ascii?Q?K+a9VMM1YQ1Kk9nbAXH9UZj8NRzmRsZIaZDy35Esc6PFBKANlyNy3O63dTmJ?=
 =?us-ascii?Q?LYtl+aC02XC13+5wFXz0Bm52nK4zoZM9/lXrwTOurtA6fsTD0FMgf31zYYCr?=
 =?us-ascii?Q?i7NGuOsWyyOCP2nA4r4aQ/liR7q2vwoe9syaY6ZSgWMxpqSwSfNYlIuSspw4?=
 =?us-ascii?Q?2qPhY/PQ+4OOc66iawy5UUMHAJw390XfwyTDbMxrRt5MSyfiHOUzEOXqglBU?=
 =?us-ascii?Q?FKi0t+I22qrVVn1D52QM3o+CTuO3GYnLDHJ5yIr049SCPDAOHTsPjsVtrZZ7?=
 =?us-ascii?Q?3cFVQ2yhZVoqMKh3Thl5i0hunckZ5CnFZ5r/QC39gw9zNxDVIKZ/3Ivwk03Q?=
 =?us-ascii?Q?aupFBy2lwTUuT4TOm+i9VTze21P48/FO7Eos9YCXQCagZR9iWi3fRAvG+uS9?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e82d25-80cf-4fda-41db-08dba548455b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:50:02.4502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0mg1I0qrbwuM/ignc7IVIpBI+0AZ7NzMXJ+u82ndAs/BXM+dpDmHPkzQAbv1iG+jQSdUdgfOQTyaQOUDjNYhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8286
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104606

If CVE_PRODUCT is not explicitly set to google:snappy, CVEs are
found for https://github.com/KnpLabs/snappy instead.

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/reci=
pes-extended/snappy/snappy_1.1.9.bb
index 0d58345d7..9e0e43ce8 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
@@ -24,3 +24,5 @@ PACKAGECONFIG[lzo] =3D "-DHAVE_LIBLZO2=3D1,-DHAVE_LIBLZO2=
=3D0,lzo,"
 TARGET_CFLAGS +=3D "-fPIC"
=20
 EXTRA_OECMAKE +=3D '-DBUILD_SHARED_LIBS=3D"ON" -DSNAPPY_BUILD_TESTS=3D"OFF=
" -DSNAPPY_BUILD_BENCHMARKS=3D"OFF"'
+
+CVE_PRODUCT =3D "google:snappy"
--=20
2.41.0


