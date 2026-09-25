Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC889C9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 09:30:33 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4211.1790328629295459386
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 02:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AB2p1aq7;
 spf=pass (domain: est.tech, ip: 52.101.72.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anPkrlFXCVfjWcmNnbBHsiOQw1X56NBWK1J8t/PfnkGVyGHggO2eportP0RJBRJT13bOaq8uCGaIyBla1tc4BpEhUsaU6jmC3q4qEvZWifqcxhbHDT+/RPPNLxoioaEUnwegEdOIAe+RG3PcSo714KKt+M1r8okZwLH6ccjoR9PPGpkcqR6YXBim+KbO3Hflgce2Tx+YF+zRkXvmNBNmsDo3VTgPHq/ESVQ+Ox4wPW+XXTCQZU3oTdlDD+dG4N9ooakaOF1XaHsUgKHeZZM+MMiKBSMHyOnMkH9HRgHG5eKFwQaDf0iiQGcaRBfgDAlnRdKGLxXt+whqSViuKeh6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLr0AUOqVBH8yUsGOwvS8woKsxqefInBzFudEVsLqjY=;
 b=IBcsOP0cNOc4ckTW/atQlIEypupcBK0HCqL0IAfgMUjmSnqjs0EqYoUHjSCWWlFCA+3erixX+GiYj1yHOFudLPSzlvnlhwHEglGQ7zhD+DSSpY5ixpwYLbUNeLwbtQAvYWQlqTfvPvWguKIifrW5xmGpBD2cPOF2t9Icpt+GzR2/SbkSEkistYMrLmJ5R95AGxzkFuSk3cfy2vuUOuplmrPTCHNfoelGS/iO1kkJgFrcjVja8eLNR0Dmvu39po/yEnd8EoZbxgiEfdlbI9Qw+ev3tqV30Lm86GiaextTeSvcU6ukOTL5JR3HKyHe1dy98oFSXPwZSoXOoVMTqZNxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLr0AUOqVBH8yUsGOwvS8woKsxqefInBzFudEVsLqjY=;
 b=AB2p1aq7kzdw19A3Ky30joQ+GAQLGH8g6Fyyzzdf3PWo2dZUmK4bQchS6GvcAk1yA9ZLwwKFxSco7Dw9Tjy9uEWBMT8uoXoc2aLR1eEtrqbDmT45cGbNQQzpQ6WQRsM2r1rH28/Dbp3AzdA9j1Bl5rgxyeivgd6DJhBNqQgKvhcMC45wKLDSmLKS7Bc3IH5mX01t8/9NiBz9H2XPZg3qE5k6sl/WqsQ+scwPqbi2ABU+iYBBopDmdj40zKWMzjznqmCReC4JXLasTq5/J/oAo2R0UAN+Aiimuwn3zC2JVhxzxaanCx1E8zpVpgJntfpz9cXuLJCEsE0kXgrfP2e8/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB4P189MB2463.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 09:30:24 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 09:30:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] libpwquality: remove recipe (moved to oe-core)
