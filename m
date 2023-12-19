Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EB9C46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:52:00 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.89])
 by mx.groups.io with SMTP id smtpd.web11.16708.1703001109984769608
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=r+Oyjsys;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.6.89, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWUcKkdaGJf0XcwkZg58m273CphMIPqAC2oGoSLkeJZS0xFk1HCG2DjlRglJJze4cXjSrU+NGI676vdVdUXQO3ib4lf1mEw5sfLj1we+JVNioFmSECDXcGhMPUuyaK5iG0Ae9ryiNRKUJKLOb+yTjGl6BAkk+Ut83M0ExIOXoTvaHiOsTUk9ACthFrkGIMFu0Hwlet5RgiUgsTUjLZqaLBkj11Ad3JkFuuxk/Do2MGJpdRpzrO65MdB0+nLo/trZo9vZeKsmX2+iIzlKVIOFr2IUSn24w8Qt6scBjMzl4f8z/d+14cKsGHtRweHKQ2P2DP2Z1BVpbd92y9EuoBZoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smUtE91PhUZiqkFQ6C+nj+fkHUblt35RIq/OOJTfopA=;
 b=AVzRih2pprFwGNPeaLa0xOw5g0O2iLdiS9zRFB/dN2ej8KDzjtz3ymbzwhkxTn+OCZ+/xtpnpRfZWXVkER3glI/mfwN9duUg09tQmFbxLXl91hBIXHMWqNtR0CNx1QH4hcIYBPIhd/wQurK9DOST0ndhP0Q/5i5WdteYDoiB/1U/re1EbwLHi6DTP1EZwcm7ZyjYEpz+pzisrIMeziPaMdZji42lBRmXUT6RYUoHd+qBxV/yXZql4G8hAle3AtPkYLPF4wZvss5tL115y6PG5XTzvBDwgfE3XQKOSb2Lk2gfe8iqGaT9DkNfbr5gdiBUpEyCtFhxpy8USgkBKlPuBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smUtE91PhUZiqkFQ6C+nj+fkHUblt35RIq/OOJTfopA=;
 b=r+Oyjsysq9yjasD5yjiQtDKfVexk1XtIeNPHibUe8WbgrCqgv7PNHdZTpX0GBnJNUG4IZsq3hNLmDK1MWkT61kjFgYR9B37mnI9krW8MXw+lYOUtvhH3jq8iumfOq/YMnzEPTHrhMX7xdOzVNxpmLQCG1esX7y5XBIxdAp4IbsMJeGSrIqIosOGeMU7i7KEtNRfe8r8gt9D2FVNng3JveyP6Y+x4cTBCG2mm0R2PiMZF8G0quYTS6GAbYv7x5GKzDS+jsaiA1MSKy9uhCe5M8nxfM4zk7S0uBKUanJhoJ08r3A4GFh1YP1+peQTGL1JtppqGh+rt7B9mGPt+WN+BNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS5PR06MB9061.eurprd06.prod.outlook.com (2603:10a6:20b:67d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 15:51:47 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 15:51:46 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] pkcs11-provider: Add recipe
