Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 18136 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 26 Jan 2019 00:08:44 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10059.outbound.protection.outlook.com [40.107.1.59])
	by mail.openembedded.org (Postfix) with ESMTP id BA5E67C364
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2019 00:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8PmnZKP6/1mVhmFfCGhgLBirEu1QP9fKd8XkxmPVuvM=;
	b=d5uC2Q7Ko8vie4sPYDErcWNpGhjkSYN/Dpor8CQw1c2yUGF3JlR9cdkkeobltbn8azy+Y9F0WyrS6mXf99sz0zRmT30Ff0tvldgeNFeAScAeqWLM4w1GzLqVwE18hsV8vS7vJKnocqc6oExrwI6GaeD+VVWmPaqfVohTpx38gOY=
Received: from HE1PR0401CA0046.eurprd04.prod.outlook.com (2603:10a6:3:19::14)
	by AM6PR04MB4264.eurprd04.prod.outlook.com (2603:10a6:209:4f::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.17;
	Fri, 25 Jan 2019 14:35:13 +0000
Received: from HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::208) by HE1PR0401CA0046.outlook.office365.com
	(2603:10a6:3:19::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.17 via
	Frontend Transport; Fri, 25 Jan 2019 14:35:13 +0000
Authentication-Results: spf=pass (sender IP is 52.236.92.113)
	smtp.mailfrom=topicproducts.com; lists.openembedded.org;
	dkim=pass (signature
	was verified) header.d=topicbv.onmicrosoft.com; lists.openembedded.org; 
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.236.92.113 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.236.92.113;
	helo=eu2-emailsignatures-cloud.codetwo.com;
Received: from eu2-emailsignatures-cloud.codetwo.com (52.236.92.113) by
	HE1EUR01FT015.mail.protection.outlook.com (10.152.0.154) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.11 via Frontend Transport; Fri, 25 Jan 2019 14:35:12 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (104.47.9.53) by
	eu2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
	(TLS12) via SMTP; Fri, 25 Jan 2019 14:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8PmnZKP6/1mVhmFfCGhgLBirEu1QP9fKd8XkxmPVuvM=;
	b=d5uC2Q7Ko8vie4sPYDErcWNpGhjkSYN/Dpor8CQw1c2yUGF3JlR9cdkkeobltbn8azy+Y9F0WyrS6mXf99sz0zRmT30Ff0tvldgeNFeAScAeqWLM4w1GzLqVwE18hsV8vS7vJKnocqc6oExrwI6GaeD+VVWmPaqfVohTpx38gOY=
Received: from AM0PR04MB5348.eurprd04.prod.outlook.com (20.178.112.145) by
	AM0PR04MB5234.eurprd04.prod.outlook.com (20.177.42.27) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.21; Fri, 25 Jan 2019 14:35:06 +0000
Received: from AM0PR04MB5348.eurprd04.prod.outlook.com
	([fe80::1c68:e546:f90f:bc05]) by
	AM0PR04MB5348.eurprd04.prod.outlook.com
	([fe80::1c68:e546:f90f:bc05%3]) with mapi id 15.20.1558.021;
	Fri, 25 Jan 2019 14:35:06 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Stefan Agner <stefan@agner.ch>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Python3 bytecode is stale
Thread-Index: AQHUtLRsqSN+w0VRpkSjzihaJ0lY36XADOqA
Date: Fri, 25 Jan 2019 14:35:06 +0000
Message-ID: <c0e76ec3-4cc9-38cc-bdac-eadd69eab14a@topic.nl>
References: <4f3f8463750770c686b010b7270351b2@agner.ch>
In-Reply-To: <4f3f8463750770c686b010b7270351b2@agner.ch>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
x-clientproxiedby: AM5P194CA0017.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:203:8f::27) To AM0PR04MB5348.eurprd04.prod.outlook.com
	(2603:10a6:208:111::17)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-Microsoft-Exchange-Diagnostics-untrusted: 1; AM0PR04MB5234;
	6:K/3RyhwYuC65HwfbY1/XI40eEm3RJhhyJgS98c7Yma/2lUs9hvTHmT4+kWmSnnU/5ddh+CGMk/df4tvK5LtaxGfMz2moHg41fmm3R0PQp48uzJyijl26AbrD2qTRJ74yl2Q6+jB8e31M4o/2Q1eocHulEyPVfHR5+ycOHy7Zl/sc2sLP06IjuK5IxOI6SkmCrefPA/C4OaRahLDkNj4l+13WO5vuV+jFpOPoIUyFJ6uNCwl5xuQVGq2eGiw3BEbMDSTTzgQR5K7j/DtLFdHLnV8MquO4j94LjyIkwIwxGWTfTponht5WoKmBuf4/RNjhoRaM1+7eYQo+fclui/6BgQHjXqrW6NvTGUAiT5sslRAYAoIMP85Yl2Ao16DT2b+b0n16nwMkw4jDrmmf7s4j3S/rA/LcBC69+GbjWxkB9yCUsD03Wxv5PmEthL88h3QzSVeG9Oq6PCC+y8QYIh7DyA==;
	5:gaz/88wB1bHzQ91U3WmPLZuYRXh2TfsH+s5lLsL+UC5LumSbcU2ItwYEId/yOXxhq3+Jn7kEGyo91OfOYLpz4b+QqhyECOaajv0qFeDGxJ8kpBghBKjlDDICeGAjqbpNmwFuLunAgW6vaRwadjEMVCYCTGuKtUIE878BUf3b/PiBNrclwS/gwdBwSxtejjEAG8qTU0gEZLzplyE6dsvn+A==;
	7:hi7RiTiI90ukb9T1Ii8l0Klmhw+H8iTUkeJ7YJSXC05k0PZr/koazMJBOU6gYcJJOzN6acr2SLOQJLhK/Q7FNdf8RV3mJJgBV6cIwgpNOcyNuYA8BgoERzgncmJuCNcTXpmxy0tJKG2KUUspR0Ugcg==
