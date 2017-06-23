Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0071.outbound.protection.outlook.com [104.47.33.71])
	by mail.openembedded.org (Postfix) with ESMTP id A464D78230
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4RksRXDpBVdZ+XuqNhVpux/dYt70BD+lh8EVVFH/x88=;
	b=YG8zB28JJE5oFMBaLZL9oVxNMQaft85yaGObHInebjzxZjlgoocY98MTJaUWF3I5kSK1obkpk++6yXIHhxRmy2dmV6oHGYIj6Q9VY4gSiL7bzA02IOhMdbicMA1Uu1Rf4YR9/wpEgFhnFlHGqxL+8sUHbM/MlraXe6xG89xlyYM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:00 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:32 -0700
Message-Id: <c3fa6fd7cdcb84c1363ce6022d3a6502c632f889.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3efe635-c62e-4eeb-a86e-08d4ba8a0a2c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:mmtueWtTwc9ycBWnECohUc65heB/n4czIOMDiHZhv5CKy55OPF1S+6ZWSkGTNZ1/fFmeHS/KAGi8PN8E7MiMR2soQMjYaXZ/xyKouyhAHoHcfEqCHOUfxYDzdk2Gv8qFkmgkrzb9hMeFa9qme9DafvqmzJp0+EE5t/pSJ117o7HOAD0QgJehPV3TVJF1j34iN8IvRVjc095agngwmNUbxjydZcN3R21eoAbmZUHtA6CPeC+GqRrmiMZe2huWR3xviClNo8cFEH+YJ+YNkQe9MS3bMXhH/O8W+ZSz9PsrOHot2QDxGKTqP/rKh1QDAwyFot+BwVfNoPdQktyD2uWSvneZGr7ZXwxX2VMXQp9zv6rvDRsDEsFCn9AOQY27W10817tDNUhpvscL+GlV216+OOXniYiMGYPsdCaU4WKKg2kx95aKm1vWFDpURfP4OVhoutUhlHNHQFrrSFZcuSZ8QIa3MsLLUgfsNM25IgBKGTAF5VHyGp12K1816Kr6ihUcLvTRcXocv06lPW6aViJC+nNK+88sbpPyFztMf10fbHmDm86KIgKZif+fiwIc4KZEDEKI6u/g1Xva/LQ+NBmsKVFZi+GjpXuANPB7zg9VlpTfM0+iGaKTLu97r2FWFDkcVwFgh8QuIKrYNH1q1Lj1hjNRjOGK3nqME+8ifN4GAvjhog4ea6gKj3D1k5UtlnF8DMPvojwZMv2RIDpsMZPa32ArpnRGhJP7LAChtUeTYws=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:bzSXEpY/xomNR1uRtraBZPsVAwKuHGAT6OcsnKhfQDfyKCnGyUwtaOL+BEFoB442lgWSGcl71FnE1xDIbbCPDwcu13sGbzLcnIhSkZR/RBEMBl+HUPbe7BjSKbawIZ7vI7quzibb4/kVIoaDD3MIPyekIxtzWP2pldBIZmUkCfq2jfBuI7Gjpxf2d5JxGFNOejnkunxnJ/DMAc2Yfk847F/cShXM2E6d0YdmogTVf+NUSPuNVpiUASZ8rZPKl43+kdbrWh/HcIxB6QVLuYzNt7jdnHoW20yVFv29B7pqiAVmcz8NGi+zd3dDZN8UUzJaPE8dqZUhMp6mQxvpgvoZUEElYjBSXiq2JOy01XaY7eTCmwD0ZtfoJvogNOj3phd0Th1+9UUoA2CI9LV/SswVRfGLdl8cyPNumT8KsKsVDj5OYTfBvr8C/GNPp8Npsc3H0emEJ2HUkAwO3SPhZH0rHcQcIJ54ZTfNVYPvnDjCb2iN0AQUZ9LtiAK3PKKj6TfDxErUXkYhuxhnjd2DxIAxqc4F5i9kHyvVC9bK6WPCKHTeLbxOi9rRysR4BP2Y9mAg4C0ZXoj5lzytWEuDRsW1pIK5j/0ym9Z9uahEyENQkgx6sorDwosW336Vrm+dCHmxQIVsJRVJR+DPzi53bgzTmqotcu3CYP9U+scb7AM3ZOxJLSnhtZ4DIQPi+ETvlXRSxgl59/YQgEJeHLXhVbQlPVt72k4/ilFKmmCa5OzCCs2WCl0ACqn+2yPLk+g6PrypijPkJD0uWUG2jIqTKrnkh2jLBjTVnoqDnYGaCiwUNbViKdipQdEqcuWc2lc6YPcm46prq74YL96CDKRoayRX81FsXbd+Kh79EZ32i8aQl+U/Gm7+07UsyxyEnvqE9Z9JyHT1PIzaII1DUUr15K7tCgiaN+y+PLgpFu1xA8XTs1M=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:baLT7VCAQY0R8nLpaz9EsJPGBdzo7Euqe1KwdTpTdln1j4p8Ix4ATAgtelNaHmziJXhjJJJloR9ZtHrrM4OtdwTFQoF1G7dk4tQKekEGNBK5FQevVwr7OdGolqFZtsh8Pq67o4GteLHFnL92TyfEqnW7Ds6u8WsWWEmQpVY5sCg5A0bAeGEtUxPC3x3HJhlps/5gJ7OwUo+KdioVq2PhdYUJja9t5EQ1IjRoc6mLqgLny7K+Xy/6v+K4Gs8GLxJotCYahRJ3OLiwfT6tIKZ1o+DhDMrYKFdFmvQsGTuJVp3udIyzBguhXeBEg03726eL3jLotlE9giLlSc1GgAMPt3e0DgxfKc4vsaHM6JZR0bTIaW2gaYMm2Z0EIfcVJWZukFpwLC5uNs5bnKnhP+IB4xHKgYAx08pbFFz+/EzRE2OaTE1yw7q9dT2yuByvlmy0qi8L3FLDCJy0zYU8EiFLPl4UQlW5M6NyO0EAOJv2GwLAc57gfG7r85In6pNes7Kggm0AILdw3T4QOcsAQ2DhPhqlGjTfwVuiSN14h16OnmDmwl12Ian/XJdin7R9y48CJbI1dl3V1TrkMV0hihlGMS18xeVXmDOFvXMXK56xWz7hTtGAveb9E4zqNrc+3rBVVVfcHfZ1QXVArtyFHGnYLnaGKNDkma/OPn52zOExGuY=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:xfqz4b4osyVqzO5uNNAYWOSMR3ovO0Xxn6qcHUS+yJ2Lc0Zhl36wwx4d9nOQdrpn0X6/kCFQNRklih7H6Pme1xnw574hfHy0Io9IirxUtfPYWqX6YtQIgvbk66qZBAocv63m09a/n8iDyP3zlpXfTLx2Kkr/YjRJciCLMeTu4wIk0ssD8levWLhzBIUyyRSr9AAvV28jf/rHRa8Z3vlbhPfCaJxaxHGZBc5EXliB1TH0uqFrVuD+Or9z4d6wN5aQoFCVFavJXpT/tRT9hBe6n4AR8S+iIY0lhynmLxvQFoG47q7jNcvO6+m4LSpRzadOBTMXbfuDhxqHWmh6myybaQ==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29357FFBDC8188FF25E6D047ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(227479698468861)(166708455590820)(236129657087228)(148574349560750);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:x6+wjwGS/ZyL8cQrxSaCtAdtH2QcMH52hQAypB9U?=
	=?us-ascii?Q?l/m6BLADXN+Bs7zDhIs2EkjJco3FSmtmD3/dR4WgcIH3UqQQMvfozUFxHYSL?=
	=?us-ascii?Q?mtQX8lVJj8Bu/BIALO9spq91BXoD3ulgxRhaeNJIhChkeFua0J2VkWzsfb04?=
	=?us-ascii?Q?elaXRKpbDhmKuVB9vCm0gk5FJEf1LNLe0xZUI4Hb7HK3QHAWNxqnvozMMjLN?=
	=?us-ascii?Q?cSkobh2iWXGv6W942xXFSqxuVV7u4oXj8zsP6j3chxvTmSIY1iWNg6tji1ms?=
	=?us-ascii?Q?+uNPdl4vA5OCWcWH9PDEgO8t4y6h3ZzkpPoY+jmMpy440V602r82vx7rPWZ+?=
	=?us-ascii?Q?GlPLu+tB9i+hItW/s9/5TRhkJ1SbZXrcb9b/VSVwWjx4thUGlvGo8iygUat9?=
	=?us-ascii?Q?a631jpF0rY5nMwB2OapffFN0kPYWIw8l+xPyDWQQQAzR4tLi0f39JMrHcFEX?=
	=?us-ascii?Q?XfZuOli0oSEYxO8WJhJCNQoyZU5bqmBnlwZDTnuRJvlw7O0H+CYHAdEuju+g?=
	=?us-ascii?Q?McHIG2pcTcSsz9rFU+67FCCLhwrJ/mzBEZjslcS+haf7QnLrx/AB0fHEwIH4?=
	=?us-ascii?Q?FIeN8sVScY/FvclOfEQWLXQDu/u3kgVy3UDOPiMk9wpZ4UhfQ9flkqCXHeIg?=
	=?us-ascii?Q?W5jcAzc5ZCUSDfjF8Rw1LVhzn1FYVvgp7kgY/Kf8/dLg59J9q/FAK9EwuhKF?=
	=?us-ascii?Q?d8bIRM2OZUlnBIiaq9OZqxBNal6tkrODq83ElEytfROJtzfBNAoLyZY5sepB?=
	=?us-ascii?Q?C3NPH6bJWRQbN5oMFBpu5sW/0E2FK6i56Yl4dHzMYmJPeGjFL/wJHUY/OU5W?=
	=?us-ascii?Q?FWbNX5Bvm2PBz5SE9fAN8+wGfQCsGmvlW8h/NCsxzc6qGmAOOtalOLB9MJFk?=
	=?us-ascii?Q?YTDiXKQc0ZnitnW52Yh4d2mKR89fMZdBO0ZViHyad2DfbgMb4K6tNLBIzSqN?=
	=?us-ascii?Q?UE9UeAitaZ+/e0ES54SbkvNNGMCEHEP82G9uGJKoLhysstuTnjf1dfL2ReX9?=
	=?us-ascii?Q?Hy4e5Ki7FSUSRFrPUjMX25Lp/rzCr20wPn3F1Tw5lNvSAWO8aXHJ47PZBuPE?=
	=?us-ascii?Q?4c0+U+PPK27tk4pZZYi/B0TzTUAWb0KiyhzCAgGaVBbQgbomdST9xS9kM8Ne?=
	=?us-ascii?Q?ScCHR76UR7yPXRsxQNwsvzi7vo5ZMg0TJFpXnsFw4gczgKuV+YYNjWGifdD3?=
	=?us-ascii?Q?cZkBwCMg7af3+5jngpw540N9KOlhJNg+6V3iWognocIpIlFNsBRo18MJGFFo?=
	=?us-ascii?Q?G9Jr6qgmyrAK9a4NmcuHE09qigTQ1X5xRNkkkKhdmwJVqfkTE6G0Ee1/aS0W?=
	=?us-ascii?Q?rA=3D=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(966005)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6306002)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:7nioWJMTeEbn5PzPLza832L+QmKDYoV0GCBSeKJ?=
	=?us-ascii?Q?qYgVVxRmVLoG1WPm7bogy43dIM5ZlvijdbpL8fpfNkDS5M9SdyiqZ98uxYtV?=
	=?us-ascii?Q?YhDrABYfId2WkqtJlARm2162YVfDtST3krtBpY40m2WkP+qwar5i0b/Gj29y?=
	=?us-ascii?Q?cgqZAWefoDcDNQyOEwUhEAowrwc48xq4otI+zVJRDR+1Wu0VWG0Aph9uI/fU?=
	=?us-ascii?Q?Z8H1PyWsFGaBTX9NhwHdyFks+tvX1Esbcoo9tlVsVO7mcOtkCZJ0DlaviIoD?=
	=?us-ascii?Q?QRsemSMMPRr7im45PeaOdrhLZRiImihc4BEghj+K0Cv4tV3SiU50VwQYv54u?=
	=?us-ascii?Q?M4Hub77MT5vixsNBd52bFPM3iK12oZX41VR12FJA0HPXY4lk/BJvAy9CNc6Y?=
	=?us-ascii?Q?XvAoOxcVAYGt71XjLO4iv0qGKdLDi7AKu9K/sValhEq9BcM4MMB0uaWLxWme?=
	=?us-ascii?Q?vJrTQTy01Y13VjKRvO+nKgpSGlxyOW1POnavjanl8rr/ufLvRtUJc2G2nBnC?=
	=?us-ascii?Q?PFeEh9b7RlsyLBGuyd4ZGkIyV8kGmbF38UnAiInQ53a4x1IY4mWgqcPLW29g?=
	=?us-ascii?Q?97MqZk+bs9uU/UsY8cyWrBIOCCY9KeIJgWw9WDWdc4l8L+DQbso1MR7P4dCQ?=
	=?us-ascii?Q?qYnkrcq4rwipLVhgMhp4lcmSeMevLQhjI7jsu9RmLx/3QmXuTPgXI0xaODD0?=
	=?us-ascii?Q?lXZcQbySUaLXuXRhevQ4YRUINpFFOmKbsLsikM1JPeHRWW2HXGkc+DkAYfCf?=
	=?us-ascii?Q?ohqhpI5pbZJs1SfJIv/nt5lT3eyjQ4hCO00He8TTaa0SjIiBZoHg6O3rvo8T?=
	=?us-ascii?Q?9ipw63/Gb37hoe1zURuaHG/HWiIk8hBtsQ15EfIPZb74hOuEAY902vOGLoqB?=
	=?us-ascii?Q?Z5xYW0UA793RIjsDPIp23R30POGUDKWOCmAAIMMp0lQJ44YB5BGzUKQhsn2A?=
	=?us-ascii?Q?eMSksSKReT4Jzlc8lx1o6ljI4eHdyZ8XSvDQLL2yNUctaMnseZNkLfVUtZuo?=
	=?us-ascii?Q?ny8BSdWAUHiaU9K/oPNbsm97D+Pph0XyrA50mkXtEjNWhwoS7KBM4vRLB0+v?=
	=?us-ascii?Q?XInmZf3Xyhi+fNjjg96Vxdaa0e5KeTXTDu0LE6HbU+i6JUMosev7qEY3UuMl?=
	=?us-ascii?Q?J0FmR/kYTYuI=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:T+2Zw15BYyp/JVu1XPReGLTlyS6UAhMTmVEvHmyB?=
	=?us-ascii?Q?+LqrT1cMFcpifBKf7Yaxg6gnp7VkoaEYf4spRcr7pp9713jG0ykVeV4LF4sQ?=
	=?us-ascii?Q?xKKbDKhkPGAG2pyRZpVk+pNXxtGtuKWYSalSdI3ngU2go73pU2zyMH18cmgu?=
	=?us-ascii?Q?50Nmj91qV1csp+zti7C5qFzbcIUC+En9pUlR7zJ69CnDZJAn/HCSRMmKnFK8?=
	=?us-ascii?Q?gI3l3byBrsYp7uQ9FH4/miMEEQOp9KYG/koaAd4mfRnp9DB2IJ79rSVm8Srz?=
	=?us-ascii?Q?Di44SYC9UJ82AnhaXZXEARsaSwhDOGiHvaKtT5adB/e9kbHJ0URrlyLorsz6?=
	=?us-ascii?Q?gs/9sCxiElmkvRFkrh2itbNfvnQUP2DtsqZrtOaoLW39TursUmH97XI6HFCx?=
	=?us-ascii?Q?Q3RYKKv3tiM+A7pViSxMeag0OwLeLD9L5OFkG/GvkYXm/G+I5/hiVWrYx5ne?=
	=?us-ascii?Q?uDnWAwSMl5LN2WZIXicZKNVUtU6EInCVyAkP8wfcb8IedLp36xbOdHvteU8w?=
	=?us-ascii?Q?0SjVDcq6DJ79eZumpRVNrlC3qEE5tsiOF9rzxMnr9oHY22UYCqtQXzebZ2g3?=
	=?us-ascii?Q?nR4zCfb1oa9C3p7u3rtau+8Fidd+7+72/tf67ApJiGUnM9f1eX3/iMhcjNHt?=
	=?us-ascii?Q?T/tefAXHTbN1KyTs/l9UIOW7Aw0q+i/sTYpI7YfvCemOtGatK9wedVRuvVvm?=
	=?us-ascii?Q?0g9nkeqrtqwmSvvh7qNsvvFtysCQttGshV/ixBdLL6wI1DJfdPRYqlI2VzQG?=
	=?us-ascii?Q?43UAqSNelxhs1/Svc21yILZPIDRihCXiv7mCe9L63p1CSWWaKDckbnucr9aK?=
	=?us-ascii?Q?R4it16ByE0oxNQbXJV3t9MDUtazvha9q9735kkhge9dnYWUUd3xrDQku0h+n?=
	=?us-ascii?Q?WTA806dyCvMDNTIri8R3jWTaDyefh1ICY78of7OVyoK77RNZvNqLrqrkj38A?=
	=?us-ascii?Q?x+IKBTIHtGB1KfLS88pyoVgvJYt+MqiTi4VRicHOmyX4McP25evzB7NTEK8K?=
	=?us-ascii?Q?mcA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:5X0cKTw9sl8ZkEOSBsYkfoMlMnZaaaKpA3IbYJi1vfCRPpZCqEZdQKtnJdpGEfXkvwVUzol/sGheqMpmLeHKYBQXngnDgCqjy37kb4GaedvQ2Ow8yCGvtCdB6vNrOFax4XXoKUECUnh2Ymvdf2p4d5pa32E0118sR11Aiyu25RFOQRbinMg59meeroyKbg3a7XI6aIL0Sd4d0B5YSgv94ExAIQptmEAYzXpOkNCUCeX0fPgIWqcx/LXTBf7tsAdfYjIo5wVp6pP4XWivXcQAI7/OTL7CcuRmV5F5WYhwQYqioyFDmMtpwc5aRapl2lVR+zArrcoL6uR6gyDyxYaOcQ6o0W31BRfzGAXR8OPmaoYf/yR2Mytmu/+mMNSM9wXVdVGgKlslWhWCodL+L9IKfLnE1Z83CyndLRqTknwYTjdDKCP0oqDQ11x8CfXJiQnrHcs3Sl/I0G3UVgvgVz0ZrIMBrI5BvluLOF+X7+s6ra9g2Ig28uIidlja+YCwb+Hu;
	24:0IZhFKV/LwIaUVZovDqV7fbnqYs52GS7SaUFmH3OG/NuG7bfpAe14rb4WCDC9NkVZj/d65sxoHWSf3k5OZBIFuVV2sD7vSs6kMzQ2MQKEwE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:5GvvPX6aCDvBf62YEk9wr2ZTULQgSd2rY9cw1lagNT6o0eQc0zmHIqhE+TkV7fn7Cx6FgsqyIUoQCzv8SfLAxGL+9Aoa8qyuJvVvzlxnBezDATtT7H2Ch78nOSU4QGKrKnQuim8xMjPMQBV3Aqa6qtnR92x73uAxm+YtTqSLHP9jm+Ch7x8rvP2wKbmuz6na00GQ2tqrOtyhPk7FyW7Hkam1J9uzCjQqAoOG86R79M5GfdMsKt6bD3djnNh3eKHJA4cwGqkyF1qKfiClBAM7TyyVRzZYmYmf8/xAcY5ZVfEUmnPFmIQm/OUfiJYflWtiwjxnZ9LBrnwJqVb+CUnjIawxc/uJU8ztJFvmCCFJbbz4akh/gMK0IwXyzQHFbH2TxKt23UlnjZFp3kmp3zNqKnMg1P3M3a9WyATPgISnG0r/7dWNx3li3u6m4ITPbGR0h0MIBjE6Sdcd1ZssAgc1c2PUG+NJVw1jz4KqBwgCem2uHFnYeR2L56VyVd+sCAwKHA1d/IOaXnUVd4LVSqfotccjT0yakjiZS1z3je+hpFYidLIBxDMz/agEF78k75IGRu62yXk5R0UHdEfnapzQQnhm5Sc8oLgIvymiixsiFZ2LLvaFcxV/BdlbfdL0ApC0O1/aS/6gs6WOCU2ceg113WQObO563W21pw96MjTljUlhadalbPHWCSkNfLqbpTVFbkdBvl4lZrDfNfyyxyL2mOb/Kw+F8NqXaqEfBVsPrpAjFPohLFBF1+Nfup22+nql3DTmuwR1dAhvof5dVpH+iPnYkkryweaUFw+TLPbCCzc=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:00.3213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 01/17] add open-vm-tools recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jun 2017 23:22:44 -0000
