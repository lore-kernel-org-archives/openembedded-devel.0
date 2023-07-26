Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A9BC001E0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:50:59 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.65])
 by mx.groups.io with SMTP id smtpd.web11.7478.1690365054591821643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=rQiagyf8;
 spf=pass (domain: siemens.com, ip: 40.107.249.65, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQThUhEsEqnpv0FxsoDtu4kQpDSbaiZovWTnTnVGFc9uOSMyMTYVsSpcWwsgRdJHflH1msD2t2b3TvxvGk/Wwxmx1Q7QCcHqYKhvAeNDOeXU5QvqOxBvdk04Po49SLzMGEcq+REnOgn8qJbcVteYZUyvmE0HLMbcKEvXY3/MIe1QLHS6hzTA+syU+rRwA8pMoMlrG/DYTaGhw+6ArKLJuBu6q9fVRpqKwW8gUuFrta9Mc1sxJ88BpwWhIJ1HtSK0Dn6aR/UrZQ94q4fT8qbAyZfD8FnT3PEzlyFrDdFv5fGYiC4WXGv2CfdoFO7bFXhxHvycldS++xintghBcKKjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEbTKsfdj3ymBcNxAYh7cJ2uXwZcHlbuuJBtgCrs+k0=;
 b=Tgxu4j5NAHJHzoR5BTzhu5YMblpMIifdOUlRlJ4Us9es2vxq+1sOgS/OwO+YGoFdD4x528jksaqyQXfGsCJcqzuRASxk5+hRktEnL/sW7VdT5r7Y9ipk+SuDox0MYG7Z+93WW7pQqNcBkPgBJ6K6FoawPNCyNiPI1cipG2UXDfEkKTnE6pOqnDdiiQIOakDC54fMqqvyAKj+7fFZ5eicz21u4U/f/rXtrXgALI7X5wfY8mZxKci5LpG1xrJ+3YCLFMmbHEiftX8ID08vGtAwefF7kI+pMg8fIymL0Z5HyNK+nUJHLkrybJYWoOm81nG5RwqhmSZ+nY5sQBGlFVZetQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEbTKsfdj3ymBcNxAYh7cJ2uXwZcHlbuuJBtgCrs+k0=;
 b=rQiagyf8pxnXfl9xdnnXM38a+U/4+shs5CpYSPRXi4iALHShBgjTqgJS4qx6czELYVTctVGvMoxPLRTThaoBPX91CCc6Y14SxGVJeTPL4yvJ63Svz1XOXAfGVeedukp92JRmw0S28I6a+L/7HtJ9S9p2aNTLGwQmlz5o9tb7rFeETqoK1/ID5IBmtSCr+SWAYEdD0bQyNcuuwFSy+IijVcQYpbt7V9lfBjIxaKbu5SjtdZYRXV0JNXe20PpG3N0ypyYNqkRvi9C9XQsl7qRdSgEUbr3yrwaREs1wXFDWY9CiyRxirb/U6oCl8ufDqBUtN0OgWxM93bn1nW60pqIVrA==
Received: from AM9P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::15)
 by AS4PR10MB6303.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:50:50 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21c:cafe::b6) by AM9P250CA0010.outlook.office365.com
 (2603:10a6:20b:21c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Wed, 26 Jul 2023 09:50:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.0 via Frontend Transport; Wed, 26 Jul 2023 09:50:50 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.16; Wed, 26 Jul 2023 11:50:50 +0200
Received: from md3hr6tc.ad001.com (139.22.41.189) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Wed, 26 Jul 2023 11:50:49 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, Andrej Valek <andrej.valek@siemens.com>
Subject: [meta-oe][PATCH v2] cve_check: convert CVE_CHECK_IGNORE to CVE_STATUS
Date: Wed, 26 Jul 2023 11:50:09 +0200
Message-ID: <20230726095009.33521-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724113527.141274-1-andrej.valek@siemens.com>
References: <20230724113527.141274-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.41.189]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|AS4PR10MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ac3e6c-9f5b-4119-d7f4-08db8dbdcb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ff7xbJhddABRLct9UF3gBITzquhHFgmpHn8CbygkjM1Fo0BbFuZdjt1GJSNjcET1OP3hoM917PJTW2uoG4dFljbx1RgcDyr2EDd1p7yAXveZMIO8q1RD0ByJ+tQJjylDpOiSkQzGJyUgPqEfHnkAud+43q559U5d8Ppn5noPD+dRTjWq7QgTEJyexyAvdpZQMbtfEAj1ztk7W9/JKGYZwf2HtuYJt88I1W5X7Dl4XFqqV15p+Cc3xTWSOdBLyX8ayZxdMTuG24pGL+9D62DBZ0GqiL2Fnx7fwbDmgCiNRqbmu3r0iBOIBcJvogEH0DmQmMXzkeHUDlOxuw6v5BrsbDXkryVSMQ+EfjPAE9uOdTna33atnnJ702KtcmD4midXesmqje1IKaN10IV4MbEZ/il+Ae2xWF+OmCRMRP/SYbvxQDFOdMkMHZvAl6QO4tUCiCq18zfdVopCagFakayu42/ecz8xlcKHtvPVsEOgRSYSwqycY0HJrwgo6KRyfgPVznLEsU8PRNWPmWdcGHWke+TjVHSFD7QGez50F7EJvDU3TpMgFC1olymHaZMvWoa2MmYWKmOEURcF82X2dJINaX7cVMvFOadz7GqlGrMHwoHO47W4BpEbEY+//sZZiodxrtHGyQ4AahuKOU041sTMj2Xy22SKRXMQuSXrIMNfMM5ZcP1ycIbD6bdhCNaRWNpiloxzyxEQek5GVKRwW+5SNMY3XTab7gZqP9VeMx3MBzKB6kaZOqZL8efyK8BvS7vl
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(36756003)(86362001)(356005)(82740400003)(81166007)(84970400001)(82960400001)(40460700003)(107886003)(2906002)(54906003)(40480700001)(30864003)(478600001)(36860700001)(956004)(186003)(26005)(2616005)(1076003)(336012)(16526019)(47076005)(5660300002)(44832011)(6666004)(966005)(41300700001)(8676002)(70586007)(316002)(70206006)(4326008)(83380400001)(8936002)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:50:50.4880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ac3e6c-9f5b-4119-d7f4-08db8dbdcb7c
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6303
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 09:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104035

