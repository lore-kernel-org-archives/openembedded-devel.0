Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.87])
 by mx.groups.io with SMTP id smtpd.web12.6055.1611624604453716808
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 17:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i36Qoz3l;
 spf=pass (domain: windriver.com, ip: 40.107.100.87, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLY/d3Cy/sGY7F70BQqkAil+/2MH3Q+nd4/op4cjkswGpNZFoRLE+DqndpmLe8QpOtDT2b9OW6dvvBaHwvFSXWkev9W7LwyIFtURl/8aMp4fbKd4JYCFK/slDuYJolcY/0usdVIB4zo0s3nn1yvE0zvH7+/knz/Pl8AIVjx7MA4mErZRPeB8xfv+98qDsnQZH9K/PCBF2UeayFQOnKV2Sm7oeUHFdcOjaciTEvv8tAwEaggudECa92a0lIBM3OyoND9dnjbzMI8LEfsvJxCi88YEAQEJjO5swMUcQe9/oOWoJo/iOJh2NDrTtK0ZxcBZKmzftwZ4RYSXyfUlw7i4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRpnLIXLqiCNbej9QwpV9c3jZkZWcPTXUPLN9iq9Sfg=;
 b=dIYxMV8Dr6TLzGI9O79WJoWZWKYPc7sKMNHHpWquhfvIK1EABjE57F+vNUGDCa+u5we5HjC03IVlVhprWHYVaHwykRaIyV8GGZD962qFv6Cst9pnU3aX2EO45h/ADhmrtu8akriSOljAuOCKFdLRPcyFWcMi+jbni4WvJi5hg7cJbD75RuvA4/oPu/9xsXPxZXMJkf4UPeIDh6QfqrL14ZRv69kNDvOA7pEgBbE0KdpfBg7P3TtaKCdzFZemZmQZ4T6pCXgoeZfMJRAOiuzOBmE1KPgXjviLCpJbCrOQGO1QJWMimBii7OI8kJetVDJ8ZPvqi5a3I8XOJu6z+2dKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRpnLIXLqiCNbej9QwpV9c3jZkZWcPTXUPLN9iq9Sfg=;
 b=i36Qoz3lIvPNCjMcBoHHGEm41+nAQOzH/vNSgVj6pomaE43wJ8PTU7fB5Pa34d8k4ys0gxwulXo4Xt6fvjvdMlKy42tO/FZms+c6SzGmJ/Wp7CXdEuUYltqcCqcz6vPyKlC/esnb6Dj2OpG1NHzWP6tGmcVFOvY4mxBQqX7nWcw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3687.namprd11.prod.outlook.com (2603:10b6:a03:ff::26)
 by BYAPR11MB2933.namprd11.prod.outlook.com (2603:10b6:a03:90::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 01:30:03 +0000
Received: from BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28]) by BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28%5]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 01:30:03 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mariadb: add package config zstd
Date: Tue, 26 Jan 2021 09:29:42 +0800
Message-Id: <20210126012942.7784-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To BYAPR11MB3687.namprd11.prod.outlook.com
 (2603:10b6:a03:ff::26)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 01:30:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f483777e-600e-4abb-c366-08d8c199e6ef
