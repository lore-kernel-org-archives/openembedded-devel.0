Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web08.17044.1616990775956928641
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=IZvgdzBa;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109]) by mx-outbound8-202.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 04:05:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqDSmPVf7zNKzzXZrrxu2rLwks8yBYKMq80J11KTpx4t/Ni/9gr+wJ6EUVNAIFjPY7YIMw3ApiFCydlMPC+miJIlBVKKBasVnVgbXKEL74+Fl0KestP9f1IMQlo18UgwvoY17BWQNrFkCO1ewe9kWgU0avSFTUeb+91unOs28p6g1Lvt7E0j4En2uzIKVuccKMZGIsDEDXGCq9lJ3DJ7cmbtgoPTy6ZU08XdjyFGIJIKYQdZHZ1zYip2XK2y6MAxisgTlfuzVAp38YOfzvfWXwHoiW6HmyrTZu/nqJK26MbYXIOGU6DRAMQ7vZMOdwBh6ZoMMj3ucDystMNxYgVLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILYityDzUmu5TMf8MNpZFfOzLK/5et0KI05lpnh/2yk=;
 b=jynH0hxgPBuZMLSEw9FlZHLijQ3ymZUr2Isx8qxpM7mLzOhFiX8AZQzDOjom6qBT+Cm/oAji2RGf3PmaiqYrs1BX1t2bwyF1C0a3aDvvyLZ/QycUwzWz8HDIVnOglKzJF/joC/zDJ+gWms/QTWK7hoexfMIUUGjeH3Ph/IyCk816CFzb5SSRC/EBTq8crAAdGKWYazCs7u9DqOOdEOxps5lLNcNR7Xq84i/DeP1eKb3DBuNfcrvExyjLCrtNb27FSXRhYFNPIKAI7TPWwWOUy16JItWMba1c1hHSnXcG5gDWq/wfrObCZ0881835baK7Uxoa4oe+Er6Tyasw7lS4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILYityDzUmu5TMf8MNpZFfOzLK/5et0KI05lpnh/2yk=;
 b=IZvgdzBaNKg604Hj9Mz6FvjAU06ciXzk+lV3acPiNJm0SK1o1maww51RdPHbRDqLi26LugZINOMUVy2Evc5dDly4hVSD9LGC5O7BLFARKKx1yUKJlpJcos3ya7IW3oilJd2jAHqlH/25MjIjPsZlzGsw/uE8YKBbA5m2IvveFGQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 04:05:48 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:05:48 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v3 1/5] python3-h11: new package
