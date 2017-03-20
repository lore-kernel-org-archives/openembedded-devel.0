Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 141421 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Mar 2017 18:51:46 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0085.outbound.protection.outlook.com [104.47.38.85])
	by mail.openembedded.org (Postfix) with ESMTP id AC6FC7793D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EkM0gQOD/uhw7QeOyQ0UPXa8X3qe6XZoG2f9WnkXaNo=;
	b=n0f71rGuk4DJiPkr3qL67EThp0PFOmxYkMyMEjjvWdlLqAxLicJRAV3EYavnUsVREvN3gWEu4yoR6r9Y+xZK8qw+cfOXrdJVhJI2yURMANQzggExQdqe0YzsJXRfCy9zj1BEvPeeif1++YGSCuwgiLFX5FFojQn6UQQgktfFVM4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	BY1PR01MB1403.prod.exchangelabs.com (10.162.211.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.977.11; Mon, 20 Mar 2017 18:37:09 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <07459727-026a-2456-792f-a06dbef2a988@xevo.com>
	<CAMKF1srJC1vitok6sf1WLggHgSRga6eHYGm7JM324nP7b51ZSA@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <0b02cc8c-2a2c-51aa-4394-b44847c37d13@xevo.com>
Date: Mon, 20 Mar 2017 11:41:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srJC1vitok6sf1WLggHgSRga6eHYGm7JM324nP7b51ZSA@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: BN6PR03CA0023.namprd03.prod.outlook.com (10.168.230.161) To
	BY1PR01MB1403.prod.exchangelabs.com (10.162.211.152)
X-MS-Office365-Filtering-Correlation-Id: 3386169f-5fdd-4d4d-8a21-08d46fc01e97
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BY1PR01MB1403;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	3:WPINTyPyawCQWfCICZ/NgNEKU+4j3P7iByjpTMIWF07ES3UrdYh4cu3eh1ApfL2LTlg1wb8XqoTeIKa+fM8deSfkpU9j4yhh3wbXMKYvKD6dvxcxZGD1dt6b9X//CIQaFWybGrS9PH9Y25050+/4mwgizb6NUSkinPKEaHvP6jyiz/K7db8a4Pgvm4XuHZ3bU3PXrxX8XW//xEMh44g0fhNlq4i5qbAqCvusS3JU/FbBAfB3c3+0TA2ARsVtE1ByKexiB8kDYrJZT+R0CVL6Dw==;
	25:VAhXHjtXE7FIbpTmNOlaLluGpNzkuxkDFM6uSfWp6HbEPMD1fWoticrnC8Gez4ljXxVpD6zJt8L4172SsMql2N7mORUGofMERR/kWg1kguFyVsMGu62pJaxC7pVCpD3eBXl7+k+jCNk8L7n/yaGFgTTJb71s7KhHzW7yX1tnEVCP/5WFoZBMBJMfAUXH6BaVUIMVl55cw9uvDPyTjvEe0/Daiq1UHbSvX6Q5K2vwMXGu9E0svW1y3nIFh2Ffw0eHJKlC7VlMBrJ9idzI2q+I99r7a7LKkm6Y8lFPB9rKhWuXkPwmIVCW0WZj6isYrCJN1h+lMNAw/oy8OBBIr6QVVLXaNuyqXz+mJB5Vywa8HARkqE1FXIZ0F1arY/RlzZhYx0mj34Ilp8ITLL9GnFqa/9+kBPI0LYn1II7vcWHxqPi3ckF3NnZKFWIgKeq27CASEzCgPI7FRfnswYzNjY1deA==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	31:YBQxXgAZj7TtOTu/1yWCgD5ezuy8v8VeueK20BfoDQng3hRZnjJMaxb3CQcichCWAj3FLwfhTJnDO1MjnoRaqKSA81NM/OveDB3FIE9Kuekg0HAgn7lLkob16PL8tKCOgPio5bL0Pr8WZmEg7yjfwlI7IeLhoEJPpa42094DSSngdSube4LGI/ABeEKvnX7Pf76m4R3M7e5GrxnTob1Mg1Xkw2yqrU4ZYbfMBOo81q7UTgeLBrm0xUZijhyGNciu8dtPfR7jCbrBIA36pya00Q==;
	20:/8IdNCAs+T+L8jWqSGZB6tBpzC7ScIvKsWpWPRMzNgdZB82k2PC6MJ4etb2V8XqNWFydjpLroqB4+jcelYRjHLGAF7mLPZo4RtZ0VSuvwlBeaoPyvvnWetFXvXilC8kQ8I/AJ8KD2rYGXTUQNVK4XMfSblAi0FbhAgw1v6WPL40gN8s2tIQw6s+6gzpT0OGQl84hYS8Whgyh+WoovSLCzxz0f8l3hOXvwxa0nIw8F7wTiCwvVkzLSjGVFJKJRfcK1Hc3x+XbLS8XXO/1a5LSTvxIcxQMRtMo3lpX/XJy6PC9O7c6znMXBySqjDP3hCRW7C1ZClRpYpuFPhfXTeCfjQ==
X-Microsoft-Antispam-PRVS: <BY1PR01MB14033F3A4908D6D5A78EB48EAB3A0@BY1PR01MB1403.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123555025)(20161123564025)(20161123560025)(20161123558025)(20161123562025)(6072148);
	SRVR:BY1PR01MB1403; BCL:0; PCL:0; RULEID:; SRVR:BY1PR01MB1403; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	4:YS2tJ2/HyzxWNNUVbGi54aJw26l2cH7WUVe2epaPUzcKnVLXn8SX82SCCT7fsDI0qKc63q+LGp8HAOnQHSCLugTGCgjQ7DzQyFLn530a3ehiIrzkF2lXR/UiFqgI1vkGspQy4oPkmAlh5wHXCBr6a9nkrk7q4TlfIJTJiOAO9YxlSK0qprZBOabzvQDnwhLGEHIBAXK5bTr8UXCsggWh9kdtlgl4+bYEwj/6meKjCzjx9CmbV03MxzNeflztOcmeMCibBxTlLwFNKaJSyp7ILOIK1cIVjFz1e0P9eNdfDmUKFCONHyhZnzby7u4JDMkRDnjK+c2o/HXB3bqzxYQdG/BtHz1zanf/G2QthmV+4MYRUlgQwAdEEhbm9Sz08eKmskFdWBPm0Pfp0ocXVwzcOdDeCcwb3EyuKLKN8IWxUjquFBxTPpioUZhLk3AhLOjHkgNEw19DvJWBKhICI+cm+eSZ2bOkccneap6cZxTl/QTfWIV4Ci7tTSF3V8jInFnT5CdGEuKjlFTsq28qDStQ1OcA91eGCWDBm+Xk1MEWBfPZR88KPiLwHOY9UObMKLrSmvUnOlTOYuJrQm2QJFUXVRG4Now34csey6XQZ+y3MwOcNeMMkkGdKRHErsNvjJFg7GQAXudoDoa2ipXvEFWEmA==
