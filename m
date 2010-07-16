Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZjAv-0002IR-Qe
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 13:33:54 +0200
Received: by bwz10 with SMTP id 10so1316027bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 04:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=29iQg1b70Ojrb/9uDH+ipYpFCF0QyCED47ctZuxJwss=;
	b=CymEPPmcMM1WVzU/4sOMdLBEIEOJHmCUy+duwr4Ab4sqJcrERNZGUabAf71il59vFy
	CCj2MSk0pMoZEr+hT0pM2f+EtlXM4oesVfN3KcXEamw73D9zDauv9oR/qGd9up/a8mb5
	4hLZQg8euFeyyBbNlXHPH+NkQDnz7qsA73gig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=F8gWcllzmqfUduuTAOWX7Q0EU4H4j0/M0gkb9jvy7iqNvLngKSdyp80PbG71LuRoRL
	HfZb6+VZehbxpXdxpRZqjSOgeRwA+nYvHMLjkS7duskjPxLUBHPBhm3j+FC0lagp4wc6
	Ll5rcjkFUztek23vitZnxXdJCmwUS5iPziUAc=
MIME-Version: 1.0
Received: by 10.204.16.209 with SMTP id p17mr821845bka.157.1279280030138; Fri, 
	16 Jul 2010 04:33:50 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Fri, 16 Jul 2010 04:33:50 -0700 (PDT)
In-Reply-To: <4C403F02.8080606@balister.org>
References: <AANLkTikabrLWPM53wvdCKrDSKRJdFQTdNsA2MnfwzrI0@mail.gmail.com>
	<4C403F02.8080606@balister.org>
Date: Fri, 16 Jul 2010 13:33:50 +0200
Message-ID: <AANLkTinyrz_-sC3VCRIj-O5bQoFjx-YJpa3vu7hR0uLx@mail.gmail.com>
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
Subject: Re: u-boot-utils badness
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
X-List-Received-Date: Fri, 16 Jul 2010 11:33:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/16 Philip Balister <philip@balister.org>

> On 07/15/2010 02:41 AM, Frans Meulenbroeks wrote:
>
>> Incidentally I stumbled upon u-boot-utils.
>> This recipe did not seem too good.
>>
>> We only have a version for 1.2.
>> Guess u-boot tools do not change that much, but still it seems somewhat
>> odd.
>>
>
> .....
>
>
>
>> How to deal with this???
>>
>
> Why not just leave it alone? It is entirely possible the recipe is being
> used soley to generate mkimage for machines that have working u-boots from
> another source.
>
> Much better to have a u-boot recipe that generates the tools than have
> everyone who just needs mkimage hacking together a different recipe to get
> it.
>
> Philip
>
>
As you wish :-)

Note that u-boot-tools not only provides mkimage but also things like fw_env
Also, to further mess up things: we also have u-boot-mkimage_1.3.2.bb
There seems to be room for some quality improvement.
Oh well....

Frans

