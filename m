Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E96C9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 07:13:18 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2995.1790320395156747442
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 00:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=z94J8NOR;
 spf=pass (domain: est.tech, ip: 40.107.159.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYEJz6CO6HK4U5eUcyC3/z42Sika0QkH5E8kHK58XapS6itUwPmOFth/aBNq1PS4UKCsFQ39Hu40otooZLmlRv46MJo98IXEex9iHGSybrsd+QPh51bFRRtEA+mBa0iZhTVTnWbMoYsvU4tz4SlLVW/eI5Nymwkz4sk/4NFp6TgSTmBKy6c9A2qsMAmqHN0yWONRrdHacnAfUEGJMxxkZ7bTNeWWns+1GSIRgL6OtRtmyENinZ+zJSxYAAyM0A3oRC70/re6ugkk05OjR4GtotOMekAfCZO7sjzTGQtAhDjrpr8YMQtaDrzGb6iR/+eLr++L76rth/HFaNnAf9sghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1VRCfNrhAfKoGU3Zs52KOK8n6CSwxKB3Dm/UuokKK0=;
 b=UGektWW1BfvwoYBUAn5EYCDbod7AjsrNbMLKT+Y9uf4JE+BmbrgZoEZ82HB+qbIDc4JVIosk3Xwrul8YWdQ/f+nZaN3BqB3J4+SM13MFORDJrt/t+UfwrBvM1QGFwVNjoAMKmPHroh6yerrnEf20Xx0lkMbn8AdUZmcdycTrrriCJEE4art/Agqi2GN/7617WjNWlVYAVgrN2iu7rBIEKP+MOJa6BgJaco0+BxqJ3YgEBSHzgmQsACEUGhmx4eaufeMdubjWvtDn4oxJo8sbNtTrzDTciYTSJ/rHVviyCOCMhKH+hLaLKOz/UnkzkFTiwkctGOysKAt6gUu9LfIFZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1VRCfNrhAfKoGU3Zs52KOK8n6CSwxKB3Dm/UuokKK0=;
 b=z94J8NOR9jCija4k1CjGfM6zoMD4sD1rK3r7VHqa3CxyAgMu7IhDpUxdnehFe6oRql/aDjB946lmTTxHeHMVemWALwsNPXT+mZnT/rPgIFjCQa4ajblzvfBnAcgnCHXIL5YaLMrVWp4XWiCXkXeBFwZQhYuBwkDwWj8hOtsekMKKkEwdGVDVLVu5R0Oc6+jOUEfqVAlNlYx4lR/6803zEsjf9jYTORUv3pDjkpCjYTx1gi3LvrDzZsxjmQCedwmB003i5R5G0whvT72YcanLejYdQLgF6mqEb79TGGRrMYTON32A3DueUx9BqEoHSkJkNAC9cvBSR+9CwomPhiVj3g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB1035.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:48::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 07:13:10 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 07:13:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] libpwquality: remove recipe (moved to oe-core)
