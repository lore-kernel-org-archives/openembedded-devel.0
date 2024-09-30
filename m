Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C3BCE836E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:26:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.106])
 by mx.groups.io with SMTP id smtpd.web10.59036.1727713570740389019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=hf2OioDQ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.106, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+dtL/nwbZaOgaipW55pg928t9ANcmaSR6TdYNqsjhFPRweE9TK5zhFZrhpUcvyFem6BATOq/+OF9BPiDuLhWOraRMnlWI5G4sKDUTa7XdAZmDQpyL2B/CKA2lqaOawPISB8oPd+g6Klp48ijI2AieOrObNAJfea2RFelJMi2lsiJMPLKzJqG3zkWHrPwKCknU1y1z5XwGxpHWqgvOOsI0LVVnB3107OTwTRJhM1ZOjyVphsDydijjA9CBVeb0KQ9uxGgUWjqjYIqLo2kgea9P4it+3rtxJI8DAOE5Dab5r46q+c0xez25M5H+v8g7rjFBg/1vDbrnQAmXB/H3Gx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2qeWpV8vEBfLLMTtMrIrmdgFCXY0zMq+KREpoJygd4=;
 b=SHorNz5lev6BzVjP+5wv5GCIXCjZ+2Eq+tvDLwk3/13qrBvI5LL3EshH2Mz/3gJoN3D/4BIUk4RPldtui/KLFCAAdkH7D8oBTPFH8TuW/CFhzTCOKJnbNpG6nKs62n51dsW7N165DCS6rvWau5XONwpqAI5MaDWNuJt+iWeSTc0XTpxFt8/8KNT9Rv48FqK/SCjkvaLJOZr5Pbb/4ACstc+FB0zgnXYD2pH6+cRej2pAN3aDe4F8etj81KmQpCXbbAwndoFEow0z9dvepX24ZeVuvZnOIpgIMhagRyGtXrFYG8rRhRmewLfyzTLRuaUmf7T2W5vn0bYraOFZgL9GUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2qeWpV8vEBfLLMTtMrIrmdgFCXY0zMq+KREpoJygd4=;
 b=hf2OioDQmmdput2oToZ3OcKXPKs2NGYxeqaHRN8hKi9UZQuCwQa16CvWTvzf2dq3H+wi+WEDYPlVH/+SjMc+3R3Lnlcn1oDOHenbV3XA7M9SofGInb4EC1X+QnXLrxtdD+iNTcVGhgOG6pJb8jKq0q+kFOs9b5l4D3bDInpi9XUgyzbjWwJ7m3bOBfSt/Fg6F3Y9FJj37Me7NX1MN3AagQEliU99BjQTxOBKQGXiTiMMQZOWlJTsc3X7w6wHIH88mUq1apCklzalGL2QYwsc/KIUKW0dH47Jkmxo7Oo0QeuZL/ahQGkUf+FyjohQcWiJi9ua3BYW+9VdJKLWRy+lUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6426.eurprd06.prod.outlook.com (2603:10a6:10:12a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 16:26:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:26:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv2 2/4] telepathy-idle: Remove obsolete recipe
