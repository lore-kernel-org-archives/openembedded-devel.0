Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 3642 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Dec 2016 20:33:04 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0091.outbound.protection.outlook.com [104.47.38.91])
	by mail.openembedded.org (Postfix) with ESMTP id 17D3560745
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2016 20:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6SaeQl8jpPIhAZI8q4s2cl8rwXcgLLT4wwFe2Gx3NDE=;
	b=KheepBhsUm2vp0t+Z3vv5RYu1ylb0/IItl+5o9zukizkLHm8z6cKYRYbk4ukEqlqZWRif0YkwlsgAjf3CRA7kQysmMq/HDjLrMn+uedqlft8CVXX8kIY8stBPv8uZlrw/3Z6lWbRYsdrsYV+eCMpDENwLdXc+bjHtuSKkfcizAs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=haris.okanovic@ni.com; 
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	DM5PR04MB0699.namprd04.prod.outlook.com (10.172.187.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.803.11; Tue, 27 Dec 2016 19:00:09 +0000
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20161222200250.23273-1-haris.okanovic@ni.com>
	<CA+chaQd3YPtvxY7CN82m86v5V=fyaYk3pWs4fF9TqFknWzE7HA@mail.gmail.com>
	<CABcZANm4R2Lg5oNLbYihDjH-cxCq-=sKt6BXBcF6es-8z=khuw@mail.gmail.com>
	<CAMKF1srxNFSR2sr1akxGsFCMM38PWHK+WoL63GL1=HshneOYLA@mail.gmail.com>
	<CA+chaQesRK_aTrcYM5Ow+TeNXtLkvzr3+dAxjKFvoLaQn_Fbuw@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <5688708b-a1bf-765e-81e0-697b86bbf41e@ni.com>
Date: Tue, 27 Dec 2016 13:00:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQesRK_aTrcYM5Ow+TeNXtLkvzr3+dAxjKFvoLaQn_Fbuw@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: CY1PR21CA0088.namprd21.prod.outlook.com (10.164.213.14) To
	DM5PR04MB0699.namprd04.prod.outlook.com (10.172.187.141)
X-MS-Office365-Filtering-Correlation-Id: 077a0a99-44d8-4fc6-94e9-08d42e8a943f
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR04MB0699;
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0699;
	3:4Qpk54TazyAjQmHD0T4h8JVMT/vVI8RV2xptInNNaauTSuqkg0O+KxyrT294t5R6lx7WYnHPaaIGYe+35nqRsPiNH5H8dzMFGeQHf22OfrI42tRj2aM0owBoLfDM7qqoY8rMcla5LnFkoLQqggUVNpNW66Q24A2cOenCoAJYkwgIOp1xaig1XBybEPw3KjzyiZCUtR7R1DZwyi4EYoIj0xtzWcXHGX3QVKYU964KLbQOPWDpQFUvRFRMkrIPJ/4ANRnZjm4Mxdbrl9TKzOOdeA==;
	25:z/dNCjKhuwwnoIpzwgBR7kKLnze2Pr3ldNs5lWp8ytaPbM4zO/POC+r9XCVik2H+WEWgMx3jcdExkv4kInVUOEld3IJVd34nLQpMbf2FSQrCoQbS400z/+5PbexQ+I4vicXjiQYEpNhx21Kplzusq1NF3Hls/bbGWscJR9rTB8YAoj1qXEU9jaXJN8jktv0bxdSeIMug2U1oNn11jpbjjpRX3iTvpJAvfUA5khGCcypzIOCc27WqV3egbNzV3uhlI7UJfOcKDaHNSIGGA8sUMfxE82KtOLxXRhSoQWzuuGvFX3KBjAAdCIJRUNt0z407TTc8wKk2hraWGcffouQOBwfhnxGQtMNBRsyHEcbpoek1i8TX+hAmsIgBkN+5EF73vpkqyaLZDs+SVrd6Jpr8TgBj044ylWPJN++gUic8xmuXvSImJZQvzF/MMKvEfmh58OD5DNIB4SlvtqG+bj6Vcw==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0699;
	31:YvqFSELNPPU8cbmDrtU3mWOj+GgTNh3Z9btxhWGhc4EQ2QoGCidPmkm1xniVXbwiqiZx+JYTDYEIJvlHSneTV8yIFNb/detkmymaA2wX9TxvQraZIij9K3Xh9nYWWKOckHZ2H15yXuJU2RMfbdvkW096jqqpBD4WtLTGdCa6OGRjyaKd9v0Wmk4fEtF5GzHFljhYxJikOTd9dZgslGzAK3iUz6sxedeU5NyiBsrGM+u27LY50TN8WGpJaChWivJFIqlv81/04R3kXQodwEm2fQ==;
	20:CN04QT8CWwdHxDD+knJi6OQ1VVWwCSGC5+u9iLDo3+nAgRxpjjZKsxTqMepivfeu+x2uVILG0HdHREKWB0m6BZHKu2X4HqksLERKuRVxfBzgJM1mpV3fBiKhQC/HsSnrAc2/Z/lhf83ivmbAMcXsGbralPWFwfsMf8ranO1YVpkEhAxP710G8hPu5SE7B8UWthGKKTYzivM213OWA30iSd+kxCAA8O0J8JnhLHSdfQRDR+9wLKIm9Tp9dnTV623sdp3/PGRnSkSquYSnTABN8vzn2XAos9sAH4moz7D2ysFA1IOQlsTb5//SRoDfX8KQxE9b2Z983Lu/x9Pxx2B+eSppKxhn9ol5MHa5excy7oMo+xs4vVzd7p1wWlvJp3YNcbQszKQ70jfBFim/pPLGZS8Zzon9/ICdhodNPeJah5ZtGFX2bmLe3og5XhSquGzgst62mnRQ0lkBLodl2cKXqKb3dm/tQwx1kIMxMpS69kWrOxouUd8Yy7Xc2SRUTwjTMoUS1u59ilX+ORRs2zgajVXsGswq/ouGqR8Ruj0YurK/ONsZmkd9mOH556VfDWgvzQkjopEtio3BT3+xqEHtUuAm6Hh4Hu1xUHq4lSu1xPw=
X-Microsoft-Antispam-PRVS: <DM5PR04MB0699CD677B248A7895DB1718E5690@DM5PR04MB0699.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(5213294742642)(145744241990776); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(20161123560025)(20161123564025)(20161123562025)(20161123555025)(6072148);
	SRVR:DM5PR04MB0699; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0699; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0699;
	4:N73rTw2z8E8nJcqpkWzETH4esY2W5efvFl73yIpVrxZIET2kmd31ZEfYfj9W+mPJC8N2WEEWpfZF/BoB8M/l5qXo0g8L8BJLHiIEkasu0EGuPcwEvMmN/ua7n/vK3Gjb4/3ViV+n8fJZiCgB4la03G82TB6VhACRcSt+RvtT/V2LYYpLA5aPkJRyfBr8VzXBlig+fzAJ69+T9dnrDXm3S8qHNd1A6/JuHXL46SrmkecvmyP0Dz3zdR7nXzzb6Jx/YSalQImYncDcJe2hPM5qCI6l9mG0ox2ywJ/7et/yAbFqoyGU30Q33ty+QBN9TAxPTzdNgTQsN07t9XLLBaLQ0ZERrrYGwp7CL0Z5kYIZVII8beHF8geYeHQ55s7ZsmcTsa+E3yIcVS0Uw1TihyVHiPypvR7aCoW/YdIkhqrztX2W0lkaU4+rMyFe8uQ4z4Pu7IP6TIRDW/57Cp5zq9kd5xQQBKCTcEQASvrYI11GRv+l96ogjOCmuyX8HR2Q2DUMTPBe2Uwa7fTNnm06GHc0oyfYhE7c0/fsbxxl187EWf0FeaAwFRLeo51n1wqsf6xx7BzMMDHgElPTn1z6MdSym6lejCQVR2Q5jBY34NqOl5rXMRzUhFdL0Ql4LqcX7ub2HcoM0OHud1lxxgYfgWdJNTuSMuwLUw2TL2LQ4xUrfP1l7TDr/OU5Y/gyxNNI93wr
X-Forefront-PRVS: 0169092318
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(39450400003)(377454003)(189002)(199003)(24454002)(4326007)(38730400001)(64126003)(39060400001)(189998001)(97736004)(6486002)(4001350100001)(6116002)(36756003)(229853002)(6506006)(6512006)(83506001)(68736007)(31696002)(65826007)(2950100002)(86362001)(31430400001)(3846002)(6666003)(110136003)(2870700001)(25786008)(6916009)(50466002)(5660300001)(2906002)(47776003)(65956001)(65806001)(66066001)(1720100001)(42186005)(31686004)(92566002)(106356001)(7736002)(305945005)(105586002)(8676002)(93886004)(54356999)(101416001)(81166006)(50986999)(33646002)(81156014)(23676002)(76176999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0699;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA0TUIwNjk5OzIzOmhwREEyQUgrMStoc1NDa1NNVnpMdU9nOHNo?=
	=?utf-8?B?ZFBsRElKc2p2THQ2Z015WTF6MCt4V09SaHBva1JSdWdOdXArWTduNGxSMVIv?=
	=?utf-8?B?V1VqYS8yWmNWYjl1UDV3WkQ1VEVYTVV5VVc4d0Q0SXoyeWRRWWVhL05Sa015?=
	=?utf-8?B?cXNwRFNPT3BqT284MlViWjQzK3MvaUhqRkttZUs3MnBHWUVDeTZ3TkdkZE80?=
	=?utf-8?B?Ym11SSsyUXJjOW4zNUE3aUpCSUZoUTZySE9nd0FlSXo4WVFicU5QSzc1WWpL?=
	=?utf-8?B?T1QyUE5UcFAzemJSL052eXdjTkIxMkZvT2lvS09meXZFTjRqSWwwTG1oaUNP?=
	=?utf-8?B?RmRjUXR3TkpSTTM4RmtuVzVEN2ZOTmlpaXZXdnl1UEJ1bURjY2V1SjZ5Z3pH?=
	=?utf-8?B?anNINTI4cVMvcGN4R1NhKzZsVklnY1BCZGEzMlBQOWhEc0l0MzhOdW16djlD?=
	=?utf-8?B?T3IwQkhNUWpUOUM3ZTBNTjkwb3JMU25vdVIwWGd3SU5WdWdtTGlTT2FReWpj?=
	=?utf-8?B?azNGTnl1VGtHM0NVZXp0eXNiRFZLUG1IUlppd0hSbGwvdlllV2RKeHpPbVRW?=
	=?utf-8?B?Ym1sQjE0V3VOUENMMHNLdG1kUGlGcVMvc1BMelA5M3FjU0dxc3BSd2p0cGtt?=
	=?utf-8?B?dTUxY0lCd21KUnNZWU9jV3dhdEpCQWYxVUxvOG9xSFJVL1lCaTVzVWFrZTJW?=
	=?utf-8?B?dUtlZndQNS9tcDFTVE50WUtsOHhzSVd4UDZ4MGpDdnQxWm5SMGErVEpSY3dj?=
	=?utf-8?B?WlVreXdTN2dkK2hpRmhPYzQyRlNDc3JoL3h1RU9IcWU0UmpwQS9rWXRYcUUr?=
	=?utf-8?B?WWdDR3VBdlJ5aHI4TXpNMEZqekIzdVZ5SHR3dkVpYTFiR0oyQ2VmR1BSWlEv?=
	=?utf-8?B?Y0RUT0JrWDFwWkxxZnVYWGlEaHdxa2QvTVpBaFlvYllUbEo0SkQyaFV4TXdL?=
	=?utf-8?B?MVhDdkdRSVJaQUJpa3ZuaFViRFB6bXdGSUsxL2htdUNSWUtNbWtnUWdOU21C?=
	=?utf-8?B?OTVqV28zbTdvOGF4MXRhbzRBRitEcStZV1YzeVh5SGs0ZEczTWdETU5VM2ZW?=
	=?utf-8?B?L2FlY0xSNDM4UnMrY2NOTGVMN2lTc1luc2czNFFFbHoxd1h3ZUttRmQ3d2xU?=
	=?utf-8?B?b3Y2THFZbmR1Ky9aWW9Cb1JiSWMwVkxvaHpUZDJWTUJZKzNodW5LL2Y0b0JU?=
	=?utf-8?B?bnFMQVZqVTFEYVlOdU9DVTZVNXp3a0d4SkN6dHZ0VzdrNHlSOHZmbHpiT1ZL?=
	=?utf-8?B?ZlpjN0dlcnlWWWY2ajRnQXcza1VqU1VEZVQ1N3RZVGZiZVQ3emYrQVltU0ow?=
	=?utf-8?B?V2ZxVTN6NE5udjk0cFhqTzNPUUxVd2RGTUpJSFZ3cnBhVDFQblVsSUFHQUJj?=
	=?utf-8?B?UkR2ZjVIN3ZHQmZFTFlnSnRRdnFqR2IwdDBZSTNaMFpiVlNYZkhLai9UanpT?=
	=?utf-8?B?Qm1kaG9IMTBCWWRERlB4VWNUT2FpbjZYR3RFMkpRWWZHakI1RzUvVlZqZ1RS?=
	=?utf-8?B?Z240d1dxR3RVK2Y0OU1obExmRUNVK2ltZkFPSXZQbVFCdG5FZXl2N212azlh?=
	=?utf-8?B?S3RqTXM1Z3Y2UDB6cDlXaXV0SzRpSXh1VDNOWjRxTDJLcVFuUHJURDlucFY4?=
	=?utf-8?B?cmF2TjNZK1BTS2NmY3k0UGtGZnpXSW0vang5VmowYm93WGRuMnltMUtZQXkv?=
	=?utf-8?B?OER2TUNObFJoNGk3MmVDcjUzaXFqa08rLzh2T3VheE11THA2cFZMRWJwdFRC?=
	=?utf-8?B?OTk5Y0tlYmtGN0FwU01VY3VJM1Qyc2JOajFNbVQ1QlY2RXR5VVVpRDFzODNh?=
	=?utf-8?B?dSt2eDBzVmd2NHhvdDh2eVZjbWlLdlhaNEtFeTdFM1FxME40dENtaW5xSExJ?=
	=?utf-8?B?WXVBd2hXRjQ4Z05aNk1iNDRGZ3ZoYXVHTXhWMXJFdVlGNjNwMzRON1ZNYkI0?=
	=?utf-8?B?MytOd3NxMGxnPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0699;
	6:rh4ffrRNTQAvybTdUEvDDryOdsivZHKrM/0kSKaS7CTmO4o3ZHs/CsxtEf+7KYGE8xIqykrTenLQQTNFVZERWyi/6+LD7YhJfkUnQ0+9rhn6IyOg5HL6WRZzJtlLe7KyFyR4d9JZRRB1iQSRs/6U52vH/jh8lQaxQmHv0GM3NaRldfNcB8hgr980BniE/wChbwgGreUg8jf84TssVaRUCVN3XKSilixwc3BhuaDgrKtLk2k3ZYp/4rQvjDLY6VacCaZAmEwindF2UhF/2AATZJlWUs1iSS/6ulhuFp9k80i8Muu3wx1vcAoR7khDLUWjBoK/HkrzVE0KfugXpZG6Iau23f3Dd98Zo8w8uZBEmQaiF8crcjabGZ6gutTVigZwNuqCMVQ3ixC3B7eGGXVgnTRkwFm+jgjYkHO21UutjHM=;
	5:Dr7PC5yeT6PqwyRyYv08eZpNbi2WXExEZ1OYJCDCmEHInERCp5sjrldE/BKxelMgEk03lAKa4EPYNNorWJnGjbbBU0Ou1BH0bxT5qhWmipYWXPjIN2VWF+kQbhdOCTIjez3++fzU8duTPMa5bYiE9g==;
	24:3Q26LFUth2VEqC0hL0b15VgANciAwG8DFoA+t4s8FST1s1VFMM+0uhb4xaJlIRK3bPrVHxmwW7yBbyFScXCHYjNQ5RestVJJPLb2449Mwjg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0699;
	7:ClUCqm/zbEdFlvHdlppbjIvz50Kk17VZ3+oH5lcAI08e1oKJ0RNTOv1deXxuYl78ySM3wUeukES1SoJr7pXPEZl93gqQtN+OGkY2s7dXWidr8HjdGLNWYQ76rQkb9K/qrFS0OKHT8zn7TBI27YlSW5RVFQkOsyYUDZZPw0o+Py9owo+nLuRY97WjMqm9B8fJQ+vzwn5YeudrZCYwokhXfghdf5VedoguxXO5Q6QWyVg7YBzjPYwcXgmO21c3fCceGBK7yA6MZhnYPrQdVJMqGuoB8piFgxsk6HiAfrQy4ZrUI8HmZ0HD6jRz7NJUxJc7MxYYFlivFRloaJ3qHABUZVIYf0tldDVgpQVHkR93Ioww1aCgP5WwG2zBpQBZb401oWsD0X9tARzY3ElXgEnkz4d14xHMuNuvXFM77+7x4ktdqdaRVCfi7FUq5yEuVZZxlfe6C78nU1cUqGYnJwoVVw==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2016 19:00:09.0209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0699
Cc: clarson@kergoth.com
Subject: Re: [PATCH] hwloc: Add
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
X-List-Received-Date: Tue, 27 Dec 2016 20:33:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for looking over the patch. I'll post a V2 shortly to address 
these issues.

On 12/25/2016 05:55 PM, Martin Jansa wrote:
> Missing dependencies and PACKAGES_prepend breaks hwloc-dbg, because of missing space at the end of the prepended value.
>
>
>
> hwloc-1.11.5: hwloc: Files/directories were installed but not shipped in any package:
>   /usr/src
>   /usr/src/debug
>   /usr/src/debug/hwloc
>   /usr/src/debug/hwloc/1.11.5-r0
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5
>   /usr/src/debug/hwloc/1.11.5-r0/build
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-xml.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-text.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-fig.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-draw.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-color.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-cairo.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-ascii.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/misc.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-ps.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-patch.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-info.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-dump-hwdata.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-dump-hwdata-knl.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-distrib.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-distances.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-diff.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-calc.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-calc.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-bind.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-assembler.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-annotate.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/traversal.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-xml.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-xml-nolibxml.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-xml-libxml.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-x86.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-synthetic.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-pci.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-noos.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-linux.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-hardwired.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-custom.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/pci-common.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/misc.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/distances.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/diff.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/components.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/bitmap.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/bind.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/base64.c
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/xml.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/private.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/misc.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/debug.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/cpuid-x86.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/components.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/plugins.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/linux.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/inlines.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/helper.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/diff.h
>   /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/bitmap.h
>   /usr/src/debug/hwloc/1.11.5-r0/build/src
>   /usr/src/debug/hwloc/1.11.5-r0/build/include
>   /usr/src/debug/hwloc/1.11.5-r0/build/src/static-components.h
>   /usr/src/debug/hwloc/1.11.5-r0/build/include/hwloc
>   /usr/src/debug/hwloc/1.11.5-r0/build/include/hwloc/autogen
>   /usr/src/debug/hwloc/1.11.5-r0/build/include/hwloc/autogen/config.h
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> hwloc: 75 installed and not shipped files. [installed-vs-shipped]
> hwloc-1.11.5: hwloc rdepends on numactl, but it isn't a build dependency, missing numactl in DEPENDS or PACKAGECONFIG? [build-deps]
> hwloc-1.11.5: hwloc rdepends on cairo, but it isn't a build dependency, missing cairo in DEPENDS or PACKAGECONFIG? [build-deps]
> hwloc-1.11.5: hwloc rdepends on libpciaccess, but it isn't a build dependency, missing libpciaccess in DEPENDS or PACKAGECONFIG? [build-deps]
> hwloc-1.11.5: hwloc rdepends on libx11, but it isn't a build dependency, missing libx11 in DEPENDS or PACKAGECONFIG? [build-deps]
> hwloc-1.11.5: hwloc rdepends on libcap, but it isn't a build dependency, missing libcap in DEPENDS or PACKAGECONFIG? [build-deps]
> hwloc-1.11.5: hwloc rdepends on zlib, but it isn't a build dependency, missing zlib in DEPENDS or PACKAGECONFIG? [build-deps]
> hwloc-1.11.5: hwloc rdepends on ncurses-libtinfo, but it isn't a build dependency, missing ncurses in DEPENDS or PACKAGECONFIG? [build-deps]
> hwloc-1.11.5: hwloc rdepends on libxml2, but it isn't a build dependency, missing libxml2 in DEPENDS or PACKAGECONFIG? [build-deps]
> hwloc-1.11.5: hwloc rdepends on libudev, but it isn't a build dependency, missing systemd in DEPENDS or PACKAGECONFIG? [build-deps]
>

I'm not really sure what happened here. `bitbake -e` shows a properly 
delimited PACKAGES when I build:

PACKAGES="libhwloc hwloc-dbg hwloc-staticdev [...]"

However, my distro has some core patches which might affect this 
particular variable. I'll pad with spaces as you suggested.

>
> On Thu, Dec 22, 2016 at 11:56 PM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     On Thu, Dec 22, 2016 at 2:35 PM, Christopher Larson
>     <clarson@kergoth.com <mailto:clarson@kergoth.com>> wrote:
>     > On Thu, Dec 22, 2016 at 2:34 PM, Martin Jansa
>     <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>>
>     > wrote:
>     >
>     >> SUMMARY is for short summary, put long one into DESCRIPTION and
>     create
>     >> short one for SUMMARY.
>     >>
>     >> Also missing sha265sum, so I doubt it was tested properly.

Andre pointed out that "a single hash doesn't generate a warning" in a 
separate thread. However, I added a sha256sum anyway since it seems 
pretty common.

>     >>
>     >> On Thu, Dec 22, 2016 at 9:02 PM, Haris Okanovic
>     <haris.okanovic@ni.com <mailto:haris.okanovic@ni.com>>
>     >> wrote:
>     >>
>     >> > https://www.open-mpi.org/projects/hwloc/
>     <https://www.open-mpi.org/projects/hwloc/>
>     >> >
>     >> > "The Portable Hardware Locality (hwloc) software package provides a
>     >> > portable abstraction (across OS, versions, architectures, ...)
>     of the
>     >> > hierarchical topology of modern architectures, including NUMA
>     memory
>     >> > nodes, sockets, shared caches, cores and simultaneous
>     multithreading.
>     >> > It also gathers various system attributes such as cache and memory
>     >> > information as well as the locality of I/O devices such as network
>     >> > interfaces, InfiniBand HCAs or GPUs."
>     >> >
>     >> > This recipe adds libhwloc and lstopo utility as two packages.
>     >> >
>     >> > Testing: Built in OE/Krogoth. Installed to x86_64 machine.
>     Successfully
>     >> > ran `lstopo` and verified it printed correct CPU and cache info.
>     >> >
>     >> > Signed-off-by: Haris Okanovic <haris.okanovic@ni.com
>     <mailto:haris.okanovic@ni.com>>
>     >> > ---
>     >> >  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb> | 25
>     >> > +++++++++++++++++++++++++
>     >> >  1 file changed, 25 insertions(+)
>     >> >  create mode 100644
>     meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb <http://hwloc_1.11.5.bb>
>     >> >
>     >> > diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb>
>     >> > b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb>
>     >> > new file mode 100644
>     >> > index 0000000..3a88f5b
>     >> > --- /dev/null
>     >> > +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb>
>     >> > @@ -0,0 +1,25 @@
>     >> > +SUMMARY = "The Portable Hardware Locality (hwloc) software
>     package \
>     >> > + provides a portable abstraction of the hierarchical topology
>     of modern
>     >> \
>     >> > + architectures."
>     >> > +HOMEPAGE = "https://www.open-mpi.org/software/hwloc/
>     <https://www.open-mpi.org/software/hwloc/>"
>     >> > +SECTION = "base"
>     >> > +LICENSE = "BSD"
>     >> > +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f99
>     >> 0b"
>     >> > +
>     >> > +SRC_URI = "https://www.open-mpi.org/software/${PN}/v1.11/
>     <https://www.open-mpi.org/software/${PN}/v1.11/>
>     >> > downloads/${BP}.tar.bz2"
>     >> > +SRC_URI[md5sum] = "96c34136ff416d2b13a7821c27477bed"
>     >> > +
>     >> > +inherit autotools
>     >> > +
>     >> > +# Split hwloc library into separate subpackage
>     >> > +PACKAGES_prepend = "lib${PN}"
>     >> > +FILES_lib${PN} += "${libdir}/lib${PN}.so*"
>     >> > +${PN}_RDEPENDS += "lib${PN}"
>     >> > +
>     >> > +do_install_append() {
>     >> > +    # Let ldconfig do it's thing, no need for these symlinks
>     >> > +    test -L "${D}${libdir}/lib${PN}.so.5"
>     >> > +    test -L "${D}${libdir}/lib${PN}.so"
>     >> > +    rm "${D}${libdir}/lib${PN}.so.5"
>     >> > +    rm "${D}${libdir}/lib${PN}.so"
>     >>
>     >
>     > This link manipulation is also inconsistent with every other
>     recipe. It’s
>     > not appropriate. If your distro wants to rely on ldconfig to
>     handle the
>     > links, then your distro could do this for all recipes rather than
>     just one.
>     > This isn’t how things are done in our existing recipes.
>
>     There is global knob USE_LDCONFIG, perhaps thats what could be used
>     but generally I agree with Chris here.
>

That's fine, I can remove this. I really did it to avoid a dev-so QA 
warning, which isn't very amenable to lib* package names. It trips on 
symlink in any non *-dev or *-dbg package name. Added INSANE_SKIP instead.

Perhaps we should loosen dev-so to permit symlinks in lib*'s as well, if 
it's common practice to package soname symlinks in OE. Thoughts?

>     > --
>     > Christopher Larson
>     > clarson at kergoth dot com
>     > Founder - BitBake, OpenEmbedded, OpenZaurus
>     > Maintainer - Tslib
>     > Senior Software Engineer, Mentor Graphics
>     > --
>     > _______________________________________________
>     > Openembedded-devel mailing list
>     > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>

Thanks,
Haris

