Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ORLmN-0003xJ-Tq
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 10:58:05 +0200
Received: by bwz14 with SMTP id 14so2056172bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=r8vXMWK+MdY/48zl0m8duaGbJUCJ9Oagt8yw5S5OsNU=;
	b=RwI2V9/D7+2dYsLzIKhHu0aEJNlbGh6Kj+pncYEk0E3/uhHaODfmBiwDZ+UpFL3pW9
	rC92LRavTaYHHXpx3NGG7xx4SAKnOYZyLP7db9lxs5esMSryOqh8BV6BPFun87xU4bmf
	gjnuSkKDMDR3crDDuW6bcgxyreofTsNFaWHGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aYU6dWtOb9DNXPFMs4kD6jVd2qOd+okLSHMmMAJ2QIyD5Iazx6TLtqfV1NcAcKN2FP
	Be8+mnt1QAxlk/HRfpHQocQjgEQXB8W9Y6HMVvR6kkekz13BuAod1vWmtOXNgbyuKEKI
	G/OShLXLHYIVO0ILHH8nQXCqKq9SkWGTk4wJg=
MIME-Version: 1.0
Received: by 10.204.81.196 with SMTP id y4mr5269705bkk.75.1277283201592; Wed, 
	23 Jun 2010 01:53:21 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Wed, 23 Jun 2010 01:53:21 -0700 (PDT)
In-Reply-To: <AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
Date: Wed, 23 Jun 2010 10:53:21 +0200
Message-ID: <AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a 	question)
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
X-List-Received-Date: Wed, 23 Jun 2010 08:58:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/6/20 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 20-06-10 11:58, Frans Meulenbroeks wrote:
>>> Hi,
>>>
>>> I'm about to complete bringing a new architecture (nios2 with mmu) and
>>> machine (cyclone III FPGA starter kit, and maybe also the Nios2
>>> Embeddeded Evaluation Kit (aka neek)) to oe.
>>> Is there a policy on on the process how to do this.
>>
>> Have a look at the nios2 patches Leon sent last december, they were
>> reviewed on this list, but not committed.
>
> Koen, thanks for reminding me the look at the review comments.
>
> I'm well aware of the work of Leon and Walter (and they are well aware
> of my work).
> Note that what Leon posted was for a non-mmu nios2 core, whereas the
> changes I have is for an mmu core.
>
> Triggered by Koens reminder I revisited the review comments. Actually
> none but one are applicable for me.
> The one that is applicable is the one about pinning versions in
> machine descriptions.
> I have also done that, as there are simply no other versions of
> binutils and gcc that can be used by this hardware.
> Also I don't feel empowered to make changes in distribution specific files.
>
> The only alternative way that I can think of is doing something like:
> DEFAULT_PREFERENCE_nios2 = "1" in the recipes I need.
> No idea if that overrules the distro settings or not, but I can give
> it a try later today.

Well, tried it and apparently a distro pin has priority over a
DEFAULT_PREFERENCE_nios2 in the recipe.
Guess I'll have to do the pinning the the machine description as
described above.

Frans.


