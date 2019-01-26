Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 111424 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 26 Jan 2019 21:32:18 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
	by mail.openembedded.org (Postfix) with ESMTP id B2F9C7C41B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2019 21:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eZ9S7gdSTkxnBzMXJCFHXS7zrhwJX1d3z9EI/0ldu40=;
	b=fhNvQwKCucSreGQ205vZiBNnCMAD179eAPFbaDEU/3MN1QFFGq3kZTOyJ3q6osmaSrj32jxBujibe2yTUz4UBmLCuuPLMfsmc3oDs3snMNx3lDz5NwfjxzEucnAQIaHhclWS62D6+LuVj8BD7ScIFqF9Oq7JALxpW8RuCPSYblU=
Received: from VI1PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:802:2::30)
	by VI1PR04MB4270.eurprd04.prod.outlook.com (2603:10a6:803:3e::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.16;
	Sat, 26 Jan 2019 16:59:05 +0000
Received: from HE1EUR01FT036.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::209) by VI1PR04CA0059.outlook.office365.com
	(2603:10a6:802:2::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.16 via
	Frontend Transport; Sat, 26 Jan 2019 16:59:05 +0000
Authentication-Results: spf=pass (sender IP is 52.236.92.113)
	smtp.mailfrom=topicproducts.com; foundries.io; dkim=pass (signature was
	verified) header.d=topicbv.onmicrosoft.com;foundries.io; dmarc=none
	action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.236.92.113 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.236.92.113;
	helo=eu2-emailsignatures-cloud.codetwo.com;
Received: from eu2-emailsignatures-cloud.codetwo.com (52.236.92.113) by
	HE1EUR01FT036.mail.protection.outlook.com (10.152.1.30) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1580.10 via Frontend Transport; Sat, 26 Jan 2019 16:59:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (104.47.1.58) by
	eu2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
	(TLS12) via SMTP; Sat, 26 Jan 2019 16:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eZ9S7gdSTkxnBzMXJCFHXS7zrhwJX1d3z9EI/0ldu40=;
	b=fhNvQwKCucSreGQ205vZiBNnCMAD179eAPFbaDEU/3MN1QFFGq3kZTOyJ3q6osmaSrj32jxBujibe2yTUz4UBmLCuuPLMfsmc3oDs3snMNx3lDz5NwfjxzEucnAQIaHhclWS62D6+LuVj8BD7ScIFqF9Oq7JALxpW8RuCPSYblU=
Received: from AM0PR04MB5348.eurprd04.prod.outlook.com (20.178.112.145) by
	AM0PR04MB5380.eurprd04.prod.outlook.com (20.178.115.212) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.21; Sat, 26 Jan 2019 16:58:35 +0000
Received: from AM0PR04MB5348.eurprd04.prod.outlook.com
	([fe80::1c68:e546:f90f:bc05]) by
	AM0PR04MB5348.eurprd04.prod.outlook.com
	([fe80::1c68:e546:f90f:bc05%3]) with mapi id 15.20.1558.021;
	Sat, 26 Jan 2019 16:58:35 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Stefan Agner <stefan@agner.ch>
Thread-Topic: [oe] Python3 bytecode is stale
Thread-Index: AQHUtLRsqSN+w0VRpkSjzihaJ0lY36XADOqAgAAvxICAAYqmgA==
Date: Sat, 26 Jan 2019 16:58:34 +0000
Message-ID: <e0f6dd64-bb31-ec0c-63dc-ae24c39e2594@topic.nl>
References: <4f3f8463750770c686b010b7270351b2@agner.ch>
	<c0e76ec3-4cc9-38cc-bdac-eadd69eab14a@topic.nl>
	<afcb2f61ca3adfef2e312fc3b8f23215@agner.ch>
In-Reply-To: <afcb2f61ca3adfef2e312fc3b8f23215@agner.ch>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
x-clientproxiedby: AM6PR0202CA0053.eurprd02.prod.outlook.com
	(2603:10a6:20b:3a::30) To AM0PR04MB5348.eurprd04.prod.outlook.com
	(2603:10a6:208:111::17)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [85.150.144.104]
x-ms-publictraffictype: Email
X-Microsoft-Exchange-Diagnostics-untrusted: 1; AM0PR04MB5380;
	6:wf0B7UppxOjGDIeEUma+Yyh75TowkEJUEoJ6K5xYG3ULteq2EvZs0KEwhFbqumfvZVSdPqmMfzgHHQWRGvbDOK4IKPB9FFsQniRUThkZUhe8f0sJbTc2HHmBYQASMmVsrVnrqjJ8WFF6Ymwnfi1G2DU/SswPMtSWXRwbPA+08Vv2INjSThdy9bfvgaBTEKBX1EXzt+5L4NNYylieGDAfFcDMBJQHJaV0qK+IHQSAd1Aj2/JpvkNb4dqJs0mu+HwHDxVIZFtGTgPN8SiWjbB2Qc5j7cCIwGHyTu3YlbkHvz7CID1FmVYrDHe1D8N4iHHLka/kU/pgwnZB1VKP6EXQIVPietGhsi3toNXFkgaiC6LDvduwxEoBZ92HkhYtpG71wBrb07i2jhWnHpcb53qxmERN/4UVTlJesefFfRSGwkx7F55bWqQo2NWiW7mn99mrILlDfHrzUtAfqHLLzY4q5Q==;
	5:tKyU49smmsaRH/D6Mbp5Cc82v+t1yCBbW5plnGfHS2gs7WXB3iyhJxUR4wXorShbcIXQFtQa0NiaUrH+ZTh3SlmBWSnuODy2NVCHhqGCzKHJy/wM/h6F3tGwJ2MYP8qg1kEOZFaBgq6iqsv32I9Ia6TtpWiS4+Uwrp8lWqp2VzS2Biaonqer+1jnMMOQfAF4wsp+eTNycxn1HaB1pwILWA==;
	7:LM24JeIl21lC9hE+0zk/51OQcXvGRLzX+LUvwAqNvZu2jAbZxIido6GQt45NSscECGKmoC0X63q8TLVfojSNHSQ5Hy1jsyS95CX8eJRNXUCBClIn4ZolqMUE8dmVLBtYU4wtq9xDYqfV+Gin5Op6vQ==
X-MS-Office365-Filtering-Correlation-Id: 36607bf5-b43c-49c8-3ab1-08d683af9416
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR04MB5380; 
X-MS-TrafficTypeDiagnostic: AM0PR04MB5380:|VI1PR04MB4270:
X-Microsoft-Antispam-PRVS: <VI1PR04MB42708130065B5D354ABF2FCC96940@VI1PR04MB4270.eurprd04.prod.outlook.com>
x-forefront-prvs: 0929F1BAED
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(39830400003)(136003)(366004)(346002)(199004)(189003)(6306002)(74482002)(446003)(31686004)(11346002)(14444005)(256004)(44832011)(476003)(2616005)(486006)(106356001)(6486002)(186003)(26005)(53546011)(102836004)(105586002)(6506007)(386003)(42882007)(7736002)(6512007)(71200400001)(14454004)(6436002)(305945005)(71190400001)(966005)(6246003)(52116002)(53936002)(229853002)(99286004)(4326008)(25786009)(36756003)(68736007)(81156014)(2906002)(8676002)(81166006)(508600001)(58126008)(54906003)(65956001)(66066001)(65806001)(316002)(6916009)(97736004)(31696002)(8936002)(65826007)(6116002)(3846002)(76176011)(64126003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5380;
	H:AM0PR04MB5348.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: YmHFGF3HCaoYwD2gfvVE7gE/HCSO1hwhJFyvDAfH35Ovl01aG7Wscy6AHJqBEJnvBOYHVnnv39IaEiq3cslGHzpvP1YH0qxiaGGzbMzPYGG9hwktgS5la6x+1j+OBawlrllJDFDySdg0pyyE5b4KqN5Qdu6p0zOYH177Dzjvgq2eQiv1pOMcUT2vIaFsKRDrREJdXCjgsaYfS6OCxGnOM6ysWKmC92/ZCDmMBkmRSYSjYa1kyEJnCJjZuyGd+31rmMXA5vQKyfVkGaMVlODl4v7Qr8e/oCEMboa/HnnkCN7m/llqnZSXLpFG03Q5AIWhLuAKPkPknG4kOfjZDZF9RYMzA8q/31ihrn+vKFRbs9FvSJvPHQgMpMgHZtHOKgolHEBL0ZCoqleD7vVOU9g8c+E7p1XOqNfpVavvKO+mRdc=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5380
X-CodeTwo-MessageID: 20190126165837.2aa061af-af5d-4cc6-b45c-5cb18762ec68@eu2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT036.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.236.92.113; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39830400003)(396003)(346002)(136003)(2980300002)(199004)(189003)(336012)(6486002)(47776003)(229853002)(2906002)(14444005)(8676002)(23676004)(31696002)(76176011)(386003)(36756003)(246002)(64126003)(486006)(6506007)(106466001)(44832011)(186003)(7736002)(65956001)(53546011)(2486003)(102836004)(26005)(42882007)(4326008)(7596002)(65806001)(7636002)(8936002)(305945005)(316002)(446003)(6116002)(3846002)(11346002)(65826007)(66066001)(99286004)(6306002)(436003)(74482002)(2616005)(126002)(476003)(58126008)(31686004)(54906003)(6512007)(6246003)(508600001)(356004)(106002)(25786009)(966005)(6916009)(14454004)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4270;
	H:eu2-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass; LANG:en;
	PTR:eu2-emailsignatures-cloud.codetwo.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; HE1EUR01FT036;
	1:sNI21Rbcqsx0L1ZXfNd5HvPQ3he22I3cbW7GzfFlGMA3Sa8U9CjXdJlswUf3zhBHtRKdIE16OGa87UMGycyx8x09DlP22mV1fMgc3BwYC2by1skRe1Q4kfxJaOdPal7pM7ous84eMeTQGbV2qEbFW+SZEBOWQO56YtxSBhyLFYM=
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2317e70e-7773-449f-137f-08d683af823e
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(710020)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB4270; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB4270;
	3:pJY7mxae9LjhQAPrzkB5v7HX56/U4jwr31jKiLODDKKKK6lLyseQrg6snFWcBf/zKRw0winZ908Qc9mkoIEHNVkGljP4HyyNNhkyR4xIayE8kPp+uTQP+nXVxLSdHxjm16r0By4u2S+V33lnDJSJfcNv/Wbi5O4152KbvrTvHCYnOgpnyMeSrlOslDGs8jiGWdmW/FwtvuBaeDQtwoXPUnnZFj4X+zXGCdn9fjPp4QJqPmB/LLORYCon2OxkZJWoqiAqSmHRPGeDnNPAFnfXfBLpDbg/7yemRJAUjTQI2jKIS1Hl89mfs/Tuo9ZeSCTo9gpWSdu6ryeAvtAcMKriDHDuvkUvLDly3LNfsIlmGXF32R18G0hRR0xgyfocxtic;
	25:10lHljsebJ6/58TdKWdE1XxV2oub5A0aUn1weH4ZTzXk91U6yoLu/DS4BygbNq4xev8HmkVyqJgCesbfEX3DwtRekStA3C3f/vroltUbABm8itWlNwFbn2106jc/wnoQYoxvgEfflsI7oCFNip6bcPBnjuM/hWT9wOX7VZQIISjmXSFCWAPWHn7z1mifRbE59kkhbLY69/weY4jnJFpif5SENxkNPqfIWqT+84NIeKlXPXrDBV6tfr3xp20T1zr29VvmQvfHH7SejGHwf2G9HGopk31nW23UgjK40WYF77d9bvHUF39lmdx8Vrk4CFh3Ly0830ztmKnNw0oHetBlrA==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB4270;
	31:CDdGDDmPle1RGIMysuDixNFcxSI5lOnny8bm6meU1Y7YEMx+tFcoYaJzWjApMo2VwdKzwrYiSitUMOhZo7oPW6vfElGHHfkTuABGmk3ZACTDBgSicAwU11IGhurYhvBnUQMcap2mnzl1tiInL+TrPRpIEUbEAZtg75A0z44EMZQ7Df4OGZBGSIXiBURvFpnqidRYkWorj+ZQt1SZgJ1SSvTXOURHjOEYMR/444l5kAs=;
	20:/rTmY9CuMpSurZ2SNa8gS/CwHmQr2s4tNS1C79YYEjhYyOWRATig2mGtcg6lSipQup5RHm71z2JVI0Hk56bjexxJX1gbnCt8XtdmxYpneIFIsMuRzX/tKKgTlLJfZ3xYWNF36y9zOOyMvJM6X6M2f071xMpuQZo3PU5PXw5qlt4=;
	4:r0A6AuKSHVrHnULwM6Kj/FpYvdfLxOaoxJdU9Vk7ZzPdzXzqE9zkAgVWCUztSOep2hAp3xq/AaCg1fsIC9DF8AAe0vUoAFVFI1cz+12V3nOhant8si8Dy1Hq9hS2YJuyv4zoKezWLMYbpC3K0nQ/THSSK29xvtup9OYYA1Q/f0m8oOB1+8BFo9SZa7SoMh3/pbtiLp5/fkB0tjpOfXYQZxGijVuFJ4nNFByg3RR48bG8uLvysfc+m8TEoh9i+DzPcTFdnPIjATUMIrw7nDUYGcfg9TtQDlZcCYcIo2igXzSP/MlC4jOPxU/DNovSDonw
X-Forefront-PRVS: 0929F1BAED
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA0TUI0MjcwOzIzOmtRaU5JYnpTZWZ0T0tTcW9IUVU0UlEvOXFK?=
	=?utf-8?B?VTFHdU4wN0xYRFNFb2hyak0rc2Qrd3hBMmcvS3h0SFBPQXRhRTJzUTdkRHVt?=
	=?utf-8?B?VXlPTnltODgyTTl3Z0xqVWE5eGVHM3RkMS93Uzczd1pxZUszSjBybzBseFI5?=
	=?utf-8?B?UnZoMUxjcTVPRFVXTC84WGNuR251aE1rd1JoVS93d3cvT2szS08xSngwRnM4?=
	=?utf-8?B?cjVwdTdmRkNnQ2tnWGl5UW1CUHdRU3NqVjhkVEdQSlQyd2o4ZWpuSmJyM1JG?=
	=?utf-8?B?N2p0VjdKTWJlamdlKzhBVUFLRDczL3lqNlFDMVA3NG9oelp3Q2VvS3VLeFVl?=
	=?utf-8?B?b1VyUlB6eEYxYm9aSFVwNnBNdzlocUlBVUNITkI2Qnh4SDFWei85cEZLWHBH?=
	=?utf-8?B?cjk3OUY0eEpxejRWY2dvNUtONGZRZENzaUpPaFZtcXNpTU40WmozeXNHT1Bs?=
	=?utf-8?B?OFRHV0NnTGlmWWtZK2kya01CUE5HeTdPZnBKTDkwSEpRWnhqV1lmRSsya1ZW?=
	=?utf-8?B?VlBCMEIzSTlVTUhWU1p1am9FR0JyYVlrcUJIS2FTZExXOFROQVZYZkpsVnYz?=
	=?utf-8?B?YzNXblBzcTFmQXlGaVBZVUllZG1veEJzbXB3OEtFY1pKOUVvKzJtZjRHNWJl?=
	=?utf-8?B?YjVIaDhiNXBWTHdhTU1INitFeWwzSk5zVG1BSXNHZkVQSDBrbXNuOGJzVXJr?=
	=?utf-8?B?YU5YTGJodzZxRkpuSnJvcXNjUmZITlZtdCtobzRubWJLSXhFTkU2dE5CYnp4?=
	=?utf-8?B?ZWt1dG9ya056ampwUnJ6eW0rRXd4N1ZNZldkc1VWeHdBQllKNUdoSGpKcjF3?=
	=?utf-8?B?N1FNOEJ5MnFVd2FjRTV5b0hhOUR3V2U2T0JPSTFKTTQvL3llMkU4MUNPNy84?=
	=?utf-8?B?ZHJrM2ozNmRlUWM4NWZnQWdIaml1ZlRSVlMvVkMwV0RSdTE1T1JlclBKNEdp?=
	=?utf-8?B?MHV0TWE1bzVSQ1QrcFZiNDdaNmlWTG1iWEpjUUpIaXJWSlF5MEI5NVlaR2RY?=
	=?utf-8?B?RlRqVVZnV05yQ21qb0Nzc0J2bTNTMjY0VW9kKzdOWnY1VThXd0tOSHZWbXBu?=
	=?utf-8?B?ZzBKQTZZZEV4Wm0wOWtUZ0RacGVrWEEranNXbE15SC9hYzQrNHBjY3BFeWpQ?=
	=?utf-8?B?MUNNa0lVK3RtVEZiZytxSmJ4WWtjZGZkSzJLRkF6TmhzUVYvZnNUc3g5SU4v?=
	=?utf-8?B?V0h1UkVSa2VOTnpGWVBLalp1M0xkUlBzM0MvdFNXb3EyVGVJSjJETEEwSnpq?=
	=?utf-8?B?aGFjdFVuWkZaSzNlaVdVOEJXbGF4UHdJc1FoVVlVQlJrMS9rV1JuZEhEVS9R?=
	=?utf-8?B?ZGVvTTlIYWlONVpicUNMSm1rR2x3YVBtMDZvZFRmL25aQlkrS2MxMmZGdnhQ?=
	=?utf-8?B?SnNKYk5oTVUvdmxoNzA1YmZHZ3lIYi9ZdWpQU1gvRjk2Z0Jwejl4RGxZdTd3?=
	=?utf-8?B?bTU5YkJKQlEwVzF6Z21WT0V0NWFod042TFZxa0lZbzJIaEoyYjlyaTlHWUtn?=
	=?utf-8?B?OWhZWVBkOTV3UXFCMjgyUnorOGZ1MEkweU41VGZKelFsVkJuNGV5WE1yenhq?=
	=?utf-8?B?UW9pU0JuQW5WVE1aZFV4a21adDVSM3I0My8rTUMvTnFZbVhEdk84aUU0Tklv?=
	=?utf-8?B?dyttc095cFFDaG55eTBtQlRzM0pzYlRVU25MM2pGajRPMkh0TjdkL1AyMk5n?=
	=?utf-8?B?d2RGRlhPSkM1RGYrc3JybUJGR3FwckllQkxPS1E4Tzl0VjkwRUNyNHFIcmdD?=
	=?utf-8?B?MnVWQ3paSjZKeWF4cHlOMXdKWis2M3h5TG9iM3BXbG9qck56V0lwckZhZTBq?=
	=?utf-8?B?K00va3VSb2poVklZMXNxc1Y1elFoQkduR1IvdGF6NjJOZTllV0hidzBHbFZ4?=
	=?utf-8?B?WEVOSEhnbzJjbkpmWDU1MkplRlBYd1IyOTB1dE9GVlV6V3pjOVUxMjVkY254?=
	=?utf-8?B?Z2d1UU9kSitRPT0=?=
X-Microsoft-Antispam-Message-Info: ODX4yAlumv/ef7m7az8nAsHi9Q5JLWJpBcaWxLa7/U2CLIzzdVBaYDEqaexORdpr0yQPzwieMmwV+8Ps1gyhaPOlIY01kVFbVaoVV8+386WnXmNVMP0x7D8NIT/2r/DmW3w/3gWmY2BC5gkYGCS35B4rVtqx/rNJttBUDPtja54Wx1SkTwFqTViapnQf9CHLRyGt04pryi/29Payf07tJ3rQnfGyOPSzjAkTyxtWYpU0E8BYYoonTsRGtaKwClx2uGseKr8XnTqbeBq8kufYPv6H0OEs3tb5IOUKs01Ym10YHbBlxIPABFl+GNxrW0fIhaU38iIblBOiTXtAcX3FCWRrnqX9PqXC+gftau1ymTpmslmG+9U2hr55maunYkBgC1zhJumADbspSQHZKSzHhQ0ng7md1AmkCYdPkVTjXlc=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB4270;
	6:nm9sYn5pl9EDyXoRWPDjootkyXEb36FlRfZTyNoEAy5kuuxY54Vu9qP+JVaQCr+z/Le8vckMFK0hP+jGYu0s5qGTXcRrckoeF3RNbcW8O41UkzXpkOXb0pL+ay0dLoVfiDnHSojRs8a3yzv8AWwyBu6xmn0GYL5PaXEtcgXqg/SIbcxnr3jz+I0ztEQrOwXBGLj2/tijyAztfX4Swk2EEYp29gvbOIteS9V1aeHrPhYjKE/IwNkplswpa3OWG5fKIe5BEsl7IqfwS3sOEiYn2NIvpNfKSvzCC7aMuUt6I0w3ibEH1LLp+qMb5BuBij7Q56EBhZjwOzEg+W3uGtQZS4QI4SbLKt/fKCDuihm9J+5ZUEqkcfn/8d901nurc1531mOmdMBVAMa4UPlry0zcVD/F7u/OvrMlxZNjFu4RJjtZoMPZLj4SIBdA3pGZuJGCRLzBqxzqX5lIBO+pPPtGWw==;
	5:+c6FEWTbipaqhrY7JJbl1ctcZMnmsaQNcYc5U3A+KIgsPDBSkLxmllnM31OyRoEBy/t0+sT2oOZID2GV/HfcLToeseYbHuQ2C4/tsi/GBVR0VjJWgDwWi7lLaeIteiZ8JKY6b6QO88lqOd4Esfc/fhXzItz2Lhxh6zR3CzdnFTiwZVKarglgKHHlEKM/7+JKJjxqdJ7lQwjXkWJs4oTS0w==;
	7:4STU01c5rYRqndKnhl8mkQwkn360MRQ1FqvuB5gFQMU7Jz9YuVxYEE+yiIRNaJkofayIXoaGtVlTaMzYko2EuKL1cB/3/mq1oaeHA4jroX8oi5hTulBa4GhKHbSVhycri4axVeJDTYsbA16HEZg0MQ==
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2019 16:59:04.3111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36607bf5-b43c-49c8-3ab1-08d683af9416
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.236.92.113]; Helo=[eu2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4270
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sat, 26 Jan 2019 21:32:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9828C6435415C4B9ACD79C4FD6EB780@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMjUtMDEtMTkgMTg6MjYsIFN0ZWZhbiBBZ25lciB3cm90ZToNCj4gT24gMjUuMDEuMjAxOSAx
NTozNSwgTWlrZSBMb29pam1hbnMgd3JvdGU6DQo+PiBNb3N0IGxpa2VseSB0aGUgZGF0ZS90aW1l
IHN0YW1wcyBvbiB0aGUgZmlsZXMgYXJlIHN1Y2ggdGhhdCB0aGUgInB5IiBmaWxlcw0KPj4gYXBw
ZWFyIHRvIGJlIG5ld2VyLg0KPiANCj4gSW5kZWVkLCB0aGlzIHNlZW1zIHRvIGJlIHRoZSBpc3N1
ZS4gV2UgYXJlIHVzaW5nIE9TVHJlZSwgd2hpY2ggcmVtb3Zlcw0KPiBtdGltZXMuIFJpY2FyZG8g
KG5vdyBvbiBDQykgYWxzbyBwb2ludGVkIG1lIHRvIHRoZSByZWxldmFudCBpc3N1ZSBpbg0KPiBP
U1RyZWU6DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vc3RyZWVkZXYvb3N0cmVlL2lzc3Vlcy8xNDY5
DQo+IA0KPj4NCj4+IEEgdmVyeSBzaW1wbGUgZml4IHdvdWxkIGJlIHRvIHNpbXBseSBkZWxldGUg
dGhlICIucHkiIGZpbGVzLCB0aGV5IGFyZW4ndA0KPj4gcmVhbGx5IG5lZWRlZCBhbnl3YXkgc28g
eW91J2xsIHNhdmUgYSBsb3Qgb2Ygc3BhY2UgaW4gdGhlIHByb2Nlc3MuDQo+Pg0KPj4gVG8gZG8g
dGhpcyBjb21waWxlLXRpbWUsIHlvdSBjb3VsZCBhZGQgc29tZXRoaW5nIGxpa2UgdGhpcyBpbiBh
IGJiYXBwZW5kOg0KPj4gUEFDS0FHRVMgPSsgIiR7UE59LXNyYyINCj4+IEZJTEVTXyR7UE59LXNy
YyA9ICJ7aW5zdGFsbGRpcn0vKi5weSB7aW5zdGFsbGRpcn0vKi8qLnB5Ig0KPj4NCj4+IFRoYXQn
bGwgcHVzaCB0aGUgInB5IiBmaWxlcyBpbnRvIGFub3RoZXIgcGFja2FnZSBhbmQgcHJldmVudCB0
aGVtIGJlaW5nDQo+PiBpbnN0YWxsZWQgYnkgZGVmYXVsdC4gQ2hhbmdlICJ7aW5zdGFsbGRpcn0i
IGludG8gc29tZXRoaW5nIG1vcmUgYXBwcm9wcmlhdGUuDQo+PiBPZiBqdXN0IGRlbGV0ZSB0aGVt
IGluIGEgZG9faW5zdGFsbF9hcHBlbmQuDQo+IA0KPiBIbSwgaW50ZXJlc3RpbmcgaWRlYSwgd2ls
bCBnaXZlIHRoaXMgYSB0cnkuDQo+IA0KPiBXb3VsZG4ndCBiZSBzb21ldGhpbmcgbGlrZSB0aGlz
IGJlIGEgbmljZSBPcGVuRW1iZWRkZWQgYWRkaXRpb24gaW4NCj4gZ2VuZXJhbD8gT3B0aW1pemlu
ZyBlbWJlZGRlZCByb290ZnMgc2l6ZSBieSBkZWxldGluZyBweSBmaWxlcyBzZWVtcyB0bw0KPiBi
ZSBhIGNvbW1vbiB1c2UgY2FzZS4NCg0KSGVyZSdzIGEgYmJhcHBlbmQgZXhhbXBsZSBmb3IgcHl0
aG9uOg0KDQpodHRwczovL2dpdGh1Yi5jb20vT3BlblBMaS9vcGVucGxpLW9lLWNvcmUvYmxvYi9k
ZXZlbG9wL21ldGEtb3BlbnBsaS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob25fMi43LjEz
LmJiYXBwZW5kI0wyMA0KDQo+IEluIGEgc2ltcGxlIHRlc3QgZGVsZXRpbmcgYWxsIHB5IGZpbGVz
IG9uIG15IHJvb3RmcyBkaWQgbm90IGdvIHdlbGwgKHRoZQ0KPiBhcHBsaWNhdGlvbiBkb2VzIG5v
dCBzdGFydCBhbnltb3JlKS4gSSBuZWVkIHRvIGludmVzdGlnYXRlIGZ1cnRoZXIuDQoNClRoZSAi
bWFpbiIgbW9kdWxlICh0aGUgb25lIHN0YXJ0ZWQgZnJvbSBjb21tYW5kbGluZSkgbmVlZHMgdG8g
YmUgaW4gLnB5IA0KZm9ybWF0IHN0aWxsLCBvdGhlcndpc2UgeW91IGNhbm5vdCAicnVuIiBpdC4g
QXMgYSB3b3JrYXJvdW5kLCB5b3UgY2FuIA0KcnVuIGl0IHVzaW5nICJweXRob24gLW0iLCBvciBt
YWtlIHN1cmUgdGhhdCB0aGF0IG9uZSAucHkgZmlsZSBnZXRzIA0KaW5zdGFsbGVkLg0KDQpJdCdz
IGFjdHVhbGx5IGV2ZW4gcG9zc2libGUgdG8gcHV0IHRoZSBweWMgZmlsZXMgaW50byBhIFpJUCBm
aWxlIGFuZCANCmxvYWQgZGlyZWN0bHkgZnJvbSB0aGF0IGF0IHJ1bnRpbWUuIFRoaXMgcmVkdWNl
cyB0aGUgbnVtYmVyIG9mIGZpbGVzLiBPbiANCmEgY29tcHJlc3NlZCBmaWxlc3lzdGVtLCB0aGlz
IHdvbid0IG1ha2UgYSBkaWZmZXJlbmNlIG9mIGNvdXJzZSwgYW5kIGlzIA0KbGlrZWx5IHRvIGlu
Y3JlYXNlIHRoZSB0b3RhbCBzaXplLg0KDQotLQ0KTS4NCg0KPiANCj4gLS0NCj4gU3RlZmFuDQo+
IA0KPj4NCj4+DQo+PiBPbiAyNS0wMS0xOSAxNDo0NiwgU3RlZmFuIEFnbmVyIHdyb3RlOg0KPj4+
IEhpLA0KPj4+DQo+Pj4gUmVjZW50bHkgSSBub3RpY2VkIHRoYXQgUHl0aG9uMyBwcm9ncmFtcyBn
b3QgcmF0aGVyIHNsb3cuIFJ1bm5pbmcgdGhlDQo+Pj4gdGVzdCBhcHBsaWNhdGlvbiB0b29rIDEy
LjUgc2Vjb25kcy4gV2UgYXJlIHVzaW5nIGEgcmVhZC1vbmx5IGZpbGUgc3lzdGVtDQo+Pj4gYW5k
IEkgaW1tZWRpYXRlbHkgc3VzcGVjdGVkIHRoZSBieXRlY29kZSBjYWNoZS4gQWZ0ZXIgbW91bnRp
bmcgdGhlDQo+Pj4gcm9vdGZzIHJ3LCBmcm9tIHRoZSBzZWNvbmQgZXhlY3V0aW9uIG9uIHJ1bm5p
bmcgdGhlIHRlc3QgYXBwbGljYXRpb24NCj4+PiB0b29rIGJlbG93IDQgc2Vjb25kcy4NCj4+Pg0K
Pj4+IEJ5IHNpbXBseSBleGVjdXRpbmcgYSBIZWxsbyBXb3JsZCwgUHl0aG9uIGRlY2xhcmVzIGFs
bCBjb2RlIG9iamVjdHMgYXMNCj4+PiBiZWluZyBzdGFsZSBhbmQgdHJpZXMgdG8gcmV3cml0ZSB0
aGVtOg0KPj4+DQo+Pj4gIyBweXRob24zIC12IC1jICdwcmludCgiSGVsbG8gV29ybGQiKScNCj4+
PiBpbXBvcnQgX2Zyb3plbl9pbXBvcnRsaWIgIyBmcm96ZW4NCj4+PiBpbXBvcnQgX2ltcCAjIGJ1
aWx0aW4NCj4+PiBpbXBvcnQgc3lzICMgYnVpbHRpbg0KPj4+IGltcG9ydCAnX3dhcm5pbmdzJyAj
IDxjbGFzcyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4+PiBpbXBvcnQg
J190aHJlYWQnICMgPGNsYXNzICdfZnJvemVuX2ltcG9ydGxpYi5CdWlsdGluSW1wb3J0ZXInPg0K
Pj4+IGltcG9ydCAnX3dlYWtyZWYnICMgPGNsYXNzICdfZnJvemVuX2ltcG9ydGxpYi5CdWlsdGlu
SW1wb3J0ZXInPg0KPj4+IGltcG9ydCAnX2Zyb3plbl9pbXBvcnRsaWJfZXh0ZXJuYWwnICMgPGNs
YXNzDQo+Pj4gJ19mcm96ZW5faW1wb3J0bGliLkZyb3plbkltcG9ydGVyJz4NCj4+PiBpbXBvcnQg
J19pbycgIyA8Y2xhc3MgJ19mcm96ZW5faW1wb3J0bGliLkJ1aWx0aW5JbXBvcnRlcic+DQo+Pj4g
aW1wb3J0ICdtYXJzaGFsJyAjIDxjbGFzcyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9y
dGVyJz4NCj4+PiBpbXBvcnQgJ3Bvc2l4JyAjIDxjbGFzcyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVp
bHRpbkltcG9ydGVyJz4NCj4+PiBpbXBvcnQgX3RocmVhZCAjIHByZXZpb3VzbHkgbG9hZGVkICgn
X3RocmVhZCcpDQo+Pj4gaW1wb3J0ICdfdGhyZWFkJyAjIDxjbGFzcyAnX2Zyb3plbl9pbXBvcnRs
aWIuQnVpbHRpbkltcG9ydGVyJz4NCj4+PiBpbXBvcnQgX3dlYWtyZWYgIyBwcmV2aW91c2x5IGxv
YWRlZCAoJ193ZWFrcmVmJykNCj4+PiBpbXBvcnQgJ193ZWFrcmVmJyAjIDxjbGFzcyAnX2Zyb3pl
bl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4+PiAjIGluc3RhbGxpbmcgemlwaW1wb3J0
IGhvb2sNCj4+PiBpbXBvcnQgJ3ppcGltcG9ydCcgIyA8Y2xhc3MgJ19mcm96ZW5faW1wb3J0bGli
LkJ1aWx0aW5JbXBvcnRlcic+DQo+Pj4gIyBpbnN0YWxsZWQgemlwaW1wb3J0IGhvb2sNCj4+PiAj
IGJ5dGVjb2RlIGlzIHN0YWxlIGZvciAnZW5jb2RpbmdzJw0KPj4+ICMgY29kZSBvYmplY3QgZnJv
bSAvdXNyL2xpYi9weXRob24zLjUvZW5jb2RpbmdzL19faW5pdF9fLnB5DQo+Pj4gIyBjb3VsZCBu
b3QgY3JlYXRlDQo+Pj4gJy91c3IvbGliL3B5dGhvbjMuNS9lbmNvZGluZ3MvX19weWNhY2hlX18v
X19pbml0X18uY3B5dGhvbi0zNS5weWMnOg0KPj4+IE9TRXJyb3IoMzAsICdSZWFkLW9ubHkgZmls
ZSBzeXN0ZW0nKQ0KPj4+ICMgd3JvdGUNCj4+PiAnL3Vzci9saWIvcHl0aG9uMy41L2VuY29kaW5n
cy9fX3B5Y2FjaGVfXy9fX2luaXRfXy5jcHl0aG9uLTM1LnB5YycNCj4+PiAjIGJ5dGVjb2RlIGlz
IHN0YWxlIGZvciAnY29kZWNzJw0KPj4+ICMgY29kZSBvYmplY3QgZnJvbSAvdXNyL2xpYi9weXRo
b24zLjUvY29kZWNzLnB5DQo+Pj4gIyBjb3VsZCBub3QgY3JlYXRlDQo+Pj4gJy91c3IvbGliL3B5
dGhvbjMuNS9fX3B5Y2FjaGVfXy9jb2RlY3MuY3B5dGhvbi0zNS5weWMnOiBPU0Vycm9yKDMwLA0K
Pj4+ICdSZWFkLW9ubHkgZmlsZSBzeXN0ZW0nKQ0KPj4+ICMgd3JvdGUgJy91c3IvbGliL3B5dGhv
bjMuNS9fX3B5Y2FjaGVfXy9jb2RlY3MuY3B5dGhvbi0zNS5weWMnDQo+Pj4gaW1wb3J0ICdfY29k
ZWNzJyAjIDxjbGFzcyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4+PiBp
bXBvcnQgJ2NvZGVjcycgIyA8X2Zyb3plbl9pbXBvcnRsaWJfZXh0ZXJuYWwuU291cmNlRmlsZUxv
YWRlciBvYmplY3QgYXQNCj4+PiAweGI2YjMzMTMwPg0KPj4+ICMgYnl0ZWNvZGUgaXMgc3RhbGUg
Zm9yICdlbmNvZGluZ3MuYWxpYXNlcycNCj4+PiAjIGNvZGUgb2JqZWN0IGZyb20gL3Vzci9saWIv
cHl0aG9uMy41L2VuY29kaW5ncy9hbGlhc2VzLnB5DQo+Pj4gIyBjb3VsZCBub3QgY3JlYXRlDQo+
Pj4gJy91c3IvbGliL3B5dGhvbjMuNS9lbmNvZGluZ3MvX19weWNhY2hlX18vYWxpYXNlcy5jcHl0
aG9uLTM1LnB5Yyc6DQo+Pj4gT1NFcnJvcigzMCwgJ1JlYWQtb25seSBmaWxlIHN5c3RlbScpDQo+
Pj4gIyB3cm90ZQ0KPj4+ICcvdXNyL2xpYi9weXRob24zLjUvZW5jb2RpbmdzL19fcHljYWNoZV9f
L2FsaWFzZXMuY3B5dGhvbi0zNS5weWMnDQo+Pj4gaW1wb3J0ICdlbmNvZGluZ3MuYWxpYXNlcycg
Iw0KPj4+IDxfZnJvemVuX2ltcG9ydGxpYl9leHRlcm5hbC5Tb3VyY2VGaWxlTG9hZGVyIG9iamVj
dCBhdCAweGI2YjNkOWQwPg0KPj4+IGltcG9ydCAnZW5jb2RpbmdzJyAjIDxfZnJvemVuX2ltcG9y
dGxpYl9leHRlcm5hbC5Tb3VyY2VGaWxlTG9hZGVyIG9iamVjdA0KPj4+IGF0IDB4YjZiMTU0YjA+
DQo+Pj4gIyBieXRlY29kZSBpcyBzdGFsZSBmb3IgJ2VuY29kaW5ncy5hc2NpaScNCj4+PiAjIGNv
ZGUgb2JqZWN0IGZyb20gL3Vzci9saWIvcHl0aG9uMy41L2VuY29kaW5ncy9hc2NpaS5weQ0KPj4+
ICMgY291bGQgbm90IGNyZWF0ZQ0KPj4+ICcvdXNyL2xpYi9weXRob24zLjUvZW5jb2RpbmdzL19f
cHljYWNoZV9fL2FzY2lpLmNweXRob24tMzUucHljJzoNCj4+PiBPU0Vycm9yKDMwLCAnUmVhZC1v
bmx5IGZpbGUgc3lzdGVtJykNCj4+PiAjIHdyb3RlICcvdXNyL2xpYi9weXRob24zLjUvZW5jb2Rp
bmdzL19fcHljYWNoZV9fL2FzY2lpLmNweXRob24tMzUucHljJw0KPj4+IGltcG9ydCAnZW5jb2Rp
bmdzLmFzY2lpJyAjIDxfZnJvemVuX2ltcG9ydGxpYl9leHRlcm5hbC5Tb3VyY2VGaWxlTG9hZGVy
DQo+Pj4gb2JqZWN0IGF0IDB4YjZiM2RiMTA+DQo+Pj4gaW1wb3J0ICdfc2lnbmFsJyAjIDxjbGFz
cyAnX2Zyb3plbl9pbXBvcnRsaWIuQnVpbHRpbkltcG9ydGVyJz4NCj4+PiAuLi4uDQo+Pj4NCj4+
Pg0KPj4+IFRoaXMgaXMgb24gYSBBcm12NyBkZXZpY2UuIE9wZW5FbWJlZGRlZCBsYXllcnMgYXJl
IGN1cnJlbnQgbWFzdGVyLg0KPj4+IFB5dGhvbiB2ZXJzaW9uIGlzIDMuNS42LiBJcyB0aGlzIGEg
a25vd24gaXNzdWU/IEFueSBpZGVhPw0KPj4+DQo+Pj4gLS0NCj4+PiBTdGVmYW4NCj4+Pg0KDQoN
Ci0tIA0KTWlrZSBMb29pam1hbnMNCg==

