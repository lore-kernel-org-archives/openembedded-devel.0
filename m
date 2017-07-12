Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0065.outbound.protection.outlook.com
	[104.47.37.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED12A780AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=h+AGzMlDDGgjfTel6Fku4v9mlsWZQVkMNyNxctCxa48=;
	b=DyniEmrai1kbV9pPRPFOZzXHQGFGk5h7vUTShcAV63jJn8k/AkSl947UGlNSxjGcMYte+Epvn+8WALui+FEFCiLNEYgPqDsTUH6qcVBoxM+oAHCSUd03twPHaQmwtk+eGMY4Ts5W2Cu4tPOCQogpjngqR4CMVknVurCDjToGVtI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Wed, 12 Jul 2017 16:32:45 +0000
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20170711181353.4404-1-raj.khem@gmail.com>
	<a5e067ca-4cdf-df31-d106-de26b5637df9@xevo.com>
	<CA+chaQcKpDbFe=iq=BbKg4BiUrFfRHBHJePAEOxeMny9fUs8Bg@mail.gmail.com>
	<CAMKF1sq30C2Kr9JsFE1RqeGsJOSC-NvvZeCDb+dJgdf5R5FoAw@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <f3435c5a-4d5e-1b0f-6e53-31e1729d0779@xevo.com>
Date: Wed, 12 Jul 2017 09:32:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq30C2Kr9JsFE1RqeGsJOSC-NvvZeCDb+dJgdf5R5FoAw@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CO2PR04CA0063.namprd04.prod.outlook.com (10.166.88.31) To
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 107ee497-6695-4922-6df3-08d4c943a044
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	3:r2LptyJN1aN640Xhh1bUW1XZEdeZEtZP8Nr62VaeCCpoIiLQwZdnG+7Yrhz5QEvmak5ynUKCBcQUnrUhXaeEfbC8iSyIZcr5OMsragOTH4vs6GZX6MnzO8mP2iepcrQ3ce6S0zgxjDLV3iSv+ZPbwJJSB+U94NI2cZFSnrYbaARxTLVqDr/OIUD1+z6bOMgq83Ozh7n7aiyYLAZvpnbmNVZjUuwGqGL6LO3WfPB3SIN7cbA5gWjbyCCXJ8XhWkMpnmu/Vsd3y76R/hLHkEnHV87lDk1Us+sAdcnfJInALctB1sTfw4Tpo0RsQeBRjiADQp7etQuvy+9yxwgYcete6KpaoUQFxfDUbmXXMZLFMn4+7kYJcfqxntHTw4R2N1bWtutkM154Kaq2N4g4Kxzl0pk7A2ZlCcqutXEu4yeuCDJjhuB6hfcesOymElX15IeFF9aG9YvNoZpNqnk3hJjVB70Pxv/gJz8TAJGz8KZRi0VldD0GEUW493oPLALnbIOsK0GX78k9w0lSxRl5jh11CP8fxygqJE/ccYWove8zTG8thJwliw+cyDQ/iF8JjiBFB0770taymx4TblCTj9HKgITTqjg74oJeNSLVml6h3e67CDGkgCougE69Z3DB/29ul+D0PiBXfOOMwjjPET5MiTUB9Eh8kPWsYT0g0pXpdJZDeCEMoAWKOtHRriWyD8Tb1VK2AB3vIsdeoECfaB3Ket25UOJA5AaQgSN4xKzVTP0=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2944:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	25:PyH43g3JIJTqeVkLU3D9fpsrIFlIj1CIvhtHU+JO9GmdRvx9ZFsuvmb46OWwI6N96EHM1lkqmuWm8mewIBlIhOxaL/KwNQmgFCZ7lNYIZ7KKFYDGUUJ412vLc2mLVCYYBtgRYcF26YBy9AEdc8hXtT7kecw7MyCXFN6FjZ2xzRdQXRO1Ew386pOyUEWxV11hG2hGI+Of9D2oDXtwVtAHGHK12sESfOgOsQpiIq2+gls37ZtUaP8+6JMBmPBqcKWm2nZRQXa3qYL1YJcMcEu7UAioUUQF3wvexcxwx4crR56Wm2s+eYtki5YdG5iELBE7qZTH5gO7cXlX+MXELC6u2tNnhbi6bROzCFrmDyuiPKtSA96R5GxQKjMokF5RjeF+HfTNg2RML5pCBmAvYzfn4jvP77EaWxI8cxeBmJCkKvE7WSitPTE+dFKgd1rgl8RA1ug6OdRYsul9+AUbRU2tqO45wXcMZnduP6qiPwUXuzL/3Rnrgl9QUv5Mk3e/jsQ51S7B649MoHS/yEhDzSWsAoOz6aORnwZL/ZHMHqpvN1xmGOYngBH4O9mTeMk6PXHWiMGGMi0ypntXaVJJN/QuSCTAkoDAJbAHGmIhM/YKvGjm5xTpFkzzBcI6BvOzXiNcPvOjf5O5AV7zhMfi4KPh42qswDdT8Sgwy1G6Zsglgr/Qe/t77TVVGks1A/4YhcfMZheqRlol5y38LmR35DWrKQJLjU6NiJnCvHgLPAne6iJuoz366P0leksZWEu4caNYCNeL7v4sP0tLttab7DTrzpJ7UZODs2wM6q86VClRRPMkHO28Ik3rRq+AR2QrBaWgJGxN6mvEyjIuMh6xkOgJcmjyXVfJg/dTWppoD6wYfhqFbhHxJ3sBxrT8Vgzfjj3DBeL9akJO8w3EqI24ZdQtItXAlcR/3LOqDUNsCxPX2ZA=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	31:vSw5JVvKdj4sAoixetQ0TxSSiQmJ7946ITTAqIPzOQdjHqkRPvkpx+SpX3xwBizw2y/ZUBAVJNHux5eTgea13UP2DFDQ2f7r+kG7TbQl7A6JbOyOR4tMhK7cysOIhetPcsLFUXGF1HTig0x7fzYaYqRzv5sPA3J/EawoXWVLfUdouchzvofrsDck1OUOct3YsKLVu4ADkxJ31mcq00ti7gl7GnYhWrP7IITdmZBdQg3PD0iOCU7IAEcfvQaBhIYKo00ue6abzRU1UjGK0Vy/AHhG6tg8UtOwf5SrfabcDQ1AknUNCAOE9/SFSdTIppyhDwfHXeL1NvVAFW5nalRZv8ygtFKZA2MoL5as1N/E+AijWvlWCmskWwZUWePMlSNPcF8UIOhJHcU6y1Z5dNWXEiKpCfEk3QlE2ufs1FIlD9bLS87nBnmeFpIaUOaYRMis9G0zFJ8C5jj33C0uGphR9UQM5dbsJOvjPPqDzjY0b7t4mdcGpoAV/vmMaZI0x0phFpS5DvI3NXtQO2Y+x2ZgoknZHOqtj5H+CanjbxFaqPceiOvfq6hbam3MmDzlmwdrjUkKDTX+b45UYily6N0/XXPJavVtM0dtwx9uaa0vCk3tyC9oXMWddUKut4qbblHoKak6L3XiLBiAtaZVO0g3ZvjOpE5NfVEcjaSzy3TDypqoP94aFCUy7pKcUN2pnLndyqBdy+wzaMuYigcBj+DgJw==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	20:ut/RVvjHBYrYUhhU2Vuf7+L/ogXOdXog9T6pg8NOrG6bHZilrkmOXA/4e0+n5Y/33kcOrt1acji6ZH6T17wJyZCwwpbe6o2n4JYS5nRoA7TMhNTGIVPhwAyE7TbmdkoLKC8eh6gNvhNc4XI77etNaatqT/nQHj37kxdgRDOaPqdZGiFpZC5BJtfjdntSzX5kZ4QJpoApdxjOe1jr7n1/Nz7XL9MtzN2fvw+aiDii1I5d30OzG6/rZNLm4mByY52Dlz0tSQpAWYyfdAR2XWHHS+0TW8RnC+6/MRJu3B475f/Dj1QJ2WxMWPduvMl/ipjdH7zp2wy0GYrMR4Q/lTRrGm1sc+0Mz0yVdvQsKDUqZX8MkPCTTIgo49OWdSqj0t9XKQzt702Tg3g9X4tuO+AyeRBtiyHXsvz6sIXff9kI5FI=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(264703809997249)(8415204561270); 
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29442012AB2E334B75923427ABAF0@MWHPR0101MB2944.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(2017060910075)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2944; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7NDpKRjQ2cXVuU3ZGdDQzcDRHb3Y2OUgzYkhl?=
	=?utf-8?B?cnZnWVNtOXVCdVNXa0F0UmF6L2EwS2ZBNnNoc3lzVy9pcVJQZHNLN0IwYVZI?=
	=?utf-8?B?OE9FOUZIOTIwMUZZaG9NbktKVXZjSi9nbE5LOTVYYTF5cS9SVytZM1lnYlU1?=
	=?utf-8?B?bllqVmFzOXNyR3VRUm1GQ2VKaVlQaG1JOVNrazBwUDUwVTVLa01tTVpURlZn?=
	=?utf-8?B?Vi9IM0JnR1d1NGgrSDhPdmNobWJORUZpKytuN0VXNUs3TkgvNC9ab2QzTXVF?=
	=?utf-8?B?c2FXVXdjNHVLZzhTTDFjWTNpWXF2UEU3cmhYd1ovVmRadmZuUktJNmVLbk5Q?=
	=?utf-8?B?eHRmelFFY3VWMlR2bHptTlBEa2tkVjdaM3gwck5nT01ubk4vY1hMSFYvT0xq?=
	=?utf-8?B?T1dWYlA4WHhmZGZOU0cxa29BV2hZVjYxUHFvbFRZYzdDcVVhUXZMdGoyUmlI?=
	=?utf-8?B?U3RBRWlLU2l1N09tMnlpbzl0YTZmNXVkV08rMUtVdS9xMmFUeTRJT0pYeUk5?=
	=?utf-8?B?UE9lTFBsNEtKNFJvczV6MmUvVWxYekVFS0VBZm9mSXFoOGNQaG9vNDFIaUxu?=
	=?utf-8?B?VHY3ZjE1UFJxbC9INERqenFwOWc3VFkvQXRYQXltNXdFbDd5VkRiSW5SMVFX?=
	=?utf-8?B?NVdwR3ZHRnJRUU0yQW1EQUpJdW5Kamwrdzk5WjRqTGMzTEJyUldNN3NBMlNy?=
	=?utf-8?B?NDhDenR2YUxBekxqSkpKdHU3V2NpVThibnhGcnpTM2FiOU1GNXJtQ1hTcHIx?=
	=?utf-8?B?OEVkUEVKcUpIa3IwYWV3MGg2aXdESDVxbXM1ckRPVnNNVzNUeXY0YVVicHBI?=
	=?utf-8?B?NE9kdWl6YXBqTlpIbU5ORmhhbnZERGhtMU1OcnpFNDY2R0hpSDNTVUxhM3pK?=
	=?utf-8?B?RXhPc3IxeXBHM2xIYjRUSzczcXY2L3FaSjl5QXMrblVNVTg4SlRjMEJ0aTJq?=
	=?utf-8?B?SWp5bEJIZUwvOU5ySzNLZXE4RGVXNXl2c080QkZSZTZvbkh0bzF1OTBBVVM4?=
	=?utf-8?B?dm1mV0piRWFKTTNza3BqWDVSbi8wdjZsTXg0d2dlT1p2S0c1TlZCQkdPeGJq?=
	=?utf-8?B?WUVxSGdnbWNzVlVSMWxURVJLMG4wY0VzRkRoNW03bUNyUXlpNTNGYkw2SVlr?=
	=?utf-8?B?ZC9FcTdlMmdYaS9JWDY2aStZNXZzUmQ4cG1hU3pHMjdVT3c3QlVYaks1WFl2?=
	=?utf-8?B?QzViY3NWYkhrYk5ON2I3UkNidjhlSnovaEVtemFzQ0JuMVorSS9IVnJRejc3?=
	=?utf-8?B?bUprTW1BakN1MkFpcEYrcVRmSXlpcE03cW1yYVhMSnNCVjNEV3hNTWRNVUY4?=
	=?utf-8?B?N1BJYUNYYy8vektaVzhkT3Rxa2NDZ1h1aDA5cytWeGVCTkZhM2dsZjB4Ly94?=
	=?utf-8?B?RzQ2RGhrR3lZaDdzQ2FHUGRDRU51aUNrK0dpQVMvT0YySTRoUll2OWlWVlhh?=
	=?utf-8?B?QWs3cW5qSVVYL01kSVhDcGNCRUh4VC92ek5DVDRoQzlLczk2RDgxeXA0dTIr?=
	=?utf-8?B?bmw5ZkkvU0ZIcFBPOU1RS3lKejNVWWRtUTNibGRIcVl6c202WVFnNEpXL21K?=
	=?utf-8?B?WlRZOXhmMTJCYmFGWDBSWTlzdC9iUFdmanJ6TGpFOGVqWWFGSllDTmdNbEZq?=
	=?utf-8?B?anFJbmxaaWloaXpjVGNRUWtPVE1PK2dEMUhvN3c5am9FQ3RRWk52V2h0U2ho?=
	=?utf-8?Q?nquV28Z2aiDphk1zhkTw2njS2NfvG2NJ0N372bqD?=
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(7370300001)(4630300001)(6049001)(6009001)(39400400002)(39450400003)(39410400002)(39830400002)(377454003)(24454002)(31686004)(7350300001)(36756003)(23676002)(2906002)(4001350100001)(4326008)(42186005)(6246003)(64126003)(1720100001)(2870700001)(93886004)(38730400002)(7736002)(65826007)(189998001)(966005)(50466002)(229853002)(50986999)(76176999)(54356999)(5660300001)(81166006)(6666003)(53546010)(83506001)(305945005)(53936002)(8676002)(3846002)(6116002)(25786009)(33646002)(478600001)(2950100002)(77096006)(6306002)(66066001)(6486002)(575784001)(47776003)(31696002)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2944; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7MjM6R2Yyd3dpSVFBdytidkxiUUZqMGJzTWxI?=
	=?utf-8?B?VC9kS2JIQUZrSVozdkxQMGZYUDJ0eEdyUy9yeDRyMmlaWnV3YUhKQlNkUTdy?=
	=?utf-8?B?YWQ4SHNrZnF6WmpnbW5PL3JOVVNpNy8wNzJSS2JSTFE4NmhVUWM2OWxQNGh0?=
	=?utf-8?B?eUg2RHg5T3FQMzZtU0FVQmx5K01wcVdlMTErOC92aVl1dmNxTDM5N0FZK2dC?=
	=?utf-8?B?S013cmZVMEtSMGU2MjJQZTFaTXpCY2ZrYzlUMU5rMnREMVpqQ0p0Umk5c01j?=
	=?utf-8?B?NzlELzkwWm9hcW5yMkFicTRRS0NROU9ZcmFpVEhBMUZLVjN5bWZIZkc4VFV1?=
	=?utf-8?B?aStoV3NmMDBuTlNYUWE4VjBuWGFPNG9ZbXF3MStKRTM0NjA5eCtTUXd4N2ZB?=
	=?utf-8?B?cTlXSGRaNGc2RFlXeHdIcjREaFcxU3hwMGo3TjFxYlkyWkxOYTRPaCtOSWZi?=
	=?utf-8?B?MmlzeVZaT3JZempzZHVRNU5FTkY0SHlFdXRyTi9xQ085eFg4Z0hPczhtbDlI?=
	=?utf-8?B?a1E0UEhjd1VTcExvMzNPTDc3ZzVidStCZVlmejhUdUtmcy9jRThsV2JKMjBy?=
	=?utf-8?B?UVhDVmF5MGV6TisxMXZ1bHllbFd1RG5xd25Rd3Y3K2FHVUsrRjBtYkJkYjk5?=
	=?utf-8?B?OFRYYVJtWWdYSjk4V2FvSzBiNTVjUER0ZjRGL0JEOXBSTGowWDFEMlVJaUxs?=
	=?utf-8?B?UVJEbHRtR3QyK1pETTdNai96TnVFaU80ZmxiMzN4dDZsMlpSMWlFUUxuRlc4?=
	=?utf-8?B?Ym1UKy9HZ01maW9jcVZkSVppcW84Zm5kaU9oUm5UWlc3S3hmZmRCQUpVYUNP?=
	=?utf-8?B?LzdpWHNpY29qTTZkSHNBcUlzKzg1UytZRUZzSm0zZ1d2azRwYThFdDl2TDBV?=
	=?utf-8?B?ZHZmSWRpVFlIMTYweDdmWmppM2pSdzVWV1lrc1UxeFA0YlhwYTVRZ1FCejQx?=
	=?utf-8?B?Z09oRVRTNkdVcmdBTzRDSytvSGNwak5UT2k4MFVLeGQ5clJZSVBrUjBwdUxs?=
	=?utf-8?B?ellKWU5nS3RhTDU3a3lJUm1vM09tWVM0MEJNUzFyN0I2VHJQMStYSWZoYW5U?=
	=?utf-8?B?V1kzRDhwMkdUVEFrSHlnK0JKZnprOVlReUFlY0liWnNkbWVRZDlEMWQxb1hD?=
	=?utf-8?B?aGlNdWkrYnBUMFcyRXEvMkMxblA2T3JDNng0L1dlSlhMM29SM0ZGUEs1SnR3?=
	=?utf-8?B?eGxOVmF6Wk5BN0hDL0p6M1ZnT3lTcVBmVDA2NDZ6OHB4T2J6OWtKdTN6aVhJ?=
	=?utf-8?B?VnpZOWtmWDd4UnhuWVgxUWd4akRSWUprY21LdEorR0toOW9SMUpjd3o0cVNI?=
	=?utf-8?B?dFFiZXN1TEw2ZXZBblVXUk9MaVdYeTZnaHFtRUJldkRNV3VHbnA1WTJNeGlX?=
	=?utf-8?B?RGVTMm1KME9DYk9mcjF4K2N4UnpIZnFtVCtxeDJ2M0xwKyswZFpQd2VxWFVq?=
	=?utf-8?B?R1ZRZUJxQWNneGx1cmQ1MXdFdC9paVM0YWlQTmtpRnh3RjBNOUhnK1htZ2Y4?=
	=?utf-8?B?eG43aGQwU3VRVnY5K283Y3lnVWQxdFgvV3U0ZGZmNU1XUzYydmdiQVNsUDk0?=
	=?utf-8?B?L0lQbU14N0pDNVFCeHJuNHMxejVOM1pabzl3QnFZcWFjNjAxeWlKSUVrR21m?=
	=?utf-8?B?aGFLSjgvV1hBdWltSmVmakFtZXpVYUJyb2JWSHlNVVRTVFBJaXZJdCt2QVhX?=
	=?utf-8?B?SUFzSTNyaFFsYWxiZ1A4M2ZQZ0NJbWJCeGc3T3laM251TitmdHYvUm1RY1VX?=
	=?utf-8?B?THlORzBuTXY3a3JrQlV4MXhPUjNaUmZsUFBNcnA2c2JQdW5rUG56dmEyelIr?=
	=?utf-8?B?U3ZjcnJ5U0QxWWlnK25MUlZ4UnkxM2NBYno4MFAybzdBYzdPdz09?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7NjpHU1NieXFkYXJqV2RyWTBuM0hsVzlIUnkr?=
	=?utf-8?B?MENreXZ1RVFtak0xb0FqdnMzQ3pGbDFQbWlNK0JsVWNFREZUOERGdUtaaU5S?=
	=?utf-8?B?VTV5UmlsblhaMGJxWUoyNkptYTFTeG9xMkNtMEFBZzY2eitRSUJTWVNBNG5J?=
	=?utf-8?B?bys4MkltSDZ1YzZsMGFXaDl0R1BnamV3dno5MzVybWZ0VHdveVVFK3ptdlVJ?=
	=?utf-8?B?TCtvSTJRaGFJa3dCeVB4VkhWcGFLYUNRLzNIc3J5TlNmZjVNTzRabExCbGVY?=
	=?utf-8?B?Ry9PTGd6R2Y2c040RktJLzRoMnR0U214SjIxekxlM2VNUkRaZTBZKzZrdzFa?=
	=?utf-8?B?djF5bEE4ZzVid29OWkxvUndBWGZKeGRNcm9tMzJ1dnFoMkIrNWhSaEZBcGdD?=
	=?utf-8?B?cXZMS1lDNjRCNjZKeUdXc1BjVlBKSGQxQWgvb3F6TEs2bGR4Yk5ydzMxc0ZE?=
	=?utf-8?B?NG1lMEVSY2g5MlVaVytnN2JsNzJ1SUpNY0lYQ3o1SDBUQkhUTGdBZXZsem1H?=
	=?utf-8?B?UDkxd0paSDNocGRPNXhXZWx1c2cydG5UWFhncUJuRXFvMjBkamVLbXM0K0J2?=
	=?utf-8?B?S2MrMWxVM1d4bXlnMHFMNkZwMUVMTnZZQm5yZzJkTURzeGw5V1Z2elhRbnRw?=
	=?utf-8?B?elNQYUk2SUxSd08xWEhtVkFqMlBUREthSUZtUFZJVzc4L0ZRUzd1cGEwTmEv?=
	=?utf-8?B?anFrckhGZWhXK09BMVZ3VHNiVWxsRUlTTmsvRTRoSllkVUt2anhvVVh2THNp?=
	=?utf-8?B?M2MweXB4b3NvNkNLMEdScXdldlBoUnJtNHNGS2JQclNRVWNqMTJCdUtHaWxD?=
	=?utf-8?B?MVdMM01IREVZcjkrRzRQOUdRNmNtQ3pwWTc0R25PdWozN2E3K2ZURGZ3cHRZ?=
	=?utf-8?B?S2JHNEErNXFVd1RyVVRJOTdEcjE4dDdaUkJhUHJTUnVxMW11M1NSdndWVjdh?=
	=?utf-8?B?eGZ4V2hpS2VXUS94eUlDSlR6eTAzbWtKZFNqNWlWTGJkbStLaHByMWVhbGdp?=
	=?utf-8?B?WitMNUxndjR6bDNQekxoNEI4LzZEMlVEUkgyOHd6VDM2TEtRTzE1Z2xYSXo1?=
	=?utf-8?B?WUMzRjl0bmtWaFJJUnc0NUNVYVlpMlRKZ2RhNjFpQzRjaXhnL0hsaHZsVHZt?=
	=?utf-8?B?cEFCeS9IQ1MzOEVlL3ExVjl4SzBodVZiZktQZXp6SEtmaXRVLzZoZkxqK1hG?=
	=?utf-8?B?NFFBVW0yZDM3YXhTM3N2SnZJL2l1TCtaaVJpcmwrQVJaWXdzczZrSkNrZit1?=
	=?utf-8?B?S1hTSlczVGpUckcwbEVxR2V1RmprOTFsUFZYNzFnN1pxTzFtNTJBc2hDc1V6?=
	=?utf-8?Q?AEPWn/Zg2xcZtxu3lMWxJcqjyy+yGR5co=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	5:794EWMJ1aD6Emzol7UV2rfuZTZXljuiaSJxUTAdl6oEfwxFKTwxSE2QR/t28s+mPnFb8O6gFZrkqnuhmMTzlvvMZ+fCIf3DxrXFEqHZhdrpBRSaAQbuz1oIUz5BmeEsJwl4p6s+WK6wwYQKXbP3fmxculgEQ5oeJcIgG3K1x0ycvgfK+s2j5gzN+Yc/77K2lBRxfmvaEtReRlm93E6N2IDJo/xyaDYriT8lFnNGp3k2GddL/1VH+j+kzFiPJ71nrhsv/makQPWli/txHvhvm3TeH3QTFyeMECy3QvbLi7rKuSeSO3IHCMfhJCdx1o9gZTjkBxTdSihUrNsk53wWDFpT/FT1Tx7Kiy7EF2DhubtoGFGa3qibUha5xL803lSYEdyXLlBIiZSMihaee5mK9JUA5Cma6exRsRVv7rBpFzz2PzAsJ33+PlLxAaYk98D4aKCuRNCxQzlL0OFdUo4z8lF4xLE9/eKuHkQH/IBnPFnP2k6xRRXltNtBKPijieffq;
	24:NH8Zl5tDi07N2khYfbeEooOvOpx3pfSFnKe6ugrWw24Nwf84CfVCja5FL1KzMdPtV9dmC8oBGJrfDh5pccbVnnRKj9TkyjLzrqZFHRedAxU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	7:EQrpDTmWSr2UljSbU38ZGSFB7hvMDZ7NpJklaSg2ZIoByQMYlq9zzL2mhFv7u/FU85sog2ZZtURdTxry8+R55Xm780kwzcTJi6ZhpsvBtO/IAaAtpC5/fimNGxNXEQ7GETooyzyRWn9bVKz5GVRSnmXtRgLThynKL61ZtXKnm3tRw0sMhMyVha9je5jQjB97z+Ma/JMGI+ShMwoNw5vnmJAE0lLoQa+6370B1kOIhQxYwUybnhSfOGOrOCybN4WvGVMoYVs3y/0zpgNWI4bXKPK78SziuxOIetdyx86vvDAGvo9R9OvQeQ5uCG2N3YaUAv+EUg2QgOVeDwdA8slGXDX6eaLq5fJA4VCuFMMzrQeZGMJTH8rUWoyDCdcDp6jwLWjVfRDfgHfohlwTzcsLuQ3O7hAvfyDSfbfVrp/WmsUuRPUa72P0x0zMRLXrs+pb2bRcKOVEh0WxvLFkvE+WlN/wpTj1l0PopkBEo9sg9iMq3+Z5NCKHc0MVWt1YSyx6y0jlXrqT1cugxm/BKR+FiKn23hh5HIRt94pksOkTUD05v0hpUsbBSxX2ywsUvX9M3A51FqpThnmU6x5DXpnX4BTxMELH4hFuj2M704ze53/KoP0GWnY4kH1VbrkpAArs7rIp+UFvcB9Pa/K9vXcQFSoqoJpiHDLzFjmbE14trUYmbNE3+FlLJ3FlY9SLr3P1J5uf/fKm0Bk4W0QCp6qFLl3zey09KGJidnx3d24GT+lfHoUmBnKbWu6xnDjRxRAbTEseEki79bgtcrlHz3hKadxEr1FOWs5cwN0pzaAjtcY=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2017 16:32:45.4601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2944
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase-native: Fix qdbuscpp2xml segfault
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
X-List-Received-Date: Wed, 12 Jul 2017 16:48:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/12/2017 06:13 AM, Khem Raj wrote:
> On Wed, Jul 12, 2017 at 12:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Is this meant to be applied only for 5.9 or are you seeing this issue with
>> 5.8 as well?
>>
>
> for 5.8, i havent tested 5.9
>

Same for me.

>> On Wed, Jul 12, 2017 at 1:13 AM, Martin Kelly <mkelly@xevo.com> wrote:
>>>
>>> Thanks! This bug has been bothering me for a while now, and the patch
>>> fixes the issue for me.
>>>
>>>
>>> On 07/11/2017 11:13 AM, Khem Raj wrote:
>>>>
>>>> 0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch alone was
>>>> causing
>>>> qdbuscpp2xml to simply segfault on simple invocation
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> Cc: Andreas Müller <schnitzeltony@googlemail.com>
>>>> ---
>>>>  recipes-qt/qt5/qtbase-native_git.bb                |  1 -
>>>>  ...l.pro-do-not-build-with-bootstrapped-depe.patch | 79
>>>> ----------------------
>>>>  2 files changed, 80 deletions(-)
>>>>  delete mode 100644
>>>> recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>>>>
>>>> diff --git a/recipes-qt/qt5/qtbase-native_git.bb
>>>> b/recipes-qt/qt5/qtbase-native_git.bb
>>>> index da69812..98cbecc 100644
>>>> --- a/recipes-qt/qt5/qtbase-native_git.bb
>>>> +++ b/recipes-qt/qt5/qtbase-native_git.bb
>>>> @@ -33,7 +33,6 @@ SRC_URI += "\
>>>>  # common for qtbase-native and nativesdk-qtbase
>>>>  SRC_URI += " \
>>>>      file://0011-Always-build-uic.patch \
>>>> -
>>>> file://0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch \
>>>>  "
>>>>
>>>>  CLEANBROKEN = "1"
>>>> diff --git
>>>> a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>>>> b/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>>>> deleted file mode 100644
>>>> index e72601c..0000000
>>>> ---
>>>> a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>>>> +++ /dev/null
>>>> @@ -1,79 +0,0 @@
>>>> -From 86ae0ce931edbe0ac30cfe5f94f681f1d055fdb0 Mon Sep 17 00:00:00 2001
>>>> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
>>>> -Date: Mon, 6 Mar 2017 11:50:38 +0100
>>>> -Subject: [PATCH] qdbuscpp2xml.pro: do not build with bootstrapped
>>>> - dependenciies
>>>> -MIME-Version: 1.0
>>>> -Content-Type: text/plain; charset=UTF-8
>>>> -Content-Transfer-Encoding: 8bit
>>>> -
>>>> -Upstream-Status: Pending
>>>> -
>>>> -Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>>>> ----
>>>> - src/src.pro                             | 9 ++-------
>>>> - src/tools/qdbuscpp2xml/qdbuscpp2xml.pro | 3 +--
>>>> - src/tools/qdbusxml2cpp/qdbusxml2cpp.pro | 5 +----
>>>> - 3 files changed, 4 insertions(+), 13 deletions(-)
>>>> -
>>>> -diff --git a/src/src.pro b/src/src.pro
>>>> -index 90d7e2b..0aaf604 100644
>>>> ---- a/src/src.pro
>>>> -+++ b/src/src.pro
>>>> -@@ -4,9 +4,6 @@ QT_FOR_CONFIG += gui-private
>>>> - include($$OUT_PWD/corelib/qtcore-config.pri)
>>>> - include($$OUT_PWD/gui/qtgui-config.pri)
>>>> -
>>>> --force_bootstrap|!qtConfig(commandlineparser): \
>>>> --    CONFIG += force_dbus_bootstrap
>>>> --
>>>> - src_qtzlib.file = $$PWD/corelib/qtzlib.pro
>>>> - src_qtzlib.target = sub-zlib
>>>> -
>>>> -@@ -37,13 +34,11 @@ src_tools_bootstrap_dbus.depends =
>>>> src_tools_bootstrap
>>>> -
>>>> - src_tools_qdbusxml2cpp.subdir = tools/qdbusxml2cpp
>>>> - src_tools_qdbusxml2cpp.target = sub-qdbusxml2cpp
>>>> --force_dbus_bootstrap: src_tools_qdbusxml2cpp.depends =
>>>> src_tools_bootstrap_dbus
>>>> --else: src_tools_qdbusxml2cpp.depends = src_dbus
>>>> -+src_tools_qdbusxml2cpp.depends = src_dbus
>>>> -
>>>> - src_tools_qdbuscpp2xml.subdir = tools/qdbuscpp2xml
>>>> - src_tools_qdbuscpp2xml.target = sub-qdbuscpp2xml
>>>> --force_bootstrap: src_tools_qdbuscpp2xml.depends =
>>>> src_tools_bootstrap_dbus
>>>> --else: src_tools_qdbuscpp2xml.depends = src_dbus
>>>> -+src_tools_qdbuscpp2xml.depends = src_dbus
>>>> -
>>>> - src_winmain.subdir = $$PWD/winmain
>>>> - src_winmain.target = sub-winmain
>>>> -diff --git a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>>>> b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>>>> -index 5ac3159..74c507c 100644
>>>> ---- a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>>>> -+++ b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
>>>> -@@ -1,7 +1,6 @@
>>>> - option(host_build)
>>>> - QT = core-private
>>>> --force_bootstrap: QT += bootstrap_dbus-private
>>>> --else: QT += dbus-private
>>>> -+QT += dbus-private
>>>> - DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
>>>> - QMAKE_CXXFLAGS += $$QT_HOST_CFLAGS_DBUS
>>>> -
>>>> -diff --git a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>>>> b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>>>> -index d9ee5de..e891103 100644
>>>> ---- a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>>>> -+++ b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
>>>> -@@ -1,9 +1,6 @@
>>>> - option(host_build)
>>>> --!force_bootstrap:!qtConfig(commandlineparser): \
>>>> --    CONFIG += force_bootstrap
>>>> - QT = core-private
>>>> --force_bootstrap: QT += bootstrap_dbus-private
>>>> --else: QT += dbus-private
>>>> -+QT += dbus-private
>>>> - DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
>>>> - QMAKE_CXXFLAGS += $$QT_HOST_CFLAGS_DBUS
>>>> -
>>>> ---
>>>> -2.9.3
>>>> -
>>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>

