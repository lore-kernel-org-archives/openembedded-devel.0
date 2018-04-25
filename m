Return-Path: <wguay@graphcore.ai>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0091.outbound.protection.outlook.com [104.47.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id B376774503
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=graphcore.onmicrosoft.com; s=selector1-graphcore-ai;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=C6jJ0KFOYKFyBba6MKfwY7t0TARzlowoezv5fbdwrHI=;
	b=cE8iwwKBWBYMS/8xPcTRPAcaEQELHR622JMI/CMbSIvreM5ybd3q+mZSafoif3nEodRNjxBdhI3LCqRi/dDm3vnJs8j3pUy870ia80t1T9fbcVuixkssrHVtmpA4b6BxwTJEcqujN75Opas2DWuI/7hFBN9HNCUzS1M4w6nxojw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=wguay@graphcore.ai; 
Received: from localhost.localdomain (109.247.133.245) by
	HE1PR01MB1305.eurprd01.prod.exchangelabs.com (2a01:111:e400:5880::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.696.15;
	Wed, 25 Apr 2018 09:12:19 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <20180424091305.44842-1-wguay@graphcore.ai>
	<CAMKF1spJiPWuct+eX2iq+PC=EUmjaPRiH1YFhwgQgC7omSDCZA@mail.gmail.com>
From: Wei Lin Guay <wguay@graphcore.ai>
Message-ID: <4ef0940f-34ef-ba7b-1f26-6e92890157c7@graphcore.ai>
Date: Wed, 25 Apr 2018 11:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spJiPWuct+eX2iq+PC=EUmjaPRiH1YFhwgQgC7omSDCZA@mail.gmail.com>
X-Originating-IP: [109.247.133.245]
X-ClientProxiedBy: AM5PR04CA0025.eurprd04.prod.outlook.com
	(2603:10a6:206:1::38) To HE1PR01MB1305.eurprd01.prod.exchangelabs.com
	(2a01:111:e400:5880::26)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR01MB1305; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR01MB1305;
	3:lLY3vWgrvQBNViVgghEC4UamhfoJqTVJJY7BK0ZyY+B6jmw3DGwH+AcoBk2PzFGlsK7+3COP/UXXcPA1utkJt+CT/2SwdIcVyWIIXw8Id7ry0dZusU7ZVCUUD4+2iM7XoGUHvqJ+xC85RNJIrGH/DPBiA5BPinhWRj3ZzyNUD86VT6xGXQ0ywBASohzkwCxhidj6Q+DRGl1UE/ZSZuTwABMQI0W/KiL56/nYpDLYz/bqItwuotT9KjNITaF3ZtF8;
	25:dyzfU9m8FSkfLG/qb+JqttN8xHlKcaK+JUoBDXlryTPla6Fa6gvZY3GqUsWngR54xgsYr+eOS4X6XpKeKTV4e75FM6D4EFo330EeNiZDIEsSXO4k5Erfiq0kAHFMLKZN95Av6XlUaqfLup5qGVKsU+cFWuJaERQB74DiiJacKwvXwL1ZoKONfdqkZZ7vIGnMb/tkieWP6pE4UraH5Mh3ZwXZw4CjG6FehKx6ca/5cYY8mtopZvQfjjvfhrlQbhYA4TfN0RkHIo+TRuq3z60UKhMPv23YI7hvHtYx+/48CommGTwmGSFVWSHEadpxY/ZAvG8XTDjGOQfa2lkv3dDVxQ==;
	31:S+/plrhORfmHQzE0kkpctzf6VypoPmK2Jfr67furw3ZgEPvz2TS27x5R3NxD5pttZVIXpIJosQC9Y0C+3ThEYNqALHDDSF6NsZa9+V23Um/bjyfgMyDZuLVYUy0b2OcXcTrNDNHKCQize/jJrA0nNH3voAG+dtXl4Or1jFHkq5yD7Zz2oWeYzNC9WjkxzLjaSVdw5Kpp2GxT4IimYj9bBJUEppYz2Q6Isda93LRtQfM=
X-MS-TrafficTypeDiagnostic: HE1PR01MB1305:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR01MB1305;
	20:iYqyjhxCrfu1lLelYu7CPyZ115lzaHE4zm+Ex9QtJT/8IdR0ItgRAWKpkkH17cuzfanElSPNSWhPDu0FfBSRCxdPegevNOQ/eFtcyd1ziCKdQBbljouUGcvwRkGsHFrzvpfe9X36Hkb9ZJ7/iAezs0MtvCcp/2xIL95EmSm9FZ/xqz9eVhls5g//+oKj5L8CEtCq08ruUHdE5YN0Nmuml8r/nwgCczfbyl7Il1o8M0b8fQRmcokTSICxaLS1FpE+aQvp62KeN3ATC8sSUnVfH1fmdDpndd1KVLQWtpuHjmGCI+06d59MOWhULrHbAmeG/NRGHNdY2+bsQMxD/duUYkkCQOg8ss9eNsr1Z29sG9/Ycz6zvt3PBUuPRK0pPFZRJ9IqZBrAo3FKBxhX7FGGg3979NmkVTJQP+AbTRg62yA=;
	4:U48qvCH/1se4L8Xuy4vj25n+aF9/NWdWdNCLpFS2vkMgHM0dFvfzXFaMNDI8Wzp6lQasWj4zqTbThIcpgl2PV/FNr4eEafPSjbvdH+Ey+FiuFHbCJ8owQQHUI6WwfUP2AGIwRyzFw3rzVsK/4XmZTjgB+UXeymeYDtfKZrpaL5TIA5ZCdbqDUMt+WShUFDSS99knfACXIbmvjez4FB+7B4kt+8v14p4yfBOm2vFKY29pitogZSAxBaM7X42Z6yk6qI8Vx/UVMQ8tn4COHzRA4oE4U8lKmtiMZP5BEsiecCLkVyc5YTavheTVTKTQYgY4Jj52HmYvALoI2Vkfr8Cnq3QlSUDWPM2YxfQMyBuu6Xk=
X-Microsoft-Antispam-PRVS: <HE1PR01MB130559A2560F2D3A7AAB0FA4D68F0@HE1PR01MB1305.eurprd01.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231232)(944501410)(52105095)(93006095)(93001095)(6041310)(20161123564045)(20161123562045)(20161123560045)(2016111802025)(20161123558120)(6072148)(6043046)(201708071742011);
	SRVR:HE1PR01MB1305; BCL:0; PCL:0; RULEID:; SRVR:HE1PR01MB1305; 
X-Forefront-PRVS: 06530126A4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(376002)(366004)(346002)(396003)(39840400004)(39380400002)(199004)(189003)(2906002)(956004)(52146003)(106356001)(8936002)(31686004)(105586002)(16526019)(478600001)(6486002)(2870700001)(229853002)(6306002)(81156014)(8676002)(81166006)(966005)(6512007)(446003)(26005)(11346002)(3846002)(6666003)(52116002)(68736007)(316002)(2616005)(6916009)(486006)(67846002)(31696002)(2486003)(476003)(186003)(6116002)(23676004)(66066001)(65956001)(74482002)(47776003)(39060400002)(1720100001)(7736002)(25786009)(64126003)(76176011)(53936002)(86362001)(97736004)(6246003)(6506007)(386003)(50466002)(305945005)(58126008)(53546011)(65806001)(5660300001)(65826007)(4326008)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR01MB1305;
	H:localhost.localdomain; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: graphcore.ai does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjAxTUIxMzA1OzIzOjB2ZzhsNDFWV2xDUmdvSHNlYWRtcXpyK2RK?=
	=?utf-8?B?emt5MXN1RjRycFV2cGthVGh2akRJOERQODJtMTZiZ3hiUUhjaCtvWFpzbjhu?=
	=?utf-8?B?VlJ4c3ErMGRvTGVzQTdIOUpuRnJIMXNFVUsvdC9PWDI5eGovSE5yY3R4NWZo?=
	=?utf-8?B?OWxwT1NpcmgxSUFsT2N4eDFkY251dWtoYkVBNERLdlVxWUliMmNzc1BwZXZW?=
	=?utf-8?B?Y1pxemN3anFnbFBBUWVaQmtmVm5lcU9CeWYwSkxhcHBnSHNsK05hM0VlVC83?=
	=?utf-8?B?bHZwKzZyQ2Jtb2J0QldpbGN1RFRoVVFMN01rSWdsMjFkMUFXVmNkcEE4M2lI?=
	=?utf-8?B?NlFnRiszT2J0eUVhY3A4eG5WcXhGSFBMeTJjbElhRWhoM29SSUpOT1ZIMTBu?=
	=?utf-8?B?dzJHRDQzeHpkVUVPQk82SUdtcVNDN3NkNnFFdHRlSEUvOWZraEg2WGxMdGJW?=
	=?utf-8?B?bUxUTmczRjdScSsvem1wbGlZZXAzRC85bEJUcWNvNHhiMUdQRVFjSVhWUStW?=
	=?utf-8?B?alBoYVNzRFpWbjlFeEsvTjh1MFpZRjRXb1A4bGpOQlk1ZVUwUnVmSzBHdElm?=
	=?utf-8?B?MHEzRzNQVkFjbUJIYUdHazVNckprYW10dDFYSUJWczdhSmxJVnpJcU0wSEkx?=
	=?utf-8?B?a3grczF0OTBmRk1HeEFBaXNzYVZwUzFoempTWHJQNjF4KzNVdy8wWittUnJ3?=
	=?utf-8?B?dWhvTjJlZmxJazQzZDNzYzEra0xNVVljTmZHM0tlYmtqRUdPdTQzcUVrMFFh?=
	=?utf-8?B?NXhUNmdNTXBGeVIxa1dlWVk2cnBHUTdhdFAxOWkzNHh4blNOaFZ1V1E4dDZz?=
	=?utf-8?B?N25DUkN2TEgzelV2VEEvdkJsTFBnOXlJWXhBL3Rhemo0SnlTU2ZUbWk5bU4z?=
	=?utf-8?B?dW5KaENxV0NONmkvYW1ubm9EVHNIei9sbzR1aFJQenhHYjBvVk1mYlZvWEQ0?=
	=?utf-8?B?MXY5U05vWUZQT0F1UmhZejV0bGw4TStPUkJZYTMrNXA3TUg0ZlQwYTdPbnpN?=
	=?utf-8?B?M1RuNjdUclgraWMvZndzRG1TM1ZkVEFFYWFyTU94WTc4N1ExR2RLajE3TFhD?=
	=?utf-8?B?cC8zU0dJUllwV0VGdzlVR2dFTXpyVzlsWkVQSGl2T0ZJL1RCOWVhODJQc0ky?=
	=?utf-8?B?b1h2YWRhWkV5RHZsTkcyeVhnaDhLME1oQXJ2Tjlvd1k2Vndybko2YzdKUjFk?=
	=?utf-8?B?My9kcWYxYTRWeW9qY2ZFUEl6QUNtY1FVZjcxOHp4QXJwNGVSbU84VzNvSS9L?=
	=?utf-8?B?bVd6MVA4b2lFTjREaDREVm5McDhUNmZHWjZoQmFBRkxtVGZ1bzFLUW1LNkJR?=
	=?utf-8?B?dHNud2dBY1RIclo0UklMR0hSanVVZnhiSVR1QWRSeS9rRkJDZENvc1BMazRw?=
	=?utf-8?B?NlZtczk1bjFxbHF6SDJ1S1FROTdGK2QxQXozRmdGOXBqZHNqcEcrOTJGSWNY?=
	=?utf-8?B?ZTZXYnBPK1hKZW5JeHlRYmY3OFNEMUNxamlMdzdLMEkvTkJHNlM5SkhCRDUz?=
	=?utf-8?B?cGZvMnBnS0oxVWZPQlVHeFp0UDg0VERrbHhyRkR0cXE0YUJCVUVzL0RuT2k3?=
	=?utf-8?B?aHh0RWM4Zmp1NytTMUMwN1ROSWt5WFViM1E2djI0dWFDUk1QazNFWWQxSU1M?=
	=?utf-8?B?bTErYjN2WUxkcXpvRHRwL3BPZFd3U1pLNTBGU29PZ3lJVVp3Nm1EMWhjb0VM?=
	=?utf-8?B?dFpqWjQvN3VzRi9NbWNpeEZWaVdjNmZDNGorMFVSclhVYlJkb1RWMjQ5Nklx?=
	=?utf-8?B?TlpwOXlYL0lLYVVWeXYrMThOU2hJYXNVdlRGYzkzL3hWa25qVHIvZE0yRjhn?=
	=?utf-8?B?OXZOT0duSTRtaVpXV2h5NUtXQjZxbTdEK1hLMmtjVHMwRURMbnBIOEdXSEZM?=
	=?utf-8?B?TDlyRGtIVHNhL05ncFA0QVAyOFVVRFJ5U2h5blFQUkNRdFAwdWtORys3a1pE?=
	=?utf-8?B?bjg5Z1N3dVVuNFg1dm1ObGtRUjJWVDRtN0ZLVHZodk12OVB4elhoMmxGaEZL?=
	=?utf-8?B?SmVOWjFyQ1ZkcnFsckl0SHhLaTZ4Q2l1VEFwM1RCT2Z4VnkyYk4zbmVuamJR?=
	=?utf-8?B?ZDNGUjgyYlNWc2t0S21HMFROaWRKc1RRbGhibW5WWlRKMy9FVXNoR3Q0cmgy?=
	=?utf-8?B?VkE9PQ==?=
X-Microsoft-Antispam-Message-Info: KeUOJnvFrx7NgVBaYHuExIwaxHueA32ZqHSoB8IEUdo82SXznG81G5pFAUWZ/NixcrkxT67MmKyWyWYXH/g7EOZbSAZOQufdyYxrCMUlzPY8JFDwaA7MNC1epMQJ4DCaTLZIxBglZTm1yvexRGeX/+806syctQugSaRepv9MqGt0ZjcTElfB+0YsLZeE+g1/
X-Microsoft-Exchange-Diagnostics: 1; HE1PR01MB1305;
	6:isorjZhiS2IUJi+79Ll6jW+n/UUMVUBq9csylmLEH6d6gUST2Inbqpsl39nP6K4jXVU2d11Q7VO8UYRm4DAX+rWjf57s9d6nCvr7IKt05sOlSBIs8dKL25SkqEzwRZUYHZ1wbsMn4Shx23dbQ2X/3mZIKaxomBws3DTQn4cp72amUBmR08xVXQ6p2M1UhWoP/iWhMG8td1AlcpvqGhg8mmP03XQ5wMmICN7QdlK56LuRHghtLDKbfX8sHGEL1Bh8sjDodH2o0AxbdcBmarcolgaO7CV3ZUnU/u236AW7ART8yM2PrJqd64kc2SfXvbCDYG/Vz9kjqdATO3gLoGCju7i9t720zdD66BUEyZdETUkTZpDF2Ti1NhT7r2FgBtZWI0c/np5T+aMO9lV3roBdm4iAvW7ZxkLNAFA7OBANOMvuIlogvVZM+kMo15pJ/PYRVzmX0vSW1G5z1aCdyu1E7w==;
	5:6/xWjlftZcvOi5lia6gqnpUSDpx3+h+hCxlriaQuxkKkmHJzJYY0EYxVK1dwSWuk1AGX9Cpb1eusDBQSc9xtV65XoyEqKusBQLdkgyEshplKNsGt/+xeudnX/vcnmcj3yyjZlo27/LD9nQG2UCipFKvQQgM4Qmi1DiWiY0PTky0=;
	24:KDhdnyDIH0NdDP5dLD5rC1ynPGpvuNayJJ8YNE+AMQA15OO1ao31IxttgM1hF3k1PmRBQoOzRM3lfDwHWz1M7KyIgdC0yKkc9y9M3HCgJrc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR01MB1305;
	7:AFK+uSPBMhJFcuo2Cj9B+dlPp7n5TsNcs/izcS0x7UfQI8VkiZFlE833RtftkSJGVVaH28D1G7kxK4QScEcrEms9Vdc1EitKSwEVkpkmwAPSJq1UbCKyMFC91W7HcTl+AbpDG2nu8trLZ4Ph09cas/ndZiuJWKAIJejmbJ3aPm4dlkpQPikBSquXPKEAT69y8SP+D3cfJ65Sdsi/y9Fu/65XRUgbvfi+4+dnrI9xvITd9SXftQu/lwDDWF2eneJZ
X-MS-Office365-Filtering-Correlation-Id: 82b730a9-c3aa-4925-6134-08d5aa8ca5fd
X-OriginatorOrg: graphcore.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2018 09:12:19.6970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b730a9-c3aa-4925-6134-08d5aa8ca5fd
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 02150d85-5b54-47ec-a80d-98af327512f0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR01MB1305
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] rdma-core: add new recipe
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
X-List-Received-Date: Wed, 25 Apr 2018 15:46:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem Raj,

