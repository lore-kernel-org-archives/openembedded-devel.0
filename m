Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1968CD128A
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 21:08:53 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.69])
 by mx.groups.io with SMTP id smtpd.web11.150520.1712696930527831847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 14:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=okXr3m5M;
 spf=pass (domain: axis.com, ip: 40.107.105.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOe8SjA60vy7VZYeUYt+gcxBTHnL0bIfxRm73gpQoLjbtnNhEzvvKvzBPxfIk0T+fLaiJNctiohUBcJi/eTjWQM8SNJMqpYQWHIAUq5Cpv/Q95JpXmUBTcFSxynp3iBNy11/FGAAae4jjZkpWA47upwb3La0oHjB0TGqmdej06+KT1ArPDJ5PXSP9fxMIZpULf7qOigJOCLfESVBKIJTuYwbXqTUBjUhlWzxR95Oqa8vlblgCFAE0+Dw3cc96rWJjIktQNVHUTbvIawS8WaCIMcbVvBM5NmS6MTnLQ8rjYkKP5hlBG5GU8sLW4nu0U7h/XQOem8S5tqc5Fn7hvLqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5/pO0qaifKdNMtvck4KT3yGQsxatdmWSL59WhqLbrg=;
 b=Ro9P2F1i0DGbEH6ShRm2AVpZA4Vqg02sKPwZckM+hsn/nL6yntqU7vD/p2jBld6W6iG19jUH8CupbLPiU1cyk+LpbTrUrfI73P1fi1+pMdfySUU45SmtGy3tSkK05ieA5qhInTIrhQhGgbV+D1CUTHw6uj6y2JmzQFMt/PSiraV0OOQ5osuStdSO5dbmodq+ftnGJtGa8fN5T8O1DaZPAKJEbpBarsM2tsPhQnwDRzxL5hE5RPwGyHaVXz63WPe+aWWj1dmM9wt/11v06urcueBSnDslpmkQjBSaSOemXlBXCOUO9ojML8Tul81ozaKoNOtQTP/CHJj8/+L/HUfGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5/pO0qaifKdNMtvck4KT3yGQsxatdmWSL59WhqLbrg=;
 b=okXr3m5MQ4WH4r7NqP/u1eQx2NaVE5oxKSLFLGK5tfK3WBODumoQV60XBI58ZSf6NKlNuEkVFVOsrJURVDiCmV19IaiWk1s/+fCOcgmDttomZSxVcDNQIsvALkkLYQqWB5C7wJKGIrsfa5E6NTHf4pFOAWHIjTkbq3OSDMXcHb0=
Received: from DUZPR01CA0099.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::24) by AS8PR02MB8520.eurprd02.prod.outlook.com
 (2603:10a6:20b:549::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 21:08:47 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::3b) by DUZPR01CA0099.outlook.office365.com
 (2603:10a6:10:4bb::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.30 via Frontend
 Transport; Tue, 9 Apr 2024 21:08:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 21:08:47 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 Apr
 2024 23:08:46 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 9 Apr 2024 23:08:46 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id A1779BBD0
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Apr 2024 23:08:46 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 439L8kfc2120199
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Apr 2024 23:08:46 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 439L8kLR2120197
	for openembedded-devel@lists.openembedded.org; Tue, 9 Apr 2024 23:08:46 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libnice: Update to 0.1.22
Date: Tue, 9 Apr 2024 23:08:33 +0200
Message-ID: <20240409210833.2120185-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61E:EE_|AS8PR02MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4abdfc-6a96-4f34-25f6-08dc58d93f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WKa3EkX2OMQJhMRh5ClL7xVuRhrrabQG4nfXsAY5eDtNV6pGWaBC1O1DemlTV07TjEoTQUZ5ugVX3YFrplLZtE7UEz2wnosYQM7++ehP6M9mDfkRdBIaWoqrb9knVYXraEPVGnq4JgmOwR1YErCsdv3zb5wONbon8uNTkIs7eQ04Q5fuFWUrcYvcd7rFV44Z3s4FuTuvz2DUg9iE6GGaxZhPeh6gfiaiv+Fhl07y0UPPZKdBYV776MCRTcgde3laSJEfNCBKkKmlvJ5GhZwiPjXGzyMM3+Ttslc2Bzm1Bp46LV4WzteZucTfMOEMPW8YjKIBbG9hGT/NN/4MT7eVNQ1ZxoBw1pnNjfGk9+HF2zeLvaGvbOzu8yCkQE/PJ4uTFRFjn2hDODkTAjmmin08FSNPeEL3UVHWiqyYSPneG4WHIQ5UTUwblrUo76Vw1a+ytl4Q8xbDEpnrDrjl5/hTeEStwsTXckAgndHEJPDiNscA/7Iy/nuzr/MXKq7K2WKXWJ9FMT1THXX4K0a3pvsmFl0hivCuj0bYupQAkbgDH3JgFA3mGZLhrOUPn4Y+LewVo316/A1+HMVBF0N4CD6l/1HdQic9H0cS6+kiCvr87o7f28FeWtSDF/K6bMhYqtNTy6R2r6wQdyudTCeiGmQ4BfNE8Qc6+q2H9L2yuH6GRcigdjipBxoyRggrVMekKOrm6y1rT1lpAfJWtrX4hVe3MA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 21:08:47.2416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4abdfc-6a96-4f34-25f6-08dc58d93f51
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8520
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 21:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109886

Changes since 0.1.21:
* ae3eb16 version 0.1.22
* 4d14e61 tests: Reduce the printing a little to please libxml
* 2de7472 Change padding to be rfc8489 conform
* 69840fa meson: Generate nice-version.h in the right builddir
* f071eb5 interfaces: Avoid using strncpy to keep NULL termination
* 332419e interfaces: Avoid overwriting the ifreq struct
* 2188064 interfaces: Don't iterate allocation
* 952d837 Include TURN sockets in nice_agent_get_sockets()
* d053572 nicesink: Protect field access with object lock
* 504189e ci: Update Windows image to latest
* 245c856 nice: Export nice_address_is_linklocal
* 60db3b6 gitlab-ci: Move Coverity build to Fedora 38
* 4b63250 agent/meson: Replace filename with basename
* f456747 agent: set consent timeout to value specified in RFC 7675
* f3688cf meson: do not build gst test in static mode
* b322577 ci: Remove keyring update for msys2
* 11df9cd ci: Update Windows image to 2022
* 63f4962 Use ifr_ifindex on Linux
* 37f1e24 Use ifr_index to fix build on OpenBSD
* f4e2838 Fix build with clang
* fdbffeb version 0.1.21.1

Move the recipe from meta-oe/recipes-support/farsight to
meta-oe/recipes-support/libnice since there is nothing else in the
farsight directory.

Also remove additions to do_configure() and do_compile() that have not
been needed since the switch to Meson.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...meson-Replace-filename-with-basename.patch | 40 -------------------
 .../libnice_0.1.22.bb}                        | 20 ++--------
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-support/farsight/libnice/0001-agent-mes=
on-Replace-filename-with-basename.patch
 rename meta-oe/recipes-support/{farsight/libnice_0.1.21.bb =3D> libnice/li=
bnice_0.1.22.bb} (66%)

