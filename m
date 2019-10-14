Return-Path: <danc@opengear.com>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690069.outbound.protection.outlook.com [40.107.69.69])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDCC7D714
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 02:00:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=g51Plp7/5T5amn8d5d0ko2es946kXRoyQA0s/c+JwEiivkaVVIZN/N2TtEk9kDY4IpgDk8cU1Qsn37FhasSXbLkmzu1eMDpJqDx+P9lOafYnJIeUFODo52vWQypBf9D0yrczTgUI9vb+JixB3UYv9tzo8WjUNrC9c5knU+a4OEtigkJKpUP9+Z8isPdlfEadgQKG+H1g7fIqk8bsSdhOtFVJ2NO7FLtChmwQhQLILhVSjrBBrfN3PM517yQq+0QnkgtUhGleA822KsPAU/N44oHdscu1vbcX0nNMu1MGyVDXrv+k/kMcktSu/Daeb0QOJys2gIqhD65p223MSVtRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6KY2WN/OLj+OKSUteZ6WwzSXTUO1Gyp//y3yTCxmuj8=;
	b=k/1g7JQhC5ZYLmeK4nbD7vepEX322ymZ/eFHaPPl1g973/rd9EH42Ho7h4fEJrLxPJ307WftFwPytdHhSTuVGxfHx0beC/yQoqGPv1sA9/cKGEBl5aKWEfxe+H4YpJvsYpDnWS5m9rQ5ZMcT/buwVnxxbEg6qZ9UTXoeeYp9YrwhaBsrgLRiu9srG/6kj5qNHrj6RGZgerMrzYVMkhjxpuWi5iD0iwM9MvXKs9cL8WfVnj0OUKtswJwTURQdsMKiOC11kC3YoOdsi32sB7HP7TMhG6PdSMqt/eF4tj/55b+m/zLZUXCIVLeV3qQp2cc/6X+f+0V2mr3TwR8oS1rK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6KY2WN/OLj+OKSUteZ6WwzSXTUO1Gyp//y3yTCxmuj8=;
	b=cl0TKwNrto9oVnj4PHHsqRg586gA2EK4Ww9E1RWRl60kk6uO+K5sD9pchVqhtmGs/yz4HwnNOI7NSBLsQyBG/Oep2o0f+qI/ga8X71THQ5uabmlVQ/iWrQMwNu2gs5faspnJHU+dXwAFASMi6H5Hq2f6MrbCC6XDxkC3XR+L7kQ=
Received: from CO1PR15CA0100.namprd15.prod.outlook.com (2603:10b6:101:21::20)
	by MW2PR1501MB1979.namprd15.prod.outlook.com (2603:10b6:302:b::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16;
	Mon, 14 Oct 2019 02:00:57 +0000
Received: from SN1NAM04FT017.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::201) by CO1PR15CA0100.outlook.office365.com
	(2603:10b6:101:21::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via
	Frontend Transport; Mon, 14 Oct 2019 02:00:57 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT017.mail.protection.outlook.com (10.152.88.154) with
	Microsoft SMTP Server id 15.20.2347.16 via Frontend Transport;
	Mon, 14 Oct 2019 02:00:56 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 765FCE84FC;
	Mon, 14 Oct 2019 12:00:51 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 5B04A407A31A; Mon, 14 Oct 2019 12:00:51 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2019 12:00:47 +1000
Message-Id: <20191014020047.27691-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(136003)(39830400003)(376002)(396003)(448002)(189003)(199004)(478600001)(426003)(476003)(2616005)(486006)(50466002)(36756003)(7636002)(2906002)(126002)(305945005)(44832011)(2870700001)(26826003)(186003)(8936002)(336012)(47776003)(26005)(51416003)(4326008)(8676002)(36906005)(246002)(42186006)(107886003)(70206006)(14444005)(6266002)(316002)(48376002)(6666004)(356004)(70586007)(50226002)(1076003)(6916009)(76130400001)(2351001)(103686004)(5660300002)(2361001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR1501MB1979;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe52c39d-0484-4495-0ffb-08d7504a5a37
X-MS-TrafficTypeDiagnostic: MW2PR1501MB1979:|MW2PR1501MB1979:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR1501MB1979BC87F095148A4DE949C5B8900@MW2PR1501MB1979.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNNMokDnEaDX5G4OpYXDIvTS1d+mMfRhDZq6lGwzi1iNHNes6xd3NuWuoi5cw8aoBaMOnvOiLnxNygvvnW+hndY9zMu6nPRkn6SAGPF/FICRJRCSXmLBKbu7x5gGqToEemJLxs19sdHm7L1LdmlHE1RTYJMdjUuDSmlWvM7Er9G8Nn32ps97CHrzSp6ymHruYD+cSYPTeodiukdxpR/0ZV62wXsec6sZ25w3NEfZTq8OWWvKbmooutCc8TzNQrmBwcTnJnPSE3C2PTOQZZd/WBQqz16mxfG4Tz9iw6wqP7oi2hZiCWOcjtAPhMrpH+tUzBfM00m+OFOpNObuSbflCkhfUo4/pzQzHGFgO9DXk/XFl8ubGY0RhEUJ1IEWHiAiaGGIODbXYvwD71FNfwqBV6+Uhmltt4fMBRYBOqmmluI=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 02:00:56.3481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe52c39d-0484-4495-0ffb-08d7504a5a37
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB1979
Subject: [meta-networking][PATCH] strongswan: add a PACKAGECONFIG for libbfd stack traces
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2019 02:00:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Strongswan installs a signal handler for SIGSEGV, SIGILL, and SIGBUS
which attempts to print a stack trace of the crash. For producing line
numbers in the stack trace, it can use libbfd from binutils, or
libunwind, or else it falls back to a slower method using
/usr/bin/addr2line.

Currently the addr2line method is unlikely to actually work, since there
is no RDEPENDS to pull that command into the image.

This patch turns on the libbfd-based stack traces by default, which
should be a reasonable choice since binutils is already required for
building everything. The setting is nevertheless behind a PACKAGECONFIG
in case libbfd is not wanted in the final image.
---
 meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
index 5408eed27..c8a8d1dc0 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
@@ -24,10 +24,11 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
+PACKAGECONFIG ??= "bfd charon curl gmp openssl stroke sqlite3 \
         ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
+PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
 PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,${PN}-plugin-curl"
 PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
-- 
2.20.1