From: Andrej Valek <andrej.valek@siemens.com>

- Try to add convert and apply statuses for old CVEs
- Drop some obsolete ignores, while they are not relevant for current
  version

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-devtools/dracut/dracut_056.bb     |  3 +--
 .../freeradius/freeradius_3.0.26.bb           |  6 ++---
 .../mbedtls/mbedtls_2.28.3.bb                 |  6 ++---
 .../mbedtls/mbedtls_3.4.0.bb                  |  5 -----
 .../openthread/wpantund_git.bb                |  9 +++-----
 .../samba/samba_4.18.4.bb                     |  7 +-----
 .../recipes-protocols/mdns/mdns_1790.80.10.bb | 22 +++++++++----------
 .../recipes-protocols/openflow/openflow.inc   | 12 ++++------
 .../recipes-support/dovecot/dovecot_2.3.20.bb |  3 +--
 .../recipes-support/ntp/ntp_4.2.8p17.bb       | 12 +++++-----
 .../recipes-support/openvpn/openvpn_2.6.3.bb  |  3 +--
 .../recipes-support/spice/spice_git.bb        |  6 +----
 .../recipes-dbs/mongodb/mongodb_git.bb        |  7 ++----
 .../libtorrent/libtorrent_git.bb              |  4 +---
 meta-oe/recipes-core/emlog/emlog_git.bb       |  8 +++----
 .../recipes-dbs/postgresql/postgresql_15.3.bb |  4 +---
 .../flatbuffers/flatbuffers.bb                |  2 --
 meta-oe/recipes-devtools/php/php_8.2.8.bb     |  4 +++-
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  4 +---
 .../libimobiledevice/libplist_2.3.0.bb        |  4 +++-
 .../libimobiledevice/libplist_git.bb          |  4 +++-
 .../recipes-extended/libzip/libzip_1.10.0.bb  |  3 ---
 .../recipes-extended/sanlock/sanlock_3.8.5.bb |  4 +---
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb            |  4 +---
 .../graphviz/graphviz_8.1.0.bb                |  4 ----
 .../recipes-graphics/jasper/jasper_2.0.33.bb  |  4 +---
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |  3 +--
 .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |  3 ---
 meta-oe/recipes-support/atop/atop_2.4.0.bb    |  4 +---
 meta-oe/recipes-support/emacs/emacs_28.2.bb   |  4 +---
 meta-oe/recipes-support/nss/nss_3.74.bb       | 12 ++++------
 .../openldap/openldap_2.5.13.bb               |  3 ---
 .../recipes-support/pidgin/pidgin_2.14.2.bb   |  6 ++---
 33 files changed, 60 insertions(+), 129 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb b/meta-in=
