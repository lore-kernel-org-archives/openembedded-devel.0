Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web08.6708.1603253603298063530
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 21:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n1KWQSmX;
 spf=pass (domain: windriver.com, ip: 40.107.237.88, mailfrom: babak.sarashki@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IES9uhYQ+EYwsg49+wgonKXn6eWwmqO4igqmBZyM4Y8i3S352qr69XOXMBnGuCtKdz0U/+azhRkDdqHxmX1eDcsd1D4YO574fHUXW4pg1wcLMmoRyfEPt1cw3m8cOPunCuQ8wc0dAQf9SaqBpQGA6pnL/643/i4fa/d6lWjZywXWBujg7UUbt2YZ7vhBd9AfiCctj4zMCjmrdTeunlzG5t+PwQYEKRJB2pu60C2rJXwDIvTcfpYVnxWuUHfPYWyKNRF71rJwJs1VTyOBk8HRdf/VU56aA9Ra5HSG9tjYFrh6N7rXZARobl9FuI7PF65eKGcqrqXv0lGJ6HugU1wvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfABHsIEI0FX5t/bGdvwSlffhAFFc2OHIDZWvJhBon4=;
 b=QBjKoPxn3n3ClCoOdJ9VHbNQWDNoXlVBA3uiVbcnGfbWz0XzU1aoxAcOhpeBhB3SrTxGL8AcUIVtsdtumQRWHcBUN0klCVzoZJYvrpa2cr6Wz9zDqT1XZBi5lpw2HSmxsq1IZXRxRr78sc3Hf0vaHk+JCBiYNsrOrNoKBrzQ3duqggWkdXkLWHGAMAY8YkQBnrUZj7pdgndbaB24B0y3uq5PbGszItf3MlBqLd6j8qbCla6fGtUEvLFNxKqCvCmrCHNZDJycNsHhEdzZ5WxzLgmgJuD7NCtMe5n17hAJcwFBYtCljAbZM4lWNI+3lByqs9h9xefZ2sXYQflJfLWHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfABHsIEI0FX5t/bGdvwSlffhAFFc2OHIDZWvJhBon4=;
 b=n1KWQSmXFdIUbAW/Xeyr5aZuLYrpGtBxMP6riy/8EaozKwLCRYrm4BAw2XQYZTAg1rq5iWjIzzMaTubHiJurHFNaChQ+Zm8I4k0DCCaYPRVpfvu5Ku2bF3b0VFYmk53HeZJwkN1IsiotASmK+l8NGfMKrhBeJT+hZKQsRYhqhJA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26)
 by BYAPR11MB3205.namprd11.prod.outlook.com (2603:10b6:a03:1e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 04:13:21 +0000
Received: from BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360]) by BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 04:13:21 +0000
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Babak Sarashki <babak.sarashki@windriver.com>
Subject: [meta-python2][PATCH 1/4] package port: python-kombu version 4.6.6
Date: Wed, 21 Oct 2020 04:12:39 +0000
Message-Id: <20201021041242.14449-1-babak.sarashki@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [71.198.98.210]
X-ClientProxiedBy: BYAPR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::17) To BYAPR11MB2855.namprd11.prod.outlook.com
 (2603:10b6:a02:ca::26)
