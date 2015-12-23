Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 873DF6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 04:14:37 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id c96so125669646qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 20:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=A31Uw5NrUFxfngMgjLPbgcUaUI6AqDmhPc1H9jPWe7c=;
	b=py3pCHB0euvR7Uh5/FYrCcBIWmaXKmcWENqS1XLp9AFwEAUzfCwpmrfCcFTh78yRVB
	HUoTcQ0qiKD39Uaaxseps8cBmiBbkcYmeGH+R9Fxc1wBg0yp0iXkJ42W/p50jn947XIw
	6TUUj8m6omIGVPL/OYrnqI+0cWu5QOgEq3FcweDvp1F51DbmZ8ExxCdt5tT3y0Zk+GQg
	aTN4Uzh+ebqfmt1QKtsm9kHiFE/ed8zg3mFfKIE9AxtNTOvO0NhAx7bCrYDsPfq9/mwC
	p4W0LisU/KHSV7fU/vhei/Ya9bk9lBP8TNBKbWVuj2DtzGJKchdfToEzFMfB/z1BZnv3
	valA==
X-Received: by 10.140.97.2 with SMTP id l2mr37117473qge.30.1450844077766;
	Tue, 22 Dec 2015 20:14:37 -0800 (PST)
Received: from [192.168.141.106] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.googlemail.com with ESMTPSA id
	c190sm17487361qkb.27.2015.12.22.20.14.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 20:14:37 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1450799125-5013-1-git-send-email-twoerner@gmail.com>
	<1450799125-5013-2-git-send-email-twoerner@gmail.com>
	<CAJ86T=XzNuWnP8sanhre_WYi0KFLK9w=4Kj4B+Pk=9Ae8pe_Qg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <567A1FAB.4030600@gmail.com>
Date: Tue, 22 Dec 2015 23:14:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XzNuWnP8sanhre_WYi0KFLK9w=4Kj4B+Pk=9Ae8pe_Qg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v4 1/1] nodejs: cleanup and update
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
X-List-Received-Date: Wed, 23 Dec 2015 04:14:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

On 12/22/15 13:06, Andre McCurdy wrote:
>> Remove old nodejs4_0.4.12 and update nodejs_0.12.7 to the latest stable
>> nodejs_4.2.3.
>>
>> Nodejs is picky about which architectures it supports. The supported arch
>> mapping required some updating to bring it up to date with the current nodejs
>> code. Add COMPATIBLE_MACHINE entries so it only builds for the supported
>> architectures.
>>
>> ARM cores that don't support at least VFP2 have been dropped:
>>
>>      https://groups.google.com/forum/#!topic/v8-users/aSOFbaAQvMk
>>
>>      "Due the increasing cost of the keeping the "no-VFPv2" port of V8 working
>>      on ARM, we are planning on making 3.17 the last V8 release that that
>>      supports ARM chips without VFPv2. Starting with the 3.18 release, the
>>      minimal V8 requirements will increase to ARMv6 + VFPv2. In order to
>>      simplify maintenance, we will also remove the "pre-VFP2" ARM code from the
>>      V8 code base."
>>
>> Additionally, gcc no longer supports a VFPv2 option:
>>
>>      https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-mfpu-1460
> There's no documented -mfpu=vfpv2 option in older releases either, so
> trying to use it may just be a bug in the v8 build system?
>
>    https://gcc.gnu.org/onlinedocs/gcc-4.4.0/gcc/ARM-Options.html#ARM-Options
>    https://gcc.gnu.org/onlinedocs/gcc-4.5.0/gcc/ARM-Options.html#ARM-Options
>    https://gcc.gnu.org/onlinedocs/gcc-4.6.0/gcc/ARM-Options.html#ARM-Options

Interesting. I hadn't thought to look at the older docs to try to find 
out "when it was removed". It's rather strange, then, that the V8 build 
included this at all! How/when could it have ever worked? (rhetorical)

> The correct option for vfpv2 is -mfpu=vfp and it's certainly still
> supported by current gcc versions (it's used by meta-raspberrypi).

A day or so ago I created a patch to switch this flag in the nodejs 
build from "-mfpu=vfpv2" to "-mfpu=vfp" and the build for qemuarm did 
succeed. When I tried running the resulting program in the VM, however, 
it threw an "illegal instruction" and failed. Since ARMv5 is no longer 
officially supported, I didn't bother introducing that patch and simply 
continued to remove support for this architecture.

Interestingly, although the ppc architecture is supported, and it builds 
fine, running node in qemuppc also threw an illegal instruction and 
failed. I kept support for ppc, however, since officially it's supported 
and any run-time errors are, perhaps, an upstream issue?

Maybe I should also disable ppc builds so anyone using the recipe for 
that purpose doesn't get their hopes up? Strictly from a build point of 
view, ppc "succeeds".

I never was able to test the ppc64 build (which is also successful) 
since I couldn't figure out the magic incantation to get 
qemu-system-ppc64 to boot to a cmdline.

Best regards,
     Trevor

