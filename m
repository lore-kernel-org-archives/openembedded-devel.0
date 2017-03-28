Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 881 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Mar 2017 22:28:39 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0079.outbound.protection.outlook.com [104.47.40.79])
	by mail.openembedded.org (Postfix) with ESMTP id CA90F77BC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 22:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=s8w4gnmke6hITAELiF565NhUNm3GcxUPkNxXi7YWIx4=;
	b=SPTJKSSGdVrkgurIDrLgTQCHaHwEJ2trjJlTBfsyvzaHoOa4ydrJM6ExQ/P7ocjiIGTiiti4AWlOe+e/ue+vP98Erb24Wu12WCDA1jKIxhwLyZdIliWm0/luzwZ22FqNzsdtb2CspFMm3BtecGANZbyIl0niDtCMiV/u7Mf8qpw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	BLUPR01MB1394.prod.exchangelabs.com (10.163.82.28) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1005.10; Tue, 28 Mar 2017 22:13:58 +0000
To: Andre McCurdy <armccurdy@gmail.com>
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
	<CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
	<1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
	<68787e73-74eb-9389-c397-139bfa696f49@xevo.com>
	<CAJ86T=Uj+xCZT29k4ti9K4_Eaa3L9=CeCuqMbqqWRKiWbnJHZA@mail.gmail.com>
	<8c827e6f-f739-0913-f38c-fa2ffcea62e2@xevo.com>
	<CAJ86T=U2f7ZhM0hbd4x2-qwPwHB=crJd4QtP2Oh1WcWgdTagkw@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2eef3d1c-7180-c75f-e3a6-74fb485d8f7e@xevo.com>
Date: Tue, 28 Mar 2017 15:18:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=U2f7ZhM0hbd4x2-qwPwHB=crJd4QtP2Oh1WcWgdTagkw@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CO2PR05CA0008.namprd05.prod.outlook.com (10.166.88.146) To
	BLUPR01MB1394.prod.exchangelabs.com (10.163.82.28)
X-MS-Office365-Filtering-Correlation-Id: 71dbbdeb-106d-420d-d44c-08d47627bba5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423067)(201703031133073);
	SRVR:BLUPR01MB1394; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	3:aBcC7u47Qr8jzn7K+XL+VQqXcboEnqMQZvzCRPjZisWicUIHTrXzg5SmsGzJ5a+wejvFSCOJGqJxYcb49oll7QmocgMrEDmzFDekJnf8R3YuE7hFcLvNpYyh7uNL/+r7qPBas3KOCzMWDxZu1Q3A8X2cPlhPgi+8CmyH79l8j5Gznvp9yEmF2zOYIeTOtICLG/kIb1KfQdjz4/K16YlNyZn1LsJYCe+XmTWAS5IrVO81uoV5K+F1qbfFEN14e2+r6g+2FEAJahvCi0ETmN03J/3i5nrSTBmI3ChxPR0P7JhmzyeQN7QENawFLs5qVbbCl0/0Yfrp+eFnNAoRB3G43Q==;
	25:ZbWV9boXcB6oFbhNYxSeX5D0+Z4eMHv+JYlgiiRs6yggPaibJLLNh+xYJ18QaPSM3RW/iBYe/d/u8R+0yvg8HZM31bnCn6cONqpckIHXXDN/s1XihWy8c14uz8l9YSn3u16vkda1cGXe3huf317t61uJwMUncd9upPKdpLUv0GqddvRd8oVcFmDQM9TTlZZgL0PAbUgJuy4fn+A9jRtEGQR3t0jSjQjEsbEjmP/N9p1jwVi2ZcqUzW5Znogks18SQFe8vKOid2om1tklptCSPoXAYMNf1YljdwoA2/4iXR+cEmCeZDIK1EEHEQG4Ox7YskoP3fQgyRXr9Ec0rnvFMXyKulh1gi3tKqR78LTK593/zaAAkyQtXC4AjeP2gnievTFc2oZlnfiNR9biQvT23YKAoWvazxcY9f0ICbUJWbLYLrLK5YooYf3Hd3uskHHjOeeWU/EevK4r4kPBZz3ufw==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	31:4Nj3pe8sTjqTeJWKbT+r2xNTh1MLeLxVDWeFekMPovXb/1UoIZPF14KYWMAXQKRCez9Br5Wwk78aziQ8uf+JMt521u8xjyPgCZj+DPv+1bXAugi7qGKOLvpl40WWgKN/WXxcetYcAUoCzkRp16+KC/X2WWhmWMetECd1EI69AdLDuehsYW89pgbxLbb/mjaZsoUmE5DWq4xBcbG9hOuz49g0t4VS31PTksLDfSbfvlE=;
	20:nQ/a2yFhDFRL+sZTtpKWSHCj0lrL8A/Hd8JpdItf57B5sRm562HyE9XAG51rM+jEMr5II4gg1M9kMrBJdUpIMoGsBtfCXNyWRwu0ClQs9k8viFZ2jntUGaNzh92dai1HImPFgHCMroSW8zTJ0tBgCUGXIEGpJGxTlpWDqcwKAundDr0IfdnlB9qunomd10baBpihRK42jyEIo4q9UBWxKK3Dk25wZk2BVlLOlapJxe2OHaPK98XmKns/aYMLfqXv6ZTxkx0rsUBhcxZnQPZAMHToSmPxdNWP+s3kFZEqX1miTNsr3/QHKS2+lhKMqLQdq3lbwNeIeOvYnW+AQ/+a7g==
