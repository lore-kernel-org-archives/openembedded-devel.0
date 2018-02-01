Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 7219 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Feb 2018 03:50:24 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0088.outbound.protection.outlook.com [104.47.32.88])
	by mail.openembedded.org (Postfix) with ESMTP id B72F978683
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 03:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=m3GUH7LkYrGmCCGAD8L+4yfVXH0jf3mdx1Ix2iW/2G0=;
	b=JCZVz/9R68DCZuuWxpYa9QjlbCmmMRTWVG+UgH7nLDEGwosFZKrny3pT7ZdjI80OLn/+s/c/IkLOqveWaZppDF6esakdcjWX6Htju5Lia7o25FGRHCFOaFmTmrNENVPXjgZDoFiROCwzInvT6YFXcpWOs1m6Ryc1VJywhsg3wBI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.156.19.171] (205.175.118.66) by
	CY4PR0101MB2934.prod.exchangelabs.com (2603:10b6:910:47::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.444.14;
	Thu, 1 Feb 2018 01:18:16 +0000
To: openembedded-devel@lists.openembedded.org
References: <20180131152754.25696-1-otavio@ossystems.com.br>
	<CA+chaQdGSCfm2aNj+EXFy+unv4c+D7oBNmz3uWdHUFpjFO_DPg@mail.gmail.com>
	<CAP9ODKq3xOnxc3PjpkbFWgsS8R2xvZgZy+yb3tJ9ST7p3SsjAg@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <0e0174bb-bb63-d7b0-8921-93dd5dea9802@xevo.com>
Date: Wed, 31 Jan 2018 17:18:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq3xOnxc3PjpkbFWgsS8R2xvZgZy+yb3tJ9ST7p3SsjAg@mail.gmail.com>
X-Originating-IP: [205.175.118.66]
X-ClientProxiedBy: BN6PR08CA0070.namprd08.prod.outlook.com
	(2603:10b6:404:b9::32) To CY4PR0101MB2934.prod.exchangelabs.com
	(2603:10b6:910:47::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d6daca-53c4-48c1-b4f3-08d56911ac95
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR0101MB2934; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	3:1Vm8XItqIxZC+qHIsc+2zOW+lbUoqvbrqQtRC82Ka+1+QbhZw9blDYPovuw3aiFactDJ/8JzFxR/2HJ6rEazEIV2ahdt2UPygdMu1E0chJ5DdRGQ9e6lemgI+MMoaubAwspBSTlxbz5UF86q1YCK7OmAcFJiosJM366MEgY3HLnTvaC0q54mkkcGuKIzoCXpapFP8zlcmfo8LH8JYlnwMDqFdm+rl1X9lTcyO/8rVNoqlUbSlTy4pKpoHRJ3mEsY;
	25:HG78y+R4yNJpuwczj6ybCFsTNsI7XS8LLMBCDVDqAZk0NP4O/lpPbtXgBW6d028RWt+KOzXkXTDQiczyktM4ulKzZT5Zg0+RLXmj961finbP8bMhZehXXCSOZpv8QbDVjIHt70iqRsYp3Wru+6ITcNJHyvhYB9QnBBlyuTOMb3bvBK/IRSsEtzrrqJJKbfhoKj8/km+aiY7C8J813hslYimOlWvND6ChZVkWTb090cb9JPegwNjxCt46VcYC8P2Ol+jEjZLVsYQiKtETQSHQ7d2dfQumm3Etv4g1d6GRy4OAvLRd/0uh0JFEO5Oe/7UNAOB086II+WPIfS6NrhZnDA==;
	31:CwUlj1OBaxJLc32tvOeZf0aAvJ7u7byraqIDJYLqB7bMuzaX2j56L7SHKcKSxO+rVDGUmQZHRMvxd2JFeFYPuueLN7CYesM3ym+rdFtA7ccJzU4umYi4r2Pg6qWcjr/bMR1jZWMQNmcIc7t1fB9a8TVLingGKOY5GmCO6iFfDqdJtQ6vsovhXg3t8a/6j/p06/l9DF7xNRdVTtFmGemwMt/0rQaPTHV8AE9uFplRg10=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2934:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	20:JTkgweKX3A4xaqp8rrYHCDgi0aa/wfjwD1ZmNhf5laQqUOMogTaUUxWksCkPOs/YMykfPMLUrknKF+Rk7j2DIyq5eB61NNmxtp+E5/FQ7Xq+GHyVRAaEohEPK6G4aaWh8Zlw6UookKVXF7Hjwufgmdz73qsdXSgywjVd1skOXDHyYQF4zkApP02xp/WTjGyRyKzt/K3xfIt454PXFCArxtKcUL4mGC9Ns8hfT6h4dYRpRmNNqa4ma2BKDwl0N1oZWj6FMBK6uhSeSweU6msmhsHNv2du1W4aAUU3ji+qRulxYgSkoS4Et0adc8h5jChaF8VNAVue7v4guZBdmPLrNN3ZYESO4ea4T2/tBAEUt2Tfb4qx0QOZQrCgFjDku93lpe6xrtz9cfb/2ggH73Kv9L5aKXm75Xs0eplWZSAO0k8=;
	4:nL0+4JqxOrjo/CAfwqfgwr3uPEqc21AQ1UwE/1Fs/PBgsiPBgrzJJmq811F6DHXK9EhDYYLwcnbT5sdu4a0u1RucAb7fz0/SE/wfPQNhOSHC+8f4blTBhHQd5FM8YKUiHipUrGY9NJyOoo51cwFoGPO1UG8XLGqNBCX6suGc92ek6l+W9t9qtLL8ZOCcWSBI1qu8nGGavWJROIeBA4Cp2ggmWmEIYyqHm0MkLCd5vL2U3cjDidL7WRI1QMuJFnjfwgl9MQ1wTm+UV0hSXNyYU8baeUcwsB9MQL5rDOn4DOKDdXQWiEgMrZkZprGo5V80
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29343D1118B5F00AB5E880E3ABFA0@CY4PR0101MB2934.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231101)(2400082)(944501161)(6041288)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011);
	SRVR:CY4PR0101MB2934; BCL:0; PCL:0; RULEID:;
	SRVR:CY4PR0101MB2934; 