Thanks for your prompt review/response!

On 04/24/2018 06:46 PM, Khem Raj wrote:
> On Tue, Apr 24, 2018 at 2:13 AM, Wei Lin Guay <wguay@graphcore.ai> wrote:
>> RDMA core is the userspace components for the Linux Kernel's
>> InfiniBand/RoCE subsystem. This component contains the userspace
>> libraries for libibverbs (and its associated providers libraries),
>> librdmacm and libibumad. Besides, it also provides additional service
>> daemons such as ibacm and srp_daemon.
>>
>> Signed-off-by: Wei Lin Guay <wguay@graphcore.ai>
>> Reviewed-by: Harald Høeg <hhoeg@graphcore.ai>
>> ---
>>   .../recipes-support/rdma-core/rdma-core_17.bb      | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core_17.bb
>>
>> diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_17.bb b/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
>> new file mode 100644
>> index 0000000..e45262a
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY = "Userspace support for InfiniBand/RDMA verbs"
>> +DESCRIPTION = "This is the userspace components for the Linux Kernel's drivers Infiniband/RDMA subsystem."
>> +SECTION = "libs"
>> +
>> +DEPENDS = "libnl eudev"
> is eudev a must ?

It isn't, I will fix in v2.

>
>> +RDEPENDS_${PN} = "bash perl"
>> +
>> +SRC_URI = "git://github.com/linux-rdma/rdma-core.git;protocol=http;rev=v${PV}"
> Drop rev pointing to a tag. We need a hardcoded SHA
>
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +LICENSE = "BSD"
> it seems there are GPL-2.0 and MIT in play as well also this seems
> more like BSD-2-Clause so
> please make it specific.

Thanks and noted. I will fix both comments above (change the LICENCE and remove the tag) in v2.

Thanks,
Wei Lin

>
>> +LIC_FILES_CHKSUM = "file://COPYING.BSD_MIT;md5=4cef3f976a07850eb6d2e5d1ef945e6b"
>> +
>> +
>> +FILES_SOLIBSDEV = ""
>> +FILES_${PN} += "${libdir}/*"
>> +INSANE_SKIP_${PN} += "dev-so"
>> +
>> +inherit cmake
>> +
>> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
>> --
>> 2.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