X-MS-Office365-Filtering-Correlation-Id: 85f5ebeb-bfe2-44c9-7f66-08d682d2506d
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR04MB5234; 
X-MS-TrafficTypeDiagnostic: AM0PR04MB5234:|AM6PR04MB4264:
X-Microsoft-Antispam-PRVS: <AM6PR04MB4264E2931F1ED1CC84BDE771969B0@AM6PR04MB4264.eurprd04.prod.outlook.com>
x-forefront-prvs: 0928072091
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(39840400004)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(74482002)(6512007)(6246003)(2906002)(53936002)(316002)(6486002)(229853002)(110136005)(44832011)(58126008)(6436002)(25786009)(36756003)(97736004)(14444005)(256004)(71190400001)(64126003)(71200400001)(99286004)(106356001)(26005)(102836004)(386003)(105586002)(6116002)(31686004)(6506007)(7736002)(53546011)(2501003)(508600001)(2616005)(42882007)(14454004)(186003)(68736007)(8936002)(81166006)(8676002)(81156014)(76176011)(52116002)(65956001)(65806001)(66066001)(65826007)(305945005)(486006)(31696002)(11346002)(446003)(476003)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5234;
	H:AM0PR04MB5348.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: Jyu4272wniPJiueQd9wKLYU9ASDkSR7gBd4EmE8KhlWRlIrngWxaSOx6d4bcd+O4qZnIlRrlKlNt7qbfgqztXXPcPE7gIYiMRaV6j9aq0yFvJMCUiYDA6Kfyk/L1BB5CD0enonNVqoqw0N/dXOY11BEfQ2RJ0UJztcYU1iHcK3eHR3jGQralML94KOU3HlqJ+wPcr7pYTM5FAT4xd+eFCPv7BKRAVq5KxYhVbM3rs0Bz1I3qBX+7HfHfCp3WzONsn2xUNvg9ZNqO+aVc8GdTpE6o4yRLU4jQPMA9Yn4catj/V07jfef+rtX9h0mN08rKo25V8RnQsmAXqlfnvoS3sfloT6epF0IgrKGhsCHxioh7V5FAoz8SjeLj/bPrF7cAz9gkBC3yBz2XnnOclXs8k508S/u26qqtYZOknyqoedE=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5234
