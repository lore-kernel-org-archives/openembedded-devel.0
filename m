Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.66])
 by mx.groups.io with SMTP id smtpd.web08.1291.1609292579892784425
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Dec 2020 17:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ETcWkS9T;
 spf=pass (domain: windriver.com, ip: 40.107.223.66, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnHUSQCbRW3ONsnh5f4FTWzXuEjTQDEv7fg3MEH/XQI0L+vDJrlAN1TWUZ2zJpUjhNT8xxzpWwR4L1a46qR2HJ7ZfvRJb73bfKYc14n5wRK5lY/ZCH0F4RnVBffDnPyfBSQe5bmwOpIStYisnMejWMENCN6c9/xn1FXkQnUlE6nVuHwn4EqUWcMdUuDkKrBfKNqGap7f9O36dHHXqc1GU3JuHcdWByITkWyYJtuYibi0E8+wLSgVfLHzOuFYJHQexdGcTsG/gwKDemqH6mKlrAts16fSoXU+i8Lj/vDJJIj0AxnzOyAZguIegXo1tMptj6bLCNfUMHzduIH3hgHJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5AG4xdnj15G0dZRzzPjCiTOqU5KbYokwuDyUVmdcUk=;
 b=F+LOYQv+lG3vhivHeON3hQdVo6M9LsH2eSQFTOhvHNjPY97ZNmZe70zrhMEHBBw9rZatlS12ak4kXJO9sunQFeN9vDX0XM94UscseLhevinHr7qYD2H44vSesWVRTQzzXI+D2V3tQtGLPV/2HRfO6QwTnWwtZfs8/WVfuFHLS0ocYf9AKI1yqmJ9ttU0gw3WwGtXUyGY3PYJd8K3SPR/efofPAV6jLqA5QEh16QxQA0kRjLIRS7mc7pl1blWkdjn7vtDRr6Y9pcCi2Ls/W5XW7fIVsR3cIZ/goNMxzaW2BIJm7xBm8LVAkVq4GsA7vIA/qKgJDvSdDc1Z7m5+dTRTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5AG4xdnj15G0dZRzzPjCiTOqU5KbYokwuDyUVmdcUk=;
 b=ETcWkS9Tks0kHZgy+zmC3/mEZyCyzu2Gn1HGULgOB91gFquGRYL3DiQ1Z1h+nENG1x1yPRmY9n8PFRtqSQ0UgcIdZsqijr+XkzwGU9LcEjv2CPiupxEVJGU+Y06+Hu09b5Evzy+EA1reFvzQaZSAwx1r2NSjnE+RaG8aEeTRXPs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 30 Dec
 2020 01:42:58 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1%6]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 01:42:58 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] nginx: upgrade 1.17.8 -> 1.19.6
