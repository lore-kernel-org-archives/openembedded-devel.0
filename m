Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE682CF649C
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 12:06:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.138])
 by mx.groups.io with SMTP id smtpd.web10.52670.1727697977170095918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 05:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=oPMoLwv7;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.138, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNrYqYMRAinm5bGb0xm/hH1xg3pFb5/wKm7FZk7evljofagLqTO69M1ciCMqefAEGvza7cobdGryid4rJSylmt1lILMqnUv800PHcero99kKI2vIIoqfDJ7ffu9kd2LiKmOvOa4iL0hDR7ELw+0Io6bPWnejaTTzUzQN4N3cZGYnybcl+cU7QGfP+rYU12C4cBQhAcx8eNvNfYGjmvH9PGzzHiwXIfCcCp7z87Zfz6FfV6HDe/anCCyw3W1Mss/ksXNTaicl/j7S2AIef9pvythq7TmoW0Q2FbM1y/qGMlSS+Um6rkXaT4OWJQj2YvvqUzbY2Uv4f5LQFvzige++kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2qeWpV8vEBfLLMTtMrIrmdgFCXY0zMq+KREpoJygd4=;
 b=BZ3nNJpjrzEURWsmmcFscv8qCBSedNaW3wIHnQDoq9skp+H9sml4W/CGDi/hn5Mg/gCtjjzuxJuVow8jaTxUStl6RNDIKDwmM/NO718JAUJ3Rv0qMQehHTKmcpkdyylkR3fBwUwVviYgZFQBX+7lhkH6wPxbi16qICBqV9ZZad1FJLSeY5nvypCAvkQSuJGA8rCprP1/PbZGT/Wi6PQUqyech1xM5l7SLDiY4YLyOSX6NIxDDkcjvVnG8pUc1Vorsbe9Sb5R37gNN/wPeiQRwH4GLVkXXBdwRLrYJ9la2qNFLtipxIM8xtdP6IWoiv4PKojGrSd9wSi3zj0F157L0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2qeWpV8vEBfLLMTtMrIrmdgFCXY0zMq+KREpoJygd4=;
 b=oPMoLwv7jO6PZgLQ13yELywlI4kL9LmJxUvXaTwyI81n+Ze9fwZszVh5WiQOJ9gp5C4Qk3FQeUduwQpIfjfvWcTIPvVxuCRMI0tFsTT1sPXemBbg2FCo8GEK4HB1wlxyKorBIs3um45MANwaKDcu/G8ka1CLXAL77c/MjTbT8LLnVV74hLw56lvIYKQLPHy/ec4bc2CHr+7nqlDlmjNVH8YtPdKQypQgaBprGUGcykIJr83DpWChLKFZEvepv2WEg9ECI9DY6JmEDa+scUj95yUFQzE7K5tnwY8AtOeLgvzmcUeFSCV/3XsjyYuUt4QS36wXcdU1imDRp9m7zjNXYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8254.eurprd06.prod.outlook.com (2603:10a6:10:2c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Mon, 30 Sep
 2024 12:06:14 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 12:06:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 2/4] telepathy-idle: Remove obsolete recipe
