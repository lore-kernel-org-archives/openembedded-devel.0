Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.41])
 by mx.groups.io with SMTP id smtpd.web10.9280.1611048945659871694
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 01:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jBRn79aW;
 spf=pass (domain: windriver.com, ip: 40.107.75.41, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAqaqZEnT5K9pEomeDfEcJQGSJneO/114mFJ/IpRMslNEDzqvKAD2gVZqBlbQydScbVxOzbSZUdEtr8nYe1yO/oCx+ml5jp/XZdyyUqgTXYkoUC9T3nHTSMj+BJfX/2A53yDxULTe/pqv1OGiogyFFbWaSAXrgN56BisCrDZK+OHYmgX2yBGIxcFTLfbrdmqE/mtsmmKFEN1Pm9NOHBWxzMZAqGJQsIfmkMsJ2s5LpErF285OdWMlvh9uG81uYo3vj26SzHKAts6LjSwXwl7z6m13ONXJxc/weA8qqIinQpqvOGQ65Fwzw14AX6q/X075jU9VoO4Qvz6HYzI6T8R8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjqFdgd4KeTe3xcrioa2sUeRAJISv1s24ovKH9KGMy4=;
 b=SRWSNsPbvmXQUFshkUXdP5zb5PNuGrGsJF0kjqNCKjTcIIP/G/Mz9Egvi0lw/P1X/r4BbngwW7Cq0WNQ3Eh57n+HJOsoEGjRvHhct0DFcRjFlJ+dRHYcVWu+J3E0VtJbTz5gjZJOKPYdfKpzhKE274X5oEo6ISpDdS/hvou+8FfLmvNYnyfhaXumI83AxB3SKmbCx+VgeAVXv8DDWbROTzYIRgPekFp7BRaTB53y6v3A9Tt1/hMm5WLEvglbIdQy+SWn3oQd7uPRbOvKDE8ZAL7D5JCeNlVYimn2/iBCnfQvF6LukbQyyyD3o+awXYOuRBbWsj6BaFKd48o57rh+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjqFdgd4KeTe3xcrioa2sUeRAJISv1s24ovKH9KGMy4=;
 b=jBRn79aWcNZTfZyrklhIvD0j+jghxZoPOHDqrc3vp328CxZSl0/nfqhYKEzDjnp0i/Aa7Au3lJrTpQCNPCAOWtALqmpxWGHUiCEbr3mxVjXxSMzXi/KhiylfTRPZgIcCCeDZItwLaZikZ3OV7w8tI4csGlTQNSAaH39Yj2StiAk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 09:35:43 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 09:35:43 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] celt051: update SRC_URI
