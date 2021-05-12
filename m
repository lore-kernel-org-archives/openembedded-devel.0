Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.272.1620837622448971199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 09:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f69KChm/;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Avyq/lxGxhal0TqCiizVJNyTHU515P5RUIaEVplJriu41GbeEOKuUb6NG1XpEPTCM8e1vcPVARfZ89VkfVFfRH1y+wcVI9xqw9ra3PyI2RlOHB6dSd1cwDjit2oCslxMZ1QakYlaaGLSxAMHb3HfeIqyxNs2gK5PaRzK7y0iQSFC3Rd2C5YPRSO5mE0NG1GWzoJ6tpJEa5fuyIiZjllXIqABNiNGIziBZIR7Hw7PsMTAXXVkmxrWNE2/8ftfGpOeSGazS4h3NeEWI5O8dxzuwoFgjEfJSsjV1vsnqqQMNJPMnOAOfPhqJomRgTWCE6OisPw1QduED5qMO/CKqwnfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfMoriECrczIxM7MyNuEgG342OUO5LRPUcnaMwbuvLU=;
 b=bZp2J8yi6NG7XfDlbsKzLN3nlKaIHEaEeyqz+R0OvzDCGqfzyC6nV35JspyD4U2fy3UZW434iZFAScjDwmrPaDSvTTZ91o7hTsDA8LXPPl3loF8F9j08t64acUQyF5vf+zpKedCT8g6re4mD7NpydKzqzSCYsYUXQkESAk+wV7sekFYMezlZX3mAR4lOrPuyL1UM4/XFwfoj1F2Y8ZcTPRBEXAfUD+Uq/bBvhQwoRHnu3SDT6D5vkFI+EOIVlaEbXVXAEN33Y94/e/G7BcYUbT1r5LcYET10yj7TaIZKPkoriNEpgfS+3pAZtPeA8TkmBOWVRJy2uFxansdYqOGBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfMoriECrczIxM7MyNuEgG342OUO5LRPUcnaMwbuvLU=;
 b=f69KChm/3boJpKU/BXXvuarkJZOrNBCv4pZJkH4pDkH6Q17+mfe84RdDm1WKLGfsvG9SWT/ZMV0X4GD2ChzOYxL9Z1DLpIimUasEkEbna9/HfVEBoET2fanlPy93+9a6InHwm2ftMpEC5Cpx17XpWazLIN/M4qIJEuAqb5SQL64=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 12 May
 2021 16:40:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 16:40:20 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-django: upgrade 2.2.20 -> 2.2.22