X-Microsoft-Antispam-PRVS: <BLUPR01MB1394FC77DF80693260F4FFA9AB320@BLUPR01MB1394.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040441)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123562025)(20161123560025)(201703131423066)(201702281528066)(201703061421066)(201703061406066)(20161123555025)(20161123564025)(20161123558025)(6072148);
	SRVR:BLUPR01MB1394; BCL:0; PCL:0; RULEID:; SRVR:BLUPR01MB1394; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	4:7kta9AL5pkTarVfwfetf2CaFSEWfTbgS4AMaoYmHTtaTDA6W+69mRImkPnj5skW454yt1WMJov8M3yapgotx6CZ3YDT3d5GwUFAheiKZOQxn4lMcTKBhhu89eayaUBcQkoZ8nQ82KIAfTm7U+a11iXgiEVa6LrriQJxfhzofXnBEC+U1WgB8PL/YxqPKYfLk2OEDlQHuVnKl8vJgbYL2B+xKKc6YOiVjr+kfdfI5LL4PBmpwAQE8PrdL8nHUAYFArxDrZ1FbwXC6k2E3lqS6RfDyW80AKiyGsrpRobSJvFg2fBarLEJbyFJajCkcgqeifFUQ3iNsdRKvkP0WO4cSIgGfjrlII6Oy6GJGYpfiTc3HJNyfBynr5fVCsBuqC9FG/HHzLltagXTShLLmxxnCwek57H4AomzivUg3PGHUtbw3+0nXha/9JkShxk7AucBKVZBSCe9uYRnUpU0OrSrddR17OW3/qVaLiEg6aiS2eI8QzULvKRe6AFFqQsHRX4P6jHkU4g5/igPLJ9WbDuPFvC5ta0PFtZGYDwsmd7a2LPRJL+r+lfHkI0JxvSiPAQ7cztIWprsHvYO1mkK1OKcjwuhz12MyD97kt4fJkI2GcS4ajKeB7SprpUUQG6aMTwb/4RTaZhPUCRJsCueJzZZLTedgEiLCh3zqLMZbzvB4Pblrj3f3eokgRQCcugTu4Pm0jBfdSjDKOoYAXsDMbc7RwxNGnyLczl4HczcxIFhgyzzrRS7qFi8ZF/wnYNpaSq3pSPJxK2zMScX0t7kzmZx8RA==
