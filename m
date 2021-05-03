Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.35858.1620056587412251972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 08:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bRJ//x/G;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEM1o5I+1INUPxu7WNJPu31kauK+RAEYssXCFvAprI8K/KneEt2LV6lsBGgN6mkX1s/5UrJ5FFfmqZ0/N7K1z8vaFr1HinIxLEWCTWXqgvwFT0KZXdsMxsbYE5ylpz1XtJd43nhD3mAoMm3qQmkdEqqasJ7Skflu9hfH+Aa9l+2WxzcqnYWp0VnT8OQLNG7gWu2enaeSKFm+Z9LfQrhzWUR1tGb9NLQ2QepMur6XqheTGZ4ei2rZFe5whb3sLFY+ft3hdEyMbj0H0fwdFhePET+y0p+RIWCoC58ZgD6vLyDUYUHUkjS1+c80ei5B1zfTNA98o/z374MJCh0Y5/c+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vdEb35sZIRRQl9Vme6PwVL6/2n1C6b/q1OuuxF7rsA=;
 b=LJw3Lvk5lomUh/WKWTABk82gQx+Ns7mWuSFbZtah06Ww9YkEJr1Y/nroZHYOanL0U3zmFVauFxQOCGhzT+25Z9LSiy/qNzPaae7KTElF4jMHCPx9hKgOS17oVTPwEzUZCM7mJV1UeXUgLz4fnqz0+D8hBjZ7j8JSW+uacCI1MVLq3QQajK2fCTOcPdZK6Jm/Q/44vAMJrTdSDLsDgmB2+8Ju9TAU0pDWYfc59YQKrBjPVNoYXnyO6ZpaHyMMEBQat+1Z1bxurYtq5/YstAfR3t0x3qKGefgAAjDg7alKmIKq77tHSWGXm3Qq05Hqbj44pKhFqxCgPfXPYP09B8i/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vdEb35sZIRRQl9Vme6PwVL6/2n1C6b/q1OuuxF7rsA=;
 b=bRJ//x/GjEj2GX67QQj83JRMvChjdvn2NULwA66lsHU22MfV5ezTXyhYH1DKam8N7vSmgcjHYq7MokoxQMQtq9udh1AtJX0y2hgGUEl9+d863dUCHy3akstEcvmml0YSSKmEy19qLzzf2z/6w3sGs0ywTtTwP4O99yFappJdCUI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Mon, 3 May
 2021 15:43:04 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.039; Mon, 3 May 2021
 15:43:03 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: Saul Wold <Saul.Wold@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tbb: Disable PPC as COMPATIBLE_MACHINE