Date: Wed, 12 May 2021 12:40:12 -0400
Message-ID: <20210512164013.559912-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY5PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:1d0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 16:40:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a8d745f-41a0-46ef-5d27-08d91564a16f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4815:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48156333C76A50B414DD06A29F529@SJ0PR11MB4815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7urk3WKmbiWHslY4ehjRnKC8mGO5th5757c+YlM3TGnsEgE7wjT4C+8a4nXXhuObLkwkND4UNIAIwxWAdof6ME08/IS+W29WaacmZjvZyrLMldRGpQYDP27NkYr3Go+g/eplHYxXkxpEMZuqRWJ/TgavddmPN4XT8mgTOZWqsebSzb5292lRUMZgtlCGpO9f1/HVo/qiWHGHZM/j49grlIgoWT0hHYnxQ6s7srMckbANfMdhOgZW2GIS9SbFaFNUemyxejEb2wb9vOWTPnnLzdIt3Ty7v0H9KSl3rsIZezOZgWop53NIQ+OighOqTKPkvse/NZxuHJfBUdFp2ba+rIaUb4tweKNc6VLdTMeT7tTLssiMbkZXL2fmI4T9rLL290L96JSM5CRz0nxj6FiS5mKUf6NILSkhtYPEpjrfJpDwYg/WRj8JElVy+8piFYZZo7KdVg2DkyRWOuzt4Zz2NIesG/+aZMaDtdxhukQxk4eMdK4WoZlzlNVrfTGPU1RdcZo8es0o43W0fNmsOblm2Nr6mV5C7wijPIXDaXbV11/Fnm/ANgX2q1CgEw72vPJwwmViv8NWL27f9jofL22PDpBhaCsejfy1sn2tQA+KaGZS7qxqXhF6JW5BXOA6AggwSS3V+WOBjFuUQk3cv0dKtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(6486002)(66556008)(1076003)(66476007)(8936002)(44832011)(2616005)(956004)(66946007)(5660300002)(6916009)(316002)(26005)(52116002)(6512007)(83380400001)(2906002)(478600001)(8676002)(186003)(86362001)(38350700002)(6666004)(36756003)(16526019)(6506007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mfIRDQJ6aX9bVoKRxkp2vL+/MgStMaxh9B+pK265rY/fvAhVFDiqOLLmp7Cg?=
 =?us-ascii?Q?dR0bjcaMZB12h/sGa+Q5JCNDxGVZG0IEGMktPaj4xDBzDdN+o7vgd2VO1JyG?=
 =?us-ascii?Q?l1hrSLua1MZckU1gKL9KextwAyrrbCzLg9ZspwYkZU34aDPkPbq66MsMerhS?=
 =?us-ascii?Q?e4CQ25nDnXTiSBOdVOcyyMzDEr7bzTIp+YVfmJreVGj/Wmtyb/LriRqxC5D4?=
 =?us-ascii?Q?MfsM+id18uXYNfchsDpqGOf451C/f17SnDQkNw7nblIt8cE/ZmZlozzq6yw8?=
 =?us-ascii?Q?KWpBF0zwP8zNyr0gAc7QuBwPokxrDa4MHKFFuOlVLBN4bovASrx3Lh6n0Io9?=
 =?us-ascii?Q?S5m5PGMezpReY8Q+uuvRX8rqUUthhzjdYCiv0BzNrcuOD2IKWa6JXbVT1jx1?=
 =?us-ascii?Q?H3tOEJpeOQFOuW2vmGq0ZfHm+edgLqibtj3Qn8tF/Ite82J/4tacmOPrLXbs?=
 =?us-ascii?Q?C8sFZtKGA+/RHwvbZQdz0wmvcJkfKMuBIGc66c7lwByXMq2CskFC/8pLP6Ue?=
 =?us-ascii?Q?g64siGQGiW0hdWlv6tAlqzKUirt6+P54yGY6qYbKxG7FJ/j4x0q51kXudOQ6?=
 =?us-ascii?Q?dDlpxxwdIBjHa8lxz7UDzOVR0EIHsPqC72j/RNB4VdreD9LBxaCOCKqVXEDs?=
 =?us-ascii?Q?JO5Zc8COdpJ21zsuN2kqXYXM7VeuFK9nsxMEhuMZib6EZRP/LY06OtRlPGz9?=
 =?us-ascii?Q?b8qB2GYe35d6ldOwtEA9Cf1JYynZYq+Lla6ieT5GpVXRqXQVITwZehcThntE?=
 =?us-ascii?Q?VyQcBySOYUvDVrQCDldXay0GWJ/NHylkvJQBEl895XBJRO8U/OFcyJ28C1ED?=
 =?us-ascii?Q?1YV1ASHxDI3vEwytm+IYSbLXsB+gPYaMa3dqZIriViVc8+YvOsJvoDmCEyyF?=
 =?us-ascii?Q?lSgrrS4lc1xBQIDRcPakvkAlM1tfNGlPXe2euOTKrmjjrXHb/er2hxeiu1YX?=
 =?us-ascii?Q?e58wFXBeg1KQSkhW3ZAk2xB1EKJnGFkU9OOYWZjqSuj+FJD58Sx9OjhfzXl8?=
 =?us-ascii?Q?yUdoscNrPgAJXMr/z9bvP3yyffLpttjoA2fSOtss4EPpCoL7zR6iSvp/JTyI?=
 =?us-ascii?Q?DfRoCQSSTIV/cvTDSJVArUbvr2dZf/JKInECODu607STv9OImRcdZ2Egbdyw?=
 =?us-ascii?Q?dsje1B52aR1rDBXb0Ir+8/dTZBfTIvk1d9hUjNJP6yMLrm1/qfQaO1ubz7TA?=
 =?us-ascii?Q?pZIftv98t60Nw+9FQMo+pW/ifCYFBFXRTsN+WqEk5urz37h1JU+U50r8IT3p?=
 =?us-ascii?Q?koB+bC7sJd1ms+D71fUE2hSDHPOOd52o6aMWDQo6GhqTkfPfOxbgeWDwKA8X?=
 =?us-ascii?Q?ndKh162EGjIL7tDJJiL509IH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8d745f-41a0-46ef-5d27-08d91564a16f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 16:40:20.1287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ok6gIM8+AlTzmaUyLai/qsNf6bpag2TRwN8Is2G7Y8qlIo3CFA4CKobcm7kK0mjhOdA7T1Ae78iw6Vn4LF6IiKBfby0rp0sww5saILygz4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Version 2.2.22 includes a fix for CVE-2021-32052.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-django_2.2.20.bb     | 9 ---------
 .../recipes-devtools/python/python3-django_2.2.22.bb     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.=
20.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.=
22.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb b=
/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
deleted file mode 100644
index 905d022a4..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.20.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] =3D "947060d96ccc0a05e8049d839e541b25"
-SRC_URI[sha256sum] =3D "2569f9dc5f8e458a5e988b03d6b7a02bda59b006d6782f4ea0=
fd590ed7336a64"
-
-RDEPENDS_${PN} +=3D "\
-    ${PYTHON_PN}-sqlparse \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.22.bb b=
/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
new file mode 100644
index 000000000..a0b884025
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] =3D "dca447b605dcabd924ac7ba17680cf73"
+SRC_URI[sha256sum] =3D "db2214db1c99017cbd971e58824e6f424375154fe358afc30e=
976f5b99fc6060"
+
+RDEPENDS_${PN} +=3D "\
+    ${PYTHON_PN}-sqlparse \
+"
--=20
2.31.1

