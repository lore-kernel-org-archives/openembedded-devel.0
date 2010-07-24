Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OchHh-0001KF-7p
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 18:09:10 +0200
Received: by bwz10 with SMTP id 10so2317881bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=VEa3hOO1oYnhHnEdW/VJHiHYJl72EU2W0dsczy0xgMk=;
	b=hw2BxntOsrYGa9ntD/JPLs51njecfBlcn0Qj4QfPtw1+sOWgthIJp97ctWegeYOOJa
	fJQoIQHRq1sTmmDsFAmnyLw0xIuMpo4BFOeojghM8S4TNVG/idk3wuXIJYX7eCkn/+0V
	+gTZmQ06tltMuom1FUXAVLDtbnX+veU/RnM8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=D00UbP9LE7vayUyEOqjp7MO56scJ58Bqew1HnsoIS3TS8sQArsiGm6bgGLo4AWPOCC
	Vkuao6W2/gdKSJRyY+FMbtX6VSveQc81zrRkV49R4DeQ+v5NyG3qOUdsrj8tMmye/aCT
	OC4lNWgoE2bu47bWRg6Z2TYG8BK3XpfhWi9Ig=
MIME-Version: 1.0
Received: by 10.204.162.207 with SMTP id w15mr3624463bkx.63.1279987737140; 
	Sat, 24 Jul 2010 09:08:57 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sat, 24 Jul 2010 09:08:56 -0700 (PDT)
In-Reply-To: <4C4B0125.1040304@vollmann.ch>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>
	<4C4AE42C.5000306@welchs.me.uk>
	<AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com>
	<4C4B0125.1040304@vollmann.ch>
Date: Sat, 24 Jul 2010 18:08:56 +0200
Message-ID: <AANLkTi=MJyW68ppn7YH-1LNp3rVwii9Gas+kUjQYAEEo@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Sat, 24 Jul 2010 16:09:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/24 Detlef Vollmann <dv@vollmann.ch>

> On 07/24/10 16:35, Frans Meulenbroeks wrote:
>
>> 2010/7/24 Martyn Welch <martyn@welchs.me.uk>
>>
>>  Can anyone point me to any documentation that describes what legacy
>>> staging
>>> is and roughly what needs to be done to remove it?
>>>
>>
>
>> There was a post half a year or so ago from Koen, but I can't find it.
>> Basically it boils down to removing do_stage from a recipe in which case
>> do_install is used to install things in staging
>> in some cases do_install need to be modified to deal with peculiarities
>> that
>> were done in do_stage
>>
>> For native recipes NATIVE_INSTALL_WORKS = "1" may need to be added.
>>
> That's not really much of an explanation.
> Let's take an example.  I have two out of tree kernel modules A and B.
> B depends on A.
> With "legacy" staging, in A_1.0.bb I have a do_install, that copies
> the kernel object, and a do_stage, that copies the header file at
> a place where B_1.0.bb can find it.
>
> How do I do that with non-"legacy" staging?
>

Apologies if my explanation was too brief. Didn't have too much time (and
still haven't)
I hope Koen's explanation below helps.
The way I perceive it is that the non-legacy staging is performed by doing a
do_install with the staging dir as target directory.
Guess someone will correct this if I am wrong.

Frans

>
>  Detlef
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

