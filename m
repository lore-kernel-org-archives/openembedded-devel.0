Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web08.17049.1616990813363893058
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=h09SI35f;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109]) by mx-outbound8-202.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 04:06:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuSJyliP4XYLJy/qoMfAoRdCZHOhf9ZuoPs4cOgO6P1rQ9J/cIi4aR3FBAVSHkaKqQsrpm3k8BwbXRocuE9hlqI4qMsu2bKh+/luPhRWnEWmrP14RGWf4GTZY6a78Jdgc3xJ8urOztiOeHGJaxbUFwPjAV33vlBwh3N5ihvv7sTrAuASYAt/Iquz1vrXfKpS7lZnZdct7TKKw+xDKPO3iWGwU+PLoCr+Zsw9lg0H/gYCP0NE2QCi+3TUwByxNSsPobdZkpVn3CKZArwJ3tS93kVh3gCtme3PzTbXGQM1dki0dR8nobRJedXVaPGvWcAuG1NB1tXa6DOBpECKtAuwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chmblGDFis9ZqfqIOnuvSNRzK4HLSiZE+kEDUFEQT+g=;
 b=YSoQ/J9hrrgPzaXXtKBm7+gKwUvSs03n7ePS0osl9A7ggTdnILqyst1KRGHqMXdb/nQzX6nGQ/rNt/zXdPN3Is7iv5P52dxhxugUfY90BrjQosuNjQ64RO9aJgZcT0nrlYvh1/YD4+3DVlteL6K/Au8VYPytVsvubeqZfQ2K9BVxmCfdY0CQHSwMXr3D0AZH6jL0MoRqQgrabPBnq8jzcIO3z110cwtS2IKotlW4XhsBrDCBXlXyeDGBhh9HlkuqGa/Ixpj8aJiw1dwVwqyHCG0irDwkM0CcPGt5JnADx2pXIpcgimvO0d/BRVU1uaKB3MoOaaS2/+5J5thM4teLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chmblGDFis9ZqfqIOnuvSNRzK4HLSiZE+kEDUFEQT+g=;
 b=h09SI35fi1dw3gWZ0sn4wBYYUmKhcq7Ym+ej39gJrZ5jvdUhkKMeOufWfU0fjAoNCHTJwGAs6rdTpLbrpnmdnRfWtrslq5+rBdwoAWTYH0Jf/FwuLyK2DugcwFH41IOvQdzeOXQ3RNBnw4jXMACreCYtnRN56jv92UL1HTrOQ4w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 04:06:10 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:06:10 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v3 5/5] python3-uvicorn: new package
