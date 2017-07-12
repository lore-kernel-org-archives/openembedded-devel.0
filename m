Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0055.outbound.protection.outlook.com [104.47.38.55])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8F977FED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 00:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=is4peRebuDq7OF/g8W0oaJsituNqDZCireadGXbT1Xg=;
	b=fst68C5Njw1r9Si+iSJzUuJeqNca808paaxGTiFvVy+95GI9qVNa7i2pdsIbJgI0d7mgMlXgTteRJ9XxyJGfoPo/JBndxLWJlMryaK3ETpfd9lHc3r+X9xmTY3C4mGke4nARW0ivW9IwODPJEeMarDuRAuWIDu6NtjRSb9B9SNU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	DM5PR0101MB2939.prod.exchangelabs.com (10.174.183.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Wed, 12 Jul 2017 00:13:21 +0000
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20170711181353.4404-1-raj.khem@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <a5e067ca-4cdf-df31-d106-de26b5637df9@xevo.com>
Date: Tue, 11 Jul 2017 17:13:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170711181353.4404-1-raj.khem@gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: BN6PR05CA0011.namprd05.prod.outlook.com (10.174.92.152) To
	DM5PR0101MB2939.prod.exchangelabs.com (10.174.183.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90bf385b-06f3-4022-dea0-08d4c8bacf03
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR0101MB2939; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	3:qqJMezv+f9QMvzai1PWsckhwlWd89viZ109DrQi1hURAMH5p5vNiodWD7/YX0XEELtN+EYN3CXWNjXZeSIyLh0VJEYZMUY6CY34vqvWVGpFNHK9yn5BAK6zW6vy1KfyM81cyWXCfbNW7xBAvzFCwQxi8vNH99lrGhb4QYPvgE07VvJfFzHLIIo2i8zTsUFSwVesFRCISaQgKlIq7TDjQN4voAGPQW68qrMmDHqAT1eYMOIIebzS/mkBDPqMpZNCcCeqUufS34qcV9E+U956NXzRrGnKJYoOTKoax+XorqWtnD/u2oQkGOs8QZTrM0GK95A/FlK99hlZkPzxAikX14Y7nagX5Yc0nKlygk0JJSnGTPIGnHfZIrHPSaHg7K50uhdB5TFGIeIzA2/poYzOiuPNAgNlJ5U87y215dEMo1K7sd9R41h/rzKu9FKuZg2fPbBceI5JZYr5Mc3Is0HMhHJ/bTwuSJIiNA1udBkUxY6fyP+/03FGcpRNskvA+M/UmIkQXPZz1CkVPsQR4/uMFeGjzLANc9rU3ibvYNYEqKpBruTuywRJtVnll85Cbsg9u3l4rQMHHtqwn6ogRKswWy9ATK18HykTGc344skrQiLpZYw7T33fDjaapDwU6at1Xx2GKD3J7jfU5XwG0ylrd0tQIQJOC5ugcrFPcIuHzr0ofa7skGl2TnjckoIOJ/W7yteyL2atVm4ZCgI2mYaFD/mImy2rp3RPDEUNMorjUeIE=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2939:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	25:mkVnqGMDxd1cagFiJK3J1Ga0+WaJPHlFbLRSrbke0YZukGCuI8fFTZKOpywk1jdZeMBfvFgMpOCrA8luEpCSUoo/1l2/lRaV4HS1TPyE5kusOW/rOyYXBps9NszxB4UBaAUuq4OE1QgxW6I6CaB0TZh+i4fYZlVdcRqBPZ4HSXLpBASox1SUPc11ivz/NYiRAZjOZPKcMEl07gvH7xMUwkvIQMqKJIXlRPYLu7EGtq5GtDOUu1ACBndO7Sov2H2oGaKJYHEih49oUPFKUBtAxCWaFj6tbgbBDClHV03JMa8b4kjciyDu97SIzEpGc666j15NzsVTByZvVkf189k5XgPXdurLiyOmEozVkkDIjWOxLc4FCgf3YOT62a5vO7qpthuYZ+EDoQjN/hOYGwAheaOZL70yfZd0z8mnT9Umcz9FsKzXWXkk0vhO6mWVKfC0cc3C0wcQnQ5I+XGEd9m746MhCcsY+xruhYM4xReqfPM/3IjR2/7UtsLev45RYs+b1IA6J18iBLrTYvC4i3ZJwuE52tVWDsOwTrkpP9vzEDCQstsch2hO7FHrNbdtmexYiB023v9RKn1elp/61seYsxsgAq1v5clOeg1r+hkGhN5BnH0U77IJ6W76kvCwelU0gagFj6c6+RWoZUe2kHadpGy+qz1tYEXy6FoAdDPY8OjYWHNimOeNjcTDjyx+yZ7GvtovGRU8Y96OvLQld5wdKnzO4jA3HkBC79caA3Ksd/LqdNQN7MAf5ZQFOLb1cDkw8HY+cAfItW5iiIg9SvWhFXdWGTlMj/483CzwSRZX8UHh39VydH9ib/sVNw3hnQHznK95j2JF+13hVH8aKajr5xyYm4Lil0A17IEsPBmequTocN2CdpAwcU6oYEtTsGnPxGhcnl4VL+c/TFqNqNUjadKbG6aOS0uGQAilfprVxB4=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	31:XM8jMMzYWuVdRjtlqMrY33fW2iPsNiOPPxB+ElsuWMvkhyTSNR0DRXrYDeDnL6eGbnsTQqfQu2Z1peHFTlZVNtjFfn3c32MsoYV5NheZCirRwmpDeIl44eTRCGG0EXrCM3LXfxx4rdFp4hGQBB7X4TwCOBVCl137k4+s4Z023mwYpW3BtY7sJ1OgvyUeXEp4JEr+51G74H+gUZBpVLwSvYxAzvi91Iy1OnxNyVJ0gCRfaLkM4H5yqc7vxN76xn6aX4LF2dzP4rRPq6wtOGv0ji2nI5vE4uj7GBfU9Xz1T3etBKCyg2jCuSP/4+t0GvG1kIouPGNHmC32iHlUkWVM1F2RNLzItATz0E/ChoT5/4pBjXSToxW/kjjmyEpsJHjV4rsTFV0Izxwwb52zzTvPYn/zx088AKelAWElhyswrYbtLsVUtp+cRGnmw6ZwCnQp286NMIFstoQDZJDrKAgKB7dapopv4O+GFTvoF4dnZZ5zAVNkUegHl8ngzkQCQB/8jGHhoDOi3V86ZM5XDpaD7jr1q7MKSYt+OJygvE4fo/8enYgh0QnTwXBIwoiBdegozg6Yu+LErza8s/8jnfMV4YnegsiSbtUPenu8eAgOcabUCHOeXTSwBkrKMeTTxwKWxnGid1bV6lN7z96LlmB2I8j2p9PAf+murnT9SHjHG4Zmel8jNf782fGq/b5akdOelsfxUvTGoP2+A7ZfZHOkVw==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	20:VSlFDl3tm7d5Y8j+7pntpuKqf67ULP4KX7aMDkXuU/FhIkBWF47ZURsNb97spleifBeb8pHVZtZIr4P7FzKt3I4SB9S6pgKsSJACkRr8OeGBFru+WbxCsHuGAInPTdCOwW6UtNOxhz/fOes1R5HRRpm/zlmr768Iwa/+5aA0gMMfwIfLeCdIOvKCIC3uDt+GV8twJEUHqo1Soza1Ia3HeFSMWQ4324zV5rrx/Jq2F3R1RLTBoODsOWk604ke0JpLYzmdcRq5666FzRkM1Ki6jAq7KXkRFQ0S8Krr0xCIA2Pqlsvgu+c+HmXVmrxkn0OmI0humsj+vzEv4LfVtUDMmA6i7P2tauV5ng3ibzBfjasg9ob433WlB4P1mz/WDIvJjIPnJlW4zFEDOPcQOZWM2MRhctaW9tcFl6NRIhrTPeI=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(8415204561270);
X-Microsoft-Antispam-PRVS: <DM5PR0101MB2939EC48539A2538FE42466AABAF0@DM5PR0101MB2939.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(2017060910075)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123558100)(20161123560025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2939; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2939; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7NDpDMUNjUkhydlJUNUQwbWwydk91TXplR0Vh?=
	=?utf-8?B?ZHJoS1JLaEtwOTZZa0U1UHliSUVyUFVxZFo4YUMwVCs0THY0dDVIUi8zTndp?=
	=?utf-8?B?WlczcVdlWElhK0hjWHlLR2tGSjJJU2tkSlZLZUhnTEs4MmRZWlhBWjUzOXh0?=
	=?utf-8?B?ajQ3eTh1UjFqRm9kSS85NnlLR2tWZGYzRkpiaTdpM001VTkwQi9QbVFMQSsr?=
	=?utf-8?B?ckFzdHpMdTdiSVQ1Nndzak95aS9ONllxV0pSd3A5dzJRejd4MElPZ0ZXZmcz?=
	=?utf-8?B?QXNDS1NxZFRCSVIyV1RFZS81RlhoWWNhZXhLb0VNRm5yeG91bm01RnVKYmFZ?=
	=?utf-8?B?c0xuTFBKRCtTc3N4dkxUb1ZOVXMrVHFleGtGbWFMRmt5aXZzVzZ6V0lkOCta?=
	=?utf-8?B?ckZKWklBeXhKMkRYSUpnYmwzT0tldm5VcE05OGZoV2c3N2VzUjVmQ1lXNHVv?=
	=?utf-8?B?Nno2Ti8ra1VYUEd2TlcwSnU5dHVJZDc0UzQ4dU9IanVkdXdacmhNcnFNZlBn?=
	=?utf-8?B?SjhpVHZURFlMcjdyMzZ1OGovVmxDcEFPVjhNQTZOWHQrQk9JcW1mYTZmWDNO?=
	=?utf-8?B?aUNGNTVvaDlPN2VYOWNDT0dKVG5xZ0U2THpWZVY2MzBJQUpCZFlvdEtCQmpD?=
	=?utf-8?B?Skw4L0dJWHpSY2VxR2pvOS9WcG5SWDRqU1J3ZGczVDh5M1RQRy9pOWRWUGJi?=
	=?utf-8?B?WjFnS2QwVnl4OUM0YVlMU1BHS0VrT1dhWUlOTzV1RjBEemtETjRwY21XOHM5?=
	=?utf-8?B?Y2x4RlRiVlJoUlRncis0N3p4akF6dUdiektucUtuQlJjbkVKc1R1bkJIcVRB?=
	=?utf-8?B?a0ZSZXBXenlwZ3JjS1pmUmpCL01IVC9EZ2xyZkFyMXd2cWUxS1ZmRWJCTDYw?=
	=?utf-8?B?ck1ueGpCQnFLT0M2RlhPRWh0cm43eGtTUG5GVTRqZkNVTTljUHFGSTlzaEo5?=
	=?utf-8?B?S1BiRVE1T2tBcHZFQ1JoMkhNR1JCU2FldmNrY0pma0o1Qk1welpSRDNkMGpm?=
	=?utf-8?B?TDd2dTBIYlBCdHBMN0RwNm5zelBXekxXczB4MHNtU0hibU5aUXpMZzBjQjcr?=
	=?utf-8?B?SVF1cjVyNXhuV0drbEMvajlRRW4vQWhIQjRaS2dqL1F0SjdZUVpPZTh1Sjdz?=
	=?utf-8?B?V0RPUHMydktLdlBuZmEzR2g3THdzRjl4U0s0T2VvNEYyYlI4SHVLNFBVUlJa?=
	=?utf-8?B?S2d6MnVSMnpRV3JZcTMwWmtGT0xCTmdJNzBET2VWTlFDKzZwNnNBd1pjN0pq?=
	=?utf-8?B?R3VnbFAyMUVwTkVOMVVJSmpVd1BhTmJseDZCQ0hCYVdaYVFIaWFUaWdsWkpk?=
	=?utf-8?B?dHFyVXU4bHFwMVRSYzhKazI2SS9QQ3FCWVBvZCsyVTliYmNrdFZFdVVYSlBr?=
	=?utf-8?B?NmtyUUIzT0dHaU5vMWpHQW9lUkdhRGJLazBpOXUzc2Z6cGxBTU5aVkRPYjVl?=
	=?utf-8?B?bm1sTzA1Z29ITTJ5RGJuTUg1OWxRWDVXQW44NW9IMVhpQURlcEFlOEVkR2xn?=
	=?utf-8?B?VlZoUWhSVWwwT3AzRTlWYXRsZ2JWM0FZOXFOUFRlNmZzSEFpcHJQTDdIWk0y?=
	=?utf-8?B?VUxiWnd4Wkd6cjdLWXNHUWp1Yk91V1JRSm5oWjBFN3N1c1k2MlNUQ0dBeVhr?=
	=?utf-8?B?b1JVMEtnSnY1a3k4aXZ1Zk4vaDdOQzJvNEc3MytIUUZnZW5hQ0ZXc2NRR25V?=
	=?utf-8?Q?paJphNpZXnYI5X3UbIg=3D?=
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(7370300001)(6009001)(6049001)(39830400002)(39450400003)(39400400002)(39410400002)(24454002)(377454003)(33646002)(53936002)(81166006)(36756003)(3846002)(53546010)(6116002)(77096006)(7350300001)(6486002)(8676002)(6246003)(90366009)(42186005)(83506001)(7736002)(478600001)(76176999)(50986999)(54356999)(2950100002)(25786009)(6666003)(38730400002)(110136004)(229853002)(117156002)(23676002)(2906002)(47776003)(189998001)(86362001)(65956001)(65806001)(575784001)(4001350100001)(66066001)(31696002)(50466002)(305945005)(5660300001)(2870700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2939; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7MjM6ekFtZDc5RWUwTG1ONWlLeEI0Z3grcndK?=
	=?utf-8?B?aEY4ZllaS3k0OFM3QjQydkNaa3IwKy9VWFhKcUp4N2NoTUdPK0VkQ0llY2py?=
	=?utf-8?B?VFhCUVNYakh5a1kvWWdNSVkwVEE4b3RMcjVyNzBPWEZoeHgrbzdGYXBlTWYv?=
	=?utf-8?B?NTVVWjNtTGJPUG9Sc29uWHNMTTdMZnVFSzFtdXBBdGt4U2JMY0s0bzk4ZFZy?=
	=?utf-8?B?Mjc4NVpuUThQNE5YblU3TmZ0NGJwMzk0WUoxYUQ3bUZpTUNXN01iZThZVVF2?=
	=?utf-8?B?YW5xTTNsTjRPWS96VHJ0L1ZVVEdSaXZLUXJzNCs3SXp4UTcvc1RJT2QwYkNX?=
	=?utf-8?B?eXI4ZVlVTUVNZUNROWRETjBxMjlYNE9vRk9kTjdROUMyaWFoSnh1RXdvckRV?=
	=?utf-8?B?dlY2K0xGU25xVjBFMzFaYkRUZFhpT3ZsT3lDclRaVFJZSUlucU9QTkNMNWph?=
	=?utf-8?B?aGRvN0Rab1ltVmwraEJHd0FraGpiaU5pMFBUVXdScUgvUjkwMmNPVmpoVE5o?=
	=?utf-8?B?L0pQQU1sK2RRUyszeG51OU9xMnJRZ1hQTm9DQ2ppUUdSTnBoSjRoSGVKQWhn?=
	=?utf-8?B?UW9pbkRjQ29LTmFhbERhMGM2bDhFYjZ2a3dLSDgvU3Ywa1c5TmU4blBwbDVF?=
	=?utf-8?B?WHAwdHlyY3hjM0VGMlVkRnVIdUhqU1dsU1JVeTZoaS9KZ2o3UTFVSnlXUW9O?=
	=?utf-8?B?eWo5bHBLT2JuUEl1cERQL1VSU1RJd2VuYzVKb0FKZk5ESHJXYzIxdTd4NjJw?=
	=?utf-8?B?blc1aFF6UENUUm1FMjVRMEtSUi85bnU4RzQ3cXJxNUovVy8zdkNOZ08rdmxU?=
	=?utf-8?B?RCtLS0FyYmx5VjFYWisrRFY3MVpiS2x3QjNDSmhKRVhKenpjWGN4UkVzNjNE?=
	=?utf-8?B?cmM4SmQwTkxEZ2QxZ3crTElodCt2THJwR3VGRXlPK2JMNXFmQUFneG1RRk9P?=
	=?utf-8?B?TS9yNmNRRGlGWTlOaWlObzJMNlBYRWMrQ2tKczgyWEpMeG50Zm9ONXp4b1Rk?=
	=?utf-8?B?OUNyWjZXWG5uU0ZreGwwZ3l4MmlvOWxHZncxRUo3VmNqN3YyTHN3N0E3VExE?=
	=?utf-8?B?YUR6SFNBUCt4STh0WU10U0FsbTlLR0VIY0pFVnJSSzZaeEh0UTVYaEgzS2Qy?=
	=?utf-8?B?ejlpeVpXTmY2YmI5UW5GalpUZGhKY0lobEp3dHRSTlZEWmlESlZtcER4VWlF?=
	=?utf-8?B?TXVHbFU2WGJvOGRGVExNS1UzcnBlY01kZnRnNk43bGxDNzJVcXgxejVReHZ4?=
	=?utf-8?B?YzNMT0NFWmV4MjVLREdHdktaandzSUFUWEg1SnVMSjlWOVdxL3UzcTlhZ0NM?=
	=?utf-8?B?dXdyRVovMmgrY0ZBaEpSTzVacE1JQnZVRklPb3l0ZjdFUVRDTGpYaVFRZTBF?=
	=?utf-8?B?RkdZbGpRbWozUWE3RTBMSUl6dVp1ZUVFUUV2eDBNcG5DaGVjbSs5T256YzVN?=
	=?utf-8?B?bU1uVGZXaUd4eGRoaVZaWEFpNXJFOWFiSzJzb3pHdXpwTHlIYWJnUGdCMGVk?=
	=?utf-8?B?VG93b2VzMWRraTNIRC9KY1gzWjNPUlRrQ2VBdlpSZFJtRjRDenpUVXNmQy9T?=
	=?utf-8?B?MkF5T1NiS21GZWhXczhnQUpIUVZvM0V0d0wvNHlyYXErOHkxeVJFZktxMTJT?=
	=?utf-8?B?QjhveW5PTzF0SWtiN0IxRnd6RENmTi9kYzhZSjZjNHluKy9lNm5wMjF3Ryt4?=
	=?utf-8?B?Z2NWMnpXb2kyQ1JOYlpCUytrRnZ1bzBHamZ4dFJUZEhiK0pILzdFYU92YlF1?=
	=?utf-8?Q?IS37f++KZK+kOPhFSK+jWKfZfu0rFVcwHGI6Vsg=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5Mzk7NjpNT2NYNWJtZzI0ak9LZkNzUWRqYTQwZjlV?=
	=?utf-8?B?eGkrT2ZnWVdIdkJaTTNZTHlQaUthZ2dRTWRLdEFSejZPS1QwbTlPRUlnZlJk?=
	=?utf-8?B?c044ZjM2MTdjZG11Um53NVZFYmNUVjM0ak5LWkJZeWJ2Z0VsQzd6SFNyVFp1?=
	=?utf-8?B?eFVOSVNmY3VlNEt0YzJtaDVPTFBoeGdzeFB5NVVtWk5HY25GVlhHM3E5Ynh6?=
	=?utf-8?B?UTl0SnAxUWN0N21ybmZkaWVnUzkrWHFrcnhhOC9uanNhQVFqbUtwd1oxSkFw?=
	=?utf-8?B?NXlTT1A0Uy9BRjRwM0g2Rkh3QVdwN2xmc0czTlZJVHd1bFlMc2NPcXJvQnQx?=
	=?utf-8?B?WlBQRDRTRlBjeDhuSWQwSzZKa1h4cFpuVUVjeWw0Y0JpRyt1WHlOYnBadzVQ?=
	=?utf-8?B?TnQzRlo5RWllVnpKcHRrWGVtOU5TV0RVaUJYRCtGQjlJN2NsZ0Y2Q1FyZkgw?=
	=?utf-8?B?OVh3WkhSNnMxQUMzWk9nN3lNSjNpejlWMkR1R3p5ZFFmQ0R3MitEUDZxaFRu?=
	=?utf-8?B?S2dXTTNiM2NkMjlBdDgrMVZNUkJtZ3VydExnOHFQSC96YWJBTDRLWjhIQXlW?=
	=?utf-8?B?cGV2S1V0SHE2UHNkYjliQ0FoZmxSS1ZvZHFZNzR1ZGN3eHd3Zy9hWTJJWFVu?=
	=?utf-8?B?bjNVZEVDN0RnZDVVcDl4Ry9xUTNBa200RE9KaUQ2Z3ltaDlSeUREbTNETG15?=
	=?utf-8?B?ZitGWkU2RHdEQzNhSXY3ak5USktPcndMSFdjR1pSM0VwZzAwenBmR3BsSTVW?=
	=?utf-8?B?c2pXMmgwWVRPTVpOT2U3enhoU2RKdmt2VnBVV3JGZFRrbCtlUWFHVkE2Mkcr?=
	=?utf-8?B?dFpuREtVS0tBOHFJZUxKdGxzR28xUFBZa3llL2xMRDRVRlkxY1J2QnlTSTcz?=
	=?utf-8?B?b2llYzIwZGY2Y2xUV0d2OG40d3NyeFl0emFIVjdEc0kyZVNNdW83ZG1XeUpO?=
	=?utf-8?B?alVLOGNIRERLWEJ1UXlwVzAvcm9WNGNpZDJ2WVdvZVpxbFFRNWZ4bmVBZFk1?=
	=?utf-8?B?YkJNQ0VSeDBaWUdGa1JVdi9xOWxUSVRwRTFRek0raHdydG1TK0dQQ0xSVjZn?=
	=?utf-8?B?K3F1MURDYkNKQ2w0bGRGcy9wY05pYjFvSmwvOGp0MTVnanVDdE52MXhvREEz?=
	=?utf-8?B?djJGMnhtSFdVSkVtL29XNVRZaHN0SHhCcWcyMkpjSERMOHJPMVRYUENzdjlV?=
	=?utf-8?B?WTdQREZxSjBVbVB0R0x4T1ZlRTVPZ2lJNU9sZGY1UjlNR0dvWXdESFQzQldq?=
	=?utf-8?B?UXBsQTRZWEZUT245TDU0akYvR00rbUtTaSt5dEdyYW5Hc2M2Z0I0UnVBaFpM?=
	=?utf-8?Q?qh2b/FXaq0vp5Zl33FR5grUz3/7d1kBWc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	5:ExnPnXKCnoN3xwMm7WUKlszdWXfG1qf7ouE/OJkmnFdEx8YdcZlSJd4OilcE92+cRa9I7FaEAqrUflx91gjHXZDcXr/6jzjr6jq11HFeak4KH9ApTCxVVwpV0mZt8wB0gFRDrn1fTtygKffwe/6TcUVvlEv+yfV+JE6FNJ5bTg4uNoHq5u3+/MN/dVUGH/019qSbu03L9l75Foo6WfNGKwPYMVllwB2ziTmWiIEcx2k0G7KX4Ef8JgW8RBhWUiN2MBaalMsviiM8GbnLgZIEehVMDMUkXVwbixb2d2dREKymdo5ue73aJL63NJq2yO71ObP6uaR1YyLPpbeNFvfec8O3+S0SuvtoHWQobN+hSUe6nz/gkelWpzFazLpfKSHB3yaTuDqj0SRiOaGQuRaTU1OIm39grfRNF0uSoJfZFBugf5NGTPB1A5uhDUxTWHhoJG0U/DujHWLOKkKCjkCGtRplFmflQK4pjBZMVp7l2WPL3/z7DQwTLpCcwjIomb/u;
	24:fZw3a0n/yZJMfGCLd1CGv4Xwx1c45zp1IXql545kJYKpu/2srODnNhbrwSZex3eSOjwtqEUgFFEJ5RUoniN1B0skeAR8SsJcc4UCthMvIfo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2939;
	7:mY8+C715BDmtRQxrvuRFuLpnqF+Q4UQ3G2B19fRXFuEOfmjg2xQ71llUUrGQYwtMIMPKUDEsJwKi8q0hN19QWXn0+FddYNI2E4zKhTSAlHA4uYWfayqwRZIuQz7Droa7LQrdIBBlxYolIYG+4N8VXhFCQdx6roUktZhlDReIHV3+xfSFqh5i82jGm2sX41ASLyJqX2YNMl57YEyNWM440pccEstdRK/UOHBtTVi9WyR30KeISuMF9pcE9OlxQZ92gmTSKE18coYquxvpJCpR1Le+ZKV7sOCtBRbwAH7hUIw8X+W9a4KUsLVCadgZPRfE/0xYVPTEhAuCnwb/Bq3hzzoVSOoh4cfWo9o68jH6LHQGN+r9AZ6SOahTlohq/okhRY5Zejqdm0qw4xyC/W+8sgg4Vbvo05zs2e4fIt+aFwa5LyJUBJy2nnlR93JczR9Crz/fFStX/S3ViHs64svMzBjy6YsacO0b1QmqPDu43UHib5PHepcKdvuEihOoKeJlO7lhXyd2938r8VeRBI/bXNViel7xiV9C4VN4OPg6FsV7gvGTUA9kZpBzoozk5ybg1Pljzf1BKejfjk6cvUNDYH5Qa6e9Nh23/+oe0fZSyQcXyclgQqG73y5NWG+GIk8E4a8YQCn1hjWfQtqDDJWyE2zY3WnobPc4+SosaT2SYt9LgEolkBGAYVEYrVgZhN1rxTkkDuC7efv3qheoavTa1Ei/MTB5l0BWEiuvTL411wXfMDPwXOqFzahMELvbO3YT4WlgCj3cMrQjHYNB9NDiGjdagZGh7oEOusbiTjclY+Q=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2017 00:13:21.8204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2939
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
X-List-Received-Date: Wed, 12 Jul 2017 00:13:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks! This bug has been bothering me for a while now, and the patch 
fixes the issue for me.

On 07/11/2017 11:13 AM, Khem Raj wrote:
> 0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch alone was causing
> qdbuscpp2xml to simply segfault on simple invocation
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/qtbase-native_git.bb                |  1 -
>  ...l.pro-do-not-build-with-bootstrapped-depe.patch | 79 ----------------------
>  2 files changed, 80 deletions(-)
>  delete mode 100644 recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
> index da69812..98cbecc 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -33,7 +33,6 @@ SRC_URI += "\
>  # common for qtbase-native and nativesdk-qtbase
>  SRC_URI += " \
>      file://0011-Always-build-uic.patch \
> -    file://0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch \
>  "
>
>  CLEANBROKEN = "1"
> diff --git a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch b/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
> deleted file mode 100644
> index e72601c..0000000
> --- a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -From 86ae0ce931edbe0ac30cfe5f94f681f1d055fdb0 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> -Date: Mon, 6 Mar 2017 11:50:38 +0100
> -Subject: [PATCH] qdbuscpp2xml.pro: do not build with bootstrapped
> - dependenciies
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ----
> - src/src.pro                             | 9 ++-------
> - src/tools/qdbuscpp2xml/qdbuscpp2xml.pro | 3 +--
> - src/tools/qdbusxml2cpp/qdbusxml2cpp.pro | 5 +----
> - 3 files changed, 4 insertions(+), 13 deletions(-)
> -
> -diff --git a/src/src.pro b/src/src.pro
> -index 90d7e2b..0aaf604 100644
> ---- a/src/src.pro
> -+++ b/src/src.pro
> -@@ -4,9 +4,6 @@ QT_FOR_CONFIG += gui-private
> - include($$OUT_PWD/corelib/qtcore-config.pri)
> - include($$OUT_PWD/gui/qtgui-config.pri)
> -
> --force_bootstrap|!qtConfig(commandlineparser): \
> --    CONFIG += force_dbus_bootstrap
> --
> - src_qtzlib.file = $$PWD/corelib/qtzlib.pro
> - src_qtzlib.target = sub-zlib
> -
> -@@ -37,13 +34,11 @@ src_tools_bootstrap_dbus.depends = src_tools_bootstrap
> -
> - src_tools_qdbusxml2cpp.subdir = tools/qdbusxml2cpp
> - src_tools_qdbusxml2cpp.target = sub-qdbusxml2cpp
> --force_dbus_bootstrap: src_tools_qdbusxml2cpp.depends = src_tools_bootstrap_dbus
> --else: src_tools_qdbusxml2cpp.depends = src_dbus
> -+src_tools_qdbusxml2cpp.depends = src_dbus
> -
> - src_tools_qdbuscpp2xml.subdir = tools/qdbuscpp2xml
> - src_tools_qdbuscpp2xml.target = sub-qdbuscpp2xml
> --force_bootstrap: src_tools_qdbuscpp2xml.depends = src_tools_bootstrap_dbus
> --else: src_tools_qdbuscpp2xml.depends = src_dbus
> -+src_tools_qdbuscpp2xml.depends = src_dbus
> -
> - src_winmain.subdir = $$PWD/winmain
> - src_winmain.target = sub-winmain
> -diff --git a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
> -index 5ac3159..74c507c 100644
> ---- a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
> -+++ b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
> -@@ -1,7 +1,6 @@
> - option(host_build)
> - QT = core-private
> --force_bootstrap: QT += bootstrap_dbus-private
> --else: QT += dbus-private
> -+QT += dbus-private
> - DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
> - QMAKE_CXXFLAGS += $$QT_HOST_CFLAGS_DBUS
> -
> -diff --git a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
> -index d9ee5de..e891103 100644
> ---- a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
> -+++ b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
> -@@ -1,9 +1,6 @@
> - option(host_build)
> --!force_bootstrap:!qtConfig(commandlineparser): \
> --    CONFIG += force_bootstrap
> - QT = core-private
> --force_bootstrap: QT += bootstrap_dbus-private
> --else: QT += dbus-private
> -+QT += dbus-private
> - DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
> - QMAKE_CXXFLAGS += $$QT_HOST_CFLAGS_DBUS
> -
> ---
> -2.9.3
> -
>