diff --git a/meta-oe/recipes-support/farsight/libnice/0001-agent-meson-Repl=
ace-filename-with-basename.patch b/meta-oe/recipes-support/farsight/libnice=
/0001-agent-meson-Replace-filename-with-basename.patch
deleted file mode 100644
index 897de4a6c..000000000
--- a/meta-oe/recipes-support/farsight/libnice/0001-agent-meson-Replace-fil=
ename-with-basename.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7c510cd20bb443064ab4a0d2c6d917e807b2671b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 May 2023 19:45:28 -0700
-Subject: [PATCH] agent/meson: Replace filename with basename
-
-This avoids emitting absolute paths into generated sourcecode, it
-improves reproducibility. See [1]
-
-[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/libnice/libnice=
/-/merge_requests/258]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- agent/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/agent/meson.build b/agent/meson.build
-index 2e5b272..44fcd6b 100644
---- a/agent/meson.build
-+++ b/agent/meson.build
-@@ -29,14 +29,14 @@ gnome =3D import('gnome')
-=20
- agent_enum_types_c =3D  gnome.mkenums('agent-enum-types.c', sources : age=
nt_headers,
- 				    fhead: '#include <config.h>\n#include <glib-object.h>\n#include "=
agent.h"\n#include "pseudotcp.h"\n#include "agent-enum-types.h"',
--				    fprod: '\n/* enumerations from "@filename@" */',
-+				    fprod: '\n/* enumerations from "@basename@" */',
- 				    vhead: 'GType\n@enum_name@_get_type (void)\n{\n  static GType typ=
e =3D 0;\n  if (!type) {\n    static const G@Type@Value values[] =3D {',
- 				    vprod: '      { @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
- 				    vtail: '      { 0, NULL, NULL }\n    };\n    type =3D g_@type@_re=
gister_static ("@EnumName@", values);\n  }\n  return type;\n}\n\n')
-=20
- agent_enum_types_h =3D gnome.mkenums('agent-enum-types.h', sources : agen=
t_headers,
- 				   fhead: '#ifndef __AGENT_ENUM_TYPES_H__\n#define __AGENT_ENUM_TYPES=
_H__ 1\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n',
--				   fprod: '/* enumerations from "@filename@" */\n',
-+				   fprod: '/* enumerations from "@basename@" */\n',
- 				   vhead: 'GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define N=
ICE_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
- 					  ftail: 'G_END_DECLS\n\n#endif /* !AGENT_ENUM_TYPES_H */')
-=20
---=20
-2.40.1
-
diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.21.bb b/meta-oe/r=
ecipes-support/libnice/libnice_0.1.22.bb
similarity index 66%
rename from meta-oe/recipes-support/farsight/libnice_0.1.21.bb
rename to meta-oe/recipes-support/libnice/libnice_0.1.22.bb
index 646dcb28c..175e10fdf 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9c42325015702fed=
a4f4d2f19a55b767 \
                     file://COPYING.MPL;md5=3D3c617710e51cdbe0fc00716f056df=
b1a \
 "
=20
-SRC_URI =3D "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz \
-           file://0001-agent-meson-Replace-filename-with-basename.patch"
-SRC_URI[sha256sum] =3D "72e73a2acf20f59093e21d5601606e405873503eb35f346fa6=
21de23e99b3b39"
+SRC_URI =3D "http://nice.freedesktop.org/releases/${BP}.tar.gz"
+SRC_URI[sha256sum] =3D "a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a00=
73faed5417ad7e"
=20
 DEPENDS =3D "glib-2.0 gnutls ${@bb.utils.contains('DISTRO_FEATURES', 'api-=
documentation', 'graphviz-native', '', d)}"
=20
@@ -27,18 +26,5 @@ inherit meson gtk-doc gobject-introspection
 EXTRA_OEMESON =3D "-Dexamples=3Ddisabled -Dtests=3Ddisabled"
=20
 FILES:${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
-FILES:${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
-FILES:${PN}-staticdev +=3D "${libdir}/gstreamer-1.0/*.a"
+FILES:${PN}-staticdev +=3D "${libdir}/gstreamer-1.0/*.a ${libdir}/gstreame=
r-1.0/pkgconfig"
 FILES:${PN}-dbg +=3D "${libdir}/gstreamer-1.0/.debug"
-
-do_configure:prepend() {
-    mkdir ${S}/m4 || true
-}
-
-do_compile:append() {
-    for i in $(find ${B} -name "*.pc") ; do
-        sed -i -e s:${STAGING_DIR_TARGET}::g \
-               -e s:/${TARGET_SYS}::g \
-                  $i
-    done
-}

