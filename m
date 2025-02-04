Return-Path: <ethan.roderick@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4F7C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 23:00:50 +0000 (UTC)
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
 by mx.groups.io with SMTP id smtpd.web11.727.1738710040785422996
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 15:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=bhnVqKpA;
 spf=pass (domain: digi.com, ip: 209.222.82.221, mailfrom: ethan.roderick@digi.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168]) by mx-outbound19-169.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 04 Feb 2025 23:00:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8VpU4BPQe1HcUl4biybDBG/b4fNlImcALRhJgYA8d3V8HyM98QV8uY8WtqvoVGmeuxG3qV/5CTFwGfRpWNpLCN0nY4kMlfauwUvInB08gAa/rWZwQiMR7qeojXTzsdlU78EGJVzl2WoPe/k460RPTE7IU2qbSM2CGJJCSGauskbASN0t3GKn4qQfvzdHVnJO+A353LtbYhGCNIg0seX1896oogNkNvt7R3wnXF0P0eIXxycRBdsShNgdGAdeDzM47xxOKh0IdOxeeGShukYaUzWQsBLhWligyCq+hWMDb7yYY1PLQo1Fad7tyrAWZvoaV4h1O/xdhbNN+rRXxyD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPeFcHIvC1MERrh4InqY/kOFJ6bhprojd2GDLPfZgWA=;
 b=d8BBg+XiapqybIsoO74anBmKol+vnM6Xmhn5H402hf2lFeSa8mPPewwC314QtjbfB6YEPrJ8Zpiq8fNMz6Ju8zxJfjUJ83h7+AHzWPF1XE9M+tXv9w8A9eXMeZ2MVCHI4lLNvuH8Ttq+McS/zIlb05OOLd6MXlLmRDmWROddKIrJgnJOZS7xyPBnZY6pqYvsDpCa57c6SP5xOmtPIwQKqXiyYQvWezmwxBSbNysatZ5tYq+devqaMZz9eniMQSRROlKWfKfrtRp8CcnzHWaugmTqlpLBgXG/TwHVCapFfpjWWkVjywgWs4tk5lyaCeYrCtwayffb1/hTe4TBsC1W3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPeFcHIvC1MERrh4InqY/kOFJ6bhprojd2GDLPfZgWA=;
 b=bhnVqKpA9+D5kppgl5YIXCalyy4WieEzwxfPswnc4zuJwiPPaOKV4Ck/2gfSiOkWUAgE9HF/BZHUwCqo9y+EmZrwI/6v0JqtWqvjVi5lPj+7sXKKrsMNxJ2fqzZiT8oPmnubaqG3mwq5FKCxaF++uqzfacKm/2cxrxQectVJtnjReGRbS1oHA4YdWdI+lAbIH9xljcunv6sCecIO7dyU4pZUQ105i3Yg6t2nUFEF1AtjB1tT42mNccG+WbXc+okEJcp6y4d9DVpHZLNbRdochvbphTfr8Ijq21Cd0iOGmV1uWSp7fBGR8tcKUL1IZbQAuxzvyFBgEInmc8Y83YnSHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CYYPR10MB7675.namprd10.prod.outlook.com (2603:10b6:930:b8::15)
 by SJ2PR10MB7109.namprd10.prod.outlook.com (2603:10b6:a03:4cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Tue, 4 Feb
 2025 23:00:34 +0000
Received: from CYYPR10MB7675.namprd10.prod.outlook.com
 ([fe80::3d3b:4f4f:a1b4:a554]) by CYYPR10MB7675.namprd10.prod.outlook.com
 ([fe80::3d3b:4f4f:a1b4:a554%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 23:00:34 +0000
From: Ethan Roderick <Ethan.Roderick@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ethan Roderick <Ethan.Roderick@digi.com>
Subject: [meta-oe][PATCH] openldap: make license match spdx identifier
Date: Wed,  5 Feb 2025 09:00:02 +1000
Message-Id: <20250204230002.3105142-1-Ethan.Roderick@digi.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8PR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::24) To CYYPR10MB7675.namprd10.prod.outlook.com
 (2603:10b6:930:b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR10MB7675:EE_|SJ2PR10MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: d53f8409-0e9c-4443-6a10-08dd456fbafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+Y2AU90Zg6FWtplajfmGQtMQBLxdaUVT0MUwfhvcXwq1PR4sLepBFp9tpMnt?=
 =?us-ascii?Q?7n2mi7wJBIM88GYtB0x48FT9KjmR1QNVsnqup9dXU3pe1cwSKpRVq9dNdaPs?=
 =?us-ascii?Q?C98dVdrW2gY3+FfdutP7qHGvmqCd65NN/Yk74bodC11NkBpYYKvFNwl0Kvm2?=
 =?us-ascii?Q?Mu185t3Zz8yDdtLVKXYycd6HVfDmVzYF3Zcbn65yxSC6osKFJLKuek3EJjAO?=
 =?us-ascii?Q?Df+d/VDp3DU94xbSL/jAFkJyiZF2UCjLEObv0iyOuokNuuJc6xo1tLeJ9quR?=
 =?us-ascii?Q?32v/a/3gZQ8w1k2s0DgcDlBiaHiH38S1E4TLOMB+EyLz7cx7mbWA7dQ78zoo?=
 =?us-ascii?Q?lUsQZoxYd20IBEeDvn4bH1HnxwhW/WWi5KTkaAVskANY3iYo3Rn0+Atu85n3?=
 =?us-ascii?Q?4V80PssRM+VD1/baKl3DhhYWyekiISVqqOo9APWq32OMuLkmbJT864jrILGP?=
 =?us-ascii?Q?+w9CmEe8qi1s3Sd1bQjH8w5xruomIbYkY7HP6mBt2ea1WaIvlNuwQBzfuEcu?=
 =?us-ascii?Q?DXlg/+VcL+MeMIrTx+0NDe1pDLclOCfrZJA3VWG7rlKCTWY5o9C28I6wsJgX?=
 =?us-ascii?Q?bIfE7m5x9j/GbBmEDkiHhJkYtGjdTQtteCPdIHWN0PCYj1GmUME5Ie3vR2KX?=
 =?us-ascii?Q?U8EbDEtSsy/yS0OGVbCEz2g8zc4IktecMMAMWRO56IunxAtQm7/hAQeD+Q64?=
 =?us-ascii?Q?4LUI8cLQwIdWpWPlDUzCMpBTDnStR4t06wtDOqlRVUY/2ZGA/aC16+VtBhZR?=
 =?us-ascii?Q?1JvygjoBoU5Gil6PHzoxvoZzZwaxR/aASV+95M7BKKu23l9kR8pEXc+hpfcI?=
 =?us-ascii?Q?bDMJIYlxS0ElyQRBINbraXsG838gKe/6w9Tc6HNjp6NH5dI4yXrsiwr8xC+h?=
 =?us-ascii?Q?ZBpHuhsR2bya/DOUWpZL0kJ4+X2geVXPxlNAxN/zQVs9QJA4PVMBnKdv5v4f?=
 =?us-ascii?Q?0gsQsGovt1sx3zKKvvabUYm96JsI5A5WNAznctN380qa8hjpg40fpKwec3FA?=
 =?us-ascii?Q?t4r9nYBuFZSrDT8lxORAK7d1MrJECPDDB7t4aYVJq01CDZQCvYG6qhx7l1xB?=
 =?us-ascii?Q?ybDxd2TV8s+DHaJP9nAQp9fsfi3W8ySCF4yZE6iuOqPFhtmpY1hYf7oTJ/Lb?=
 =?us-ascii?Q?MtuRdJJGJgxspMIT2KjGuCEpyGgXJ+9+wUMv0HrV+8sA63L3fxaDi2vuSsp1?=
 =?us-ascii?Q?o56YVLnHK0X/jRggFjqKQBNPmXMYzt/g6SHw52Bh/QSypch9rHa4rCLHmvVw?=
 =?us-ascii?Q?/q+b3+MN6OirdkH0mUOY573nDnbTJ8pmgx6aYteLo88ucfuPrno/qMYDYsZr?=
 =?us-ascii?Q?3iTy2r1yFkwIyR3KBOEVrL5DTjV0rnMcZvtpMwmK9Yxh3jm+ZAFSTHvP0HUB?=
 =?us-ascii?Q?3SKUGufh1VQrXkis5w7KVUNU/9A1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR10MB7675.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A3FAitxTyye7FO5Wz/IyL3Z9ESuUCK7TNzqxLgFMkX6tNpsB4YWpCf4mimTj?=
 =?us-ascii?Q?6wXi1/YDl2XimwC1qGmxw8n+tVdYV3XhTs741mWid3S8al2dR6mHZtbSfa4F?=
 =?us-ascii?Q?pvTZ+O7yLxAh1XGa6b8hvVtyWmTfWbIc2zzgK4vD1nZ1pJuIO84c+R8an5+P?=
 =?us-ascii?Q?qS8AfHY0NhzBeyWIDU8vApPMvXdYqdXsLa+VHbORrLIDd6/0pkn06iKSIhjn?=
 =?us-ascii?Q?tzLpp+sdmzoQ8B1w6wsUpQbrpnRAa9dhuNgB6fv6O6/5Verl+gQlt6w7mX4k?=
 =?us-ascii?Q?B02J0gw5SbTm8PSD5fyNFW4U5quXW/UT/igH2cYcqqnLvF6a8Kjli55iR1SQ?=
 =?us-ascii?Q?Rg2drrNCNr1bu9cvJLf7BmkZKjGqyMCdkQ9oMoNRR9IQVvnKZIzQCCY7ZrEt?=
 =?us-ascii?Q?UgMU2+P1n+4ROQW1b85/eRFoIZM180BrLSTItbb9+bZ/c/OKeHSnXVu/Q7Wj?=
 =?us-ascii?Q?Et97ih8852piHwbFIrWXfH3L/SCqmIGfpesTUAj0gYULjntucJBBMXq0Jf88?=
 =?us-ascii?Q?hdeEBT9Yfm6i9/snz/nVfR4Fes5cQJJimI8TF3j3IWL1IWAffdhfQeh9pV9A?=
 =?us-ascii?Q?6NK+7wgRlSlv88aQ2hpA+9LZP/AXLb/4gGAQQC1JxD678DKICK0U3tRMzxbf?=
 =?us-ascii?Q?ym0E8k+ntBbRyy1Rxj5Eattn3y4cLB+/LiHRfkYxa01ay+LoI3XE7tGdELpC?=
 =?us-ascii?Q?RiY7siAkY060+OIqUQcbpl/gfu5vZxN1fLjPjmQ8gNr6ml+Ppul/FtQjwD8K?=
 =?us-ascii?Q?/t702TLz8H++Y/XbDmpAQuAMrWbUKr6mOPDKQITtameHgTui18DS4690YIOZ?=
 =?us-ascii?Q?lcP9FzK8/p2GbdYAHugqUEwjVxymoVShMiGKsFd8wgKxh0wMsyam4oilh4Im?=
 =?us-ascii?Q?DYqdXlnRWQCuJEp/4O3dCFm6XCd1TffKsxt0ZjGpeJmo+q1RyE22vCEg8JrA?=
 =?us-ascii?Q?iVr8alIJzOgjKCmIAckz0NehgEDRBzXJd0VWVDo5G3MKSer3ORqy6X4ik/J3?=
 =?us-ascii?Q?9N046IreaUFECLJnnegvEi0pOpavnEiQ+agw5NLs7hK9Faj4wgxwvtwRBGLD?=
 =?us-ascii?Q?MXyxjVja3NDsbdDiKqfejRlNVykGQF96gmYpGpDt4JvFzq5vsdEJqsUyN+t7?=
 =?us-ascii?Q?tZLCSoUNcmyNrjvgg/VEeIB0s1NNthcBTDjQDjpePbbrjFqIDsBpGihYSBFa?=
 =?us-ascii?Q?CG3gvNbN0nFZf9Q7of0v6kSUrgbKedPFCXXiTSlPFdYh1pcCW+YqNo2hJqcs?=
 =?us-ascii?Q?TfEVdtHkVmV0RCDi5NGVSFn0qqCLCho9FYdhSiUh/Jk2dTzIQ2uBboYCJSKw?=
 =?us-ascii?Q?QU/VDBdSzGZcYICTCw7JfCbWaotAEnT8X76/4MddI1bKQ9bHOSIRU/K/JSQ/?=
 =?us-ascii?Q?LJktRIYMNgZtuiSCkkoowZE0bspArDTlJdTRAGFeXG9O4XK63Bg7ZfxBMWMA?=
 =?us-ascii?Q?t+Fjc50Ikfb4sv/hjT8EjVw3dG6B1PZZyFK4mJ0eQsaHTs1PBsGOiLTNiyiz?=
 =?us-ascii?Q?eqVLcsrK5TN/ihtKfmx3LbqokYKXxlwStSNgQbe5rQniSp7kSTDb5vPBmMln?=
 =?us-ascii?Q?W2g32NtaJVcWZwFIUVwEXLdpyVKbov8mv2yjWKn+?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53f8409-0e9c-4443-6a10-08dd456fbafa
X-MS-Exchange-CrossTenant-AuthSource: CYYPR10MB7675.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:00:33.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vrHn+sZjKaXZtgOeq55FCk2dSExQzYrz2POWYfvXUbF7x6/gdjJrA5QAoKldLRFkKfniQm6o8c9GkESGVQauA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7109
X-BESS-ID: 1738710037-105033-7557-9825-1
X-BESS-VER: 2019.1_20250203.2302
X-BESS-Apparent-Source-IP: 104.47.58.168
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVobmZiZAVgZQ0MQs1cw80SgpOd
	Ek1dzS0CIlzczE0CTFwsTSwjLN3NxEqTYWAM3jmidBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.262293 [from 
	cloudscan14-247.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 23:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115278

The OpenLDAP license is versioned. As such, listing the license as
simply "OpenLDAP" does not convey a complete picture of what license the
component is actually using.

Update the LICENSE variable to use the SPDX identifier for OpenLDAP
licenses, with the appropriate version number, "OLDAP-2.8".

Rename the license file for the OpenLDAP license to "OLDAP-2.8" from
"OpenLDAP".

Signed-off-by: Ethan Roderick <Ethan.Roderick@digi.com>
---
 meta-oe/licenses/{OpenLDAP => OLDAP-2.8}           | 0
 meta-oe/recipes-support/openldap/openldap_2.6.9.bb | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/licenses/{OpenLDAP => OLDAP-2.8} (100%)

diff --git a/meta-oe/licenses/OpenLDAP b/meta-oe/licenses/OLDAP-2.8
similarity index 100%
rename from meta-oe/licenses/OpenLDAP
rename to meta-oe/licenses/OLDAP-2.8
diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.9.bb b/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
index 6d76a727ba..704e879891 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # The OpenLDAP Public License - see the HOMEPAGE - defines
 # the license.  www.openldap.org claims this is Open Source
 # (see http://www.openldap.org), the license appears to be
-# basically BSD.  opensource.org does not record this license
-# at present (so it is apparently not OSI certified).
-LICENSE = "OpenLDAP"
+# basically BSD.  opensource.org has listed this license
+# since August 2019.
+LICENSE = "OLDAP-2.8"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a41b4ed95ab4a20f366a8d82536afe4 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "

