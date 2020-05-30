Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.54])
 by mx.groups.io with SMTP id smtpd.web11.3141.1590869554643483860
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=OUGF+J1D;
 spf=pass (domain: outlook.com, ip: 40.92.74.54, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY9xJmeiJrh7FNR9XjOaqNIKY4WqMX9t9wb32XemAFvYJiOgnhp118/JWoe6yV47dPp+fxr5UeMriSJBZOuem8hN9dJBSbl70CcdUbbvhKmADEIigi4D+iOCgcS16dvnKGf0OslWAUjEK+t/Nj3HnwsT0e49e+LtDemvbtyMtyEKsq3lG+qi1poJSfboVQBzIAJUC1kZ4cp2fnViOfH4ZR9k9p7OrMmKyhl7H+O2csmc+FLbar50WZuo5UmW5SPMhwOaLHF/SId/pJMze1xZyZtFbwabAEFs2kTiFgRZ++yjRt/q18pD7dc6w2Q3Tp69SzC1yXHYJhWqOyHzyC0scA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMD5R1V9uAaYhCHs21SYmY79Eg18O0b8wR3zoQcwvt0=;
 b=Nqqh9yAtp23cJIBIQkIRmLWcO+cl0LLDaxhLKZZZDWNKDHX4g5mNAxTkywhyPBZFMegkknV270aGKkA8zyV/93kOwzgdajkhUr2Vm3EWJp7RhyjL9bVPa1J2jbb1jiAIkv1/vi4loD8fvJUFG44sQOGrpALyispNKKc2ZDvzZ9xKq7WmyvW3zX+ui1ffKiia6LOjl7rCVdqXr/2Q3/TUVRplEYsrLqNKskV1IMO+WkeV/Qqkdms4S58jh22Q6cXOnrFYZC7XhBeN5K5Eybbe/93nc4fIAMR0eTxBJfsFU9lJckJffkFPEgau3UExFtwCfmUZKuIIOFOOtW9gtiCaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMD5R1V9uAaYhCHs21SYmY79Eg18O0b8wR3zoQcwvt0=;
 b=OUGF+J1DzuhkQGP1E+N96Z2Gz0HoyZlERRskODtjzZzhcHkzDYok5pj6roLqGAmA/FiiWUNO/wtI7g7/tDnZhurrHdYo5wgR6qVrSFAjRvlx02UhPBA8Uraw9fsnQZbB8k26q75q8yfMxe6vahvgH7s7OPAUKEstClsW+lx4ntBdFvt4CC9vcmAobEykUoIl98CmefXwZGBvyRCMM9pZK4UGkSEruxqPl19kP3HBkPUhjWqY4JfoKC8ecttE2Yh1MxanXLgqHcasHOH/nGEIDuUfRLhvramx2cBhjjfbt9qusH1lYH78UOi3lU+0PzoNYfEkQW8kYlcwrGGHRC2inQ==
Received: from VI1EUR04FT021.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4d) by
 VI1EUR04HT088.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::409)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:12:32 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::40) by VI1EUR04FT021.mail.protection.outlook.com
 (2a01:111:e400:7e0e::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:12:32 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C9453DE252556580AFEEA22C3B7EC75914E168DEBE20E0860FE548F81C527939;UpperCasedChecksum:CF7D1868BD255DE309E3783805865532FC52B881E8B6E4A6B83FF0E1AB312916;SizeAsReceived:7563;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:12:32 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 4/7] wxwidgets: fix typo for DESCRIPTION
Date: Sat, 30 May 2020 22:11:22 +0200
Message-ID: <AM7PR05MB68813FE8C4C1B161B6B3754DA88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530201125.9938-1-kweihmann@outlook.com>
References: <20200530201125.9938-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530201125.9938-4-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:12:32 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530201125.9938-4-kweihmann@outlook.com>
X-TMN: [SWR/64g8M/pyDwzZp7TAtMOJCEWlz0Ll]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 12f989f5-ac7e-4acf-40c1-08d804d5c937
X-MS-Exchange-SLBlob-MailProps: 
	pt8ZUcDWjMUoeItfEjYvJuEzewlwj/c+jUuM6Lvbc8Lr+WNcXRc2rRARSq5QPTk+EeP++TdRLO3F6Q7XlX22N+qJSL7G+N1hRBpZR61McEfdwyxedYZryayJEQLX0K0G0HV9JqCQomKt7FdbOWrk4htePY8Q1b+Ll06R8XdxoNFSPC8oc+Rqp96N+GZblkp+wVmCpPhZQ7csH6bBbIlS6uIcdaHVwYrSvJI68f2hegBn2TeZwNpPPg+K4vGtFJ0HPIAUghviB5ubYlaBMdl4ZI8aCWrnLy5PdJqbBxdUqTZQtyixsUEw4mfMCFZlSvzX1IY6kpSGR4KVU3YzUA7XL0u8Yyj44aPx4+yrDcsMOOWFNdCVJaFkgoNbbzAzLOpnAd+s7iBV+GoODO23L/pvisAJS5f/RS0Q2juHn/fxGISsC/tBRxX6CUNPIPK1xvobOtCdoR1R84wJ3dDQwmJodZ9LBtxFC/AQYFDWecKAtHm3us2mjWqxonHI+HB+u96cNMKGGwB8FtQew+DqR6nDViXOF+4zBsp9ug/EkraGe2/bAHHmFfto8G3lqw8xJUgZJX7mwGtPMNlS9hXMN25O0JweEpajpQ17JnB/LGB0izPExga5BMEblCYTpCaA4ZG7tsKkOzMgD7pOXiWEvAO0ixATC+3EF3+HAsiCy0KYn1mEfSaAnQwZX8gOwFOzuF7QzSChnRP328OOy+EUO3cNHB8K8BO3eS22NmkMg3C+I7kIkWUhIAeSMUpeD65waObotOOsilXWPhjJqb6bj3pdCe7WqAkXAIRVTR+deZXN++de/5Skc9NhJQYd/fdLYvtnBNIVuT2O0rN3swJXHXe5MQLw+vEAfft0Lic1PddCa4w9kfRU6jI/J4PuTWJaZ6D+oGWuQf0W5gDCBRqCEXQW+AUHq+TraDUgEuIGeuHTAtZU/ttmQjPEgY+0onO4evce
X-MS-TrafficTypeDiagnostic: VI1EUR04HT088:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YeuRVZN84SuYJm9CVYlwH7OoEJSrbpbi5WPaipjEkl28lj/pafDJG9TDG5ONIiKHlDKi0IWIpiVzH2wrVMFaqyPPz52/FkrAVozdWoXA47Ok48Pkv93okYabJyN0nddONX3hkpSpgR1FtEy4VegPrSlUaIVYQmAHtQi4FtO4Pq7MuGwCXy7fobWkhGqp6OInti4xzkXU+xUqahdOl/TKDUqLLIWFKyz4sOqyggchAdMwv7AaRZx4J2I2mt+39ynk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	jBcNqbwN4s9usmvStIZji39fdOGD5P6McmpZtp8Q4U8uMSweN1WXZ7Cxnlj76QAbdJvDVvrIOaZmaiIAm+/FAsnOlmQDyNqfvqA7LgTIbETS+bjAFNZp9GIYT442ZA85sqs2k8CAXEb8ZbJXhNOBcQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f989f5-ac7e-4acf-40c1-08d804d5c937
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:12:32.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT088
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/=
recipes-extended/wxwidgets/wxwidgets_git.bb
index 06337b79c..1d3c972da 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Cross-Plattform GUI Library"
-DESCRIPTIOM =3D "wxWidgets is a free and open source cross-platform C++ fr=
amework for writing advanced GUI applications using native controls."
+DESCRIPTION =3D "wxWidgets is a free and open source cross-platform C++ fr=
amework for writing advanced GUI applications using native controls."
 HOMEPAGE =3D "https://www.wxwidgets.org/"
 BUGTRACKER =3D "https://trac.wxwidgets.org/"
=20
--=20
2.20.1

