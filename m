Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32069CEB2FA
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:59:07 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.105])
 by mx.groups.io with SMTP id smtpd.web11.74360.1727758734777106992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=iaO6yZhb;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr3Uo1xXpO+ufO8DMsv8CyB8U8VBOiVORvGJfSNeSWUPlsiry3oSYjMBSeccEj+TMnSxRiszhaCJjCvMgPs1u+I0MswGoiwHd3oPr45HIK+lwV+Qa6MBENjstoO3GmvKpkoPBswFKsAuQBi0u48lwTYk9r6FTxLtg8/uL1iThvqIX3TRjOISU/fWng1BEypIrh3SNUm+bxvI9r/crC1sFTW9fAPNVqGzWAQEN/V1VnqD3EEZUNZyWvb09kW8wax6Fnq5QPPcOcjP1puRvjXRMBcqOE2pHdi+lbyT14qkudaI3dDQw1R6QA17h6xhR/vMdzftJ4o/wsscSdvrA7WOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2qeWpV8vEBfLLMTtMrIrmdgFCXY0zMq+KREpoJygd4=;
 b=t4dUTgh7mOTC2VdXuRyO1wX+85QKYbcu9mKPQyHqf+fPx5E2gFWopS+W/TaxFoRLDkicQU1XAW+nQQGjUk0xJMlyvGkOvHYap+SgqoxAp/G0bOpAYz6T8bLOJJ2+mrAVeHFtiABV5BtcoKGU8ob/NgeQhW7rRSXxORGGYv0YfyNmzu8Pgjid6ZQRIna+d3iXW+e5gSzXGIaLwwX0PxJNRyFLJ9uxYI+MVG4Mjug69AGQhXYamthoqk1y0LEGoBuBCxod7eLDOLWSaWFjn5qmOcA0szkgWfi6ZtLXQfizjRbkp+LpBucK2r0HEuf2AZv1ZsX1034xlPqaXMbqD4fU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2qeWpV8vEBfLLMTtMrIrmdgFCXY0zMq+KREpoJygd4=;
 b=iaO6yZhbOBMvzl0TbuN7av3oX3iy59/mibpFnbpaxL06tVD1rSL8abj7E8jqxOUIaDFBOeYEWWbIAk936hs05pifA0ckykDkCIJ0Uj7Eumna56DWn0qzZab2QDjA7sP01BGNzeFAKmChza4tbt1ZM97w40ObdLbqScDC1onlWqQ//Pjd2hNZllNGBfb89DSfCELG17uj7INmC0i8wMgF6/595AMVOmS/13nfPfUOY/d+nHNplr0oHVTAliD8EYgaczQBFeqE8zGv8yAz1vQTWqfXBDEmjep+Ph77OLW72RPpyvEx086KQGd0crwK7Wrwo1FIe/Twawh/t1J3W9zCwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM0PR06MB6465.eurprd06.prod.outlook.com (2603:10a6:208:198::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:58:50 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8026.014; Tue, 1 Oct 2024
 04:58:50 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv4 2/4] telepathy-idle: Remove obsolete recipe