X-Forefront-PRVS: 02524402D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39450400003)(377424004)(377454003)(24454002)(66066001)(8676002)(4326008)(38730400002)(81166006)(4001350100001)(6666003)(33646002)(6916009)(2950100002)(6116002)(6246003)(110136004)(64126003)(230700001)(6486002)(77096006)(2906002)(50466002)(3846002)(53546008)(53936002)(6306002)(25786008)(7736002)(31696002)(31686004)(86362001)(83506001)(229853002)(50986999)(189998001)(76176999)(54356999)(47776003)(305945005)(5660300001)(42186005)(36756003)(23676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR01MB1403; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjAxTUIxNDAzOzIzOjhvc3NmRXdFZGNmSC9GZ28xOTVIRHFBTlJ6?=
	=?utf-8?B?bmJxR0M0ZUVxbWR3SDl2eCtDY0JRcHdxdzFERXVsbFMycERSNnNvTkZKOXY1?=
	=?utf-8?B?TVZYK3dTaDB3eUE5WVVCQnhrYmxKb0Y3YnQzZXpnWlpLVzI3cHZiaXJ3Z3A2?=
	=?utf-8?B?Umt5QWxTVDI4V21MN3BaeHJBb0hFVVdmMWN0eElYWm9HWksrRytGZDJJZ2hi?=
	=?utf-8?B?UVVzU3IwSGJ6OHFuY2k5ak5ielVnaXIvV1ZXZHMxMmN3Q2NaTVFxSGpXcWhi?=
	=?utf-8?B?YWdWWlp4OTY3ZTJjeGVRNHJrRjMrdUYweW41UmlmZXdRRHdkQTZlK0xmK2g4?=
	=?utf-8?B?YUhqSUNvdHRmM2Roa0U3R01LUHdtaFNOcG5ybXNLdFZHV1ZOaWFHbE1iclJM?=
	=?utf-8?B?YXVzekVkLzQ4UFdBWjFFYnIwd2ZJZGVBSGVkeG9RVTBKb25abFNoYlVPdFR2?=
	=?utf-8?B?d0R1V0p0TS9GWURVeWl2Q2t0dVYrNUdYam94cmR2ZDNwbVdRd1hSQ3ZiYm16?=
	=?utf-8?B?Z1pRUHF5cnNGOWQyZ0l4N2NGVTZ2Nk9HQmpXUitnUHIrU2JMczZtZUY4Vi9o?=
	=?utf-8?B?TEgyNlFOZWVXOWY2bHlEQ3MxYXdLWFpJajh6VkNha3FSWVU4OGw1ZlU4YVQy?=
	=?utf-8?B?WWcySmd6ZHZaeVZpZEdUZFAwSnBVZmZ4NVVpY29SaGttVWxDWktKTWlEYnRN?=
	=?utf-8?B?ZFFtMU83WnZaMWt1a0MxZXdqZFVTaDRXOVVEeS82WlRJTFVaY0sxa2ZkcVI5?=
	=?utf-8?B?N084aHZpaGlkQjFZSXVFb3h2MUpQQVNaUWFIeXc4Smg4cnFHL2pFeEN1KzVI?=
	=?utf-8?B?NTN4YTRDSmhiZllxWUV3RlRja3d5eTJMQUttR1hwYXBDTzNweGxDTGxleGVB?=
	=?utf-8?B?RUl0Wmx5N3o3WUtETmhtZ3dZdHdXV2dtQ09qT3RjaE1LU3c2T0ZyR1JkZURT?=
	=?utf-8?B?Q083bjJ3aXVhMGVNcC9xUEdwQTZDWjlBamxOUVA5Zi83aXRuY1ZDN3oxM2Ex?=
	=?utf-8?B?RlJaYWJNRFJnR2F5RWxzVG5vdWgzNWg2UkJVOTVkWmJuVGk0YUVYdTgwQWl0?=
	=?utf-8?B?bVBIcWsrNlVhbGRJUVNRcDR6bFBWZ2M2M0xoWGpGS1ozS3lyMTBBNG4xR1E2?=
	=?utf-8?B?SDB1WmREWHY1U1NuT1h1emx2eGxvZmxVMHVodzR0ekxYeFMvK042NmlqS2xO?=
	=?utf-8?B?MElDVEVYNFN5dC9xOGkwWXVpemRCUC9VMU02eFg1djZHclhKSzNKc0liaFJp?=
	=?utf-8?B?dnhDc3ZkemIwbG5GM2NFbUtpS3BSd2dQck9qUi9hOHE3RXM1WGpndWdPVnJr?=
	=?utf-8?B?YUpnVzVQQVdnbllRYmE0R0JVbVE5blJvd0ZLNTRqMlhjTW1vYTlLQVBMMXdN?=
	=?utf-8?B?WVNwenk0eDJwaHhaVVhRcU9mZ1JKSmgvaHFzTkNoa1NRaGwrRlMya2pYZlNH?=
	=?utf-8?B?WDg5enV3aEV3NXZDQ2tQMDBvSzV1NHUxeGNNU2p3R1VudEZKWWliczdkV0pr?=
	=?utf-8?B?NW8yZ3FoSG9VM2VWR1AraHZVa056VjdIMUE2L1d0WktsYk1VNm81UFNEamor?=
	=?utf-8?B?Q1Q5dGtQOEYxSGZlOVhuVmhJR1VCUWc9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	6:yA5jvn7/y7oEup2yaI4/laWeomOEwLFoCDwDLWYnHqPv8beSh1NZ/lCya0a53fBIB6zjwMckliXysZzoCPcg1/g04tubDgRMsuG/vxvsizH1/O4LPW6W/dtuMw8nSCJLJl1eyrrpf4WZjB4uuvXXrfU1khFSY9AmsEhgsmNkcrSfrV+/c1G0/Mfa/jDjNLltXWSz7J7dL0x5MHNU/jVxvmN89tpvmCeCADpQjKZ+Odr6ycwWUx9hsQYHKhtdn4U8fg68sf8FKLA2pLfJ3Lhbjk5UFpVqd5YotQAzOpg09HQEQfOjDbOwEkwAnmMsAS+yQ6myCLjf4yp93zONnsxTdw5tt1OwnX0c5JwiANwKm00vHYcf8NYbAnRmIwnqXp3VEK4RWt7brwDrdJ+f9BIpgQ==;
	5:GxPLFUO2Qm2vftsIHA/h2+24DYcEAsjSzhvyIPSprpUXQ00RVeDPUzCF8Bt9hAiaWkkFhX277NQWW3IjII1WOfzFhZ9HmW7nc6epqCXhVMSqJHDMr5NaOk7ecZpaee23t1YqE102HFvCJUGz3CJU+w==;
	24:yf5I5CtpBwEmYSMPGlYgCLn3+AwOZchE0CWSphJwuPRvxPL1SiClviJwum7hFQ8Yx2RkXRf7WPigIA8oTnWkU/czrlDQqgvkByHMEAcK58g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	7:hbN/SFL03jrmtLpp7qnm0t4qMCGjuxHWp3QWa72o6UaXt8ni97PjFd+4Lc+y/TqFkfQRRwCZ2Jtj3hXyjbrmFf4YnnZgq0Ct/wGDc/jZtlz/NDSkAIp8ssLHi2eIz+WKMcYOn0+W/Lhl7GkFDgSBonFas+xLTR5DEyXkzZcVWUpfQHshP/Sy/WYr0y/QFQWPQWSJ4cEOdVM7ohr69u0zWjD3qGpCHKSJFwRlUbnCmPr9XDno7YMh4yisbZvdvpjb/+5owB/HDvHdgMeUQ8XH0G0XAQYYxrTTYsbxoUfIPPZ9OZbivIyM3RciQJcCGdMTjkCZEKrvSbfGEf+6ML6jbg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2017 18:37:09.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB1403
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-clang] llvm-config cross-compile improvements
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
X-List-Received-Date: Mon, 20 Mar 2017 18:51:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/20/2017 10:37 AM, Khem Raj wrote:
> On Sat, Mar 18, 2017 at 8:29 PM, Martin Kelly <mkelly@xevo.com> wrote:
>> Hi,
>>
>> This patch series fixes a number of issues I hit when trying to use the
>> meta-clang llvm-config to cross-compile a project that uses CMake, calling
>> into llvm-config, to determine compile flags. With the series applied, the
>> cross compile successfully builds and runs. Please let me know if you have
>> any concerns or if there is something I missed, and I will fix it up.
>>
>> The following changes since commit c9c74d269ba79abbc20919de96f1eb2b8a81edec:
>>
>>   clang/compiler-rt: Fix nativesdk builds break compiler-rt dep for clang
>> (2017-03-16 22:54:02 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/surround-io/meta-clang
>>
>> for you to fetch changes up to 7d294bc2548ade23b7d25761d73769e712617c51:
>>
>
>
> can you send a simple gh pull request please ?
>

Done; sorry, from the meta-clang readme, I thought it was asking for 
pull requests to go over openembedded-devel, but I'm happy with Github too.

