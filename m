Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DACC54E4A
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 11:42:29 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.114])
 by mx.groups.io with SMTP id smtpd.web10.18530.1708947739469513582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Feb 2024 03:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=RyD0Nk4x;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.114, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7AWDQ4Lj2BQrLuGhf/3PQyJodtkZJYVVWXhzIVrnteho8bdu+dxNAaAvMsBF7cw/I4IPWTUwuAtEZZpfi/C1IthHBlyv0H4vR6tAOM+iti3GFe/NTS9ZdvHqsFsCFqqBAJiXpmeqOBQlF6oKMvQ8WR3hMDKAFgxGkrn2jASWWwbNrHawUNilX4eDMTolojVX6kK+hM9SEhb+RzXDA/CX6JGaZxnzOeVl3TaBjBn2Cj3Rq/6BysMHu0jcUpzTOPju21u/Dxf1/VnQvBOdiM7+Q21HxUSSvCfnInuayNSluS5oR0TPZ2/XA5T41QzZ62KEDYxrheZyo2n9PdsSIkkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyi6qz2hbJE946BL1x1JKnCrg8OO0ECbGJn4yJoZy1o=;
 b=J7/4qRPRWWPT1+DrE24hZ0HC7fKt8XLT04WvEKJgdxXsVA/CmJtsPgqMF3eIX0C3h2EglhKtslyG24f4QXW6z4k60WnttPcEAI/LIA5rhlMmWmWhbQ4Q7/7J5xUNBsM9M0f1WhVRAvO9m2yC9leyvFJFmiUm1ASOAyMzgzMJmKfEM8KBRddSZsN78LhPxnFzZtfkLFYbEey4r+QLrDRyHGapy6cgmuXCQrJy6shKFz4edSZx9SaxbPUc+HXZIvTVczHub+IH/CqOaN+aujKxboSM2FNrlsrXnOOPd9unSjh3MkrbGM03rrLLwuW+YKyiEuolVZorw/esYTvzuHnpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyi6qz2hbJE946BL1x1JKnCrg8OO0ECbGJn4yJoZy1o=;
 b=RyD0Nk4xpQykK4CDAGm6koelWPtXRFTj2RxFU2TKDoctHRtSyoXJ6QTHTzCwgqK7SnQfSqgF2wUUavIijwG5Hv2RAqenn38Btj3cNYWU1p/fYtoSTY0sXmOaa3ABGz4S0pkRtEtI4kK9swtwlyIHmc2pDVM2GdXtHDLlUo6+iwnG1a+YfkZPR0d5qot/uFZFISJR+rM5ndgdw69Uf7CqSSe+e3A3khCqb4WwhlwSpV2iXBlUTJ1dIVTbWqHtOzwkpXIBZkw17DAj8TLXPbymddLqjnS8mHHK9M/Yfd8wqE+by6u+MzxsQKHrxfOqKSgObxYe0LhuW7U6SaRZxPYFvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DUZPR06MB8773.eurprd06.prod.outlook.com (2603:10a6:10:4d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 11:42:15 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0%4]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 11:42:15 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: ticotimo@gmail.com,
	raj.khem@gmail.com,
	joonas.salonpaa@vaisala.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 1/2] python3-pybind11: Migrate to python_setuptools_build_meta