Date: Mon, 29 Mar 2021 14:04:39 +1000
Message-Id: <20210329040439.2600056-5-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329040439.2600056-1-bgampe@digi.com>
References: <20210329040439.2600056-1-bgampe@digi.com>
X-Originating-IP: [49.197.127.171]
X-ClientProxiedBy: SY6PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::10) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (49.197.127.171) by SY6PR01CA0005.ausprd01.prod.outlook.com (2603:10c6:10:e8::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Mon, 29 Mar 2021 04:06:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15154ed-a081-4574-96b5-08d8f267fc9b
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4543A007BD60AF0AE4EBBB778F7E9@SJ0PR10MB4543.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sJzo5zijQluPsjUs87JJriV8BVz7kyIo+oU/pQq2xO9XksVDcRta2fqklJ43qvBeh+EOCk0s8HWhMuf5R+OdNJOZBaApy8JLvhPl3f1uj4r3JvqNpK//fzhmElvGCWRX7v5bu0FbldWHIIKEB9PfdqpAkGGpbShbBA1dg/qmcXYn774C74Sy/rnRn7MfboDxaraXTxS0qSFb//pxyyz45EjLl+rNPHVYbEmYGVwN/iUgOmPo8TFLSHgIeCk16Q7XImk26ik7eGo/jS8B3Kon0P53FEv6YUtk8IPFa7011gGDtM6bpvRnwUVzjW2PygPzOeedinpbyhwQpmipdDidlQWVCTzAjHArsy1K7cVfblrVDRvFiqnzcvd0sB3ACCNYtOcYPPXtpq4osxhCYxM9W9m2BSV+e6L+pFDdM3KZci5r2rqaUGqlAopgXGPRm8qxD5G/3pKJqmhS6b8PNaGUGQnHvdWihEwD6+FQdyxrLMVOsxSgbaKkvMJAyyP3RtUJxc9nHgc4K8j1dmhMW+UkQqV9s7/fbmiMzUof5RBo5zEvlYXZq22f0UGO6f6Ydd+NYjF4A8KkfWS3IAMwvnUPPUWbNVzm6fLo04p2YUAOqyZVU+rNT3fqhEt8GvPxDXa/3kei3NUeOGCiLBpxSOCTlVkNoB32gaDplL97Y4nXRzTqvwQV6uL+ID4Y25Dsu6UBwEh22E6tH1AyPfkSRcnnQkuQofA3NftE0lMR7541sEo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(66476007)(16526019)(186003)(66946007)(66556008)(4326008)(38100700001)(26005)(1076003)(36756003)(2906002)(8676002)(6666004)(478600001)(5660300002)(8936002)(6916009)(6486002)(52116002)(107886003)(316002)(6506007)(2616005)(956004)(6512007)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?bFEfKZDkeBaqaDv49xRuQRRri+K2ktoLjX7PsSze9nGWxZs7K/WTS2mVgIKh?=
 =?us-ascii?Q?uT6aczGw69WFet4k4bLSlWkxeXPV9tKp6qyj0CH1fwA9thMwy6wHJUfbW8ls?=
 =?us-ascii?Q?fIY6KjGzRAsr5R0DPZKs3ktnapekxCDLu3HFMRGcHatoALfoP+KTn3IPLWy+?=
 =?us-ascii?Q?l/MLdmUUdwjDehl/BmQK/XshpT1BesD83eb2auu94GAbRL2LF2DBUwTMYTa+?=
 =?us-ascii?Q?Jm13zv2ipTdOLbUrzZWhyL8cyDR7UfRHJMlFw+HqOLlIuYq4O01G0Wvfc7NU?=
 =?us-ascii?Q?HxoDhvVKwEhQ4YVc9OlAfdfZPd4NkARSRDqa3SwoM0OahEJEjrW0eeJMlqAS?=
 =?us-ascii?Q?nH5DaoRmlIeCRaXjeMmCG7P4wIGRsq/kJA14l8KA/kaS26zFgSvewCfvw6mt?=
 =?us-ascii?Q?FM6xp9JBlXqnU3Bs0rcSYdcZFf8U4iz96C4CkWl6T+Vy3Gnp63n/Y7LZXZ8A?=
 =?us-ascii?Q?+KBfC7oyHktXgW5j4jKjD5UjUK8B5r5wL5t9JrKmNBNhRORLfgWEVavZ6CDj?=
 =?us-ascii?Q?OEvgNXgnr2kL6ZdQRhgGgKm8rJissVD4sHep3oXH+QG3VM5k8+AkZXYVwDhK?=
 =?us-ascii?Q?LzB7ll9uLkWHccQRJJupXXHRa+4mr+DAHkNPc5wC9yiF+RA85UQGHK9xuImn?=
 =?us-ascii?Q?hNUimZXbv6ryZP2/+sxwPsYlDYljNJQG9uuBtNbcNp2TBa7LVx3rEM5U4aW9?=
 =?us-ascii?Q?9IAWUoZuudcfXMGwUPsuoEVqePwR6vfjoDH8lmabk0i3pIBbfvkW+Zz25CHy?=
 =?us-ascii?Q?11qtkkIh9Wpr7k5t/WieAReHmYo8Nu+KzWhjwK9ZvUiJew2pd+WJy/vlvPKt?=
 =?us-ascii?Q?e2RB4RHuFEM6Tl/vDWPX+z6CysGbr+9lImWiMZ9qPonFnWEm2cqft+OnLJzX?=
 =?us-ascii?Q?X8l7bi7VcXAvDZfXJYcrghg08hvdBTfHWTBfVwFMcCvrwuIe2Q34LaA2fK0f?=
 =?us-ascii?Q?A0sbuBcfnw4r56an0FFCCAM8Qm15i6aqx0sOy++1fFK+i8xVb1XcqeNRRPnN?=
 =?us-ascii?Q?76f5t9B9PPAY20+dzKjMDS1BjR7T5rCr6it0fRUJ86oozml8ffz+M0htfYAA?=
 =?us-ascii?Q?Xb4z7ld7NIAnvfs5rFCnFyJI4PqfEoR/7WdR5s6Thbl+GGz0MYt5f1VImSlJ?=
 =?us-ascii?Q?umtSODgecprxFT5sYcsKEnpAv6aFZ6BxhcbCQEkuQ45kEF//NroBhjoycsWF?=
 =?us-ascii?Q?ybjYTD0FHngZ53k6yQH/DqqeZpemKrp6kw5oZQLMzFQwzu4jQ4sVJhsXx04v?=
 =?us-ascii?Q?bbUp/y69L8VAdPwZg3wHneg+GWG+Mjfbs/601PdX8Ga0lBSaheZiiJ+jndQi?=
 =?us-ascii?Q?fa9aD5alJkNHZTqZESMVlFqC?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15154ed-a081-4574-96b5-08d8f267fc9b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 04:06:10.8202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtNSBJAitOkUS/Z4owQwUFgsrnzKrjLwdR7g6yk2GRlPWS0dK2dQ4EfWOMaKtW3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-BESS-ID: 1616990750-102250-5772-63330-5
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.70.109
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231167 [from 
	cloudscan22-95.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ben Gampe <bgampe@digi.com>

Add recipe for python3-uvicorn: a lightning-fast ASGI server

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb   |  1 +
 .../python/python3-uvicorn_0.13.4.bb            | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index bf270df46..45f93b6dd 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -427,6 +427,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-unidiff \
     python3-uritemplate \
     python3-urllib3 \
+    python3-uvicorn \
     python3-uvloop \
     python3-vcversioner \
     python3-versiontools \
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
new file mode 100644
index 000000000..e04dac0a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The lightning-fast ASGI server"
+HOMEPAGE = "https://www.uvicorn.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=206119e27d6b034e7ce70d73063c82a8"
+RDEPENDS_${PN} = "\
+    python3-click \
+    python3-h11 \
+    python3-httptools \
+    python3-typing \
+    python3-uvloop \
+    python3-websockets \
+    python3-wsproto \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "3292251b3c7978e8e4a7868f4baf7f7f7bb7e40c759ecc125c37e99cdea34202"
-- 
2.25.1

