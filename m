Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.80])
 by mx.groups.io with SMTP id smtpd.web08.8535.1604909050596953652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y1inKSB2;
 spf=pass (domain: windriver.com, ip: 40.107.236.80, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlSWeInr0Qq60M44bdF8p7ZkQqG2lgvC9qKO/9PUZU4p7x4NXf47EeEBGscJw1e3/W4HwbHZkBiotdu0ykqB/pL1HdokM+ALtBrLHu0VIw63PT0CxrHz/4nw1ZGPsueN2kAAyUIZMP3zFBHlji54p8jIfXtH7tUQfrS9RI9MR6NfwwbSdviZpIU+8GuMFg2Y3H/AOCLUXtq3cyBENb29pD8KxHxkiRp8OsCGii8AydyVshvWDeSoIwwqnW7SvxA83LQjI0J3Bc7wtRY8dOT8xs0PY9/xHox5NsNY0IZdUD+IfoNnm5xyvvxNRMjT1gFk+40n7b89R642XPNr0pECzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Q//Kg58oMT+UUwJtttLxX/kqxJ8i5nBJag1uSErEWE=;
 b=ocu3dQ4KUqAkZKH0y9y8xEAaAK555TjJCLmJBWYGxZUSt2K1khVlvbtuuAFvDJnd9uVT38VnzF2n8Fiwsfyrfgj8S1+0b0TRsqq1kLU5gdwzk3KKzdi8I5g0lTP1pZJYC50lgDixmLsKbpvYGk0mQZ5QqtBW5gY2etKNZ2CNOvmMciaYa3pUdQzvra4/dZjVoi/wgVZCB8rRNh+3wDNDgMC9wMwMkDtNRLonJmOUazpJdBo69YFid+GUwti1O0NWbg5JZTs1O1R2bbnnKNRNWGFoiVwQdc5VlXsbIjfz7bccPGgFez7Gj5odbKCYRPwRGHKdMMljlbxCVltxpLWjgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Q//Kg58oMT+UUwJtttLxX/kqxJ8i5nBJag1uSErEWE=;
 b=Y1inKSB26WZOYkk7QMoROFrXj5lLz1anG2XmhhblNwJlvzg1Z138LByWcS+tS177MRDMh630OPJGarY/c6CMdmi/mkgqW4f/ZLK6Wy9lbsm6fXaKa50bXXpexGeVfeIt8NGpLQ6RO6CF07+8E2ZT7ox2cZVxLiZw/1Zt074MmcQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2110.namprd11.prod.outlook.com (2603:10b6:301:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Mon, 9 Nov
 2020 08:04:09 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3541.023; Mon, 9 Nov 2020
 08:04:09 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] minifi-cpp: depend on nettle and lz4
Date: Mon,  9 Nov 2020 16:03:44 +0800
Message-Id: <20201109080344.2230-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR11CA0080.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::21) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BYAPR11CA0080.namprd11.prod.outlook.com (2603:10b6:a03:f4::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 08:04:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c95481e-9406-43f4-85d5-08d88486094a
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2110:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB21103FDF7E139ADBEBBDF6FFF9EA0@MWHPR1101MB2110.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	loUZjO3F2KP/5nr5i6O+SpYV+1qzzVmLEa+LlU5kntxVwlCz8rFFPx7gLyRoB0MMfeAutQO75jH3+eaBh9Q6L1hwNif4F8HXUL27oiTZfhXcFuLLIl8d7sZWCU7AM71O0DkOp8uXswmBAz2w+ZUM8SqRZlzIZbOlRFfNICdPgu5f/fAD4BvWMHuZ1RcTKznBxkYloPGDvwzX2Umix4LckX0q9mltrEVUXv0ClpKvfQ5cNYwX/TPA6tdEnBDDVLvkG0e812qy/wput7z/ADVIGneooGyBvzLgFmVIYeKD1a3I95uCdxqZjazAk3vHYg0jOpjX3IflDdZQFJWHXVrBXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39840400004)(346002)(6506007)(66946007)(66556008)(66476007)(8936002)(52116002)(86362001)(6916009)(83380400001)(316002)(478600001)(6512007)(8676002)(26005)(1076003)(16526019)(44832011)(36756003)(6666004)(186003)(2616005)(4744005)(956004)(5660300002)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	JaZ5oesdbdA58KigHR1fX8xidNO+eW7bbP+ysh2AgnPwqGENBqlfXivqDMsPmEhxNJXrC28wUmSMkJpJ0b+hgGKpWv3j9zqc/3bVEvorf2nBcFiOdHZnJ1inxg6L+4vD6d3EIIlPzdUJAwbJKk+oXzY12j/PigIulHyiHnC2JZ+VKliTRP8dkn+jB1d5MxRHOdn0M3CMn/CXqY8+1DIMGmOsKmZSbIZUhJtk/meOiBvYcDL7tbxIdGEtJOhliFJ+zbouIeQjN2ekmbLQFkBVGSWN9dU8CptFogWv51WG9fLTKtbyV02QPgaZrBES+dmEHp/yFQmIfRHMkENBhcb7bMBOczFhmbkaKRpTLmxHs4SlkJ8Sy7QZfYFhSmPwXTxVTb407IeiRVQtaCNhcJJ2NPy2MHXfQigmJoYi5Ae5xvI+X1Cxu+Zhm8zL37IJw75dyTq3243fD5+aA9HUGErlFmSiksiBV62OHK41jPeoaEI5NMyL5CFSWocpacrRigMRNI6eKHNkTE/+Ab3FDtG1oWqLfinmuVrPjIi6uwkqbBjltHP1ai3XMxyyXhmZo1/1IYqFtMeVg6xv2ZxeI2jxDNXGrRpRCemEf5jhbDkNd1V7oeqQYkStd4InO43iJG7B7/BWStEHIGi1EX2IJ2l7Iw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c95481e-9406-43f4-85d5-08d88486094a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 08:04:09.1936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Wi+Xuppzf+cNlwT/qKa+MAOSDUOt3P52Og6Ake4KF1T0C5yV5Yrtt+onGAfzECan/+RP3COpp211IM1h9nV2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2110
Content-Type: text/plain

Add nettle and lz4 to DEPENDS to make the minifi extension archive
support crypto and lz4.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 3815220cb..2b884e3a1 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9534eb5f4ab800b573a37bffc62f3a7"
 
-DEPENDS = "virtual/crypt expat flex python3 bison-native libxml2"
+DEPENDS = "virtual/crypt expat flex python3 bison-native libxml2 nettle lz4"
 RDEPENDS_${PN} = "python3-core"
 
 SRCREV = "aa42957a2e227df41510047cece3cd606dc1cb6a"
-- 
2.17.1

