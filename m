Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.48])
 by mx.groups.io with SMTP id smtpd.web12.886.1591131291456477935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=haK8t+Um;
 spf=pass (domain: outlook.com, ip: 40.92.91.48, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQeJv9N4FwOkqG5H7FFqPrBoiVcE2G5LzyLjslBaXn0t6Ov+XwG2t5DXTevMTfo5+UavljblqkK7UQVgW1OOJ4aKninf2ygdPocLK5oKpAS8eyP3/EEjV3T37X/DEmjSGH4CuRN9vPqJB+1jbUEdCKlWSeeEsNBaOGVV0Sk3cGIzJaN9fdlRoxEtSX/NOvf3dc7zjbRiRbEXRRzWAgaX/PinM+zwb45JyMOBcKoSWYz6w92fl34l6pOhblIg8DQlQDOsUCLIQmo4f432WLLcwy8+sropRaqGvFkWXrUwzGJmZEiP4Xgz9/ujxh2dTSuJcNnBTkTeZ7EDM7dXV23Z1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5DYvR/d+z7EvHkK44E5374Dm0iQzfBYVmOAQhX4pqI=;
 b=P7kubTZuh2RWR5SLZ1O85dhdoZkXhid5/NcFdJfbhhxVrIKeJnViY6jMJZz0a+05/gD7L65itT8bop+y4yvbLCKeoyRA3gcp3rS1PFQIKE5of2548c9Msd0bVJ9dQ47ztXhtTsTXkRZlMfUFWZFRmH3wtpVCfatz0bl/ucmTOeeGa+mlkq+sEb8nD0ejhpIL897VDQp2vf4fFL8J94wxc0gXAewsNnesLwgvvthmUz88y8wrnHC8r1yYWPBRdj4FvTOM3w5Y3L3eTORtZg8aRNW9CNFZyJIWLwj1Ol18P8e7SBKYMMOqXgG8TLMzCW8asaUVu+ERhzKzxfuOqBGvOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5DYvR/d+z7EvHkK44E5374Dm0iQzfBYVmOAQhX4pqI=;
 b=haK8t+UmdN5LeUxz9oJ3wASW1EdMOYee1xVfZGjTnTiIZvwoD9/sv8xK0AhNYlHFKvn5Ht49uDbonq/gJLSO7LJljl6LEd2jzyUP81Ry11v2jWZ8OWi2pxNXfJQ7wTGKwkf2Z1Eqa87Hf+dm+1MBA7H0Jpufzh381x13fFPwBaBhKUM8AhQFzwTUANy5JAq4Rayh/SJ0XYOd439dOxmwa5zKm87AtAK1Kbx58gMyMuZCX5eSPhNTBccD3SslGZQI/CWuYvlvBHK8/GQ8OXjxlZNcfSdeNicSgSQ3t7hLwE04PBSgtUxVQXj7wTkN3i/uC1OdtqRsB3OyeHEWCxmgKg==
Received: from AM6EUR05FT060.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::4c) by
 AM6EUR05HT233.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::308)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:54:49 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc11::45) by AM6EUR05FT060.mail.protection.outlook.com
 (2a01:111:e400:fc11::236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:54:49 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:0E8DB61B266D0EE0D2C71E581C113295EF623349D746D18453A374561D3FB143;UpperCasedChecksum:9E98FF2F9FD45DFCFC5CD5AB15A3D1C5E25B203374B27D39CB3F9D5E8B801344;SizeAsReceived:7467;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:54:49 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH] zile: properly append PACKAGECONFIG
Date: Tue,  2 Jun 2020 22:54:36 +0200
Message-ID: <AM7PR05MB68815C59B656945C3D8953B4A88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:203:69::23) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602205436.27888-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM5PR0202CA0013.eurprd02.prod.outlook.com (2603:10a6:203:69::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 20:54:49 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602205436.27888-1-kweihmann@outlook.com>
X-TMN: [j1jFsgQeQrbNu8UNqASLDEPgV52fSZto]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d6fa0c50-8d75-4a8c-a188-08d8073730aa
X-MS-Exchange-SLBlob-MailProps: 
	gjx25WM8ZNWDLNYE12708/BbGTepinvyy0SnWn5KcDbl2pI7p4DwuG1bwJ2xm2GKre7qLWFjFkXZLdFQgBEgLK+5iMZXpSpW918lsKqwlCWQk0w/2lsJ5QeILL8OqcTNFkXs0+CjGW6kwoNvT4HklMzMJv0338uWOxOZdYuSuFM8iel5bZjx+6X7arJc7rzWhYY9bZuPPC+qvmLSKgpWjZyX1/C5SwBqbNPS3J/0O2U4o6X/jVYO3uTcXENyF4x78cchyr+xNmCtbJlPPPZdjFYQmWe6vuQuHhINLPN6ROU4y/UrqyRO3ooyG78gSlYQT1KVvVDrVT8psNIRHask5bGmnWu4AtMlVwfn7jpMvQqPJQXjXgpDoXK4aNg+pmCPhG/M/ZCQ8iPH6if5Gj9CbiCh2wQcavssIExHFY0BZIwgDf4stfqE6UZqB3EK/r9oQyG8r6qotqlsFj/g8E6WUapbygyw3X8NWsEYfRZkistyh1xaTRhayKgSNKcjZJBTUYH5chQM/OB7KrW/viKmXuRKmaGbtAXE2vwjuMYKRLavmXnpW0ZXZpTBnnvNzzGWyJIDxlX8rNnxWjnVrv+URkUKFvvo/AiwnSiuz9Tm1rQcYl+zWR8e4KjBg4j3UFv5VUv9pXxk0MlzHhGA8QytGlXhNmr9iESxC2r3qJIMSb+nTy42PAD79Ry+Qw2lNbdA5ODdw/PSWUoOLaRgRzGjtqHjYZQcRVPwAYYgRBDpBT0=
X-MS-TrafficTypeDiagnostic: AM6EUR05HT233:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bcGct5qwj7ntY8njhLu+cDKgoUgVwIFPxYxjoap1St30W8uZFye4oOdIxzKLw5cimCa1cSQN9/OHy0eBhdsbReOhbBBN1Ghke7eoxbt5Qelr0REIrc/bRljsg187Qr2ZHRoFuR5y/nlb6pMn7B1UngWDqxCBXfqZmTakINKJB+21MW/zxCnDHbRxQ5XjlwH2eReW2xSOmrbLYHVORnh+8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	zetAOim52o3Zg72sl/Rgi0Pz8EFMC/jThuxrlOi9npxqK2XsHYnG2EudqOmlgPFoYGnDanXj5gRjJZ5ZROeLDREKNjIRvVj2guXfSMutmcOlUy6p2A1lMhAznjyuTMfNckw8fm97aekXRN48Sk0BPQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fa0c50-8d75-4a8c-a188-08d8073730aa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:54:49.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT233
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

As ??=3D assignment will be overwritten by +=3D in any case,
one can't define a default of PACKAGECONFIG in this recipe.
Using _append instead mitigates chances of accidental overwriting
the default

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-support/zile/zile_2.4.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.14.bb b/meta-oe/recipes-=
support/zile/zile_2.4.14.bb
index 3b846c151..acd491498 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.14.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.14.bb
@@ -20,6 +20,6 @@ do_install_append() {
 }
=20
 PACKAGECONFIG ??=3D ""
-PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
+PACKAGECONFIG_append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)=
}"
=20
 PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
--=20
2.20.1

