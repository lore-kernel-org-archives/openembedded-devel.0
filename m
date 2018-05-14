Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 3639 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 May 2018 17:49:53 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0068.outbound.protection.outlook.com [104.47.38.68])
	by mail.openembedded.org (Postfix) with ESMTP id 635357199E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2018 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2wBHx/TEMooElW20SlJbv83cBvus5+0y+IjnrsEKzXE=;
	b=kyg7IJjoR0v6jj1TI8BVW1e19lRu88L43/QEW/mU0fz2TX/D/xRkBGlSWD1ZoKE8eeBuDYt9CUDtkuaag0S1kTRtFsu/t0isT6R6itgqvYZpbam8KVc06c9gP7XS/Hnz6w9ufjsO8O6GZFuetAFyISBS8pLZborEZaF2umnPrVk=
Received: from [192.168.0.3] (97.113.238.55) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.755.16;
	Mon, 14 May 2018 16:16:05 +0000
To: robert_joslyn@selinc.com
References: <OFC304E1FF.C64CA001-ON88258288.006EE4FE-88258288.0073C3D0@selinc.com>
	<5119af28-2811-83b7-d913-46c5966fb1dc@xevo.com>
	<OF383C8BFD.A3113800-ON8825828A.00808857-8825828A.0083305B@selinc.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <fd6bbf3f-58a0-7d37-3ba9-96fc2bb2bd9e@xevo.com>
Date: Mon, 14 May 2018 09:15:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <OF383C8BFD.A3113800-ON8825828A.00808857-8825828A.0083305B@selinc.com>
X-Originating-IP: [97.113.238.55]
X-ClientProxiedBy: MWHPR19CA0008.namprd19.prod.outlook.com
	(2603:10b6:300:d4::18) To DM5PR0102MB3416.prod.exchangelabs.com
	(2603:10b6:4:a0::17)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3416; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	3:CMmKv2PNnGlzEiGTKAX/ec9MxEViYl6/ZXd8mUwh68jf0gjvcYF/YaNHSRRfUthbj3t8uUbk9mRy+irDFw5emik5a2wu6NX9X6wPHfHeQJpGn4luP9Uifl+C04mPZWOW1JvxHpG9HPR2fMPDs53bldEsD3rxaAjpyPB1ZU/9eVhMCj9MaeIRcgnZfHpzBW9LQWi0MEAM7BUP6KCxVcMAMr5my3O4jkFWBwl+Evbi4a+G/QRZ0sFNTOWdaNbdjJsH;
	25:uzO3IW5zaDd6EFttnKQP0dptuGxcGv/zGSPjGIVxQg2iVv6xWTmXosy7ieh6kisedkjycUSMXAAGfeMnutt+5LxXtgEed2PvfgiUJNjnadbjxg2XRj2cy3I/ztwnz5gisW/miJiu1ZN/UrX0JP06Zo6agn2c7A1w3me+ffXZAbDaUnluY9fJWYGQ4phAf2aYrc3zIbBJqVnDSqUy2pQzJt7MrQi1Wx4K6PLllkzWs3RSjG989138HwpZYOeglOKvUXRw+HAQ8fS81zAJ41rSY2Hh4k14jtD7gQiQV4tZWevIMhEvDdLb4i/VDVEzNotDnQlR8RWJfle2AjYWK7AjFA==;
	31:C3L1v/8goHHxhxHr0NUocMFEPO3Hr1Xhxlbr0z7UwjGHxaqpv8m5uI7AIwosfpEZBeHy2HdUsgDZLVCiqkHpsE59LTyVdmdsbv0ptrpgIINwSatXqq48O427M0KzQ6IIHjhsNogb9oD1hznbbYNsV9SXNSh3Aayc0b1A2o6EePPU5FarJRFPs/e+nIJaaRbhhAm6RE6L567Yu0jKZPeIEdAb5eYl0nYRoafIGB3+Q+0=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:eccF3eAS1SdzmopGDB653kbtfdMlGeL2RxGOnr7Y5fO6+pyMmRaSahTKDzK+tzFOjfMJl4VCuqleSi9NfTha4VX1YPxVaszoUgZX6hZWBaPZYfp0I8XpXBZwvSQpH643Df+9GOdyXTzdtPwhyqg08JB1UPsnweL0uGn6PWAa+5Tam5EGU47DsInjvKOLIs3dRwzeG/jW6NYLaCGE9XdKS7V3GLoT7gGeKJLJOo9r32OkupWL2Lk6uAmGo1yNaEQfl8qvSZSqgq6jb1J5Hkz1v4vIzyoFNZQ4HSug+gPsJ9TK/GttDkMTCM9zwxignGpLA3ECrhJjKYJNowGJPC78Ig2SM0VM3XZK9DISB0ybjzss6eNmPrzh07nQ/mCZOFooffUnQpgjeBCEM1M605RJoV746GvOfiqqnYyMhmc6Ly8E8mJQjinVSdRCcfQpUD1WvU12okq1euV4ZmWn4j7ljswlTSnBhZwMNGmKZEYBNA72dNV/P7NUG1cdiFi75V14;
	4:/h8jo6DX9hCvRGfZj5dnUHLklkDcVr+JGVhj+PWsFXHDE0IiLrhj4fzbZR9g1BhUw4AuVxhGEKnREVdrZZO/6GtSmH1tCLsgJnQnnTmxfcqUt/AL8o3rUDQmUhoMgj9eAJ/bUY5/6yJJeGf3iM+WyXI7Hzt4/EfP6z5DTu6WW/VOwF8iSyEqKNjTkyA0pgfOOb0fTcL8A2hTtaT+p+N/nOSgJnEm42qk/XYguA4yketatFVcDi2EyAyIznh0Iqs9h4Egd+x7BBCxtSTWcn1YicX80pkqUbZJ0oOtqIQmXoGhXMBkBsfAW6xsh/xw2GYReal8hKtBn2esiYhx5SEWCvFpqn6h9uRxLjA3kpL6jOs=