X-Forefront-PRVS: 0570F1F193
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(39840400004)(376002)(396003)(39380400002)(366004)(189003)(199004)(68736007)(67846002)(8676002)(106356001)(53546011)(23676004)(81156014)(81166006)(230700001)(83506002)(186003)(77096007)(25786009)(478600001)(386003)(50466002)(229853002)(2351001)(8936002)(64126003)(6666003)(6116002)(6916009)(5660300001)(2950100002)(26005)(31686004)(6486002)(316002)(58126008)(305945005)(65826007)(86362001)(7736002)(2361001)(6246003)(47776003)(53936002)(105586002)(36756003)(52146003)(16526019)(3846002)(65956001)(2906002)(76176011)(52116002)(66066001)(2486003)(16576012)(31696002)(65806001)(52396003)(97736004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2934;
	H:[10.156.19.171]; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzQ7MjM6ZHdmekU2MjRGYzBMS3RRdTZQZUhjZ0Y2?=
	=?utf-8?B?SVpkZDlsZmsxbGZxaC9KajIwQzVySEIrY0tzeitEMkhsZFprQjdqay9yNUtG?=
	=?utf-8?B?UVViWWo3ZHZlUWE0TTZtMjVFUHIxT1dRYUxCMzM1TFlNVTVUd2V0cjVMU0du?=
	=?utf-8?B?ZmtDcjhja242YjNxWGhqVW1BWWNyd3NpYUtTRkJWbU12ekF1YWYvQ1g5NE0r?=
	=?utf-8?B?Qm5TY01BWVliNUdoRzduRWNDMldZZzJzcUNQd2R4QjVDbzd0Y2pTbmI2L3FN?=
	=?utf-8?B?SHFvcEJSa1NpRXRZZ1FoSkh2ZktwVG1zcDdYSVgrMk1DM2R6dXc4dmlUdmlL?=
	=?utf-8?B?bFE5ZWJlSWx0TmJYRXBlbEUxMW82RlZTSWMyb2lJbktCdCtxcjAweGdHSkJQ?=
	=?utf-8?B?YkVSTXU1cmY0OUthQ3RITy9jSkxPbkNkOTQyU0pGRmJGNG5xMVl1TmtOWUFl?=
	=?utf-8?B?NmZOcUgzTnhnZVBOaVVtazNLcXdMZ2NPNzlZdnFtZUYxV1h0SHNqUTRBRmNa?=
	=?utf-8?B?aTBVWmdQaytuK3lyeVFCV1dUU2VhRE5SQ1UwV09sS0JOVTZKMjlydERiTVpj?=
	=?utf-8?B?bmIvVUh2N3c0eDFsYURqNFV1TDdndWw3Qkt4a3ppYWUvUXU4Q2hNTDczeVVN?=
	=?utf-8?B?QnR2Q1lzbFhFM3dqeW43M2RSaXZNaU1GZUFTdDdTWHJuWTN4WXVRNklKdmds?=
	=?utf-8?B?OHNORWZ0ZDJNNVgzMS9mVjJIZkRWQjdHemdxYnpKRWpHWTk4dmh4aWM1Rndz?=
	=?utf-8?B?NG9TUW9RWnFTcDlzbmVIQ2t3NEF4S0pTaHovQkVHZlI1NzQ0c282SmVzQVNN?=
	=?utf-8?B?azhGY0p2TjNWUkE0M2kzb2J4M0d2WTRta1VCY2F4UXBTdVpwRTVnSkRWRm4x?=
	=?utf-8?B?TC9Ub3lPN2NKemhibXVmMXhDazByUmJkQkdaOC9DU3pIU0ZtMCsyUVY0aVdr?=
	=?utf-8?B?OW9XNTNXa2QxWlByYSsvalFWdURsdzJJS3lMTldmOXBiSXJoRzVYTk9EcTc4?=
	=?utf-8?B?RDBTTWFEbmN4NWdrSUFRYXB0TVkwUW5pblhmRll6WnIrSkRKUE9PMVJtcExV?=
	=?utf-8?B?TXJiaFBDdkZQTmpUVVFPRlIxOVg1R0R6NXUrOC82L0UxNXUyanZwOHNtRGhO?=
	=?utf-8?B?enQ0alloeGI4dWUwMzFnak4ya08vVlR5ZitJVEQxWDhrUEZHSVg2NVIyK1d1?=
	=?utf-8?B?OWJlcFgzTmJkQ1NVOU9oQ1FpbmRQMW5KR0EwNnJXTTl2ZG1jK2s4QUNSTHRN?=
	=?utf-8?B?ZVJuT00yaGtEOUhhelladGxJSnAraFNRQTRYMStQQlhXeklZc1BEa1ZueGdF?=
	=?utf-8?B?c2RXVTZTYVFYZkVEMjNISG5MYXJmV0s0d3ZMRFVjRyt5MnFqeHdzekplaVdB?=
	=?utf-8?B?TkNaYzRIekpHSFNUQWpSTFdjaVVJaGVnRmRJd1R4VTYxdTFmSWxFVzBEQkNJ?=
	=?utf-8?B?RlRFVWlDWEVtajUvOHhCWG9DSUs0QWFyZkRoNkQzc2NjTkNrbmRwaTdqRnow?=
	=?utf-8?B?MmRZYllOOHpNSW1pNUdxS3hKTFRiRDNMRGVKSUdOeEpNVHZiNnZsTUNEemRi?=
	=?utf-8?B?V0VjZnNacUhqZGQ5V1RkZTZYRktucE9FQXlqbmtLR29yN2RZZkI5WVh0SUNo?=
	=?utf-8?B?L0JObmlmZHE3NisvbjJwQjRMMW0xOG5CWGVLNm1YKzBwQXNhNzBWb2pyMk5L?=
	=?utf-8?B?UG5Cam9EaTFkZ0VIanVNWjhLWjFxY2pHMW1WQmtmS0l3TXFGemhpaGJBV2Nl?=
	=?utf-8?B?L2haWm5jTmp2R0U4U2E3elJ4by9nY2l0V25GQkVuaGJMSmZjMU04ekk5YVNt?=
	=?utf-8?B?d3Vla3Y1RmVTWS9FQU9zbVl4bXRXT3l0bU5iSUdlZTdzRk9KYTBBRG9kSFBu?=
	=?utf-8?B?N3pORWpNWXJyY0pMVDErNndkb0NNQ0dNWW9xYUY3Y2FHNGVlTDA3VmkwbkpU?=
	=?utf-8?B?N0s2UEo0amkzM3c9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	6:QJdkKk+ia3BWr8s5JgmvIqSkpzi717bWDJ+9YsEj/FOKr35VkcAoU87bsjBDxed9GvN5MaqNfqvVQqgVoFkWMLqXje7RrzEcIVQNA8M7WesMGZzbF28e25FtbACZ/9CaEps4G4a2EkKeId5wTuXhw7rg5tWZEe6NxLSDdBJySz7VSSOtQgbizYYW7jiEITK9roRdz3eOwoDXYOhvo5Uj8h0C9KnC9I3n5NCM55mr5HQgtlFCIY1LCxfk4drhy6oRvXxohFjEm8UGR7P3IImw00HqkTkDn2LZfTpC4fHJMql24EdVwt+9UjzVx//TGj37+FyYKZcLGwEQY8LKBHENKe+tnDMKv+9Us5PGfeWH/gs=;
	5:ukTo37Ptxbe0kGbVMexCUkFADo1D911vkV/a3CCkmbGeqjATwUKdlMnb/7+3IVq5LlQMInF6fxkki+4HGSeIDuFJ4oOrrkV3eMEY0b4aOOuMOY2eGZ59txEQrfjd8AkqxaPE9Z8FVLYcKvc6eRCNV8bSiYoqseG2hZ15oz3/iYA=;
	24:hsWdO/hkmxVcAz+ddUaRXW1ftATMmse12CjYhAI/Zy1sgar90Q1jhxreN1E9QWYTrQxVNvTP1B2KIYJeUPDYbJjD/mX58//CVEw1qKTCpC4=;
	7:Z6Mov4T14a5sByKU2HLUdyK3iFR6jELcSL68Wb0eZC38VLmxvepN/p+v1oux7HleOnUg3lxBvbUtojZw2HWGl6jX/VJ/ooFFTndngq3ZFsXDzyhkUojMNTDRkLf26WlJpwgHHZNGLlFCQ5lXP+zSt1K0NfTgDF7UWhzhexp1m4Fj3ILQoXVi5lgKnlZsd229Ontu2RaJMqFCP30Lm0FGnNjOhGGWK5C/bPfpLizsFSi6/tqUvrWK2x1lO3+Ql5PD
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2018 01:18:16.7421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d6daca-53c4-48c1-b4f3-08d56911ac95
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2934
Subject: Re: [global meta-oe PATCH] Stop using base_conditional utility method
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
X-List-Received-Date: Thu, 01 Feb 2018 03:50:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Would it possible to fast-track this to master? It is breaking all my 
builds.

On 01/31/2018 07:53 AM, Otavio Salvador wrote:
> On Wed, Jan 31, 2018 at 1:37 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> FWIW: I've sent the same change yesterday.
> 
> Great; it was not merged yet it seems as I got parse errors :-(  Armin?
> 

