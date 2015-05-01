Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6F14D60024
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 May 2015 23:55:22 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so106011152pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2015 16:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=gweYYKKiwP8vh4ASOvCnu2quZgMa75fIzIly6HC/ssw=;
	b=DyCIBQ/ceQji8T6Xmwa9w3AkoEXlBnfERLfjBjF17u12HSruK2/0cgFdZVLCqqq9qO
	84ZFW98THEZENH04A22R+WFq25KT7weegIv4bvsbRwvFDFHTlUrD62MRtVEN6dp7APUw
	qflNnB3CV/3tsqZBiYKzIjxBA/GEUOLG43A+VzRetk2OY8t5hKi56OiUrCxacPswIxi/
	oijOQhG8HaAgUVGjD9ZINo+og93aVJNP5ZrqRzd53J1MyToRl6fPA0YxLNeWyK7/Ezl0
	DII68dR+nryu0nHMqIDMytBL/YXk3hR7ucJyZRTbXub6LGA8WqAg9ReWb4uzfud+8wsF
	xVYQ==
X-Received: by 10.70.38.225 with SMTP id j1mr22160056pdk.14.1430524523968;
	Fri, 01 May 2015 16:55:23 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:54d9:5aca:52b:ad71?
	([2601:c:a700:3ba7:54d9:5aca:52b:ad71])
	by mx.google.com with ESMTPSA id ax2sm5887582pac.21.2015.05.01.16.55.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 May 2015 16:55:22 -0700 (PDT)
Message-ID: <55441262.3010905@gmail.com>
Date: Fri, 01 May 2015 16:55:14 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1429058796-30801-1-git-send-email-akuster808@gmail.com>
	<20150501122210.GA2366@jama>
In-Reply-To: <20150501122210.GA2366@jama>
Subject: Re: [meta-ruby][PATCH] ruby: Update to 2.2.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 May 2015 23:55:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/01/2015 05:22 AM, Martin Jansa wrote:
> On Tue, Apr 14, 2015 at 05:46:36PM -0700, Armin Kuster wrote:
>> Includes among other things: CVE-2015-1855: Ruby OpenSSL Hostname Verification
>>
>> for more info see:
>> http://svn.ruby-lang.org/repos/ruby/tags/v2_2_2/ChangeLog
>
> Hi,
>
> both 2.2.1 and 2.2.2 are failing on some hosts native builds with:
> | linking miniruby
> | load.o: In function `rb_f_load':
> | load.c:(.text+0x3af): undefined reference to `RUBY_DTRACE_LOAD_ENTRY_ENABLED'
> | load.c:(.text+0x428): undefined reference to `RUBY_DTRACE_LOAD_RETURN_ENABLED'
> | load.c:(.text+0x452): undefined reference to `RUBY_DTRACE_LOAD_RETURN'
> | load.c:(.text+0x492): undefined reference to `RUBY_DTRACE_LOAD_ENTRY'
> | load.o: In function `rb_require_internal':
>
> ..
>
> any idea what's causing it?
>
> I'll add --disable-dtrace to see if it resolves the issue.

I thought I added that.. Oh, wait I forgot I sent a 2.2.2 update out.. I 
have a v2 then.

- armin
>
>>
>> also, fixed runtime error.
>> only include "enable-wide-getaddrinfo" if IVP6 is enabled in disto feature
>> otherwise 'gem install rails' throws an error for the missing symbol 'getipnodebyname'.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta-ruby/recipes-devtools/ruby/{ruby_2.2.1.bb => ruby_2.2.2.bb} | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>   rename meta-ruby/recipes-devtools/ruby/{ruby_2.2.1.bb => ruby_2.2.2.bb} (77%)
>>
>> diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
>> similarity index 77%
>> rename from meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
>> rename to meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
>> index 29f2291..c463525 100644
>> --- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
>> +++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
>> @@ -1,7 +1,7 @@
>>   require ruby.inc
>>
>> -SRC_URI[md5sum] = "b49fc67a834e4f77249eb73eecffb1c9"
>> -SRC_URI[sha256sum] = "5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c7819ab28"
>> +SRC_URI[md5sum] = "326e99ddc75381c7b50c85f7089f3260"
>> +SRC_URI[sha256sum] = "5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b113d9b44"
>>
>>   # it's unknown to configure script, but then passed to extconf.rb
>>   # maybe it's not really needed as we're hardcoding the result with
>> @@ -9,11 +9,13 @@ SRC_URI[sha256sum] = "5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c78
>>   UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
>>
>>   PACKAGECONFIG ??= ""
>> +PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
>> +
>>   PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
>>   PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
>> +PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
>>
>>   EXTRA_OECONF = "\
>> -    --enable-wide-getaddrinfo \
>>       --disable-versioned-paths \
>>       --disable-rpath \
>>       --enable-shared \
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

