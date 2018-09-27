Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 53994 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Sep 2018 15:00:40 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0093.outbound.protection.outlook.com [104.47.2.93])
	by mail.openembedded.org (Postfix) with ESMTP id AD7E2746B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TL2R21msWs9S1JywutZkOfraqkDxP18isS0AoTW9Fvk=;
	b=eKF/vCB4Yj38bw/JOyn75Rf6ijMXpe99LdGolVziGIxpvVZ1FFdOiYwxxpIeqyH5ePq98kljF4xHWWqxnIwFnqIIqCYYllTwkszFo15dCNX6q1lksgQe+YBIINurKI7M1g8Pz+Bq2qaxKmw+D5ioKnxMqkqsWgZD4EnE2Nwd4Uo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
Received: from [IPv6:2001:1c01:3b04:4900:1183:4a4:24f6:8acf]
	(2001:1c01:3b04:4900:1183:4a4:24f6:8acf) by
	HE1PR0702MB3644.eurprd07.prod.outlook.com (2603:10a6:7:8c::30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1185.14; Thu, 27 Sep 2018 19:27:24 +0000
To: Max Kellermann <max+openembedded@blarg.de>,
	openembedded-devel@lists.openembedded.org
References: <20180927125519.2567-1-max+openembedded@blarg.de>
	<20180927125519.2567-2-max+openembedded@blarg.de>
From: Jeroen Hofstee <jhofstee@victronenergy.com>
Message-ID: <ed33c2b2-69df-7ebf-d181-38e25ffbef1c@victronenergy.com>
Date: Thu, 27 Sep 2018 21:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180927125519.2567-2-max+openembedded@blarg.de>
X-Originating-IP: [2001:1c01:3b04:4900:1183:4a4:24f6:8acf]
X-ClientProxiedBy: VI1PR0302CA0005.eurprd03.prod.outlook.com
	(2603:10a6:800:e9::15) To HE1PR0702MB3644.eurprd07.prod.outlook.com
	(2603:10a6:7:8c::30)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33a52997-3c33-4b21-fcbb-08d624af413f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0702MB3644; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3644;
	3:ubkY2FidGTPwKZwPPd9Im8YqHtAsI4S6DIxF1P7cWY+WU2s2pvHlCczvYctBOtZbG5lZlw1onedkAoiPzcr3Pqz9iVPIlRAg5LPwyMfvGY2Hx4SNnJWndXFxg3yKyUGRHKYqSqzvdAwrc4LfXLTUh+RVtHy4+cacE7R3XEcNIKgiApRXSfoyzPfmLeDA4XPHAZWlFXZ4QqUlWqIThdLsnvJ87x8O5oSQbCINKEpnb2aeD5jnUoik9UYMrmmqX1IV;
	25:cwgpx2sewwRLykTMe7m7GidoVk/cNUMRXa/aUWGqVU7Lm10GlV7qRoYvyPtnfKdhbn4Sc39QBqAosJT6UAX1fZvND2Srmko7faVM5Fj7mVzLGfPKPikCj69lZ/NqKYzJ3Bu9T0jfSLkbr1ZzyXo0KaAKACUFMHAH4N0zA8f4dj8t3ArKJnX5a5pJSuQaKDY6YLPGaRs7McDBAjD46N4jo5vMe6zyDb//IzriTjG/AHElnnqONVr76qa5xCt10hPj3o94576+Ggcy+ptSw5KG5CgLcUL/LsYCBd5VLz3q0rZEaC/3EXvLoyJ4Mm/24W2/YglphX/bm0n1GiZbf0RFRg==;
	31:F3rpw0eb2fImDwBOr1kyAgJa4sM7ZQ3iBD7tTvqwxY13yrzbS562ElXNBx+3vcOzLTsABuTdd3FeSqE+U9/z+007ccUIu+LOMkuagwF2fyXdFg4/0Uwrkd8viliSg6TLB9hY9dju6k3ti5slY7DtRP+IdomtoFlvzpEpCD9Z8/SZkkmg/uakYyzjvvz3zR8WhQhpPQcyTlRT9Cyj6nogn2mZPHcgtNdkgyBCd6DimX8=
X-MS-TrafficTypeDiagnostic: HE1PR0702MB3644:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3644;
	20:usbt6hdNm7igo78o7Ieylhb+VSHU0dBKge2QQYgfqp5Mnqxxl80jc2uX47NotErjLCkaS2XGFqbLkHnWvXXLD47oeiltdkjCYFtnlKo6P35+RqD12mllab4j8khmW1TjvHmu8E/Qdi4huE9iWoIdKoVF1Z6Ud63G2rn8hXH1j65Ta7NclB9dQ/Yal7t74wLhqBpRJGci8nlawWhvKYOasvFrPfonJ9KpqUBKdiT0Zi1k4P8XQ6hIA9YiMzHcUWen;
	4:bBQpdpXi8RibbQOnvqf8EfVxdqJxH0416g4I5CDXM5rvPi7JP0Ww7+yIt6r3soMOfn8TLYQnrGJjec1X9JmNcJ29JpG71OX6ZPczYpLYGnZoc+hSI4MssE3e6b4J2pm5QOemC1L6btVVKi3du4FJhKMKeF3SgtFloTGpAVHDestiBi9X93NN6VlpN9XoZ673CUWIAQbvdn5xM/T2pyB3oEpQsKF9YFbjFKGQG0uBm8tEdMvtA5qLoAWZl/q592j5AQCH2FjSLRFJ4fXCzA6Q9EiTZfVq+DubejjETvLvk8mZSHysWcJ684vRDTseTNKF
X-Microsoft-Antispam-PRVS: <HE1PR0702MB3644BE27704D4FA3E94F7EE7C0140@HE1PR0702MB3644.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231355)(944501410)(52105095)(3002001)(10201501046)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(201708071742011)(7699051);
	SRVR:HE1PR0702MB3644; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0702MB3644; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(39850400004)(376002)(346002)(366004)(396003)(199004)(189003)(5660300001)(64126003)(86362001)(67846002)(7736002)(305945005)(486006)(11346002)(6116002)(1706002)(46003)(446003)(65826007)(65806001)(31696002)(97736004)(6486002)(229853002)(575784001)(2616005)(230700001)(65956001)(476003)(58126008)(34290500001)(6666003)(316002)(8676002)(76176011)(36756003)(106356001)(105586002)(81156014)(6246003)(2906002)(386003)(52146003)(23676004)(2486003)(52116002)(81166006)(25786009)(14444005)(186003)(47776003)(53546011)(50466002)(16526019)(31686004)(53936002)(478600001)(68736007)(52396003)(8936002)(81973001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0702MB3644;
	H:[IPv6:2001:1c01:3b04:4900:1183:4a4:24f6:8acf]; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjA3MDJNQjM2NDQ7MjM6VndGWXdTUElKd25tcmRxNFBlaXRRQ2Nu?=
	=?utf-8?B?a3NhV3lmRUE5OEZ4NldGYWx0UExIcHVtNE9oOXBpd2FkNHFYeUZoL2pxWURs?=
	=?utf-8?B?Qy9JenRDa0p1TU5neFhsOG5jNkNrNmNSRy9qU25IN3krNlI5NjFzeUc5K3ZG?=
	=?utf-8?B?Q0YxbkdvR2g1a3MwbzN5cFZxOE9sOGRaVzZ2OE1RdHpjbUl5Wjlxa3BBY2R1?=
	=?utf-8?B?WDJvY3FzUnVLdGhIY29KVUFnZmVEdWFFTTQ0b21CaE1RY1VVSHIvVC9RTW1v?=
	=?utf-8?B?YnVmeUZVd0JDYVFVUXBIeDRiZDRLZ2JQSE5aYkNuL2VxSTVITTRTOEZsSzBG?=
	=?utf-8?B?YzcvWjdLRHpoRUMvVVMwajZob0gvcnVEN3FCTDFQNEhTWDloTDlKcGQ1dHg2?=
	=?utf-8?B?YnUzMjZyeWJpZTZ3d0NlcVo3bVZZWVZVZmxxVDdwT3FwWWtVK1dWRnNKVUlQ?=
	=?utf-8?B?a3pLWVpYNmVPQ05XeUNsdTJVWG81NXNmTHJHNUlZRjNPbUpZTDBBU0xuWEN6?=
	=?utf-8?B?YUtTTUMwRWU3S0pKNVRkYTlMZERNMjJMUEllZWs1ZENRWFVWT0RodEVwTGRZ?=
	=?utf-8?B?RUQ4Q3I3OVlPQUQ1Z1dQV1B5UzdMcnFvZjJ0Yk8zQ1JrR3U0T3VRdEZ1c0Q2?=
	=?utf-8?B?UGF5cVBaOHQwNG1iR0l0dmdKMVovOEZHakRJVCtkRytWUGNJYkFnUHlBekxC?=
	=?utf-8?B?dXlTTWsxRytCMHVUQ054Z2JwV3MvYzBxTVpCQU1ONFlQY2haM09RMzJ5aU9N?=
	=?utf-8?B?TWtTbEVnWUJGZFBLb2lxd3hvOVhDM25mT0UreG5mcCtzbHJaaEV4M1BMVVJQ?=
	=?utf-8?B?VEh5NjVGaG9mNWtuekRnU2Roc2lPQmFTVDZRUG5tK1JudithYjJRS0YxV3hp?=
	=?utf-8?B?dS9UMVhnTDBEekRpRkxOMWVuK0tpVFVjVFBDaUo2UXl4Z2ttM2t2N09VSWtV?=
	=?utf-8?B?Z1U0TEdOdkdnK09PaW13UE84cjZYcGU0SC9BNktQVkNoa29hVjZ4R1hzaCtK?=
	=?utf-8?B?WUpyVzBMVFlFUjhwSCsvalNkTzNaSklaTlpUZlNSSGFDQ2ZSOVlzS2psVU9s?=
	=?utf-8?B?ei91b2F6REFOVmZsSzQwT0pTd2JlTjBVVlo4dGNnL2JINnNJUFpzZDhkRnJk?=
	=?utf-8?B?a1l3RzZ4bXVUV0ttUnFRZ1NYZk5vdElhOWdFWndNa1I5T29zejlvZFRvM0xu?=
	=?utf-8?B?SnNQTUhqWHU0V1JlR2szWkRjZGFNV2VWdzVOWm00Mmx4eW5MOWhqU2VGRDRx?=
	=?utf-8?B?a1AyUlRjY1BDMHpETzZUNEVWdzRRR0xQdlRoU3ZVbHpBaVVJYmJ5TTEzdmhk?=
	=?utf-8?B?U2VSZWI2Z0tZMGwrWVY1N2hYOGE3VWI4anFMaDlpR0Q0NEZmdWtRRHZpakhJ?=
	=?utf-8?B?L0FqUUxacjhlZS9KWFhnZjFzR3M0SzJzNkFkQmRKaXpJZVJSYjJFSjRyYmpt?=
	=?utf-8?B?Q3RxbEs0MWpCT2pEVU0yWlFrQjZrTEdEdVhUMk9QRUliYzMzbDRVRGU2TktK?=
	=?utf-8?B?dUsrSkRYY21BN1o3czlHYWh1d24yWHYwM05pd1NQVVB0aXRqQndhOUU2UUNu?=
	=?utf-8?B?OVhGT0pBMXBHbDdTRE5lMHVPNHlySWxyZ2VERklDTnFRV0gvU1B3d3gxcHQ5?=
	=?utf-8?B?d2NvOFdjSHA2bTZ1d01ucDZGcmRlRU9hQ2Nua3h0MFJyWWY0R0ZUdDFUY3Bp?=
	=?utf-8?B?NnVDcXM5R0k1ckYvUGNlc0VCb1ZQZUJwaHJFVkk4MUs0REozT2dWZStmanow?=
	=?utf-8?B?RVgvNVJNdDVoalpmcjJXR2U0Vk1vSzVsZ1JTTnJnZ0tPd09Rd01vM0ZQeURC?=
	=?utf-8?B?ejJmZWdiNkR6MkJ4SEo4YjVsenoyZ3ZHclhTTHM2dzUyOHcwQVJsSSsvbHd2?=
	=?utf-8?Q?P8qDimuMxzwahhDfRUvxBON7cqfe/UFf5q?=
X-Microsoft-Antispam-Message-Info: mNfLWgNjx99lGfZJGM3Ei3Mrr5SJrg3MgZyG/aiGVhVb3C1pecA/MUPnetucyirA0y9mCRTwXwmTtJ5sM9p7zHkhFw1kL7evznuH8LExcmXjoA+POr2oko7cPZCy76S0orQNfExDMfhu3PzvS5fl++Uy7Lt5il19kCop5LxV7LU/23RQz8q9JIe+BJF9SVXqqANih6sl7iUkS4hbhOF7wTfufh584nGN1MlNBGkoKOPjgLgPEi46WamCIofUoK6aV3yARL3IY5dNlUn+KNlWS2IDkTrQArnMq1Qcx9m2xuQy+bAeoXbMunpkb488tyalFzC6Wv60/Ug87rTDMIUfkrtq45MOCiQUwa32CbGJSjg=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3644;
	6:3IJKkKVs/5Mi05De3xM0jFqnJHoVerg3w8sRyaFIpp9HooDEkdeJtvBJ+ooVmTt7he5g8cpvEBiK8dc6E68lcU6U0MDv+LCXRTsdVvwZiewCBcAS9/3ud0pRTWs/ASGR8LLc9P9a/GrMH9qfmPkaUgbJewpIF0ChvTZASS7dpjrvBOfER1RX0NOQeku4xFmKPIHmzI56mj57WEJ2DBRZVIL0kRNnPpWvdCHnkJPFd27FotvxzzeC5yNNmwCgGRm/7yY67C+9cAOSkEWxQpdDEP9Qwiq98+aDxatt+K0xkvxUVO4kX2nR/arYGEI6Jb6J2X8aXliRcFxtTD/8lGM67+A+yuYEMfSMNo8mefXHXo67liqu28gNVBWuRZZwPu3m3xozrl85vEiWXN50UOcxQr6h2kjn6XZHm66AMFCl8coGDecxqCi2+9oRNsuMOGl2iUuuFN1MTEYMh+D8o68H4Q==;
	5:Q51ckZWJnmm+oXne/sQGVtzXKORYf1f94lYS/B8W1aV3mFFqHYg/lomOUT+9Mg0ALn1zWvAks9/Un3qeVSKTMsXWToZNAZAEoYQISPpMbMR7fV6D/JdVs++01m5Nzo+zRo+lfVMyC9K5S6O4MF2RMbiBa7V0uPgFpUmIk5yd/Gs=;
	7:86KX5tb9MfhZN8meKRwvDcIN4i4rcgw81Xm3NM7SuvzbsXfxZwHReaUfQ6d8VJ3OfI7YsmPBr5dv5kcq8L1qyMAy9n5EaabVEt8GxmOi/IluUhvOT7S3N/CymaLSAKTJqGmqKAUi1UPxADCpWNLURpOPCKrKdPVyl6yZSPPO7OPPZsAnf4y1MLePYjzqR2nOfNnEHgdt+f9QA9KvUF9V/CJYwKPCMufqW/IqyLVfgRW0n14yuAQlBfXSkFl+71zd
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2018 19:27:24.9090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a52997-3c33-4b21-fcbb-08d624af413f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0702MB3644
Subject: Re: [PATCH 2/2] php: fix linker errors by setting `ac_cv_func_dlopen=no`
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
X-List-Received-Date: Fri, 28 Sep 2018 15:00:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Max,


On 09/27/2018 02:55 PM, Max Kellermann wrote:
> From: Max Kellermann <max.kellermann@gmail.com>
>
> The autoconf variable `ac_cv_func_dlopen` controls whether `dlopen()`
> is available without linking `libdl.so`.  But that doesn't work:
>
>   tmp-glibc/work/aarch64-oe-linux/php/7.2.10-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/8.2.0/ld: ext/sqlite3/libsqlite/sqlite3.o: undefined reference to symbol 'dlsym@@GLIBC_2.17'
>   tmp-glibc/work/aarch64-oe-linux/php/7.2.10-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/8.2.0/ld: tmp-glibc/work/aarch64-oe-linux/php/7.2.10-r0/recipe-sysroot/lib/libdl.so.2: error adding symbols: DSO missing from command line
>
> Leave `ac_cv_lib_dl_dlopen=yes`, because that's the one which controls
> whether `-ldl` is needed.
> ---
>   meta-oe/recipes-devtools/php/php.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 99a25b94b..bfd0ddfb8 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -58,7 +58,7 @@ EXTRA_OECONF = "--enable-mbstring \
>                   ${COMMON_EXTRA_OECONF} \
>   "
>   
> -CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes"
> +CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=yes"
>   

I encountered the same error when building php 7.2.9 without mysql
support. With mysql enabled it will build fine. With this patch both build
fine.

Removing CACHED_CONFIGUREVARS completely also seems to work
for 7.2.9, but perhaps 5.6 needs this?

Regards,
Jeroen


