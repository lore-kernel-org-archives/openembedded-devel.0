Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.76])
 by mx.groups.io with SMTP id smtpd.web12.10166.1602833780131724158
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 00:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cZCfxQ+A;
 spf=pass (domain: windriver.com, ip: 40.107.93.76, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRlxR10p88TdqzTinnPcOSilzfj2x2km8pHKWnwv7lCyMIfoAhDa8Bq0fXwdWAMAWuzsqYel0Xgpwri6DAyt8qheK9RXbaQo7cpXAU7Qgf7oEhB3Lwb+MXja7pS4jnliFcDFo7gA8tJTNXup3pcUpzbDurNvDeuTdO3z30q+jBPXxuBpgwEXyCuppuRslJgoraFwbfuNkt7k67YhxRmZ8FoC3grgKjriEiBqnBc6yd+RiwEhjpJrQx5nzBUxsh9pNvC+rbk1pgHzGvsWmE7Y4x0aI5MKttMlweNIUJ2hcVCAlG0TkjLJ0sHLS2NuxSejOME1VY4xNsWatywOFGmNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3er1+dVq7C02xsbrPoQ4Kwd+f7a15GMetz892vnEWI=;
 b=Osq+pwupjwib9KPg/Uy/IH6EbODdWXx9JqpdugvlF5ua58O1SWv4nUfOHPYejfkmhXyBx778XCd9wGfs9OX+f4KurWZWeswlMzRF6OrYOHmxq2919UxjXrnrfpVPAfzS31NHRNrwuP4JWjsR1e82mW8BY7wzgpyUlTpTvo/4MUFovWdB+Nh50x+KhQBdAfuQf3FRS1mLl69kHJIr5v//C+O7XRxc37BrHurScQOaANnJP7wkdQn2bukgiknaBwYfE52tVzBjP6ltldERFOwDitZ5xik7X0uOern3f9TwGpf36pbBC4hC9J1ai+1hikBxxUdOyKUF33D8CL6hIT8adQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3er1+dVq7C02xsbrPoQ4Kwd+f7a15GMetz892vnEWI=;
 b=cZCfxQ+A5oXOFDSFVfiWscGXbpgMvnzGw2/i+iizK+mYYBTvJl1p7LXH0gjYcFp0iD7Lab80gjczZl2Km0YlgwyPJZfDz3DhQhqCHb10xP7j6EItsSpFlr0Of09EQbJvDUBeoWJ1AiDcGZ3OyFA1eIYpMcdHiK6PT3aMUrbImUw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Fri, 16 Oct
 2020 07:36:19 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3455.031; Fri, 16 Oct 2020
 07:36:19 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] cyrus-sasl: use /run instead of /var/run for systemd service file
Date: Fri, 16 Oct 2020 15:36:04 +0800
Message-Id: <20201016073604.36461-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0022.apcprd06.prod.outlook.com
 (2603:1096:202:2e::34) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR06CA0022.apcprd06.prod.outlook.com (2603:1096:202:2e::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Fri, 16 Oct 2020 07:36:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ec5366-5a6b-4b04-bde9-08d871a62bc2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4101D45E0F66405568847E30ED030@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SHjgazOouuCj41e7r+2P5kI3ftPnaawLJCv28gKwrch7CCHsFavmLKi+7LMWcPqSIzk2SHWrpUBsvs/32HvNRcajS1LWb23KxWiNfM+u38JElsbap0LxDy80TII6zdWnT8NRpaBnxnUWZNqYIJlj+P/YX5cPXUaMxMvaXCEV+2AUOZOm3/mkXrLEfllQwkt3W1kXj6ZYqB5fwDjwC+WWEBeo6AtfmMPpyXOK4nFkWnEZfUbl/87TYcB+Lh79SLubUuvXDNusOkIuP8UHzM/0n6HpmUzie3XBIxkORjz02kRHWHyKiZ3CCFSmnO/ew9xI+Ed6hRuZkFin67E6mkp6sslXLlCeWqdkqwnObRmb1K4RVdkfhEaq6bDir2LnJyL1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(366004)(136003)(376002)(34490700002)(83380400001)(6666004)(66946007)(66476007)(66556008)(2906002)(5660300002)(16526019)(4744005)(956004)(2616005)(478600001)(26005)(6512007)(52116002)(6486002)(1076003)(36756003)(6916009)(6506007)(316002)(186003)(86362001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	A/qoCmQuXZ+IvTEOCL/FwJH5b5PmFxgSFGGmquz05gUN7/BeaoIGVibOszM89eRhO1/pLSinFplc6YDxwtPvU4KICB7mGi8MbJgCittO2H3haIlqiXitt0dFpbcd/d1aMuwMoo17wPoJl9cVIIV5295/EUYQBbXv2ESjV3rak8Q8ySfieXnFP0TDc4pQJV29g4QFtVxHQyoZbTtyQ0Rvh7umaGZy5ucJ5ahNqBr1ow1gWinotpFj9/yoRLxieu5N/IEpf8ZY2qC4P4oDffDu2oG5lOPAaf8aZUv6LFJL3SU+sRy5cvXR6lFU10fq8dzd6gkwb4b5g2keNS3jvTwzPH6WyUfLzL6O+hIaTcDo0xVKMPIPxbv2Zaj+o0YTBjgM6y5IangNRwSeXpE+naE+CwFGW/7z5Erh4Faw+wnkohLXaytqhQGfRMV+2QiUp0CQAaUcjrpUqpLpEpajX8VH8gB2kESJGLz7y9LDRcrrEdlR3Oyfl3e0tXSb6EaWgTPkubf7VsvhiFDuZHOCkH6U8DRgnmENnZjFp01USF11CZKPL1h2tmIgTRLFZ2dNG21Tvrx2JvnxpBQGXXBBTyoo8EurHr7ikfmHEttTjSmPexqChIEGh6B6rxG/lrTtHPoaeWJnmUwJPbVpU0+Cps3wcw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ec5366-5a6b-4b04-bde9-08d871a62bc2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 07:36:18.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPY+VVUb64hpiKArYCXjhtUvPwNia3Ke/TCTn+yG4Mwm38n4zG4yvL2NyvMgsI6506S+q9kWZaXWGZ/+XD7F/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service
index 96dbae378..e63592af6 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service
@@ -4,7 +4,7 @@ After=syslog.target
 
 [Service]
 Type=forking
-PIDFile=@LOCALSTATEDIR@/run/saslauthd/saslauthd.pid
+PIDFile=/run/saslauthd/saslauthd.pid
 EnvironmentFile=@SYSCONFDIR@/default/saslauthd
 ExecStart=@SBINDIR@/saslauthd -m $SOCKETDIR -a $MECH $FLAGS
 
-- 
2.17.1

