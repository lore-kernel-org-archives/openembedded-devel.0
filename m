Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 32E8171DDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 23:43:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so54154870wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 15:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=d+bHR+U35zz55b4Rgv7wLMfgGwuDR6N33/cXYv+g7bs=;
	b=lfL3E6leW+mN/rLrl7iifmKuaGpqgb7J81P9vyZ5HN0ZBE+biomdkOiecsHO2GAag6
	f/ECY1F6EqLvX8oSMx60PZ6eErlZIE9FF/S5sp6hoyi0qveSWfyuW4CsPIRElbPx+A9u
	NAweQPpFe4GRkPOmCNT4GcRkjCwoYhUF5ZhdHR0oxF1qwYvTZHWVirQRhDQ90w+LfIw+
	9EGCthGitZEgUgqgJUKyht7xvFIX/j6LqMGiTCgq5T4cg+FfaTp9SzjhxEppercfm4up
	dGR/pMrZfL7CxOxGzGzxjzsoIAz7Nt9IIzPa4jYIPX/RTqK4lGC/dlnJSNAGlo5eXabL
	gPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=d+bHR+U35zz55b4Rgv7wLMfgGwuDR6N33/cXYv+g7bs=;
	b=UY70o2vWdrBxxycL/JaytqbndOe8Cjs+q9CWIse/lDYWuhFgCUdAXCWfNPr5IIqzRX
	wdUbee7otinvpJjQuLooDklaoKfgtDaEVKNerlSUF1cUedGwD5uhYJHn6OlfAkVwy6db
	ljKlvPokKiA4MRNK9fK3kSdbHJW/MlwsFj2xar9bVMxmQ8q/hBqpd3eE+ToQseYt9Vnz
	bB+HPRtgGWYXC+SheiCMi+POVSO7UsWWxhCI+BiEhoQ8o2Yf41ud6TGr6EZSzCNxI/Co
	TH1U0Or5U4Z7yruEOvUQDS+6Lj7ihfSZ6o4z9XfUzkUQuKtfy0iYYeIHMIhJMoCBxLfI
	OZIg==
X-Gm-Message-State: AIkVDXJMQ2MAe4C9xvc5WzSdf/KB4Aw7wWeICBuphQq9UC1nQWNnib1jY2ZHyeugIXLf+xQgErEoZ5gLZDAScw==
X-Received: by 10.28.225.215 with SMTP id y206mr653450wmg.138.1485474233473;
	Thu, 26 Jan 2017 15:43:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.98.164 with HTTP; Thu, 26 Jan 2017 15:43:52 -0800 (PST)
In-Reply-To: <e981be87-9ea5-83df-6ee1-a52ffda3fb1e@gmail.com>
References: <1485380601-6226-1-git-send-email-armccurdy@gmail.com>
	<e981be87-9ea5-83df-6ee1-a52ffda3fb1e@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 26 Jan 2017 15:43:52 -0800
Message-ID: <CAJ86T=WxBVjhFMED3Y6tFnSjjdXbU9A-sYBfpfj5JUjMa9L7mg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: test SITEINFO_BITS instead of maintaining a list of 32bit targets
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
X-List-Received-Date: Thu, 26 Jan 2017 23:43:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 26, 2017 at 2:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 1/25/17 1:43 PM, Andre McCurdy wrote:
>> When cross compiling, the word size of the compiler set via HOST_CC
>> must match the word size of the target. That's achieved by appending
>> "-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.
>>
>> Unfortunately the current list of over-rides (powerpc, x86 and arm)
>> does not cover all cases (e.g. it ignores MIPS). Using SITEINFO_BITS
>> is a more generic solution.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> index 964dc1d..430279f 100644
>> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746bee
>>
>>  S = "${WORKDIR}/LuaJIT-${PV}"
>>
>> -inherit pkgconfig binconfig
>> +inherit pkgconfig binconfig siteinfo
>>
>>  BBCLASSEXTEND = "native"
>>
>> @@ -21,9 +21,7 @@ BBCLASSEXTEND = "native"
>>  # you need to install the multilib development package (e.g.
>>  # libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
>>  # (HOST_CC="gcc -m32").
>> -BUILD_CC_ARCH_append_powerpc = ' -m32'
>> -BUILD_CC_ARCH_append_x86 = ' -m32'
>> -BUILD_CC_ARCH_append_arm = ' -m32'
>> +BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
>
> not related but
> This makes me think about another issue, will it work on non-x86 build
> machines, currently we do have aarch64 based boxes

Right (unless aarch64 host toolchains accept "-m32"?)

Building on 32bit x86 is probably broken too.

>>  # The lua makefiles expect the TARGET_SYS to be from uname -s
>>  # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

