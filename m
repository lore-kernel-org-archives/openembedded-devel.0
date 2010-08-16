Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Okxaf-0003pM-BT
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 13:10:54 +0200
Received: by iwn38 with SMTP id 38so1532584iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=pkFS4nbPVy+1DCunW6V4vcefxVXVNNQdOaQ59P1+b8Q=;
	b=hKLggXcxW4mQNubqY/ruvgGVWAdtUHufWWtDSmoSmdnqzZwEhOzOOsArAtuRM8gwv4
	p0kdRBCF1Ju//7K6/g6sdFCHmQuvyN3crVoQgMiHl6RD9SaRgKbpn4CJtu+94itTck/W
	KaPOZ9RQhuLhrF1EegabPnckLn8UjyCSLU0u4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cM9VkvJmfp7nN1cGmok1GgO+GjgXkxv2VGqn7LMIlY1qbLH0IKy5ialFUQ10+UJs8Y
	QLb0FBlHXVQgGZEec8VqLF67t+ElgTKKkzFqESzr8cFQikekgOx/21SfYqvFU89E9r3V
	VBLCo53XISTA4hEs7J6q7jGDhoVGUN+MAthb8=
MIME-Version: 1.0
Received: by 10.231.157.205 with SMTP id c13mr5965018ibx.71.1281957038013;
	Mon, 16 Aug 2010 04:10:38 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 04:10:37 -0700 (PDT)
In-Reply-To: <i4b3dl$vbk$1@dough.gmane.org>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<i4auje$u5g$1@dough.gmane.org>
	<AANLkTimpAxxt7GR=1VV9ZrAWubMp63sX771+PfhLjWTu@mail.gmail.com>
	<AANLkTi=pVCajY==ZdehO_Bw33xsrYcvBnYHfN4s2Vne=@mail.gmail.com>
	<i4b3dl$vbk$1@dough.gmane.org>
Date: Mon, 16 Aug 2010 13:10:37 +0200
Message-ID: <AANLkTim8Et4FHon4o2dsTOyFe-8huxTmmFEYA5PNZirw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 11:10:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 16-08-10 11:30, Frans Meulenbroeks wrote:
>> 2010/8/16 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>>> 2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> You removed the default openssl version (0.9.8) without bumping PR for
>>>> recipes using that, so now my autobuilder is quite red due to do_rootfs
>>>> failures (among other build errors related to these removals).
>>>
>>> I will reinstate openssl 0.9.8
>>> conf did not show any pinning but i missed the DEFAULT_PREFERENCE = "-1' in 1.0
>>> seems a good plan to upgrade to 0.9.8o though as it fixes some
>>> security vulnerabilities
>>>
>>
>> reverted the commit for removal of 0.9.8
>> I was unaware that a PR bump of recipes using another recipe needed to be done.
>
> For libraries, certainly, as in this case SOVERSION changed, so the
> resulting packagenames changes from
> libssl0.9.8_0.9.8m-r12.0.5_armv7a.ipk to
> libssl1.0.0_1.0.0-r12.2.5_armv7a.ipk. OE removes the first one, but
> other packages still have it in DEPENDS.
>
> And if SOVERSION doesn't change, bumping PR for dependant recipes is
> needed for things that statically link to it (or even dynamically in
> some case).

Tanks for the explanation.
It would be nice if oe would detect those cases and force a rebuild.
>
> The ffmpeg recipes try to list the know offenders that break when
> updating SRCREV, but I guess a bitbake tool (e.g. 'bitbake whatdepends
> foo') would be nice for these kinds of things.

I've asked before about something like that, forgot why it was not
easy/possible.
i also did try a bitbake -g world to get a list of deps, but that also
failed for some reason.

I would expect that if you have the recipes in a parsed format, it
should not be overly difficult.
Anyhow, my pythonese is too limited to implement something like that.

Frans