Date: Mon, 30 Sep 2024 12:05:22 +0000
Message-ID: <20240930120524.2051403-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930120524.2051403-1-niko.mauno@vaisala.com>
References: <20240930120524.2051403-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00014AEE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::318) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: b41d732d-7973-496f-e29a-08dce148474b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yOE6cgfhfp0nd0oBguabKhmcDWG13NXb8g3NyX2cH4J6LOk1gzZpZ8/fItLe?=
 =?us-ascii?Q?JSLaa/B85vPIv3tpMgRISS2SP3HPCOVBIgvQ2aT1Z8FHoxM+zlLNld48aoan?=
 =?us-ascii?Q?3vpIBoGwsWfTXvF5cBLkQVezc70NSbetsAGtEc0+JV/MESitfoq8Yk+Dl8f9?=
 =?us-ascii?Q?rLtqYA2Nvt/NiNaubUlGCuQTKfbAjIkJdWb2KBFMGJl++feUXfanz2+8uV4e?=
 =?us-ascii?Q?zDF1gY/hhFmHyQ6rjPbZgkwXttFGo66XvvNqjlPPlv04EWzr1KeqXbmadjDc?=
 =?us-ascii?Q?tB3MlTTvCyTrxUrCbE5VG2+O42XkMCibZkjuOjejzf+wbjVqYFQAFFqZMFvJ?=
 =?us-ascii?Q?ITXsV5ukdzl7WNrHIHtLWO6I3pB7jZLehNFpO+5dZCc+rmmeiaY8D2r4ETNR?=
 =?us-ascii?Q?eu4oOO006C0KuHDy1HzC4gBUV8CCXfN/COKIMoWpcUiIRwKXqxbBdxQVC/R/?=
 =?us-ascii?Q?SVUY03mD6Hfqwbn/yVpLYrWZCS8ie3eLjNf0AUbBzad9tI4W/x7njoOEfY6x?=
 =?us-ascii?Q?6FL6K+FRSiIVcsPJVLYu1a0beZ9cSY+G9pf8WAca/0VBD2lZocFWjTCfwRK+?=
 =?us-ascii?Q?b08VTbqAqYJLRfYZ4L7B5Rcn/XnW7dJ9tjiAZdc3ikWY4opPylVqdAKG9mna?=
 =?us-ascii?Q?OhqNQfORayc2TVhmFvr0vVd3TnlUmwIG2GKiPuq8NtH4RWTBE6KHqRF5taLd?=
 =?us-ascii?Q?vBTP69HNV/TesCJ4BQ0GYAuElAGJFmVfj2deUyWlBtFbsJ99N8XYVAIoxJWL?=
 =?us-ascii?Q?ZDLmQgyK+bHLkfiG8bNaruGLPQmsIv07m5SeA+aiPVYFbk6hpFdRO8w7sjTo?=
 =?us-ascii?Q?KPpnvD04xlKM3Fo0AiYZMF2tWd7rtOIlV7RvIa0djc3QbfIdN9OIlWNKr+Hu?=
 =?us-ascii?Q?27WTfrybTViRFX2Sdt7tSYWhXC4x7/i98nOzlqtpG4kqNWrhazGeNOjs/bQI?=
 =?us-ascii?Q?CrBPKbDIyLWZYORGeiKNp7Hu9bu6h2troboGSk8iVBBQDDt9j7wd9Hyu/7Ix?=
 =?us-ascii?Q?yYHSPEJbGkQclhJI2m09t8n4HEXr98hihmxVF6cv07R9ylA4bbf5b+utmjNR?=
 =?us-ascii?Q?Ys+6fnCnOOAOfqcvsWZhE6AN+Fh8IM1e9oyS7YdUafSmLxS7KQdpkvfvJaxb?=
 =?us-ascii?Q?ZIpplf19d1w6eHEn9EDg+e6Wkx1hKer68s+Nhsp3M7Prl7rq9adrcwGKcXb6?=
 =?us-ascii?Q?poWEhnojAEtgD8Uh2MxdVna5RhIb07qbqM9shjndSJ7GFmUSMYCsmZb75Cl1?=
 =?us-ascii?Q?91MV+W+SKUva61qqISPiH7D9ff3ZD1ivBHIfFGL23oH6LmQkU7+nLC6YMxx0?=
 =?us-ascii?Q?VnJck6WcEUlH726xIin0+MMwoi+gqceuFjeH2mO6EPYCiQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XhbHHucHqNVG0fqQ8QA3Q+cQQOWhvS5UX7ALQfJ2m5wqdQE8SUzE5czykljS?=
 =?us-ascii?Q?f6a1a49HibvhEvUXzac30cZl0fzUr2AKdpFoQD/QvdGpuKrJE6OJEFb6cHfb?=
 =?us-ascii?Q?cx5pkrtP9qW2whVqeZTkdkUFxwoBUM04hLivvNQ6+/RYVReuerO0thaKw/s9?=
 =?us-ascii?Q?djuQxlOV/I9HAJ6EPdbrHFn5A65bOmbJfZGUi4jU+E9g2zSP9P7XR3Oud2AQ?=
 =?us-ascii?Q?p+XsymRWtVD17p6USDd0b7UajnhoNNZ07TTWKHMbHshZNMS4+oR3sa7pZjD8?=
 =?us-ascii?Q?gT401hPUxPDgQQgE2ShTP7SN+yFCFjazYDw3aVFQv0vdZ9+9U5PObyxCC5Lg?=
 =?us-ascii?Q?UpMxRXgxyUHFPHWuklMRyFk+YICmxn+sWdY8QMpbGwf1eI97lKsFZxV+qix6?=
 =?us-ascii?Q?7kKrqkXZKt6fXOUpuivuGqb2gCOVPvoOTZO7VZB7RBgCJbUuXI5xGe9K/j+q?=
 =?us-ascii?Q?mgeGtpAJ578xuCbpdKPxceJFEtAsfN56kBrnR0sywfqbT7kBeYS4PevwLZTn?=
 =?us-ascii?Q?FdNEkwoUkBm7rircWk3rum+mIBnYDPETACvrRG2OM3QwwHRC5brPUPA1muAY?=
 =?us-ascii?Q?2XIRn5QsOxK8EnzfKNh7SbTzZGrXIJ75SeSBknRdhwZLeCXK8wcQpS+sMLWy?=
 =?us-ascii?Q?iegM675lMBGobETGbQbtyEz4Z+CES0zPVlxJgG7/AQubeYlZiTHjfDmDYMau?=
 =?us-ascii?Q?UPpDMDEuJIBoyJ/+Na2SnLF6JAW/XerFNo4NLF8E5rakZN+QWzTmqlI5GLyk?=
 =?us-ascii?Q?lVr7k0h1QT5Jkuu2hf2AXFpBI0uIkondDUAFdJK1ihKD8MdAKr9X0EOncu5E?=
 =?us-ascii?Q?ObE53+NYt6RAzTtnnxCJCXssebOblAUFDDWgbGnoMOSyzRBQJ94TvSbQnTmM?=
 =?us-ascii?Q?7lJLyy0j1YfWKJhG3i2/jebeALYrDiXqvMouxxtNqSR+FiZkftCEmwF1t7Px?=
 =?us-ascii?Q?faGi4K2fO6jtcrwaCJgYayiJc0pVfvmAA0xaeCfieO+pLJ6wd5zkgwm+wJBs?=
 =?us-ascii?Q?TXXsTwmpydWAKbmkVi6te+SdrdrF46MKkIqf4iMXYeFpxyfB1uwoVJZZrmqD?=
 =?us-ascii?Q?1p1LYUadrijkQB45cQTDRqg7CB/soG0HB28j2VQkLgaKr5Hq9/tMoYlmHLqS?=
 =?us-ascii?Q?/MQYb5OWNoAKjBvUJ/dW7kyngKDEXj2Kx5rbPm1bM6FU5sVerRfMoIaScez8?=
 =?us-ascii?Q?FD6uq7M/Ydu3olLPdEcpFAduRSPA9dpnnwooFGmyXuL8T6Yk1w9Dz8EPJvXD?=
 =?us-ascii?Q?FQuK7m6+uAyBWcD7gVX8D05TKdT6NByfDnKSD8N6NS5Mm0qZ8lsH5fewtk3k?=
 =?us-ascii?Q?3LLM8HEmk6jQv/rLgCGp8I3A3nH8rEGU8+6pCYnGBTqhbNoumWiA9nsmI5mC?=
 =?us-ascii?Q?e7xi3cl0EHlDHIXvTlHiqaXeekatzQBCK5Yl0Rv3hwaMTtiaxxUlG8KgvR2q?=
 =?us-ascii?Q?3PA877DN30INySrfwpH4PoVWgJs/x0If9LPk+lKtR8cKIork3XJ/5HK8QMUY?=
 =?us-ascii?Q?2jbecrGy1BZHPc/ZcJATUB5CblpLfuTFImdIRPQ74nhpwQMyvUMO1gnRJ3fU?=
 =?us-ascii?Q?g1DZxDCEjhhj7MwmhUwnsjhlDQolHxGWa7f0hy5cvXoYWqtMWrI8YlUT1XbP?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41d732d-7973-496f-e29a-08dce148474b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 12:06:13.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaD3D9d605hVupVl6nIFAdY81ND4auHgCDVhqNbtkBQxy04Yy1aPJ/4ejKSdCMGnV+sBUq+hin95FFaSnwN+Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8254
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 12:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112602