Date: Fri, 25 Sep 2026 11:30:21 +0200
Message-ID: <20260925093021.90294-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925071307.75011-1-jaipaul.cheernam@est.tech>
References: <20260925071307.75011-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB4P189MB2463:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d26452c-9e24-414b-ff4e-08df1ae7a07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|3023799007|6133799003|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	2B8ud22f8n38uFQfpRiV1yxJVOr1Q1ZJ12alr2xcEwNZrtwqeOz5nRODMB9RRh9hcXrIq7cUF3x3NHs5nJ2p5KgaUw4SsHj/kfdDuYgin4NEltvcN0HWlOw/tjglQbSIU7+X79rDj8oP8iM49aUL1hwvKTdc/o5Jlt8PrlDCFgwG1jGl8osEfawX27el+SR2DlSTJVIZ/yHaOc0qCssU5dcSka8vrVjZ8CAQQvZFXKpP9SLvYey8fKvq9k1+cy8ZbDUju73EWS/tU4U+Kn6suSZCdx8dIvH8Nr/MDc5KEHE1qXvzAicjxbEqMv3LkbPA9W4i/6RJlgAz+On68x6Z4PtKxzV9PPDHQOpBEPDuAkcmjigvh9M3kaFCsKttSXVm1VciYPWhKzXqAnfHU2k/V4HAvp6kd4c0yGHzo5DJuVeetD7rAo/C2vnm0FqxlpAszZuxWxwUfmZS5OAWmfowuoKeMlqPbdDRAQSKi7w9lH6z4MYToZ9LXGRSxpAbAR1vDSQN0TsY6K5kTinqqwR9OlcpRgkUeOFFaRSrQ8pdQXfZD6NJn87Vp7bT0fdgYhwlpqX9akV6zYLh8vZCAXc9fUbEuu0XxJ5syvsh0GK0bPIvdbiW6cOPQhesMRSD9Rs2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uF2P5FuE/mtIInMfcBzs9Yojg/lyQmYafP211stD72K+ismLV6Pdm7U8rX/Q?=
 =?us-ascii?Q?yaiXardRN2OjXnW1w/56ghL3fEtxwW7x+aqTHN/Y6kC5D6qBQHo2aZLxBKX0?=
 =?us-ascii?Q?N0Zcp28+TfbqeesUinCSKa2ovx5ONrx3mIjpL9fNasz/ybqRQHjjtmufEAdk?=
 =?us-ascii?Q?9oj9B3ja98fzOVHBAOOoqyepQ9cVFD10FsDfAfmDr6RQz6b4+H0QoutTSb41?=
 =?us-ascii?Q?TnohBuQHKLBCwFrGHqBO6nHCdAx7MGKXLTzq5fHHkROnrjHWCppsJblqIY4H?=
 =?us-ascii?Q?Pazx+b5J1+pADn04n9Bg7slHvALoQglfN1qZih89rzx6UT5Chs19iSAokZab?=
 =?us-ascii?Q?0F+CqOb8dwO33GyDXW9DRyPf0alaL7fMMqkeWSZtTM/mwcyDqjv7bPmLEtkO?=
 =?us-ascii?Q?hPB1mANb1iZHNwNC3jjjEdY8s6DyuqhgMXZLsLM1JaClPJbLu3IeAwy9932E?=
 =?us-ascii?Q?2E+VympLPblzl85FqppJHd8xAPZaL8BCJoacd96PbgByz3phwVx0xw2nwxdL?=
 =?us-ascii?Q?i8CAuf+Xx/mK6RUYS6wxvg7BpUD8gs/zL0P6vefST3UtSggUtko2hn5oRM2Y?=
 =?us-ascii?Q?KqZzC8uhPIkZuM+IM+QGG311rQOhL05t0ip7TUPyfkLph75RNUQUViY6kU6E?=
 =?us-ascii?Q?suKRnFEmGcKPu+oqIYnafRzRWvwMfToB919v1c3P6DEVj/pvr8BAN2fKXMGG?=
 =?us-ascii?Q?nYu8bdf9QAkJIDVoXvLrz7hkKdJ6FlT3muSuKjMVA2HMVGKKuy6Dl7URhtgO?=
 =?us-ascii?Q?MT8z1oDqC9uobR6vfJeHHKVYvv//CccYvTw8VdyO0P0njDqxtebyeW06TwT6?=
 =?us-ascii?Q?6876hZpsD8eZDrSGHLMIdJzCWlh8T7Ye2iglSxwxN5B0m7MQITiLOFjWfQTj?=
 =?us-ascii?Q?CcCT53y1w4r0XDu7IXjfpZuuG+jZbJ/HAEi7s2jh2+8j8/d2UrIKiuLjGB+k?=
 =?us-ascii?Q?NQzTwR9E5Nq3NGgHqdHUasrSd3Gek6fjHPPMTZ2IFXkMcrN2GC/jVwujCMrp?=
 =?us-ascii?Q?LngO0tYH9Z966KLeSKgj2FA8rwJzQ6XpbEjvmw3YVzX4pisa8xM5RLFIovfE?=
 =?us-ascii?Q?iRVr2OQe3K5oGbQcOEao6V7WnPUvDgtSWR43q0Iw6+QfJfAOOrGl2WlLkJv3?=
 =?us-ascii?Q?LNLNsP96/oS4IZETLjFhyRDftlKWeGXeL0l5EiYWCL5eeNRdB2PB5RNrfzdD?=
 =?us-ascii?Q?lSUagfI3t6/wM6HMTviQWftarxxXDzkOochCn0u2STk/TLH9AlhMaTlsOK7f?=
 =?us-ascii?Q?pdan6pHuVhB7llaqjB3ksj+JhHDI+NkvoTQdXRQ+qaBbePAvVcGTaWMZPOTk?=
 =?us-ascii?Q?ZvfXYOUKvgacHjtDyEAH3HtPOXawtdfaAnrXxoivHBhZqiak3A7MKZw7Uv5c?=
 =?us-ascii?Q?/7S9UuNqium7bqEJNOcCYdv+fCCPZHx4E5Vh6URW6S6HZ65M4KhXbzgOLYms?=
 =?us-ascii?Q?oRIZelOUAOlZcY5/K3sUl3wVzXbliaY5cmb5cvi01G+vuqkOdCIaV6PiHj3W?=
 =?us-ascii?Q?uBGgxmJj+Oa3v5vNMNDwucza5pdEo7G3FArmNdGK+B4AxthJqc5Yz8gAoPDp?=
 =?us-ascii?Q?1dtW4MfKH4CHukDsznBkrOidQxFKrwl1uT4AtcO0ZWPDyT58x8cr7jOlnUYf?=
 =?us-ascii?Q?r9xfiOJ38KOgoD9sT2EVazMXQvosHRQf5Xp5XFk01IrNFkTxAJLKZjzBsN6+?=
 =?us-ascii?Q?vjbvLL4UvIJ74yzWImdCG6aVTMG91azfi1Rm+LUDGnIpdN85z6dNc5Jt3Z7E?=
 =?us-ascii?Q?xQDF/ZqGfQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d26452c-9e24-414b-ff4e-08df1ae7a07e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 09:30:24.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1n8D5Q6517EQm5jHz2Q0tm8VlKc/doZ4rcrreqJm18Hn3UIGOrRhltobAuPkVkSC6EsQu4hgulhB+4KcC0zfgK2X8f60ad9AMKYd5mJtTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2463
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 09:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130294

libpwquality has been imported to oe-core [1] due to epiphany unconditional=
 dependency

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D3d295bef38e=
e608207d5be9fdb98f23fa23b795b

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 ...-Use-setuptools-instead-of-distutils.patch | 78 -------------------
 ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 -------
 .../libpwquality/libpwquality_1.4.5.bb        | 39 ----------
 4 files changed, 144 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-Use-se=
tuptools-instead-of-distutils.patch
 delete mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-Makefi=
le.am-respect-PYTHONSITEDIR.patch
 delete mode 100644 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.=
5.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index f38687c515..239e1d6059 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -369,7 +369,6 @@ RDEPENDS:packagegroup-meta-oe-extended =3D "\
     liblognorm \
     libmodbus \
     libplist \
-    libpwquality \
     libqb \
     librelp \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", d)=
} \
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

