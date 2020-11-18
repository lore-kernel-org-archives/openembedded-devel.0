Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.41])
 by mx.groups.io with SMTP id smtpd.web10.20402.1605678622408581969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 21:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Iwf1Wf7Y;
 spf=pass (domain: windriver.com, ip: 40.107.243.41, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxbMlNujTzMr4NohgGwOocSvm0fvkePTJATopE+IapV4C1hK5hhmlJenWOzBw8/QhuvP08+MEdUkag2tdYvKrBd3JXYiIEjaXh6YtONEDPAMOB7VziPkk2scd7Bf0ttP1FmjokBtgEXZx8WzGchJQCczuD98Is0svT87iVO1iRryom/t/dypTRUwtDLBdQwtg5btJ1jg3EuSY9eLJsvXOe+WlMjHJl9IL1HE4Uc43TEY1qPnzCkXxv90A6NIjewOcZhS2va38/SbU9kC2EyHjwPNMj7FwJjtCBn6OaRH3OhDY7dilQdWf3ZNJgl4BYxpoc/fJSEU0kN4xqgUPEQ3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzJ+jzDotjUEjTiy8GctN/QQIrmk5D84y6/qe30E7XQ=;
 b=NVp1WLzePSw42bLoRHfALzScPx86YT2Qf+OW5Xtt8U3FzOiZXWZrHQ/4ScDjoXhAFsHZ1VGa3+tjnW637U5iJAQyEwsNRhQXNnABfj6uQ3VRq3G2o8mUw8DimKk+bDEMQ0NjT71HpO6Q1X3N9RxQkGJe+dmM/Zz3SUQzyLmQ0vaf+0BomQBZP8jZdB1lYkGEWARjtKGA4SXEYcKCzwekUaojQFGRqyCttsnZqHH1HWuZ38TNorBISJicXZxc0cOD4vAVtvrjkbuDo6v9Rh+OsxQQNJIO5MEa0RTF06ezzw+V7syp5uc/3m9UiAvnOEqaIyPJTJnYM9f0HDsViT8Vlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzJ+jzDotjUEjTiy8GctN/QQIrmk5D84y6/qe30E7XQ=;
 b=Iwf1Wf7YQV1VVgv2xqVZC8Cqk87tUnXYXmiy4zMj7gqE77F8aIK/hRuUBv7wr/MNDFkH9L+c2F9VI0FUU4b7bOBWyA9TGGEKcjnYH64Ubhmjq2yytnMpNGZDKIP/p/uv+4aNfKt3G78F7cNd9nFbXmzmbLYmtdapXf+f2mj9Rzk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2352.namprd11.prod.outlook.com (2603:10b6:300:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 05:50:20 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 05:50:19 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] traceroute: set VPATH
Date: Wed, 18 Nov 2020 13:48:13 +0800
Message-Id: <20201118054813.38888-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:202:2e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 05:50:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5c8a213-a5a8-4384-c981-08d88b85d4f5
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2352:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB235260B5EB613163841BF282F1E10@MWHPR1101MB2352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:318;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wCDpiH7H+SWEx4NUNbQIRGopDqsYdhnHmece82RWbg+KUGJE6t0ZeqMVZVHLmKDkSP9yDMJldreA12Xc/2/hChgit1OczJoxOHo5EtVrEOSQOwl5HKLtQ6AIzIdFo8bDYun5VhcYD7orxHYqQa7i5qbE04pJuJ67GN7cb9kWYTrK+vSnJlKR5GyaMZp2uGwQILnIQHfRlWNsgTwYKY5hEm1JIBmN2voxym+OFc1l+IM8TiLnxpyaVPAOL5r5Z9sUz3MO0XhJCfp5JpY02uOZ72R9onrc4o/Wn/6VB51WRaderokcsQpo2o2tz5la792rT2F2Jhls5o5YCrgFnoWDRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39840400004)(346002)(376002)(366004)(66556008)(6486002)(36756003)(66476007)(66946007)(4744005)(1076003)(316002)(6916009)(5660300002)(52116002)(6506007)(8936002)(2616005)(2906002)(6512007)(9686003)(186003)(956004)(16526019)(26005)(86362001)(6666004)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ObWaKipYzhKPBloHZO3dQ6LFRQACqaRBbGaIihWMA8mS6YMc1B4RGHSK0IAduF+n6gstGRl3OB0VG3pgZCJbeUpx/5Sn26ou1FbkWM78b1zyfmJ846KnFznfN4M8OR8PSG5+0xi2YmL0fSpBqJ8e/ZYOKhyiNxqBCv47nWHP3Qe4sROk07u4sVprfkuYqyAndlgcPIy2NgeHddSyZrurqD+lx6YkVIEvZLiv7bJb0eKBocZS9U1Vzb9io2jZNvH3cf/6V+ZGk996uFgpKfnAu18kGEOUxF+knOeaYiV0+8t0DWiZkPrGAvThUbKkkjvX8qeuXd/kuEqQW5zTlY28uTeJqKhGY5fE7xp2WlqmkuBLouMQgppBbJjrxYMrFdX/GnyTFl3gQD6PN4lOVEU+/wKPBN2DqDgBVCv7MK3XVkv9A2QVPM2zyQpbtKIw6a112zyBOqgZbfOJq/NQ64nyX+ATNneCKLhURqjH8toVkw1SCaMsMvhxrlj/HydZXs3YqjtDxHhpRmbkZHCEaVGNegFCzdQUkxyZbtdTGyKENAFbtwmA9Vn0aRws65LxcuqpDklFVNowvHI84WpER4/ZN5GT5acclQM9IjEMVZlaK/MweRaFRPgYXw8alFN/D2aHPM5cQrdnNyJAk7WYlFg/w8DE4BknYZdHOkHlVL+Xz6BEX/UN7AYnXq9Jkqdiivx51DHx3J1h//0shTpfxpOAM0EgJxaKDlKc+9/bzUDbIlIMrMRdJ67c5jFoXP8ZIVvKu49N34sKKYz5cVLyCA89tzR/Dz2xI89vbC0nX9f4lXV326/f6LyvsDsA9Clrof9Dk12vO0B2PfIrWGDOvq7iB59Pbb6mBA/RUj7T9OPaxuoRP1rvwuxxqqg0zkOXyvDcBN3GiE7mWKGWcChgWOqUfQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c8a213-a5a8-4384-c981-08d88b85d4f5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 05:50:19.5661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rSUhjR8Pgk9Ok9HYKFZdFb3oOpeWIIc+KV32HS5bYCx5WGY81C2wXXvlXyPZhcUzUbi5gxRdseOa7TF7E75Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2352
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
make[1]: *** No rule to make target '-lm', needed by 'traceroute'.  Stop.
---
 meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
index 18930b14a..993794492 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 SRC_URI[md5sum] = "84d329d67abc3fb83fc8cb12aeaddaba"
 SRC_URI[sha256sum] = "3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6"
 
+EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
 
 do_compile() {
-- 
2.17.1

