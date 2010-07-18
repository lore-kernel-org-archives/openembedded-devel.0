Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OaZpn-0003KM-IT
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 21:47:36 +0200
Received: by bwz10 with SMTP id 10so2213050bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 12:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=fJvepwAgR60IlcxdNbIP5NM3j/eV4WI7u0/eWp7Smm4=;
	b=uqX0awd+1h0ThQE84tjn2m9hBqcy6Oi0QcbTxalc4rS6ATGVp8CZgX8j2HmKLmEXoB
	LIx6l8EMgsBb6w+IRNlFWOiVAHoJ0UsUKbeBgAO7413ZCAmcBtqVx2MNPe/efwuD89GW
	PaCtm0JQ+/UblHjwG2fv9npxCW6APQFE0D3EI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xGUe6IwsK7zrnS5q7YZlpLspXV27Z6Cic1OpP6sng64lEN5IRgSVcFuIR5YkZKGp+b
	Cstu7axezatFsKxzNoEOZJDHZVu/ROGeVpTeMj6L6kHleuFEi2XiwJnO9U37tfrAJUw5
	3xIWxDcTmjKAXVKjtR0JL8JwtuUmhde2BHRTo=
MIME-Version: 1.0
Received: by 10.204.131.200 with SMTP id y8mr3191702bks.107.1279482449475; 
	Sun, 18 Jul 2010 12:47:29 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sun, 18 Jul 2010 12:47:29 -0700 (PDT)
In-Reply-To: <1279290319.10837.1747.camel@rex>
References: <1279290319.10837.1747.camel@rex>
Date: Sun, 18 Jul 2010 21:47:29 +0200
Message-ID: <AANLkTinYiD78udRbI9UYYpWceIKsIy0ZCY9V8GDFNN2t@mail.gmail.com>
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
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Sun, 18 Jul 2010 19:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/16 Richard Purdie <rpurdie@rpsys.net>

> Whilst our layers mechanism, is great it does have a drawback which has
> bugged me for a while. If you have a recipe like pointercal which has
> machine specific information in it and you have your new machine code in
> a layer, how do you add a pointercal file for your machine?
>
> Answer is you copy the whole pointercal recipe and files into your
> layer, then add the single file for your machine. To me this is ugly,
> ugly, ugly. We hate code duplication and as soon as you create two
> copies of the same information, we've failed.
>
> So how could we do this better? Somehow we need to say that a given
> directory X has some information which should be merged with the
> original recipe. I've thought through several different ways of doing
> this and the best solution I found was "bbappend".
>
> The idea is that if bitbake finds any X.bbappend files, when it loads
> X.bb, it will also include these files after it parses the base .bb file
> (but before finalise and the anonymous methods run). This means that
> the .bbappend file can poke around and do whatever it might want to the
> recipe to customise it.
>
> I went ahead and tried it out as its quite simple to code this in
> bitbake. I liked the result enough I've already merged this into Poky:
>
>
> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=63e6ba85677b8aa9f4cf9942a1fccbb8a8c72660
>
> I'm proposing to push it to bitbake master if there are no serious
> objections.
>
> As an example use case, for the pointercal case above in another later
> you could add a pointercal_0.0.bbappend file which contained something
> like:
>
> FILESPATH := "${FILESPATH}:${@os.path.dirname(bb.data.getVar('FILE', d,
> True))}"
>
> which would then cause the directory containing the bbappend file to be
> searched for pointercal files.
>
> There are of course many other uses this could be put to for creating
> customised layers, its totally generic.
>
> For the specific case of paths, I have wondered if there would be a way
> to leverage help from bitbake in creating a sane set of search paths but
> I'm still thinking about that. This extension is good enough in its own
> right in my opinion to be worthwhile.
>
> Cheers,
>
> Richard
>

I've been pondering a litlte bit more about this.
Will the .bbappend mechanism allow me to override a file in the original
recipe?
If so how?

Typical use case: I want to have a dedicated defconfig for my linux kernel.
Alternate use case: a dedicated busybox configuration.

Frans.

