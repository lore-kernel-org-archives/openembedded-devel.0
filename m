Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2098.outbound.protection.outlook.com [40.107.223.98])
	by mail.openembedded.org (Postfix) with ESMTP id 722937CBDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 17:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ITEPv5xczsGqkPAkk9Ns9O8Txc6cZXjwaqYbt61Qo/TFxQw5C3JVYpbwWgLf/fzOkaqkVU9wgA+TBZQ/sVhYDdtLP38T2X1QMnHSaNZgiB3Hx0Ll7HdLgLyZalOV5OVMEd7vfwVed+C0vPEdrmj1BAob1GRtBb524YbzyDYHv0jsJBtJ31W95295kSioOyTYYPMlI/79bzrCogPxxh/Nxt6Bz9Z+Ky95AC1Cm1YmfaLOt9vWLp654Tdh4hHQdzn08q7MNMMVbishWlY0hnpYxmxBT1R58/Q0PPzdNy7xbp/aZT4urjJY4WHzEBn7G/uX1Q17r7sxVVXJyYVwAGN66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9SHMjyBkEKbDwOILeCUN8fvkWPzyYAK+vlA1/Dg0X4w=;
	b=J4ywk8+oIa+mB5bB2MVVZoNLDQQHO3v262MMov7GqzD9rrcIlXmyXKWVwoTHqJtLsg/6tn3Wyn7drYGL1ea5YGXOen6xq7vHlUqEhoUnhMbCNrCEuZDtkvTlx0/p+0qj/mKq1R+acta617Y5z4YtWpBRoUTxM3pwGsXI+9lMywlm9+OP6rBwiysNOVmVIk0CMhbxb3kIzjBcfthZF01naRWtWdk4POJQJD+8l9BIbxPfkEpm/RAJ4DQtgi9pO5WHJIB4UDdn5EyYD/PjS/UqO9xDeY4+hHexxDyE0MwrRb6O9neDf4txmuZgpADJzXwQu7fSZmQrsR0ZpsBo3oyThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9SHMjyBkEKbDwOILeCUN8fvkWPzyYAK+vlA1/Dg0X4w=;
	b=iFlb6YJaLqiQbLthB60I65LppvvzzfcF/2JIbeNmXW65qsLRRLpbeaJCybCs3w4mCxs5hHNP50czT7dxVPVZ16Hb9FLFonUx5HcMiRqFqC56vtXvlPokG1Tsxw4g/KU0HQGqwD9vHMTIpWhrcaH5b5pigD7vYq5WZZR4jaLuVFg=
Received: from MWHPR04CA0038.namprd04.prod.outlook.com (2603:10b6:300:ee::24)
	by DM6PR04MB6364.namprd04.prod.outlook.com (2603:10b6:5:1e5::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11;
	Fri, 27 Dec 2019 17:11:49 +0000
Received: from BN7NAM10FT054.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::205) by MWHPR04CA0038.outlook.office365.com
	(2603:10b6:300:ee::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Fri, 27 Dec 2019 17:11:49 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT054.mail.protection.outlook.com (10.13.157.112) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 17:11:48 +0000
Received: from OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Fri, 27 Dec 2019 11:11:47 -0600
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Fri, 27 Dec 2019 11:11:47 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.15) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Fri, 27 Dec 2019 11:11:47 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2019 11:11:45 -0600
Message-ID: <20191227171145.10366-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25132.001
X-TM-AS-Result: No-5.427000-8.000000-10
X-TMASE-MatchedRID: 3ChbhzMJew/w51clvvl5rwPZZctd3P4BP6Tki+9nU39XiLrvhpKLfPLX
	3qoNbEngezYFSWzv4Aj++vFBYLLFFaST2xDNHYNWFZgeU43PhOMGAD6h6FZmEfUU1Tmkez4EbsT
	aWd4cSvTaD9G1W/26vZsoi2XrUn/Jn6KdMrRsL14qtq5d3cxkNa6KQIvxVddMIf7Ywbfwj/fGCk
	m82bYg3jMy8RVP7ocgMMycOSK8ptZZny+h5/IYMg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.427000-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25132.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10001)(10019020)(346002)(136003)(376002)(396003)(39860400002)(189003)(199004)(336012)(426003)(26005)(186003)(2616005)(7636002)(44832011)(6916009)(26826003)(5660300002)(478600001)(316002)(4326008)(7696005)(246002)(86362001)(76130400001)(2906002)(356004)(1076003)(70206006)(8936002)(8676002)(107886003)(70586007)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB6364;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0586b40a-06d7-4f1c-86ef-08d78aefdc00
X-MS-TrafficTypeDiagnostic: DM6PR04MB6364:
X-Microsoft-Antispam-PRVS: <DM6PR04MB6364C5EC85D779C722D053F6FF2A0@DM6PR04MB6364.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 027O/qfJpzgkeBIqGubNbyGcUMkgQcfzQjALbB9KbUcDEnyHk0LWO5xVI26MRkacYgGRLvcMTWkkBkJJbySxMOd8CKCCpej4PSBbRuTWSd4fazu2+TD6mS8fJ36Uyn6bKmubQxDwipHNd1oJiBitC36OKUCWeBNt7sQgab7MIIhhIJeZaF6bZ8D7Zjhq0lgtASGDGP6Elb13HU3he9DezjCnfSMkkPPFnJA2DtIwbLCAtkzYNEYtC3gUhHbFOewFg57tVc/TW+optgOU/WfdI1VjjNkykIZL1ui4UxHJsYrCF6T4vh1RqCmBcSballEQt/KL6EzQI9bOTrEfLOFGGKH1nfYkxYqJsI3P3H5o225/V168BC/4+le9Ksz0HnCCd0BIegL8GsK2JKS8qWP5YayCGCOUEZKo/J9SnbPauotCyOL8TZk0XAXs9Z7ONsTBrqClOfgPIV9IQq2lG2i0bbDWb8+iY6+7oFNIgxoubgOvqiskUGy4jeVQZTFxEdhLXLvchriPBsBE+5v23d2AViXmV8+zP4bsZwB7mira/xA=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 17:11:48.7942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0586b40a-06d7-4f1c-86ef-08d78aefdc00
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6364
Subject: [meta-python][PATCH] python3-html2text: add recipe
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
X-List-Received-Date: Fri, 27 Dec 2019 17:11:49 -0000
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
index 000000000..f5e208729
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-html2text.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Convert HTML to Markdown-formatted text"
+HOMEPAGE = "https://github.com/Alir3z4/html2text"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7f538584cc3407bf76042def7168548a"
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


