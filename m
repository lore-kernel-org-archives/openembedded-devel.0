Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2111.outbound.protection.outlook.com
	[40.107.237.111])
	by mail.openembedded.org (Postfix) with ESMTP id 836FF7F7B1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 16:44:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=aoxnNPB0SKtVKW6bz04SFSG3vTDgP66fJwzgxq4Osa9WuX05LPvke7BI5UoyX5FuEsDEgIPSv+j00G5gUyFOxRc2K8EhL00e74/PeH9IUhr0Bh3mJ4CEbv334Br9LZmzW8IbhqePs3CKJb+zeB7W5H8KfX1QvU+xfY179VIXCtsd7OZ4ZMiNjiL+vxG8o0+xwAz4xn/taBvfu86w9soG1Y01J6Xo9uGQ5Ah+SBBIGsufjrDols4YTEIOGuWdhZ8DkEt8dsegUwqokNP44BPxYWjIT2QLVFYULuMQ+d8UiAhqVfLlNZBRySGumSVL4uAh1vhsjuG3+Wbg4b7bncPMVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CiumvO/ska2aLe5k7GlpPzUqwaCypV3holIMAxOhqBc=;
	b=djGLRryR7Gm48x1L38TzmfFcTNOLVNfQraAzIFspStZhnDT/xt+8ozwG0VhhKhmdSNuxOG7LAkZgr2FYp88OuCHrTPw0goFVpomcpgQ+TMdbgVgwgjOVuemZUtIwHkIzBa2SrEbC+mqWE2Ei1NmTYMbhVoOIgdFrFIDdDmK4zi7QRikIPUO2Kq4YLdJlBY8+CX830sMCQAVTp+cHo3v/8lHO1rNS6HmwSjxR21dHLpszNAX8nt5aSvvfHfvjVRcro23oVwJJXwJWUByvzXcauftR2nIZmCQ9kTwx6nlIwChRmJ4QAzgrBPFhKlKEyFhKGzXRXmlh/qpwNXs3oEh+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CiumvO/ska2aLe5k7GlpPzUqwaCypV3holIMAxOhqBc=;
	b=AsmUakYkNgoomzMvB26xq1EyhKlVQe8LG0Jzz9xfM5D+jT6N2L0s0OOyJBI0LG+oHFfxYncj6hExgf1k+LFzaLyL2cmiKmezNK+wWRy/0MoIBok5u6TyCp9MpfnDGIm0rTjpCDPMiUs51fu1aXKykxGdRdsZrYyY+tzaKSasY7M=
Received: from MWHPR04CA0069.namprd04.prod.outlook.com (2603:10b6:300:6c::31)
	by BYAPR04MB4149.namprd04.prod.outlook.com (2603:10b6:a02:fc::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12;
	Sun, 29 Dec 2019 16:44:52 +0000
Received: from MW2NAM10FT029.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::200) by MWHPR04CA0069.outlook.office365.com
	(2603:10b6:300:6c::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Sun, 29 Dec 2019 16:44:51 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT029.mail.protection.outlook.com (10.13.154.191) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Sun, 29 Dec 2019 16:44:51 +0000
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1466.3; Sun, 29 Dec 2019 10:44:42 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Sun, 29 Dec 2019 10:44:37 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Sun, 29 Dec 2019 10:44:37 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Dec 2019 10:44:28 -0600
Message-ID: <20191229164431.12633-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25136.000
X-TM-AS-Result: No-1.327500-8.000000-10
X-TMASE-MatchedRID: 8CJ1dKohLwvw51clvvl5rwi0LLplf+UvS1zwNuiBtIScbyawsiRjd6PF
	jJEFr+olKE0Je8DR/D4NXwNUB3oA790H8LFZNFG76sBnwpOylLN8DnhIQQWKhVtKTQi+xNa6sXE
	H6OUSoWySeRBAD59/yM0Z9vm52d6gnE6jEogtcLlwg1yAHaVTAqWqyeQEtZ48a7SFmrIk0b11s5
	5aHgdx2j0M8CG34keQDA/S0yvuTZ8tHOxcGcYoXn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.327500-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25136.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(246002)(7696005)(478600001)(186003)(1076003)(5660300002)(86362001)(26826003)(356004)(70586007)(2616005)(4744005)(6666004)(70206006)(76130400001)(26005)(107886003)(36756003)(7636002)(316002)(2906002)(8676002)(8936002)(6916009)(44832011)(4326008)(426003)(336012);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4149;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03044844-8dc3-43eb-70d8-08d78c7e6cb8
X-MS-TrafficTypeDiagnostic: BYAPR04MB4149:
X-Microsoft-Antispam-PRVS: <BYAPR04MB4149E44782FAE3991F15FE06FF240@BYAPR04MB4149.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0266491E90
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H02/g8XwMJO1LF9nSTbwywRtxB0Nb5GBfl6PlQ9JO7ZrKVwbpHhIXXo1uMSmNHLUGvsoMi9YGbikBF8KCxiNnt1jk56OBl/ErXlzFpl83d7w2RhTdm5nl4wgjOtrg+b+0V6qRwpQ1RXQ67FomUwGFUzAaL0nHxMrjgQUDlK0NQ6ATND3jDwoyFufCYB64s8BACsd7OYf9+ZCaWrM2jEx99LOvK3ne7kdjH8DKJRX020hPIPB/u4e34wg+PBvYK5GEc2NtYuDBNI9frqtrD17OfyARHruyD7VcoFn1goqcwxpMafIcqG8dciXnsY69v1TMC2gtAR8GE7WUnbh5ZSSIbRffOVrSpzyzAqHwBp411aKo0fkY7loqtngm14QFFCq1KA90Erpjdxhj0zXCszYONAnw9db2VYbJBVy9bPbuettwpra2cyM4q2Px0ObG8hj
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2019 16:44:51.2568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03044844-8dc3-43eb-70d8-08d78c7e6cb8
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4149
Subject: [meta-python][PATCH v2 1/4] python(3)-beautifulsoup4: fix RDEPENDS
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
X-List-Received-Date: Sun, 29 Dec 2019 16:44:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The RDEPENDS for class-target also apply to class-native.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-beautifulsoup4.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
index acf52dd7d..a52c96487 100644
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
@@ -8,8 +8,7 @@ SRC_URI[sha256sum] = "6135db2ba678168c07950f9a16c4031822c6f4aec75a65e0a97bc5ca09
 
 inherit pypi
 
-RDEPENDS_${PN}_class-target = "\
-    ${PYTHON_PN}-core \
+RDEPENDS_${PN} = "\
     ${PYTHON_PN}-html5lib \
     ${PYTHON_PN}-lxml \
 "
-- 
2.24.1


