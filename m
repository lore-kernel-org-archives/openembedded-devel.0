Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.293.1585090151533401776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=KL0JAVqv;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT8dZRasbAsqdRmmXF9FSE1MJ/cKhoDV4A411Zxtz0goWiLGRpTG8xHomiz2UuuNJFXhGhNQFAd7lLtlEriqM4mSNmu0nuCynu4Z7S7Vy6pp5qxFcOnK3wWquk4mGTiY8AoeAuKJds9hu2iJ7qPZMhUV7+PIsL4pTQ4KwUhzfojH8rpkig5lzvOeypH2Sx8/LFVqk1xBdg6fVis7M6eaaVk6CM7IXukUIs3HnZr2wbAL4SpLTkmMt6neqWlJVt4+eBsRNT5pPEevVJJ4zTrNpfLE06rNMfnujvprOvEwKQAYG2xrQYVIO1K01doAxX6AwnupVhpMt/vK4aydbR6hjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhxl2DUjf+gUVuqsSckoCr2vhz1EVUboEEC3UaGXT4o=;
 b=dhzkx2s7nVb4S9a8AhvWxFTaPDwQFzqNBzFc8ltQXGlSaEM+e4LhBF+6FmZrPSsNRae8bLxmjK4k2bq7GzPUnUXgTzfRZ91Bk4rddKTSg1EhPDyOYyIcimv/0l3qKcyLKdjUOdATb1dt+Tx3Al2CSwQ04NO5KleHvfZB6lKEAAWm3D6jEKJLpDNl3hEjoFQPaNqTYZGEUFqAhitfmJWoXIprpm/rcNfnraosZJ6y2R+VBLNIwoYexbNltHWWsfnhQrsnQBhzbG7Gxy76pgH3T/l04wKa6SXnqMGjZ1dl7yrbn2HhYDf7RQ1C6QCORHK7AMKFJdd4+j42L1pZvvMcyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhxl2DUjf+gUVuqsSckoCr2vhz1EVUboEEC3UaGXT4o=;
 b=KL0JAVqv9wwmDukELggEhy15bf1ijvnAwtH/UHtrZNOWhy5sRkaQRrz2GWwTkkHmulvdM+59N5sMbQ5CN9rH/1CP2m9drd6Z2hK8JsEuDjKXbDUphV1ZVpoBebr3ZOFKq2Gk9Gf+cYfMI0SQQE1QoUXy4m268bh9G5yB0MXakIs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:10 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:10 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 08/17] python3-typeguard: add recipe for 2.7.1
Date: Tue, 24 Mar 2020 15:48:34 -0700
Message-ID: <20200324224843.752394-9-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:10 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 494252d7-2b4c-47f9-0130-08d7d0459126
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB216922DFC69CD32FD164693DABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+909B8Lph0j9i6EIq+JRZKQo8ui188uImLaYHAmR/vp+W1dC6qg5pxDew878pslKTuNtbpS/qnsW2/hONDgS6I79zhNYyKC2mGe0SacBQIJ8Tyc71bBlrd2lW6xb7C3pc/dwQIDB8vizReRgV0tna+eW5GgAW+YW88Alb1gyQfIlwVyNFCTqXbRJD7HnpxkIbsAFRruJqqldkvmUjhGV1u8HDZzbejTrn+bomljMmiJvxHwnZ8xlmVpH7L6koTVcuVj4sqyZyrW1f8ez22o5rkzgSYwUoow+NguurCG+WxzDrgS15UjGvDtufu4DFl/TaxqRAPcN2zBjBb3BYRX7QBguWPTfKQNDAq+78jGRTIcEE5xB2b4FN0ueI94BklwDXRHZAgzcV7VN1mGRouq3RPWt7IgD/dnQS+yaGey+kO5OVqCq/MLTdtzDnXY6AtCJLpTGXVIBughF4G7u+Ni3unJ/GybCW3MciIztFxYt8Ed+zTyqWO4elpJCnIvk2CNdtYEtX0OlrjW0TAMRQeqRtQ==
X-MS-Exchange-AntiSpam-MessageData: 
	VOg3xP7+eLfXvTewt/teSzLfa19fpwI9pByKSEEeV0J9q/JZMl4zyC/nyHzGt2Pnw2SaVncTSun6b1TEHkGMuThhl74H39mNJl9PlyrNoxPO9G5gHFnIFjnnva9FXwrO4lioQgr+csDeRngMzrWnDA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494252d7-2b4c-47f9-0130-08d7d0459126
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:10.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDtlzqzqa3Rd9E+uj9gnIO34uW+sUICSM+gh6MYt4ICpLODivhsrKZiWQ9NATNq+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-typeguard_2.7.1.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-typeguard_2=
.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb=
 b/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb
new file mode 100644
index 000000000..b62b60564
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Run-time type checker for Python"
+HOMEPAGE =3D "https://pypi.org/project/typeguard/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df0e423eea5c91e7aa21bdb70184b3e5=
3"
+
+SRC_URI[md5sum] =3D "ef743359de59f8fe17e7c5e3af70e2c5"
+SRC_URI[sha256sum] =3D "2d545c71e9439c21bcd7c28f5f55b3606e6106f7031ab58375=
656a1aed483ef2"
+
+inherit pypi setuptools3
+
+DEPENDS +=3D "\
+    python3-distutils-extra-native \
+    python3-setuptools-scm-native \
+"
+
+RDEPENDS_${PN} +=3D "python3-typing"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

