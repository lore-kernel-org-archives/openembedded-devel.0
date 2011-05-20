Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QNRPh-00011r-DH
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 17:14:53 +0200
Received: by qyk35 with SMTP id 35so414412qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=kZ8bU+ahl+7wIq+DaL9NtIiOpdMWhaQAF7UhiXRnqrk=;
	b=kS2oRSeo03zBQsZhOJlsStK9lLNcvSwpyFncfB4Y2cFOaUkVFdcLlpO0npo6G8BMfn
	UmG9wRGeb/JaZ5BB7ujYi02tJREW+H9oyIwEgtlFD7A63DAwJQbyA587cOhtfsy+yNbI
	DXvinkh2fwX737UbR7Q+h5DClPdcVzkapXAX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=iFQWyuAI8V5el1Tfh9msFdxIivkn2tUxncVLjZzXC2EnlgIJYn4fNhyyJZ5/aDIUyp
	xVQbZ0gOGtGwqG+wZbxOa/I+R4DYkt0vplnX5+9rw2NXpqJODqr865de3I/Ho/6NU5gw
	6vsgNrutp1AEZyqx8wpZD6OvDnCsJ/XQm8OV0=
Received: by 10.229.182.202 with SMTP id cd10mr3385856qcb.171.1305904315136;
	Fri, 20 May 2011 08:11:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.192.13 with HTTP; Fri, 20 May 2011 08:11:35 -0700 (PDT)
In-Reply-To: <1305883809.15084.3.camel@phil-desktop>
References: <BANLkTi=sn5n-gdOOFgt6k=PswZHhCe0Mww@mail.gmail.com>
	<BANLkTi=VUCzOWjZ8bnRHqrnLqsRZypRdxQ@mail.gmail.com>
	<1305883809.15084.3.camel@phil-desktop>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 20 May 2011 17:11:35 +0200
Message-ID: <BANLkTik5rGXsF6O59bweGS+okP8+92mAzA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: vlc failed to build here ( palmpre2, SHR ) -fPIC thing
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
X-List-Received-Date: Fri, 20 May 2011 15:14:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ok here I don't get it...
To be sure of what I would advance I did again some research/tests
and went for first time to make it compli but as I was not sure of how/why =
I
save my changes and
did update my build host but then bitbake vlc worked perfectly! without any
trouble!
So I don't understand... I added some things like that in live555.inc and i=
n
vlc.inc
CFLAGS_append_armv7a =3D " -fPIC "
CFLAGS +=3D " -fPIC "

or this in the do_configure of live555.inc
CFLAGS+=3D" -fPIC "

Thanks anyway!
Perhaps I will not be lucky everyday! :)
Greetings.

Sylvain




2011/5/20 Phil Blundell <philb@gnu.org>

> What are the ways that you've already tried?
>
> p.
>
> On Fri, 2011-05-20 at 10:48 +0200, Sylvain Par=E9 wrote:
> > Please does someone has a clue  about this   -fpic flag ?
> >
> >
> > 2011/5/17 Sylvain Par=E9 <sylvain.pare@gmail.com>
> >
> > > Hello,
> > >
> > > I have refreesh my build here so I tried again to build VLC for my pa=
lm
> > > pre2 but It does not succeed here :
> > >
> > > libliveMedia.a: relocation R_ARM_MOVW_ABS_NC against `a local symbol'
> can
> > > not be used when making a shared object; recompile with -fPIC
> > > |
> > >
> /home/sylvain/dev/SHR-Build/shr-unstable/tmp/sysroots/armv7a-oe-linux-gnu=
eabi/usr/lib/libliveMedia.a:
> > > could not read symbols: Bad value
> > > | collect2: ld returned 1 exit status
> > >
> > > long version http://pastebin.com/Cvd6pnuj
> > >
> > > I have tried several ways to pass -fPIC argument to live555 recipe bu=
t
> > > without any success..
> > >
> > > Does some one has a clue ?
> > >
> > > Thanks by advance.
> > >
> > > Regards,
> > >
> > > Sylvain
> > >
> > >
> > >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