Date: Mon, 26 Feb 2024 11:41:53 +0000
Message-ID: <20240226114154.1033676-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B52.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:c) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DUZPR06MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a5befb-34f8-48b3-bd4d-08dc36bffadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	80eqBfrx4+txocBucdAQ1Kk6fC8fmmYAnpHDghUOOGWp8scoxMnnh9AwoyMDmYx2f/VJHPcDDS26vsNDeIH6u9RYo5UjTTGF5c0SRYSl+ZdtrGzivODjeotjQoKcMi3zi16MkrqgOcAS5Xe9QfnCtMjHt+6Oc5CMPPaEwlTHCQIdpZbIxd+CCQXia1VJ4fmlBKwJs/1yufTrfpaTmHJp4clGpWVUSkoiJSDqQQb/AyiNlkgNImUBwU80AatJoCTQ5Fy6/HKJpUfzMzXxyNi9vlR2BIjWd9KEzfX0ljuGCpSxlqpaXPgBRmUt+MbqjK1x6J/f7afKPR0yN9sG283DndF9X4MVN3SQZD9fIkdxUOQ4vtFvNjgvyr1nXqSJhkBk7hxJjDQpY5VL0EN2SGYv5BrLII9JRr4fPMJ4J/Qghdv1wsfiXfbgy+0Dg2wUD3zRn1XHTDMT/c5pVzQrbU9UzLNrzhxEVm+rkC1iujhM3OK+a2IKs+7bEFsutvSLZ8aZi8ZOehvQGINm77XBiitn4zx+lYzId99caYxQ3mXArXnuxk0Qyi0bkkPbW+wxxOESAZvSC8WHk5y0uoYeW8WV0i1ZGdAS9zZ3SnSbv9ScQ+4IXc8oXz9LmT2HedjjwKwmcidSmcynMeKCWv+ok3V5yTOTAovUDDma9Yc9ed8c5xjo2SOkTcx2C7oKnZxcj+iHEXaLOJWSMlU5vKCtxvjXIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kFSsdeCEca4WjpLNXlepTqptHkv3A41TGdPFoc99ytbPeP6/1JyAgeRMsLBH?=
 =?us-ascii?Q?mvWGvROxR5eXfD5E9pXjwRVUaPuWKnpBxsqbtAN/Z0Ygj5mAXjy9VEQfpylA?=
 =?us-ascii?Q?9lxtrr7R0l1oHEa0fUFs6rDsKPuJUoKpUU+Ba5e3Ph9iFKQGQcBAS4YFDlX1?=
 =?us-ascii?Q?GhAFr/9WeGfx54bM9H6B5c3hIgy1qLdI90Y73xLCCybeTn0zfNmjU/QfUQh4?=
 =?us-ascii?Q?jI0Vi1wwkgmE/oDqz02ABD9Myb+NdpGtoHLZ76aaeM7do/G6NR5kiO/nOlWJ?=
 =?us-ascii?Q?8bWi+J8EaYVrjE6n99+Qr19ASwhCVu3f3p+LKh4oIFxfSSntv4ASBWz2xzqJ?=
 =?us-ascii?Q?1PkEmumxxngYl/ScbJx4txRZviL91zyreL+tvuFHcbciJhB/yFHAzcPqoWZ5?=
 =?us-ascii?Q?3PVcIQi8hiy01YeJC0l5a/0AlPVoDyjcOAf99txQBOaxD3OjkeVRsu1VR9V8?=
 =?us-ascii?Q?JS4cfiR4f0cTRRpyPTn5ARFm1wGqAVcrnpCIi+DLPIUsIksyoy03HFCmFVBm?=
 =?us-ascii?Q?3xib6RBzuIMFnSR1QBeNJEigSGCzBoaQGrlf9I3dAEJl3ZIYbv+PgFQD6Yid?=
 =?us-ascii?Q?V9rieestjXlmz1R3QJDTVMI6Qx7HL+H22cBZJ/qayDNRoqA+6f3GMaUQ7XI6?=
 =?us-ascii?Q?DHuvcJLBXz1ddnROuJaANPTNiMf3arUNo3FwX+slUdJgD6shFsV62GXg4YZI?=
 =?us-ascii?Q?K9cW/GFlrEph8+iSxdGwzXrj8kCkClM2uVge8ZDe5wcV4gkXJoiCTqK5dEWN?=
 =?us-ascii?Q?MEw/K2kc5djUDFaOj9LIpBKz4qbUhtqeTNudz0e4ho1uz48YZmesax5gDilA?=
 =?us-ascii?Q?xgvlExUsALfN0N0f3Zyp7grRibscDuJTaSUceoom/rSlFIsXd7JzULi3q39Q?=
 =?us-ascii?Q?gAhjh/3cZAPUHwyVVqhweTcaPmbZDiy3xwgQatKrn7ElEuvtIPvxhY30WZva?=
 =?us-ascii?Q?FQltyAfU1ITrPl6moi1F1opXC5qo5uFc5jCa/VeHAWzKjgXsuEp00kIv6kMZ?=
 =?us-ascii?Q?8AgFuT0bYesoRgzuHZ3lI2y7LACKY9HYtlOov0E+aEjXzIKlcNsGnIJ4MB+b?=
 =?us-ascii?Q?cfZc9V5MwofrdSi/bxnHt5QhhgtVIcOCONT0blEDHw3JlZGHBbNXQ1y5bwvf?=
 =?us-ascii?Q?tVnE3i0N5cAkY1BdAcGe1LQlp0YLELWjMjxxV/siDrnMmDy5pln0H+OKH4Le?=
 =?us-ascii?Q?2pFHZMMe3vruLZdHKPlZev+87zxbfxf0ZxEPLMvMjK9lf9WxoaIX5emVhfMJ?=
 =?us-ascii?Q?0W/LO67mA8bNjeaR4lgWQTuEtfpokFo+vmvsKovCL0keg5Qu36BNJ8doDfkp?=
 =?us-ascii?Q?HPPECzKetkFIWZ/v55X42dM8Eo4ktcHMxQXo/xP+OpSa1tSskHP4hyDJk4zD?=
 =?us-ascii?Q?89mHEJ0s7v5G3IU/nKjW19gp8MRkzZfIoZ5Pg2iL7S8+s3IzRql6/ebPezJG?=
 =?us-ascii?Q?9eYY9dTdwDSCmqrGaGKEJFy1FZ6eC+9gde0chYlaKcIaQsN9mjGHHI72BKhZ?=
 =?us-ascii?Q?TLzO/NCQN5HkV5BvDPMmnauCevV8IfWNVUJyIYhDbgN0zWrE9XnZoZMnyhpB?=
 =?us-ascii?Q?WWoUN2GT6+EekSowEPTNGEx/M4AAjpNkKPKYvExsY0y2LZStxXa9FluGXbrU?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a5befb-34f8-48b3-bd4d-08dc36bffadc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 11:42:15.7641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkRbiWFRqJqLoUOI5oPWBP/d0v6FqAPhX+RSjo5oe5eH62f+lbgRnqpLr7GuZgQJqm37CPh5pzxp5LNXpgTqtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8773
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 11:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109032

