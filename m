Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
 by mx.groups.io with SMTP id smtpd.web11.15830.1616981632939646880
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 18:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=jzJwdasO;
 spf=pass (domain: digi.com, ip: 209.222.82.221, mailfrom: ben.gampe@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101]) by mx-outbound42-231.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 01:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Awi8q0bB9KiH73qF+wroaQ3zvHkS9icd3zforzm9zpPBcuvr7C9lQtkpVDYJ+4KLewWH1HVZjP3wNbgpZ19/P6bLXi/eEBWesYLqNCMHGLBY28vdYQOanoGiwWqVtqrQdosNzguqvZdrQKjZW8kTvZLWyX/TDenLD3MI0ViOUrGOYOo59pSHjHC+JTvcRyYveUVP1+GeJFuur0XhDhJDC7sULm/zQBvNQxr6JP4vxgoTnBgE8z8nvbuQxxmZaDgAknKl9c6Gwe6ehppY0KxqkbiEq/l+dg/6DqLv96l0lpKsNZ/cL2YltU439m52jnQ36hblOltERz7U+Qj7861NOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0blSMuI1Va8ajZJ1xqbqUAIBu5kxB4l6WNVvc81Yhc=;
 b=ltD1QLK3V2hyMSm79KBBWGOgp6TIYejMWpsQ1Q45fu27Lm7Xnw2jI9spj9cDEYLhDT814/n5k42VmmoLTtLuZeUuXLVCPH80FZSaXpw7Mp5w99YegqHNfeoOaBOLPMwoAly8xZfL6xem6Bw0JiSoiHMcVU7RI06B3C+V9vez3A71usBuMINBHDFdEkXmV+7F5n1K+5hCvrSX0p3oGrL31zMLN9zVBhgzgE9fNCrOBxalf3/ageeuKnIm+cN/CxnId5jQkE9SjhUZFzdB4iYvq/qDRIm00VABU2POUoJuK390IgLQiYbaJDqiyNTrz6p2zXEjOsxiV3UW2RuA2JPRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0blSMuI1Va8ajZJ1xqbqUAIBu5kxB4l6WNVvc81Yhc=;
 b=jzJwdasOj+/tYavdXFDQKFocrmWJIy8q0fA757d9yFNOSPqUdNtdSGx3t9x54IY58uF7aHDOC0jvZlA12XGpVL+ZI/S7MD0CXL+89Ewm/cj7ndNts+tfUZv9NHjvZIDT/a/U7MgOTlEGSHE8P7cWIHDW30d2IDW8Jx6udt1lXfY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BY5PR10MB4019.namprd10.prod.outlook.com (2603:10b6:a03:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 01:33:49 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:33:49 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v2 3/3] python3-fastapi: new package
