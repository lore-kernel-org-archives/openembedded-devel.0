Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OY4pM-0005hX-US
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 00:16:50 +0200
Received: by iwn34 with SMTP id 34so4100957iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 15:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=bILXqi+ci2mU/ewkTv5/SCNiRuRPiaPDpQHBQuHAaMw=;
	b=pJ0a/7p04JzXjMaFpFOmkAKmepnPoStjF9rRqfm25wOtDkdJYtMMby8xh0KeQ3Y9ep
	mji82ZwMlhZudBbXVrMXLDztTm8igz9tk84Fn8r+pHBIZgh2MHJ3MjY6nKWfeBfXhgxC
	dOCQOERCO+k7c6U7pjsk7+NvmehpZxTjbObKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=xAg8FwuZzSjW7EJ/QZXcaDwINQYFrnU3hP3QeeuDZcWtFJfWI5Vbfv6aUKzuyW/j9i
	HrML211ZIjLVFrl0dw2BPEkgxX75thEublThKcZmhZTrD3cr3+aiJfgfwiUqYWVpw1mA
	8jiOIRRu5TA8V7IdOm0VAgkE9B4NBYPHj4yp0=
Received: by 10.231.17.13 with SMTP id q13mr12563153iba.14.1278886314234; Sun, 
	11 Jul 2010 15:11:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.132 with HTTP; Sun, 11 Jul 2010 15:11:34 -0700 (PDT)
In-Reply-To: <i1cpi6$jpb$1@dough.gmane.org>
References: <20100711145800.264h899h0c8c08o0@webmail.htc-linux.org> 
	<i1cpi6$jpb$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jul 2010 15:11:34 -0700
Message-ID: <AANLkTikrsNxQdImXrYtmhEqmNCsRb9YAdgyGHMoukrn0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: glib-2.0: do_compile, angstrom: gcc-cross ver.
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
X-List-Received-Date: Sun, 11 Jul 2010 22:16:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 11, 2010 at 8:55 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-07-10 15:58, lukas gorris wrote:
>> Hello,
>>
>> I have just ran a build in org.openembedded.dev commit
>> fd049a8b9904348456b26ffa7ff25d834c477c6b and noticed a bug.
>>
>> I am using armv7a based htcleo machine configuration and
>> angstrom-2008.1 distro. because angstrom still selects obsolete
>> gcc-cross versions for armv7a
>
> Excuse me!?!?!? Gcc 4.3.x still generates the fastest and best code for
> armv7a,

agreed.

gcc 4.4.x generates slow and buggy code and well,

may be, I don't have any data to support this claim but if you do have
something it would be nice if you shared that here.

 let's not talk
> about gcc 4.5.

gcc 4.5 has many fixes including the direct TLS register access through CP15
on armv7+ which should be some improvement for TLS access. May be its
worth to start trying it on armv7a and weed out any issues early in
its adoption.
and may be start using thumb2 if not done thus far for armv7+

>
> I'm using binaries built by this 'obsolete' toolchain daily on armv7a
> hardware without problems, using neon, vfp, etc, so I'm wondering what
> this is all about.
>
> This all reeks of broken kernel syndrome, are you using linux.inc? If
> not, please do so, it fixes up a whole lot of bugs.


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMOemGMkyGM64RGpERAtpVAKCNitZFtUlGpbLtF/glkqhvs5GZQQCgrLx7
> drZkWVNgaleAovXa7efOsVc=
> =yPyi
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


