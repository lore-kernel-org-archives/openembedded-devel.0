Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2109.outbound.protection.outlook.com
	[40.107.244.109])
	by mail.openembedded.org (Postfix) with ESMTP id 566557F230
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 16:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Qwaf2wdyCkGWYQJuzuXWQ89F/5BbgujyPUichMqINYRM3RMQGZ4zEzgd+rDXPN/VeWmP4TOKhIxTax1goxez3XXLxS5kWM0CBaB1E0q8/1Sbft1rBU3CdmVJ7hBsRO6fvwXVomve5IOohXSbU5oYLZBTML1LrMtLxV8PDE8dMo2LeblFpvKee+g3hoa68KbQxLzByIW+sxebLVPROxDf3Mmop6AedMtwrBFiewlPbKNenj4hmlSTUVjaSF0a6Rzlad/SPj1HdDa9X51+SSdRXk6H87Rk6jusExluljvBOZkgvAF2/ZBvw2h3c20aYVf4KmOFZj+csso92hUY2HKoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ny0H1JNO5gT7BQIXfQ5jCYnrf7NKBE+WHvl80zsVnO4=;
	b=jHqyh22h2MR8LKHOXfQqmCHgQmuEGVRb43B5GKegtdHFzZ3iKtCq/5skUklOeS5PO2GdZ595GtpceMcdQdGMhjoJ3jSY2iXJlzA8XHvNkaY6EymzZOhdP4LQoA+E5xvtUwVXd+zJUaIgvX3BU8jp03+rbYPi2rWifJd5YSe/ENhIYE8LFq9bHQ/G6/aPBh3gn2K4IVDrLJvSvcUAmifXoOmws41aCA1Y40Eff2sTab9fQhlxdcff0XDaiDe62wta2JrBi8YXjxGphzbRPgtmSPSGiVVxB7O2mzSZcpiEnJfccAX8J1AWRNG9dNwhX83BsZCKRSXckz8BlQORYySCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ny0H1JNO5gT7BQIXfQ5jCYnrf7NKBE+WHvl80zsVnO4=;
	b=JGoOtVPNH+pfCOZpCAg2v/woXzByEtpaVhyBydxaGlOFduHjR5sMOFUjrEBQoubRfx3oiSigp93bJ8bSu1X/2DsPqcPC62J1VxjtkFfJdfMnfuMQY7wg21GPRuSJgZHLXH+6I1SamAhBj/pIJnkQl4W7uUlSzmtcBr6Alc9o4Ho=
Received: from SN4PR0401CA0022.namprd04.prod.outlook.com
	(2603:10b6:803:21::32) by MN2PR04MB6430.namprd04.prod.outlook.com
	(2603:10b6:208:1ab::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11;
	Sun, 29 Dec 2019 16:44:43 +0000
Received: from BN7NAM10FT048.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::206) by SN4PR0401CA0022.outlook.office365.com
	(2603:10b6:803:21::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12 via
	Frontend Transport; Sun, 29 Dec 2019 16:44:43 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT048.mail.protection.outlook.com (10.13.156.199) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Sun, 29 Dec 2019 16:44:42 +0000
Received: from OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) by
	olawpa-edge4.garmin.com (10.60.4.228) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Sun, 29 Dec 2019 10:44:41 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Sun, 29 Dec 2019 10:44:40 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Sun, 29 Dec 2019 10:44:40 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Dec 2019 10:44:29 -0600
Message-ID: <20191229164431.12633-2-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229164431.12633-1-peter.kolbus@garmin.com>
References: <20191229164431.12633-1-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25136.000
X-TM-AS-Result: No-5.676300-8.000000-10
X-TMASE-MatchedRID: J3qjFT/URy+yQNoUnxiQNAPZZctd3P4BP6Tki+9nU39XiLrvhpKLfPLX
	3qoNbEngezYFSWzv4Aj++vFBYLLFFaST2xDNHYNWFZgeU43PhOMGAD6h6FZmEVCedixYXzOrMkH
	SZgCvKoTi8zVgXoAltsIJ+4gwXrEtIAcCikR3vq8wHM+04+SsAv0tM7QNS2o3Kq2aDMIyjvinQ+
	dNSutaQGjwXh61/2TH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.676300-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25136.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(8676002)(426003)(86362001)(70206006)(44832011)(6666004)(2616005)(356004)(8936002)(478600001)(2906002)(107886003)(7636002)(1076003)(26826003)(70586007)(7696005)(76130400001)(336012)(6916009)(5660300002)(4326008)(26005)(316002)(186003)(246002)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6430;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80f4f894-067f-43c9-5928-08d78c7e678e
X-MS-TrafficTypeDiagnostic: MN2PR04MB6430:
X-Microsoft-Antispam-PRVS: <MN2PR04MB643037EED45713A6A8D60529FF240@MN2PR04MB6430.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0266491E90
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v39M5vDCYUZei+vJS9jR1nm5FF0V0tvtRT/GF6MaOTKSDHL5sq2qWdzggF62mk65InpOy+VL9oyQD67zaZL8szrg3ZIHlw+mgk8F89EAQoXhRiBfxg/L0aAcJ1yoUruBUCM38dnaTtiEjMyXK8pd8/rKevOtUrvz9GBZcSTHRD/Cj6mEwobkSds6Yvm/ZdG8FL3BDmbTKqshTHjb2xHXOIZIeN7edWjPXXnaLja1ZPD4vEd6TabuT+PeP528qbjlOKRR4ERpAcc4VIuX24YRb85kklkOkvlTbMCR/OwgawX2EX63h4CslHJwrPKGUQolEQUIy4QzJgSrz+ZcpplbpfH6FCbmjvCnucPxhHb8+bZkwYwAR229Mz605MdWFou6jEulmD9HourWnOUC9lv+xjvvl4lo+IbyNvkh7KXQNP8TCc4b+wsFY9lkzs8P/1yMG+VnU26yLJ5qiyL4dYulUOnx0x5F+26NBepNhUUOQmY=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2019 16:44:42.6283 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f4f894-067f-43c9-5928-08d78c7e678e
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6430
Subject: [meta-python][PATCH v2 2/4] python3-soupsieve: add recipe
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
X-List-Received-Date: Sun, 29 Dec 2019 16:44:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Soupsieve is a CSS selector library used by python(3)-beautifulsoup4
since 4.7.0.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 .../recipes-devtools/python/python-soupsieve.inc     | 12 ++++++++++++
 .../python/python3-soupsieve_1.9.4.bb                |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-soupsieve.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb

diff --git a/meta-python/recipes-devtools/python/python-soupsieve.inc b/meta-python/recipes-devtools/python/python-soupsieve.inc
new file mode 100644
index 000000000..ccb04f445
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-soupsieve.inc
@@ -0,0 +1,12 @@
+SUMMARY = "CSS selector library for python-beautifulsoup4"
+HOMEPAGE = "https://github.com/facelessuser/soupsieve"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
+
+SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
+SRC_URI[sha256sum] = "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
new file mode 100644
index 000000000..1b9663691
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-soupsieve.inc
-- 
2.24.1


