Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9WI6-0006EC-UW
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 07:05:17 +0200
Received: by iwn5 with SMTP id 5so352997iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 22:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=j+LD/Uo35Tz3zkPT3xLGPY/6P9yPoKmEJuQV71ux4Q8=;
	b=LKX+DTDQHlI53kelCTSNkLP9N24i0596n598TDaPcLLVQpgLZRMU6kipkJJ3hhwipQ
	SDxSbVp7EjsWyLHv1fQUbAAWmCgvlh9fS+yNKN6vHrYuunXuNRcI8iLIytpq5TK8SXtH
	olJXgAKfTwoJGOjv1FpaZl1+vuCkza76Vixr0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=CA+M3TdzLo6I8xxudwL4OyKsN7GskfYwY2p6Vj2M3FF7+7CS+2G/zMNX1v5idK48hd
	Zvfat5otlRmoKL9/OOzLFaVXoSnWe3CbVKWJMlUmFg1d/u3+k7vId/ErU/Bkfwkbqj/e
	Q7xT8jTgRXHKmc9mXXuPHnteo4nXYWDqCM1NY=
MIME-Version: 1.0
Received: by 10.42.79.212 with SMTP id s20mr2734252ick.95.1287810272949; Fri,
	22 Oct 2010 22:04:32 -0700 (PDT)
Received: by 10.42.164.194 with HTTP; Fri, 22 Oct 2010 22:04:32 -0700 (PDT)
In-Reply-To: <4CC2029C.5070106@phoenixsoftware.it>
References: <4CC0C67C.6060806@phoenixsoftware.it>
	<AANLkTi=ir567dGvzgOTgwvba3M0k1wyWmAJiwG4HNeJG@mail.gmail.com>
	<4CC2029C.5070106@phoenixsoftware.it>
Date: Fri, 22 Oct 2010 22:04:32 -0700
Message-ID: <AANLkTimYkjGN62vRYHTZD2ykW5X_uP=oUGpOvhbbzd4G@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl and libtool 2.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Oct 2010 05:05:17 -0000
Content-Type: text/plain; charset=UTF-8

I have posted a patch to address this issue please try that out

On 10/22/10, Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it> wrote:
> Khem Raj wrote:
>> On Thu, Oct 21, 2010 at 4:02 PM, Pierluigi Passaro
>> <pierluigi.passaro@phoenixsoftware.it> wrote:
>>
>>> Hi all,
>>> LIBTOOL_HAS_SYSROOT feature has been recently enabled on Angstom 2010.x
>>> distro.
>>>
>>> However, using CodeSourcery toolchain, this feature lead to use CSL
>>> sysroot
>>> as search path, that is generally different from
>>> ${STAGING_DIR_TARGET}${libdir} folder used for packages.
>>>
>>
>> hmmm yes I see the problem. Right now its left upto the compile to provide
>> the sysroot which works well with internal toolchain but will not work
>> with
>> external toolchains or the compilers which dont support --print-sysroot
>> option
>>
>> I will come up with a patch so specify the sysroot for libtool so that it
>> does not rely upon the compiler to compute it.
>>
>>
> I'm not expert of libtool mechanisms but please let me know I can
> provide any support.
>>> At present I worked around the problem with the attached patch, but I was
>>> wondering if this could be a misconfiguration or a bug.
>>>
>>> Any suggestion will be appreciated.
>>>
>>>
>>
>> With libtool 2.4 I dont see a reason to disable sysroot. The variable is
>> only
>> provided to keep libtool 2.2.6 functional as same time. So when using 2.4
>> please
>> do not disable the sysroot feature.
>>
>>
> I agree with you, I will just keep the patch for personal use, until
> libtool will not rely on CSL compiler to compute sysroot.
>>> Regards
>>> Gigi
>>>
>>> --
>>> Ing. Pierluigi Passaro
>>> Viale Don Luigi Sturzo 34
>>> 30174 Venezia Mestre
>>> Cel: +39 348 355 4119
>>> Tel: +39 041 862 3373
>>> Fax: +39 041 862 3173
>>> Web: www.phoenixsoftware.it
>>> P.IVA 03884060272
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

-- 
Sent from my mobile device

-Khem