Date: Tue,  1 Oct 2024 04:58:19 +0000
Message-ID: <20241001045821.103617-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241001045821.103617-1-niko.mauno@vaisala.com>
References: <20241001045821.103617-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003840.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:15) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM0PR06MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 30226ba4-a69c-41c0-ba06-08dce1d5bdac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ugjzq7S5em4V+U322eGuhEzCkHCnBq5h+/Wsx4t2xSWRQ7qw0+QFSXL1atIN?=
 =?us-ascii?Q?6TQPP4vJdlBx8Zf+aFmyk8sT7X6JG952lNaft9kfgsR7qdP8V9PrgQvIwecw?=
 =?us-ascii?Q?Wh9zuEcWmhU2OWhyW8Wz1YbPnWfAlLXMWOBBoswy3iQWbZlxEopf5FgPUqI4?=
 =?us-ascii?Q?m7YDg5mm3pT/TzjhOiCmVdBzBoi2+whR/iTUtBEEA794a4QLsJrQTyljAZ9z?=
 =?us-ascii?Q?ctUOCHTNyQmrk8LaPmlB6Gnie/8XiG9F5jT8khitvrnrvACoEoZ7fPiKaTQP?=
 =?us-ascii?Q?tw1qpY/SRVDLtLX7WlDfE/itUOPA1q4Awtkn2U6UKMl20xT/Zq3RtHQgaDRg?=
 =?us-ascii?Q?1N6EpjuHy50RtpYuheVfp07g7n2Ls9MUEn7jeh4dXgun5svKMiNnehm7tisR?=
 =?us-ascii?Q?jtDDCuuWPYJygZEb52YtgD9SgbaXUPVnkdODCnoC8w4vS11sgHbd4D5sZs9w?=
 =?us-ascii?Q?+Nq4f5rzbXaYK3gOk27+19fiTNcy8/h11AInHnC8XVxkua6wxF27oHo3oxdW?=
 =?us-ascii?Q?yZGTgCNynN+gDA4BnZIT+PIGu4NGyRhqDaj8T5lE14iX25sr/MHdVHWaJY5u?=
 =?us-ascii?Q?Epv9Fa+/qSlr4w5HuElWSQ5EA1+DI/L8zddz8btvSgwys1JTHLFCm48nvFyK?=
 =?us-ascii?Q?TqLjcSUGNLwxCos1ViJjYpBXC68tm18badxJKFWu8AtTG9ed9sUHzQvUV9HW?=
 =?us-ascii?Q?DibCZv/uWWhJl649SLphqFV/pzU3JbMqXQjVR3bzhoiV3hL+V+IFLK8U8RCB?=
 =?us-ascii?Q?Lp5Vhx1G1L183mkBvCHfJBoJeE/+yBMmDfpDx4rCh7cMAGAEhl8Dof4CChEj?=
 =?us-ascii?Q?ZbsW8waq0JICiNWkQL3ES0bTRxnAJnP/fSWQK0tyrANOlwJrXmRvPdczMrQq?=
 =?us-ascii?Q?Ccv8WlkbsAXUA2cmlFcfq9YKLOWAvacO7H43vMWRjDAf+l/d9yp89lbPZmre?=
 =?us-ascii?Q?CWAZfiBWgbFxiJqksIXBB/H+9g1GgCYuxA6sJp654CfS414yF1hnPhCWXSve?=
 =?us-ascii?Q?K6x05ZPAimmuW397rZ33t9EC7mfKXcc38kMHpmcZ0vOsneF1XkUGbwl4WXKf?=
 =?us-ascii?Q?zKs2uhJxMUrlwI5HoJZkosG+JtJCt8OUfkVSqO1/kQu4iI2k/Vnw2ko1EEm/?=
 =?us-ascii?Q?XbuWerMfSM2E5gkv4jyD+lPV3rOyG9P95H4im7pZWEhCWz6bOELhNG8zFGrs?=
 =?us-ascii?Q?HP0rbkdivO/piMazl4lDtLLCJaigZk+e0IBe+FGIDXaeEtXySV8j4dD/5vhu?=
 =?us-ascii?Q?izRoiCVpWKUQXd+qr1rcvioCHa25om5KSJvMaCvdDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WXiXaQ4uhjqOO5l0P9OaF1cHm/OjloXqFp+SZn9jmTRGWBuEqe7e+e4Gf2OV?=
 =?us-ascii?Q?X10mXtgRKI3ZEU5M/BjgtRbx//13AEnNhBBDEgoYAWYtEJQUY9IbcgPT0RzC?=
 =?us-ascii?Q?u2jS44uY5e/3RSwwBj4Rb18e2WlWZzciYB9X5jAQDjB9OVeUOcX5WkXVzZG8?=
 =?us-ascii?Q?2/6APSh1+upfXNZec2pR0VeoEdktvvT87lOvP/dxVRiEjWGX7EdlwC3UJ6wF?=
 =?us-ascii?Q?84OL9f84hcgIRasHYwcPZr2oBsf2KFudNcYP76AU+1KFsmCg/j6C/qS8ihsS?=
 =?us-ascii?Q?roVTp+PNfVBnS4BUe5EuqyRaR5LtJ83FlLrkqDybmqyz2JFTxEpV+2koCiBs?=
 =?us-ascii?Q?+g5bG9RdmskDrb1Oty+RC1NLMCxX8KuCUV6YAgdOqeRKCwum3tUxkT64rpWY?=
 =?us-ascii?Q?3ZOba+hpV7ApCB2ME8Ibm/Bjq2OOCjuiyAgzMIFwLNlaFPnpEcYAW0OWEndg?=
 =?us-ascii?Q?PVmGi4Aj4TZyV/AK7S5K67u9fB6z+9sCNB6F1jCY65QAYKo06+4esWCOdLY2?=
 =?us-ascii?Q?Ya64LRqgHTcPv1gHTYPtiywGlxqGRRhxWXJ0PYjr1fHSWIBxBKK0V++4rsDO?=
 =?us-ascii?Q?0HRygNnQb60RktSVCkJTZ1nbb6TGvHk0x/m+33PDVuiI5JIcm8vxnTgCHnXK?=
 =?us-ascii?Q?9gp2ZlKsVD1DS03MR7xTwmX9wI70dk1F2bszc64OXosCjsAkm1UPt/3kyJiz?=
 =?us-ascii?Q?Gn6OqnOIv5h2W5sKElKpPbKwFRWSnD4MKqobKAIiUD0bGvPFArjLZq835ntK?=
 =?us-ascii?Q?vGJD46cwnUuWsJ/0qjZQoJfSxxBMMXiH/ZV0GeFftTliwtwJ8AaKFnf83YZJ?=
 =?us-ascii?Q?uR6bE5OL7n8s7uJPoDef1wazgrH0juUT6ZOWGqIcpztNa07kUgZZzRkydQug?=
 =?us-ascii?Q?rGq4UMKsu2ZltxtAoRLAVXNnEIY5/JhuROO8NTKVStmmlk/73aTo2/S5N4l3?=
 =?us-ascii?Q?7D3EiVEf5p+XBGqAEGCe8KTHxWaSgMatjazbyL3PsE7Xa7CaM329FM9zXm6l?=
 =?us-ascii?Q?NYka3ReeqIUeVLg8gVGIqc6ZcCasDNSuszDTFfhQYuwE3Ddh22z/Qo+sg53/?=
 =?us-ascii?Q?wOvcJEzrLk1F392LjaFQYZs3UBQNoHnS2QYtu6adg+5dhPCYTDZlPC7BT3rs?=
 =?us-ascii?Q?VxDygszZUQfEDv6EZml4c97ClJQQixF+9woHMvK+EQpCBkQWvtRDTVCdXKUS?=
 =?us-ascii?Q?eblYXu+TKie/9kCAP9fVbo9L5F0CIRqrhxqwpEtBVfZRgkKUKepjqRDn8ETf?=
 =?us-ascii?Q?wWqlJ7jFYCvMhvXNvtRhafTL+FNHjSocEhDd0w5Rie9ee01eMhzN8bpQmIVm?=
 =?us-ascii?Q?bVumF0jW0cXvim/cxN6YU2J3Ff7N9+yC4R3Y3lHgGNWBDAJnx6r7asz2Sp5Y?=
 =?us-ascii?Q?h49Y4eg0O7IUsVQjTRQgC9Dl12ss0BKCCLFX4dOzQSHM7BCLMeRuGFGPDKBa?=
 =?us-ascii?Q?QOOtqwLcq9xW7sVlpG5/5Uf5YDenJiKMJ8F5qzAxqPkETa7ItzZlRKD/se1r?=
 =?us-ascii?Q?+/DEN47kbbVyiTzAIAiZ+GLJ0wxOv3uoYkBGhP8MDZYb5nydLztsWEg85G6u?=
 =?us-ascii?Q?n9ENwdTcypmBjRYYsGGNHyyKIMbCcu3J1YAV52kIxwbWnetbLas7lqwXkKBN?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30226ba4-a69c-41c0-ba06-08dce1d5bdac
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:58:50.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkvM4eeV/OVvC4o+3X2A7m+l7k3Zo67v3Eq35d7Sfl8cbpyYlBref9PlfGQZxgiChZnhDUcpiOg8qZpHVB5mjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6465
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112626

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


