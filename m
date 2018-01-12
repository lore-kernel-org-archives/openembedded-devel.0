Return-Path: <mikko.gronoff@qt.io>
X-Greylist: delayed 14495 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Jan 2018 16:33:56 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0118.outbound.protection.outlook.com [104.47.2.118])
	by mail.openembedded.org (Postfix) with ESMTP id 3022978893
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=60CD8Pi0Hgiv91JK64xAlY2Owva4gaALIaGxe12mq34=;
	b=Rv43WE+hKZ2TyAB/gL2eqobfHKQl+gnLIolyDK6jOkyHkQpeNg/eT4Y6MIjoS5b7KKqYmBeLplkNoM/XuQvYyVbobfFj4FI11cdLMfxHAHsEs0B7LRVaHtMDOGLaeUkL6YXNs6TczMsRxEZ3yBYLcF6nuv1QEtZarLdyE74j/7M=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
Received: from [10.9.21.55] (192.89.120.53) by
	DB6PR0201MB2168.eurprd02.prod.outlook.com (2603:10a6:4:45::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.366.8;
	Fri, 12 Jan 2018 12:00:10 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <20171019174010.4331-1-anselmo.melo@intel.com>
	<20171019174010.4331-2-anselmo.melo@intel.com>
	<CA+chaQcdpxeQC5Q2SB_x+C4x4Xph8y-Yc+qN_HVsxw1_Xje-5Q@mail.gmail.com>
From: Mikko Gronoff <mikko.gronoff@qt.io>
Message-ID: <13cfe919-961f-8be7-86a9-c0731f7da59a@qt.io>
Date: Fri, 12 Jan 2018 14:00:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcdpxeQC5Q2SB_x+C4x4Xph8y-Yc+qN_HVsxw1_Xje-5Q@mail.gmail.com>
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5PR0502CA0011.eurprd05.prod.outlook.com
	(2603:10a6:203:91::21) To DB6PR0201MB2168.eurprd02.prod.outlook.com
	(2603:10a6:4:45::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d653cc91-b0fd-4c5e-131d-08d559b4085b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020081)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:DB6PR0201MB2168; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2168;
	3:k5JzMOa1fDZQ5hTwbLE2FfCrN7aj33ue63h4K+2N013TN8RwuxK/ZDwB9Xtc4bfkxOsidAz31nuJblZgE5QuQkePY6GxD4MmSMc14mRi644b2f6mthn1XCDZdUVn9db82wj5VoQ+2PcgbSllhKyoS3Tbh76rJBwe7eROQV6uWFIGDSlS4u9rcK71BAYUeZU84OCrJMr3sQA3rUvLjWEOF4SZYGHUGfL0rGwiXoxUtFQcQaqoG99kdVkhdcbW5F/U;
	25:Pix4lSH8hY8mVIRDlDdfhrx6+qEgh9QVdVbgi8Dgojm7/sgEt6ODCDDwb+S9ij/aK4JdY4mlS1a2u8fqRfr8Bc34GVU4R6C+HYen/X9ZT4S+r0ljuQKtZuVeFygy9AUIRrLeKH30mZJ8KQySy3EK9GA5K6WuIwgJ8Z8wuOB5capPEBnfN/k96pOpt8S4PntpmqE2WANqrqEklrxoI6YU8cMwOvI5XnFS+ZeIKkuidtBEMOWfMwqE1YG6EjBK8h4RcujrFuFDQu6cJdr/KJbMgFuLcvxmEaXB/t+Z0WZsuNVHPX8Vk3WdhiYSr/by7216vFSiwQDY8X/RzU7Qll2suA==;
	31:5fI7V4RduPAqOrEKkIXguvlb2WaMVtQlRZH4hxLbtTKZWJOgfMSOh/bGT9v0YOs0B1+2pu1h3kvvZfg2CroiYQHTq3XZ67c+d/mOlrnwPy/T3ABH2QjDWqtrTYGDvfUPq0s2pEOYD5ma1i7ikIPJ8+Wy5Gd9nRBzN5eEWvQDAq5ExbMyki/xYTLaUUDm/Hhz2rMcvYs+7xq3mwRaVpXsKX2LmobV9z8fQljacwVKDsk=
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2168:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2168;
	20:l4coOEOG9JWs1tj9CnLZVLebtHKaPuhm/T7jrhbaBgXmHxkOXnQeKdNTtyDFdk51n7oaZqpczDH7bSIgXw1fhrifRDfHe5wCfcZyNQubjVveCyeAu/gHCaQPsyuV545Eh2OjJ+6FG8MhAKgSNmKwGKpDdXzMawMNjkJ6PKSqR8hs7dUTq6E0yVfiS68DScpgA8n8TS8PLjOELZl/KNOvX7NuOMmxFlOVHEJOCkCN6wwMqQ6wtn8D0rETmHLDZhq7/8ev5tcIF2iSD/EfXSdPB4qcxVw17pg843QZFJRWpExw/KfqKtrPZ5eIi7k3konUixO1u+lQU87kzVm9jln9Euo70eDJheuKT0hTnddMoYfeddxJa34PxhJJ8yGXVLrtbUGgmZ7MiHizWk/2+CYSA4wwV0L9u6SkSVNdPj09UcphW1yyC4EfJXgVvkHbAUA3okR72ReMfCrfnim6VpotxxUkT5/Tj27Cj0bGvPN8rht67RxjJe63R7YtRMeuH9Jo;
	4:ZCVR5J8da5ise7CtcY4dpyd1MgezujGe29l0bSvHU0TXDP2JLhzJDyDlWMiZqPYkP8GKlaQq5+ucG61Mqe3YA7p3ZDb4aKAQ5aWHZJRCEI2djt2HdevscjVCVWEUCzNuw5RlsJWjhjnW8bYPiy5mUylmPUM6twslMDGpP2ZyPcGSaBhKSFdAkou78knzfc/LKAjVMC/dHrHJtOMkKQ03WAjl8ArG2Mj78Hf+jr3b9qS3XVhfp7q0aSumNvfef1SePXSgrBxIgYZIVIqFRhNZjchfcx7iNKOaNazex6DjE4il7u4/koejFI74RazqqciUWd27qm/HCB8GegZt1OEn9E87i6TTahD8kPR9f+ALxy8=
X-Microsoft-Antispam-PRVS: <DB6PR0201MB2168E47553F9D8C7E32C2D1AE9170@DB6PR0201MB2168.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231023)(944501143)(3002001)(6041268)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:DB6PR0201MB2168; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DB6PR0201MB2168; 
X-Forefront-PRVS: 0550778858
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(376002)(39850400004)(346002)(39380400002)(396003)(366004)(24454002)(189003)(199004)(39060400002)(229853002)(86362001)(478600001)(65956001)(31696002)(6246003)(2906002)(7736002)(8676002)(65826007)(66066001)(6116002)(575784001)(16576012)(65806001)(25786009)(5660300001)(33896004)(3846002)(105586002)(52116002)(6916009)(2950100002)(106356001)(68736007)(23676004)(4326008)(64126003)(305945005)(31686004)(67846002)(76176011)(8936002)(77096006)(230700001)(52146003)(58126008)(386003)(6486002)(53936002)(81156014)(16526018)(59450400001)(81166006)(97736004)(50466002)(2486003)(316002)(53546011)(36756003)(47776003)(83506002)(74482002)(6666003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0201MB2168; H:[10.9.21.55];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjZQUjAyMDFNQjIxNjg7MjM6WlNTVmtZeXhvSGpicWt4bXJlZU5POEJX?=
	=?utf-8?B?eDFTSjFnSlM0K3BFelJ2bXVuYm1YbDRON0N3ZnVBV2xOWjNmbzN3dmNSTno2?=
	=?utf-8?B?Zmg3ZUhHQkVKT2FTNW13akE0Y0M4NmhQNUZ6UUh0c1BiKzI2U0VEYU1lcHVm?=
	=?utf-8?B?Q1NZejFwb1NrQ21JQUZpbi9Xc3BXWXE4Unk5TzFVVUhTTHFjQjNHNFNiU3pF?=
	=?utf-8?B?VE9PT1FnU0JZeEt6and4dEYvNERGRU9IUCtuK0RGOE9vRG5qd0dnTGh4ZE0z?=
	=?utf-8?B?RTNLdW02ajNJOFNOcXNJZ1dLOVlQQVpGT0F5NllPcFJDVC8rY0hMSEV6ZzhQ?=
	=?utf-8?B?QzZ1V1BqejdPWis3N2dHVGYxSWwrVzBlN0puK04zeGVRT2VPREdMWHdUUUE5?=
	=?utf-8?B?eXRHSVhmVHZsVWJSaS9kQW1ScG4vQXVMY2lTSWswOXY4eENsZ1R6ODhzRXNt?=
	=?utf-8?B?TndjTU9TMjhMbHpGVkR4MWRwWHJaMFpjb21idnVzRWpzNiszaGNPN2JONDZo?=
	=?utf-8?B?M2RzZ1hLUTMvM0oxajZORzYzUlg3Wm0xaWNxZWhRN25yQno0SHIrcUFPSzhu?=
	=?utf-8?B?cWdNcFE3cTBvYmFXSVlLUWRjTVE4bUNVbzNSNnY2ejBXaUxpOFF0OG1KRmVT?=
	=?utf-8?B?QkFaNkJ5blpUMkRMZXlZVitCRDR1dzUrQ2tKbzRWcFpzRFdvM09QSFJOOUti?=
	=?utf-8?B?YWM3cjBRb0lOSXk4QjdMczdWMzJEVGR0aW1uT2EvUXREbFVmMk9senJjT2Js?=
	=?utf-8?B?U0xoOWordUNzd3BDQXVBTmQweW81S1l1Z0JkakRRdW9tNnp6Tkh0NjduWkFz?=
	=?utf-8?B?R0lmSGJsQ2Vqa2wvRWJDNS9pQnN6Q3gxYUl5bjBaT1JPSFdxQXM3Vk5HeE9D?=
	=?utf-8?B?SGQwaW1hNC9SN3hlSHBvY0d6R2hDeUtxWHRwajg2d2dlY2lKdjRRdWQwU0Mr?=
	=?utf-8?B?SFI0b1lkQkY1dHhQNDljU0xreDhxZnF4N1hQcXNzVWxpek16bEtEcHFSUTEr?=
	=?utf-8?B?R0ZSVUtnYmsxUXRPZHo2bEszUTh5dUEyYkJlTjRTSUpxM1lOVFIvOEloa1gy?=
	=?utf-8?B?THRPSHRLN1ZRZzJ2U2hiWG1XNXUzWHgybHI5eVdnRUtsY0NLcHJMaFVvOWY4?=
	=?utf-8?B?c21UVHNFZmRIT2RJQ29VNjJYbXJOWHdyeEtHYUtkaHlwNGpFcUkyTmN0ZExF?=
	=?utf-8?B?Q3VmS09HS0l1YzdMNGdSb2JPQ3Q0Ym1OVHJwTGpudFRSRnlnd2ZUUXpRSkJQ?=
	=?utf-8?B?amNuOUtqRk5ySlFObko1YVdnRWszc3RBRXh3Zk82aTAyUFdCVlFLQitEWFdm?=
	=?utf-8?B?N0N3QlNBVCtiQ2NvblUzNklnYU4rQnVvZHF2VUgzQkxrOFdVaTBlNENuVEpt?=
	=?utf-8?B?ajNyN1hhbVZyT1UzZ0dYUmlqSU8xTkpiSTZSZW5HUi9Yb2dEN2QxSFBhTVpy?=
	=?utf-8?B?V0tJTm01MnUxR1hObnI2d0h6YUZMNU1xVFA0bW5FUzlzdU9DTkkzRVV4NW9E?=
	=?utf-8?B?enZ0dVR4dnU4RXRZNXZyY09CUlNqVG5nZ1JoczBnUE9BWnY1L0l5UFBvNFJj?=
	=?utf-8?B?QnIwazQwVkgzdmYrc2xiS2syOUxMQzBscko1NGU5N2YyU0c4b0pyb2NKY1ZD?=
	=?utf-8?B?Z1FVeUYvSG1JeVZBaDZtMGJoQmZlemsxSndUbVdCY2xyWlBrV0pZNk9BOFcy?=
	=?utf-8?B?QVd6UVRpUHpiWDVhWC9UL2RQUmFweTNQeDBSelFWODNEWGw1QWE4b1VzQkUr?=
	=?utf-8?B?RHd1RTlWZnRqem5GUW5lSlhKRHBDQ3k5NVlMZnE5L3pEUk9mczJ6SmNOZGlE?=
	=?utf-8?B?Y0JWNU1mNi83NmxYRWE5YzNFaThwMjJFak1JT01xTGRuL2tzMmJPaSs4TWI2?=
	=?utf-8?B?ZE14RmMzYnRQNy9OL0s1ekpYc25WUE1iR0lNMW40bXIySm82L2FrUVdYbk9v?=
	=?utf-8?B?d2YwdDdueWZVbDg0bnhEaGc1Tk8yU2x0b1lVUFZGNEJSVWRMRFQ5WWo5akFV?=
	=?utf-8?B?dm9yUVV1K1RiN2ZKN01PdllXWnAwT3h1Mkk0NGxnPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2168;
	6:G1PbJBjdO0T1aTKrqVFRNcgQvMeu5XvkbC3tW1E6c4AbVhtrery0PzQMaqsQq1ct/qiG6qTetIu8SrTKKxFFlUpHT3THgnFCl56VSpzSt+cv3Ok+qQZjMeQ5OyYmE0dCXEzIPsMtm0PLbHAAWPp0a2FYK4YXfbF5TxQt7GpYcLAns18m+MMtZluJJuBdjadzooebZe5KOluG52WFuSsfwog5fj97rzTLHvLlj4x0uC/vKkIa8THsDeoaDIDpYckxr9p4b0CgnxoUwCtff2tu3qMq8kHp6CUV7i9YH6qNBr29UoMj48f1nrzUmVkPsf+deKmSmgrY37UQnWKrF/t6L5aqjWvaM92/5r/79vOX4JY=;
	5:d3CW0jXueXUKuhKtBN60xCHgtgpin9FsoDokZKdT6l8sgnCX2t0bkyEULMwUZsyCo07zO9iwoyQTDOzmFi65ixsNXyWs1fx1/Hz79T0/gwHjHxaM4cudSw9ikvkw7M5mdhRrpxzJl9xdU9pKpfqgaBqwHfKGX6h6z1yZfyTpW28=;
	24:GDwSUytQ7Jl6omOK9uzrT6WpOWMhyHqDfbTdMVH/ss9VpaHoky6QBZiySVodBu2wabyV6pIJDwC7fsQP+Y7BHjdP1LTOEjsM2VfeZTIunKs=;
	7:gOJzLJxcECzJH5cszdiKUp4TNzaZKTk9ytw5hWnWDAiCWWJVRQQpmkkfY+HYXnPCkJJBUCyACsa3CeVfBAh6BG/ag3FfwrD8YDoip6fuJKKICl5tls5QbiOBwFUgoJJ/Ld8VnjEr+tOZbGnl4TXbqcsWSvDPIBVT0snnhKQYVz7QVw9obTZXpWCAsVRRQV13pHyLWq1Z/sAeFhsVxV1nm8DwRHLlEfVyAQpjlqAwgtrd604bjDgRe7aFlXFL3b06
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2018 12:00:10.7902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d653cc91-b0fd-4c5e-131d-08d559b4085b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2168
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] opencv: fix runtime dependencies.
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
X-List-Received-Date: Fri, 12 Jan 2018 16:33:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