X-CodeTwo-MessageID: 20190125143508.bc896b5b-dcbc-484b-a655-1a7214ca06bf@eu2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.236.92.113; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39840400004)(396003)(346002)(376002)(2980300002)(189003)(199004)(2906002)(386003)(486006)(74482002)(6512007)(65806001)(65956001)(66066001)(47776003)(6486002)(44832011)(2501003)(26005)(102836004)(8936002)(186003)(53546011)(336012)(6506007)(6246003)(246002)(436003)(8676002)(14444005)(42882007)(2616005)(126002)(476003)(229853002)(11346002)(50466002)(446003)(65826007)(99286004)(23676004)(2486003)(31686004)(31696002)(76176011)(25786009)(14454004)(110136005)(508600001)(58126008)(356004)(316002)(7636002)(36756003)(6116002)(7736002)(3846002)(64126003)(106002)(305945005)(106466001)(7596002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4264;
	H:eu2-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass; LANG:en;
	PTR:eu2-emailsignatures-cloud.codetwo.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; HE1EUR01FT015;
	1:qVKkO1f7LMC02jNCjZIxuot5Mgjl8qsifYMn4sOBYc6cSWuzzrCs3UV1JPhmAin2j95ylqFoMaMpZC7pSemz4wwWQc+SsM0ghTslwv1z5YV1oen8J/UURQI7tdnac9Riq+/hTcfVtm4hbd3/dGzLZ48uzSQk4cpYDHXHUGWDbNo=
X-MS-Office365-Filtering-Correlation-Id-Prvs: ce8d1e54-f01c-4b71-8bdc-08d682d24c87
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(710020)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR04MB4264; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR04MB4264;
	3:92XMcdTWPnSDjmSpRCEhSWVd0aXQfE46JkkJWaFzCmKi/C5HyjjlSDXPHmMWQhru86Cg19OsFoZe0NAO+gzVqDTPvadX54VxIwO9/4i/FvOopuAWmBuatDU+7fTTwrDhFkTjDl4TLSV9Zx7Qadq4erGQVjropRzCIH0gD77WY2Q2JFgPSR5L5e+sc9Ut1arYONOjBQnBf/Jd8o+ichBLnsOKlCrsZNsk+HTsDINBhz1OowmorC1R5dFtCqNsLHi91hBY8vAyhTpyHTZgUTKzFUfoSI3C9XSxbeN+91Q1FFAjK+Lss6A4DxcTNP96P+E72SifxaXcCvf6c4tg5wCfTYUrWkXq+Q1yu3vgR/P/lOSAUU5oWND5IsafN5lCvWPY;
	25:S5p5Hq/ZuUy0PCT3wdwF2JgmOaCGBp0+yyyfeXAecYMKXkprq3ndseoyFSgMy7iw4O1Ihcjbxu+qXtTgwYzGK69lJuER310gUZRdj9mKyXK0lvIuPid036QSPDNKaWsQq6XuJYzN/CMuwFUKZU4u01bocKJ2XBIZd3q08df+PUzrGIUSVOLhIjDtnZ/Ba6J4eIptk7Sj/hQKoKUIBOhl+iMXe6fl/CbtHWAgNIfKkuBvqKsGvT7ywffEynK4rgWcQ1R+qkqfz0hVGbdv2gc/OanNtQuqbHAbtw50VWRgmlgwjm+I9JDARf1PdkvUh03FrlMd59QFyBoPx5HMgK+rlw==
X-Microsoft-Exchange-Diagnostics: 1; AM6PR04MB4264;
	31:WgzIe207EejhScvrXxB0TOY+601iMY6H19Hw4P/CmYlbH4DHeXMAPFSXu+CKueo2ChDDHaCB2f/78/INiz33P0+fABUEz8pP67i+i7usNTHQCf2oxRZgtaiOu6QwRgcYOOuKSGcwzWcPq4XuKYHS+8fWBIxsU7zV5dTiG9TU+2tTY2iEehWi+ICvs+g/nx308OQlG5d1CgRiDtpPEEixpcasW8RelXNBfdj2okh0hv4=;
	20:VmOq3ILG4B3KKAYYSrNN0pTipMotV8C5FBujhmDJP7CQIy//j2ZTwKrhridG5Q1c/o3nXziGazkK6yWHCHzooc6ahWHD5Z/WcRChAEA/YYTfndT9jzM2DN1wYxU11rtAihyEXkHDDqWuQNYk2GIGD9bY4wncqhu3/6AAAiKS19Q=;
	4:K4v8HnNFN/sGthHbf7JU8cHWqtizVGaUOFy9cM0ldSCZEi2xBmeOfV556FmNqW/xDIVZUYj2+56R9EKvzjnbS9HOyl7Y97aT4zDE3a2yD0fmwJGoBscfElK5sFEXx2z8s3Cb2ZE9crbnRT2drSOeqBx3nkEAaoRy5hEANslWmfd+zt5heh04PSsNmE9d9LJEJP5MKNZPT301JWCKjOAkJG/fbufCE3VlhBkuUxlbAGt8QpBmaHBVQzbxYWRe4uLgWVca1T3eB0asQGKgKBwUzAPSBYUPBG79pxlh5i2Oicf0y6AAlGBpVkhBOE9gTNjA
X-Forefront-PRVS: 0928072091
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTZQUjA0TUI0MjY0OzIzOkxSSllwbHVBTlY2OE85Sy9nUkc4ais1LzRl?=
	=?utf-8?B?cWZFb3lNVE1iSTNsV0I0alNtYVpLZzYvUmJVblhvMDVSdjdUOVVLZVJnMU5o?=
	=?utf-8?B?T2FsQnN1ZHIzNTlnMTF3RGNqeDdIUCsxUndLTVRYLzF0WVJCdndtdStFQlZ6?=
	=?utf-8?B?a2t0VVl3dk1ERjNqcnJYS1NmUjdBMFp2RDZYeHVMTXVKNWQrZ0xLbUtYczl0?=
	=?utf-8?B?MkkzcTJZSzUvNEYwdUltdnRReGVZVVMvNWFnM3pFdjNQay8xL1Jvcm1EMnls?=
	=?utf-8?B?bW84R3U0cmY2V3ZjVFR0L0dHVTIzdnpmNVl1WURKVHMrRU1iZ3JOOXF3RTQv?=
	=?utf-8?B?YUh1bEh3ckF6SW1LVWhaZUZRNVc5eFdSdC9Ua2NBLzhPUTdtNGEzVnUxbGJ2?=
	=?utf-8?B?OThTL1RDdStXZVk4YzhSdDA2ZEN2Q25NbDhtcVUrL3FzbEp3TFl5WXlwekhx?=
	=?utf-8?B?dWlvWDJKcllib1IrVkJHdTdaTWV5TC9RcjN1cFdwNzJqQUNWZXltMU12aFE0?=
	=?utf-8?B?VWNMRTByVHZLeXR0QVlNOXZjalVObFVWVGg3UjRRTUZYeDJEKzViYkQzQVBi?=
	=?utf-8?B?RFcwc21HY0p5VCtTdVkvbkU0bUxIWGhGR1JVRTkwUWlmMDNvMzRxbG5SUmNx?=
	=?utf-8?B?R3Q4Mm5EWEp5TlFZdWtZUTZ3ZWtEYWJwbEJiaUtYK0w0a3RCLzdQMTNTWG5h?=
	=?utf-8?B?dTZsQWVXYnVtQVYxVGVJQnFybXlrRG5HcDd6R25RNkdXZEFmeEZ0RUpDTFFR?=
	=?utf-8?B?VmMvd1NMd0JvWEZYWU5LZ05ucW9ZTzFtaGlBMldzSUYwSnZSQ2swY3BFUGts?=
	=?utf-8?B?KzI1QTRTbE5qSWM5U3JaVjJYS1FWcS8xLy8yNFNMb3NNcWl0cXpnSHp2SHY2?=
	=?utf-8?B?WVJUQ1I4Z1Vxb0dQcFUzSkh3ejZmeUNvckw0NUhXdFo3d2RQd3hkclBjRjlC?=
	=?utf-8?B?VFVPQWVsZkgwTU9DZTJCNldWNmQxMWFDb3d0MlMzTzUvU25zKzI3WWl2aTV1?=
	=?utf-8?B?bFdRVmlqMis2elNObk0vdWZlQSt4Uk9keEQzRUY3dFNzRHZ3S01iK25hVmI4?=
	=?utf-8?B?UFB0ZVdFVkpQd3ZvWVFOdE1PTWRPQ3NnSGxDUGFmVE5LUXNFeTBDK0N1STQ5?=
	=?utf-8?B?UHNRaS9jVjVCb3A5L0c0Y2FTNXZSaDhQcEpnUzRic0VqY2FxL016WGpyRkRH?=
	=?utf-8?B?MzQzTlBwZVdSRU1SRHNROUZoWUhWL2VUcmZLME5uaGtlZVdxTWp2NWE4TWhW?=
	=?utf-8?B?cFRjbmZ1SURWQ3c1d0l4S2JVWlBCVnhDaVdsdkhjNjd6Q2dFMVB5THRmd3FN?=
	=?utf-8?B?NDNxQWtYc0R0UHdXeDhvcFlWT245Y3hiOTlVMXZlc3pKbDNOUmFZOFlkL09W?=
	=?utf-8?B?MThROWZmVDl5U21qay8yREgxUmJpaUFsSmdwa3U5bk5vRHlDY3lxbjZnVmRr?=
	=?utf-8?B?dGl0RnF2blB4cGdmK3lIVEpYQzZDMmdGU3p2eXoybmZWS1lhZEpacmswWXd5?=
	=?utf-8?B?eHpoNXRleURJRXc4WkEwUmFaY24vTzFhVlJPUkdUNEplMUZOcG10Uk51Wngz?=
	=?utf-8?B?N3lRdUF5Ukg2MmhpcnVWSVcxcmxzUmpXcmcvWURsUnJwcU9PS2txb0playtx?=
	=?utf-8?B?a3RkYXpoMEZtNXNGcEZWTDYzY3VDczhManE3cHNZU1NhM3l1MUUwaUZWaGpK?=
	=?utf-8?B?czNGZi8rQWtDbTZkbGhwbWRyM3N0b3dkSzBzUmR3U2lvdU03MzhQOHhmamNx?=
	=?utf-8?B?L2ZFOGlPcDE4dGFCQzZiQWdNNndudHh5bStuL1NxM3ppd0RyOW5TdlNOdnd3?=
	=?utf-8?B?SVZYWWdZZkExU3dBZmhxdzJ5bC9OSitDdGxSSmYvelNVcXJ5cUdnSTJwamxE?=
	=?utf-8?Q?mYFUD4VyXHQ=3D?=
X-Microsoft-Antispam-Message-Info: asAaCKa+ioOT6WheMOf5iBWWGq5Ph73gZTff6Rjj8tY1XebnIO2ueKqwNjqcb8VVTRxHSTQxkZ0FmOJZ/l5iVx6iJrEyfxSmdrh/LuHWmAA1WrDavn+KZ0SdW5MpfSbRCtgCkqUN0nSEiVhkbaaGqtoAc6DBL7k5HU63+dSaOIfZlvFSIMn9UnXLVwXttwYk90x5em/ics+DQNhYlpi0RL2Wooqp6bR5RhPjKVTM6budg/xEB7vm0aVlEOxMLDZ0J5zKVO5Mn+s79yvDcIlH9KIt9AEfHv0wxFyMg2agjMGP4KmsC82vDvcJtnHdgKwJyjiQIxLG3GBDbBHZqFuMz+2g96HEvwrl10VbnfNH11g90zlZ7vI/5K5p33M3yukGiF1zltTmu3VbMlN9nRZhYZA7uVGT8Pljz8C9lNzgrDE=
X-Microsoft-Exchange-Diagnostics: 1; AM6PR04MB4264;
	6:kJyrY8lHA82pXy8LJPdtM4UJzVPnWSxY4ErIc9Edu+MiOcCvD5s2yVvptJUnLS8EgYg8lDjS8tWsONBi4mym+rq0ecixqHEEbn+pgw9Rq8HXfbK0q8ohKnh0vxlSutB5rFduIE3P38hfA1csy0mb9jovQvDjUn2eIOA5K1r1YosE3MDJsDP9xRJc7zM5Y+5A626l2AYKPQBxLoZGvIaIzsZH6lhNukE9DbpTnwCBqxAwruwoZ08KI/TIYwQXOjJ3ZYcIN4BcAN+CRO1s+89Me2Bc9BfSpg8pJ7qNoqv87dLqNeLAkMGYJTpnC4tJfbr0VRiuKjw5ePkhvz/pvePBdjtB3prrHMHQhwuhlYd3KZr4aIMQRxEsQfVET2e86XLR+9jimbNnMOrKQWe5TPTGnkWhQITx1GgO9TMB3E40t75w7q+TwDpTxuPHfPesYAIWTTbcYs/NCVCOaUPLJ1P/Sg==;
	5:cjddMdYkruaoF4JHubccin50mv/C/UAp/g5Rl6ti08aLLNbxtQF6S8WamHL82WKnpD9QKucyQCZpMAAI0Eyr3JIpP/47pAWPl4sY/wO3dAv8lvIj7vZKA2+keV+rJJnLg66ldVF8qeClZtftMI2OV4omcgav2MEN0eDZsKUHg4iSx+kHGnSiKJxmCbiaedzrkylXbuXv5P/RVrSoGRonFA==;
	7:2pQ+dPmrTG8LuCnKvj910o+sRzreh+QgfFvZXVaFRLpIZKVE/+a+Nh5PLLaBWE2sNTLiv4Y9ZizKKKzt4Y8gLTPfdVsjru2gyzy+9QlP91ZwQLso2FyGV5HB3O0fpqOX0YVJ4c/xD2OqXw7kspRPxQ==
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2019 14:35:12.0943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f5ebeb-bfe2-44c9-7f66-08d682d2506d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.236.92.113]; Helo=[eu2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4264
Subject: Re: Python3 bytecode is stale
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
X-List-Received-Date: Sat, 26 Jan 2019 00:08:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <17865BC4955F504399E8F82AC6F85A03@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

TW9zdCBsaWtlbHkgdGhlIGRhdGUvdGltZSBzdGFtcHMgb24gdGhlIGZpbGVzIGFyZSBzdWNoIHRo
YXQgdGhlICJweSIgZmlsZXMgDQphcHBlYXIgdG8gYmUgbmV3ZXIuDQoNCkEgdmVyeSBzaW1wbGUg
Zml4IHdvdWxkIGJlIHRvIHNpbXBseSBkZWxldGUgdGhlICIucHkiIGZpbGVzLCB0aGV5IGFyZW4n
dCANCnJlYWxseSBuZWVkZWQgYW55d2F5IHNvIHlvdSdsbCBzYXZlIGEgbG90IG9mIHNwYWNlIGlu
IHRoZSBwcm9jZXNzLg0KDQpUbyBkbyB0aGlzIGNvbXBpbGUtdGltZSwgeW91IGNvdWxkIGFkZCBz
b21ldGhpbmcgbGlrZSB0aGlzIGluIGEgYmJhcHBlbmQ6DQpQQUNLQUdFUyA9KyAiJHtQTn0tc3Jj
Ig0KRklMRVNfJHtQTn0tc3JjID0gIntpbnN0YWxsZGlyfS8qLnB5IHtpbnN0YWxsZGlyfS8qLyou
cHkiDQoNClRoYXQnbGwgcHVzaCB0aGUgInB5IiBmaWxlcyBpbnRvIGFub3RoZXIgcGFja2FnZSBh
bmQgcHJldmVudCB0aGVtIGJlaW5nIA0KaW5zdGFsbGVkIGJ5IGRlZmF1bHQuIENoYW5nZSAie2lu
c3RhbGxkaXJ9IiBpbnRvIHNvbWV0aGluZyBtb3JlIGFwcHJvcHJpYXRlLg0KT2YganVzdCBkZWxl
dGUgdGhlbSBpbiBhIGRvX2luc3RhbGxfYXBwZW5kLg0KDQoNCk9uIDI1LTAxLTE5IDE0OjQ2LCBT
dGVmYW4gQWduZXIgd3JvdGU6DQo+IEhpLA0KPiANCj4gUmVjZW50bHkgSSBub3RpY2VkIHRoYXQg
UHl0aG9uMyBwcm9ncmFtcyBnb3QgcmF0aGVyIHNsb3cuIFJ1bm5pbmcgdGhlDQo+IHRlc3QgYXBw
bGljYXRpb24gdG9vayAxMi41IHNlY29uZHMuIFdlIGFyZSB1c2luZyBhIHJlYWQtb25seSBmaWxl
IHN5c3RlbQ0KPiBhbmQgSSBpbW1lZGlhdGVseSBzdXNwZWN0ZWQgdGhlIGJ5dGVjb2RlIGNhY2hl
LiBBZnRlciBtb3VudGluZyB0aGUNCj4gcm9vdGZzIHJ3LCBmcm9tIHRoZSBzZWNvbmQgZXhlY3V0
aW9uIG9uIHJ1bm5pbmcgdGhlIHRlc3QgYXBwbGljYXRpb24NCj4gdG9vayBiZWxvdyA0IHNlY29u
ZHMuDQo+IA0KPiBCeSBzaW1wbHkgZXhlY3V0aW5nIGEgSGVsbG8gV29ybGQsIFB5dGhvbiBkZWNs
YXJlcyBhbGwgY29kZSBvYmplY3RzIGFzDQo+IGJlaW5nIHN0YWxlIGFuZCB0cmllcyB0byByZXdy
aXRlIHRoZW06DQo+IA0KPiAjIHB5dGhvbjMgLXYgLWMgJ3ByaW50KCJIZWxsbyBXb3JsZCIpJw0K
PiBpbXBvcnQgX2Zyb3plbl9pbXBvcnRsaWIgIyBmcm96ZW4NCj4gaW1wb3J0IF9pbXAgIyBidWls
dGluDQo+IGltcG9ydCBzeXMgIyBidWlsdGluDQo+IGltcG9ydCAnX3dhcm5pbmdzJyAjIDxjbGFz
cyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4gaW1wb3J0ICdfdGhyZWFk
JyAjIDxjbGFzcyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4gaW1wb3J0
ICdfd2Vha3JlZicgIyA8Y2xhc3MgJ19mcm96ZW5faW1wb3J0bGliLkJ1aWx0aW5JbXBvcnRlcic+
DQo+IGltcG9ydCAnX2Zyb3plbl9pbXBvcnRsaWJfZXh0ZXJuYWwnICMgPGNsYXNzDQo+ICdfZnJv
emVuX2ltcG9ydGxpYi5Gcm96ZW5JbXBvcnRlcic+DQo+IGltcG9ydCAnX2lvJyAjIDxjbGFzcyAn
X2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4gaW1wb3J0ICdtYXJzaGFsJyAj
IDxjbGFzcyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4gaW1wb3J0ICdw
b3NpeCcgIyA8Y2xhc3MgJ19mcm96ZW5faW1wb3J0bGliLkJ1aWx0aW5JbXBvcnRlcic+DQo+IGlt
cG9ydCBfdGhyZWFkICMgcHJldmlvdXNseSBsb2FkZWQgKCdfdGhyZWFkJykNCj4gaW1wb3J0ICdf
dGhyZWFkJyAjIDxjbGFzcyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4g
aW1wb3J0IF93ZWFrcmVmICMgcHJldmlvdXNseSBsb2FkZWQgKCdfd2Vha3JlZicpDQo+IGltcG9y
dCAnX3dlYWtyZWYnICMgPGNsYXNzICdfZnJvemVuX2ltcG9ydGxpYi5CdWlsdGluSW1wb3J0ZXIn
Pg0KPiAjIGluc3RhbGxpbmcgemlwaW1wb3J0IGhvb2sNCj4gaW1wb3J0ICd6aXBpbXBvcnQnICMg
PGNsYXNzICdfZnJvemVuX2ltcG9ydGxpYi5CdWlsdGluSW1wb3J0ZXInPg0KPiAjIGluc3RhbGxl
ZCB6aXBpbXBvcnQgaG9vaw0KPiAjIGJ5dGVjb2RlIGlzIHN0YWxlIGZvciAnZW5jb2RpbmdzJw0K
PiAjIGNvZGUgb2JqZWN0IGZyb20gL3Vzci9saWIvcHl0aG9uMy41L2VuY29kaW5ncy9fX2luaXRf
Xy5weQ0KPiAjIGNvdWxkIG5vdCBjcmVhdGUNCj4gJy91c3IvbGliL3B5dGhvbjMuNS9lbmNvZGlu
Z3MvX19weWNhY2hlX18vX19pbml0X18uY3B5dGhvbi0zNS5weWMnOg0KPiBPU0Vycm9yKDMwLCAn
UmVhZC1vbmx5IGZpbGUgc3lzdGVtJykNCj4gIyB3cm90ZQ0KPiAnL3Vzci9saWIvcHl0aG9uMy41
L2VuY29kaW5ncy9fX3B5Y2FjaGVfXy9fX2luaXRfXy5jcHl0aG9uLTM1LnB5YycNCj4gIyBieXRl
Y29kZSBpcyBzdGFsZSBmb3IgJ2NvZGVjcycNCj4gIyBjb2RlIG9iamVjdCBmcm9tIC91c3IvbGli
L3B5dGhvbjMuNS9jb2RlY3MucHkNCj4gIyBjb3VsZCBub3QgY3JlYXRlDQo+ICcvdXNyL2xpYi9w
eXRob24zLjUvX19weWNhY2hlX18vY29kZWNzLmNweXRob24tMzUucHljJzogT1NFcnJvcigzMCwN
Cj4gJ1JlYWQtb25seSBmaWxlIHN5c3RlbScpDQo+ICMgd3JvdGUgJy91c3IvbGliL3B5dGhvbjMu
NS9fX3B5Y2FjaGVfXy9jb2RlY3MuY3B5dGhvbi0zNS5weWMnDQo+IGltcG9ydCAnX2NvZGVjcycg
IyA8Y2xhc3MgJ19mcm96ZW5faW1wb3J0bGliLkJ1aWx0aW5JbXBvcnRlcic+DQo+IGltcG9ydCAn
Y29kZWNzJyAjIDxfZnJvemVuX2ltcG9ydGxpYl9leHRlcm5hbC5Tb3VyY2VGaWxlTG9hZGVyIG9i
amVjdCBhdA0KPiAweGI2YjMzMTMwPg0KPiAjIGJ5dGVjb2RlIGlzIHN0YWxlIGZvciAnZW5jb2Rp
bmdzLmFsaWFzZXMnDQo+ICMgY29kZSBvYmplY3QgZnJvbSAvdXNyL2xpYi9weXRob24zLjUvZW5j
b2RpbmdzL2FsaWFzZXMucHkNCj4gIyBjb3VsZCBub3QgY3JlYXRlDQo+ICcvdXNyL2xpYi9weXRo
b24zLjUvZW5jb2RpbmdzL19fcHljYWNoZV9fL2FsaWFzZXMuY3B5dGhvbi0zNS5weWMnOg0KPiBP
U0Vycm9yKDMwLCAnUmVhZC1vbmx5IGZpbGUgc3lzdGVtJykNCj4gIyB3cm90ZQ0KPiAnL3Vzci9s
aWIvcHl0aG9uMy41L2VuY29kaW5ncy9fX3B5Y2FjaGVfXy9hbGlhc2VzLmNweXRob24tMzUucHlj
Jw0KPiBpbXBvcnQgJ2VuY29kaW5ncy5hbGlhc2VzJyAjDQo+IDxfZnJvemVuX2ltcG9ydGxpYl9l
eHRlcm5hbC5Tb3VyY2VGaWxlTG9hZGVyIG9iamVjdCBhdCAweGI2YjNkOWQwPg0KPiBpbXBvcnQg
J2VuY29kaW5ncycgIyA8X2Zyb3plbl9pbXBvcnRsaWJfZXh0ZXJuYWwuU291cmNlRmlsZUxvYWRl
ciBvYmplY3QNCj4gYXQgMHhiNmIxNTRiMD4NCj4gIyBieXRlY29kZSBpcyBzdGFsZSBmb3IgJ2Vu
Y29kaW5ncy5hc2NpaScNCj4gIyBjb2RlIG9iamVjdCBmcm9tIC91c3IvbGliL3B5dGhvbjMuNS9l
bmNvZGluZ3MvYXNjaWkucHkNCj4gIyBjb3VsZCBub3QgY3JlYXRlDQo+ICcvdXNyL2xpYi9weXRo
b24zLjUvZW5jb2RpbmdzL19fcHljYWNoZV9fL2FzY2lpLmNweXRob24tMzUucHljJzoNCj4gT1NF
cnJvcigzMCwgJ1JlYWQtb25seSBmaWxlIHN5c3RlbScpDQo+ICMgd3JvdGUgJy91c3IvbGliL3B5
dGhvbjMuNS9lbmNvZGluZ3MvX19weWNhY2hlX18vYXNjaWkuY3B5dGhvbi0zNS5weWMnDQo+IGlt
cG9ydCAnZW5jb2RpbmdzLmFzY2lpJyAjIDxfZnJvemVuX2ltcG9ydGxpYl9leHRlcm5hbC5Tb3Vy
Y2VGaWxlTG9hZGVyDQo+IG9iamVjdCBhdCAweGI2YjNkYjEwPg0KPiBpbXBvcnQgJ19zaWduYWwn
ICMgPGNsYXNzICdfZnJvemVuX2ltcG9ydGxpYi5CdWlsdGluSW1wb3J0ZXInPg0KPiAuLi4uDQo+
IA0KPiANCj4gVGhpcyBpcyBvbiBhIEFybXY3IGRldmljZS4gT3BlbkVtYmVkZGVkIGxheWVycyBh
cmUgY3VycmVudCBtYXN0ZXIuDQo+IFB5dGhvbiB2ZXJzaW9uIGlzIDMuNS42LiBJcyB0aGlzIGEg
a25vd24gaXNzdWU/IEFueSBpZGVhPw0KPiANCj4gLS0NCj4gU3RlZmFuDQo+IA0KDQo=

