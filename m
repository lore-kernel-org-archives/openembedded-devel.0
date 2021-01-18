Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.48])
 by mx.groups.io with SMTP id smtpd.web11.30386.1610954316110569318
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 23:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=J+KkfDrn;
 spf=pass (domain: windriver.com, ip: 40.107.76.48, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNF5y3fMgpW7b69mNFXGYHmFLPY8dDU9JZkRWPlcU3qn1nhVxLC5ulnFtpINIfAQezNS18/fRD7QAExcocxZMi39QZHjfXl/rzr4KXFXQKGrXndDQsIY6dbHZu/1RLw7pQj+mLoJdUHqYdzTsIWRC4pzKO0/M8sQFZkA1gvZcJNVRcy2grwCG/A4GeLLTxwl45zv4w6HjIAj6j2isLf549w3uNkhe+zGnh6NwaT8zKJOoXuIkeTwTQbAfnMrKSK0XDVvluuBfWHkP98Iz6xozXrFiWwry9VwL1NIpDx9vq9R4i7oIBLFAJbPPTE21q2S7Am313exVEhFZKnnNXUOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCGIKnysm9gYR/+d48nrcgZ5+Wk8PkRov6Aey592PbU=;
 b=TXwcIqR3o5S14AWy9qXPZ/VfTyEoWXZF6EWwzsJF+AH44B4QYLi5z9iTXtBoOxdFfS+bxcg1n82zphZN5/azsU+UwgEfdwTbiO9cth4N20igv+XfkTBuGpyUn9OBaHoQwHOMUwMBwZrtSG1w31wxSKE7d9EKaUkgHXfU+y/XN3RxpO7v7hVhATrSZ6XS7yG5sykYTpllNOzOo9ObtvUk1Bg5GsaVKR6tKWZ1DEEphDFRCRhl8oM7vHXLuxfaF6+hZg6y3AW6uAh2Mji323noa5PB4p7YnC2LuZG83qbzOcsviXpI/g1/tQdPKMp6KZMq2XLzoOnI4L0hXtUaWiLm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCGIKnysm9gYR/+d48nrcgZ5+Wk8PkRov6Aey592PbU=;
 b=J+KkfDrnz3KWGw0wO5r07J99ilPYaQedRpWHr6DFaTZLX5zFx8NOkgr0Beoncv0nBxNEhukLwqvOp3o6K5EVsC7VIMDhN6Pi3tgf1VFoWJZbNDUUCAypt0Ss3qq7omen7LpeGRKI5khqpH1QenBcPinUnWqt742+CkWM+VtCOso=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3687.namprd11.prod.outlook.com (2603:10b6:a03:ff::26)
 by SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Mon, 18 Jan
 2021 07:18:34 +0000
Received: from BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28]) by BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28%5]) with mapi id 15.20.3763.013; Mon, 18 Jan 2021
 07:18:33 +0000
