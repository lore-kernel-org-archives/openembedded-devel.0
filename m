Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2076CEB2F2
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:25:06 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.128])
 by mx.groups.io with SMTP id smtpd.web11.73994.1727756701186100776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=GIyGDSsM;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.128, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6YqRk1ktgv7hstxuQf5ndW4FeV45w0J4Ro5Tk4BjuI/MbVzx6tWAwza9M/6TQ+RAaqhmomZqmFJE/r068ibUTonBPGgfrQJxLjKPGMmj8xOirMIUKVT2YfA/dbNoHbY8uqrM6OnWwAS4eKhG6V6fJiyTwLBXOaJX6K5ZrkGieRbqbiQLEUZJFCaZq5n8XYuGkH0vR+2Bc4YW+ALJohEcYeoPC9b3B9weRwSI0FdGoNK1TaUEBfnTaQsQLYWvNpnoi/F5sQAOeRDIUxTMo9sBQSzijPTIEoEEy97CTEKF6aPBATjLdtgnRWz4w+o4pEsxgEZEDl5u8Y+q8OPHTw8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2qeWpV8vEBfLLMTtMrIrmdgFCXY0zMq+KREpoJygd4=;
 b=YoHAq7CTBNn1cohoLXio+A8Fd67fzG63UQA8yCDHjI96zRpxvXjGJNSozKpPlMXFkOdA/I40SrctKMwYpUmZc8odQb+sq6V7P0TP7WlwgfVqskmR1Dab/XK/zwjvIR925jxfXV7elV4PkYW+eUzrdi5upECRGiwxvAEhedDpeGLIt3XZuMdDRxCKy48Ftt4fc77dNWkdPElZidphRJveuXhcnGESoqN7053/QOIaRY9AKZis7JdqX81/lmeAKz6FpaMrd/Nt1B7mieJeuXz5Kj39RtkkXzhXNzsGgAW1gJzAq3/9jWmPCe/qL9DKLICbXppAN+MwZ895p/XEhuoWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2qeWpV8vEBfLLMTtMrIrmdgFCXY0zMq+KREpoJygd4=;
 b=GIyGDSsMmoUmznfzgCkUF40ExGn6v6j8nXgPp9dS3sjcGhlaHt2NTIABc7UiF07ikRi0ssCP3dd7ePmLcifZnWBu7R27AKRWb3aiBioZovVfk2T2HKGNIQtGn66K0dYX2t5LqpWWu63737yNpqSLI+mmnXn3vtzEMHrt0Yw90pEW/v6rZbpB5J7NIRyL1dflzwJ/z5n++1TMacPUIK14nPUXo6wPnT1mRELqvsswtv2FrRR+Nek130yn0hmLp5mP/xCf9RCyX4yVCrefrwJhZn5BL6M737UOnSZoz4XTStuqZbXHFpY338W+MGLEVJWgCpNsJKiUhmHu1Hu7SBeaew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by VI2PR06MB9500.eurprd06.prod.outlook.com (2603:10a6:800:223::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:24:57 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 04:24:57 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv3 2/4] telepathy-idle: Remove obsolete recipe