this single commit (0abf5af3ffd3d13c009a8ffcd5a6f045c36be837) has been 
in "pyro-next" branch for a long time. Can this be picked to "pyro" branch?


On 10/20/2017 07:21 PM, Martin Jansa wrote:
> Follow the README and put [pyro] in the subject.
>
> I've noticed this only because this doesn't apply to master where 3.2
> version was removed 3 months ago with:
> commit 31fceb560c0b81cff3aa439e3f43fd7a04dc477f
> Author:     Ismo Puustinen <ismo.puustinen@intel.com>
> AuthorDate: Thu Aug 10 12:58:18 2017 +0300
> Commit:     Martin Jansa <Martin.Jansa@gmail.com>
> CommitDate: Sun Aug 13 13:21:02 2017 +0200
>
>      opencv: update to version 3.3.
>
> and this commit is already in master.
>
> On Thu, Oct 19, 2017 at 7:40 PM, Anselmo L. S. Melo <anselmo.melo@intel.com>
> wrote:
>
>> From: Ismo Puustinen <ismo.puustinen@intel.com>
>>
>> The newly split "libopencv-ts" package is empty (and thus not created),
>> because all ts files are installed in the development package. So, do
>> not add a runtime dependency to libopencv-ts.
>>
>> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb
>> b/meta-oe/recipes-support/opencv/opencv_3.2.bb
>> index 535c761fa..fc62e9975 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
>> @@ -126,7 +126,7 @@ python populate_packages_prepend () {
>>
>>       metapkg =  pn
>>       d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>> -    blacklist = [ metapkg ]
>> +    blacklist = [ metapkg, "libopencv-ts" ]
>>       metapkg_rdepends = [ ]
>>       for pkg in packages[1:]:
>>           if not pkg in blacklist and not pkg in metapkg_rdepends and not
>> pkg.endswith('-dev') and not pkg.endswith('-dbg') and not
>> pkg.endswith('-doc') and not pkg.endswith('-locale') and not
>> pkg.endswith('-staticdev'):
>> --
>> 2.14.2
>>
>>


