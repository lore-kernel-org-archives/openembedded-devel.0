Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD6AC61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:02:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24083.1787670126784577583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 08:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iE4SrRnL;
 spf=pass (domain: est.tech, ip: 52.101.70.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ev7ZdHB8rdZ6pTdAoLkQEIlg0c8TOqrSQttRwl2SxgKUa3cDILB7MpuBBqLtRnTA4Muz7V4963oDVyQoO0n650fG7cbLo4EDVelfiA3cUe0LX1qyVlC/WmFX2E41PAoj122fDe+dCfnwYa5kk+EdKWe8nlyx5FV45g2NS3NrOKdCSVPIfH59br58wLSxJHXxr7fMHFtDqCwFt4VAzSUIfWMcrN1TPfYlxadWvLUCHpam42sLHijFDOj+7ox6NtEwuDP0tRsv3qEvpBTgOCnk91re9tV+4/x67+TGaOqOTijidjbYT9bSEseBAb52sJxBmFD6i0iQk8O0ChDN5Ri1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0bq7yIDAyBhOxbZL0EPfrX5/XIHjYGuC+CxyKbbRO8=;
 b=LIwCwXVvvgYi/zOIr0n8pAbnZF2hdAiW4BPwAMumQRl6K/qlhcufsUdqROAtkojCh8mtIabzA71kjZ6NszsK748hZhNJgKJcs83nCaXb73Rk7mcr5s/I6j7LYb4mAxgGD5yxKaQaY12zKeStpJY6ZWpyf4blS2dwqrRW3wAIVx98IzYdwDSxPRBvE8Y0rmOu0B98kvbDidayjn10a3YqLhObfwA3aUViPNMq2nIBfKaeEbOn8nacAmKZNvvYWX0Vc0eEP/DuWD7TJYxxux1wR2MMgXK6neTQJFmRf4JRB6mHd9RBkY5YetBijeqVMEXYcfKZRlhzLLVFTnABuVcx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0bq7yIDAyBhOxbZL0EPfrX5/XIHjYGuC+CxyKbbRO8=;
 b=iE4SrRnLCXhap/NFvPSY7cCvmPRS1nz+eik+ckr3x6IACJeoq2XswHURUGzncLGtizJS8LZ0qfxktQIOcZnnjyFEVURtXBAbNUE55Xb83TLD5FfBuVjNC8JTKi6ZLrE9iWWXktpbsW3H1ewkwjqakK8a+z3zOlZ0VTx6WveMYcuv33R0BEMZS7WgQFCZlEy/7/j9ZoJWtQemslLMIx9zAH2Y8GJMTCXlYitymTyNH8NcGdK1ozN9WvazcECJzyNiSFT3SbDif97K7rAB+dLdJs9JFX/HUZSHfHNqsKv3vbg/LL3HfXOG3yRbldjR5/F0aSsAN0sTa1+ISjXvc5TFDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1068.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 15:02:04 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 15:02:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/2] meta-python: fix trailing whitespace