Date: Fri, 25 Sep 2026 09:13:07 +0200
Message-ID: <20260925071307.75011-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB1035:EE_
X-MS-Office365-Filtering-Correlation-Id: 65270e83-f918-4af7-4ad4-08df1ad4749e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|13003099007|56012099006|10067099003|11063799006|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	1ygwVemd1AzYQ5Q0//ZMVRxMcvbvPGJ8bYMr/5pV3R6u5xH+OnfYGzeQpFQ5aj/8ynlSrfPuPm0rzi1E1mTF7R8lZOsxMfG7z0vk/lIiLDNFvDwBBXVRN3ScPHpdBtoaoSN74xeFwvuPkzP232bo1fqXMOtZ5kburNi5ZBFXQAJYjIyXiGC1wLxTIRde6GvCtiDs4VJVCjr+fyUalXVxy8WOMfqRDwv2cIKMLg36E11eX0Ha7aM9TxO1datFSZtG+JYohk1E5Uzn2UBUm4CHiJdB/8d5Ow+A+QiitMlvRKksoPLWahC31sP3Ecr+ODHMEZv7nluc6y1hIWtxB3fXvX1/sD+hOOlLOfpxf5tmBjlU2vBTfFJCll8wKZyRKAZKay8sWsJGfenxEq8FltR2QLOWPCF09WOVPARuTWXFXYAwrBsi3axBzoiCEP25nNldhB8OoKq9QgQW35+sxzMtfoy9Uryheylh/34fSKO+zTqDNoID6VNu5twxuTJ7ioyWnt8aXvRcUcg7OP13xabG6LaG8jK/8grSe+j+VVvs58Rj8b9im74G+jIVTm14e64GENrduL0Nto7mHHMJZMX+erva+bZlwrbJQPBwq+bqYQSPc5gD2DEUjbmGe/4GBM8N
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(13003099007)(56012099006)(10067099003)(11063799006)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6y08kwN5VOepWC25Ix1KzvR+WeEnQb68B1SmLsLfidLNC7fbzA+hnIW1x1mg?=
 =?us-ascii?Q?45m7QJOv/Ln5SQWeM0oYcgCoyPC1zteNTxzk3rIABqWBADFWbRlfHJVcG5jB?=
 =?us-ascii?Q?8lofoAnOvcovou9MiqtF46FFS0iTG13zr+loGS7Wk6LEvijyj0HmOMbN4WlW?=
 =?us-ascii?Q?ctBk2oGl6gluFPM62VSsNGvukQ/J7l8Ro/v+h0huIlfjPIqsOwLyseP1yng9?=
 =?us-ascii?Q?ZsUHy5LqtP6w00NCqqw6kHZPVWpAeroVh3uYFOePeQDZPA2sArN8LV6oHwvZ?=
 =?us-ascii?Q?Gi3bmBCoLeKG/gC2yavC/RWT++PR5m+PdSV0c6two36dfqJ5Cg4F3kn8wwLB?=
 =?us-ascii?Q?xg3OQSlLUFcUixA2/WWvgH+fZhgUO3labZBywbA3/xRx6tihvu4BQXXweslJ?=
 =?us-ascii?Q?npoYTosAkZ6u/pFU+7YQGEfwoh3t9r34p+xcrfxOaKnJhAH2+cZR3wj3xQW6?=
 =?us-ascii?Q?EAA7dOAYYiRdDZDtWpdm2xGiDWBq/HEL0aLsmaJ/v98Fo3BwC5e/z1h+JBjS?=
 =?us-ascii?Q?K0+1ldiXxD++P7Ik2mP9WYHLxbvWTY8HfT3KWAeXL9XWSrlA4ucDC1Bif2kW?=
 =?us-ascii?Q?lg5RjIl9Eu+kvbnzVv3LpkyYgX3U49aU1zZTjeTnW06IfnjeKd1p4yt9d6th?=
 =?us-ascii?Q?jdm4eks9pvqUfeqAMFlsia7LHspI8OcPOeO8EelxvT7VvlZGtxF6YoT82+A+?=
 =?us-ascii?Q?gYNb2fuTr4/wFH/hx+0WEgVXCVQMu/q9hqYXwCm1Rcj3nS/2aPEKBdABsaNV?=
 =?us-ascii?Q?iCnqrVueeftaSGdE0wxWqMnTZIdTJZ5k+6omeNnjuYGjZOI9mQPfWhf2DJU8?=
 =?us-ascii?Q?X4IZZrs6TGG4VZtFzOx4SuR2W+6+nonmFUa2ZwebqO+bP9cPpUwuavyEhVUd?=
 =?us-ascii?Q?dY+ibi7mwYdFFDObFYOrWXIN+QVKh/g6hT0ssJ9y9q3xN1kzZ6tSWeYr++qB?=
 =?us-ascii?Q?+4V9S/FA0bpidqmGA/11zcru+rpnKtVNaJWxfvlYQBDL8QySOtLPPDtKqXs0?=
 =?us-ascii?Q?GZUFJr/ApsVUR6/VXRruK15hWb5+Dnf/tN6BztUyMUAgtHkBqab1MZ0qMJIG?=
 =?us-ascii?Q?bfZgXkeknq9CXiyQ/jeWs0VV31l+aQt9TdgwHmMNDIEbYd5O3WYesKbnjoem?=
 =?us-ascii?Q?7t61EwApfl7oTNtmwtHqQl3KRYYU+xGJ7nISakrq1zoU7PFreUGwHJCQ5ejJ?=
 =?us-ascii?Q?wRae/oVg7ZFvhKppWWI0SDKOGFajlIBiTO2dVOCyr1P1eyCnmFZHzEIEVfnE?=
 =?us-ascii?Q?Dt3Io+d7SGhOptl6+Bzmcto94AuXoHDe/+CkSNJxS9egalxty9M7jO4XDna7?=
 =?us-ascii?Q?uFCLSuSGBbwK14vxI/TEs5b+elKOy9RON3Am6/XR/6PPhDHuh5vPyCQINlGq?=
 =?us-ascii?Q?iZUDBTXllIfG/5Aatk+2pkFeV5Ec+Sg1bDwzFP6k0Js0YNnqS2mtNjnk1FqI?=
 =?us-ascii?Q?dR1sgT6axOPtllHBgxaAvWG79ECWdwPGDK/X1qvgOkO/pudxXOlCYsyKaQOG?=
 =?us-ascii?Q?ft5n9WunIJZkqNdAxxzrnVwEpw39T62b2EKaauiT0LMywkfsKGYt7jgr+Wq5?=
 =?us-ascii?Q?BPQTNoVmu6pM87GpxUyVXye+rivjsFAWiccDiUwR7h4H8pdY+h2aMXvccPcY?=
 =?us-ascii?Q?fwDKfKhF1rGuXHIs6VoVl9q5YXJXGqa+EIYyOwd7lE/BiPyIguIImxzdTFxu?=
 =?us-ascii?Q?YIovj+jBsniui6VYZ4x9NEB1nHdgUMisd465nDJPVnb5m/hKh8jHIxXkG6Qr?=
 =?us-ascii?Q?MCeJGFSLUQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 65270e83-f918-4af7-4ad4-08df1ad4749e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 07:13:10.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1M7xIDf1AfgxtqaaGqm0hLfyiEq0S0LcwuaBFMkHsY+op6dH1qjOoJYAVC8IEjBv2VZS+pUEKd26F8W7dKRAbJfAHkAxGMxTm1Yx9grTfAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 07:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130291

