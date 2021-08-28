Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web09.4924.1630165494137079886
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 08:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=IQ7sVT+R;
 spf=pass (domain: vaisala.com, ip: 40.107.8.73, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4MG40XYzHy5utXREGdvftXl1Dx2fiBMfmxo0kDv5TMWNKhhsKYxpspNt1e7NIG7NZEUWReopTZiwEhyXvAC9zk2AUKeimEPTjaSLumg37LRHafckaZRjJ+xhSTufNRBJFbVtZPn6EsIOVHxI3B+49/RHHuZ8qWHw0XMS7e45+y8iSS8BYocn/vrI/mKeJVXBQKqLM7EG2lREMk/ZD0kdsM+idhXpeAFHChMwbrKbxpkOoZLSWzTOB5+4M423JkccAEm6yDHjHolAWZss6F8dy4jYzNzUveuhr12ucbQcNgUBuz3vQbZ4l1l9lojYwhCOeh4JWtWlTwCcJui5XxJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRNyHuFTt53kD9VLXpU6Re4NTwR2ZW0+lmwdqWPKCwg=;
 b=F9bx1XL7C6D9cEB0LSKNnzRwECSdpu1UBdv5hPLObAquH/hIaXzCljhUOJhUtA7ABwKXdu5sqY/iC4bhIOoh4xJFGboV0QOYylVXxKDFqGTa8a3Y3SwAQ0h+D5d56iXZnOoK9V1jvtmPjLf8q53RjMoQ4oedwFeynG0Dc9Z5OFg/QrFusJuIUqqy2yoe41ZqDF/RVlYNVMMCsaO3F11xbYnKLTGur2Lj/Y6sNQ687SaJvdXtxTzrGfq69RD8tkt2Ho1gVizeWOGJtvBlQvQ8cmx7Ul5R+Unh43vnzZcK3NMc7kmaKRcPciMZb6uIUnb8VgCj68Iq4BhXTtRkk9+/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRNyHuFTt53kD9VLXpU6Re4NTwR2ZW0+lmwdqWPKCwg=;
 b=IQ7sVT+RfzpAjDFHZHspjXkgUoZGUdAvqhKRKgtnlrFTWLZTOAQpqJamBRf5Scj2YwbJ/xANxX28exfTE3RRsq4Uw8lByo1PiA/QZ7/hHy9arfo7OeIxMO9FyoTI3g6t1LiTkjHAuGkXLml7cFQc1LN4sKablbEhkFnE07IIqUE2RbQRQ2xVwNn+7NpPTdSquGhBFYB5e6RSjHrNqX53PjohUG65CpDL7+ukkzW/aNix45aX6taEbojAK0PcRwDgmxWZb1ZpLHCD0G4ZILUP2f9CYZ03j1SxWpfuhD6wZQGDtZnKlWL0QJbMI/gfFmW0F1okmosR1uf1F5ch8Qlbcg==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0602MB2906.eurprd06.prod.outlook.com (2603:10a6:3:dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 15:44:51 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 15:44:51 +0000
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>
Subject: [meta-python][PATCH v2 2/2] python3-pkcs11: Add recipe for version 0.7.0
Date: Sat, 28 Aug 2021 18:44:30 +0300
Message-ID: <20210828154430.667610-3-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210828154430.667610-1-vesa.jaaskelainen@vaisala.com>
References: <20210828154430.667610-1-vesa.jaaskelainen@vaisala.com>
X-ClientProxiedBy: HE1PR0701CA0062.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::30) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (87.92.181.210) by HE1PR0701CA0062.eurprd07.prod.outlook.com (2603:10a6:3:9e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend Transport; Sat, 28 Aug 2021 15:44:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3614de0b-343e-463d-6043-08d96a3ac5d5
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2906:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB2906B9E1367AE8263023B39EEDC99@HE1PR0602MB2906.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GR7hL0LV9g9c17EwBEjoKexm7eJAIQNMfcknpYVpPzAiDPo+B/zjayW3KgDT0bnZfMMXsbuu71/lnk2btrgK5z3P8kk/rl8qMNepOSmBz1OeQZXM1KhD+opZkaO+fpdma8AgGXcuqtj+eWStmj0AvIZmFGjpm0etA2VwJVuPh+0q+3O9iKk2Brq+ALDRCT/an/rF1eAB5BzfTMt17vs4RNz5kK0Ih8yydaX2/uOwwDRO7fxmrDLxAbnx5JZQgKcqc37mdMrP+nZqyZqfoy05+Pq45CgcRSQaJ4b2F60H82nPNJRoeaCWg9W9zQ/ZTPjf8XgZHkXX7sAwtIcyLcKzCuQ6x7ddBAfi7RKfES18S1nq+pFPEGkUB6rEQngNsbpudKPmrKZxnupLf4vHtD5urnZZ9rVD7BLN6DHo9CcuIbQcGC2KCa67D2Q669TahtX8HJ002/Vxgb+UL08ELx+hfpYns1hVbsDJR7F3PH9JQpu3+/mEsxBZFDlWB1+KSgX8IL8yMQJ+i+dhLZN/70o8z5uPLy2UmPAU1HDLXzRv6j07SHMa3ZyfuQX7HYh7YcFUtctVtZfy4f9bLslqZPQ4NzvE8Y1/5siJ1dVgwTxWGn9JXEZk927KwRhN/kZQxq34l229bfHa8TeIIDTPb114P+ngPMUyubPJ0PP4MYsBTARe6LFYCMRsN8yi6SQ1+JBCc/phznvwNvsw6wfZ+X4m6wg6LcYEbRzNDpEL13F0UtrJ9p1zzJeiQ3uPhgUBjSdaZKid8owA3Wad+opkjnMGbyil5sXRGJ2yUJUiMeZDiXo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(38100700002)(38350700002)(86362001)(2616005)(6512007)(6486002)(5660300002)(8676002)(66476007)(66946007)(52116002)(66556008)(36756003)(316002)(26005)(6506007)(956004)(6916009)(186003)(107886003)(1076003)(2906002)(8936002)(478600001)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3SKxEa6mXyj9vm9wM+VoM8Wq2uJUtiw1NSYcJBj+pNN97dvFXgX+HFqI5DUn?=
 =?us-ascii?Q?C1qkXqM5WF1p+pRn76iQyxb3FOVqLeKbYPk6jQQQ2j4uguq51UkN2y11OgrM?=
 =?us-ascii?Q?w6OD1VvpcuWB21w8XUAj+bncML48eTDMf/BLU7SyjsfrkiQpZtfiFfCJ4AW6?=
 =?us-ascii?Q?avc6GO4uwg9GH0lzgN7uoZf61o+tntQQ3XDQT+LTYd8jB8E9mc6gv/lu7lQi?=
 =?us-ascii?Q?IGQMd92rFtNMR2cU+Lgf1LBdY4TMMJkcO/0szfDgBm5fzvK4U2kEp6aj9tT6?=
 =?us-ascii?Q?Hezq3vbJSVnZH5EI4OhtJVmIbsx3Km1M8gezrp/oCfdQzS1Qp6X1ZrouOc+I?=
 =?us-ascii?Q?anT1/GXv/nfFWfwrCbhsJ6jxZh/9gIZSqoz8W8tHnFVOf+fxQYW/VJFuszPr?=
 =?us-ascii?Q?s90MW1IEpDIA/cn0Z/rB/fTF8mu5HEB6RYWwU5jHjXK04Jwbz+Ru5tCY1i/v?=
 =?us-ascii?Q?8xVpYmsVO4MzvO4De5Vtk4SHmDR0JLCuyWY3SHgReGc7FLB+qTP/nQIlp8Af?=
 =?us-ascii?Q?/RU/rQx895h+GvZb+YMzekrBs/DyTlpN71DMfXRuPWrg5dVIjnQob624RnTq?=
 =?us-ascii?Q?4RLslAIqxerXwzSaxiXyiGzvfbFFKC2saLU11TRMSYLEy/blXD6wP1Obi/v7?=
 =?us-ascii?Q?OHAKydygq4giiMsn6XhjSKLyF3XK/OjagixrnXOskK7nqg95wbmW+Q/DVvih?=
 =?us-ascii?Q?8bviDEwViXqILdc6Onsvw5LvD/lMyZjH6zxTCtItf7l7ubSVOpdbE+V/YxOW?=
 =?us-ascii?Q?xgBujaDsRN62ZlUJqUUa0X73FfbhUw8tPOsiD5C5WXUhzXwFDkh7oG4XJPwF?=
 =?us-ascii?Q?hTx3gi6RQExlgz4twd/4uHzpdXknelVwQyhFu0VaoTYuOkL0FmTxhiMV9BTI?=
 =?us-ascii?Q?xmvVrIWHfwbogXalhrsFFWr3Ni2Pm+bT6RtHjpDlWuEFkcywqeq1U3xVrblZ?=
 =?us-ascii?Q?v9mq6tUZIVjnLFI4v4yjflh92JeCyYfmD9v6g6jF6JYvKJmLOk46wk0VtNQr?=
 =?us-ascii?Q?qZSlJ/uSEimy2UrMKTEt1xKZY3poM1Yu1l9GDHKRmquYfVqmorfX2VXpJbL+?=
 =?us-ascii?Q?F4yX5GVJPSYgl5CqfqDGvCvH/xff3eN5n4Y/978xUI0Gj5KP++RBQ1oyMe31?=
 =?us-ascii?Q?X3nlSD+YevkB6l5M664nIIpJOWB8A0aa6Z8al4urDobgTf/vJb5U0FuGY5z3?=
 =?us-ascii?Q?20PkPyH5h8LYMiBReoDb3kBWh6BcG1gY/RadfuThimBT5C0mBqBZrBNRRgbB?=
 =?us-ascii?Q?D8Vl80cKr3R40sr54N9iJ8zeLQPjbF2teRNSxFtH3o+KZzGtfGcESLvHm8K4?=
 =?us-ascii?Q?2FjvSuIHbCnlcH4PUBB0mduq?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3614de0b-343e-463d-6043-08d96a3ac5d5
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 15:44:51.0967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5w55GakruKKZWWxMmNdg+LJLf+TXfzPYnnC6ZBUstUFG4qE/l49ML+3MUYbu8u9QCDDRKIezfU3Z3lp8DC8kSBBmYHj8jKqsJad8MQq6HIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2906
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

"A high level, =E2=80=9Cmore Pythonic=E2=80=9D interface to the PKCS#11 (Cr=
yptoki)
standard to support HSM and Smartcard devices in Python."

Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.=
com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-pkcs11_0.7.0.bb            | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pkcs11_0.7.=
0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pytho=
n.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2fd056de7..ea5683ce6 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -272,6 +272,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-pika \
     python3-pillow \
     python3-pint \
+    python3-pkcs11 \
     python3-pkgconfig \
     python3-ply \
     python3-pocketsphinx \
diff --git a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb b/=
meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
new file mode 100644
index 000000000..816b728dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "PKCS#11 (Cryptoki) support for Python"
+DESCRIPTION =3D "A high level, =E2=80=9Cmore Pythonic=E2=80=9D interface t=
o the PKCS#11 (Cryptoki) standard to support HSM and Smartcard devices in P=
ython."
+HOMEPAGE =3D "https://pypi.org/project/python-pkcs11/"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://README.rst;beginline=3D337;endline=3D358;md5=
=3Df68bda54505b4002e6ec86e08125ef79"
+
+SRC_URI[sha256sum] =3D "9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd96b70c50290=
803286f9e46bf7"
+
+PYPI_PACKAGE =3D "python-pkcs11"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native"
+
+DEPENDS +=3D " \
+    python3-cython-native \
+    python3-setuptools-scm-native \
+    python3 \
+"
+
+RDEPENDS:${PN} +=3D " \
+    python3-asn1crypto \
+    python3-cached-property \
+"
--=20
2.25.1

