Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2137.outbound.protection.outlook.com [40.107.93.137])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC377C89C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 17:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dVr/Hh8YVC870CGnQ2fiCw1Q7U5AmWRwqBdtLCsF1BKKtNffYVDDyh8bLd54OMuERaNGp3VNHGyQ1kM0zoawmHmo4t748FvBnt3N0L8wXHtIOB9RoGoIJ6Ar7HV9PpTYYN5/eWdXqd2BUIcvnjF+t5cTan2Y5MjwEoPDiif6pzytSj0OSEtFTEcVD5/4BTGoVNsEKg59tD6y1WeVG9OC7MLEQ01/+AZHvFjgst+UxCFrV7lK5eDENyCXdlHdGhQMGfqBr1wcQKKZxOWBVs7Q4fjhcVNoqK3GWaarElUz04qkZFpb3jTDgdAYFcst+0/YNhShMpBFQwm9uHebS5zhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kOSiyawuG3PHTmfAIlEAuV0gH4JiTZNJbbdcEDD9Ctk=;
	b=oAvHbqDZn25RHVUE2zxnB2UrohwO2c+/pZCxf2EC6RbvD40p8LoqEx/1o28yZUnBPhVSgAUneQvFiSijR8i2GQN6o8z+MJtA568ntICoADEXtZbgzrxYRXSULHH/TSGs3XQRCppAj9KQB3WuCdt27LsoWRzfJaV9pxQ9HtJVG0qTjc30z1X1fy7r2+ucj2Yl+ztxHf8O44w1XmqzR5p+LKl2FkR9KOK36r02v7E5QGljN4ym1Ef1U1QydejFlGBSvUcfViNMfAHitUvKvWiS9fhZEWP3eBdquMDDpqSfb1cMSw86Ioz8a0h++RONxukNFL+Ho8iV438bWEKW8opjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kOSiyawuG3PHTmfAIlEAuV0gH4JiTZNJbbdcEDD9Ctk=;
	b=UA82rR6AyvdcIo91URP774ynenbFnzA+ddJppA4r40rGUH+4+UZxmmwx9ovt0TmoGzA5OqNWejWOoeiITi2+zK7pECSKFNP2hpznAblxqCetxYMN/54/vaAsayaDBJZzO66nyGcuW1XhyiZwnCdVDWIQTjNAZ2r6uoY1XZInc58=
Received: from CO2PR04CA0162.namprd04.prod.outlook.com (2603:10b6:104:4::16)
	by DM6PR04MB5675.namprd04.prod.outlook.com (2603:10b6:5:166::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14;
	Fri, 27 Dec 2019 17:13:10 +0000
Received: from MW2NAM10FT011.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::204) by CO2PR04CA0162.outlook.office365.com
	(2603:10b6:104:4::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Fri, 27 Dec 2019 17:13:10 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT011.mail.protection.outlook.com (10.13.154.237) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 17:13:09 +0000
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Fri, 27 Dec 2019 11:13:07 -0600
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Fri, 27 Dec 2019 11:13:08 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.15) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Fri, 27 Dec 2019 11:13:07 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2019 11:12:41 -0600
Message-ID: <20191227171243.10525-2-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227171243.10525-1-peter.kolbus@garmin.com>
References: <20191227171243.10525-1-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25132.001
X-TM-AS-Result: No-5.676300-8.000000-10
X-TMASE-MatchedRID: lKyLlVBYSG2yQNoUnxiQNAPZZctd3P4BP6Tki+9nU39XiLrvhpKLfPLX
	3qoNbEngezYFSWzv4Aj++vFBYLLFFaST2xDNHYNWFZgeU43PhOMGAD6h6FZmEVCedixYXzOr/gQ
	TQjEQ2EN9LQinZ4QefPcjNeVeWlqY+gtHj7OwNO2BSJy8ngwKGY4lXhoc7TSFKfV9NshldPt99m
	JCHS7XbZWVRFKEM9S6Js421rzWBfk=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.676300-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25132.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(107886003)(478600001)(7696005)(4326008)(426003)(2906002)(6666004)(356004)(186003)(26005)(26826003)(76130400001)(86362001)(336012)(70206006)(7636002)(44832011)(70586007)(2616005)(8676002)(8936002)(246002)(5660300002)(316002)(36756003)(6916009)(1076003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB5675;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9f884e4-5d34-47d7-cf86-08d78af00c38
X-MS-TrafficTypeDiagnostic: DM6PR04MB5675:
X-Microsoft-Antispam-PRVS: <DM6PR04MB567552E2987D8A0138B5B934FF2A0@DM6PR04MB5675.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tYf++eBjrGK5KNqMUTVnADAs0t/2AtpipSg1/CuvjHj1Oq1+4nWo0mVO3Nq9sIpWXvuufaY7f9jVNy65ORNzdgeqTIbTxMThwpV9aT4DqjNOADcClh+CdEvrxt0ubH2cymsdGy+KMUx0Y19y9Unv2h4NN2bzeXZjnU3rFk6rgRLyHy97fPeQQxU4Lo00g/Qhy0RxxZmWTBq5eSTfgvSsmWNUIXODiqTJ9jeZgobyMs1cnqp7jpp8woNtKv1rNP5du007VX3JBIjvmMKRhgt5j+jq3M/Fo09HxkfWRm8BiF3ij22hOY7WHUVk/YIt3oZ7fa35o48kkrEIay8yJPs3VTdxFIu+s3rh7sB6P1hpFlzRSFd19E86I8kNutOf5MHJnWgvwAJkRLPX3iHVQQDZnlIQsUVmR5zzs6zG5UneRH3VjgfoMIq2taTQUYH5BLE63QA4pZlswYB0LNeGCBQXAhZC+vBQvosN/9xnshb8h5A=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 17:13:09.6647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f884e4-5d34-47d7-cf86-08d78af00c38
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5675
Subject: [meta-python][PATCH 2/4] python3-soupsieve: add recipe
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
X-List-Received-Date: Fri, 27 Dec 2019 17:13:10 -0000
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
index 000000000..058aa8525
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-soupsieve.inc
@@ -0,0 +1,12 @@
+SUMMARY = "CSS selector library for python-beautifulsoup4"
+HOMEPAGE = "https://github.com/facelessuser/soupsieve"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7f538584cc3407bf76042def7168548a"
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


