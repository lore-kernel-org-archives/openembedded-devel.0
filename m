Received: from [209.85.221.178] (helo=mail-qy0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MqbVv-0004mZ-0Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Sep 2009 01:44:50 +0200
Received: by qyk8 with SMTP id 8so1062318qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 16:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3wlShAdZqwIWsMZrf+apMwcWAMrvBK4lTGQiNYKmPdY=;
	b=UyfrfT8AndW6c5AUdDCxDZEKfz2LO4oOJeD2fuidJIga+a/RftHdjmAlKpj/arAh1L
	dv69j19t3yN9LpRJi2b9CfXxols8CUD2NpyYLAhe2qR4pP0om2qofJFeT2Gs9CK/G7Vr
	kl3arXxdOsOM5bAGcYjvxgRL4SMUeBgyT7M8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sHkzC+BMayTm3CYJ4omvHimygC+jfTv6f6xMN8ewNB6Dm874SAd0OueQLOPW6tU8GG
	kcKcOYWT/dpCJE5qEVUo8woPd++4U0+/EIBQWLlfGhiPuZ+4vypRA9nqcQ1n2r3P+9Ml
	H8/fYTxOwNBLB30ZipDAodTjB9PXk7jbDG+VY=
MIME-Version: 1.0
Received: by 10.229.69.83 with SMTP id y19mr1330736qci.50.1253749447906; Wed, 
	23 Sep 2009 16:44:07 -0700 (PDT)
In-Reply-To: <4AB9CF00.1070505@dresearch.de>
References: <4AB8CF91.1070907@dresearch.de>
	<19c1b8a90909221051x775eb576qb0813e26bdca7c09@mail.gmail.com>
	<4AB9CF00.1070505@dresearch.de>
Date: Wed, 23 Sep 2009 16:44:07 -0700
Message-ID: <19c1b8a90909231644r2c4be842pa6c128b16294c86b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake freeze :(
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
X-List-Received-Date: Wed, 23 Sep 2009 23:44:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2009 at 12:32 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Khem Raj wrote:
>> you could try couple of things. Firstly try to isolate if its a
>> bitbake problem or not
>> likely its not but still make sure. You can go into the workdir and
>> run the task script
>> run.do_<task> whatever it is stuck at. If it succeeeds then you know
>> its a problem with
>> bitbake if not then the build mechanism for this particular package
>> has problem. You might
>> try to disable parallel build i.e. use -j 1 to make sure that its not
>> some parallel build
>> issue.
>
> I made some tests on this.
>
> First result was that if calling
>
> =C2=A0> bitbake drapptempl -c clean
> =C2=A0> bitbake drapptempl
> =C2=A0Ctrl-C
> =C2=A0> bitbake drapptempl
>
> the first build request freezes in do_compile stage, the second one
> succeeds (seen in 5 of 5 test runs). Also calling run.do_compile
> succeeds everytime if tried after the first freeze.
>
> After that i checked the parallel build options in my local.conf.
> The tests above were made with
>
> =C2=A0PARALLEL_MAKE =3D "-j 4"
> =C2=A0BB_NUMBER_THREADS =3D "4"
>
> I tried to set the BB_NUMBER_THREADS to 1 but the problem was still
> existing.
>
> After that i tried to set the PARALLEL_MAKE to "-j 1" and no the
> recipe was build fine. =C2=A0:)
>
> So it seems that there is a problem with parallel make. But it only
> occurs in a few of our recipes. Therefor i believe that there must be
> something special in there makefiles/recipes.
>
> After a detailed inspection i noted that they all depend on a library
> which uses glib (incl. some tools like gob2). The library itself does
> not have the build problems. But could the problem result from this?
>

disable parallel build for this recipe.

> Steffen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


