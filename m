Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690097.outbound.protection.outlook.com [40.107.69.97])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2F57F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 16:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=B6jPUJighQ312HtbQ0WmeabxjbD/9CfakVdCGua7zAUgHYH5I4bJ4E2AXparitvkneypr/pvzJNx69G7zuYLc4NtzWSgs48i//MsUICgwHkb1by2a+Ap0+SRKkj7PCZZSSpPUqnVQqHXYZJxDWZjnoMaLZbXZDRaljAFwv/U5DHNKObXnk4oxWlOdNXmsZDN6Da9flJH7t8xf3jgA3O1R0yQEROxwYLdj5wtCEHOPo4J2iN2gcFS+x+SDLUNSkXujkR8rJAZws+nzqI6+NzKt+g/GnOD92Js+8EZdR9n5v3cimvjpqT5Cqs5rU6ALLKTEpWyNwDCYuaMEgTLxOyh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k8WN/LrD6MivK+sRSL2vArTIHU0fD5ADZ6zoJjl4OeY=;
	b=QEzEmCGU+Cm8osoIZmDTnLL8mqXLYZ8JMkkCArVJsdeWlvuU0X3azrSMowDd14Be2xlYQ/D3/9z/nXVtod7877+Xm44SGacng77nJqTUIf+P7h0qcpe2dLgkIzghLQjX24ti9jd+6EB3iYD60YuafVMgczHpT2LX0q3XtXX0xmh/q/hSNMjNnNwYWpzVt5hTN8BtruXq8w4+j5+7OuVfP1buPoNlSqd+dpnvIL3P4YoyY93zbMMuRuE56Oli+QHqu43xmHFEwsIYeeXMqD2A5x9lJkk/syEb7oJ6qoOe1xm7tjDmQvsW1D3zig3hTuIwvLbEl4Dn8Q1PgN/RthY/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k8WN/LrD6MivK+sRSL2vArTIHU0fD5ADZ6zoJjl4OeY=;
	b=VeknhNJvu5/8r1YYRHfML1YgVKzexiNQK+C2YaWDqWi1FwZLaCivc6dt6ExxyH+VYqA0Juzac5IOQelmXERnAOCR6/Ca1pDM6iuyvdR+ml2535W1BpW/FJwUpwsoMRmAg8zodn19bMhGI5VeQia6m6q8xIsASS8z99Vf2oYL8yw=
Received: from SN4PR0401CA0038.namprd04.prod.outlook.com
	(2603:10b6:803:2a::24) by BL0PR04MB6481.namprd04.prod.outlook.com
	(2603:10b6:208:1c5::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12;
	Sun, 29 Dec 2019 16:44:45 +0000
Received: from BN7NAM10FT068.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::206) by SN4PR0401CA0038.outlook.office365.com
	(2603:10b6:803:2a::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Sun, 29 Dec 2019 16:44:45 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT068.mail.protection.outlook.com (10.13.156.85) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Sun, 29 Dec 2019 16:44:44 +0000
Received: from OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) by
	olawpa-edge2.garmin.com (10.60.4.35) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Sun, 29 Dec 2019 10:44:43 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Sun, 29 Dec 2019 10:44:43 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Sun, 29 Dec 2019 10:44:43 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Dec 2019 10:44:31 -0600
Message-ID: <20191229164431.12633-4-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229164431.12633-1-peter.kolbus@garmin.com>
References: <20191229164431.12633-1-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25136.000
X-TM-AS-Result: No-2.729300-8.000000-10
X-TMASE-MatchedRID: ayOWgipZYW5SQAJO4/Vvl7HcAAwD045wTBkzBfi0S2oLBZEuqIL9SkAc
	6DyoS2rI5o/rYvVL+ieAMuqetGVetiVvu9chHp+mavP8b9lJtWr6C0ePs7A07aqzOOiUJy/IobO
	Od5pu20L0I6tB0gEoFFEp24hOuOSwvLkZuKgWf3iyEneaByYRWd1Rw11XzEv9Vmjzv+Th2Qt4PT
	RV/XXs0Xkfh4+NqmyeNVEWpA510JpJLX6We3SGJ09hSWnPnWYcDMQ0bexKg8g=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.729300-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25136.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(39850400004)(346002)(376002)(136003)(189003)(199004)(7636002)(4326008)(4744005)(5660300002)(76130400001)(246002)(356004)(6666004)(36756003)(478600001)(26826003)(1076003)(70586007)(8676002)(70206006)(26005)(186003)(86362001)(7696005)(107886003)(6916009)(8936002)(44832011)(2906002)(336012)(316002)(2616005)(426003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR04MB6481;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a45edcb-2044-4971-45b7-08d78c7e68ed
X-MS-TrafficTypeDiagnostic: BL0PR04MB6481:
X-Microsoft-Antispam-PRVS: <BL0PR04MB6481BFF31E686AB7BAD030DCFF240@BL0PR04MB6481.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 0266491E90
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2O9EH2fBdGlmXTpuhYnGNMwXSMet7vnP/HfDUuclK7MBkA5udUX4HLvz1AVGTXIwc1XCuAvLhfWY//Wa+6je4bqu6fTpryT9EW5bAewZfZHc5YSqU1d3giH9aFW46oNZnH0VJne5pcRK3b0U9EZHloFCI4995mCA1bIJW8rZrYQQFzhcuRwmm/poMFaN3HoR8ZTZhrWSZipMScqa/ALi4VXDbGM+Zjf+5SiD5pALW4WK3OZCf6Ao2as2NDRPlZQoy21BJkG1xkn4qOfB4vsWIOiB9lVMFpko+YJx6FnAnjXCKOUTmhuQ9k1oI96EaVwGvGu+49dFDDoqMWaDMFKKt7sCymA0ZjR14f0GXwiauC2u8EeUuffGzRQxS1WHtKHstKGP3GR+XPEODHomOAHPqIyava9R/O0nxAhem+jxECr9vFtmhUkVPDWcYf+wW44D
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2019 16:44:44.9252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a45edcb-2044-4971-45b7-08d78c7e68ed
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6481
Subject: [meta-python][PATCH v2 4/4] python(3)-beautifulsoup4: add soupsieve to RDEPENDS
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
X-List-Received-Date: Sun, 29 Dec 2019 16:44:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since version 4.7.0, beautifulsoup4 uses soupsieve for CSS selectors.
Add to RDEPENDS to address this oversight.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-beautifulsoup4.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
index a52c96487..8c9dbfc68 100644
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
@@ -11,6 +11,7 @@ inherit pypi
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-html5lib \
     ${PYTHON_PN}-lxml \
+    ${PYTHON_PN}-soupsieve \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.24.1