Content-Type: text/plain

This recipe is modified from the recipe originally found in the Open-Switch
repository:

https://github.com/open-switch/ops-build
yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9

Although the original recipe packaging was Apache-licensed, I received
permission from the author (Diego Dompe) to relicense it under the MIT license
for inclusion in meta-openembedded:

https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../recipes-support/open-vm-tools/files/tools.conf |  2 +
 .../open-vm-tools/files/vmtoolsd.service           | 11 ++++
 .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35 ++++++++++
 .../open-vm-tools/open-vm-tools_10.0.5.bb          | 75 ++++++++++++++++++++++
 4 files changed, 123 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/files/tools.conf
 create mode 100644 meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb

diff --git a/meta-oe/recipes-support/open-vm-tools/files/tools.conf b/meta-oe/recipes-support/open-vm-tools/files/tools.conf
new file mode 100644
index 000000000..f6cae70cc
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/files/tools.conf
@@ -0,0 +1,2 @@
+[guestinfo]
+disable-perf-mon=1
diff --git a/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service b/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
new file mode 100644
index 000000000..d30e38055
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Open Virtual Machine Tools (VMware Tools)
+ConditionVirtualization=vmware
+
+[Service]
+ExecStart=/usr/bin/vmtoolsd
+Restart=on-failure
+KillSignal=SIGKILL
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
new file mode 100644
index 000000000..63ea45324
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
@@ -0,0 +1,35 @@
+From 5d8814f4b4f016a633984822a6dfbc9426fef333 Mon Sep 17 00:00:00 2001
+From: Diego Dompe <dompe@hpe.com>
+Date: Thu, 7 Jan 2016 15:06:16 -0600
+Subject: [PATCH] Fix-kernel-detection
+
+Signed-off-by: Diego Dompe <dompe@hpe.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 04e3bac..1ab3f29 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -151,7 +151,7 @@ if test "$with_kernel_modules" = "yes"; then
+          if test ! -d "$LINUXDIR/kernel/"; then
+              AC_MSG_ERROR([$LINUXDIR/kernel does not exist])
+          fi
+-         LINUXINCLUDE="$LINUXDIR/build/include"
++         LINUXINCLUDE="$LINUXDIR/include"
+          if test ! -d "$LINUXINCLUDE"; then
+             AC_MSG_ERROR([Can't find include dir under $LINUXDIR])
+          fi
+@@ -1034,7 +1034,7 @@ MODULES_DIR=""
+ buildHgfsmounter=no
+ 
+ if test "$os" = "linux"; then
+-   MODULES_DIR="$LINUXDIR/kernel/"
++   MODULES_DIR="/lib/modules/$KERNEL_RELEASE"
+ 
+    CPPFLAGS="$CPPFLAGS -D_FILE_OFFSET_BITS=64"
+    CPPFLAGS="$CPPFLAGS -D_LARGEFILE64_SOURCE"
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
new file mode 100644
index 000000000..4dee03a23
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
@@ -0,0 +1,75 @@
+# This recipe is modified from the recipe originally found in the Open-Switch
+# repository:
+#
+# https://github.com/open-switch/ops-build
+# yocto/openswitch/meta-foss-openswitch/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
+# Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
+#
+# The recipe packaging has been relicensed under the MIT license for inclusion
+# in meta-openembedded by agreement of the author (Diego Dompe).
+#
+
+DECRIPTION = "open-vm-tools"
+SECTION = "vmware-tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5804fe91d3294da4ac47c02b454bbc8a"
+
+PR = "r5"
+
+SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
+           file://tools.conf \
+           file://vmtoolsd.service \
+           file://0001-Fix-kernel-detection.patch \
+           "
+
+SRCREV = "538ea037a1549b6fd4e57529f7448a3fd2aa47af"
+
+S = "${WORKDIR}/git/open-vm-tools"
+
+DEPENDS = "virtual/kernel glib-2.0 util-linux libdnet procps libmspack"
+RDEPENDS_${PN} = "util-linux libdnet kernel-module-vmhgfs"
+
+inherit module-base kernel-module-split autotools systemd
+
+# from module.bbclass...
+addtask make_scripts after do_patch before do_compile
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+do_make_scripts[depends] = "virtual/kernel:do_shared_workdir"
+# add all splitted modules to PN RDEPENDS, PN can be empty now
+KERNEL_MODULES_META_PACKAGE = "${PN}"
+
+SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
+
+EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs --disable-tests \
+		--without-gtk2 --without-gtkmm --without-xerces --without-pam \
+                --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg \
+		--with-linuxdir=${STAGING_KERNEL_DIR} --with-kernel-release=${KERNEL_VERSION} --without-root-privileges"
+
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'x11', '', '--without-x', d)}"
+
+EXTRA_OEMAKE = "KERNEL_RELEASE=${KERNEL_VERSION}"
+
+
+CFLAGS += '-Wno-error=deprecated-declarations'
+
+FILES_${PN} += "/usr/lib/open-vm-tools/plugins/vmsvc/lib*.so \
+		/usr/lib/open-vm-tools/plugins/common/lib*.so \
+    ${sysconfdir}/vmware-tools/tools.conf"
+FILES_${PN}-locale += "/usr/share/open-vm-tools/messages"
+FILES_${PN}-dev += "/usr/lib/open-vm-tools/plugins/common/lib*.la"
+FILES_${PN}-dbg += "/usr/lib/open-vm-tools/plugins/common/.debug \
+		    /usr/lib/open-vm-tools/plugins/vmsvc/.debug"
+
+CONFFILES_${PN} += "${sysconfdir}/vmware-tools/tools.conf"
+
+do_install_append() {
+    ln -sf /usr/sbin/mount.vmhgfs ${D}/sbin/mount.vmhgfs
+    install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}/vmware-tools
+    install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/tools.conf ${D}${sysconfdir}/vmware-tools/tools.conf
+}
+
+do_configure_prepend() {
+    export CUSTOM_PROCPS_NAME=procps
+    export CUSTOM_PROCPS_LIBS=-L${STAGING_LIBDIR}/libprocps.so
+}
-- 
2.11.0