Date: Mon,  3 May 2021 08:42:48 -0700
Message-ID: <20210503154248.2359344-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503154248.2359344-1-saul.wold@windriver.com>
References: <20210503154248.2359344-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR04CA0251.namprd04.prod.outlook.com
 (2603:10b6:303:88::16) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0251.namprd04.prod.outlook.com (2603:10b6:303:88::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.28 via Frontend Transport; Mon, 3 May 2021 15:43:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e8087c1-483e-494b-ccf3-08d90e4a2305
X-MS-TrafficTypeDiagnostic: MWHPR11MB1853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB185365255838F1D7343C5BAFEE5B9@MWHPR11MB1853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vvnDjN9N6ioTEaLmdg39Ly+/b9ko/bgPViFNSL2s1ryWsRNR9JJppIoc9jOOeTmd3xOffXHGusQo/9wrXqaTFKDTIVioIrk7bcSymgu+G9r8anYWugZ7VWU2fIso5QJYrCBQKpVXrGpdtqUgcaTBDWTj8SKoJF8m19GKsQYoslRVeKYGB7Y+m7vNlzEU1M0kqC8FHw7vAzD/RNbN2KiGMVF33s1szRXRV/cd1EOCK40HhJP0kRGNLHgHbVBCkNUahf28JZBEQQ/sOP89ukVQCIrZ7f5/R1CV/XVfukefEoIpTSImy0qQ9924H2wiHrPQ49KSRAguh1X2bOLE0ZQW62xtfDtBVJ4UOyuWU1SzuW2IF/oIFv4L2+i8qxVv+KA2B2BCPMcSzI5iKgiYNZDiTbv7rgZzokl7y8cwtTuNYi/81TPlO+bELlzch4EpUadfW90NrTsXEPQWE+N9YggT+SmoxaHTGC+cMs7QVz8uic0qq02tSJsZxtGSU4B5sfBQvDVHsKyZNWOZ4gR8iWHCRl9onbu6ZCeJRkvzcvslxKJP4UTN4k4z95Dbl3hQXo6KT3x1nC6/41fM2E8RCkWWxEU/2fs/guODDMecoYhKvGpzjeW5+eVAzMhFmIFoSlQ/C2zaw1t+L0/Yg5k6RaHllYKiECXTRWHgeenZJX9mejU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39850400004)(376002)(366004)(136003)(26005)(478600001)(956004)(6916009)(44832011)(4326008)(6666004)(2906002)(54906003)(316002)(186003)(16526019)(8676002)(6486002)(1076003)(66476007)(66946007)(8936002)(52116002)(66556008)(38100700002)(5660300002)(86362001)(38350700002)(2616005)(6512007)(36756003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZlNgCHlI9NiwwFas23JpSaPiPXQliNG9CpNnL5NyyGy8/QJfh6kc8EteGhEM?=
 =?us-ascii?Q?+3ywyLzhAwKlaslgEYv68Xs4FbHFo6tH11Tzo0SvIKAErupiEfuKLhZGl6yL?=
 =?us-ascii?Q?m8gSMOqbhY5S+ryaLXJnf/me1VzCdPwsT4b8TGGPgFFzF3cqDYLYWrUh1NUY?=
 =?us-ascii?Q?0sQmkPkRl6j57+ai3AzRdKrkM/SH60PbQEeYM9Pbb2Ps2Sjt9+sOop0WEBim?=
 =?us-ascii?Q?GrbKNuxPqCAudnybbulbu1LX+QwDa6qnLOps4BlL2KrST4czjb3NBMhTKkAs?=
 =?us-ascii?Q?ZsYIeiBf3Wgq1oriQhFUBSYklSbUFDv1QgVKnvDvQ8MO+O5eCUL9EFhcfauo?=
 =?us-ascii?Q?fKjxyoU2k/ZV63sY4VSWdjSIczwGfiN4TzV9TlnmKpW9j5ko/40A8YhcRV5u?=
 =?us-ascii?Q?StpEssl9YLmvzgHcMgjmsp6Lxt6G67z6ihfvI1VESjXC1th7JHVUy7doCGG4?=
 =?us-ascii?Q?enyfeQM5CFvRim6EmArNIdlJQohsNMdgcvEjaywMfhxeCjaCqXDkuIaWVEbc?=
 =?us-ascii?Q?Do9hzk609z01TUcaq2Za8TsHTAIupWBMHe5U4hrfue0ZNYFafYoTinzEBC0H?=
 =?us-ascii?Q?0fyaZIKYkASqJmELErUxjvVkF/VhObX+jMzWWotyD7TEDhO9oF8Pi4Cj7Sxp?=
 =?us-ascii?Q?madt0knmOtDwuLEY69O/36+16hw11FAHb1CLKJt4CT49FwiB8Hgd7pb2r/qu?=
 =?us-ascii?Q?ekRwIF9ijkWWdIeXQn9fEybOZIQQDerhXZIoC2ORATDfUYJptxKZdCKl8y+E?=
 =?us-ascii?Q?BkxylU8McRM4KA4OSkVEss3afcH+4qUE86RJ/rARDD7/s2HTBuMfcMWvgT43?=
 =?us-ascii?Q?XlbZtdMW/N9Db4MJ+i2bxVmsDWcaPe2cev+fz7dbJXHcZuV2FmON0xx6JkwS?=
 =?us-ascii?Q?BE5E9mbR1TdNmfLuKDnwHyUgo3/TNrdUD0cvtqKhZnJS2SG3xaEkU5kHligS?=
 =?us-ascii?Q?p1xzc4dga2EbK8i087FmFXOgLzl9xaAPe7K595C2mPclhGgbd3akl+uIaJNF?=
 =?us-ascii?Q?3tyHXUC4sXfC7kYYZ4P+0I17xWE/plC084wUi1OzIMxhiHoejx0VPtJRVk/w?=
 =?us-ascii?Q?9Nake1jrxubLz0qv7Bsl2hyRvw5WKk9kSxaJTLSWXD/iLT1yBBuIQ4cZVMpF?=
 =?us-ascii?Q?eTrpasKhnx4dry3DVYZpSGw81taLNF76FW5XdELQY0Bmj+uKHOU1zyiimatZ?=
 =?us-ascii?Q?2Zwnuwr5c56j5yU0JIzJftvDFfXUHR11nT5w1dd305AhyuMmLwDi+u6LGvSS?=
 =?us-ascii?Q?8isfuNZ5/837Lqj0mc+rfVeIZ0QvyXtrDtAtfzcSb0TIpm5eWo+873Dx196F?=
 =?us-ascii?Q?1GPhUgvgRXm3txjj2ezzV5PO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8087c1-483e-494b-ccf3-08d90e4a2305
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 15:43:02.8971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYU4nQ09HfetCzewpeUFTRM3nI8Ag0pszvcArAWoQ3UmiBZEitnKM66tz3rBY9w8DpXrEgq/zEyz8lSLyk475Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Saul Wold <Saul.Wold@windriver.com>

The latest version does not support PPC architecture, so disable
the it. Otherwise the following error occurs:

/srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2=
.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: error: '__TBB_machin=
e_fetchadd4' was not declared in this scope
  338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
      |            ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-=
support/tbb/tbb_2021.2.0.bb
index b05a59dc7..d8a18866c 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -43,3 +43,6 @@ LDFLAGS_append_mips =3D " -latomic"
 LDFLAGS_append_mipsel =3D " -latomic"
=20
 LDFLAGS_append_libc-musl =3D " -lucontext"
+
+# The latest version of oneTBB does not support PPC
+COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"
--=20
2.25.1