Date: Tue, 25 Aug 2026 17:01:44 +0200
Message-ID: <20260825150145.64061-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260825150145.64061-1-jaipaul.cheernam@est.tech>
References: <20260825150145.64061-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1068:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b22d7e-9f48-46b9-1fe4-08df02b9d2f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	HeNcRfaqEt3cOjpPEPPunkHe3DMiOeLcQmxtcXJr7L3Xb9RlpNZpmppmJ0/RzUHX+znXsPUXxqEo12AFd6mA1qp+eYcHtv8VwvjvYLoWFIHrSVsCp8IWH/Hb453Ihe13UU1R478gRUrp8qyfh6TmAy0rAx7rHwT9C7ESWa49xLjNbGeNtcZMTmP9Hk4uyF6bspCWghPWg+fPwG7R4j+CVfJhLv6OsAKdXQC+VnXlLRg5k8LF6LHvmqeScEHbOjbTMrsAqYsQTgfw7CbHxfJs7yUcZEIqI2hzIWmb3nD5CGco2GpFtcZaMWJ79L8ZtMBg4jn+UsbkaWwJ/g+yi1ou3z9pMFBGZlgADNFGlaWy42Pl5ES47IKn6WSvlPsrsDxIi+m0xZMQ5CxUjjUCfpxyZx2OAYC39oahXYG9V+3eEYl1DLV51mg4iVhpplll+i9EF+D127giw9senOMytfsSePdWDQgWgWhmOZowTDU0xnecODOPvG/7dxU7Bbah7860doSjEH9OxzviAwl2bof111IEze9xG8lPaqHKWLea2Dpd8bjS8XE/77watiwcmSzu/iSr/v9mrlgwfKARgBsQImeiB4zfBRVwJzpBojJ8S6g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BFimvEFrNpgvZT2280KKWXTz2qgjgyhWr2/JaYr0KRDMd5JK60a0ooyYuWUi?=
 =?us-ascii?Q?r/gwZTtu5Er3ydcha4Y1//8dY/pIO86br97t8cmr9QOjmZKOvmbFcidQG1DC?=
 =?us-ascii?Q?lFsD5v+Q5XBliPo6oBg5233uFpInbOcuf9D1ZrzzhApMm+vjdQqLTwMxYx+L?=
 =?us-ascii?Q?37zH98/6D8DZWKZdMccD5pMeNXBdNVgRY0E+Z5Fx+E2RGzRLfoe4FsFAuqoP?=
 =?us-ascii?Q?odWE4KMXnoU78q9r+p8Nyvm8qBIB4GaRV3wGOyUeK1tTnY1+tgg4p4qejCKf?=
 =?us-ascii?Q?H0sQzTpuRXOEDzFl84/V8MlAPohfYaA9Cb2aPEtWQSVsudhi6kA1f7nX2jYm?=
 =?us-ascii?Q?5uN1zoPmb4O5aOOv4lAOPmpztkt4UVFBiMgg0tXT0C1SwvBNsH44WrRI70cW?=
 =?us-ascii?Q?uXU65xEv0cyXEI1uoG6S5M4vgdU2r8EEBA4h5Cd+x0bmaeozmvOqQ+r7dgtp?=
 =?us-ascii?Q?jG4Ip++TFObzxFTitLlUP0uEdw2XSf1ZvOBpWoiNQGJT+7uG/A0BeYUtnNwl?=
 =?us-ascii?Q?tiN5o67X9rVQ/CP6j7HB/HzPKFY6QFjcqT8mUk/sXwLqH5MEV9djcS6giPAz?=
 =?us-ascii?Q?GKAD9YOnTW1acZvdZv7zlyL2JhDtwUKql/mwvNJEq22wT9M9qtGsz9qVmAu/?=
 =?us-ascii?Q?U94ZZfcd3BaW/jr+uZogygrqtxshPTkiwLp+kp8bzblXhnC6xosxN42Z6uQM?=
 =?us-ascii?Q?xOhmeGMjlDKOvpZvVH2GXXZ8eN3h9znR79893k1hY8TDHAtiIh0uWDk+x/SG?=
 =?us-ascii?Q?WzBVnSh4aHJ1ymgDVK5kkkaaFfk34APzGa0nspBS8FWY06eg7PexTXGFxa09?=
 =?us-ascii?Q?zmJlNN7qOo3KiSbTGcJ+XGf6uuHTrXwNefqpg2PA5qdejPNGMb608ePdjIAB?=
 =?us-ascii?Q?KTm+uoRsr/EG4KiCZLqUnX5fFY1q3V9u5mvd9LUHTnOTbOMc2Cx/Qq3l2eO6?=
 =?us-ascii?Q?9wyq8si3RQM8c3S1Px2Y1mdRtsH+fBU3SywtU5ouvJy7+CUP6JN/q3vOL/RO?=
 =?us-ascii?Q?qDa3baU4IDoaEbfpcSzpT0nDNC3q1Xv1ciCHhwDDPcAxkdNIKTLphrnWb65e?=
 =?us-ascii?Q?NhxW3FLaMv0JTnxzjPK5ChPbAwWZo8Eo3bTrMubWV6FJq9z+O6PUb/bwkM99?=
 =?us-ascii?Q?ciVjnJcTuGQS050brgM6za/Yd3Nxk5foEUgkX8RRx7lWQjg/zKBHSYL1nk+T?=
 =?us-ascii?Q?alR+egDFCNwh4IG2rruuu5IXVS7fMTC+3n5OTPDNHhN8cvXuxE6Hkkl6pVAV?=
 =?us-ascii?Q?9nOxGvPHVb7udjFVK915ki0TSQbVsnI6wNaJuQoxDLc5R80TV0sSMmCD2AWu?=
 =?us-ascii?Q?kadLCcrnC3OsSF1IOM/1/+FTRB0+d223LYPjagfCa/FGRF+LO9IiG/w/RuTH?=
 =?us-ascii?Q?n4WcJ0oeI9fIP6zCwxycwdeSsoehZVTadh5pW2ZljFB8+bsX39AyZEoDpUUZ?=
 =?us-ascii?Q?2HWT62CW8nwYLti9Srj0fMxmxh4tsa1Sv9fDC8e66zJC+7BfeOOol9l0Kn8R?=
 =?us-ascii?Q?GkGE0bE6d4gFMcyGA0sdQ/r0BSjJqeh7NgeF+ogT3lEn4kqWB6ySbuO/K6b4?=
 =?us-ascii?Q?iSCKoKLRr6Og8yQWBU4mfSjzbt4g0DzJ7XkNqqC1B72QEDlhfq0zeFZfwW/s?=
 =?us-ascii?Q?mKp2iBcLBn6PDp0kyKGYkOXK4wlzFz3z1BNo0qRGVyRAZx9xh+Iz7QXcp4rc?=
 =?us-ascii?Q?sHAyae5NS2OUwC98HKmYJwoBjiMg8O7VfhIuRpAins/sVZ469IF4v/m/Kiba?=
 =?us-ascii?Q?jNWY7UL0iQDAaaFk/qKYpetIkLnCpqt1ibtpIaOP5X/p8IRWQSBT+EkMNtfy?=