libpwquality has been imported to oe-core [1] due to epiphany unconditional=
 dependency

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D3d295bef38e=
e608207d5be9fdb98f23fa23b795b

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-Use-setuptools-instead-of-distutils.patch | 78 -------------------
 ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 -------
 .../libpwquality/libpwquality_1.4.5.bb        | 39 ----------
 3 files changed, 143 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-Use-se=
tuptools-instead-of-distutils.patch
 delete mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-Makefi=
le.am-respect-PYTHONSITEDIR.patch
 delete mode 100644 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.=
5.bb

diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptool=
s-instead-of-distutils.patch b/meta-oe/recipes-extended/libpwquality/files/=
0001-Use-setuptools-instead-of-distutils.patch
deleted file mode 100644
index 7eaca66b5c..0000000000
--- a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-inste=
ad-of-distutils.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From ad95b7684365dea8335c34527d4c1463c1668af0 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
-Date: Fri, 31 Mar 2023 14:52:19 +0200
-Subject: [PATCH] Use setuptools instead of distutils
-
-distutils is removed from Python 3.12+:
-https://peps.python.org/pep-0632/
-
-Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/co=
mmit/7b5e0f0097faebdcc6a8b783237bbba7a983147a]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- libpwquality.spec.in | 11 ++---------
- python/Makefile.am   |  2 +-
- python/setup.py.in   |  6 +++---
- 3 files changed, 6 insertions(+), 13 deletions(-)
-
-diff --git a/libpwquality.spec.in b/libpwquality.spec.in
-index 70a6f53..0809126 100644
---- a/libpwquality.spec.in
-+++ b/libpwquality.spec.in
-@@ -33,9 +33,11 @@ BuildRequires: gettext
- BuildRequires: pam-devel
- %if %{with python2}
- BuildRequires: python2-devel
-+BuildRequires: python2-setuptools
- %endif
- %if %{with python3}
- BuildRequires: python3-devel
-+BuildRequires: python3-setuptools
- %endif
-=20
- URL: https://github.com/libpwquality/libpwquality/
-@@ -103,15 +105,6 @@ cp -a . %{py3dir}
- pushd %{py3dir}
- %endif
- %if %{with python3}
--# setuptools >=3D 60 changes the environment to use its bundled copy of d=
istutils
--# by default, not the Python-bundled one. To run the Python's standard li=
brary
--# distutils, the environment variable must be set.
--# Although technically setuptools is not needed for this package, if it's
--# pulled by another package, it changes the environment and consequently,
--# the build fails. This was reported in:
--# https://github.com/pypa/setuptools/issues/3143
--export SETUPTOOLS_USE_DISTUTILS=3Dstdlib
--
- %configure \
- 	--with-securedir=3D%{_moduledir} \
- 	--with-pythonsitedir=3D%{python3_sitearch} \
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 1d00c0c..6e51744 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -14,7 +14,7 @@ all-local:
- 	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV)
-=20
- install-exec-local:
--	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
-+	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${prefix}
-=20
- clean-local:
- 	rm -rf py$(PYTHONREV)
-diff --git a/python/setup.py.in b/python/setup.py.in
-index a741b91..f934c50 100755
---- a/python/setup.py.in
-+++ b/python/setup.py.in
-@@ -6,9 +6,9 @@
-=20
- import os
-=20
--from distutils.core import setup, Extension
--from distutils.command.build_ext import build_ext as _build_ext
--from distutils.command.sdist import sdist as _sdist
-+from setuptools import setup, Extension
-+from setuptools.command.build_ext import build_ext as _build_ext
-+from setuptools.command.sdist import sdist as _sdist
-=20
- def genconstants(headerfile, outputfile):
-     hf =3D open(headerfile, 'r')
diff --git a/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-r=
espect-PYTHONSITEDIR.patch b/meta-oe/recipes-extended/libpwquality/files/00=
02-Makefile.am-respect-PYTHONSITEDIR.patch
deleted file mode 100644
index cd59a6d887..0000000000
--- a/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-=
PYTHONSITEDIR.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From edc51ba1b446913232cdf2945f485392bca72dc7 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 3 Aug 2015 13:43:14 +0800
-Subject: [PATCH] Makefile.am: respect ${PYTHONSITEDIR}
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
-Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/co=
mmit/5192eab011ada47b0157f8d0524bf5b18bba3bd0]
-
- python/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 6e51744..0a3bad5 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -14,7 +14,7 @@ all-local:
- 	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV)
-=20
- install-exec-local:
--	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${prefix}
-+	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${prefix} =
--install-lib=3D$(pythonsitedir)
-=20
- clean-local:
- 	rm -rf py$(PYTHONREV)
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/=
meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
deleted file mode 100644
index b7c673be52..0000000000
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION =3D "Library for password quality checking and generating rand=
om passwords"
-HOMEPAGE =3D "https://github.com/libpwquality/libpwquality"
-SECTION =3D "devel/lib"
-
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde676fc=
2"
-
-DEPENDS =3D "cracklib"
-
-SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;pr=
otocol=3Dhttps \
-    file://0001-Use-setuptools-instead-of-distutils.patch \
-    file://0002-Makefile.am-respect-PYTHONSITEDIR.patch \
-"
-SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
-
-
-inherit autotools-brokensep gettext
-inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'setuptools=
3-base', '', d)}
-
-do_configure:prepend() {
-    cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
-}
-
-export PYTHON_DIR
-export BUILD_SYS
-export HOST_SYS
-
-EXTRA_OECONF +=3D "--libdir=3D${libdir} \
-                 --with-securedir=3D${base_libdir}/security \
-"
-
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam',=
 '', d)} python3"
-PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
-PACKAGECONFIG[python3] =3D "--enable-python-bindings --with-python-rev=3D$=
{PYTHON_BASEVERSION} --with-python-binary=3D${STAGING_BINDIR_NATIVE}/python=
3-native/python3 --with-pythonsitedir=3D${PYTHON_SITEPACKAGES_DIR},--disabl=
e-python-bindings,python3-setuptools-native"
-
-FILES:${PN} +=3D "${base_libdir}/security/pam_pwquality.so"
-FILES:${PN}-dbg +=3D "${base_libdir}/security/.debug"
-FILES:${PN}-staticdev +=3D "${base_libdir}/security/pam_pwquality.a"
-FILES:${PN}-dev +=3D "${base_libdir}/security/pam_pwquality.la"