Date: Tue, 19 Dec 2023 15:51:19 +0000
Message-ID: <20231219155119.3859157-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::11) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS5PR06MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c68aa7e-3400-4f1c-3669-08dc00aa67e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ny39hYu4gKocgW63CRueK5n1YVj021BYiAzgjnOeKRoMscfSrL9T++IV1p0y4hvQ6f0z0Qz1t8tIIPUm/VEP3ZnioTwn7PUmDdcmWuH7jJKGeLPqc5Qc6fmW5qA8oheutvri+sex369EJta8qmP9YpDR+FZan/pgNuzQv8DaPSR8VsQ6bJku3sIME+YotFR908l59e9p/9uMsQITHCYz+S+FgKBY0jyw8N8lkZ8x69TWednONOWSqkxuLCjsf0u4UOw07hLKpWZcGMz5Qc/uhp+mn5Lyt97TmQSNploILjr0ne/dC45Q0cg0QupviY9rcc8R2TlD/ZLV262xXs8oi/g7DVjIGLJcoYDuDyNP01AUWYq0Tgv5wSuX52DXR0sB/ivGM4KLPy5ZYbDkHOFzEFRskdHqsPEVmRMzRBWGdOOT1tBQ4BIcKfv0Z5dKg2TeDPzIIIDSMuseATOE7aFMyy3NzIdJw+GYWJf3otTe2316Sm+rPyRSSyAFymhVsbkDdlyjSOJN0oMDeQOqym1i3Q0JxOa8Kxg68S07yTheUizD+scp5bRXQMRJiLHQPeur/Cij0APHjeBZwo+0O0tCIkcWH3QkFRn5vIV+/ZnkIYY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(8936002)(8676002)(4326008)(6512007)(6666004)(9686003)(6506007)(52116002)(83380400001)(316002)(5660300002)(66476007)(66556008)(66946007)(6916009)(41300700001)(38100700002)(36756003)(966005)(478600001)(107886003)(2616005)(1076003)(26005)(6486002)(86362001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Fsa12N0wl7qJeu8XWQ3N5c7I4dlwIcBVBJ0bgKnteyFMMuv9JgfLrGwZtmt?=
 =?us-ascii?Q?f9eSsAVbZtGK04Yuld6SwQ/yDUqfInlEgq+1wVvj6jQ8peIacVrb53N3kM0N?=
 =?us-ascii?Q?Cbqh5qwmCUKe12jek6nfNA0g83X4nrLpLS2dHr1aygeGlGGve1gy109aLWNK?=
 =?us-ascii?Q?diBkJE+jdKzm8yHPAH+4q1C86T9lR94orAc2EfJK2t0GVq/pdjs2rhT6ZwEL?=
 =?us-ascii?Q?cRZUSUryEuhAfFCjwIuoPOKCb4bKUx2Q9QpPAux/pAhh5lcke1NF/KPdTxDM?=
 =?us-ascii?Q?Cl2lUnvXyzb6JfWK0ZIcmiazUEAVP+U2jQVkkyMG6SgoggC46GdIZ4dQ2n0S?=
 =?us-ascii?Q?bFQW0u7Vnd7Bx+J8UjXdZ1MJiUPQiJanZvH7+xSCb1D6IuVXoyDe4GjtgBxv?=
 =?us-ascii?Q?DV9qgETh8PE3m/D1iEt+6Pehc83Gh3QeMfbRtjCt69THW+BaqxTuFFbFRGT+?=
 =?us-ascii?Q?jUwFxj7Ql2RNbL8qPYNN+i3BWCEVdJKSqnBG+AJTji9tDWWG4zCOd4N4i2FO?=
 =?us-ascii?Q?SScEGJmkpRAwdz/RsU1hkaX2A8UWqtIKHjE+EFurQf6HDfshF87meomSMccD?=
 =?us-ascii?Q?lw9EOD5O1F6V9ztkxFo4vZwHBDBBdB8Yb1C+KaVQl0nVXpjXuIhmF937kOC+?=
 =?us-ascii?Q?5sVRWtroZM03JQNjQSBdZWXGtlhpwzlK+cLRWPT5zSIpDwFt0A/4zb2ydNOq?=
 =?us-ascii?Q?xOXiBg22bslrSqjuaAInDZEjITvZVDqykhDlvvlhfjZtNhYrnQPsGBd4dtWx?=
 =?us-ascii?Q?8SQtDpMAacJ7n/FZu2ceMmy1j2woyJNaBkvaYYSq7wUMLc6l+N/ur4Lu7kB1?=
 =?us-ascii?Q?w/bU4AwabWn6qT+AuMhbWVx5LXMyo/fZtuUvaFPxX17QBReYGM9DUgTSxKve?=
 =?us-ascii?Q?vXtZ9obMm6LkP23i7kC0IXeKJx0YuTaviYGruXCyxvXtTKz0H9ixhSgEjhMs?=
 =?us-ascii?Q?OGwBc43qVaf1dHbnxHmsFDt2qWUhcxKC63THpeipI61Bf8LjWN6cdWIJKVG3?=
 =?us-ascii?Q?bZnGcb/kwn2rdGtr5e8Ukw+C16wcWghb1UXerzrxqGuD+kKdtW32m7dnS3ys?=
 =?us-ascii?Q?/b4EGH7zkewL2fYb4H1pr38FwOjtCAIxY4b0am0k9rX+oaffH9lTkaXyzzYe?=
 =?us-ascii?Q?YaiMUx2scRDwjOeJOSoMqiIo/qEoWxSNjlx9PkAScfFnklvbur+qa2SJfMFF?=
 =?us-ascii?Q?maxE2LMlb9Nd4AkNNEeAeRVLpV5FYz7jNQne4z7ohI33JcNSlGjT6Lp3jHCU?=
 =?us-ascii?Q?4+Qzg2hRyG+rkBC4PLPt6iwy6Puo1svwXCr1jge4pDUA44A64XRijxXd29lx?=
 =?us-ascii?Q?/rcMBvzfBS5TsLGuQN33I1id5N68t4YtPY2MxODiXX+UjhSbH1Gj9fBnLB8Q?=
 =?us-ascii?Q?J00TR4J9zoa97iuk9F0S+wJUdGEV7ssrctQQageeMwWUOsgoLgc5Ac2x3aoJ?=
 =?us-ascii?Q?RF62G2eWegstBp6HDMc9loPq58rZIqzv9P2FNK/3T69oMP8Prctw8KyB6hZV?=
 =?us-ascii?Q?o7n6SrcIikSlt3TWEsHouY9eRjlJA815ntfno7FJBOAML/YeecRz27U24oEA?=
 =?us-ascii?Q?qii3fk+gRD9i3yV5ix8lqExGCrZlSeU+HfuRc4+E28HTOD0QrKuAYS4U0DKW?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c68aa7e-3400-4f1c-3669-08dc00aa67e7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 15:51:46.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l19+QfbkuJcETUgv2LT7sHnHN8Wr1xeHh6BHnInvZe6+KR/XwPn03kytDap/wlRJRt8vIpFUUqysxniV+67vSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB9061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 15:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107634

From: Niko Mauno <niko.mauno@vaisala.com>

Starting with version 3.0 the OpenSSL project introduced a new modular
system to extend OpenSSL that replaces the deprecated Engine modules.

Providers are loaded via configuration directives in the openssl
configuration file (or directly loaded by applications).

The pkcs11 provider allows applications linked to openssl to use keys
and cryptographic operations from a hardware or software token via
their PKCS #11 driver and the use of PCKS #11 URIs.

The pkcs11 provider can be configured to be automatically loaded via
openssl.cnf

For more details, visit
https://github.com/latchset/pkcs11-provider/blob/main/docs/provider-pkcs11.=
7.md

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../pkcs11-provider/pkcs11-provider_git.bb    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/pkcs11-provider/pkcs11-provider=
_git.bb

diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb=
 b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
new file mode 100644
index 000000000..12c0f5fae
--- /dev/null
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "An OpenSSL provider that allows direct interfacing with pkcs1=
1 drivers"
+DESCRIPTION =3D "\
+This is an Openssl 3.x provider to access Hardware or Software Tokens usin=
g \
+the PKCS#11 Cryptographic Token Interface\
+\
+This code targets version 3.1 of the interface but should be backwards \
+compatible to previous versions as well.\
+"
+HOMEPAGE =3D "https://github.com/latchset/pkcs11-provider"
+SECTION =3D "libs"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1cf2d4=
5"
+DEPENDS =3D "\
+    autoconf-archive \
+    openssl \
+    p11-kit \
+"
+
+SRCREV =3D "e2abc4a7ae33159f2fb21b9d87a05ea9e79ef584"
+PV =3D "0.2+gitr${SRCPV}"
+PKGV =3D "0.2+gitr${GITPKGV}"
+
+SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools gitpkgv pkgconfig
+
+FILES:${PN} +=3D "${libdir}/ossl-modules/pkcs11.so"
--=20
2.39.2


