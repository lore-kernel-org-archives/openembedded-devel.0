Return-Path: <danc@opengear.com>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
	by mail.openembedded.org (Postfix) with ESMTP id 753366BD08
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 23:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=OwA2giQic3t7f5xCCRWiT785UKxzXTdE6zrg59rTNq86V4PqgzIUVEUl6mX2vottBAp3L2gj1+WWL8FEI6jZSvuIhciKgt2myWdliw3MQBQY+E/3B6F6wwDLro46rNKwCjFBrD6A3fyJo0Fz4kCtXImba0gLVgbXupMV5PG7HSIQfojzbCt5KV2gd1b64Xn9qWjZvpjYbenkNObq2UehougC0eh6zN4WbFg0MeOqMl57Bd+7ZuCYHmyrC/1LZY9otP2ZMVdHPDBl2QH8tH8XNwKThZhS8HLNkZWSsvJAT5ThUZVF/n12AbfK6pPUgWCarQOJg7YZ99fR/cUB6Sm/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sXM1QJNgUCwr2Fbk2FfFh0LzlKZwnriVcJVMeFYSflY=;
	b=YlUP7cP4Hz6zSi6l2Yf7a6PwNHq0SlDsT9fU3xRjTDg15syJig1IrKRuvjoJ56Yd+z4bt4pWJd3C9/uhN8ZO6t3CXgog/5po/mDW+fCqB6l5/6CDxA1cxAbv3uboYwG455Mkh40u38BMnP8wQfDcoPffYEFPvewrNzbwqGTnJR2cPN23cumIk/vFBYbV3OM/Gl9+koG9VLx+89+ohTBwgDzWKWORPDvg50s75GC9LUrFSAu7zwvaOTvmmPp4nhnvg+YecIrcBt7+sDL0SnLQDcWVxqG9C/OprgcmrToANPA5UwhmDIkOwn5rRRj69gHuIrcvF6C229HtYzXXEkVBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sXM1QJNgUCwr2Fbk2FfFh0LzlKZwnriVcJVMeFYSflY=;
	b=DwWUJxHH4cY/6e+enboyoeT17ZiZPoUrXosxXt2Q5JyxzyqXw66nUP/4oBd98HriL25QBX8QEIXO1wxvsgRtSx310dj0pFxpLHLgqpY1FYMDdtSFusWN8QebubOTfkxuN3x7/NVREYceYydXFXDh6TvgzaNrhRlpzT4oTB7OdUk=
Received: from MWHPR15CA0072.namprd15.prod.outlook.com (2603:10b6:301:4c::34)
	by BN8PR15MB3378.namprd15.prod.outlook.com (2603:10b6:408:a3::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17;
	Mon, 14 Oct 2019 23:39:22 +0000
Received: from CO1NAM04FT034.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::205) by MWHPR15CA0072.outlook.office365.com
	(2603:10b6:301:4c::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via
	Frontend Transport; Mon, 14 Oct 2019 23:39:21 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT034.mail.protection.outlook.com (10.152.90.119) with
	Microsoft SMTP Server id 15.20.2347.16 via Frontend Transport;
	Mon, 14 Oct 2019 23:39:21 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id EA28BE84FC;
	Tue, 15 Oct 2019 09:39:18 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id CBD8F42C8817; Tue, 15 Oct 2019 09:39:18 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 09:39:09 +1000
Message-Id: <20191014233909.30636-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAMKF1sq=q=Ssmp69ze-9W2keDZ_nKa=7+6s=5zAOnmPRbg_pYw@mail.gmail.com>
References: <CAMKF1sq=q=Ssmp69ze-9W2keDZ_nKa=7+6s=5zAOnmPRbg_pYw@mail.gmail.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(39840400004)(346002)(136003)(376002)(448002)(199004)(189003)(36756003)(356004)(6666004)(5660300002)(103686004)(186003)(51416003)(44832011)(76176011)(426003)(47776003)(446003)(70586007)(476003)(26005)(126002)(336012)(6916009)(1076003)(48376002)(2616005)(486006)(11346002)(36906005)(246002)(8936002)(70206006)(2351001)(76130400001)(2361001)(42186006)(50466002)(316002)(6266002)(4326008)(7636002)(305945005)(107886003)(26826003)(478600001)(8676002)(50226002)(2906002)(2870700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR15MB3378;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 868573b6-8842-4a09-54e8-08d750ffbd14
X-MS-TrafficTypeDiagnostic: BN8PR15MB3378:|BN8PR15MB3378:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR15MB337868ABBA9F724C7A0CB04CB8900@BN8PR15MB3378.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41iMLm89I11vUYbLcIJ7jSvNthoYH6zaQjgeyAnNydZipEyuJB2DishsHCedRbZsXZ3pUPLSHjWBMvjrG68l8csoNyYKhNKJM447ih0Zb2Svv8Tam5XB+A4F48dZwPfWmQxWbh4w+k9qM8weJ9n15/QP9AExl0wr41Iqj8QpoeT7t1KQMpK69HsZoGmw4VfAor5mm906sI12eItcH8GFxrGcAKAHJo8XyYRbozwtq3CtJgk6wU6sqgU197Lgcnb+8HFV5jysI6IASVU727ZTBlXeQxeo663wQUoIBftXf6arbjkhomhTIc7t7cj6qiADXCYj7CwwyZf7bQb0UcI+q2MgpNMvuxMVCwk/1Cl3Xv5yzze0a1WkBi3tLL97aVXXcw3caHMCk9ULAxFkTlsBwV5ZfXouAi02uO9mq1d8hr8=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 23:39:21.1119 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 868573b6-8842-4a09-54e8-08d750ffbd14
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB3378
Subject: [meta-networking][PATCH v2] strongswan: add a PACKAGECONFIG for libbfd stack traces
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
X-List-Received-Date: Mon, 14 Oct 2019 23:39:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Strongswan installs a signal handler for SIGSEGV, SIGILL, and SIGBUS
which attempts to print a stack trace of the crash. For producing line
numbers in the stack trace, it can use libbfd from binutils, or
libunwind, or else it falls back to a slower method using
/usr/bin/addr2line.

Currently the addr2line method is unlikely to actually work, since there
is no RDEPENDS to pull that command into the image.

This patch adds a PACKAGECONFIG to enable the libbfd-based stack traces,
which is likely the best alternative since binutils is already required
for building everything, and it will be faster than the addr2line method
(which requires addr2line and libbfd anyway).
---
 meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
index 5408eed27..b521633ff 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
         ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
+PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
 PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,${PN}-plugin-curl"
 PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
-- 
2.20.1