X-MS-Exchange-AntiSpam-MessageData-1: XJt6PSfRjJhle5AVwzFt9ugnTyoTeaqwDkU=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b22d7e-9f48-46b9-1fe4-08df02b9d2f1
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:02:04.2245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+YIi53TXgMDUVrZs8T/TmU1NkDF9JLbsCaOgMf217OysF6TqvgtGpKpf2Hg2blOGRv3nCHBOp4WgM418Ho+wcsfMRFcEe1PGScmQamildY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 15:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129472

Bitbake now warns about trailing whitespace in parsed metadata lines.
Fix the affected files to silence the warnings during parsing.

Reported on:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4284/ste=
ps/15/logs/warnings

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../recipes-devtools/python/python3-constantly_23.10.4.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-glances_4.3.2.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-pint_0.25.3.bb      | 2 +-
 .../recipes-extended/python-pytesseract/pytesseract_0.3.13.bb   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-constantly_23.10.4=
.bb b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
index 7645cdc132..7ea0a8616b 100644
--- a/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De393e4ddd223e3a7=
4982efa784f89fd7"
=20
 SRC_URI[sha256sum] =3D "aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e0e=
fd050b7f1c7cbd"
=20
-inherit pypi python_setuptools_build_meta=20
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-versioneer-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb b=
/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
index 9b8e529c87..e4cd7d59e7 100644
--- a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
@@ -14,7 +14,7 @@ SRC_URI +=3D " \
 "
=20
 # psutil/jinja2/packaging are oe-core; fastapi/uvicorn/defusedxml are
-# meta-python.=20
+# meta-python.
 RDEPENDS:${PN} +=3D " \
     python3-psutil \
     python3-packaging \
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb b/m=
eta-python/recipes-devtools/python/python3-pint_0.25.3.bb
index dd2a782b0e..c04fc48f87 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} +=3D " \
 	python3-packaging \
 	python3-platformdirs \
 "
-# python3-misc for timeit.py=20
+# python3-misc for timeit.py
 RDEPENDS:${PN}-ptest +=3D " \
 	python3-appdirs \
 	python3-attrs \
diff --git a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.=
3.13.bb b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.1=
3.bb
index 034568251b..ca41d1c66b 100644
--- a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
+++ b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
@@ -11,6 +11,6 @@ RDEPENDS:${PN}:append =3D " python3-packaging tesseract"
=20
 PYPI_PACKAGE =3D "pytesseract"
=20
-inherit pypi setuptools3=20
+inherit pypi setuptools3
=20
 BBCLASSEXTEND =3D "native"

