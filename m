Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770109.outbound.protection.outlook.com [40.107.77.109])
	by mail.openembedded.org (Postfix) with ESMTP id AE9777F7DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:35:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oXTunhZMkm5XxB/b08ZnHuSJUrBBPKWAUWkhQZbnE+66CGg7VCO9EEfH9pwNB1KRHCrFX+NL4zqvplqI+xv8Smo7Q4/1yXsffPU/uIDi+tGd+1K/Q1kPU73N9OsD8zBCIkd/cVjRmKnqu/SLOLuvBnoduN5vrUamJ34vDxwf5qHgcQ4JFISfsubtGD5OoAmgjYcMwFycFa6hkvczIW9yoXVB+3msekrr82dg2kpmXb1FCLlPbxsZ3b5EktBgTNtAhkW6QPbURS1Ty0wVe3TmvndOLFua3zScQnT3JedSD42tUqxzA/Tt5NVWMRUAxgePYzyPv+TSSaUa+Hu+O/bLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QijcvPv3wKjUXU2WCfAHx/xqrZ5/BnYUyoPnqlC7c40=;
	b=fPh6WLXHoWOn6kOHHmw1PtCU6swzAJIXZYya3314xCRzdmJs4SZAnuZkYY1LHLqy8CN9oieqENBvL/zTf+FIzbIDXxBTLGKouZxY6M31q3R6ApGRM2k1jDeHEecEse9hVKmpOsR3t0goy6CAeAABTAXHCMmvOmOpHb3qD0vZcIAmkKCeNL2NHOnfoDc6oBoR7wlprPNN6NkgzwP7lHwPW5pUZZAtOgogiu6gS6yq8DEZOA5a1L6cOH2j9rHebi8rFPsjp+YHJNQ96glxgAJIoH/6W+qCGySK6Vlryy0RF7E0cMICviXPRoc9lBYkBZtDhCXQx46GqiKxlPvcCKshBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QijcvPv3wKjUXU2WCfAHx/xqrZ5/BnYUyoPnqlC7c40=;
	b=V38XEzxrKjQf4CcHWrssKctVrz8SnRiGEH7AaS/BJAjFUILfu9ANn0wu0trRtS8sokW1xbk0hHS3x07AyrDTYT3cPvTQAh+1WWdI9PxxXLTXiSzowk9sWWdqNulig08DM/kzcbRsIS0HiP+k5p6uRdn1HRLEKipc1gQfFn+Jyh4=
Received: from CO2PR04CA0142.namprd04.prod.outlook.com (2603:10b6:104::20) by
	CH2PR04MB6775.namprd04.prod.outlook.com (2603:10b6:610:9f::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.17; Thu, 31 Oct 2019 16:35:42 +0000
Received: from SN1NAM01FT047.eop-nam01.prod.protection.outlook.com
	(2a01:111:f400:7e40::200) by CO2PR04CA0142.outlook.office365.com
	(2603:10b6:104::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.20 via
	Frontend Transport; Thu, 31 Oct 2019 16:35:42 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	SN1NAM01FT047.mail.protection.outlook.com (10.152.65.134) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.28 via Frontend Transport; Thu, 31 Oct 2019 16:35:41 +0000
Received: from OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) by
	olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Thu, 31 Oct 2019 11:35:39 -0500
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
	OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Thu, 31 Oct 2019 11:35:40 -0500
Received: from ola-ght37x2-bionic.ad.garmin.com (10.5.84.15) by
	smtp.garmin.com (10.5.144.12) with Microsoft SMTP Server id 15.1.1779.2
	via Frontend Transport; Thu, 31 Oct 2019 11:35:40 -0500
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 11:33:57 -0500
Message-ID: <20191031163358.6087-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25014.000
X-TM-AS-Result: No-3.036800-8.000000-10
X-TMASE-MatchedRID: QFiJdFrBi70EKOANYeq0GilJ2c6NlEA9JeZTqzmsW8WXBXaJoB9JZxRF
	JJyf5BJe3iBkJ/Z7m2pMECZBMumdcI2j49Ftap9Eymsk/wUE4hqkA4sIz3PejEgjXYe1fiarPL+
	+5kL68GcZkRXVkSZbl/B/RKzWWVa/PRmYU0l9WKMuRtDmjMMhclBpkSDMbdc5UDyMdqEpUuUNmx
	DA5xWGpQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.036800-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25014.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(346002)(376002)(39860400002)(136003)(199004)(189003)(426003)(7696005)(5660300002)(126002)(51416003)(316002)(50226002)(486006)(48376002)(106002)(8676002)(1076003)(558084003)(44832011)(8936002)(2351001)(476003)(2616005)(36756003)(305945005)(50466002)(2870700001)(478600001)(26826003)(2906002)(246002)(70206006)(70586007)(86362001)(336012)(47776003)(76130400001)(356004)(6666004)(7636002)(6916009)(186003)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR04MB6775;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72966d7f-983a-400a-9d60-08d75e205e9a
X-MS-TrafficTypeDiagnostic: CH2PR04MB6775:
X-Microsoft-Antispam-PRVS: <CH2PR04MB67751639AEB0A1D79DA21AE2FF630@CH2PR04MB6775.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02070414A1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UdcZBPnS8aVlgx/jLmGswSkDNK+iqUceYN3JRg/3xvo7vos1O3mpoIFg5EHKqujwD4k2SfUalMMxPROcc3c1HahjiZdxRfSUcLjbXQHsUct3DRPUSsfZr/6+CkZISNuV2pwIK/hPqC/68Utv2XXnR3NonhEOBYXR0+BaFAEeuMM0v+mEhqgGTg1FrDbOhGmlXP+DcfKaTIWs346S11aju5W1ZOE5H02R1ED+H58K5XWSIh2/ig+tflWplNCp3HnKrwUoGw72DsOeBWGmejIhvr+J/TsEHGrk3AzhlUZqcuc5cmDrdZfWMgicn5ZkhDVGGoovIJ5gMdjXQZsQ1DnZGl+Caxji0m/hPaGmMcA1odensqhqxu14gvXblG9LrmXqHs8Brox4NYh8Wpoc2sBCVUUQlFdcXpPDUvZnfNZ3TU6YNIx5ICaXAnm3bgVNyuuk
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 16:35:41.4379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72966d7f-983a-400a-9d60-08d75e205e9a
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6775
Subject: [meta-python][morty][PATCH 0/2] python-setuptools-scm backports
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
X-List-Received-Date: Thu, 31 Oct 2019 16:35:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A couple of clean cherrypicks from rocko- my goal with this series is
support for -native. Picking the version bump simply avoids a merge
conflict; if this is not allowed, I'm happy to rework.