From: Niko Mauno <niko.mauno@vaisala.com>

Switch from setuptools3.bbclass to python_setuptools_build_meta.bblass
which reflects
https://github.com/pybind/pybind11/blob/v2.11.1/pyproject.toml#L3 and
mitigates following warning during do_compile:

  .../python3-pybind11/2.11.1/recipe-sysroot-native/usr/lib/python3.11/site=
-packages/setuptools/_distutils/cmd.py:66: SetuptoolsDeprecationWarning: se=
tup.py install is deprecated.

Here we also fix remaining minor style issue in task declarations
(use four space indentation instead of three).

Reported-by: Tim Orling <ticotimo@gmail.com>
Closes: https://lists.openembedded.org/g/openembedded-devel/message/108748
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../python/python3-pybind11_2.11.1.bb         | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb=
 b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
index f94ef3637..13f63b7c6 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
@@ -2,31 +2,30 @@ SUMMARY =3D "Seamless operability between C++11 and Pytho=
n"
 HOMEPAGE =3D "https://github.com/pybind/pybind11"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D774f65abd8a7fe3124be2cdf766cd06=
f"
+DEPENDS =3D "\
+    python3-cmake-native \
+    python3-ninja-native \
+"
=20
 SRCREV =3D "8a099e44b3d5f85b20f05828d919d2332a8de841"
 SRC_URI =3D "git://github.com/pybind/pybind11.git;branch=3Dstable;protocol=
=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit cmake setuptools3
+inherit cmake python_setuptools_build_meta
=20
 EXTRA_OECMAKE =3D "-DPYBIND11_TEST=3DOFF"
=20
-PIP_INSTALL_DIST_PATH =3D "${S}/dist"
-PIP_INSTALL_PACKAGE =3D "pybind11"
-
-do_configure() {
-   cmake_do_configure
+do_configure:append() {
+    cmake_do_configure
 }
=20
-do_compile() {
-   setuptools3_do_compile
-   cmake_do_compile
+do_compile:append() {
+    cmake_do_compile
 }
=20
-do_install() {
-   setuptools3_do_install
-   cmake_do_install
+do_install:append() {
+    cmake_do_install
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.2


