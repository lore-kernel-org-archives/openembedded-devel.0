Return-Path: <prvs=26053ff0f=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id CDAB47C617
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577696675; x=1609232675;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=9d1CGTvNE/5BRmcE32NmNchZeRNE8a7ncqjCI8aFQs4=;
	b=RXHnHlZ/EBIQ9WSeuJUxUqmJHPcx29w8DH46yGiQo8qjUOxa6qTmcBIN
	o5N+3xDcOTVl9ONncQnRI1Wh4SZfQ7YmEZ9wuRM5pAs0rq/oPW8xiFB4G
	qy7eKz8P6KV46XgjNT/pTfsvDbQNMJ3oIYWqwoPVyzJnkDJlZv160SmGL
	FKasXM/NfRbINTzNVpjm/vHZE9IauFYsIyCih80YzPFGNh6gHSslg4dHy
	HXHFa7pagvA4ZPuJxiKyhWD6P3Bf6n5+lwuJU2QBUd5TIWupw7zTShyGX
	0sGnD1FkSEeti2a2M5cBIqZw2SXjibMj2rxkVuXCYfXApIoyx4AWhOfgP A==;
IronPort-SDR: AvXJ1eFHxlj1fx2bcies8Z9A8DZTzNDYgRY7mz0X/CpzrP5g5j+UKAXJCkt+u1mmSrS4eIZni1
	cQHbciA33LwkjnscbhROKpwFq7zWcE+9XapOdbC4N48zArrQxOkwvgB0y3f1HI6CNvlz9+AydQ
	9z7UQ6lPbieWrrxg0tCb0YlNgUNhStjvR0KaNZjN5r2PLzO4UqQVruTCvk90sAreo+QtaLIYEF
	UuRxqEKL6SuPj8XfulDdreuRxKeBvLgQuZmtXbeCvi9AiHFnZGvD8AhEk9hjCApWbXgyy655Pm
	YQk=
X-IronPort-AV: E=Sophos;i="5.69,374,1571695200"; 
   d="scan'208";a="2474041"
To: "Hussin, Mohamad Noor Alim" <mohamad.noor.alim.hussin@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20191205024315.20529-1-mohamad.noor.alim.hussin@intel.com>
	<21dcaf2a-8a4f-4c03-e3a9-64dcd57afe83@skidata.com>
	<MN2PR11MB3869D24614B757D80030053D8D270@MN2PR11MB3869.namprd11.prod.outlook.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <ac2a1c85-095a-ca40-d6e7-b6dda0baab28@skidata.com>
Date: Mon, 30 Dec 2019 10:04:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <MN2PR11MB3869D24614B757D80030053D8D270@MN2PR11MB3869.namprd11.prod.outlook.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] icedtea7-native: Fix compilation error due to format-overflow
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
X-List-Received-Date: Mon, 30 Dec 2019 09:04:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On 30/12/2019 09:11, Hussin, Mohamad Noor Alim wrote:
> Hi Richard,
> 
> I am using gcc 8.3.0. I get this error while compiling the source code hotspot/src/share/vm/adlc/output_c.cpp which related to sprintf.
> See the error log below.
> 
> /workspace/poky/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1239:34: error: ‘_idx’ directive writing 4 bytes into a region of size between 2 and 12 [-Werror=format-overflow=]
>             sprintf(left_reg_index,",inst%d_idx%d", left_index, left_op_index);
>                                    ^~~~~~~~~~~~~~~
> /workspace/poky/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1239:34: note: directive argument in the range [-2147483648, 9999]
> In file included from /usr/include/stdio.h:873,
>                   from /workspace/poky/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/hotspot/src/share/vm/adlc/adlc.hpp:33,
>                   from /workspace/poky/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:27:
> /usr/include/x86_64-linux-gnu/bits/stdio2.h:36:34: note: ‘__builtin___sprintf_chk’ output between 12 and 32 bytes into a destination of size 18
>     return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
>            ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         __bos (__s), __fmt, __va_arg_pack ());
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /workspace/poky/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:1252:37: error: ‘_idx’ directive writing 4 bytes into a region of size between 2 and 12 [-Werror=format-overflow=]
>               sprintf(right_reg_index,",inst%d_idx%d", right_index, right_op_index);
>                                       ^~~~~~~~~~~~~~~

Strange, I'm unable to reproduce that problem...
Nonetheless I'd prefer a "real" fix of the error instead of Wno-error if 
that's doable for you?

> 
> By the way, this patch file "recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-handle-gcc7-format-overflow.patch" is set to apply=no
> in recipe file https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/icedtea/openjdk-7-release-03b147.inc#n92.
> So, that patch file will not apply during do_patch.

It is applied using DISTRIBUTION_PATCHES in 
https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/icedtea/openjdk-7-release-03b147.inc#n115

regards;rl

> 
> Regards,
> Alim Hussin
> 
> -----Original Message-----
> From: Richard Leitner <richard.leitner@skidata.com>
> Sent: Friday, December 27, 2019 7:00 PM
> To: Hussin, Mohamad Noor Alim <mohamad.noor.alim.hussin@intel.com>; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-java][PATCH] icedtea7-native: Fix compilation error due to format-overflow
> 
> Hi,
> 
> On 05/12/2019 03:43, mohamad.noor.alim.hussin@intel.com wrote:
>> From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
>>
>> Getting a compilaton error due to format-overflow. Workaround to
>> suppress the error message by ignore the warning.
> 
> Same as for jdk 8, AFAIK these warnings should be fixed by recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-handle-gcc7-format-overflow.patch
> 
> Where/why do you get them?
> 
> regards;Richard.L
> 
>>
>> Signed-off-by: Mohamad Noor Alim Hussin
>> <mohamad.noor.alim.hussin@intel.com>
>> ---
>>    recipes-core/icedtea/icedtea7-native.inc | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-core/icedtea/icedtea7-native.inc
>> b/recipes-core/icedtea/icedtea7-native.inc
>> index b578cb2..0329d71 100644
>> --- a/recipes-core/icedtea/icedtea7-native.inc
>> +++ b/recipes-core/icedtea/icedtea7-native.inc
>> @@ -26,7 +26,7 @@ CXXFLAGS_append = " -fno-tree-dse"
>>    CXX_append = " -std=gnu++98"
>>    
>>    # WORKAROUND: ignore errors from new compilers -CFLAGS_append = "
>> -Wno-error=stringop-overflow -Wno-error=return-type"
>> +CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type -Wno-error=format-overflow"
>>    
>>    inherit native java autotools pkgconfig
>>    inherit openjdk-build-helper
>>