Date: Mon, 30 Sep 2024 16:25:30 +0000
Message-ID: <20240930162532.4064184-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930162532.4064184-1-niko.mauno@vaisala.com>
References: <20240930162532.4064184-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 72566292-cfc9-4737-8196-08dce16c9585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cCNaFcqZTcYHIEdP9v892riOqZQz4/e0VcjXeJIcS/LzcTmJ8jQlug6K0TaL?=
 =?us-ascii?Q?tV0mkAhW/QkFz8O6l2UZAokz6/sDHvrFP4BSGaA2Qirylo4Yc+vHjkuR5r5x?=
 =?us-ascii?Q?czG9/vZiV+17pRIWw4o/iBaMIS0DOK8qNKyNe8UtoZwGovVK1Zl7rL8QHsNF?=
 =?us-ascii?Q?3zXwCU061gvgt0pclzeiJFWhwEUlTlAhkTE8Am/tOKfEv33XBEjbZ2WKY8/N?=
 =?us-ascii?Q?Z6J7vIYA/R1v5ffbqoYnxnGXrqP9G+z5wIa7H5zpIqXYY/lUmVCHVjOpA7p9?=
 =?us-ascii?Q?DDzJZXnYJmo3G/x497j2ahDNk5hUoQia19b/lK1/wCyO0itq9Sx33v7SGe8p?=
 =?us-ascii?Q?BY8wC82pW55LuCywrPBMUiWhfqXm+6KPny0Ea3qIfPeBBwDyPLBV3YLD442n?=
 =?us-ascii?Q?nYCOUNjQwbjq7xYa/gzcp3BYJHyy35esCFHV/+u5CDmYgWi1lVIIpSfjVpqd?=
 =?us-ascii?Q?tS5YKSvvjcorbLwJs5kWYbh7czB/IE39vVvwbnTSJeIyppY2qkhUkz6lCyOt?=
 =?us-ascii?Q?jx9grLTDtLRGI/CwLIhptrCaTjlxr7qPJ6kcAxP1BLuCBaSTPKVQo6xDvC9T?=
 =?us-ascii?Q?7iyOP8+dRrAtAFeqlcJ6coDpWYMjCQZ7yhJ/HSaOnlXMoGt3br+zVCROKhT6?=
 =?us-ascii?Q?Xa1/mQzhKIXSpz1tGQFtYy5+zPYDMklgXhExvQeUkxcZNWiOlyLP4dHbdp7q?=
 =?us-ascii?Q?7/vULTe6uUt7qzYCWO4HpYjQqgRwvRrFzB5hgIQqEe9rk+P/s03JijJVm1pV?=
 =?us-ascii?Q?dD+4kzfqzlODePa1eYHJgxOYiTluzPb3ncSbdOUHUXmWxAXybuC/HyPhRwi8?=
 =?us-ascii?Q?lSIXnMHszqvS+dVSCZWCoybSQv7hYTN/qbTmGLLGUReGwgZKuUEMWZ868EBf?=
 =?us-ascii?Q?qaSTkj/IECsARAoZe4AzYzE0tXa3GL/CBgtFJ8vWTHwaiRNF/bLU2r6KTb5T?=
 =?us-ascii?Q?DEYI0tejoOF3zotRkL9Ujk0VCuBbp+lu8TjQOquVN/2JaiEZLj8vbTEBgVol?=
 =?us-ascii?Q?3ewHciLRSB/4/fnGKUCEpVSlvvZbq4cOJ3e9OkAErMCvXdxjChD7uYaXPlIV?=
 =?us-ascii?Q?lNmj3fCW6frQPsx5zey6zzTFhdRfVbxWR1QkZ+xDzc2yBSC4SrfAWtEuvaF3?=
 =?us-ascii?Q?ngMq515wF/vdahraqpbI3458YoP5Mt6YKyqj6jTYMjKL4Dgm0UEOAkGh8BBi?=
 =?us-ascii?Q?peRpu3/fBHIbaSQQSXOuqBIbVdJUh6end1//etENuVtROoXvRuuhJrvzpavH?=
 =?us-ascii?Q?NgEHuKrP1DupaV5j0vQEYFROWgp5qvTMX24+wVk6Lg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hP7gvCkUE4IbC2f8XiMogTWKohFD48buxkf5jYuIWdmzQixGXsZXphHv5sOR?=
 =?us-ascii?Q?amvog4548RT+GxbkP8fxu3ZQbvyJ256wykCiOL7yB+ThUwE061WmwxwQAY4n?=
 =?us-ascii?Q?8mD8sAOtXnmUQy4dLzB6blqnRjnXC56lioPXUQwcKAo4PCk7Ju50NMfwBCkj?=
 =?us-ascii?Q?0U9extsIaxNqNQK7G+5VKkD0CMHlMpkJMv2e/ejKozxs9yo5G5LpdY8bLET0?=
 =?us-ascii?Q?vajN/Fkme+DJt8yBHLBfE2LCOFCn6aLd51URKlJMpILympPd47GuHjuuPbrT?=
 =?us-ascii?Q?w9E4cPYiA3tzown3c9OQ4qc++w+v5MtFlqHLlAxmS2x48a+ecvdyrLoN5EOV?=
 =?us-ascii?Q?WhP1hbfsFkrkBJ2qv6IJc3lDvfXUYOCVDSIAvxzDvZxb8gTO6KP70Xa4QRQx?=
 =?us-ascii?Q?kPQFZINvG/wuozRNrx31hdC1qjbTk8KfRTbb/En1b7E5+/9DwV9tbf3obgXF?=
 =?us-ascii?Q?5H90yJWOosnic3iw/oqZxjjdMyL4lU+5u+Oj9MYssBss+q5y08KLGv7OeRhe?=
 =?us-ascii?Q?9cxiYHvmLWHclN/uO5IEaJFOur4Q+VEwH9OXQvEeZqg7ijfkNa1DGGE7MJ4T?=
 =?us-ascii?Q?j0Y0Vgq3B+f1klXbmaobm5ngogffhNIjttp/sejoMpNXBiOwvyMMk/Xs1HMZ?=
 =?us-ascii?Q?x5P20EErNiiOq9FJQZgj5VFxDdSZfx3hL+TC6mySGBp48kdXPzpN4wU5UaY3?=
 =?us-ascii?Q?9IzrFa2b6MfuqjdfIswnBf2WIgzim6WYGamVjjVly+L7HDWa3LG6hrOp7sYv?=
 =?us-ascii?Q?/VURxyHRbo67clOvPDUx14V5Mz/ePWf90cAEkpnn/JxXtrpVQPE3sTc6WJwK?=
 =?us-ascii?Q?6ZChlnTv/ypg8KZpgLpcF1KsCuaugGu5h+9idqXEDafu32klBanqGqhkwTyy?=
 =?us-ascii?Q?zmb0tPqfyeVmoQzQDMh5g4fStdmuEj6mQyV5knA6CiE9IUssuReHQGE6wPP8?=
 =?us-ascii?Q?d/5EPF/h2SfD+idbdWq5DAF2GpI/3icrJIFwbrKNN1Wb3NbT6Gi5CR0gLoAm?=
 =?us-ascii?Q?RFChL0Al5p10jhRWRMJCe0r5SKnE+ZHVG3wbrCEnd9jC52tfTbGivrjIxJ4T?=
 =?us-ascii?Q?+nrZrwzj5XHY7hmwcywkC+9p0pwJo1mIJMmiVJwYt8fLbkkk+NyUiJ9JYaGH?=
 =?us-ascii?Q?Nx/kf2H9lzr4fzrYUP/Wc3rf+2PtlKmwYJhC6vWuUg8FzcFOQmQXHlYMq7RV?=
 =?us-ascii?Q?R5rkemadjiOQOr3O05BEEkMhnPegwJcFEvYAGEj6b92bj/yFH6PxfrytrVxV?=
 =?us-ascii?Q?CccN6yN4R6wqof625U6CXq+P98ewWeb6f4hvpiceROwLbgHklAfVpG7J/OBj?=
 =?us-ascii?Q?LhU+gFipCZVZybqtJIoC8fTOQKKFRR5fQsHtc3pzkR/eiMjAQUPpiotsjqu0?=
 =?us-ascii?Q?TWInK6WBtP+zf39FPLowTijJl2/TaO/3Fam/tsV3dpm1oZkdvpvBj0pKtdQV?=
 =?us-ascii?Q?+cFSwy0zS4b71LX74pDXl+H7VbZY51Vp0xdW7RzWAheRdUEmCJassZVvYFEr?=
 =?us-ascii?Q?aBeuOyv/ZEFEq7CMvTNKfjI2E6MaoiCsQ5mF+VMRpToorGn2mqsmgb5qoB8n?=
 =?us-ascii?Q?uHeWlqb9jYPdnomzrJwuTwoRaAV+h32ctO0PY2mO3hiETXSmNoE7mYOGnvPQ?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72566292-cfc9-4737-8196-08dce16c9585
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:26:06.2053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8t6RXgILELReAA+MLmvIMjwxdSVEQFCckhtjxit9jJVNEPNDQ4oxIhrL4ucdGy1QHtEhfAVix3ghJbGsnNnZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6426
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112609

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