Date: Mon, 29 Mar 2021 14:04:35 +1000
Message-Id: <20210329040439.2600056-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [49.197.127.171]
X-ClientProxiedBy: SY6PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::10) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (49.197.127.171) by SY6PR01CA0005.ausprd01.prod.outlook.com (2603:10c6:10:e8::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Mon, 29 Mar 2021 04:05:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d8a2873-948b-421f-65b0-08d8f267ef69
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB454301977B6A2414BAEE0AC88F7E9@SJ0PR10MB4543.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eyZL9MYzYdCF4CuuoK54j7xaV8ZO6zaXOSneYookrAkSh/UP4r33Xd/U2R+0KmWAZUUc2ftK3vnBFPBMWNLguVIu6tL2/JZFPCxTQGFSIWAIt87HZMPlwQAAQjKf8VnNwiOqW3ZVDTGGy3F5e7qWO9UhGFietJuQ1RJ7l6gDeMUlcbKN37MQONVIR6MxemjuZoEAVJa30ce8omBIu2lyKh2TLbAzvaMZ7LOqt+ogzSxYB7QbmG1Yjdi2VbScI44W0qa9em3ZTwv63lSbCJjWaR5A8hCBB01wsFUeCet2bqMgXGyXZu8nlOFjFyfZGc9Vap7d9o1C34cTogTzifm70UG5jgtDbQ4yUWQZAYn8gbfSLGZJUWVbG+69sbnhv8Nhqeaxr3m5it3gdOcWcZqkLH0dafcEJxYCxXSDpH9ogRvNQqcZG000UJZn2xZVTuPOxgfmb5/4BBOnAHq6hILxsEGUq6sHVP0GpqpCjZNsROyP+X17A+vZIQMJ8YHxH/Qj6XNdYFCN1bi95Z1Agx7/Vs4RrKjAjL0SgFjtzkY1pqpuvoiO1d8v24bX3ZrbwSb+mMUgsMSkD74O0ZGnGUbaWCntLDHz1tNdmui2K+PGI9aB7nJgWc0HexIa16wmtZ2RZSHSnTXqrgLqXZRZZsAN2jsdN+Xf+egx77izD7ElOt776kE2TIyTS+wrtgWvb7GSTPKe2wLIgvnQFTlOP9IyBX+aQ6YTN9g3K7RqLdKCai8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(66476007)(16526019)(186003)(66946007)(66556008)(4326008)(38100700001)(26005)(1076003)(36756003)(2906002)(8676002)(6666004)(478600001)(5660300002)(8936002)(6916009)(6486002)(52116002)(107886003)(316002)(6506007)(2616005)(956004)(6512007)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qwwZNdPYFPZp01FtN8e7Btv8k7EE4zrONoHOciil1USApyX75QfSDGugaO7w?=
 =?us-ascii?Q?J7YXUgBKNJgLrYXM56fqxeOCS68mt9crVuQGn4d/64DGsxpbz1TRV7PrYOtI?=
 =?us-ascii?Q?uVcNMYMYtFFggVRsLM6XExvmFzWxb6JKUJVMUw4j4b+XQQjN+sIdAZCTKIob?=
 =?us-ascii?Q?8LyrYok6RCQSejpcc21seiON96MBhsKUi3LsjkHsq1bUS+CUhEjGGbjtmN53?=
 =?us-ascii?Q?upsdZqfBiOKK94RsnCRsBL5irxLhDfC6kCCZ8YsR9t2+pWwQWXJ9OKrqtZRX?=
 =?us-ascii?Q?tRm+pu2HNZlo46I18AIYL5p4Bc/Ceb6DBMEWc/ZRM3JJb3a4DxD4by0uu8T4?=
 =?us-ascii?Q?hN0iV+zNwGQ4IVu+16GISfxJLhT0TJSO/Y1vsYo6TX0NzNUmkgU0+NKM+MWM?=
 =?us-ascii?Q?/0QpR9ksPbYvaTWQJsdFlrnsvFeSW0PFe0sC5dtxmLpvqqfwgnULaxwcWj6t?=
 =?us-ascii?Q?710Fz1TYC7WtG7rg4YSh4ez0/CD3EczdlPtvK43qlV/SyJzq+royd3YXIqb6?=
 =?us-ascii?Q?KGh2nCCIdzyFyFwHuOEuh4urMS2HAQgdE5gFfzj6hzUgJUuyxCHXDVgaVPAh?=
 =?us-ascii?Q?cmPTCyBBdq1S/7u7xz4FwU7Q/m8txDbY8pZiEAfqZYLfmtcgYfZfEyrxaD6n?=
 =?us-ascii?Q?dpCYaOnf4UpLUfyvFx2sY0glNx0zBJnbLAShJlhfaIBkVocSy4lCnqX6U7T3?=
 =?us-ascii?Q?1SyX7uhILwtwH0DES1Bpqg+O5qaYeRaWVxgIAG3bwjTK52O2T95gzuV6sad2?=
 =?us-ascii?Q?IQx56+ihcJ2XVJgW3ju4QhsqzKUSLSAl7gu1DFwgHdP+7zWoS5n7SIElj17X?=
 =?us-ascii?Q?ryCDwJMo+iGvKbfjlJIV9XHU83dwmRCfdYem4oQunnd5OuZV7ieoOSBA7Hoq?=
 =?us-ascii?Q?SCEELKn1lzY8LOn23L8V4/qVKrFGdZxSbZVhZCOicX1LJlqZlvC/XjbjQzQG?=
 =?us-ascii?Q?k8W5tPcAPG7xBxRd83Cs0piSkxWCKybAEasnH8lySU7n8VRCCltUU6CRw3lI?=
 =?us-ascii?Q?Imes9TFB0b8eafx68gIAWTxmu7T3NxXV4ic/yny/fu7Bnv9XJpu02uN0PfAs?=
 =?us-ascii?Q?V7qy3LktvuLS87naC/VL+/2M73uQ0+jnTq25gs3zO0QUWxtuH3x0wbAUt0ui?=
 =?us-ascii?Q?5EiMRQa8v68kHSfB9aD0s2/dfaxObgx3//QpxqRU7dp85qZCLSjPl5odsS6T?=
 =?us-ascii?Q?Y2WlYT1pasWnILNO5exeVQO6R5jeaKh4gzdxQjp6Awo06LF4lqPN9hjfyiAw?=
 =?us-ascii?Q?7Ox1kukgokMweqcbK77lUbd9ZpTNx8BT8rvpd9damr0XcXzuUtu+VcshM7G4?=
 =?us-ascii?Q?T8xqCv1ICrJcxBEpINhsJd4G?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8a2873-948b-421f-65b0-08d8f267ef69
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 04:05:48.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GK/ISFWai6n7zdwJWgg55ExQHw9Og1N+HJOH1S21BJF2NK0x3hjke39y484j7Aep
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-BESS-ID: 1616990750-102250-5772-63330-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.70.109
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231167 [from 
	cloudscan11-97.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ben Gampe <bgampe@digi.com>

Add recipe for python3-h11: a pure-Python, bring-your-own-I/O
implementation of HTTP/1.1

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb             | 1 +
 meta-python/recipes-devtools/python/python3-h11_0.12.0.bb | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h11_0.12.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e84bf225e..0418b5930 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -153,6 +153,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-grpcio-tools \
     python3-gsocketpool \
     python3-gunicorn \
+    python3-h11 \
     python3-h2 \
     python3-h5py \
     python3-haversine \
diff --git a/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb
new file mode 100644
index 000000000..4cd0d4de7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A pure-Python, bring-your-own-I/O implementation of HTTP/1.1"
+HOMEPAGE = "https://github.com/python-hyper/h11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f5501d19c3116f4aaeef89369f458693"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "47222cb6067e4a307d535814917cd98fd0a57b6788ce715755fa2b6c28b56042"
-- 
2.25.1

