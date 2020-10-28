Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.50])
 by mx.groups.io with SMTP id smtpd.web11.4948.1603867475082577613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2020 23:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=My64kcZu;
 spf=pass (domain: windriver.com, ip: 40.107.220.50, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUdGKNpCWC1+lTsxLEPdaXtdpGfNNDvK44A44bgnVFPW7ojpmPs8p8yNZfmvV3pUl1deJN/75lMpARDjBOHJm6h+e+dwwIZJ5/VSsQAympqryk6pmiwHR5VVkNl4yBYcnDP88iWwSl6dIqBm4AJ+KWBdmyUhWigRAhdUrwcty+g/LbXkqoR2yAlUnB3pe9ayk3ZCyKa0m98DJzs+iJfMX+EXC/3VkRNcOvyNtR3ah01v0gkGzdZkan7+y9V1Hjea9RMgB43jkUSFY0osaBuvUOSlSgsZjP7g2sH3tDSKn9+3XueEPWEEx8/egCuvfHcp8XqHRzgWbgCz1QzQprp37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n9loVNkDZsOSAs/037VYeQwgWdkJ2M7yhK8rB1cbdY=;
 b=C8t6wEoUOqdmyWQIjbxAPW1rHRGLTj4miCaZJPZ5vNBQEe5GTs05kXupgkylUhELu3HfpEsVzMdzynJdCgcJ22DJU7wc9Wc20MhoDaS0eW4XBUXzNgzMxmBmnFE/M7i7d4ettwaF+nA1qKBnXf99WopdDpKdBGCGg2q0ULdocYyyP6fFyAAdBuR/yOqWKpAl7f+VZWjvsqLiBG/XDb76GYHlMWeKwy3+3BrOa9ueqvEL+Ognc62JsJQT4TggV1B88nftuLChBLmoTIvROvPU3J14LjvUPGFyO/P36BX5PiwKnRpeV1duhuKN4fsVmhTgpQrjdSi+arfoagmSIT4bEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n9loVNkDZsOSAs/037VYeQwgWdkJ2M7yhK8rB1cbdY=;
 b=My64kcZu7nmdfvajqoySc9wAcjjTwm/tSlY9Y1ah25MQFAvqW2ERtYTbyYS1o7/ATIkFYiWBXFNLjw6+RTzkWq1/oveAvtThJdgVH7jEkQ+TMGbK4jGLRM4nlDlml3qiZH1ZsFw0OYVNDsENX0iUgox8eh7U6zt9r4FD1fQxK9M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3455.namprd11.prod.outlook.com (2603:10b6:805:bb::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 06:44:32 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::7dc6:b76a:9576:a252]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::7dc6:b76a:9576:a252%6]) with mapi id 15.20.3499.019; Wed, 28 Oct 2020
 06:44:32 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] thin-provisioning-tools: switch branch from master to main
Date: Wed, 28 Oct 2020 14:44:09 +0800
Message-Id: <20201028064409.44734-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0198.apcprd02.prod.outlook.com
 (2603:1096:201:21::34) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR02CA0198.apcprd02.prod.outlook.com (2603:1096:201:21::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 28 Oct 2020 06:44:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65c7c890-989b-42a0-6d92-08d87b0cecd2
X-MS-TrafficTypeDiagnostic: SN6PR11MB3455:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB34550176F36AC4DAD9CBD9AF82170@SN6PR11MB3455.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OVICZZpo3T6Yi/q/yKmujjWcdpFJhokNI/aqSTkd37KpbL3ssChMZ8Ws0Y9GlR9YFtDVPpOh8v6RjefF0XW4z3t3NYkPUOJtzF1zL62j3wwXn2JfHa4bhoE6Ukv2owFyeMM7wss9k5YYzL/fHYGH4QwgpfUgQkdrzaCR+dF2J+4Z4KLfJGXbXV+o7Y6Dt/SQLKC1xbIuYxEshk8rf1IU4+MRlRDt+AmgBmXdx8/GtlJO4vntB6J4amndI5SRGZORexdi2llUNlNJnSTOSYoKVE/js6Wu3lL1hoUvpct9Z8ztV6ZQv3Y3c/eLeUUsBvFn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39840400004)(136003)(376002)(8676002)(86362001)(4744005)(66476007)(1076003)(16526019)(8936002)(6486002)(52116002)(478600001)(186003)(316002)(44832011)(66946007)(26005)(2616005)(36756003)(66556008)(2906002)(6666004)(5660300002)(83380400001)(6506007)(956004)(6916009)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	a9YCEflUj6d7MNbta77u79vE/NsYMF04/NQ7k93p8F0zKrn1vX64TbDkpLgEeqOUqTBHa6SQgNyiDoAUR435BQYfHTDlHsWvbM1w9+k3dXAZ9BHMVgd3EF4NvIQKb4hy1/56X8bL7COqfELzcYcOEje+geJf15eZz5PCNos+GXQVpwWV7G8pKaLIiSTVnWRaDsRE3OOiKhFqlsnUfbw7O8/LkRBy/U05AfypXUCoySDV7yrCo5jKVAL11vRHu/Wu/YeY/ykTniQUN6ixeEamau9VCvxVqw5Oq2OYqkTAGHkxA5gzwSHoq6OweBokALyvA3t1waf8mO0LIaKVaZpR1OEUo+oEW1j9JkuBIEX+GTWtzU7LhlESiCemhG3zy5okdgYtVyoEfcZh5eGV/RDLBEIRefupc/vYBHDTpc/zt6h7b27y2Lo0s9sZg6oSCoMHIyETKI8dCudrV88bnbXpbwNvNMwp06CN8DEWY1ksIN3DPEKqVv4DGdL52eFbXDrfsRBfDG9Aq/ZW6ELA0sPptHGKj9JZhAbBCMK5J037ITXEAfM/KwroQ+64Oq9fm9cxIsuw5OADm59Scfmfs63snwiZuHtbnCQ2+FhtlA7eZH5FnVCVGLciBQI/DZSJrMpmUq3USy6gJqwtvjQUQS/69A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c7c890-989b-42a0-6d92-08d87b0cecd2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 06:44:32.0030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfEOF3epNW52es45cVylqJtNKVWZ/giSwLD1iWfdpkMzQ2ShoMElr10zmQGbO7o8fq/DVMop0VsL5Vz/dytNdgT26IyMOh6NQ42BIGVDi50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3455
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
index 9f89bac22..3f82734ac 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
@@ -7,7 +7,7 @@ SECTION = "devel"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
+SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
            file://0001-do-not-strip-pdata_tools-at-do_install.patch \
            file://use-sh-on-path.patch \
 "
-- 
2.17.1

