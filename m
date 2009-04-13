Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LtNzN-0004x0-Pm
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Apr 2009 17:22:29 +0200
Received: by ewy20 with SMTP id 20so2145720ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2009 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8lgqmDk4gsuFYf3PeEIEaiyztXcDYzgnjowgAUsstlk=;
	b=mNW9if7Q0YiY454mwbPlNkjafShoDcR0AnIg87PCV8Ghe8njQYcN55niDq0qM+PslN
	oVFeenpqQVtzpUpBYdF0xfdbtj8OVgBw4KgJa08THkHJKXMzmnudiv1USulsFIH9nirP
	D0EyOwWQPGEIjToA4qN6HIS7+dYMVCfQeN/rY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CN/jU5pL/ckdEoHyb3baIkxm7urfQbvjHbfLqzarpzI6hXBWi2AEfiP/WevmRKvqYy
	KhrdITsxvhK7WHgNIzpSP+VPngxSIRvdbdMwAmZtQcrHo2RqSGyB7dDPL4tLicVeYXV9
	NvQYCIwLCpKLm/9W2MYLSOXLavm4G4YE9hBTs=
MIME-Version: 1.0
Received: by 10.210.21.6 with SMTP id 6mr2063606ebu.26.1239635928467; Mon, 13 
	Apr 2009 08:18:48 -0700 (PDT)
In-Reply-To: <ac9c93b10904041356i59b7a1bel66d2ea022b37bcf5@mail.gmail.com>
References: <ac9c93b10904030956g2e8a1663g7877947b1a17775c@mail.gmail.com>
	<069B6B31F6201B4389D7EEB9AD827BCA0500604A@otis.burlington.evertz.tv>
	<ac9c93b10904040101p434f67acrd9cc05602b57ec91@mail.gmail.com>
	<200904041523.29738.mickey@vanille-media.de>
	<ac9c93b10904041356i59b7a1bel66d2ea022b37bcf5@mail.gmail.com>
Date: Mon, 13 Apr 2009 17:18:48 +0200
Message-ID: <ac9c93b10904130818i25ac072etaf1109ea0419dcb4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] Where is the python-zopeinterface recipe?
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
X-List-Received-Date: Mon, 13 Apr 2009 15:22:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I decided to have another go at this, and apparently it was easier
than I assumed.
Just copied the proper line from another recipe :-)
I've just pushed the change to dev and leave it to one of the core
dev's to decide if it is good enough for stable.

Frans.

2009/4/4 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2009/4/4 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
>> On Saturday 04 April 2009 10:01:09 Frans Meulenbroeks wrote:
>>> I think what happened is that when zopeinterface was split off the
>>> zope recipe, the name got changed. Not sure if that was intentional.
>>>
>>> Mickey, as I am not a python wiz: should baking zopeinterface result
>>> in a python-zopeinterface package or should we change the name in the
>>> packages that require zopeinterface (like twisted) ?
>>
>> We should change the name here.
>>
>> :M:
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Michael,
>
> I tried, but this is outside my bitbake knowledge.
> Can you give it a try?
>
> Thanks, Frans
>


