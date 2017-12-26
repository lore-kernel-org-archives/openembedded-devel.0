Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 17992 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Dec 2017 21:20:38 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10106.outbound.protection.outlook.com [40.107.1.106])
	by mail.openembedded.org (Postfix) with ESMTP id E608562133
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 21:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=n9ySaPBcVmJu3bXKe5QheG91cLHvhJXjqN5SIpsJxaQ=;
	b=M3WJuKryjgSJFxO0HxITc9znY2erq5C1zeVzOuMzzP3nfjVIGMLcy4/AqugoDj1uK95/8qdvVhbxeePzANpFJ9JuP8IaWHX4j7kdEBSolC8McYYazwgwLtcdJEpmNIC5fat/sBayBTPovB5BXdwPTkO7gaYu0QQyVrFUEdV/AqQ=
Received: from [IPv6:2001:1c01:c06:100:b8a7:89cc:996d:7441]
	(2001:1c01:c06:100:b8a7:89cc:996d:7441) by
	DB5PR07MB1061.eurprd07.prod.outlook.com (2a01:111:e400:52c7::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.366.3;
	Tue, 26 Dec 2017 13:49:07 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <1511264578-10324-1-git-send-email-jhofstee@victronenergy.com>
	<CA+chaQe+J6XxOyDV1jcRL6g6R=Z6ZHBrEkECqUgbLc1OA+Xkvw@mail.gmail.com>
	<20171223173653.GA4390@jama>
From: Jeroen Hofstee <jhofstee@victronenergy.com>
Message-ID: <e3429f52-4b03-84e0-8366-d9d0bf233704@victronenergy.com>
Date: Tue, 26 Dec 2017 14:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171223173653.GA4390@jama>
X-Originating-IP: [2001:1c01:c06:100:b8a7:89cc:996d:7441]
X-ClientProxiedBy: VI1PR0302CA0010.eurprd03.prod.outlook.com
	(2603:10a6:800:e9::20) To DB5PR07MB1061.eurprd07.prod.outlook.com
	(2a01:111:e400:52c7::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d5db705-c41e-4481-3abd-08d54c676f97
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020020)(5600026)(4604075)(4534040)(4602075)(4627136)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:DB5PR07MB1061; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1061;
	3:cpHFycgCcuFXYBOqTLvWDkAaSyzAnm3yTqYOnXp86Cnb5+peouYp9QuOqw5E6HzCSE/+jZ/0S3JrTFO6G/y3qRkqZ1uPDag3ZdTnyxO+Wl2W6+JZePNG9mzn+rev40eh5kp07WedYvbeC7NqICOhweFWClXK6fHq5ZxwWrhNBV9qnGsog9geymrEUEu71aBsWfFgcCETLr/nWenFQ/599BaCnuPnsI77KZGn7uzYM6CcCoJ9wBb6cEi12SseuoFB;
	25:ZbWxQYWVigmKlP9DLTKMpj40+PN7pGix0v8MsNOxduZqJ9d1P5ufMp4h1l78FXfZmKmBWdWFOjCLHswefxTNgiBv/g1iIYY4bpa7VYIt6lFyzC6yzIOnTjiHVoSV+ox3A+e3pT//khRQtmsmsaJ8q179OtOqghlJMljbyE2ORPK1zdpF/wFGDBv+FA62v3qDiksG1Tpk4mAxHAnKj2utR0AJ8sMnSzVFyiAdP/JiUwOHOkcVR2ReGjdfifO1MepTB4dqfTDN9uNoYDAopWjKfkaFvJN0BrgtuePiRVQ22+lV8cbcP8WQrb/i34PCZ8PUTEcEoJhp2sQ2iWfJHMGBPA==;
	31:CgmFBalMBGnzi2jfchLn+FQt9vT4uaE4tEuRNhoCzBtO3lqDCv+1zfNaEvgWI06MSpd9zB5MEeCuX4zIXXJ5fiGPDfNx4k4VPJHTQ6WUwqya1QpOefteedPRjQf2woBJNdPsO9NIcSh2cvqgwfXpp3IiEVSLMvD/tHDcN6uQfC8oYpnZY7ysVKXStVyWkmiNjpPoOJl2ThEhE/o6bIZ7HqBl1YdjwZ2EcxhQplj9hx8=
X-MS-TrafficTypeDiagnostic: DB5PR07MB1061:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1061;
	20:6W2+ftwRCsPGmFkRxZinOi6G12Aev0pY9GIryF+3VyRWBb3HTX7kWkdfyPlULyHJpsyOCnH2d1aTMSSOuMhTzq/nmbwDT9Vs5RS4ea9fQfLzyyNKV3mh89wH3GtpG37ocHd/FdSsDqSQazVKcVZyJuFjVN+IZ3ojNM4H/3sKilJM25g5auOxR7PvwsEocZgoVPZQgZkqRvgbRldTy5eUy0jboYqLozvJtyGGPIGNHsEMMbeGSQyoC3UBGzYVEqlY;
	4:oyyr2nZTPsW5Fu0iX/mq7kTb/ySYf/DNwuT91UHCkxWXwiROFm6/h+Wt4kygNRs3a294BoRdYnW1OkippAov/wxeOgL+m7CyHrjQCW9OoT/P6Uev7U6zXoLRDVfABnI6BP72SWJS0iP18nhQGfcC11wInc4KEjYovg3d9Iac75m/onB69psVo8QcLJM+zyrzRV9xAQwDJ7aPk0n4DXzEVt3OeyeBEZ0WxR+k/GAo3G+5SUiumoMyns2iealEvfFEDmSACNRuSrXHZmzSsza5zw==
X-Microsoft-Antispam-PRVS: <DB5PR07MB10617CDE946FB101519F0953C0060@DB5PR07MB1061.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231023)(944501075)(6041268)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DB5PR07MB1061; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DB5PR07MB1061; 
X-Forefront-PRVS: 053315510E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(39840400004)(396003)(346002)(376002)(366004)(199004)(189003)(24454002)(106356001)(36756003)(229853002)(81166006)(81156014)(2950100002)(67846002)(7736002)(6916009)(68736007)(86362001)(65826007)(39060400002)(65956001)(23746002)(65806001)(31696002)(105586002)(47776003)(6486002)(1706002)(230700001)(50466002)(5660300001)(6246003)(52396003)(83506002)(64126003)(52116002)(76176011)(59450400001)(25786009)(6116002)(478600001)(8936002)(97736004)(305945005)(53936002)(2906002)(8676002)(53546011)(386003)(58126008)(4326008)(316002)(31686004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR07MB1061;
	H:[IPv6:2001:1c01:c06:100:b8a7:89cc:996d:7441]; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DB5PR07MB1061;
	23:tccGtrkRwLSUs6pC59dKda1MXsmavxkcIIGBI?=
	=?Windows-1252?Q?ijUHRzrZcOKDO0z7AhPC7VJBy/so0xOlpWE+vXruZPdFz93u+xFD39K5?=
	=?Windows-1252?Q?jpDzmmaNdC3GYzPCg6yQAPfLNIl/HWWuvyqWRVpJjSXn1sAsimieDhNi?=
	=?Windows-1252?Q?iRrKynYLMPnPjdI2Xlt3Cun4Y2WNtk+8RSTKJhZDQ8IXLVmo9Im6Hnj+?=
	=?Windows-1252?Q?tUvAFH8T25sRzF36g1WbBVpKBE86vkRRFY9ktbR0RBympo6RxylehIdt?=
	=?Windows-1252?Q?br+IxFpeU8UsRV5XfZFgSFCDU/o0/pEz01/kIyin4T/jTBeyaWoR0N4J?=
	=?Windows-1252?Q?xWJkzftyofOegmhKeoswMtV7TAiVDyNHosnylqj+wM/419yatbJCz6Ol?=
	=?Windows-1252?Q?RGFVubXPlGXNHVROrjje65SXqzho1N0Qv1oqQel8BJMaDoV2PEPZrw0F?=
	=?Windows-1252?Q?uOT7Z+Zlqb+s7koEMBE1dn22nv3jediuq2tfmNIFEj/L9qlbMX74Phvv?=
	=?Windows-1252?Q?bIU6R/yYf5TAciz++AHFTndcKynceGFC8tMqquU4hTfQlPI2+OcLLSzV?=
	=?Windows-1252?Q?s7bOfKe0WAqSNGaFYH91lt5k75fPZyxp6X/u3tM+2n5fOBIqq5Iszzfi?=
	=?Windows-1252?Q?XFlVRGAml4mKyYYIWzIuQ3QpV0fsgmVuilyu+LGrD8edhVI1HCOYts78?=
	=?Windows-1252?Q?l1CEzD9sTzWkJS6FB6elKbrBsuEOggEkZbvKP47CHnqvZIrqltP5hGqw?=
	=?Windows-1252?Q?6KwamAL0ZuS9LmVO9GMDUXXiCh3zUmLcNEcuiZv10Q/6vAke2F3wiYUu?=
	=?Windows-1252?Q?WSFVdDcMEnA5SM01eX3ASFc6Rg4g3hRMNmOsXpq/CygIM8fyXsX8EkwA?=
	=?Windows-1252?Q?Td3GT++CqZgcLG4+ew3UAjRFcHZOt2zEwLY5CKnA1jbd4rADn21eGYIN?=
	=?Windows-1252?Q?CUwR4Qz+7YQsE/WOv3wWnzUP4hYckTlDGSmpjZPVf+UeOTG2X4g9q/2p?=
	=?Windows-1252?Q?hDdtNKt66tujbkKB1bw3AObju1Ipp+N+bQG9MtFfF7quxfkYTKtd8ogF?=
	=?Windows-1252?Q?jQstKmBp3W22AM9Hg98P0FgJrp2F0J+FcmEblZKD/vs9kDlBgoPYVnV2?=
	=?Windows-1252?Q?BaniXCB10/sv5XwMSq4deU6GYoVan8OEDiF5B6mdFtr22/R9M3rykQ/p?=
	=?Windows-1252?Q?ll6XyIeWtT0oPhbmLWljeNyAspbP20jO+mh8gXBHshqso6lYt1OKc7lq?=
	=?Windows-1252?Q?mZ1lUPwnz1ctpjD+HAKywk5nioOPHqqwu+dtbD0ZwrWeeVI0BS4KDdz2?=
	=?Windows-1252?Q?m2XvptkEkKcAd+cJQycL0OrbGZhGh6K1CnKTs3FSQyKll7QfJmdvplXF?=
	=?Windows-1252?Q?xVjgpPsqe7t8pzITC+yzWfY9v1HtnOMzw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1061;
	6:mHfGOnCNAxo2th4yEYVEtR8NEIZbKxiY+eMolhuHeaSzbshlpydlBvPZsY2+vmcXwakCGPvu0n7uhP+1sMhy+Fak/Vyb4JAzGDnqcv5irddc7Z0vtwWf74SVAxfa4S/axI3D8LudXsKpaGKZ/EQS0g95BSxGfVMAd2Jm+FZ4vIFNEJGGRibtwsoybM0IH9ygASMnzTMq6+yVJtJApTreDA9dKikQcPjikXguPfrSkehwTLMsGYy1mn5AA44lnagxTc3j8pCENYtkhoCi8B29IIxaXwpSKFtYdJzrbSqihQypomg7n1kOtGtpI+8bIWd8rOFAbd7r3n08nM5A5OCBY5DYrUl9xDteSy7wtqMIFP8=;
	5:agKbUs5lhFwP3m/Beb/KNkFhe7OvlvS9DJyPL7goh+Spj3GvsQHURJKt5h67ymzfY+2M4b+U0szcnITv/ZoE3p0mr1VVmYg3GEJ7GQkkpitHMACCdFxWvYuMUBK03L7pcVGhwavBkGmzh5jJvQQ8BzWL6ANuYfFl3xoAdG8L5eM=;
	24:YMAKuevFkjLKLqwTnoqdjhfgHGvGaKh6Zmj+ds2/+fM2tFDSXTDQTLTzbN+osdLpw4SLgU6isbAeLHPltgxCpDaQbBolKRhbpUg8S8PlIAU=;
	7:ax9/dXn6A5kNVRZwGU8G1K3xfvxrE9rFvOd/daMJ4Ho4n472yLguMWaJb2+ubbW/pfv1jMP3QUiedtHxGXsJeXjLjCPxOGCQWQDRmFgzxpvbr8iH2HXAKrzF6W9czYJ6TTjvFluKHAlaRB4rQCFjeGVTIFVtbznjWaSitltVzrQBEjnWyaGaJ5ywRP1ia8Xaj5EqQxH5/50k0iMDQigiyo5aecguoo8JcKkOc+T7zkPLB8EM7GsS7otvU2oN/5Zl
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2017 13:49:07.7036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5db705-c41e-4481-3abd-08d54c676f97
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB1061
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtdeclarative: fix build without opengl support
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
X-List-Received-Date: Tue, 26 Dec 2017 21:20:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Martin,


On 12/23/2017 06:36 PM, Martin Jansa wrote:
> On Fri, Dec 22, 2017 at 02:56:09PM +0100, Martin Jansa wrote:
>> Can you please test with master-next (where is pending upgrade to 5.10), if
>> this patch is still needed there?
>>
>> If you want to use it with 5.9, then try rocko-next (with pending upgrade
>> to 5.9.3).
>>
>> All my qt5 builds have opengl enabled, so I haven't seen this issue, but
>> the patch as is doesn't apply on top of 5.10 upgrade (so I've just dropped
>> it from master-next).
> It doesn't apply with 5.9.3 as well, so I'll drop it from rocko-next as
> well and wait for you to resend it with indication which branch actually
> needs it.

I can confirm this, since 5.9.3 it is no longer an issue, fixed in upstream:
"Fix no-opengl builds (fa52bb665d6beb77)"

Regards,
Jeroen





