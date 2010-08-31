Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqXHU-0007Gq-Gs
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 22:18:11 +0200
Received: by gya6 with SMTP id 6so2914504gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 13:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=boKLEbNxWG5m70XQ28yhBQFYNNkJPY28lOffOaI2wgs=;
	b=QwJno9ApZAk709f1AJ8bHWcouUxJfOv+SBNn+hbzSW1/VPmzE4arnupkALEQ6E1t+m
	+umy1h7P55juB8BDLlK51lr9hSSo0RpCcYks+KqdK+hfLzDUIHDKEII3Vl0Mh5WKOZaV
	huk8sFMdXpj3KeZ6WV8QsaUKZsxa08Br/Dt3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hMN2P8YqUOTrOplP8rwI7Z1jC45s2umwISYBOb9XKLOFKjYCvykpYf6AKsE3+ADo65
	3R6G4sOr8QQkgE5lKaCd3/V2svZpm3LrT3nny7Lk4YYn4tGa1enJh+Fy3l1L+R5ipVjT
	7HWEnM/VwDrfA1pM8WSo39eKm+zl1L0oH09Ss=
MIME-Version: 1.0
Received: by 10.150.182.6 with SMTP id e6mr3029698ybf.157.1283285854584; Tue,
	31 Aug 2010 13:17:34 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 31 Aug 2010 13:17:34 -0700 (PDT)
In-Reply-To: <AANLkTi=aH_bGXoBYK9Jq2CFbo-k6A2+ZJrymsCvP7mLS@mail.gmail.com>
References: <E1Oke6x-0002a5-Qc@melo.openembedded.org>
	<4C7CD21C.7090003@kernelconcepts.de>
	<AANLkTikNTgYR5qVfdxEsGJiNfVtbNEUezCL=UA_1AO4a@mail.gmail.com>
	<AANLkTi=aH_bGXoBYK9Jq2CFbo-k6A2+ZJrymsCvP7mLS@mail.gmail.com>
Date: Tue, 31 Aug 2010 22:17:34 +0200
Message-ID: <AANLkTi=knw-mda+SNV61JLc8EbvxGpa5vuJp9+OT2nCa@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : gtk+: remove old versions
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
X-List-Received-Date: Tue, 31 Aug 2010 20:18:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/31 Leon Woestenberg <leon.woestenberg@gmail.com>:
> Hello Florian, Frans,
>
> On Tue, Aug 31, 2010 at 7:48 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/8/31 Florian Boor <florian.boor@kernelconcepts.de>:
>>>
>>> I do not agree with this. Some older Gtk+ releases are useful on devices with
>>> limited RAM and we have some patches for these we do not have for modern ones.
>>
>> Ok. I restore as soon as I can (don't have access to a git tree right now).
>>
>
> I agree with Florian to keep those packages, but I praise the effort
> of Frans to clean our meta-mess a bit.
>
> Some packages have a tendency to increase their dependency tree each
> time a new major release is made, and especially for those recipes,
> keeping more limited (or more efficient?) versions around is very
> handy for embedded applications.
> Newer is not always better (look at the latest few Linux kernel
> releases to see why :-) )
>
> However, we should mention this fact in the recipe, so that any new
> pair of eyes that decides to delete them can weight this in.
>
> So my kind request would be to revert and then add a note in the older
> recipe to keep them alive as they are superior in cases where low
> memory is involved, or a specific device patch is applied.
>
> Regards,
> --
> Leon

Reverted as requested. Btw not all the lower numbered versions were
deleted, only the ones marked with * below (which are now restored.
We now have:

gtk+-1.2_1.2.10.bb
gtk+-fastscaling_2.10.14.bb
gtk+_2.10.14.bb
gtk+_2.14.1.bb *
gtk+_2.14.2.bb
gtk+_2.16.4.bb *
gtk+_2.16.6.bb *
gtk+_2.18.0.bb *
gtk+_2.18.3.bb *
gtk+_2.18.6.bb
gtk+_2.20.0.bb
gtk+_2.20.1.bb
gtk+_2.6.10.bb

Enjoy them :-)

Frans


