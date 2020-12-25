Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.58])
 by mx.groups.io with SMTP id smtpd.web12.5893.1608861892078380521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 18:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mQK+Eqrh;
 spf=pass (domain: windriver.com, ip: 40.107.243.58, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zzjh2kFo9J6hbgbE6fV06YpTzDQhzs45LY5puTVbUR04IbtEDKxVl1lpWGV7SLN3QIrGp6LQuGvdopgvF18ZXxEG9mPM3kQqJxDC8zkwMeCiwGosEYZRX2SZAzO7hchKMocawQ7B6Zs8QAp5tHECPPfK5iiMvPMFMyOgTCdfhR5MCh35UnGVz7ZhLtkG1XzNb4EvYdoPUGx6/1yaBPIOzWUUbnWKE5PnRe+6UVjQCFPTiVjEwpfwIkF+UT/k7lqTsKRv6j2UGJl0MyWrjxmaLmPN5mKOuy8pnYy0IJxHf3wGzbFsUyRvNJfMyUpmtdeHl4tx+Pqa+1tDmKnpudIFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHlLSroe+98V1ToCAbAcwsNWgofhOqcHntoay7bNxU4=;
 b=Eoto9MofXsMBmE3eT4sxItAZ07PgwjiUx22mc9O8zBXmXFK8o40COaG5vmqWHfdaPkcuSsH0guKHEPwuxVB+UrzHIJgNY2Y0jre1YcTq7rs5zt3tGUAVBRTaayXNvjOHi3rs7OlZXMwidPHNSpZ8vIFoAfdqI3n+rEEu4gVE27kWVrXopVm0z86/yKlRxxMGOhXHL+9IaNpQjIBOX6XDwq+RXAsfNoXF+qM5ctOn5oRnibjeaV7D5JfpvFDec811/CPG1T+/psKcNmBDTAqFyCXJK6lJKrxd493Q6gEm9Il0vhwNakwxyM9TClFc1N2/1cgxg8HY6mwF/pyFHMi15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHlLSroe+98V1ToCAbAcwsNWgofhOqcHntoay7bNxU4=;
 b=mQK+EqrhKVQA1y0mhqwGH8wzE8yif8O0GDDAx/zx35RDcWWEwx5qf8/3IwQuJ4GmlukI0N+mXxV8m5f+trjURYwj+d0IB5BuCMk9aND7+JlajyB7kP1etJtH4azzJxoY8L1lYMmvtTiQkAynHi4I7aHmmNr+ZJ8QlEqjSaBqg3A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Fri, 25 Dec
 2020 02:04:50 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3700.028; Fri, 25 Dec 2020
 02:04:50 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tftp-hpa: change the ALTERNATIVE_PRIORITY
Date: Fri, 25 Dec 2020 10:04:33 +0800
Message-ID: <20201225020433.36097-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:202:2e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Fri, 25 Dec 2020 02:04:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4b53653-f51a-4b7b-f680-08d8a879762f
X-MS-TrafficTypeDiagnostic: CO1PR11MB4818:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48181E12E2D3BD52D8B26075F1DC0@CO1PR11MB4818.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gdb6XUCWtpm+/h2JKdTdg16/SRtfad++ST+whLR9ZpW+ZyFvXYqvRmfIvG4faTcsmGgssUmUlkZZ//w/J2h2woXecJqSGuqEN+d9L7cqmZ8zMracSjWLWGJUmz1bXkQBef9XSj3C+yAqpjDY5oCROKPkbAE9M4+9gnt5Huhq1rocaWCycn/oiNpnGsWjf7oq/HGkobujIOPA0oHy7d9LlRrn+FRi6QLgIeu3NUeM5OxZ5aOBQf5o3c93rk8n0/KbRFAevKtv8uYJFEEcuzYeYXIq/Z4GFoVgQtrnykA0SPDJpf5iD2bB6KbZp52AKHbxTJCqXUYjKahcm7Dw+2iFs6Tk/fasfsueOCx/lH4UfGxC6u0W4hbjbGtVwIpooodaDJQrZJyWA8eHjvRwLOmyvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39840400004)(136003)(366004)(36756003)(2906002)(478600001)(5660300002)(66556008)(6486002)(9686003)(66946007)(83380400001)(8676002)(6512007)(66476007)(956004)(2616005)(6666004)(6506007)(16526019)(186003)(1076003)(316002)(26005)(86362001)(8936002)(52116002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?C9zrQAIIk4W4qwTr7oJUbwH7qHI8p7Crq0SKgDLLHBpJfT0yOZ7mQ9DupqMS?=
 =?us-ascii?Q?jHsm3UXiH4UHlh6iYA3+Se6z5otSAFNRORt6/XA59s82TN6ccZh+YYSPWm3s?=
 =?us-ascii?Q?FqIg9rbbeotpDphD/9wBgEu4aVb2M/8kbYTIysNcgvA7mF6JSwRylJQTIbMQ?=
 =?us-ascii?Q?p9nZfW72exBmfTrdTQL+mCy3Rob6CR+NzOr9wM2QkzUk9vnAIhXdVGspq5hS?=
 =?us-ascii?Q?z5XhUVL2z0//Syv4QQ6dDxdWHj8WUHWCyqvicdTY5UP2qc56ZOhCMz0XDnZy?=
 =?us-ascii?Q?OLwSyV1ym7jnwFBSgLe/3B/sPiHf3JypCYPZOJjVJV/6QVqvjp0J4wzQb0Lp?=
 =?us-ascii?Q?22XR392/QsXzXyh9h8cSaqs6Zq77lkRHSAZ/M+BqvAf1wgBaSGdmk1TzBl2r?=
 =?us-ascii?Q?o6oPtzUO74hsVEIo6R/3qCCyzHWcwqgXXI0o9AkhUq35bHMkFa+GxYIokLvg?=
 =?us-ascii?Q?b9QR8RmZmmW0i1AFynssiN0nOnwP1yJd32d2TP29HUYMFaYjMxQFbxvWi8zg?=
 =?us-ascii?Q?0c5QNtAsilicDPRRnLZq5Vsp/39GewpDPdTQVA5AAhr+JbuiCkDW0qAuYCko?=
 =?us-ascii?Q?DdN/4xYbhG0Awy2VvNANfc+SbH+OZMdsMwT9vcb76aIh/yax/PRwI1d/8EHY?=
 =?us-ascii?Q?23xUlvq16TA3hS4gfVnUcYOEFEO/FC71dJEz+KNws7BR6SjTvIAGJk8+YsNj?=
 =?us-ascii?Q?XSzCEA9qsHoKhhKu1ztzo1KN34xBdPv3I45jG0nJCfOU9tbX/5KTeOMRl2sl?=
 =?us-ascii?Q?E89N9iQ1sgnCrfvpOob7263Vi4OQpR31MEgIev8Nh8V1toTEnhUWtiGlUQ8E?=
 =?us-ascii?Q?koYDLh/vi5N35V18t/v8BjhaEwWvpLJg9qmPjyzP864SEfOBhAL1aaw9L41k?=
 =?us-ascii?Q?yCSgmYXZLIZ5AOVQoZ0WYMaLeZ4IMVwKhAquYbw7AjldYB5lNpy7U6GDVsa9?=
 =?us-ascii?Q?m6T1oFVGsyN8slq2DVXtXxrI0lARreODgZ/QOhKViulsNCObglD5uKF4Wptw?=
 =?us-ascii?Q?XCeK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2020 02:04:49.9831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b53653-f51a-4b7b-f680-08d8a879762f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eme4mu4Y9GUkqKYokRHt6r3KVJaEWNNmuer2xKqb1DionnazkJUtvPt24mRe1WdzpJNCfx52XhE4VuGb3SAg4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Both inetutils-tftp and tftp-hpa provide the tftp command and
the ALTERNATIVE_PRIORITY of inetutils-tftp is 79 until now.

Increase the ALTERNATIVE_PRIORITY of tftp-hpa to 100 to guarantee
the tftp command provided by tftp-hpa when both of the packages
installed.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/met=
a-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 4c62da818..dc1d6c67e 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -89,7 +89,7 @@ ALTERNATIVE_LINK_NAME[tftp.1] =3D "${mandir}/man1/tftp.1"
=20
 ALTERNATIVE_${PN} =3D "tftp"
 ALTERNATIVE_TARGET[tftp] =3D "${bindir}/tftp-hpa"
-ALTERNATIVE_PRIORITY =3D "60"
+ALTERNATIVE_PRIORITY =3D "100"
=20
=20
 SYSTEMD_PACKAGES =3D "tftp-hpa-server"
--=20
2.26.2