itramfs/recipes-devtools/dracut/dracut_056.bb
index 989a37a87..db08fffe9 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
@@ -68,5 +68,4 @@ RRECOMMENDS:${PN} =3D " \
                      coreutils \
                     "
=20
-# CVE-2010-4176 affects only Fedora
-CVE_CHECK_IGNORE +=3D "CVE-2010-4176"
+CVE_STATUS[CVE-2010-4176] =3D "not-applicable-platform: Applies only to Fe=
dora"
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0=
.26.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.=
bb
index 9a2bbab39..35733c530 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
@@ -43,10 +43,8 @@ SRCREV =3D "d956f683d37ea40e7977cc5907361f3e6988a439"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "release_(?P<pver>\d+(\_\d+)+)"
=20
-CVE_CHECK_IGNORE =3D "\
-    CVE-2002-0318 \
-    CVE-2011-4966 \
-"
+CVE_CHECK_STATUS[CVE-2002-0318] =3D "fixed-version: The CPE in the NVD dat=
abase doesn't reflect correctly the vulnerable versions."
+CVE_CHECK_STATUS[CVE-2011-4966] =3D "fixed-version: The CPE in the NVD dat=
abase doesn't reflect correctly the vulnerable versions."
=20
 PARALLEL_MAKE =3D ""
=20
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb=
 b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