Date: Mon, 29 Mar 2021 11:33:10 +1000
Message-Id: <20210329013310.2582815-3-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329013310.2582815-1-bgampe@digi.com>
References: <20210329013310.2582815-1-bgampe@digi.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SY4P282CA0012.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::22) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SY4P282CA0012.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:a0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 01:33:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f531c5e-1522-4029-dd2c-08d8f252b422
X-MS-TrafficTypeDiagnostic: BY5PR10MB4019:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB40193DD9E65275C2256FEFCA8F7E9@BY5PR10MB4019.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fc7zLYiuMEa10yTri22PO3TKqDHSk8g78v/e19U717vPDSUyqYZVWB+S/I3UK7UYmvc2IrofM7XpisTmblc5WBZGpC+lI+Puz3znYm6gqv5AP82tqX4Pcg6D2BsVemrROqxX5vf3X6vhR70L1E6uv9wdVct4xwqTaU7meMmloksl+Rs3ltMXqcculOGDiAXnOpebqGT3S09sm++5OREzyhrUDxmGBbjHbXOLg6oJrVC52LuhwYC48NxFArlN8BVXDYvlZPQHzOSwkxYBpokCJgihY+0yav6deFSE6tjnazKItbJnrsO1nYsK6uc8rzrHiFykZDp0Q8fHnnZnWhPtaFSRfLYkLmQicQHADgZIi/Ur6ljBA4iQ4ztvbPfsxLCgcXFQveyTIdQINdLu/Gb9XzAreu+KzjmYm+LthUhCBgPbTLE16xrLiBY4GNx+wvmTZIhcqzGQqirCgM7BklgISEZXKEohLXn5ALTq6LymAQxSdrUYllk4CdW8clL7wfDJpjIDyg8z9vCp7WjqWUy0qdabMx5n0k45sCh3p0KfCT+/yCMNm3+ZePbRhrVYL3ELES1CT/5qj4XyRneV9jt02AIjx4CoiXl/UG4pwDceMAfncuOCrhjZ8TwS71E42YfkFFzWJe6RG5Vb5JGbfVNcg6Wy82qHdEjT4i4eOqtHsQngZwdX1ybLa6EPZU1oxOiwqCMcY1Wsixy/33ZW0URwbsajBJUll35qbtrnxFZd5Hg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39840400004)(346002)(136003)(396003)(8936002)(478600001)(66556008)(2906002)(66476007)(66946007)(6666004)(6916009)(107886003)(186003)(6512007)(26005)(316002)(8676002)(38100700001)(4326008)(2616005)(6486002)(956004)(1076003)(6506007)(52116002)(5660300002)(36756003)(16526019);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?KRXJAOZRGOqgI7BoPFG1SQDD38B02gFjEaQpoHN2IgaYvH36a+ilqfFD5hFA?=
 =?us-ascii?Q?g+WqjtjbI1Qe0MWYaCKvkCGr2okoiqRDH2M+dgIHZYPPVP9feII7kBZs7Oos?=
 =?us-ascii?Q?NKMdhyIh1RGYScNocWfciLtbXbdn5LgtyVo7u3mnGI2wy+3z62Z0OegCzCEh?=
 =?us-ascii?Q?j6FJ4GuLq530t4XtFXxRWly/ancNrH+id6ndBcJCFJhP5OO01fCpKeINsCFz?=
 =?us-ascii?Q?OMBJeTbDNLuMjoVzmzjTklg4F3Sj8JtUvz38sIpU/r2SyMdyj5Vs2NZC0MJe?=
 =?us-ascii?Q?F06rqMf1igldn9i/jB0l1sq4wU8cDxbIaKqZhiuuel5MS7qma4YZgRAjMpPZ?=
 =?us-ascii?Q?c8IkMP8HVmk4R+mFTEoPAMk2sP8ilIkmtABEsAqvCymyogoHn5AhGnTH1zvN?=
 =?us-ascii?Q?GKgsKzbYzAEP1GrhwQUognxdOAAhRemDay/I4kZY8UcZV0B7O59rLDany0f/?=
 =?us-ascii?Q?RalGvBAbQ6wgd3ldRLVi15oBVY2/jPr7V+vmGFU8Tbf3FOOlNQEVokSTA/XA?=
 =?us-ascii?Q?CrKc200n58ecYGLlgD1c0/Eu79qoP/P/KlOpsPD/QsfWcyaMIIJ4OIrng2PR?=
 =?us-ascii?Q?D/4eJZ5i1PbNJ7829+mqnmXd9pDVGD6BrBSv90T61DdrFRJpwOkYsyO/GUgj?=
 =?us-ascii?Q?pBJV2JRGpO8kLaLjnmQKzgWfw3plA+0Ro4FR2ONuVO7mxfoT991anICzt2WL?=
 =?us-ascii?Q?GHd0n3Zn1rF2Vji6RF7F8KGJoEZfb4iPuB/lcwzJJJJ3JmFzC3y0bKfL1ISF?=
 =?us-ascii?Q?f8I0ACunvWwRu39hbrBNyNiiaFLZPNQKZjjjLLxmps5Xet0aO3yeQgbtGgmO?=
 =?us-ascii?Q?Kmm0C9sZqGHPPf18V50OMqapDyHvJi+TrsBjuO7hnLabE/KONL01rm4+V7zL?=
 =?us-ascii?Q?axkfeF6Ii1O9nEfLsyfpK+DBcPmuZwYO4MFRV/k2hfYEJ8l464siLgmWvSOi?=
 =?us-ascii?Q?14m1GvyWPxRXBTbhr8448W6VNUL4GhtfgyjbPsxXM9fv2apH02Vp9UTKnfBI?=
 =?us-ascii?Q?YDwFB/KWnXcySnEf3PHPwl8G44MMg/6R+AQR7A2S2DVzT+VTouKawcquKof3?=
 =?us-ascii?Q?9cyp38vE8zymZDdXM5peO0+1eHINLRKfTmcX1dlbDwfR9ofmg1agdnA0MQ6N?=
 =?us-ascii?Q?/KmExhi8qzWm5nI8n2zqi27W7PR6ldC4Y4S1bXaOIJzmJekL+P2EA/YOa7WU?=
 =?us-ascii?Q?7waxyWLLfkIdDoBA5ts/G3K4fmIxStlAYdainxWq6RM0FsoZm97EQpvoB/HV?=
 =?us-ascii?Q?3orLO+amD88j4Lkf73y3lbBIomtDbCykEufrwGC00T6rzcfEN+dpP1vGrYpi?=
 =?us-ascii?Q?mLFnqMDa9hYXDZIG1yktmZFa?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f531c5e-1522-4029-dd2c-08d8f252b422
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:33:49.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekGpWqk6/KA5VPrCoNViOx/FVXLx/TaznwLXcTkWaAOpeyBU4kHQjW4uAQ9gud1m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4019
X-BESS-ID: 1616981630-110983-5611-25402-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.101
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231164 [from 
	cloudscan9-80.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-fastapi: high performance, easy to learn,
fast to code, ready for production

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb       |  1 +
 .../python/python3-fastapi_0.63.0.bb                | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c0132abaa..e9616a4a0 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -114,6 +114,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-et-xmlfile \
     python3-evdev \
     python3-fann2 \
+    python3-fastapi \
     python3-fasteners \
     python3-fastnumbers \
     python3-feedformatter \
diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb
new file mode 100644
index 000000000..296d64c05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "FastAPI framework, high performance, easy to learn, fast to code, ready for production"
+HOMEPAGE = "https://fastapi.tiangolo.com/";
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
+
+RDEPENDS_${PN} += "\
+    python3-pydantic \
+    python3-starlette \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "63c4592f5ef3edf30afa9a44fa7c6b7ccb20e0d3f68cd9eba07b44d552058dcb"
-- 
2.25.1

