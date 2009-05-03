Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1M0eUX-0004J4-1C
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 May 2009 18:24:37 +0200
Received: by yx-out-1718.google.com with SMTP id 36so2086557yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 May 2009 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SjjczjQpocVptaTOi0uTygeapW2pA3sEZnmC4Kw8iP4=;
	b=V3YTuzT+z8Rhqde4sWbeWvF6JH0ZfhNqKi9msIGDPd5V7bQXPcdW6Pi8lWV1hPVxJF
	RfU87m6+tZLhHAq3QWW+rg60L+/rggKJHA5wFYWCzvu6eC/g9tz7CXJoqX2jTtgpQ+WP
	nf64y4rZ5t9sBmPqONXcX6Pv/yPqiHoyL6l5o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=i/cMCAsDTHJOS6YXYlSepMT3ehqqYCAxVCTxHuJ8b5TAQzrA/qSX7HvumsOByMzBn3
	c6QH/tHQhDnU/9rwf0Mf0zcABL/R0WGGZFPij1dFzXUijkg+9V6x6hKZeE/nGsUzcAhF
	zeOFuWjAVhuTvPtvOPiMXUE5RGDi64+9eLb2k=
MIME-Version: 1.0
Received: by 10.100.46.1 with SMTP id t1mr10924312ant.24.1241367535083; Sun, 
	03 May 2009 09:18:55 -0700 (PDT)
In-Reply-To: <49FD9EEA.4030608@dls.net>
References: <c384c5ea0905030555t48379d37o700254a1c49a4600@mail.gmail.com>
	<49FD9A75.3000609@balister.org> <49FD9EEA.4030608@dls.net>
Date: Sun, 3 May 2009 18:18:55 +0200
Message-ID: <ac9c93b10905030918t25211118yc27bb1177f1e65cb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC]: Remove #####...##### lines
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
X-List-Received-Date: Sun, 03 May 2009 16:24:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/5/3 Mike (mwester) <mwester@dls.net>:
> Philip Balister wrote:
>> Leon Woestenberg wrote:
>>> #######################################################################=
######
>>>
>>> #I am a bit annoyed by the hash lines in some of the files
>>> #######################################################################=
######
>>>
>>> # They distract me from the real content of the files.
>>> #######################################################################=
######
>>>
>>> RFC_REMOVE_HASHLINES ?=3D 1
>>
>> Although this might start a coding style war, I also find them distracti=
ng.
>
> Hehe!
>
> Let's replace them with prettier formats:
>
> #=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=
=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#
> #
> # =A0I prefer this style. =A0For Major Section headers, anyway.
> #
> #=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=
=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#=3D=3D#=3D#=3D#
>
> #---------------------------------------------------------------------
> #
> # And of course, this style is alway popular for Minor Section headers.
> #
> #---------------------------------------------------------------------
>
>
>
> Consider the coding style war begun... =A0Seriously, I'd prefer we don't
> worry too much about the comment styles.
>
> Yes, some of the structures annoy me, and I would organize some of the
> conf files differently, and some files have more blank lines than I
> would like, and others need some =A0carefully-place blank lines in my
> opinion, and while we're discussing this, I think the style rules that
> PR =3D "r0" should never appear in a recipe is baloney; I feel very
> strongly that should appear in all recipes.... =A0this could become quite
> the can of worms, I think. =A0:-)
>
>
> RFC_REMOVE_HASHLINES--;
>
> Or, rfcRemoveHashlines-- if camelCase is your preferred style... :-)
>
>
> Mike (mwester)
>
> Oops - or should that be:
>
> ~Mike (mwester)
>
> ;-D
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Hm. I don't like the hashes, but the alternative from Mike even seems
more disturbing ...

I do agree that PR =3D "r0" in a recipe should be ok. (actually I think
that unaware of this I violated that rule a number of times :-) )


