Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.43])
 by mx.groups.io with SMTP id smtpd.web12.6713.1603253608470309743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 21:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g3rFb98u;
 spf=pass (domain: windriver.com, ip: 40.107.237.43, mailfrom: babak.sarashki@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ui8skzU65JX4K9S9wmeIwfGMkCAFSrxRKsUECRb/ZyF0Imfc/HUG/2NewyEpFV+XPVWBjTDamAezwuw8v8PSWYQ89kIh6GXQFZkLmFgrwqgytX5cWhlYZgU++3mxzR8qNy1DWUehZ3SMuK+g71jR2S3aN1TqV8RjfiR538pzFV2gYAuP+DSJbg/t4nZZKntryLAdtcjrU00DIzdk7+IunA4XKKb/DCL/8JAHuP16e3STZpbCRbVUJZAkF4168j7bHQNMV6N6eArtjUYAf2/VnQCzs2FzWlRW5PWH0ZEQj99R2mMmMNCfrlw9wbP45LbyC0tVz93cTibKUjIm3p05kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b8nli56SikF9O3LtkEFff10+4jNuiFDufNaPa6pYX4=;
 b=JdRRzN74ipv11LsjOVahh6i42IIyatHHCzKZ1GEm21Xn3zV6ckJG8omxusxjJg01PXgaQ9xulCEot6Ttnxxpp0tPsUfIa6F75jDS7x+WoB2ymgp56+b5orJWAZt1ZUc1MjOgTh+KIc4l3uPT+IBtBFIHKGSjMC+OJwAwphVV2cFLDKR6ZP3t3KNl2+fri/UxqLOgyc2KpqaGtVoSMMjYVgkizD87kIeV5yPoJ2FMsB/KzM+pL9enVWpJOvJdCOJHvmXoFvxBpvOD2DPCAs9cxIUbs5LANVfdjBy6+QCjna1+7p1j0M2ipV6DqN5RXIVNzSM4PelLM+ozxZhEmJCmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b8nli56SikF9O3LtkEFff10+4jNuiFDufNaPa6pYX4=;
 b=g3rFb98uRr4vn+b7HYwF3SMJhvGO4O/7vlpTqoXN4Lav7sYAbzQDt1UFt47AYQ48iUi0tqzK1IU2btN+8jK4nRwcMEKbp4wLruSjfQtY9aCnpZXmwhSDFJSprAMByJvLpyxWCUHIWV+ROdJwQ2QS4oge2UlawO6ILrzJin2AAZw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26)
 by BYAPR11MB3205.namprd11.prod.outlook.com (2603:10b6:a03:1e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 04:13:27 +0000
Received: from BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360]) by BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 04:13:27 +0000
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Babak Sarashki <babak.sarashki@windriver.com>
Subject: [meta-python2][PATCH 4/4] packagegroup-meta-python2: add new recipes
Date: Wed, 21 Oct 2020 04:12:42 +0000
Message-Id: <20201021041242.14449-4-babak.sarashki@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021041242.14449-1-babak.sarashki@windriver.com>
References: <20201021041242.14449-1-babak.sarashki@windriver.com>
X-Originating-IP: [71.198.98.210]
X-ClientProxiedBy: BYAPR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::17) To BYAPR11MB2855.namprd11.prod.outlook.com
 (2603:10b6:a02:ca::26)
Return-Path: babak.sarashki@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scz-hmlb.xnacht.org (71.198.98.210) by BYAPR06CA0040.namprd06.prod.outlook.com (2603:10b6:a03:14b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 04:13:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c9cbc12-d70c-46bf-82fe-08d87577a8e0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3205E7334210498152862047861C0@BYAPR11MB3205.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tuWCkFyUUZyu06iEplbNq740VcumulAXrZ9bEsdsU7PRYGpZ1FKfaEc+Wn8FXlTAJ/EbO2TERhUuSY+KrX302xxfaKw7WOWLitVjBtpT3trPeji4G3kfYBGlPj/VbxC4n5uhTydlTcDDYO93QCmlqZCj6ouwTeE30QrWp8ZV27nYH4yEqaWspuqs4RnSztyWTqM7mLF3dNBE1MV2OaHoQXVBYQYVDSdsRILWbCxMuC5vVGo232eK/6RLlR8DLfGtQKaC+ZO6q9DGr7szfLZMw5qYKY5TVLl37NQm0RMyoew+qiMimd6HHyuHZwhz8J33
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2855.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39840400004)(376002)(86362001)(36756003)(1076003)(5660300002)(6506007)(478600001)(6916009)(2906002)(66476007)(26005)(16526019)(107886003)(8676002)(66556008)(6512007)(6486002)(83380400001)(186003)(52116002)(2616005)(956004)(6666004)(44832011)(8936002)(4326008)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QBnSD6kWsnY/9ql1F4gAjEfXXPzWe0FLrQzGhh6TcceUTICFxRT6TI7+jbMQtuN2I92GK8OvI4wo4RZ2Zv/zrkLqrgWTE8MkBfW8BOIGKpyS4FMradFKXVLCLpuUzD3M2RHbdE376kRRljhUj/IL6HTPdtF1IrZ9nWKsgueyULqhGXUW15NW2ZrtgV0KlcjVb61jQUQj860NJu3O+a4EkoNcwLDTfVIIckKHdw1dqsz3tpMItLFiGdgd7vCcNL3tKK7Gd4LVk+SibUGYo9gko+7+uYyBbPObNCbTx4PNUv2kmuowf2fO3cld06pf58avtvXiJlSgfNf/Y6Qb9mfdgwXWH9cyY60OYP17XZJq+CojogOqEPhFRjtYPn2AlrcJhZ0ikAHLhLxHFjmjlffEKYynaAKDAxpfIwKKr7KB7LBr/or3ZI8Ok7jZhCdTCJvXpAQ04dDquSQ3s2mVHYsnd1j6niFaqGW/DGvkV3ygDPQbQUp3gInSvHY28VUtcWwUuZLI/9aN/nxp1BFDrg57LJlUBEVwTzHre5Uknzp+sF6excSBm+mkCF29FndjxpubGT1rSeQ5z9AWqfz5y497z/xiNNhQXIOHp4lFEE5/qT/zBYIlugrdw5DLeKSvS8qHt9F/3uUHKPZRw8ljTW//Tg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9cbc12-d70c-46bf-82fe-08d87577a8e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 04:13:26.9078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXKbTYB7Tx7Nrzt4p8uG25Urkm6Y8sc+Wm8Asxim6zeSWe3opyjWFBjtDTF2zKUpQaWHECR79qkV7cZvTEruRxPi3YBwkqpMCySrgJAL6XQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3205
Content-Type: text/plain

Add python-kombu
Add python-vine
Add python-amqp

Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
---
 recipes-core/packagegroups/packagegroup-meta-python2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 0eb9b8d..5891cc9 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -59,7 +59,7 @@ RDEPENDS_packagegroup-meta-python2 = "\
     python-futures python-jsmin python-pygobject python-pytoml python-six python-which \
     python-netifaces python-configargparse python-sqlparse python-soupsieve python-wrapt \
     python-deprecated python-booleanpy python-docker-pycreds python-websocket-client \
-    python-docker \
+    python-docker python-kombu python-amqp python-vine \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
-- 
2.17.1