X-Microsoft-Antispam-PRVS: <DM5PR0102MB3416F1512544B337722909D2AB9C0@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(264703809997249);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(6072148)(201708071742011);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 067270ECAF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(396003)(346002)(376002)(39380400002)(366004)(39840400004)(199004)(189003)(65826007)(2361001)(6916009)(117156002)(478600001)(97736004)(966005)(68736007)(5660300001)(31686004)(66066001)(65956001)(65806001)(229853002)(6666003)(47776003)(2906002)(6486002)(25786009)(64126003)(2351001)(305945005)(476003)(2616005)(446003)(81166006)(105586002)(2486003)(106356001)(81156014)(52146003)(8676002)(23676004)(52116002)(956004)(11346002)(67846002)(7736002)(230700001)(186003)(58126008)(16576012)(316002)(486006)(6306002)(53936002)(36756003)(31696002)(6116002)(3846002)(575784001)(86362001)(16526019)(77096007)(53546011)(50466002)(4326008)(76176011)(6246003)(8936002)(26005)(386003)(59450400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416; H:[192.168.0.3];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDJNQjM0MTY7MjM6Y2VlRC9jdWJacEZBS0Z3YVpUSUc1cHpv?=
	=?utf-8?B?Sys0R2wybEYrNy93Tjk1akdZTmlWL1JtVjBCUGxwbVpxRmFNcVpMMXplcHpj?=
	=?utf-8?B?dTkwYnlYVHdXUlBTOTI0UGhnOXoySjh0NkVxelhLTXVGRkhyOWdPTCtsT1Aw?=
	=?utf-8?B?bmYrUG9HMkRMMmJndDZGUEEvZUtaRUJDUlp1NmNYNjkwRmIrODc2U0JuWjFQ?=
	=?utf-8?B?cFQzQVZXYlNDODZZRm01RTAzM2tMQ012b3hEbzJqdnJYRmdZUHdHWm1PU0xI?=
	=?utf-8?B?TmlIdkNYS2tUdTczRmRyZmpiaGRlZjBhanRKZm5wUWtIeHdzM2xIeUxuNWFr?=
	=?utf-8?B?cXVOZEtpYVRibHY5YlJSeUFJd0h6V3BwMnk0Y3ZhS3JIRkY1VU9zdXJsUUdG?=
	=?utf-8?B?aUJTWXZCU1JrakNuU08wZk1VK0Q2Tzd5MHZPRDhnSUlSc1JEUWNTYkt0RWlk?=
	=?utf-8?B?Mmc0ekdsN2JXSGZBbk1hWkI5MFBkYnZRTVNWSTdvL2hGVVloZGp3L3hDaWkx?=
	=?utf-8?B?YWdtRmhpbmd0KzB1bGdpYjk0ek5ySlBvZkJpTHBUNjJyZHpaZFZTbEdWaHVY?=
	=?utf-8?B?bE9Nb05wQWcwSGxIMEgxVjNWNVNpbDJWcHJSWXZwWXNFZllPZUpmWTdpTm5p?=
	=?utf-8?B?eHhjRHFaN2cxV1dlZUIvSjQ4MWlxU1l1RjFWY3dTb0xiUGdmNklNN25kUzRp?=
	=?utf-8?B?OHErS1AzaTB0T09PMTFOemEwZ0J5b0RGbUJ4UjhEMWQ2ZE41YWlHZW9hOU52?=
	=?utf-8?B?QlozZzBKQzB6cEVDMWx3Y2dyME51RkxBOVJ1YjFWbEI0NS94NkNBZlFIVEVk?=
	=?utf-8?B?ODJidzZmSHJoa2RwU1FPbWVpWTZ6NzhjTUx6Q2FoY0J2YW56d3IyU1o2MkJ4?=
	=?utf-8?B?TWZwUG4xRWd4UGxDUzdRc1M4M294Z3p4TXNUUzFVcy9mQ1k2KzhIam1zaHlr?=
	=?utf-8?B?dGFmSEhkN0prMTE3aXdrby83Y1dnNWZCRUJzdWhMSlVBNFE4b1VEUFp5WGk3?=
	=?utf-8?B?NXc2bG5XSFRSMnRkVHJ1a0NaNC9jR1ZaRDdUOFNwY1NiV1QzdXlFWjlEcHNM?=
	=?utf-8?B?RThxVU85Q1ZGSnJNUG9VdnEwWVNXVGQ0Qkd6ZEhZbjdxMlNMSkZUblVJcUNW?=
	=?utf-8?B?TExxaUNVNmxpcGFJWHEyS0M4eEEwMEo2SkdkQ3czanl4OHl6Vk91N2JqVUE1?=
	=?utf-8?B?SzZsOEJtMThnckhnT2lhdzl3YzZoRVc2Q0NEQm16UjhvclpUVFBKcU52RGRu?=
	=?utf-8?B?L1o0TkVkaWE3MGFURVU3RlBTeWFPQTdzdTN6RGZVeHZJSGtOSncwVXF2Q1k5?=
	=?utf-8?B?anZBdStJaUdncWZET05lU0FQK1dyQ1ExRzhtNWQydmZFYjJhRzhYMElxZlNI?=
	=?utf-8?B?dy93clNnb2taeUpwa0FZcFdvUmN3Zi9jRDVZdllmUGk5WTYwUmNSN3NHOXRG?=
	=?utf-8?B?ZXVqZ0JrdERWaU1ZM05sY3JQQU9UTnAyTWNFbGZyNTc3Sk4xRTRhVDZnOG9D?=
	=?utf-8?B?Rk5Hb0ZrQzJkZ3Z4Qk5aSkJVT2lFcXg2TG1BOGd4U1FuM2F1K0FyZWdwK3RZ?=
	=?utf-8?B?blY2bk45ZG5HeDNTRzEvUlFIcFAvbU1CVlg1QmlHNTdBNGltR2pZc2J0WTJZ?=
	=?utf-8?B?VlREZGV2Yzd3dkFMYnFqRnlHTWxicDdwZG5SV3VDV3N5bTBpeFJTTzM0Qkh5?=
	=?utf-8?B?Zi9ZcjdjUTNyb2RUR1RobW5PZUhNU1FWL245YTFPQWhSdmdWM2grbXNJVjln?=
	=?utf-8?B?YkpReXBEWVJtUXJwR1B1UG81YnZjcUtEVVI1UEJPVGgwS2txdEpDc2NIT2pY?=
	=?utf-8?B?dzRZb2VXODJoekRWbzgvSXQ5cHNnVXVzQmdCNGlVdTlURWw2Z1dXWThES0hF?=
	=?utf-8?B?bDkzWkxLcWdaUFdzVGlWSi83byttdVF4Q28xZk1wVjFFYXEvc1pTNEpKd2Fh?=
	=?utf-8?B?d3JqcXRvREhFYlJsQ0RnRlMvNDd4dklLYm0zSEVDWGZZWTJkQVhiZ1NNZkhn?=
	=?utf-8?B?TkNQZHpYbWs1OERGMVZWY0xDVTdwRG5CbnZNeVlZMTdoM0pMUmpMSzIwL1FC?=
	=?utf-8?B?R2g5czFadXIvbTY3RzBsN21wUndMYmFTbWYwTldJVy9CRUFHekNtN2tJcSs3?=
	=?utf-8?Q?d2vkrYT5dGFGsGxbdPD7AzpdY=3D?=
X-Microsoft-Antispam-Message-Info: ehLYN5+plKmJW6dw20WylCqMcGRpB7Xc6DWaX6WPeAtnBeQz0CNZNBoBmZ+pRCtktMpEvdahbY9gTIcWg003WBOshoqAfYQwZRXpGrDSxPFIXJqOijOPbQ1B/3k7Z3EAba5lVC8hko2sDpwPP6k2pJzTVMtWydjKbslnK485kyIIlDIH57B6gjzAUq1KvH/J
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:HhrNANgK5fSZzmKKSsEXnHR4hnWCTwrCtJ1TxpwOKoMPObhTqXhcUK9u8ocSZW9aLy62J/ZPNQsgJubLjT3S9sjawU6C2jaUWQcVhaRDAETTCbwe54+igr2abqxthq+AQ4Nk0R9mUPuO0BJueDQ57eWvn1bi/RzTzji/dGSPPdMd91lKpVEZrNUlTs3cQNsnbiT8wput/R5Lc4jY+cIQZsxCmZmh/aa6JSFy2TXpeUwms8hLvUpAaP6KLBe6hg5e92kyF3OHvVwjrQASeHwuF6B88rU7a5Z//CazttAfFm8n0hlXUMzIjFAY//yx16sptDfU9Ycf2TlcG491yfMd8WrYqcaoNS8IoL8VoeJZNIC6el8oYNMj49ySwcPs1I7RWA4X5HPj2r2MxUhZz3ILggkRVn4zCOSZ6Sna3NKeYCjxH+O5fP9+FZlp7762t7MprBbXQoldAb49hwV48Zbx7w==;
	5:VT5hozFRuX6ObLPdwq72Ogtj6tMRC3kdcHMk0Bcw5fL410ffnjI4ngYe/4qWCCQvWCJso5LfP6bTUOeSNoJbeJF4zaA4s+KkVkTkGrIfqLLeZhFfLE7zW7HOG7fWKRBXe2U4jC0hTu+Roc3XjVVqRX95jpUuZCDwlUAH26QKQVw=;
	24:JCIa6HV+3F+PlTPsr48w+SW1vHxYItGF+uLgc7yi71e9uzAo5L++jA7Basxs3IhuK5Lp752Lt6q+Jj1/2oyJx0F7rDxChdp30R1cJHaY+5M=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:rI77FK0DtuDUmly0pED530vVXA3wd2/bkETgweHa+zhyAv1oL6Yf68ARUWY4SGWkFfujaJqd3HBzHeKeYJYObZYtaW0M+v6ICMsTaOFUYNWetA4YFQqe75M1JsJyZU8o+tdNf9B1FCHsnQO55IM/FHLNP+bXcXo+21JD348rqGhnYCu9rDhNLgfPxQgd74wpEixuALRVjEbpmomGtcvjQ2P5m2xuGEQZOAvWTvk6iVgQ/vcAEEat8kr01tXERSuW
X-MS-Office365-Filtering-Correlation-Id: 9b621b90-3417-4d0d-97cd-08d5b9b5fee2
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2018 16:16:05.6775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b621b90-3417-4d0d-97cd-08d5b9b5fee2
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meson.bbclass broken on rocko
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
X-List-Received-Date: Mon, 14 May 2018 17:49:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/11/2018 04:52 PM, robert_joslyn@selinc.com wrote:
> Martin Kelly <mkelly@xevo.com> wrote on 05/09/2018 04:44:05 PM:
> 
>> From: Martin Kelly <mkelly@xevo.com>
>> To: robert_joslyn@selinc.com, openembedded-devel@lists.openembedded.org,
> 
>> Date: 05/09/2018 04:44 PM
>> Subject: Re: [oe] meson.bbclass broken on rocko
>>
>> On 05/09/2018 02:04 PM, robert_joslyn@selinc.com wrote:
>>> I have a build based on poky that makes use of meson.bbclass from
> meta-oe
>>> that is now broken after a recent update to OE-core. When using the
> latest
>>> rocko branches from poky and meta-oe, my meson builds end up with the
>>> wrong paths to ld and libc. For example, running ldd on one of my
>>> binaries:
>>>
>>> linux-vdso.so.1 (0x00007fff4f9ee000)
>>> libc.so.6 =>
>>> /home/robert/yocto/kiosk/poky/build/tmp/sysroots-uninative/x86_64-
>> linux/lib/libc.so.6
>>> (0x00007f1136f8c000)
>>> /home/robert/yocto/kiosk/poky/build/tmp/sysroots-uninative/x86_64-
>> linux/lib/ld-linux-x86-64.so.2
>>> (0x00007f1137560000)
>>>
>>> Those paths going into my home directory are obviously not correct. I
>>> bisected the issue, and commit
> cead3c4925d39f8adc328007d8a8c1b23cc72842 in
>>> openembedded-core is when the problem starts:
>>> https://urldefense.proofpoint.com/v2/url?
>>
> u=http-3A__cgit.openembedded.org_openembedded-2Dcore_commit_-3Fh-3Drocko-26id-3Dcead3c4925d39f8adc328007d8a8c1b23cc72842&d=DwIBAg&c=zVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-
>>
> Gb60_N6TVnLk&r=FXexzueMZc3SeYPHXBmsGdHLENOHmHsvnD0cO1_Z0j2tHI6VqrQPNkHBCZO8dAdc&m=JSVZRc5Fq4IsIwtkdFHpTXsgF8aCQ0vP6j_F7dT5tYc&s=OutJG7fOSrT6ANwnnyxx12eHu6yepO-
>> b2NWHJeP93x0&e=
>>>
>>> When using the tip of rocko, I can make the issue go away by removing
> this
>>> export from meson.bbclass:
>>>
>>> export LDFLAGS = "${BUILD_LDFLAGS}"
>>>
>>> I'm not really familiar with how this works, but it looks like the
> change
>>> to BUILD_LDFLAGS in uninative.bbclass is forcing the binaries to use
> the
>>> uninative ld, which isn't desired here. I assume meson.bbclass should
> not
>>> be setting LDFLAGS using ${BUILD_LDFLAGS}.
>>>
>>> I can send a patch removing this export, but it feels like all the
> exports
>>> in meson.bbclass are incorrect. The class has been reworked and moved
> to
>>> OE-core for sumo, so I can send a patch backporting the entire class
> if
>>> that is preferred.
>>>
>>
>> Does the issue go away with the oe-core version of meson? If so, I would
> 
>> be in favor of backporting the entire class. From my memory of the
>> changes between meta-oe and oe-core, some of them are significant and it
> 
>> wouldn't surprise me if important bugs were fixed.
> 
> Yes, the OE-core version of meson.bbclass works fine when I copy it to my
> rocko builds. I'll send a patch to backport the entire class.
> 

Sounds good to me; I would support such a patch, as in this case, I 
think the older version is likely just broken and thus using it is 
really the riskier thing to do.

> Thanks,
> Robert
> 