Return-Path: babak.sarashki@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scz-hmlb.xnacht.org (71.198.98.210) by BYAPR06CA0040.namprd06.prod.outlook.com (2603:10b6:a03:14b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 04:13:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc6e3b03-6422-4a75-8378-08d87577a556
X-MS-TrafficTypeDiagnostic: BYAPR11MB3205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB320521C42C0810B6E3AE5DFD861C0@BYAPR11MB3205.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YpPHnuNT0uah1AciJDyFds1RI7klkl5oaoHsFTvWZOI2nl6ODRFKxJoZPySJ3UId962qgg2Lt0rJJ+j2U1yH1oN7PAxK3A7ev/AXZigv7FhVYFP9hd5u0yCqM+TV5p8I2EozWbvqdHyvlKTTUna+RW1ml8mnB96Ggq5VCw9XOFe/hCcYKyDPq7N3K9Uc/EKRj3BY21gL+vU8tYfXBO+fl/m+A7xyG7aDlaiLglHp7B5XwvUDSol2ctJjabUPKtfkpKrruRdSLDdiurmyzTxsNdRCAMA28I2q5m0xJAbGZfHQ1rY+9mwsfS93bxMkC6L/PIZv+A+Yn24lGzKnoHp2Ttg9sgrvtMKRTW4Kpgzu0HIpLKmpL5WHTB/zhvC5TrL/oJZN8Lq+5XNfp4oZusq1iw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2855.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39840400004)(376002)(86362001)(36756003)(1076003)(5660300002)(6506007)(478600001)(6916009)(2906002)(66476007)(26005)(16526019)(107886003)(8676002)(66556008)(6512007)(6486002)(186003)(52116002)(2616005)(956004)(6666004)(44832011)(8936002)(4326008)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lJaTrKMWXJ2E0d6VpkWViDUAyb9IJwsVmE6GiNfuzzKM0dg7XXfR5wYSuv+glT2Lg+96sQPWOMxCvR2jKxPj560+LKj7dx3Doqy9jgC5jjlozPzS2Eie4nUe6GQ3E5sdRezmJLWZ0S40CYVNlyeN+gLGK6srFUf+LS9b78JfjZbhiuMeTsW2NEULuPk5ZBT9wQnUVxZutgF1qxlT86e5E33x+ZCMZvWh8kfO/F4RujrXNAZFT/Yp6auwKIiVvWf3rbgilkRSDZK0Y5qHs9YdxpdgIMuHJ6gOPDnlCMqHN+CgAe5u//xLR2lwprA4hyNEPkejQmTsqCl2GPNsGMQux73p26SPr9q12NhG1dST1ORla7o+z5LYmuuXjy8QagCz9NWuVFj8/Q00Nu1AU93VDssDl4KiGjxcWLzcSW35yrZ8kqHX8z8s/eap5aDi7nsXUlMRnZAFqmE+UrADhyuvMLnGXiqKjOTv0khfpzuS/+aKV5GLmIC4xlrH3cy6qUnK0oZ2Sp7z9lfuXwoPVngm2bqrbmX1ZUo0NOz/X7w7Z7kjDA6EwugsvPOWsPMxebm7ZEsWd6iyw5i39DQYEmzTbhzcxJKWirEUfBsU7PH3bRSvDwni5rcjbE/Zgcda2iu4l10gizUjkhJpkPk+IJEl/g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6e3b03-6422-4a75-8378-08d87577a556
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 04:13:20.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7JXlblLUYEHs4kepME75NtGkwkJ23RKzRH0EBbFVe0OG+9xOsRiehRvxXEepOXCXUsuUypVAv1ekTdX63BdG3m0gmJmpHKhUrMW6e55Hb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3205
Content-Type: text/plain

Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
---
 recipes-devtools/python/python-kombu_4.6.6.bb | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-devtools/python/python-kombu_4.6.6.bb

diff --git a/recipes-devtools/python/python-kombu_4.6.6.bb b/recipes-devtools/python/python-kombu_4.6.6.bb
new file mode 100644
index 0000000..72a9d90
--- /dev/null
+++ b/recipes-devtools/python/python-kombu_4.6.6.bb
@@ -0,0 +1,23 @@
+SUMMARY = "The aim of Kombu is to make messaging in Python as easy as possible by providing \
+an idiomatic high-level interface for the AMQ protocol, and also provide proven and tested \
+solutions to common messaging problems."
+
+DESCRIPTION = "A messaging framework for Python"
+BUGTRACKER = "http://github.com/celery/kombu/issues/"
+HOMEPAGE = "http://kombu.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
+
+SRC_URI[md5sum] = "5f751ea817b1f6a4293d4e3a01040d4f"
+SRC_URI[sha256sum] = "1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1f5561934bc8a3cbbbd86"
+
+inherit setuptools pypi
+
+PYPI_PACKAGE = "kombu"
+
+FILES_${PN}-doc += "${datadir}/${SRCNAME}"
+
+RDEPENDS_${PN} = " \
+        python-amqp \
+        "
-- 
2.17.1

