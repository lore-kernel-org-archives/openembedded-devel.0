Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.67])
 by mx.groups.io with SMTP id smtpd.web12.272.1620837622448971199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 09:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kaUkkFw8;
 spf=pass (domain: windriver.com, ip: 40.107.237.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhrknJKTs78HX5/eXf+4Z/4Yx9HIqpvwLVsE91VK5BZcoTCJ19CPJk1ZUM9U8+rY1PDwlVEpxoY5IS3NsCxnGTOdKc9Lv7IjdOfDfdYDRLtJ0fSgoVJc2hhn0oHZIGxWLhM3ZV6WvXsMQcaKYO113L/zxtGakqtc4Ilx7hX2xYamcf+hUemcZXMNs3fA2wd0mgqIYpLntT7QnmkDzMSGqP0N+dG7A3igngmlNuBKsg2IJ2HHTXszrqM8TVDEMk+54B25q/f2QuwMGhOR7Jnltnw6v1XVkKumZjakzc4eow1mzkrFxa0rrdLKupX7YI6bXNl6JpqGtu+Rw+xjvtjexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf53u9q00VU7Me7+JJ32f5XrAaFUXqajAqqf0fC0BE4=;
 b=jHLXZlCLD+KoZ87qrHET03qIEkbMqczPMpOrHtPcUwnapKOK8NT9AkB3LjoM3/VY2O7zSAjONAJrtdTrf/+2So6lnaUWus1Blx8oTa1hWeu7vNLYNOS433giw6gFUgJvCQeupyf53WXFxuGgMXI8PRcuTYQGzFLBPRCe7t0XqIPcUW6too0UWjnlFhScCFyoqgiE6ZzL3Ye/6drCWm6j8jKC7/5tkPx1JIMdnZ+6VxWXNUpB1m7n7fKX0te0mGiBNFGlVNbZP8gKzzN0icwrrmT0YGf06+GpmxerbwxjKNHRv8t+cpkpQUFKZlYi70My+uKb3aUhh/UW+2QOCypQMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf53u9q00VU7Me7+JJ32f5XrAaFUXqajAqqf0fC0BE4=;
 b=kaUkkFw81FQIIJbwYOr5HfwB0oeOKoGrpmmxwbiS1sPoFVAVYPqnfFDXB2ZBoaQM7cpUqc270ZvuWUDcz1q5Wa5ut1udKcuN69Pe9voR/RUQAFti/d2HmhOimNTs+NgvH94s5ed6wO8Rgpaidt9sn2qkXQbHwI0ZPs8nDaY7Okw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 12 May
 2021 16:40:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 16:40:21 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-django: upgrade 3.2 -> 3.2.2
Date: Wed, 12 May 2021 12:40:13 -0400
Message-ID: <20210512164013.559912-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512164013.559912-1-trevor.gamblin@windriver.com>
References: <20210512164013.559912-1-trevor.gamblin@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY5PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:1d0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 16:40:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af8d46b2-e8b7-403d-06bd-08d91564a1e4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4815:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4815D750E4C09BECD28804C69F529@SJ0PR11MB4815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PlDiyxe82AoqcMFa3BPqRxM3ub9r7JUi3SGvhu2a6xAIB1uQkbB3VvJkTZ8/QF23KjWakIoxQuctfwT74Bwgij3/pas8XXGokRFW966pPj0geAQBgERg30wMvw3wMppE/gebpPFaF0ZA1U+31YX0I7wfUfB8i5UiaqrRPpC4lGDVFdLnqdw5l0AQ5sthfKgKSa1X2kckPnPM8Wfoj0PngTm75cIU7v1M/PQhm6rc1ijjs14MPLfBfs/+oLw+9VOmOTnKI90Ce8UsStdlmXaco3+P8UXy0F0UPBmjHV73yGgPJSQNXqQSHE4DyT8fc8b4Q0aiUvHl0PGWSSrv8NJYw3T7BQIrI9Qvg+z3dn7FPSkRIoHMzZIqDJ4nxuJKJ+hCzKzQGhPOzIKZWsaZzu9FA44OCTXNn9KWeDQGTKm0mJ5hsXVjR/21IyzoJ6TsUK3mleCeQAoQA0mM5p9qeeFsWO+x/bE+YIACjDgAXaJeCxaCop92CZQfypKkcHBW0az/JxquBCIOTES62MIZK20loDHpQgB8xUz+kSLm8J6YwpxydUgj3NazyFLdLgcnPe9yGtax+wYLVcqgPz96m1x04wHU0gBv4Z3kWM4xi2lAR57PW8bV2W/U+i1+0ttYe3nblAv/se+eacJ3wod1YOd4vQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(6486002)(66556008)(1076003)(66476007)(8936002)(44832011)(2616005)(956004)(66946007)(5660300002)(6916009)(316002)(26005)(52116002)(6512007)(83380400001)(2906002)(478600001)(8676002)(186003)(86362001)(38350700002)(6666004)(36756003)(16526019)(6506007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?tsRLihinBiBr5//3+V8bLtuzaIJqUeb9gWd3SEqGiQlv8qSENODl4GwuSBdr?=
 =?us-ascii?Q?1mbyk7qw6keX1qo2CdmHcpS2SZPbNv231ur/6mK1vbSEaPPQPx3b2PEdbG2Z?=
 =?us-ascii?Q?d/3cvf1N11Qc6m8K40B2g6Auk5fdhq4RlGS4uc6gJtdU6XAy3+CQ03BsUYeA?=
 =?us-ascii?Q?X6/WrsdeRr+KgPW0X8zrGjXzDVRHVtWxdAZYfxE1GFlhqw43DFIFSyEWZl2Z?=
 =?us-ascii?Q?LZrBE+OP2rOnL9zGF9XcE+v3Phs+AYG4bUCxNmNj/SBmZv1n84QCp7dqjZQ4?=
 =?us-ascii?Q?fjj+FJylGPgvT21aVI8fIjw3FL678QGjfmNWCbaZnfcAC1t5XKVS+YmYvz7k?=
 =?us-ascii?Q?oJ1YB42G6lQalq1n5pipJ3p7U6fE1QJ2vV9UW4Kq9kvxuUccqfrrIL0iX2xn?=
 =?us-ascii?Q?0jKg0N+8bcA9EL9uOJCdWP3LnKYamPlh/b5VSlBO1QCcyTo7R0s+DmZVRrwM?=
 =?us-ascii?Q?pfyhDbkTxuTf0xRH1R4HQik6QuB+gItHNrxLCP4lssdp22DnSuQGMeseLFdA?=
 =?us-ascii?Q?z/i0/LjTpG0RGCJ061gi4Lw5QTksdWJBIxNnV+VArzQ//BXCiuv3TFd8Za0R?=
 =?us-ascii?Q?XIGe83qKOGg//+nbHaFiRXQHB8AA+vm24qf1I5J3jL78K5djzOFJ+rcDxI0b?=
 =?us-ascii?Q?kN+CjcrNaVqJKZXUNmLaxWMh0cKbJckN/1v6uKPzB9TtRQq/sCr0h9jOqQRx?=
 =?us-ascii?Q?/ZP2PGQRQKSfYfEdj8KwkvuR7OduWzX+FmvQOtqz9H16erRzpOYYBccZ8YYE?=
 =?us-ascii?Q?0C/TRDsy2Qq9VMmg7Elh94uSRCrkmoJEPweciPlrw0VxRieaOl9mEHub53/F?=
 =?us-ascii?Q?qv2H4WEvzT5ayJGN/0WNsMYW48jxOvXlRfhvYPqaQhBcu5l2zA1A5zcGk98V?=
 =?us-ascii?Q?G5Ra+Ww0E5qQQ65OQU6xxtHgatD0MShMTFLaciNvHKj/toD+Bz4oBrPTTbY6?=
 =?us-ascii?Q?gVOh4K0jWe43jS6+l08fO473bVfAt56mQpPHAFy2XzcdYTXlBEiENPkMvZOI?=
 =?us-ascii?Q?Ui42DlSADsIk2mONUoWD229KzZsJp4GMZ4LP6q3sdX2OHioUN7dg5m1E9Iom?=
 =?us-ascii?Q?UHt1h+4jdrLlrMzaiu85AzfuZzjXVLNYqr3VvOoDgjPXfk8qtkVTeE4kZQGf?=
 =?us-ascii?Q?HFejY1XXEYd+RlsuelywGKdcE6oZ6nP0IoXCYXrDZPhG0SWMsx+dwCyyKH22?=
 =?us-ascii?Q?6L8S8F2MifmRijjL06dFNU8mkB9leMtlQkhBTvRejMZX3Eb6bULEqxVlgB9Z?=
 =?us-ascii?Q?fY1hHto5f/njhrA68DmjQQDgAiiTfLVB+p2z7b5Xv0leV8OGYHLzXaZDovdM?=
 =?us-ascii?Q?JUANOPR/dBktF0RdsHWcF8cn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8d46b2-e8b7-403d-06bd-08d91564a1e4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 16:40:20.8673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gIwUrBW+Crws7TwjOxXZ7/EnLJrucWgOevwO4Ry4hbxnxRj/tLtJHo6bgbtkuQcGusG3dqpIcDnxwKBSJqCxTiRX90b0+eK1rh5oUtIDrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Version 3.2.2 includes a fix for CVE-2021-32052.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3-django_3.2.bb =3D> python3-django_3.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.bb =3D> pyt=
hon3-django_3.2.2.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.bb b/me=
ta-python/recipes-devtools/python/python3-django_3.2.2.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-django_3.2.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.2.bb
index e147e2f9d..7deac2ca9 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.2.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
=20
-SRC_URI[sha256sum] =3D "21f0f9643722675976004eb683c55d33c05486f94506672df3=
d6a141546f389d"
+SRC_URI[sha256sum] =3D "0a1d195ad65c52bf275b8277b3d49680bd1137a5f55039a806=
f25f6b9752ce3d"
=20
 RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS_${PN} +=3D "\
=20
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch,=20
-# PREFERRED_VERSION_python3-django =3D "3.2" can be added to local.conf
+# PREFERRED_VERSION_python3-django =3D "3.2.2" can be added to local.conf
 DEFAULT_PREFERENCE =3D "-1"
--=20
2.31.1