From: "kai" <kai.kang@windriver.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 0/1] Update xfce4-panel-profiles patch for centos 7
Date: Mon, 18 Jan 2021 15:18:13 +0800
Message-Id: <20210118071813.6605-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0015.apcprd03.prod.outlook.com
 (2603:1096:202::25) To BYAPR11MB3687.namprd11.prod.outlook.com
 (2603:10b6:a03:ff::26)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0302CA0015.apcprd03.prod.outlook.com (2603:1096:202::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 07:18:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22b6a201-d36f-4d54-3645-08d8bb814387
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4910:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4910F17A1D8B9FD54CB6C09595A40@SJ0PR11MB4910.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o75mJkUHNvP7aIVXG2CkJXYHokuJcmk0kM13/6eCd4k1XVM/6mgfwbeuW9TRxvOrs2vnHlAjvG6l8tjwtILXg9B8JBlDIILjamcoFnEF0euDfMm+xY0ghgAcFS5sl943x3ipyrWE8M8v+sLmQMO8l0TPBmnizExkLaJqy5T9PQvp4r8kz8RbTuCtLdJlSJLP8m7MJTU1EZ8HXnfMnncpSlz2DoQceFnFLT+7sazJg0H+hR4p4vFjmeIt+n3rwxRWAzuMg7izHrf+6huGv0MyGAsVIgQEJoOnFrkMtJQNycUl8KTbo9L6n5IKWZTzS5SUbyr2ucYAc0XE78mXtH0VbBXLTB/NM/z0EasorOFx2G6i0P+FmqVA2rr7iOou+sd06gN+AjaWeybJovJ013/XyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39840400004)(36756003)(2616005)(6512007)(2906002)(6916009)(8676002)(9686003)(26005)(1076003)(6506007)(186003)(4744005)(6486002)(956004)(4326008)(6666004)(15650500001)(16526019)(478600001)(5660300002)(52116002)(83380400001)(66556008)(66946007)(66476007)(316002)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?pKgolXqwh74GxwFRGlzO8/g/U0R9D0yxfpy0q4dTb55Fnfoxfc4j7iz7KGZk?=
 =?us-ascii?Q?e2xs7ruYmwIeJzTCNF43pHblyA3zeHUzlKX8f/EARehFARRjr2ASSnauP1jg?=
 =?us-ascii?Q?KLTy0VRzpcwvr71flT0JWQTxukr1m/pIR/mtQt2MnlYuXniKVR+rTDFCc6mF?=
 =?us-ascii?Q?MtPKzViMtsoliDvlI5hCrh+JjaXjmL+MGzAlPi+O1SnhzjbCCfiNN9wyAgPH?=
 =?us-ascii?Q?ZXIVn63WtEUCp9nOi0Z8Uivj3MgyykHI6St32psm0TFOQHV5XvHQjOr7tKQ+?=
 =?us-ascii?Q?Z5ix0gxl6yVAiFB+Ev6cciMW/RsZ5KI5ADGNojfhcy43kMwQ0m+hZ4BRuGpN?=
 =?us-ascii?Q?99+i/4LIl+7WT0K+u+wJTgrbrq9HEowXMw1WlAwtQOpPm6jEs5w6o0T8Ns1g?=
 =?us-ascii?Q?1RZWVgBRL0En3RyJ8B0WpY4Gu3CFGzYBwq6k51W4rJ8uVA0+5WH8N18yLdCe?=
 =?us-ascii?Q?DirBPTgeWSW1JVVOnAO1cODvnj10D+d4vpwVgrfAOxT5AAdYgJoJ+8xI5Eod?=
 =?us-ascii?Q?JtjwMXZZa+jw0WVHYsqORzgmwgj/IIZsZZ1GS4i8MUNOm9pgQtboX8uYUGr9?=
 =?us-ascii?Q?YXVbhKbxBGz6qScJOtsuWRzi6JWUwBIW3v6+HUxNNspKtMPOTzOSkS9hYAvT?=
 =?us-ascii?Q?1zO9KCiqyHbVk7oGGnZT3UrgaMVJF2Ab/sLGCLvTwJekCHuP9hLvpjds5n3U?=
 =?us-ascii?Q?KZPEAhCxOfYTFkQTYpSoZEhlRLOOapM3tfWREMrCo7V6yNgEJShamhifjOrx?=
 =?us-ascii?Q?OXq0iHAPYuDCaIFdCURMIcVOsgy4fpMnzOc/k5ODi0njMEFQtON2k8zWwJdc?=
 =?us-ascii?Q?O8b171QwAjvS+vaIeIwCFWqO+Ns0Vu9BI1j1sG5XrwxSysnZRmiX9JkkOzUl?=
 =?us-ascii?Q?33LcXNxtT47c2oJ25sZAbXAI6u2Pg9j9PXW9EbKrnIE/tiAoQ3EAsIpbdrvu?=
 =?us-ascii?Q?VGcDul3Qv2K0WquuY2aYxkFWZXZjECkko7C9+2/gZJM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b6a201-d36f-4d54-3645-08d8bb814387
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 07:18:33.5302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMv48M9rHK+yidL0WH4lJKswUNxRFZIlv5WcM0khnifNlV5+KjvTByZlkdgacAeY+5wTB9/bt35bS75pxZf2Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Andreas,

Thank you very much to help me to create pull request in xfce4-panel-profiles
git repo. But the original patch does not work with centos 7. I check
the poky.conf that centos 7 is still supported by poky. So I update the
patch to create/remove the directories and files one by one.

Regards,

Kai Kang (1):
  xfce4-panel-profiles: update remove-bashisms.patch for centos 7

 .../0001-Makefile.in.in-remove-bashisms.patch | 50 +++++++++++++------
 1 file changed, 35 insertions(+), 15 deletions(-)

-- 
2.17.1