index ce094d5af..fff320afd 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
@@ -57,10 +57,8 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_PRODUCT =3D "mbed_tls"
=20
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
-CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a=
48edfe9ece03c7e4a53310adf73a86c
-CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
+CVE_STATUS[CVE-2021-43666] =3D "backported-patch: Fix merged upstream http=
s://github.com/Mbed-TLS/mbedtls/pull/5310"
+CVE_STATUS[CVE-2021-43666] =3D "backported-patch: Fix merged upstream http=
s://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73=
a86c"
=20
 # Strip host paths from autogenerated test files
 do_compile:append() {
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb =
b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
index b8c9662de..10fb7de8c 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
@@ -58,11 +58,6 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_PRODUCT =3D "mbed_tls"
=20
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
-CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
-# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a=
48edfe9ece03c7e4a53310adf73a86c
-CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
-
 # Strip host paths from autogenerated test files
 do_compile:append() {
 	sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.b=
b b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index a7fcc202a..ebb3fc3c1 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -22,11 +22,8 @@ S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig perlnative autotools
=20
-# CVE-2020-8916 has been fixed in commit
-# 3f108441e23e033b936e85be5b6877dd0a1fbf1c which is included in the SRCREV
-# CVE-2021-33889 has been fixed in commit
-# a8f3f761f6753b567d1e5ad22cbe6b0ceb6f2649 which is included in the SRCREV
 # There has not been a wpantund release as of yet that includes these fixe=
s.
 # That means cve-check can not match them. Once a new release comes we can
-# remove the ignore statement.
-CVE_CHECK_IGNORE =3D "CVE-2020-8916 CVE-2021-33889"
+# remove the statement.
+CVE_STATUS[CVE-2020-8916] =3D "backported-patch: fixed via 3f108441e23e033=
b936e85be5b6877dd0a1fbf1c"
+CVE_STATUS[CVE-2021-33889] =3D "backported-patch: fixed via 3f108441e23e03=
3b936e85be5b6877dd0a1fbf1c"
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb b/m=
eta-networking/recipes-connectivity/samba/samba_4.18.4.bb
index 66089edad..3386b93b5 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
@@ -38,12 +38,7 @@ UPSTREAM_CHECK_REGEX =3D "samba\-(?P<pver>4\.18(\.\d+)+)=
.tar.gz"
=20
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pk=
gconfig
=20
-# CVE-2011-2411 is valnerble only on HP NonStop Servers.
-CVE_CHECK_IGNORE +=3D "CVE-2011-2411"=20
-# Patch for CVE-2018-1050 is applied in version 4.5.15, 4.6.13, 4.7.5.
-CVE_CHECK_IGNORE +=3D "CVE-2018-1050"
-# Patch for CVE-2018-1057 is applied in version 4.3.13, 4.4.16.
-CVE_CHECK_IGNORE +=3D "CVE-2018-1057"
+CVE_STATUS[CVE-2011-2411] =3D "not-applicable-platform: vulnerable only on=
 HP NonStop Servers"
=20
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove =3D "perl"
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb b/me=
ta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
index 46f1b70cb..aff7954f5 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
@@ -46,18 +46,16 @@ PACKAGECONFIG[tls] =3D ",tls=3Dno,mbedtls"
=20
 CVE_PRODUCT =3D "apple:mdnsresponder"
=20
-# CVE-2007-0613 is not applicable as it only affects Apple products
-# i.e. ichat,mdnsresponder, instant message framework and MacOS.
-# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
-# affected by CVE-2007-0613 which is not preset in upstream source code.
-# Hence, CVE-2007-0613 does not affect other Yocto implementations and
-# is not reported for other distros can be marked whitelisted.
-# Links:
-# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
-# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-061=
3
-# https://security-tracker.debian.org/tracker/CVE-2007-0613
-# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
-CVE_CHECK_IGNORE +=3D "CVE-2007-0613"
+CVE_STATUS[CVE-2007-0613] =3D "not-applicable-platform: Issue affects Appl=
e products \
+i.e. ichat,mdnsresponder, instant message framework and MacOS. Also, \
+https://www.exploit-db.com/exploits/3230 shows the part of code \
+affected by CVE-2007-0613 which is not preset in upstream source code. \
+Hence, CVE-2007-0613 does not affect other Yocto implementations and \
+is not reported for other distros can be marked whitelisted. \
+Links: https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613 \
+https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613 =
\
+https://security-tracker.debian.org/tracker/CVE-2007-0613 \
+https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613"
=20
 PARALLEL_MAKE =3D ""
=20
diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta=
-networking/recipes-protocols/openflow/openflow.inc
index aaad0e00e..7062d2146 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -13,10 +13,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De870c934e2c3=
d6ccf085fd7cf0a1e2e2"
=20
 SRC_URI =3D "git://gitosis.stanford.edu/openflow.git;protocol=3Dgit;branch=
=3Dmaster"
=20
-CVE_CHECK_IGNORE =3D "\
-    CVE-2015-1611 \
-    CVE-2015-1612 \
-"
+CVE_STATUS[CVE-2015-1611] =3D "not-applicable-config: Not referred to our =
implementation of openflow"
+CVE_STATUS[CVE-2015-1612] =3D "not-applicable-config: Not referred to our =
implementation of openflow"
+CVE_STATUS[CVE-2018-1078] =3D "cpe-incorrect: This CVE is not for this pro=
duct but cve-check assumes it is \
+because two CPE collides when checking the NVD database"
=20
 DEPENDS =3D "virtual/libc"
=20
@@ -58,7 +58,3 @@ do_install:append() {
 }
=20
 FILES:${PN} +=3D "${nonarch_libdir}/tmpfiles.d"
-
-# This CVE is not for this product but cve-check assumes it is
-# because two CPE collides when checking the NVD database
-CVE_CHECK_IGNORE =3D "CVE-2018-1078"
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb b/me=
ta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
index 01e060e2f..e41dd93f5 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
@@ -71,5 +71,4 @@ FILES:${PN}-staticdev +=3D "${libdir}/dovecot/*/*.a"
 FILES:${PN}-dev +=3D "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg +=3D "${libdir}/dovecot/*/.debug"
=20
-# CVE-2016-4983 affects only postinstall script on specific distribution
-CVE_CHECK_IGNORE +=3D "CVE-2016-4983"
+CVE_STATUS[CVE-2016-4983] =3D "not-applicable-platform: Affects only posti=
nstall script on specific distribution."
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb b/meta-net=
working/recipes-support/ntp/ntp_4.2.8p17.bb
index fba4611b9..e80ea4c14 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
@@ -26,12 +26,11 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/n=
tp4/ntp-4.2/ntp-${PV}.tar.g
=20
 SRC_URI[sha256sum] =3D "103dd272e6a66c5b8df07dce5e9a02555fcd6f1397bdfb7822=
37328e89d3a866"
=20
-# CVE-2016-9312 is only for windows.
-# CVE-2019-11331 is inherent to RFC 5905 and cannot be fixed without break=
ing compatibility
-# The other CVEs are not correctly identified because cve-check
-# is not able to check the version correctly (it only checks for 4.2.8 omi=
tting p15 that makes the difference)
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2016-9312 \
+CVE_STATUS[CVE-2016-9312] =3D "not-applicable-platform: Issue only applies=
 on Windows"
+CVE_STATUS[CVE-2019-11331] =3D "upstream-wontfix: inherent to RFC 5905 and=
 cannot be fixed without breaking compatibility"
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_NTP"
+CVE_STATUS_NTP[status] =3D "fixed-version: Yocto CVE check can not handle =
'p' in ntp version"
+CVE_STATUS_NTP =3D " \
     CVE-2015-5146 \
     CVE-2015-5300 \
     CVE-2015-7975 \
@@ -51,7 +50,6 @@ CVE_CHECK_IGNORE +=3D "\
     CVE-2016-7433 \
     CVE-2016-9310 \
     CVE-2016-9311 \
-    CVE-2019-11331 \
 "
=20
=20
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb b/met=
a-networking/recipes-support/openvpn/openvpn_2.6.3.bb
index 76bce7db5..a5fc15874 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
@@ -16,8 +16,7 @@ UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-dow=
nloads"
=20
 SRC_URI[sha256sum] =3D "13b207a376d8880507c74ff78aabc3778a9da47c89f1e247dc=
ee3c7237138ff6"
=20
-# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not fo=
r openvpn.
-CVE_CHECK_IGNORE +=3D "CVE-2020-7224 CVE-2020-27569"
+CVE_STATUS[CVE-2020-27569] =3D "not-applicable-config: Applies only Aviatr=
ix OpenVPN client, not openvpn"
=20
 INITSCRIPT_PACKAGES =3D "${PN}"
 INITSCRIPT_NAME:${PN} =3D "openvpn"
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-netw=
orking/recipes-support/spice/spice_git.bb
index b3e687476..5732f509b 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -30,11 +30,7 @@ SRC_URI =3D " \
=20
 S =3D "${WORKDIR}/git"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2016-0749 \
-    CVE-2016-2150 \
-    CVE-2018-10893 \
-"
+CVE_STATUS[CVE-2018-10893] =3D "fixed-version: patched already, caused by =
inaccurate CPE in the NVD database."
=20
 inherit autotools gettext python3native python3-dir pkgconfig
=20
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
index 550fbc30d..0ce58b13c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -50,11 +50,8 @@ SRC_URI:append:toolchain-clang =3D "\
=20
 S =3D "${WORKDIR}/git"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2014-8180 \
-    CVE-2017-18381 \
-    CVE-2017-2665 \
-"
+CVE_STATUS[CVE-2014-8180] =3D "not-applicable-config: Not affecting our co=
nfiguration so it can be safely ignored."
+CVE_STATUS[CVE-2017-2665] =3D "not-applicable-config: Not affecting our co=
nfiguration so it can be safely ignored."
=20
 COMPATIBLE_HOST ?=3D '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/me=
ta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 50096cfdb..fec05571d 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -9,9 +9,7 @@ DEPENDS =3D "zlib libsigc++-2.0 openssl cppunit"
 SRC_URI =3D "git://github.com/rakshasa/libtorrent;branch=3Dmaster;protocol=
=3Dhttps"
 SRCREV =3D "e60f222241319aaae482789517ad00ae9344bd13"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2009-1760 \
-"
+CVE_STATUS[CVE-2009-1760] =3D "backported-patch: patched in our product"
=20
 PV =3D "0.13.8+git${SRCPV}"
=20
diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core=
/emlog/emlog_git.bb
index 05fa0c334..03c895f66 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -25,11 +25,9 @@ do_install() {
=20
 RRECOMMENDS:${PN} +=3D "kernel-module-emlog"
=20
-# The NVD database doesn't have a CPE for this product,
-# the name of this product is exactly the same as github.com/emlog/emlog
-# but it's not related in any way. The following CVEs are from that projec=
t
-# so they can be safely ignored
-CVE_CHECK_IGNORE +=3D "\
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_EMLOG"
+CVE_STATUS_EMLOG[status] =3D "fixed-version: The name of this product is e=
xactly the same as github.com/emlog/emlog. CVE can be safely ignored."
+CVE_STATUS_EMLOG =3D " \
     CVE-2019-16868 \
     CVE-2019-17073 \
     CVE-2021-44584 \
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb b/meta-oe/re=
cipes-dbs/postgresql/postgresql_15.3.bb
index c4d4124f9..e1d49895f 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
@@ -13,6 +13,4 @@ SRC_URI +=3D "\
=20
 SRC_URI[sha256sum] =3D "ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167=
133b9e6599d932"
=20
-CVE_CHECK_IGNORE +=3D "\
-   CVE-2017-8806 \
-"
+CVE_STATUS[CVE-2017-8806] =3D "not-applicable-config: Ddoesn't apply to ou=
t configuration of postgresql so we can safely ignore it."
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-oe/=
recipes-devtools/flatbuffers/flatbuffers.bb
index 657391636..183554e2c 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -15,8 +15,6 @@ RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
 S =3D "${WORKDIR}/git"
=20
-CVE_CHECK_IGNORE +=3D "CVE-2020-35864"
-
 EXTRA_OECMAKE +=3D " \
     -DFLATBUFFERS_BUILD_TESTS=3DOFF \   =20
     -DFLATBUFFERS_BUILD_SHAREDLIB=3DON \
diff --git a/meta-oe/recipes-devtools/php/php_8.2.8.bb b/meta-oe/recipes-de=
vtools/php/php_8.2.8.bb
index 08d041d77..407b1a7bc 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.8.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.8.bb
@@ -36,7 +36,9 @@ SRC_URI:append:class-target =3D " \
 S =3D "${WORKDIR}/php-${PV}"
 SRC_URI[sha256sum] =3D "995ed4009c7917c962d31837a1a3658f36d4af4f357b673c97=
ffdbe6403f8517"
=20
-CVE_CHECK_IGNORE +=3D "\
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_PHP"
+CVE_STATUS_PHP[status] =3D "fixed-version: The name of this product is exa=
ctly the same as github.com/emlog/emlog. CVE can be safely ignored."
+CVE_STATUS_PHP =3D " \
     CVE-2007-2728 \
     CVE-2007-3205 \
     CVE-2007-4596 \
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/re=
cipes-devtools/uw-imap/uw-imap_2007f.bb
index ea76d4870..dcb59f4ea 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -22,9 +22,7 @@ SRC_URI[sha256sum] =3D "53e15a2b5c1bc80161d42e9f69792a3fa=
18332b7b771910131004eb520
=20
 S =3D "${WORKDIR}/imap-${PV}"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2005-0198 \
-"
+CVE_STATUS[CVE-2005-0198] =3D "fixed-version: The CPE in the NVD database =
doesn't reflect correctly the vulnerable versions."
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] =3D ",,libpam"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb b/=
meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
index 1a74dc88f..f636990f8 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
@@ -14,7 +14,9 @@ SRC_URI =3D "git://github.com/libimobiledevice/libplist;p=
rotocol=3Dhttps;branch=3Dmast
 S =3D "${WORKDIR}/git"
 PR =3D "r1"
=20
-CVE_CHECK_IGNORE +=3D "\
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
+CVE_STATUS_LIBLIST[status] =3D "fixed-version: The CPE in the NVD database=
 doesn't reflect correctly the vulnerable versions."
+CVE_STATUS_LIBLIST =3D " \
     CVE-2017-5834 \
     CVE-2017-5835 \
     CVE-2017-5836 \
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/me=
ta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index db092600b..3a10b40f1 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -15,7 +15,9 @@ SRC_URI =3D "git://github.com/libimobiledevice/libplist;p=
rotocol=3Dhttps;branch=3Dmast
=20
 S =3D "${WORKDIR}/git"
=20
-CVE_CHECK_IGNORE +=3D "\
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
+CVE_STATUS_LIBLIST[status] =3D "fixed-version: The CPE in the NVD database=
 doesn't reflect correctly the vulnerable versions."
+CVE_STATUS_LIBLIST =3D " \
     CVE-2017-5834 \
     CVE-2017-5835 \
     CVE-2017-5836 \
diff --git a/meta-oe/recipes-extended/libzip/libzip_1.10.0.bb b/meta-oe/rec=
ipes-extended/libzip/libzip_1.10.0.bb
index e8aa7fdc0..b500f26e2 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.10.0.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.10.0.bb
@@ -23,7 +23,4 @@ SRC_URI =3D "https://libzip.org/download/libzip-${PV}.tar=
.xz"
=20
 SRC_URI[sha256sum] =3D "cd2a7ac9f1fb5bfa6218272d9929955dc7237515bba6e14b5a=
d0e1d1e2212b43"
=20
-# Patch for CVE-2017-12858 is applied in version 1.2.0.
-CVE_CHECK_IGNORE +=3D "CVE-2017-12858"
-
 BBCLASSEXTEND +=3D "native"
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb b/meta-oe/re=
cipes-extended/sanlock/sanlock_3.8.5.bb
index c2a17d06b..962d19574 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
@@ -21,9 +21,7 @@ SRCREV =3D "b820c63093c4ae85d7da4f719cf3026d7fca5d09"
=20
 S =3D "${WORKDIR}/git"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2012-5638 \
-"
+CVE_STATUS[CVE-2012-5638] =3D "fixed-version: The CPE in the NVD database =
doesn't reflect correctly the vulnerable versions."
=20
 DEPENDS =3D "libaio util-linux"
=20
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta=
-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index a52f3641d..2a7cf2285 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -34,9 +34,7 @@ SRC_URI =3D "http://downloads.sourceforge.net/sblim/${BP}=
.tar.bz2 \
 SRC_URI[md5sum] =3D "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] =3D "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b=
0240484af149dd"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2012-3381 \
-"
+CVE_STATUS[CVE-2012-3381] =3D "fixed-version: The CPE in the NVD database =
doesn't reflect correctly the vulnerable versions."
=20
 inherit autotools
 inherit systemd
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb b/meta-oe/=
recipes-graphics/graphviz/graphviz_8.1.0.bb
index 7ab15c971..ccc114007 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
@@ -29,10 +29,6 @@ SRC_URI:append:class-nativesdk =3D "\
 "
 SRC_URI[sha256sum] =3D "d593695fdaa8a19297523b679ad13d3ef2027b0b7f14cc2bc2=
3e77969ed81565"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2014-9157 \
-"
-
 PACKAGECONFIG ??=3D "librsvg"
 PACKAGECONFIG[librsvg] =3D "--with-librsvg,--without-librsvg,librsvg"
=20
diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/rec=
ipes-graphics/jasper/jasper_2.0.33.bb
index 27dff82df..85da5bfb4 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da80440d1d8f17d04=
1c71c7271d6e06eb"
 SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dhttps;=
branch=3Dmaster"
 SRCREV =3D "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2015-8751 \
-"
+CVE_STATUS[CVE-2015-8751] =3D "fixed-version: The CPE in the NVD database =
doesn't reflect correctly the vulnerable versions."
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/rec=
ipes-graphics/libsdl/libsdl_1.2.15.bb
index 50c501574..814e6cd0d 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -81,5 +81,4 @@ do_configure:prepend() {
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-#CVE-2019-14906 is a RHEL specific vulnerability.
-CVE_CHECK_IGNORE +=3D "CVE-2019-14906"
+CVE_STATUS[CVE-2019-14906] =3D "not-applicable-platform: Applies on RHEL o=
nly"
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/m=
eta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 3277fb109..11b53e7b6 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -95,6 +95,3 @@ FILES:${PN}-dbg       +=3D "${libdir}/sasl2/.debug"
 FILES:${PN}-staticdev +=3D "${libdir}/sasl2/*.a"
=20
 INSANE_SKIP:${PN} +=3D "dev-so"
-
-# CVE-2020-8032 affects only openSUSE
-CVE_CHECK_IGNORE +=3D "CVE-2020-8032"
diff --git a/meta-oe/recipes-support/atop/atop_2.4.0.bb b/meta-oe/recipes-s=
upport/atop/atop_2.4.0.bb
index b1d2abde7..bb1f53624 100644
--- a/meta-oe/recipes-support/atop/atop_2.4.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.4.0.bb
@@ -24,9 +24,7 @@ SRC_URI =3D "http://www.atoptool.nl/download/${BP}.tar.gz=
 \
 SRC_URI[md5sum] =3D "1077da884ed94f2bc3c81ac3ab970436"
 SRC_URI[sha256sum] =3D "be1c010a77086b7d98376fce96514afcd73c3f20a8d1fe0152=
0899ff69a73d69"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2011-3618 \
-"
+CVE_STATUS[CVE-2011-3618] =3D "fixed-version: The CPE in the NVD database =
doesn't reflect correctly the vulnerable versions."
=20
 do_compile() {
     oe_runmake all
diff --git a/meta-oe/recipes-support/emacs/emacs_28.2.bb b/meta-oe/recipes-=
support/emacs/emacs_28.2.bb
index df210ef5e..137c29bee 100644
--- a/meta-oe/recipes-support/emacs/emacs_28.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_28.2.bb
@@ -11,9 +11,7 @@ SRC_URI:append:class-target =3D " file://usemake-docfile-=
native.patch"
=20
 SRC_URI[sha256sum] =3D "ee21182233ef3232dc97b486af2d86e14042dbb65bbc535df5=
62c3a858232488"
=20
-CVE_CHECK_IGNORE =3D "\
-    CVE-2007-6109 \
-"
+CVE_CHECK_STATUS[CVE-2007-6109] =3D "fixed-version: The CPE in the NVD dat=
abase doesn't reflect correctly the vulnerable versions."
=20
 PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes,--with-gnutls=3Dno,gnutls"
 PACKAGECONFIG[kerberos] =3D "--with-kerberos=3Dyes,--with-kerberos=3Dno,kr=
b5"
diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-supp=
ort/nss/nss_3.74.bb
index 38407a7c4..ea5abe07f 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -283,12 +283,8 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_PRODUCT +=3D "network_security_services"
=20
-# CVE-2006-5201 affects only Sun Solaris
-CVE_CHECK_IGNORE +=3D "CVE-2006-5201"
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_NSS"
+CVE_STATUS_NSS[status] =3D "not-applicable-config: This only affect the le=
gacy db (libnssdbm), only compiled with --enable-legacy-db"
+CVE_STATUS_NSS =3D "CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-2017-=
11698"
=20
-# CVES CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-2017-11698 only af=
fect
-# the legacy db (libnssdbm), only compiled with --enable-legacy-db.
-CVE_CHECK_IGNORE +=3D "CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-20=
17-11698"
-
-# vulnerability was introduced in 3.77 and fixed in 3.87
-CVE_CHECK_IGNORE +=3D "CVE-2022-3479"
+CVE_STATUS[CVE-2022-3479] =3D "not-applicable-config: vulnerability was in=
troduced in 3.77 and fixed in 3.87"
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.13.bb b/meta-oe/=
recipes-support/openldap/openldap_2.5.13.bb
index b117677f9..7dc926c61 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.13.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.13.bb
@@ -233,6 +233,3 @@ python populate_packages:prepend () {
 }
=20
 BBCLASSEXTEND =3D "native"
-
-# CVE-2015-3276 has no target code.
-CVE_CHECK_IGNORE +=3D "CVE-2015-3276"
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb b/meta-oe/reci=
pes-support/pidgin/pidgin_2.14.2.bb
index 3d8a45786..3a0cc0229 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
@@ -15,10 +15,8 @@ SRC_URI =3D "\
=20
 SRC_URI[sha256sum] =3D "19654ad276b149646371fbdac21bc7620742f2975f7399fed0=
ffc1a18fbaf603"
=20
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2010-1624 \
-    CVE-2011-3594 \
-"
+CVE_CHECK_STATUS[CVE-2010-1624] =3D "fixed-version: The CPE in the NVD dat=
abase doesn't reflect correctly the vulnerable versions."
+CVE_CHECK_STATUS[CVE-2011-3594] =3D "fixed-version: The CPE in the NVD dat=
abase doesn't reflect correctly the vulnerable versions."
=20
 PACKAGECONFIG ??=3D "gnutls consoleui avahi dbus idn nss \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-notifi=
cation', '', d)} \
--=20
2.41.0