This recipe depends on meta-python2, master branch of which has not
been updated sine February 2022, see
https://git.openembedded.org/meta-python2/log/?h=3Dmaster

Also, master branch of telepathy has not been updated since June 2016,
see https://cgit.freedesktop.org/wiki/telepathy/log/?h=3Dmaster

Thus, remove the obsolete recipe, along with associated packagegroup
declarations/references.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../fix-svc-gtk-doc.h-target.patch            | 15 -------------
 .../telepathy/telepathy-idle_0.2.0.bb         | 22 -------------------
 .../packagegroups/packagegroup-meta-oe.bb     |  6 -----
 3 files changed, 43 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-idle/f=
ix-svc-gtk-doc.h-target.patch
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-idle_0=
.2.0.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-idle/fix-svc-=
gtk-doc.h-target.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-i=
dle/fix-svc-gtk-doc.h-target.patch
deleted file mode 100644
index 2cd2c78c3..000000000
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc=
.h-target.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---- a/extensions/Makefile.am
-+++ b/extensions/Makefile.am
-@@ -37,8 +37,8 @@ _gen/all.xml: all.xml $(wildcard $(srcdi
- 		--xinclude $(tools_dir)/identity.xsl \
- 		$< > $@
-=20
--extensions.html: _gen/all.xml $(tools_dir)/doc-generator.xsl
-+extensions.html _gen/svc-gtk-doc.h: _gen/all.xml $(tools_dir)/doc-generat=
or.xsl
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) \
- 		$(tools_dir)/doc-generator.xsl \
- 		$< > $@
-=20
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb=
 b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
deleted file mode 100644
index 039cfc3a8..000000000
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY =3D "Telepathy IRC connection manager"
-DESCRIPTION =3D "Telepathy implementation of the Internet Relay Chat proto=
cols."
-HOMEPAGE =3D "http://telepathy.freedesktop.org/wiki/"
-DEPENDS =3D "glib-2.0 dbus telepathy-glib openssl libxslt-native"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a=
1 \
-                    file://src/idle.c;beginline=3D1;endline=3D19;md5=3Db06=
b1e2594423111a1a7910b0eefc7f9"
-
-SRC_URI =3D "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}=
.tar.gz \
-           file://fix-svc-gtk-doc.h-target.patch"
-SRC_URI[md5sum] =3D "92a2de5198284cbd3c430b0d1a971a86"
-SRC_URI[sha256sum] =3D "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2eaf=
6d0717d76f2fab"
-
-inherit autotools pkgconfig ${@bb.utils.contains("BBFILE_COLLECTIONS", "me=
ta-python2", "pythonnative", "", d)}
-
-FILES:${PN} +=3D "${datadir}/telepathy \
-                ${datadir}/dbus-1"
-
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 9523e78dd..163061ca7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -8,7 +8,6 @@ PACKAGES =3D "\
     packagegroup-meta-oe \
     packagegroup-meta-oe-benchmarks \
     packagegroup-meta-oe-connectivity \
-    packagegroup-meta-oe-connectivity-python2 \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-bsp \
@@ -35,7 +34,6 @@ RDEPENDS:packagegroup-meta-oe =3D "\
     packagegroup-meta-oe-benchmarks \
     packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-connectivity \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegro=
up-meta-oe-connectivity-python2", "", d)} \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-dbs \
@@ -167,10 +165,6 @@ RDEPENDS:packagegroup-meta-oe-connectivity =3D"\
=20
 RDEPENDS:packagegroup-meta-oe-connectivity:append:libc-glibc =3D " wvstrea=
ms wvdial"
=20
-RDEPENDS:packagegroup-meta-oe-connectivity-python2 =3D "\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-=
idle", "", d)} \
-"
-
 # dracut needs dracut
 RDEPENDS:packagegroup-meta-oe-core =3D "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker", "", =
d)} \
--=20
2.39.2


