Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web08.17057.1616990923458364414
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=dsqKXalF;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171]) by mx-outbound42-72.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 04:08:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab28pgZlJ56vNX5VNlRnmGrVQUonhfpHXQuqR6L+Ye2aBL+37FSWU39uj6+x8mMXKFsL++xlZAqDzeDZ+BBGM6ctdBq1kMRiEiCQYKnBaOc7m7gHRJ+ToQpJjwIjSCZEGq4SFU9l+MbhCrxs01ul1mEKxnFeF5aXkUqPFUEcDGs2yHpbxiaB8lzxiL2yA4/GuwX6UHoqKWcnyuSK9GabWHZha1PHLDZfsZxzT0knT4UUSAsTG//362i7gZOImN5H46YVZcQKOTa5Y9B/3jVFNhiqpcXPDKtfxi5w2/qFVSD5Z63ZjpRq9yotpDCbIxCeOjBbnzfknyGX1+DgQLzhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSy/53I90+xnr+stAkt868UyhvD1LgOms2Y54LGEt6U=;
 b=bcG+OAPKVhxyNSoKpOO6EJ9Imp3Qka600Pis3Pn/YWPsNQwcDrEGZB/TfdnGcURv8HMEKzZMHQnHHa1Gs29/u7Ac7zH9tbpCdh5cIvWOPhUUij16KXnlculcGZJ3HVj4EPbPXK4lEkrPGXHIeCkACVD4WVO62+4LNEFScZdTPa/NcFr5B6EPomebor+88OZH50m4cnPSmIIEUEB60NyDXfe80KSUffXwYvYzq8qBMhWU3AP3FGjMx60VLhXCOnKrdWDqXUsp8NSLM/3nd0zIjzV7H6HpuDcRVMt9COg1KOI+2v/Bzl/KSCZFqYTfE7gXjvCRRfBQjuW/HSGECPCueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSy/53I90+xnr+stAkt868UyhvD1LgOms2Y54LGEt6U=;
 b=dsqKXalFsQlQhLJrlz3frlbrbvo72aR4JNliKH4w8ZBefxD0gCDmwEWWbSh7vIJbkjSZNslhYRtuD90a3Y15jE1XxbwSpS2ojkBVvAs5NCHKBD0ToZBMQhEZYcF/INHU5XKhhsM9ZTbbis2ORDqiPhjOptKpBEA+b24+fIpuY6w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB4102.namprd10.prod.outlook.com (2603:10b6:a03:129::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 04:08:39 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:08:39 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v3 1/3] python3-starlette: new package
