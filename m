Received: from outbound-ip23b.ess.barracuda.com (outbound-ip23b.ess.barracuda.com [209.222.82.220])
 by mx.groups.io with SMTP id smtpd.web11.4479.1615872474664197147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 22:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=E0z4u3hk;
 spf=pass (domain: digi.com, ip: 209.222.82.220, mailfrom: devon.pringle@digi.com)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176]) by mx-outbound17-110.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 16 Mar 2021 05:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoxEeqXEB3Wb5evLY/dvJUh0xL/0xgsg2ECrlfplbTnwY3Z1PRCI7rg3VGcoa+VdLC/C6R0AqK+F+uuTTo8+vgUKH+EqBlOTLIwnaPpk3BjhIU5jdyD8jZwxMj00lXNktuhudGpEDWsvAzC7tEkUYyv5VfQMSN7pXq1rhBCI8QEyyfzWRh3tuQcuqU5ZrcB+pJgFJ56xyo328M4JSKe3rmNVi6/HSi4CxaHs5ZWz4FwN1EWR0osFv4zwR/HLmdYR6DkFgz6gVn2jXsuCxwWjQYTGKb2zRYX8s3YYhwVQLExIRI1VaPve3aKsuTAKDnLV73+cJUwKeEYkJ5fuHK/OxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QtfqIU52H7ktEu6YqZeS7i7FT/WvCtzia15brr+exI=;
 b=arDImZXzEGRxvtjgCfHFLmHG/OkgFzw2l5WEDAZVsgpuMWQ3tBEuzbzLx4xd/tpODPrR2gV5UYffg52PEOEgXViiW1H+cDEwrJoHRlG9apwBnsV4MbFZZkqI+o2OVEHHywRvQKFgPJ4Fp/Oy/g2FJOzzjiMeeKpKbXe+S3K4PN9bs/gF+kwRyK+TLZZZcv8jp8VnsFY2vupDlmMZl+Anb5SBCSdAWEnrmSA/WV4ZtkovVnPrl+/r2TS00TAbTPQFy0Yg2p6YdQJpaYScCNh/ry5ozbmkoKZ30kKhNcSdv6HFYJBhCQJ2ElClODYBp6FOWtLyXmto0b5a2O6ck7zTRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QtfqIU52H7ktEu6YqZeS7i7FT/WvCtzia15brr+exI=;
 b=E0z4u3hkl87aZRmRWYTTMCNmdyhfZdp1Re08/g23Jn5aJh/H/1uLjGbMd3dGu29Vf/jjYt+CAC1TBtf0Cn9HiT26ts7/b+l581KBW74Uw3tL99Pbl7GAE2yN1QlEvOS+S9TNQz0UYGUfbqyedFFDBnVzHIdGTOH7xACOvVZ2w00=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB2838.namprd10.prod.outlook.com (2603:10b6:a03:8f::16)
 by BYAPR10MB3064.namprd10.prod.outlook.com (2603:10b6:a03:8c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 05:27:48 +0000
Received: from BYAPR10MB2838.namprd10.prod.outlook.com
 ([fe80::d14c:b8d3:7603:f809]) by BYAPR10MB2838.namprd10.prod.outlook.com
 ([fe80::d14c:b8d3:7603:f809%6]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 05:27:47 +0000
From: "Devon Pringle" <DPringle@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Devon Pringle <devon.pringle@digi.com>
Subject: Re: [PATCH] python3-pastedeploy: Add recipe
Date: Tue, 16 Mar 2021 15:27:17 +1000
Message-Id: <20210316052716.1950548-1-DPringle@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8ddd144d-8805-ddea-dc2c-6a4d0024544c@gmail.com>
References: <8ddd144d-8805-ddea-dc2c-6a4d0024544c@gmail.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SY6PR01CA0048.ausprd01.prod.outlook.com
 (2603:10c6:10:e9::17) To BYAPR10MB2838.namprd10.prod.outlook.com
 (2603:10b6:a03:8f::16)
Return-Path: DPringle@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from devonp.devonp.bne.opengear.com (60.241.24.90) by SY6PR01CA0048.ausprd01.prod.outlook.com (2603:10c6:10:e9::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 05:27:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a75ef52-328d-495a-91f9-08d8e83c3bec
X-MS-TrafficTypeDiagnostic: BYAPR10MB3064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3064A7C013BB46743958B7BE856B9@BYAPR10MB3064.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uMrf8krdG4vYMeWsxjO4DYoEhdzYu/Je2NAA+pE5Dj/S8blOVX62dXa8r5VswtPisnKyHQ87sd3clGO5buvwdpXIoyoG5gxoRDveEbk9wwGVSMbeNysb4KGfRYp95LmKnGdMNx7dG4cKc6oK692W5RfDlb7IFRRPy72l2YNxnQDHTVWJd+kOQ6X6/S/glMn9gkqSr17e09UiiWf7Ii0FwzMx4fUPsEFoXOIHl8wweLd4uQ74fZfPvwKNZwOmlLQR4KIJEJhddWG8CWXxYuln5MdUzk6P/0eEpIHCf/ykwwWLCxQRC66aE8BomVU4TFbwfRiMYSjcOX3rdiP726RII34qOB/cFs1gZ8wFynJsaoEqg2ppWYP7IigYKYrIgkKEvQY7sU+Xa/RmryELlTyZaA3TxVTK6GzcwG2N64bi5hrBCBiresLwoYUGjb99f5KZ1z1bp4KHFwteP15LjneIdRVlv9pa8X+DT7fxkfnp70xfj2m8Dvd1cIUpOA0M13gOwkm1DOT+88sjZ028foNiIcwa9PEB4FvHFg5o+z6kAtZ9vfjVKny32m/vzyzHm9yQLKjGyuxL2/GwcrmBZdOS2wNhC+Sl6QdWINRh7nfG2aleI5GEgYh2W+kzYThXgfre
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2838.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39850400004)(8676002)(52116002)(6486002)(6916009)(26005)(66476007)(5660300002)(4326008)(6666004)(6506007)(16526019)(316002)(8936002)(6512007)(956004)(2616005)(66946007)(478600001)(36756003)(107886003)(2906002)(1076003)(186003)(66556008)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gaBRdsCwMTC9GN7fw+HWdAcU1xSvGh/a+08B1hLf+zMMOERbK49iEaeu1FTk?=
 =?us-ascii?Q?TRDzOSSFRjcbh8eXJAnBXzoFWpdSSt+Lj+3sR7e3iO2nz+RIamOvV472A+Dv?=
 =?us-ascii?Q?LYag9Yg4H3O89lsHPxeM71k3k/vF0rNZd83zWkOdoKZc7jTVdC7HBRpN9BaC?=
 =?us-ascii?Q?tVCM3Lu0YgjCeyVOdrMufGgosZrusne0D05s6i7N7I6cDyz+9EhW6xDRRCF9?=
 =?us-ascii?Q?NR7Axt1UIw3zDhhEjtnlBi4tNIL36orpWyEC1zU5W3cwQ3C2DSzSv82pL4jn?=
 =?us-ascii?Q?p8VLU6XWvKpjMF0MikhS9ZjylNjhqmu42vNtcBjTeWZW75HYdAFbDRWhp+0Y?=
 =?us-ascii?Q?o3MzzD8iYMBkLkF2KubVnje/Tj4k1o8aba5p0SkX3EOA0gII8nL4eC4ycIqX?=
 =?us-ascii?Q?JFrm4VP+2TyMfBKwSuSi+wRJC+ehRZXcvbVeaIyc3y/IrOxosHCAszR/ft+u?=
 =?us-ascii?Q?kUKpCTdI/rcQkF+ftjoXRTBvX+tqxlY1LkL3phXW7czqtB3ogINEpgCJkV/b?=
 =?us-ascii?Q?+xHjMUXKEBxVcAIlLqBW2MMPjns9ceslfVeTGGwenShfi1fYolCNlTAdDRYT?=
 =?us-ascii?Q?xTn3e373KbCS7mUHFLb0H2XQOWT3Cyer0NOPdxeVaTgVdACZ0/xhVemu/2Bn?=
 =?us-ascii?Q?7G19n97HVLw42wrY1W+9F8K3okOVi+gx6bZ0Zz/NVXgmzYhOXVzeKTyh0/tH?=
 =?us-ascii?Q?RKo4/uDdHmPOUlwps0SoLb1hc8yRQVep3fGQmaBSIC3Xy/ONtj6IkEd9EDfH?=
 =?us-ascii?Q?eCnEMH3a74lCmO+SXH7TK96OernE6pmLfyo0+qD6WlvbVDVfeuStCIge663j?=
 =?us-ascii?Q?Ua4ZQ+NzFSJukHpQN63dJxT1CYZ8gFqi79M1qp6LVPUiix6hKTXZo1TmscAF?=
 =?us-ascii?Q?gaOSZRlAJB0p+Vy0dxidFWJILJaC9KdWi5eIPFDcgNICRyWPrwsmYPMpjhga?=
 =?us-ascii?Q?/t5a/nO9M9PtqUR3rmNYNTga2T2cSwuIgWRu8Mvkyy492iiH0YkRY/RsUalz?=
 =?us-ascii?Q?lGzGLagk8jQvKBKFwJGp0XFFW/QYvfM8p2ekCFWft+d9rNohE1wq/fjEbHyS?=
 =?us-ascii?Q?tE6Xve1UeZZpv4ZKqPU1RSOi8tixmkhD8Kcq6GvKfRY73VTG0qQIulRFmPGE?=
 =?us-ascii?Q?HxuaP6H+MJZJVphkCuq7/3lyqDtnpB4rLqn38Lqc+x82ijSwr8wnwtTi36cf?=
 =?us-ascii?Q?VTo3HYwI7PpcSwnOL7XBttpWK1UWgEewFwKfVKmBQbxJRER2BzLIvatLj8G6?=
 =?us-ascii?Q?RydAIFqlk7dh5DeCRdRqWVmLFp95kK7y0/CcRdNickULgi8vUHI4AcHmD/LU?=
 =?us-ascii?Q?TifjfzLuOVMZ2McmJt644m+4?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a75ef52-328d-495a-91f9-08d8e83c3bec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2838.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 05:27:47.8513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwfJznSPWcgAMj+a0XxMNQBMuKrFfe8x1gjx2O8xtLgC3n6GtRNjH/bAWJUhaFbheobEW/jERXIilnl9BVlIag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3064
X-BESS-ID: 1615872469-104462-5519-147386-1
X-BESS-VER: 2019.1_20210312.2105
X-BESS-Apparent-Source-IP: 104.47.57.176
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.230872 [from 
	cloudscan19-0.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Devon Pringle <devon.pringle@digi.com>

---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-pastedeploy_2.0.1.bb       | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 4512f839f..9530c7201 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -251,6 +251,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-parse-type \
     python3-parso \
     python3-passlib \
+    python3-pastedeploy \
     python3-pathtools3 \
     python3-pep8 \
     python3-periphery \
diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
new file mode 100644
index 000000000..b7c8c61d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Load, configure, and compose WSGI applications and servers"
+HOMEPAGE = "https://pylonsproject.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c"
+
+inherit pypi
+PYPI_PACKAGE = "PasteDeploy"
+SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
+SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
+SRC_URI[PasteDeploy-license.txt.md5sum] = "1798f29d55080c60365e6283cb49779c"
+
+S = "${WORKDIR}/PasteDeploy-${PV}"
+
+inherit setuptools3
+
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "paste docs"
+PACKAGECONFIG[paste] = ",,,python3-paste"
+PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
+
+DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
+RDEPENDS_${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
+
+# PyPI tarball is missing license.txt
+# We will need to keep retrieving this from the online repository until version 2.1.0
+SRC_URI += "https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt"
\ No newline at end of file
-- 
2.25.1

