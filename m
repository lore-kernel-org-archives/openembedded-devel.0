Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.75])
 by mx.groups.io with SMTP id smtpd.web09.988.1603172456436282248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 22:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dJvJ0T/w;
 spf=pass (domain: windriver.com, ip: 40.107.70.75, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gn4zbU30aq4tVi2k7A2LwZm/fcsAb9QuV/RriG0SYiq/f/1R/QEI7lMHK3AZJDE2UepmadWyWX2zlvyYRjIrsjIgXc+1ILPQe16PCN6cE7jtsr7tO1Q/8nq06mCqJ8RhT7YbUP7DVAJpB/6kF0beSM66UMBsbQHgFDAh9UxVcMSG+4iD24WqT9CUK21rT6lZkDcOe2CKE3y9OKslNYAYEAHNYM/GC3fTHcfZ3Jwl2GZoHyithep2Q4yz83RISw7EmSDdFlVe/v4ZW7jGxzc2BakgBdRvSzETNlMYdiUvVcPzRdPlvVbIE59w0I0gH/nShqcCxYuUOxEWftWu7CdUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj/iunxqnF+q/n7EQU3J3Xmj3rqUFVfMjdbO2MFjRZQ=;
 b=izkcyO+rrjqqcpyhgq9/FFZmA40Dee9tAn3q5G9UsoMcYSng7JGaKQ+QPI/K1pw1p7S06UDBpsLBcBMOdG24CcaPyRoNropdqfOP23NixxBMIV9QWJ52HBilWIRlZAee4s5bxBji2xdUgg6r7RkL9/ZYOTrGO1KjxRcRjBN4knjphWdyFRsNjIH0tiR8BoARB38UtOoOZt5Isox6ZbVz6kzv8L3/dZxCR/YqUpGWOlUTaiYolZ68uzFqjkFM9WRUUK7NH5fmOAT/O3CeSArzWjXxP0oGSOGCsFKHpu7LeBGqVMRMt4rAr53iMX4LxTtKQsIwhdHQLHN41LcK9+zvCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj/iunxqnF+q/n7EQU3J3Xmj3rqUFVfMjdbO2MFjRZQ=;
 b=dJvJ0T/w+stb1MA2EtnGmHgqUqe5l2gWBFAPs3F06GTCD9y6Fsf1Bf2jWGmkZ8F3GX6E3+7pkgTDhPqfoDZm3bTf/lsHivgjPYB+AGz1lzhZeolymt8tiAqUwMiQK9IZn1eOlMRoc4Dy1zWlkey8kI/Nk7uGy/GKKJ0C/KmB5CI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3719.namprd11.prod.outlook.com (2603:10b6:a03:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 20 Oct
 2020 05:40:55 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4%5]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 05:40:55 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] openhpi: use /run instead of /var/run in systemd service file
Date: Tue, 20 Oct 2020 13:40:38 +0800
Message-Id: <20201020054038.22577-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0170.apcprd02.prod.outlook.com
 (2603:1096:201:1f::30) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0170.apcprd02.prod.outlook.com (2603:1096:201:1f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 05:40:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e540d5-3b55-431a-a38b-08d874bab676
X-MS-TrafficTypeDiagnostic: BYAPR11MB3719:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37190390CD93576C851D5E9BED1F0@BYAPR11MB3719.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wTmbfCz/VkDcTAG8VgeefTgh/ACnf4r05QBu1o3qp6sGZJvaH3vbD6MboNpNWhJhSsJw+WCN24jsCz9eeSVWLdWgZXQfoIqAvHlZXPCGkOtCD9xTk+eeqaau/UjJVJevME3a+PGan80y4DJ1aznx4J9XsUk60NH6erFKeVANgEIHGd+LAV6+BYxzciBiP88dPWVChZvbqMfyQko5DSneUWI4nQ8u+zO2m4BITnOGNbkFSl3reLdnF2c68h6tcXR6+6UQsnNPQN/tgZy8SuX4GlVEfWXFe4v2iyDw1fOvJW96wOjY90NPB7k4/mP+q5T7FqmuT+fEd2f+4e0jKuRZTg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(186003)(16526019)(52116002)(6506007)(8936002)(1076003)(26005)(478600001)(83380400001)(316002)(4744005)(6486002)(2616005)(956004)(36756003)(6916009)(6512007)(8676002)(2906002)(66946007)(6666004)(86362001)(5660300002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	d0DlqUAwo7z5U3RS8Fjop9EK8qNxerMr6Woh7Ldi2B74Q3Ppyh7phkr1PwGkH4zsGF6l27CYCGbiT4iNB/xACCfAB+kAendIwQfo9yVIY3rYRny0qMx6LRIRSsDN6p4SPbxRhyFzkKkaFwZZOJXcpYYPRHJyYySYXaQxm8Tq3z6k6LwJK0IZA64tO5HUenkQeLz+xJOY/I/fhlgC49LzUSW3+lpMxkRfyzOBJNd458zY777q2Rlt5p0UGltijRS1lGDSbr4YdihVdVYukmmKI+hIkuVd1c7X9Z8AlS+qB4lQv1WdcSB79c1pyfRQf0xelwtmvY8HwpSE85CP5BJHmvN7Yt/4JjBO9RywSnD6FgNLgKRjtytWcX2PyET95iHndf/POP3V1qTLh0tAbwo3/5Uy2RvuFXAvFAGxzxxXZfowPhcIWpFQ4a0DRbq7MxgndmtRhIQQ5vHSRvhgnwwIEgMo6y9+2kA+ImHSO+sW4YgtsAMOfsfPQPkcM9tMM9Pn6rt9uwgnw406n5BboOBKyu55jBoEsLzu+D98U9jdcFD0DDzxMY11GB3N0yynpYVqbOEUP5xdBeV12eYctxd5pMzpM4WtIeNqoZj7C2StZQxqepU9QUd15v3bZIU/IXbkuCQKWFcYJB1etvGmHsbEeA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e540d5-3b55-431a-a38b-08d874bab676
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 05:40:55.0580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Z2bUqWxlklW6CGTWsTtrhYFxR9iR5OteRg3/428S7povwU4MTdxtH3r57S+FNAfFmAKiKhlInRRUFePBPGFXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3719
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/openhpi/files/openhpid.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpid.service b/meta-networking/recipes-daemons/openhpi/files/openhpid.service
index cd4168f8e..816e44f82 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpid.service
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpid.service
@@ -4,7 +4,7 @@ After=syslog.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/openhpid.pid
+PIDFile=/run/openhpid.pid
 ExecStart=@SBINDIR@/openhpid -c @SYSCONFDIR@/openhpi/openhpi.conf
 
 [Install]
-- 
2.17.1

