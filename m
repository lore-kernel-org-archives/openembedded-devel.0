Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OqVZl-0004Ez-Pe
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 20:29:06 +0200
Received: by wwe15 with SMTP id 15so64226wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 11:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tt+d52ya541GL1bkgtkl9I/pzzYqkDvLx8/kV0I52FA=;
	b=CN4M4L28nhmXUtrvgyXPSZRi19bI8a8HXZNEY+KREwMfXJMMWdfb2+Gip3zQHP2yXZ
	lMjg0tC/+Gs1MIWdqwHY5qUbfOnowfoud+gCf5snGvKlVP6Ca27m3mH+A3hcDi6a1P1M
	Rppm4GVDAK1qc/aU/AKLUlGHe310yFgaCHvLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=I8EYh7q/q6MEKHSIwWkX9QMxRWmzLP9rJ+fZSO0Rxx0FhobkSj6aL8ZzkJxCsJPmjw
	f3c3COoqsbBManDNp1koYu0MRRoCLz6N2KQJdN359CKquGVZwY9Q61uJyGXUcAemQT00
	TYewmx+hWDxtAXmalQmPVsFAvtn+Tiz1aB9+I=
MIME-Version: 1.0
Received: by 10.227.137.81 with SMTP id v17mr6817380wbt.10.1283279298864; Tue,
	31 Aug 2010 11:28:18 -0700 (PDT)
Received: by 10.227.142.79 with HTTP; Tue, 31 Aug 2010 11:28:18 -0700 (PDT)
In-Reply-To: <AANLkTikNTgYR5qVfdxEsGJiNfVtbNEUezCL=UA_1AO4a@mail.gmail.com>
References: <E1Oke6x-0002a5-Qc@melo.openembedded.org>
	<4C7CD21C.7090003@kernelconcepts.de>
	<AANLkTikNTgYR5qVfdxEsGJiNfVtbNEUezCL=UA_1AO4a@mail.gmail.com>
Date: Tue, 31 Aug 2010 20:28:18 +0200
Message-ID: <AANLkTi=aH_bGXoBYK9Jq2CFbo-k6A2+ZJrymsCvP7mLS@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 31 Aug 2010 18:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Florian, Frans,

On Tue, Aug 31, 2010 at 7:48 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/8/31 Florian Boor <florian.boor@kernelconcepts.de>:
>>
>> I do not agree with this. Some older Gtk+ releases are useful on devices with
>> limited RAM and we have some patches for these we do not have for modern ones.
>
> Ok. I restore as soon as I can (don't have access to a git tree right now).
>

I agree with Florian to keep those packages, but I praise the effort
of Frans to clean our meta-mess a bit.

Some packages have a tendency to increase their dependency tree each
time a new major release is made, and especially for those recipes,
keeping more limited (or more efficient?) versions around is very
handy for embedded applications.
Newer is not always better (look at the latest few Linux kernel
releases to see why :-) )

However, we should mention this fact in the recipe, so that any new
pair of eyes that decides to delete them can weight this in.

So my kind request would be to revert and then add a note in the older
recipe to keep them alive as they are superior in cases where low
memory is involved, or a specific device patch is applied.

Regards,
-- 
Leon


