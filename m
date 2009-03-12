Received: from [209.85.221.116] (helo=mail-qy0-f116.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lhsv0-0001K6-Df
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 22:58:22 +0100
Received: by qyk14 with SMTP id 14so2634368qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 14:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HsKZ5OFAITm1jdTG/Pb9Pm1aKyN6j9JIM9mjtiHPNxg=;
	b=JFOmicZl/oxz8YnARXu1HyafkET/xmCQ0ii8FubwydLSK3SM0ORVWluNdpaRekOM4x
	7cRRimezD9AJ//C1HWdgIeoKX8qKPaMJsK1FhDcOaEhjHZBD9rJ8qDuktf04eZey/0X8
	MJ61RgrrwlbpCVYA2h2WM7LMMRS/Yi7IpUpG8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nUfyODCAQvo/32zSiBNRuEo2ShwqxIvQCLve7Or80ONJzp11bXA/iTundnvOT89//S
	uxVOTzaXX0iXTCmwqZQ2Y1eH3rc1MaDWo46gstKEQkQ8U8Qe093X3+mGpyjqTGk4q9eh
	RXF/6iStqz2HWBolwyAW6JmaMkRux/e2bLTwQ=
MIME-Version: 1.0
Received: by 10.142.179.2 with SMTP id b2mr203836wff.308.1236895080518; Thu, 
	12 Mar 2009 14:58:00 -0700 (PDT)
In-Reply-To: <ac9c93b10903121334j3a6cfad8u8e4591ddecf80394@mail.gmail.com>
References: <ac9c93b10903120252x292ff544gca18ac8684ce0f2f@mail.gmail.com>
	<19c1b8a90903121037g5726bf99qadca1e5d95dcae7@mail.gmail.com>
	<ac9c93b10903121334j3a6cfad8u8e4591ddecf80394@mail.gmail.com>
Date: Thu, 12 Mar 2009 14:58:00 -0700
Message-ID: <19c1b8a90903121458ufac02e7p878b6badfe29878@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: g++ lib problem
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
X-List-Received-Date: Thu, 12 Mar 2009 21:58:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 12, 2009 at 1:34 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2009/3/12 Khem Raj <raj.khem@gmail.com>:
>> On Thu, Mar 12, 2009 at 2:52 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> Hi,
>>>
>>> I was trying to port a program that used asinl etc. but apparently
>>> asinl is not in our env.
>>
>> Did you link with -lm ?
>>
> It didn't get that far. the compiler already complains about asinl not found.
> On opensuse this compiles ok. Apparently when generating the c++ lib
> or header it is decided that the function is not there, although the
> header file links asin to __builtin__asinl or something like that).
>

I see it gets it from libm but g++ specifiies -lm for you where as gcc
does not. I think the problem is that ARM have same precision for
double and long double so glibc defines __NO_LONG_DOUBLE_MATH for ARM
as a result the prototypes for the *l functions are not emitted into
math.h. Although in glibc they are aliases for the corresponding
double functions I dont know why they are not exported in math.h too.
may be they want to make it difficult for people to use them on
platforms where they are not really different then double
counterparts.

So if you use gcc -lm it works because gcc does not barf on missing
prototypes but it wont compile with g++ because g++ does not find the
prototype for asinl in math.h and gives error.

> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