Date: Tue,  1 Oct 2024 04:24:27 +0000
Message-ID: <20241001042429.3651-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241001042429.3651-1-niko.mauno@vaisala.com>
References: <20241001042429.3651-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000384A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:8) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|VI2PR06MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 763c229a-0055-45a1-eb11-08dce1d101b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ycWLv712SvXaW0LqG/DG3p+OR+kPjci5muX+3X6QZiZhrzVxMVCuv7uHuHub?=
 =?us-ascii?Q?/BhafZFBwYI7b3VBj4tLBY+r1PjJSg7yJFsMlizw0+2HJedZHjdlKqpsbRtC?=
 =?us-ascii?Q?qy+c835dYOKiTb3sZ0VgV+t3OzMKcl3sfBnsBPKqhlf5r5flVlv1fsYHkNvU?=
 =?us-ascii?Q?qHVLlkNEWn2tHPtZQDWlOlwiO+7p8kEXy+clAj2E5t/aSicXESBOqGmTn39c?=
 =?us-ascii?Q?2p2TyIf/WjkMnQCV4YuGt9q+24xQv6LkjfN7YQTYruhcRvSYSMu+EjRU+6KJ?=
 =?us-ascii?Q?YQ3JvgEH262O0j4D+Ii8baBGHLo0F78IHzZdpCmgkpcaOO0wybLSQunrMEh4?=
 =?us-ascii?Q?USG/oVN4v0p/ksLL9hKiYGFyJObNeVkyrn1z5wC6ZmkwUqRr5vp0eisG2LtD?=
 =?us-ascii?Q?EEA+H86OLGn4j4fzz/z+EL1sRFip0YF2apkeJwjf1KF6IVVR0BPkzK4MCre4?=
 =?us-ascii?Q?hvx7bd2urQHmYo1erWewITC1cBJvSWX+iiGKMwPlg/aAXB621qQoNPjucvlH?=
 =?us-ascii?Q?Q80p05z2jUB/ELKM6EHffTMZy7qAfu5qtnzbxmxqRkuiTfQqK7VGyT4kOg7M?=
 =?us-ascii?Q?nuwf1R7Y11VKUOHxcFC7vL2H0Y9fzR+zsYsfrmEjmeTzar4mDZmKhxPCnqmG?=
 =?us-ascii?Q?Bo4I2F6vap2aNvUUBkm2757CFU1Z2yH4LVMWiuxq75qxFJv4cQEL97NhWz1k?=
 =?us-ascii?Q?6MCsjT1a2m3c98xDEaiZkNPBVbey0dugC7isBSjVgZRwUNLe57ASImsBvmeV?=
 =?us-ascii?Q?99hCbUQy7amkqOFqAc7uWASj82T44Alss83WDjV8fzVePVTKMsBYkPdd4tEt?=
 =?us-ascii?Q?Xb3oraJdzLOkDmMi4AsFC0F206zRzUmoEnShKKPN6r8+0N0uK/2/jlO6agAx?=
 =?us-ascii?Q?v0UoMOrSufULETvoBqadlkThvQL84pZ1Z7v5dOwrnnId4BIzz1+OHeAtPmd0?=
 =?us-ascii?Q?hgZPTr9nKtslZVmwRxYhgwqBJHfZ6IjoZKyJO10Ei+F/nsP4s6Um6m/q7SlT?=
 =?us-ascii?Q?aRx31Mudr5n0Z8o6Q9EjktG9exoBD5jOtVGY5CuLHcGWw/QOTB7uZvDoX3Ld?=
 =?us-ascii?Q?4rz7djOq5ULCRMnTCesv2cqq0CKafRVpetrikvihbi6n9sQUYOyikBuXVggX?=
 =?us-ascii?Q?SAFvfa8jvbvji6cUGsfI+5uH9q86TteQuBo9uxUL/IBAM79FSRbQQ/a91Xxw?=
 =?us-ascii?Q?ObkM9tazZ5ApFQgo0sbLvAvSJhoyleRqS7e2VAHp0KIhNOpO1pnxEPaHrRUU?=
 =?us-ascii?Q?w9+nTOUCdUlSJw/+ysiqBzY0Ez/7/CpaS00cP1Bm9Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?42ltybEgs+Dko3UK2litONuHxij6nKgWITusnK6iU63TS9V5fngPB2+QR1vO?=
 =?us-ascii?Q?k6AKhXY8qy8fMSCF5gkDwDl9U0QvoJX6IKZYBeUvPckmYmv7Js/urtgeoHOW?=
 =?us-ascii?Q?MLWkWsxutXDigA6jFTmw936auBmZ4lsHbSCTa+LoSB4rU+12nPzWZBCFfWaN?=
 =?us-ascii?Q?GIfgdPCriRJg8KsS3jMTqtJRobcObXyFLemR4hcCyMTH9e4Ahbn1OrsM5zE0?=
 =?us-ascii?Q?GNHIqb9p0PBg1niRUT6zUm58ddduuuIB7G10wYPGG0KZtp/oL5+9AAkYgdSW?=
 =?us-ascii?Q?y/kg7qQyvOF4emMNpRnq6+aP/j7Sq84V1fdjHwNwSxdF11iL8nvXLTQWJa14?=
 =?us-ascii?Q?u1mRirVyUpycD4pkt08nJI0SF7YXvFyy4XW5mj+8JheBZTFNXfQbwV/KR+mt?=
 =?us-ascii?Q?mZqACEfzDv2T2MeSPBBoZyEjUQCmAHX2S68vPFHF2bSxWut7fumf1sF/sQc8?=
 =?us-ascii?Q?zsgsWiPfdOhC4C8RObXYrRBUaIN/x6QNwNmhU+JKf6l7869FfsrAl6S0NebE?=
 =?us-ascii?Q?1FcpO/mUj/BbVGYd9GQyV/pdC+kTn58QAAhEOp2FJQNzdVIGpgUpyz9/BgJJ?=
 =?us-ascii?Q?Ermfee7VcfzT08NpGUH5xwkqilibQNA+jvS0gnhePKmE4+lPU1YPBTdbzL/4?=
 =?us-ascii?Q?dc0lBGrdaC0t1AK6eBN61PI37qniQkMTaubB8o8jpBKw8xO4nkJZpHfgqBF+?=
 =?us-ascii?Q?zFKrMsE61DSj3su7WbxSFnRdw8mglxkp8mZBDrOY1xPHPF5KcxKdwDhkYmuT?=
 =?us-ascii?Q?wLgzYhgHjERdP6j34TQkVfSw94mWww/tXkPVavdv+ymCUv4RPggN8REKZfow?=
 =?us-ascii?Q?TlIixF4BF7aad1Mk+VhAxK0JmvlJZjRplRFWL+kwTmRrIBJMkqT/vTHAmaQg?=
 =?us-ascii?Q?yNAdD/66luN7/GbN7Gb6UCyjfXrm2wZfLVdviIKQHX/K6RRX0ZAxZ7+dUSLy?=
 =?us-ascii?Q?DGKjJ1MlGAo7Mho+r9eF/3hsGqi4BhNB5b3ZzXvx52OkJ//KwMwPpiWiELIi?=
 =?us-ascii?Q?Mhb5Q5cwlmA42ZygNn9Zk5Kl00cJihGdfIAM1ntT97ZR5sTYg8NkKIzJkNH7?=
 =?us-ascii?Q?Ex7EVCe0JmtjXD/B5ccJvuOePBbKCki3nxk0UVrNqHi6PF+sKhzEu1d/E7Z1?=
 =?us-ascii?Q?W5a6oJewPq1tUkqAgTQue9JZ29ejQ46UeFp13HCEBejOsHIfNRQCWCEprz5t?=
 =?us-ascii?Q?f0h5R7Li7EVcBn1tsNQqBcVrRDkjilvuGHkajOsfpAUqa6L1isbIvAWkwubZ?=
 =?us-ascii?Q?Z4kgp8mwUPtm1RjFKDvW10s7fgIwL/bfltsc4TW3WfMsiqFVLTa9JZjyI56n?=
 =?us-ascii?Q?LsDfKgo0A/vFAtJCeaQopqYbMtDhqA8W9RR8M2q9r0WXqJcpYKFH01HydjQq?=
 =?us-ascii?Q?uK2ZCNwywAHbFTxIh5NbORu21xchE6PoLRt/Oet74JeK8V1fcGRFiGp9hd8k?=
 =?us-ascii?Q?53UDHfIWgvgSP6XTQzW5wh9IY/ZnywHR478DNFxI4NRDF5jaP72X3QsQiQle?=
 =?us-ascii?Q?2RC18Lvz/pgoZMqqYSEXf/rYSUZqYLugebq7Z9OFKP1rX0ehqe23S3t7pPMN?=
 =?us-ascii?Q?TUmRcyFapwefFfdn/Kwcg5DK9r5VmuEZWvdojde8T7JP+6Ib9rujqg5bVgck?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763c229a-0055-45a1-eb11-08dce1d101b7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:24:57.3817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKLP92NevSlYFU2MRvcjdhD0dn1sR6VuuCaHCKo9YE2fCV83cRO6ucLWvFClQ7jJe6D6xvZcfgx9ceG183vSag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9500
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112619

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


