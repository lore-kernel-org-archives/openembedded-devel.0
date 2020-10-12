Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.72])
 by mx.groups.io with SMTP id smtpd.web11.30166.1602463588212385310
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2020 17:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k3u4aX6N;
 spf=pass (domain: windriver.com, ip: 40.107.92.72, mailfrom: babak.sarashki@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQPEWWqsitKkXb5WHRICkbb23mIVJRjYjtDmxJg2nnZycybEHSuz9vKdgYsTmKCq2rla3ABDGK0bfGRHnndk283OhigKPUuqhWaZY04TufE9lqAS9eZyqnCymv5A+1J8YgxMUKsDoEsVctOxiKXyn4wRdjIN1VALH+Q+B5jOcasPRZr4lvGBacvCzGsJTN2ogCITdw+oJ5vJ1dYhl8HtlQYApTEwlwsbUWKZFJNzaxHvKZqS3UuLokWB+Ppwjvp4RyBLK54EQB5m8WuQy7mLT62x2FowZqba0svwmOym69NsFByjZczuyWv57glgQBZ/HudXae6qixihcpQIi4zBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfABHsIEI0FX5t/bGdvwSlffhAFFc2OHIDZWvJhBon4=;
 b=PbAOPE8hPUREcN28uWa2rYnyNg9UcMe4ss04gGMaaHewPbILuN6cSzhRUOp/3uVCvl3CuAZca9OEpOaUibX30WfvLKS1WNaSlZq/zxumYBtE/d5nvxpgKE/BpL92RS6ejgvOZfjtKIM6OoXJdql1jvNddVfLUE49X00r1jx981+qoHnOAoRH1PgY2CiWKoaD1bcxewM8YbaX/LThU7SKcfK6NaTugNiFP3X3My8A9xv/apAVZLopBagYVWUfLTvW/h+0WO2EoqfDSFjyWpsKgRgYu+zVJfclYSGu6mnYli3xnwg8qjPEVhW+LR4GPKBjaiUy2f3o/arRyYhyfs3cVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfABHsIEI0FX5t/bGdvwSlffhAFFc2OHIDZWvJhBon4=;
 b=k3u4aX6NIkMEc2zX4W6MyluxTOm11zQN0Bbf64YdJAblIyWXvNr8cw8jAlgzrHUvXFdaJwTikboPUoMtK+tGuIUCwuMM0Du/GOob4TfY+M85CTYHNpAk8XRpudRDK3cPxOHf4EckF4LS5CrCa961Ff0YLwBYrKGCCCzhbbNJMbU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26)
 by BYAPR11MB3333.namprd11.prod.outlook.com (2603:10b6:a03:19::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Mon, 12 Oct
 2020 00:46:26 +0000
Received: from BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360]) by BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360%7]) with mapi id 15.20.3455.028; Mon, 12 Oct 2020
 00:46:26 +0000
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Babak Sarashki <babak.sarashki@windriver.com>
Subject: [meta-python2][PATCH 1/3] package port: python-kombu version 4.6.6
Date: Mon, 12 Oct 2020 00:46:01 +0000
Message-Id: <20201012004603.990-1-babak.sarashki@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [71.198.98.210]
X-ClientProxiedBy: BYAPR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::42) To BYAPR11MB2855.namprd11.prod.outlook.com
 (2603:10b6:a02:ca::26)
Return-Path: babak.sarashki@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (71.198.98.210) by BYAPR07CA0029.namprd07.prod.outlook.com (2603:10b6:a02:bc::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.25 via Frontend Transport; Mon, 12 Oct 2020 00:46:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4cab519-92c9-4f88-3e9c-08d86e483fee
X-MS-TrafficTypeDiagnostic: BYAPR11MB3333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB333393C91CFEC5B57749154886070@BYAPR11MB3333.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K0pize7AzFfBiaQjCuC8cFoAA7Wm6GGVlAJAT8DRqy4W4DmNXdBBpcqLEUxubhjB8ncaTWrSEOSC2XIpyfUnzlQFcYtHK9zVUSWhjMC/evzgDrVwaOVjLRN71l7sxniW4hx1p4svrM9b6yLzcJ8lfYvb7oM2drdnSG1X+AriTdsYBLbVtJZ8XfReCko9Z0POi4ZoWixTc3qQmAfboFS/cxRiO7Dipj8cnYkszisOQ5DziHYSUyvoUiy1NXI/SUqgeCTmm7lQswLb/c2TBl7jKlxIhcEPXOgPZXmCjoohPzzVRl8thXh+tDL43pn67efl5uh8R3G3DaYPSQ2spVuy5FFS7kdj+18UXQVQZjLW2CNDRA+RN9OEdTrZ44e0sA1w14uIsklIdpDnBjwWaIHZ/+6RmvNkEAwKI+N1BnFzkE+U4FRQkEwTRL5L6KJYs5kMpxlxAOsrb6tEvaFwwk+PxQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2855.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39830400003)(136003)(366004)(478600001)(69590400008)(4326008)(316002)(107886003)(52116002)(36756003)(956004)(1076003)(2616005)(2906002)(8676002)(44832011)(5660300002)(86362001)(6916009)(186003)(6512007)(83080400001)(16526019)(8936002)(6506007)(66946007)(66476007)(66556008)(6666004)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0rV8Nl8Gjl1VPWntPoo7V8GaklWk/eZfXLmfNZJBICNUVIXRFzQoGZlilfzLQQu8LIv1sJ2m+Gz3dx6EN/KSfcXoNrmqeJIvAsYjWw1jF0Ko1jBluxWAYxmk1vJY0I+3qq/lyk9DRKlN6CGC6UwrYJAtaVknZw5RMzprGKuyDQYyPWA6VnKFO2ycx7tEKcFk5F4gNfQOqpdf1lXXcjyna0OExOC51G4QFbyoovdnoFWyWKVW5/VoZMDOjVrwnRyLxrPc+LCzdaie6e65EsDkGUhh19Mpn/Q5X8Kbo3CoRjJjtRBG3vTLzMYZtUXrmn1geQozvNVH8mkeo2rVWdtAJmilkrpBrcbLDOY+trALY4QsQnqc6S9vVyzUGMW6HoIC7kFKOMRc0450HkPXnSo69FbXrYUeh3nf9dYZdPpENCItw2R/8kS6lktWKR7HL1KtsheW9L7YaMHOPO7YCeWf4r4NIKN9fpnbmsAHmSrFTcbYnww7gWQ8zNZDkvpgwfEzaAxjao5IN03widg8X7l2X5BbdOa+bf0LcAS59mcocwmU6jT9O6GOuyVseVaC1sEBQ3XtVH2nGHhg1LA9Zb44VSYgC57eGkfZ2IGF1k1x36DA0JAvYLlZyijc8kVB6ZikqQcy0a83IFJuTgfVpsLyeA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cab519-92c9-4f88-3e9c-08d86e483fee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 00:46:26.4711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOYPNK4xsdSiNzilDllsymk1BVdcUqYk1mi622YLBatUJLhFI7p2b7oVqcWyjcWBQgxTYX6+llyQQtwpIT2z0v7N0U/4+pQm2xnM7e6l5v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3333
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