Date: Mon, 29 Mar 2021 14:08:05 +1000
Message-Id: <20210329040807.2600673-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [49.197.127.171]
X-ClientProxiedBy: SY6PR01CA0088.ausprd01.prod.outlook.com
 (2603:10c6:10:110::21) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (49.197.127.171) by SY6PR01CA0088.ausprd01.prod.outlook.com (2603:10c6:10:110::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 04:08:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 795ddc2b-514a-4ee9-b04c-08d8f2685568
X-MS-TrafficTypeDiagnostic: BYAPR10MB4102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB4102800B1DD9AD62C2DB76F88F7E9@BYAPR10MB4102.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OzPiYqDx3AFC1r1ORN2ENNvVWD0p5oBd6iUtDQrwX8D4V70a+K1r40O6KbA2cGaFL0ppLtk6sdfcGgX83Z26rOS0LhEX0ToxObdX85184+md9DK96hSTGiAI0g+T2oib2M0YIo/CcbbSG+d50aVgcBGzsXa3jeJC4wOM78mC8rPoPorx51mg9VdxrOVpuJEtwdv/9cX1mQoszl6FoGyBJdI0d7/Bcr6agHrcxq1pMBOyJvUeVeUr7MaWeUee5/oDwBGjLHMsrwBzjM2woOeStPANrrQ5TpFjJqSKsJg9dnbAm6noLslUQ9bTuVrAwIiglhIQ5LvMJPngFUi9wAAABeD8o8izI6Z8f1cD/G3ZJ3vztc1HlqX/wj1k+vRTjtA03vECezJdvL5uJSSEDZdDH+H4o4MG3A6ft83cIihbf+phwxgiPtpyIn13XPiub/HFzwta/+p6S3lK2uL3B0rzbg6xIBtRjjH8rqc3755vioiY9s2YPiu2WQVeJIL8klcUH8RkWs5lE07pFL1KnC/3S60zIQk7U5cXwDBfmcus1N4IAyCdFnfuOFS3q03KW2TFN8IV7cY8nNi3ew1PxqSXM43Zfv048egDRkXbSz8SyJiB504fF2jmTVqbvswMDVW0XE579JVDV1Q2KHtBZgjFN/y01o+ry9tEnZE87y6Otq4/CFKeBbmX9fkz/YgqRx46s8/JlYAy76waJcja0ipk0klUhZ3ySWs5rRuAx+3GUTw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(5660300002)(6512007)(6486002)(6916009)(316002)(52116002)(2906002)(6506007)(8936002)(66476007)(38100700001)(66946007)(66556008)(36756003)(4326008)(956004)(186003)(16526019)(107886003)(1076003)(2616005)(9686003)(26005)(8676002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mcrGil+O3Y4erHsdKe/XdShT1+g1s6GDEe1WHQtdXe/0aZXJgKdHmSrooBE4?=
 =?us-ascii?Q?CWt+Bee1RX7GuWl5d629LON3ZT/nTbADaLZn+pkSefRY2DeWAsbmL7XoQC/n?=
 =?us-ascii?Q?IA0UJsCJho/YkWo9BUE72eT3Mhl1h+Q6zSB0F7jIEznj+v7iLg3chhnlN1BF?=
 =?us-ascii?Q?T+MM1b83YAy425jCWiLNKlyRoPSrDoNWMl9UAqoBllVoI8IuG0BUoqui6YEx?=
 =?us-ascii?Q?vN59LT5Vqm3UsMLC+28IGxPzPsZ7Syh5vV0pYo3f7+rPZHBcaQ/khhloySAI?=
 =?us-ascii?Q?/qrjfWurfaBE2bMvqUZC/CGWyJ9tG9EbptWbvfIUzOt4kNbV0l1x+vP0vSfg?=
 =?us-ascii?Q?RvYEPdfodX/w3PJ/XItWZ+vIuTlfxoG41DgaBalPAF6DlS3IBnUL2Fne/GV1?=
 =?us-ascii?Q?M6w9G9vkSkQSqeg8HMX4krxnmlTjUzQ7j8PiEMOBu9DnXL8TdBx/Mpqap9wb?=
 =?us-ascii?Q?Zxrl2LLQCct39RUcS/gCQQRBlvMzjrpkXbrmBeVqUMsz2iEqRYu4nFpD0Htm?=
 =?us-ascii?Q?HhKg0rQqUHUjRpanqD92dZ9WyoaDnaiOcoGoe6mzSenZCf7urL3fH5w1RVya?=
 =?us-ascii?Q?8feUDtr/Ld4SUUElN/786NW7nuV0UxLuAAC9ADqMRX1i1tGmnvU1pLjFY7bT?=
 =?us-ascii?Q?8HoWlDQGDoUQcrbruVMrxVEFt9iWoswxP3iR2N22l/rXvZOhs5nu9FKJWDk4?=
 =?us-ascii?Q?Cf2zkgr8ChMkPzXICxIKy+GzMwfYv/HzR7tT5NqrOzN3EXNMz8M6GLhp23Rw?=
 =?us-ascii?Q?n4KiiA9NX0bsK0BXS6zHomM5vfx2SXjJpVx2mkOJTG0t3VNFXk2s2kapYKag?=
 =?us-ascii?Q?joe3OK6c0jG9vGJo0De31rzHF5ystMVZwqd0N8S7/OoihtnV9cxARwVyxE+a?=
 =?us-ascii?Q?o5DZP02toOwZkUG/55wWS/5cYSX3F/9HwU2Wcxa1ZPDMbbLvlbQm/CCDJwQI?=
 =?us-ascii?Q?YnzHiiYPwI5Nay6av1zCpGqN0OJzUH4kc7BI0Fk/eakG7A76zK9b0Qnon/uL?=
 =?us-ascii?Q?NQBBv/AcAk6PmMQUs/WuIAQ3c39tBryF0LPhqFjaDS/kI9bXNiHE/dsJIgb/?=
 =?us-ascii?Q?QLDInIokLHAU52y5jV6pCQ3HLyy8mTRzOYH9NerVTeIV2w8VdxtpsqKKsTrW?=
 =?us-ascii?Q?2ZFK1F9j+8smFwZv2fDvB/cIk5k47F4E9cPvy/f/yv3V6JZ3YS2cUleUirp/?=
 =?us-ascii?Q?BGhPT66A0ewuaA2LNrDX1jOOavvrNIDii8v1OhQX6N24uNU2w6W0ItYBD769?=
 =?us-ascii?Q?/r6wR6bNCj3at3lbxgLSNlwP+5pEi8xbpwVMz/YShsq5kO+/I2pz/bChm2J1?=
 =?us-ascii?Q?r2ijSV6Ffp6pzYTIRpw8XgNS?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795ddc2b-514a-4ee9-b04c-08d8f2685568
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 04:08:39.8049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12q/qcOfK5qsMeFT5Bp66Np+NdM2vy1Yl1PKXTLiSZXn8cnhOaQbay/7fCraMYxA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4102
X-BESS-ID: 1616990921-110824-5438-61556-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.171
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231167 [from 
	cloudscan22-232.us-east-2b.ess.aws.cudaops.com]
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

Add recipe for python3-starlette: the little ASGI library that
shines

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb             | 1 +
 .../recipes-devtools/python/python3-starlette_0.13.6.bb   | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e84bf225e..fd78ee0a2 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -391,6 +391,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-sqlalchemy \
     python3-sqlparse \
     python3-sqlsoup \
+    python3-starlette \
     python3-stevedore \
     python3-strict-rfc3339 \
     python3-supervisor \
diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb b/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb
new file mode 100644
index 000000000..2e4b01b74
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb
@@ -0,0 +1,8 @@
+SUMMARY = "The little ASGI library that shines"
+HOMEPAGE = "https://www.starlette.io/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "ebe8ee08d9be96a3c9f31b2cb2a24dbdf845247b745664bd8a3f9bd0c977fdbc"
-- 
2.25.1