Date: Tue, 19 Jan 2021 17:35:28 +0800
Message-Id: <20210119093528.15459-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR05CA0160.namprd05.prod.outlook.com
 (2603:10b6:a03:339::15) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SJ0PR05CA0160.namprd05.prod.outlook.com (2603:10b6:a03:339::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Tue, 19 Jan 2021 09:35:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9912f192-f2bf-45f0-b7d9-08d8bc5d96dc
X-MS-TrafficTypeDiagnostic: SA0PR11MB4672:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB467247AC3F84E9EE737CFE9A82A30@SA0PR11MB4672.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tl9rjxfctCUVr1GuEhdnXceRJHOqRslW38L/DQeMIpoD4AMy2RFO763c/H3im1dksTcnR84d6GuBqIMA+JqE+jSjMgnX/Q8rF+M9oAp/zlfyrFi1mczGqKzPrXcCU1HGoa6IC4l9xqlm8LjfwkGbbSV7R3R6l3zXCvxZSzn1n27HCI+x9Vo5jzjKkKqQSVoAqZ0xqov+qS9uO/F9a9Z4yN7+BS/hZwe6ej2TDlNEWf1ExhBwXqZMJikmWhoT4A6y8CQ0SFTGUyGolpnyZreEh+DxoJYDM4mOSTiAkhy/I29Y1n/wCzpc2D4ntZtSLSCs355FkhjSPMyaZ58duNCbAu8fFdOPy859BCyRAc78eixTIzQBG5ckVI6zSXFXAtg3eVqoii/zuBsIpeVGcbSDnQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(478600001)(44832011)(6506007)(956004)(2616005)(66946007)(83380400001)(66556008)(6666004)(52116002)(5660300002)(8936002)(2906002)(86362001)(6512007)(186003)(316002)(66476007)(1076003)(16526019)(6916009)(8676002)(36756003)(26005)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Tns6j+/SWhOdR/PJGiChTQ2LXgBVduFUxLH5z3mc5AZJeiP3qfftya77w970?=
 =?us-ascii?Q?xaXMfnjmlngOgWreIqWljaZFX/tmMPdFPGYp0tg7+m74SGWEZxYP8q+GBxIb?=
 =?us-ascii?Q?UJEmCD1SycSd2TznQaydlnWTyJpDE/OE5GMirbUA9bnAr2F/HHXJ1IMp+Sc/?=
 =?us-ascii?Q?VxXpVgFsbusOY/uGTgbIFXFjNEeGZS0PV5PacVBC+MK7osdUi41hF1UzGRuv?=
 =?us-ascii?Q?oDeDNqN6fyKa+0tw4ZoNaeigd9iWk3KmeqqMTvGPN6kJjI33MfDt8qWD9KWl?=
 =?us-ascii?Q?sP3n4YAsK/OfMYO1EeGJcarOdccpo72U4PyVxcGypxK0f2NZa2saCbw5EXRU?=
 =?us-ascii?Q?WtJjpU7lxZXiWYvlvXq2wiTL7UNyWpLlmNOmCZ3a0xDkp7BehWzFU3y2+R4e?=
 =?us-ascii?Q?mf3nhhuXFAOzkPQ+Y/UTCnPd8kO61DdCiZOFqCXyhxiDXD/CXvs4xfXrzOtk?=
 =?us-ascii?Q?arJcgQ1rGaX8eoBShBb4A0wJB8t5gcCCQFthZAciJ8JghqBBpmUAKs8/ytgx?=
 =?us-ascii?Q?VOQROb3WbLHbigCI6N6u2BmDBeVJWVAaEAqy66C63ZeYtnLOHjyIga6dbZcJ?=
 =?us-ascii?Q?5kbj/DAvJ8SdL65nabBAsKV0vI8y0tD+MWylfoj16KjXS0d05IOyttV0MBi7?=
 =?us-ascii?Q?hCgec4wC6NtM/XOrB8opweyIe2xvnhqRKmlgrTBtiKcLMLyJRw/WVwA/dmG6?=
 =?us-ascii?Q?iFF59EwAACz/fvoEAUFqrMNCJ7CMFtaeQSqTSott70EPOe0orXhfraM64Mj8?=
 =?us-ascii?Q?N6AqOWjTLGNO/vfWrUuGgmiUZaO3L9PmF42W4YXrjgoukQmmqtanParLNf7m?=
 =?us-ascii?Q?Ycg/3WCQTt720I187dH31qSYBC818ty3GPzXLYYYwBKTlqwwSfpYOCp3UuxU?=
 =?us-ascii?Q?DwVsTgEnK2SDLZyCxYknb7BVv2dX9KzMb6PtQcJKLU6n1TWcBOVzSb30N850?=
 =?us-ascii?Q?v96xGqA0gtHZvL80CacbaRX1j+PK5N+WS3aXI2aA2zvf1+HPe+T0irKecjWw?=
 =?us-ascii?Q?YMX5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9912f192-f2bf-45f0-b7d9-08d8bc5d96dc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 09:35:43.0028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrHjXUw6PeTcWSzcAqcI2Q8O9A8iMSy1iMWbT7aR3xIjqqCwTGxv5Kr6s0/J8f7ZSP6mm588rPefMJkAx5/xnfG4b18qw8wjoeoZ5WMRpRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
Content-Type: text/plain

original SRC_URI is not valid now, offical CELT repository
moved to gitlab

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/celt051/celt051_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
index 12b9124f7..c3e4cbbe6 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -16,7 +16,7 @@ PV = "0.5.1.3+git${SRCPV}"
 
 SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
 
-SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=https \
            file://0001-configure.ac-make-tools-support-optional.patch \
            file://0001-tests-Include-entcode.c-into-test-sources-to-provide.patch \
            "
-- 
2.17.1

