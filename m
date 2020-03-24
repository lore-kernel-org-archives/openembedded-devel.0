Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.293.1585090151533401776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=EFSqneUQ;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYc18pmkO4ybhf5BQgo6r4sOIal7IkkoFZidY0BE1pesCqifXMMDtk9rMirB78CpOHF+0wYXgnjbNXGe3SCObdTQtuLeAxS6qzkpeHwOG1tbXBkW6TpkSyZ2aVqoEN00wDQgqEPgMIMKelDG0hKX8tBk5cgxiZ4Afae0SAZCC0nvqyW+FnnuYfXFSO4j7QUVN5MGSVLsVZ+VBpYFWK+RuPiLBwDWpmaGKC6sqb5NjRcfV8lb+3B21UvfWEOpo4fAmUqCbyDzgMQkyavI1+yDIkHxf4fm/Hp+vCNPbsYmI4MUPMkbKTotJhBe62M6URBH1lyxs59TYsYnLNA3QJ0lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMzqJc7/3pFPKD3VfAmx3aUje3wW9aNJLRHBnk3uKmg=;
 b=HYEq6/ixf2+/SHSqfQroHTZZrBVpOps83s0vTUSnY67ekWqcuDVOTzz4Y1pwRDdOYA10mebBdKkFvqXxGbIpdcog4fQmmdsp6U+P8UwLsFuZZNoPGh1YItKNXvsVjfQJmAVQpvgkof9NKsiNWG9ToPDgVppqWPl2uCM6ML7Naqq4SU2z4oW4VJ62JkCVAz61shqYUVsSnCDiGb20XwhjBalSCb8VyvRrJ9HRw6BTeKJznT8djG6WxTMxhn44V9jU/2LHtO2rGkAVnwWiKtUznesXt018vX1DQgcmoY65nqwgr5HlR86Ju4m26pg7uhl4iphg59fdVX0tcCM+KQHU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMzqJc7/3pFPKD3VfAmx3aUje3wW9aNJLRHBnk3uKmg=;
 b=EFSqneUQs7SJQtWFBXRiB6ws+f7Fg9Mr3Na1x0EBGlJGADgFCVqJSggEL8gyuiZ6mxn8fCEJRgn7Yea/iyUHL1y5pVg43Q3Z5JlOry9RC1GfNh/wKGxDtKBG3cSQaJektVa0M5oFruAvodRIJgFdtVFqIt7lX7qeV4zRECCjilg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:11 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:11 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 10/17] python3-geojson: add recipe for 2.5.0
Date: Tue, 24 Mar 2020 15:48:36 -0700
Message-ID: <20200324224843.752394-11-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:11 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45c75a88-af6f-4585-6175-08d7d04591dc
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB21696F7F0F3F97C2B007856FABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(4744005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/uSDK1Ad2Ep4Odu9ylWvGybROzDdm7Kud7M+9ji2cRdLmRwug5u24qPk2VVO7JuMTqkikMBqS1crXd6yNkOSXhRC50/HUFob4RWJQIPhdBvUk7xQvEYdyZP2aWtRIP9/ZD5sbqO2bq5N2S1NXJbGnnPSIsXcXOZh+3D8hdQAWWKVflF2+MeL9hgwFDlpS7o9GboUjV6xar1a4kgj/Zj89oyOUzeqeWOlIn4cfvFA8bT/1o0qS4TAr+KGZCM3ZZHnSEFWKro1RAjvEwHmGltAjvqCJYrZKg/xonRUAl1DgwSSmSXkP6zN3AjXHanXk5HGQkPqHSfr6L0yPKir4AsQqxy76BzAxPfsZTdLf3hW3pe0Ga3k6AituY90W3ezZUajVBVPramwQ+6VjXZWPwVHpnlimzmcPpUjjJx8d9IFcHg0jjcCfbEC1pezH/brxMo16jOEPuOgu49K5pTblQn6DP9KhOft0i8mYvaF5oHTiUdk8w5Iu7+laexXAK/X0M4v0C/qHhuup6ktnKtMeT3tYw==
X-MS-Exchange-AntiSpam-MessageData: 
	+Yn9BY5jGh73BudxhZ0IGkfE6ifPPcGfujOnAKpIZZkPWg3Oy3T/sq5YHCmVI3xMFh4QkLPQbtBy1/5DNZzYKzTEKB+8SLc6VbRZGcrlmVLrTjTlSi3i8kgKDDfP8egcctH1Totqy5kDjratSzVKDQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c75a88-af6f-4585-6175-08d7d04591dc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:11.7412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DVubt5pVoM87QPPOIdpFRMVVTeaRq1DuBoe2g130nB0KnlPizaga7okC5sLgTl0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-geojson_2.5.0.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-geojson_2.5=
.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb b=
/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
new file mode 100644
index 000000000..7c3c23b22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "Python bindings and utilities for GeoJSON"
+HOMEPAGE =3D "https://pypi.org/project/geojson/"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Df48972abe5cddee79e301574742=
ed745"
+
+SRC_URI[md5sum] =3D "14753ed28678828b1de73f68b04e2324"
+SRC_URI[sha256sum] =3D "6e4bb7ace4226a45d9c8c8b1348b3fc43540658359f93c3f7e=
03efa9f15f658a"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "python3-simplejson python3-math"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