X-MS-TrafficTypeDiagnostic: BYAPR11MB2933:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2933C9B8087B9AAEDA8DA5B195BC9@BYAPR11MB2933.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yiLLFcv+9TwsQPFhbFwQVshlzxOvq05SRrUZoKqA3sxlOPhk0c87YSLFbNxnCSIlbPpo2jY4yz8i3oAkBBelsQ4eRc3LRm4NayqkKXN2GonDwI++pVVYvic4kvzXZYvbMtbDBtgJDXbq5RIxUYyN13cPDfZCBMYsSlvxk4JAFm4GFuuRBCEUdW6CJXL1Yv2QFVY2ljBtTZo8WfCaHNbMGZK3B8Ar2Uqpt3pdSPwXpjgyMfpJYyOxxxSk4d7DeziLwtM/fQpxST3cBOJ23dJ7QE0eu3ar1331AurVSB5hXjANxU/aHXk+HdnPOWHw3XyzF0uVs00td1LZvvmIaOG6AMJZh7zQUHXio3eHBcl1US8E2oVq6IBImoythuwamnrXtB2o7QMHzoA90uXc6DVMKkRiBAiGxw5GF9UHi7buoKk1gIFt93FmvBW4FJPuCMPW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(16526019)(2616005)(8936002)(26005)(66476007)(9686003)(8676002)(186003)(6666004)(6506007)(66946007)(36756003)(6512007)(6486002)(5660300002)(478600001)(52116002)(966005)(956004)(66556008)(1076003)(86362001)(6916009)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?hSadnnJTCe68PZBWaEjezLUYmzmmLLB56H8SlViUY/Uf4WGbZzDKExFLyKYi?=
 =?us-ascii?Q?2emOt5q45xeXWalJp5kRBvN2VXLR24gO5aEgiUppRk7Yr32kea3pIYFX0ztf?=
 =?us-ascii?Q?uG8TP0mrQmxnhcwquw6ar0E+ZGOBvwyDN8T6KCX2rI+UykI/ydo1G4cGKHYY?=
 =?us-ascii?Q?1DVazoGsfJLIjE1vwyZ2Njhk8dUgwZf7ZRNR1FslYFgaAamPoO8l/gTruoe2?=
 =?us-ascii?Q?vFaMw7uOfWxFD9ZWGGG7bAHBZ7+CCev3A4xB3iOzV4S6glj6uOTUADSO5w0k?=
 =?us-ascii?Q?bE0pevBjQeCCTVZwQiZixZ9UIE9UMdwElUHinLMJwdPfydYXYGU2pnQ8qJDy?=
 =?us-ascii?Q?HLMrKepXbEkbxqn6iTc8UkHzFzcvuxkufz/zpNWos45MFtIbGd2jvj8CcOcu?=
 =?us-ascii?Q?WHfgtuZ+CvG4pfMbsysHB+FCPtL2o70Rp0TVEh0B8EYmISGADqmnaxpY+gzi?=
 =?us-ascii?Q?YgUomy/ypsbw0B1RL0QWftJnMWcN+WRITETRagApG66Azg45F+r8BjDkX2tp?=
 =?us-ascii?Q?oZia/h3xICMgWkMY855ElxopVSJag+iLg0Ifjnz0KGdHKePLxG0Cp0ebeaxy?=
 =?us-ascii?Q?HrZDyg3EcDZcOMiieT9XRfiZ2VOc0uURiFvon5ZsOQYU/etOv18ydD6Lu6cE?=
 =?us-ascii?Q?UJW42rejyqlnhZaRizuwM+sAkiMk77BFWY8tMlfCFZIdBHEI8bFMGDh2H9ou?=
 =?us-ascii?Q?X0ziUgEuclWZ5V5NApnJrLFFdbR9V9AiH/gGHHPmaHlaUp29En70ORgq+sXo?=
 =?us-ascii?Q?rss5KqaZyhWfBND98n8JeQescJ/z2FwMW4SXHJnaF2p3Ub23RB1psoik2Fi3?=
 =?us-ascii?Q?Q9PtbeblPKsIzOgIf0IgzCX1TKi0to+TySjb/f4SNOw/+RHkEFRURWaurbG8?=
 =?us-ascii?Q?txEP+RVDZSR2W0tKxlsjvIi6s+9dwcRVsDfpnKbGtoVZdwUmcplVh+u8PFh/?=
 =?us-ascii?Q?OzocnCVCFVflqEPBWQORyaE93RDzvg2sA8AhHWXsfx3F9JciDrLyrQ/87Hs4?=
 =?us-ascii?Q?Z48O3ETV4dn/yeOGJldzWd72jwODGSNQAh6cN2i2pm/1FIo24C+LDWGwB9E4?=
 =?us-ascii?Q?mm/A1Biz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f483777e-600e-4abb-c366-08d8c199e6ef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 01:30:02.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hzUwbgApcEUTT6s+e3Upea7TIcJQ+/3q8sI1IE9Iv1dqNw2SIr9JRcrAOzYl+L94pWRg2uDVewbqpjIZAOxxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2933
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add package config zstd to fix file-rdeps issue when ccache is enabled:

| ERROR: mariadb-10.5.6-r0 do_package_qa: QA Issue:
|  /usr/lib64/plugin/ha_rocksdb.so contained in package mariadb-server
|  requires libzstd.so.1() (64bit), but no providers found in
|  RDEPENDS_mariadb-server? [file-rdeps]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index e3ce29761..f6c32270b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -62,6 +62,7 @@ PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[krb5] = ", ,krb5"
 PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
+PACKAGECONFIG[zstd] = "-DWITH_ROCKSDB_ZSTD=ON,-DWITH_ROCKSDB_ZSTD=OFF,zstd"
 
 # MariaDB doesn't link properly with gold
 # https://mariadb.atlassian.net/browse/MDEV-5982
-- 
2.17.1

