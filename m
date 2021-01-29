Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.69])
 by mx.groups.io with SMTP id smtpd.web12.6902.1611909309993708259
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QF6MJrUZ;
 spf=pass (domain: windriver.com, ip: 40.107.237.69, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0WsZrA79aYsq8xfAaUiqBzl/VGvctzNjNEuwOkAreBiZ3/njchmGzI3tAPVtA5WCsaFROnZfoC0f0T2hOD1C2P69NxDeu5qMIgoqHo1zg3Nc0w3cF5h1cHVnphhGrKXhfbkFLC/CPIevYeR24KbHPB0h5prPYtR4mdESYnZXWCHT6TQEhGNoTYZ7gZg5azLT94I23GxrFeII81/eBg8uwjvQjVFbY07L0UF33IXJXt0KAOtsb05bIBqf/Dv/dwqQJ0uGRmx0IkHHdyChYTzw/coHAZhXzoppuSMEh04k7fcsRB3KlDtYL6xFJGrNwAhhFjDGbHn+wG0LOju+fgfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOVCrjJm3G3GxiDMG5vmA6z7s6YwZm4Ymr0ah7NhrBo=;
 b=WFBW7UCwk8/in5EBWHhjxNLKhda9fJzz20Etj/qViL2A5LgNiL9/lAUZFgi95jiVZg0F9U+ggAy6NgT0w9kNsR2TFlyxYEc8Q4pu7jFgm9YSR9DtVLM3IVEAB++8jcXiXI/XIGVTCi5Mv48s1PFORbNgfKXWJnVsbMWPeQLKvbMeW7LYA87q8Yxu4S5YR5WCLVGfwavmaRAVwgtRalphC+AGkb6ntgZ3eT9uY5FIAK2MhCCikN+I8sojGbx9MLmIA6ATwNWOovlDNWVkj35tX58jDoe3f6246uVOezX2I3zL5e5h3DNw3uNDUb5wafA8FkNlxmY3ywaOO1UoPpPb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOVCrjJm3G3GxiDMG5vmA6z7s6YwZm4Ymr0ah7NhrBo=;
 b=QF6MJrUZbuUDkojuJGM4cWISpegdfSNs2965xaKFLzIlYofDonpS/PDuPgRo9xSHVlQa0byMZCHJdDMJyLmLwWP6p3ltqBH5JwugP8UcMsf8SBX6if8z7uzWT3QGtlRu+TLye5ztUNqBD1bL3fdFFryFlPii7zxTXi7SrDwHjw8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by MN2PR11MB4205.namprd11.prod.outlook.com (2603:10b6:208:192::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 08:35:08 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:35:08 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] minifi-cpp: set PSEUDO_CONSIDER_PATHS
Date: Fri, 29 Jan 2021 16:34:52 +0800
Message-Id: <20210129083452.19269-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:203:c8::13) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0008.apcprd03.prod.outlook.com (2603:1096:203:c8::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.10 via Frontend Transport; Fri, 29 Jan 2021 08:35:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e657db2-352d-4d22-6053-08d8c430c8f2
X-MS-TrafficTypeDiagnostic: MN2PR11MB4205:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB420536AE52548ACC1423F153EDB99@MN2PR11MB4205.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WvTsSgyMAJIB25EkCFxu0i5MhlXRIOGO818YEsAAHZdV+SNYMZ26B2ShyFzoxps99rMKIMeJntW2jJvurTuREzCQKYu0k9tjNb9yVmly72wsJOwz+ccNAVRyMUlV0oiNBle1VRq6APb6ezqcWlR73p87uFD3mykKTcXXsuqF058aCQsJ07rrL+jTNZ9eBhrP3Slza2OPMD09x1PY15mxEEVcJBwCPWZd76niqAinoTvnVrZpAqsoq2ftEazXoUm7+TSTZwvP0SK9RTHIR3lPmgyIZ+qhIYBusPPcpVXFLVJKTdE1AKucrcRUH7PRUxqzRp37w5MA7y/UIz5f8SN5OAaEsRHv+n10EXINtRAUolcOSpTGxfB9XjeW4WqSXiWVfMgjH9klmYRC8M1LgKzHKVa0X17Dm8aiakvGf2dm8ldnE5h4r6aVYQTh4VtFW/1aiEtSGLUC7NQgWdjXILbfCwRaJjEs2L2/Gisx3/93l4sw2X6j4kE8+sg6XmYA6z2xzoGH+kU+Mg0+15HHW/WfFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39850400004)(376002)(136003)(1076003)(6486002)(6506007)(6916009)(6512007)(4744005)(186003)(5660300002)(8676002)(478600001)(66476007)(66556008)(26005)(66946007)(36756003)(86362001)(2906002)(316002)(6666004)(52116002)(16526019)(2616005)(956004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?nVgEq6/84A7wHrlrxusjUKJjEy2bZr9ERR3e2RIqBGQhnZeAbJDmux4J01GX?=
 =?us-ascii?Q?PBHih2WEl3PCDMVjaeuCF6NZY7QXCYScAXJ6ypp1W85nYlILtNUhnfCw4b3Z?=
 =?us-ascii?Q?jSsSGLMMOA9pqzRYRJrugc7Jd7PqJn1ovPqcjfAmZBGVgOyoZtGYRz6lJWph?=
 =?us-ascii?Q?sqvq984+wpWpcaU043ZoIlD6i+k+MNwyATzexQoPH2GF0gLQlZGeUv99/HRZ?=
 =?us-ascii?Q?DfOZAIe0iQjInuxN2kjVra+/HWKXPhWXItJJY2wNg5hTBlo2dKJqnrgOTK2T?=
 =?us-ascii?Q?wBfJuVTMtawzTiipmZLt7uoGSPGt3lkW+TiTfcN+7o2aOE/Y3HisQmi9w+ER?=
 =?us-ascii?Q?+RtNLaYFXjsIRmT2qsgqrW3XXZaTg58Kk0mo5m3Nudd+4FrZVQYA3GwNs+gW?=
 =?us-ascii?Q?zCezoHQQVHwPJ0j1hnxA/nXfGVyNDUHnFQOIMMPs/3JqS7RuXseOKlhvISSh?=
 =?us-ascii?Q?0MxAES+CC9qXFu1zaK32tGA2+4wSrL/YQfdD7QOn/yGAZe5EkFe8b7bJNaEI?=
 =?us-ascii?Q?G8l06c2C7D9jKAFs8FJmEq3+Buc77Ln1Acdtl54E4pxFGwlUl8vR/Iwy2p98?=
 =?us-ascii?Q?JHePQNAdwYbiUBOLjiWmkH+Qo923TcgYT0+V3mw2Ha1kX7foL2xLFtLitAPk?=
 =?us-ascii?Q?h60TxhUPsAVuGRa3lT/26AweOAXHtNZ3fm7ghtuNN13Wc5meYd9H0mxTclfz?=
 =?us-ascii?Q?9Tnnbwwb2cZwe7j2CEa6KLTrIe0UMSgaqe1GzNE6SGtENV0R/wbhuTxE+n5i?=
 =?us-ascii?Q?fmrO31wNy7hUDVvPWs25KU5J1wJ6XDnxj22CTbm36qJPIpQirbfToWJssEYk?=
 =?us-ascii?Q?TEDVatlLwtzu/oBKu2kHI6d6hRvGwBCs6zL4ZCwBP/CFZlA8g6jIdJ54MXNn?=
 =?us-ascii?Q?c+k8fZ4jz7xZ9kAUVqzPGvaFmTc818LDHXgB1FAXU7GjWfmIHnOKeiGz6UXc?=
 =?us-ascii?Q?iKlPZbytAsYEK08+j21Om4BAtWfrzZHRt0i1sxi3L4waRnIEwByzW5Of9Ing?=
 =?us-ascii?Q?em9Qs/dVEiNVGZfupe3fbzgv7SZon2vW8E55Frw9slZKTo7Ssw8BxY1Znj2j?=
 =?us-ascii?Q?fcCwpm+B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e657db2-352d-4d22-6053-08d8c430c8f2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:35:08.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6F2i1qAmGT0xEefjY27klSN5O2s4DXfTqsR4OBFqU6Hpd1Q1+Zb2iAemyq7ZzwZarf0I245EEV+8/4dnysosGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4205
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index b3ea44c3c..34090cf28 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -75,6 +75,7 @@ TARGET_CFLAGS_append_riscv64 = " -fpic"
 TARGET_CXXFLAGS_append_riscv64 = " -fpic"
 
 do_install[cleandirs] += "${WORKDIR}/minifi-install"
+PSEUDO_CONSIDER_PATHS .= ",${WORKDIR}/minifi-install"
 
 do_install() {
     DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
-- 
2.17.1