X-Forefront-PRVS: 0260457E99
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39830400002)(39410400002)(39450400003)(377454003)(24454002)(2950100002)(6916009)(305945005)(7736002)(50466002)(23676002)(6666003)(31696002)(6486002)(77096006)(86362001)(90366009)(5660300001)(64126003)(53936002)(54906002)(93886004)(2906002)(83506001)(38730400002)(189998001)(8676002)(81166006)(6246003)(110136004)(4326008)(6116002)(36756003)(53546009)(25786009)(3846002)(4001350100001)(76176999)(50986999)(54356999)(229853002)(33646002)(230700001)(1411001)(42186005)(31686004)(66066001)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR01MB1394; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjAxTUIxMzk0OzIzOk8xZGRPTHNHYUxrd1JNc0pLWlRZQlUzc0pF?=
	=?utf-8?B?REpOV2JvQ0Jpb1R5MUZ6d0VNdlZxcDBJZzNVNURHakd0NitXQzJiUXViVnkz?=
	=?utf-8?B?WkRhQ2p2UjhNSlZKSXAxV2ZXdDF1MGRXVE94NWNGb21FczlYWGdBeUhvc25I?=
	=?utf-8?B?cHV2K3pneVd4L3BiMVRyTmdjeFc2dlVtUDNWaXR0ZWJSOGZZejQzRFA3YVdD?=
	=?utf-8?B?bGlmTnNiU0tkM3BTbU5kb3F5a1dWK3prS1pVczJhQ1o5U285SnNsZUR1cXkv?=
	=?utf-8?B?dC9BOUFybVo4RTYzcXJIUkNhNGFCTFlhYSsrREpNcVh0ZzV5ZU9qV1IvN0R4?=
	=?utf-8?B?NHRublVLM012dy9jNzJxdFVWdVN2NXNLZlJ5aGpOMnZQUktGZm4rak5zUWNp?=
	=?utf-8?B?cWR1cjZaVUs2d1QzU0o0NGMvVWsvQ00rZ09JMGMyZlR1QjUxYU5VVmNrbEdt?=
	=?utf-8?B?L0UzQzRZSjdSUXVVY1lVSGtIeU56YVpjWVBXQjM0ZzgxaVV3T0M5UW9kL3J4?=
	=?utf-8?B?d2ZOYjYvbkI2VkEyVTFqVWI4d2hTNnVOR0VOaWJNZ21kWjFrckJxaGg4STVL?=
	=?utf-8?B?YVhINit5QS82RE5nYnZMVW9zb2p3Q012MGQ5TUxlendDei90MVBGZ1VpdWxW?=
	=?utf-8?B?WS9wa0NSSXY0TG9XdllWL1VuWnBITWNSSmo4OE12dFM5NFNTWHJrZC9JaEhB?=
	=?utf-8?B?UU54b1FnTW1GeG1CNnhqcGlnd2NnZ2xHZktXWW1qS25CeVREd2NGRis4TVNJ?=
	=?utf-8?B?dEUvaXVVRHlKNGx6WUtCVnRZckVUaDY1amNCblpjOHFpcGxlajVERHJnVlFx?=
	=?utf-8?B?TXlIdlNISDlTVllZaW1HenZiV2VrOWRrN2xxQkN1Y0FEeGorZ0dYTjk3L3dt?=
	=?utf-8?B?M3QyUXJSVmgwSDQ2SGJPd1l4VkJwZHZjYklZNDEweHZ4enFyeGNSdk1aNXRw?=
	=?utf-8?B?SlpYYVRMb3ZQSWFCNlBoejJaSFdaelovbXpLRDk3YWtkOTVDM3J4TENpTXJl?=
	=?utf-8?B?aGw1MmV2OWpmbnFvVzdHSHNnQ1RtSENoakJYUXg1VU15ZUlETytqOTBQUS9V?=
	=?utf-8?B?Mk43VE9QK2c4ZklVSitvbmRsTmlVK0dhZ2toR1ZUMDJuN090RklheTZuVzNL?=
	=?utf-8?B?VHI4NW9lbTZVYVc2WDJaYjV5Y2g0Z0txblBtNUhtMjhNVHZpZ3hLNjQrYnVE?=
	=?utf-8?B?TTl4Z2xIdWp5ZEJUcjdrUnFCU3BOeUZwZ3RvNlk5eFBxRHdPa0M0bG9jUWth?=
	=?utf-8?B?UGpIT3BiQUc1S0VueVM4TXppOVlNb3dHQlJMRWJZSXVWOHJ0WFcxdlhIeC9C?=
	=?utf-8?B?ZzE4SmY0enpLZjhsSDUvZlhFQ21kTlZJRzZiN3JNVkNwTjJNczQrM1JObWRl?=
	=?utf-8?B?VVNNU01Uc1N4VXVhUW0xYkJodzJkVEhmMFBmOGJJaFNrNVlFTkVLY0p0UDlq?=
	=?utf-8?B?NEVsY3p0dTcxT25vVEErZFJtZS83QWFMalFndHJEUXZKVkprRnB5WE9iU3pV?=
	=?utf-8?B?c1p2Mjk5ODFQZGlDMCtJeDZhbFpLUzV4ZzUzckpkNm9tTFR4N1FHcFI0Si9T?=
	=?utf-8?B?c1l1WVFsNkxxRkFhRDlQNmw2MlJTSEdvWjYwV0N2ZlFmT1RoU21xWHpmRWVr?=
	=?utf-8?B?KzRzY2ZzaGttYUlhWVB1WWdMeUdqWHlVTXB3ai90WkU0NjVLcUY3SndNck5p?=
	=?utf-8?Q?SBTK9lPnNPJXVbTJPMnB3I9DsBwYkc9KHSljzwb?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	6:ShgjINWIm3JqgFmHCjWQuFwCe/SVU1qtREp6PyuzhXqo96orEplybVIKO+Szqc73KSWnedwlOTIWfAq1J+NJJkikkN/WrZLg+fj7goEwqwpOZAykMfD2wuNX0cfQUifqZEa1ZqCZC1j37O3MmJJOCBxFn/LMfeHdg/+dPAb4Ghxqssb9MVRdPu+QeU2oIrGsEW4zFb53cGfJ2C9QEUSkjY7tvzvEwUz3DfYpuyz7HDq7eOtTt6W2w7Np85Qs3PqGbuGn6S9X5DxpmOQOCtU/vnmTIVaADcvW5nLynGExDuuD39cD9/dnFzHQv9gntlcbrOTyrDHvJ1ic6rJLjwFvLc9aEV6J8o2nFvrbmcxwEznFl/dbwRFMXUYRl6AwvGV7Cln7jyr+bKnUYJiEiBCs2w==;
	5:bW+TFQMZ7U/6bQU34K7YPdKS+6XzyMz4cfbvz4coVvspRqLirXcL7NW3KMri+IpGLVsr0BOTeqlIuFAv1DA+FR/IyJ1JIBF6tRm+mfZaphDGCVTwKSMs2vy74azYyV/HjAnQCIXydw0fx2TvwmMNag==;
	24:7iVH1vZr67slKbygtuVfH+/tDwNYi9VlycyNdwPHHFUsxUinPw3oUNEh8okTji6SPl6KM6xRT81ESdhRs+QxYzROK7iqhaaHwXsk4/G6x7c=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	7:d12C208YrIYyjh7dgd/EEKqGJRgZocp5Ihy2Jzeb9+/Qy+BGqtVk2tchW2o/wO5llPIafOH7ZxMpuQMS3f4IJNUKfn2U1/E02ZfP95brExe6lE8FI//dY2AOZh3l0Fxn2vxa6gSFZnVk0PsHpjWO7ZfDCn7YcHja6E+FPOLKXy8JwSvMOlNY2xE9o+Q9/3wB5QKZv+MbRVV4k8o3LuLHoRmqhZbRV/ATF1CTedl4+y0kV63NmW2fc31ESLk6JEAlGNWX/BOFUevQrXRfkHFKF/liWBlFXv8GfuaJZPh+D/MnFjkp049DRJMI2rRF1UuNkLnrHkv7gzoslJUK2g/ljA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2017 22:13:58.5560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR01MB1394
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Martin Kelly <martin@xevo.com>
Subject: Re: [meta-oe][PATCH] gtest: add -fPIC
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
X-List-Received-Date: Tue, 28 Mar 2017 22:28:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2017 02:32 PM, Andre McCurdy wrote:
>
> Right. So the question is if security flags are enabled (and therefore
> -fpie is passed into the gtest build via CFLAGS) then why do you see
> an issue?
>

Looking at this more, I see that I hit the issue in dlt-daemon because 
it was trying to compile a shared version of gtest, resulting in this error:

command:
[snip]-g++  -fPIC [snip] -shared -o libgtest.so [snip]

out:
[snip]/ld: CMakeFiles/gtest.dir/src/gtest-all.cc.o: relocation 
R_X86_64_PC32 against symbol 
`_ZTVN7testing8internal17TestEventRepeaterE' can not be used when making 
a shared object; recompile with -fPIC

However, looking at the gtest version in meta-oe, I see only static 
libraries, as you say. Thus unless we start building shared versions of 
gtest, it looks like this patch is applicable to dlt-daemon but not 
gtest, so we can drop it. Thanks!