Date: Wed, 30 Dec 2020 09:42:44 +0800
Message-Id: <20201230014244.759-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201230014244.759-1-changqing.li@windriver.com>
References: <20201230014244.759-1-changqing.li@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 30 Dec 2020 01:42:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78495d7a-7d36-40ac-a5c4-08d8ac643ccb
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4131368A7A66728B129B4FA482D70@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RXACcpA45W3+IGLTh9ZSMVjDPiGlY6N+pmF57eBFCmWV83HLTr7Xhf4P+tlmnZgpkKmryTsu1AR/eruY0cIeXiLAekzNQTCwn0evuY0spVAn8zJXgkcNobQ08rcsMR/gDrovilxxnLkEhvBOKkM32k28xr6oovYYx5bOplRgGci8nMRbjcJTFE+RPuNbmMsEPnEWdngfQljaC31Tq9dG+4REEDmxtxXXuJt/w++ctYMiwm2vJziZiDC5S85e1LrkjcQ0Ac4W8A8mX1mt1B1UsdXzTNZNjfu31DXviPXUQUhKaMkY12iydCaB1SszS7B6QnbCOlKA3OyUkSt4UjV86jRCciRXVVakfOKInJAejGZSicYInNcbNExVeG5Kzdl2W+Tk1Nww//gONMVNmQw9+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(376002)(366004)(346002)(396003)(2906002)(6916009)(316002)(2616005)(6512007)(8676002)(5660300002)(44832011)(83380400001)(66476007)(8936002)(16526019)(86362001)(52116002)(6666004)(6486002)(36756003)(1076003)(6506007)(186003)(956004)(66946007)(66556008)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lDPXGFuPsujHuM43I2p88lPZikpinv4YLE0ljp1RPQX2e9xdK7WeUKOJ7xBI?=
 =?us-ascii?Q?YkBQlvyDCGwRpsefMfLYnfhKim2BVisNnWBZUonzi4kxqex99cPnI2UnOs6f?=
 =?us-ascii?Q?42UtdxH1wFruvFYxePYAvzxknZ+JfjuY+AXZd0RK6OLBtCZQ7HJwufZp3GPf?=
 =?us-ascii?Q?+G4iZ9dsqgySevpk1GZt7O6bM5c1TB2XAbVlDIzpN3Y6pfK4Af5oQA0KC228?=
 =?us-ascii?Q?+bBQ5R9EX/i96EAjpySClSlejoH7wRdtSC1i2eEieGOvqH9e+KT9D3r2Oz4U?=
 =?us-ascii?Q?KSKlO37YDMkp1BqDqafAYqRbMAPFebUcQBhwYjTCD2w8vmJOWxQSx532vLsi?=
 =?us-ascii?Q?cr25DH17vM1YeNhffaGTafV+t9UfSFnvbU8uZpKT8RxbT8H+j0hM94yP1eaG?=
 =?us-ascii?Q?xWcaYjlpIXRbXZM/XAvjd2qblRWMg8dJmu+vAeSpbkEVufDn7B6A23LqW+fh?=
 =?us-ascii?Q?FpMSfH3fOPj7VDO6OKFGdEXBvRQq4QnPqH5CfEerL9Qn1WhriMm70m/HHaD3?=
 =?us-ascii?Q?qAKzy+926bzIVo3qoj+FaOcVVX1kjsuZ+U/r+n+n613R96TMOT+oVc6KdIPU?=
 =?us-ascii?Q?2ISOsEEfqgm3J5z+CiNdEGKf55UVs56JI3oGeFIaM9202oh8XtbXpi1Dm6pB?=
 =?us-ascii?Q?oFO3Z1oQ2CQ2EL31Sf5nmh62T05tFH2yTOcueiiXGVUboiUPXGPE4BhRSg5J?=
 =?us-ascii?Q?2i589DqwgPilz78f/tV0T81aJOfEfzOky2hf+uwKsup1xfMZtEPGybWp9xDk?=
 =?us-ascii?Q?rzMHa1k3H0MB8rOvzBPBz6ruCriWZr52veQZhiiahYrjpHXTnvCOy/lqifu/?=
 =?us-ascii?Q?Hd9HRD07of2Pl7Mmzg6u+GKcABcV2Y9tLIx/hGUCWhQ9zJttQUWxJtcoi6Qw?=
 =?us-ascii?Q?6dWf1OkOUv7G+ONEwK46hkck32fEr1GTgWFV3nYXdQqqHZmrCML7CBkEut3y?=
 =?us-ascii?Q?e8pDOmm1vkX1xosD4tbM1ZgTC5czIOX7zvtSrf1c5SY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 01:42:58.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 78495d7a-7d36-40ac-a5c4-08d8ac643ccb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWhsYRe2oKAgIv9TQtRcGm6U0cqD5VzTLkBIXH6yn32NgRy/onlRYsj6hBxwdnIkW5fptosaOsaWtfl2xy1fOE012sny1O5eNirq2hrUAhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb
deleted file mode 100644
index 3d2a5edd2..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.16.x branch is the current stable branch, the recommended default
-# 1.17.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
-
-SRC_URI[md5sum] = "29cd861a13aae69a058cbabaae86177b"
-SRC_URI[sha256sum] = "97d23ecf6d5150b30e284b40e8a6f7e3bb5be6b601e373a4d013768d5a25965b"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
new file mode 100644
index 000000000..16c80cd09
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.18.x branch is the current stable branch, the recommended default
+# 1.19.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "0be1d90b45b1bdfcf8339f299e74063a"
+SRC_URI[sha256sum] = "b11195a02b1d3285ddf2987e02c6b6d28df41bb1b1dd25f33542848ef4fc33b5"
-- 
2.17.1

