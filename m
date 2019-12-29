Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2129.outbound.protection.outlook.com [40.107.94.129])
	by mail.openembedded.org (Postfix) with ESMTP id 640867F265
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 16:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=T2Wgmac2Grj7NgkicuMDWtyIZETmAQJ7kRNWFCsdVwrQsuTxPu1dKo0D/GEY80vx0/ZKQ+BPxIFJ16lbqaUAy2BpXvdMeAKcjYmITbNHIaoEjD1fjUlSaapdNSGEHucYlMCPwGiEyLOQ85oQKhiMvhOo0Gmtq3giwgHIdhbZkjNADP7aS/KSKl6PqC5jtlOyHF+Ujq+3vtflNV8jn5nfJRQ3icPUZ3CkEHtD46CcFriwZdpGhJgRDiYRHJk7g0s13fDaqtbv8FWNOxwISecC1jS7pdHoESwT4ukIqaMHCN5oUjZ4H9VTBbJZE0LN12XHgw1kY0VTHE1xV/2rOycJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=264N0mmJV69XNE3q+4oXO7PB2bombeBxSpUQRDFtv1o=;
	b=n4NMs44+0rlMtN8+Rcb2Fv3OrDSY/Tlf22Yb90buptpxt9yaz8jJnMv2/s9e6J/+rUvGhR6kdiNVHSPV/JYbKbQ+03kzwPqlOb6b+USALrv3bw/ehWgXsoEFWV41aQJ+4tIUbEN94loY9x3ig1Awk+X0+ZDO1G+mnrm4B9ztYZg1MDGxyFu+wBbf3DsYp/Vr2pQR00txPMZSbz0yHFkfrmqusCeM3q8woplRTmglxIklDunKrJNYAg6bnoxKsXdFrsoGyRDaL0pxssvFH93puocrQEfzg2Lpx22MMqrhT4xAfElS4icL/XptH0DlHKCxi6nEc3e4MaSbbSxV4FW+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=264N0mmJV69XNE3q+4oXO7PB2bombeBxSpUQRDFtv1o=;
	b=GjD1sSp22mFT8ub3H+0cWbt4ZxBDTgGwKsLh127KhTuw+swbld7rLAS0JVXCTVaU0ANykGtB10RLmVOP6fmjBiV3o4RlH6TtO3Z/nlVHqXXWE+XvN/NoQXH81oHKDIHaWa5n8MJVTVkU7ts4YxD8J4KHILmsPm+uyDmrbZnExEU=
Received: from MN2PR04CA0017.namprd04.prod.outlook.com (2603:10b6:208:d4::30)
	by DM6PR04MB7065.namprd04.prod.outlook.com (2603:10b6:5:24e::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11;
	Sun, 29 Dec 2019 16:12:40 +0000
Received: from MW2NAM10FT057.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::202) by MN2PR04CA0017.outlook.office365.com
	(2603:10b6:208:d4::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12 via
	Frontend Transport; Sun, 29 Dec 2019 16:12:40 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT057.mail.protection.outlook.com (10.13.154.229) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Sun, 29 Dec 2019 16:12:39 +0000
Received: from OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) by
	olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Sun, 29 Dec 2019 10:12:38 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Sun, 29 Dec 2019 10:12:36 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Sun, 29 Dec 2019 10:12:37 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Dec 2019 10:11:24 -0600
Message-ID: <20191229161124.19759-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25136.000
X-TM-AS-Result: No-5.427000-8.000000-10
X-TMASE-MatchedRID: 7a076ONKB37w51clvvl5rwPZZctd3P4BP6Tki+9nU39XiLrvhpKLfPLX
	3qoNbEngezYFSWzv4Aj++vFBYLLFFaST2xDNHYNWFZgeU43PhOMGAD6h6FZmEfUU1Tmkez4EbsT
	aWd4cSvQjSMS5ipXs2oAy6p60ZV62fJ5/bZ6npdiyO81X3yak899TaYRGAALoAt+xpicpkGpAzz
	Kkox00PJc1Pk3CbJGY6eyba5wp7QV+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.427000-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25136.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10001)(10019020)(346002)(396003)(376002)(39850400004)(136003)(189003)(199004)(4326008)(186003)(336012)(5660300002)(6916009)(316002)(26005)(36756003)(246002)(426003)(86362001)(44832011)(8936002)(6666004)(356004)(2616005)(478600001)(1076003)(7636002)(107886003)(7696005)(26826003)(76130400001)(70206006)(2906002)(70586007)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB7065;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dddc0a0-9418-4bdd-cde6-08d78c79ed44
X-MS-TrafficTypeDiagnostic: DM6PR04MB7065:
X-Microsoft-Antispam-PRVS: <DM6PR04MB7065EAD3400198BD77AF5E8FFF240@DM6PR04MB7065.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 0266491E90
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PMhO64r+v2llPIG1dLEYaeBndj32JoF3Lhb8F8JLzmf6ByheGMv+/5atmz8DayWbkv9oKYYU6k4h1nXP6+NiAcGPlXabI2YfGjYNYljYPBII4O20pz/rteMCfdwwk1vw8j7yhEk3if9Lf31soRiIoPE1O8SMxRqLdwfK3BlP8D9Vk0P0uGYQMh1u4pQ0Zi618Ju3UjE4vhrIVv0MnOurjxSBMhWSmDkKGiqLa2q4LHo4H3nVsJkfwxoXJN4jSv5fomtlzHBmxf08zZ62QRatPun3uR9b86AqhrvptSLp6gH5+ZE8yuFk1DLhN4o2tTk+KAG5rQ51gWfCZgVXdj8utY/2yyA/2EEHSqk3L/LE0bvxGtwHKuqX3PuX06B8ktFC04x0P4dimrLRScaelwyKFN/QC9sZv1XeJ6pMwkEbuZQVhFrbiAbwNIJz7SEuw4bh2yUTqWMBNm4/DaBCngBr5wHZ3j8fBuK7wpw1P70q+rEhJFoiIh3ZtwfyDNwCV0eyWzixUGjJUr43QcxgnhMw02EG0UiMdFVjcxS12/cOURw=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2019 16:12:39.4404 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dddc0a0-9418-4bdd-cde6-08d78c79ed44
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7065
Subject: [meta-python][PATCH v2] python3-html2text: add recipe
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
X-List-Received-Date: Sun, 29 Dec 2019 16:12:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

python3-html2text converts HTML to Markdown-formatted text.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 .../recipes-devtools/python/python-html2text.inc     | 12 ++++++++++++
 .../python/python3-html2text_2019.8.11.bb            |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-html2text.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb

diff --git a/meta-python/recipes-devtools/python/python-html2text.inc b/meta-python/recipes-devtools/python/python-html2text.inc
new file mode 100644
index 000000000..678dcef3f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-html2text.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Convert HTML to Markdown-formatted text"
+HOMEPAGE = "https://github.com/Alir3z4/html2text"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI[md5sum] = "21aad7ec95b70606024b783c8253899c"
+SRC_URI[sha256sum] = "f516b9c10284174e2a974d86f91cab02b3cf983a17752075da751af0e895ef5e"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
new file mode 100644
index 000000000..9cb5b01eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-html2text.inc
-- 
2.24.1


