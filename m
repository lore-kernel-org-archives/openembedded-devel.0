Received: from [64.233.162.224] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hh8Yc-0000X3-O4
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2007 20:19:06 +0200
Received: by nz-out-0506.google.com with SMTP id m22so774743nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 11:10:16 -0700 (PDT)
Received: by 10.114.155.1 with SMTP id c1mr701094wae.1177611015131;
	Thu, 26 Apr 2007 11:10:15 -0700 (PDT)
Received: by 10.115.92.7 with HTTP; Thu, 26 Apr 2007 11:10:15 -0700 (PDT)
Message-ID: <432beae0704261110i5aa9f201te5144ccd97609222@mail.gmail.com>
Date: Thu, 26 Apr 2007 11:10:15 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4630E310.5000008@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
	<4630E310.5000008@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 18:19:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/26/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Justin Patrin schreef:
> > On 4/26/07, Leon Woestenberg <leon.woestenberg@gmail.com> wrote:
> >> Hello all,
> >>
> >> for those of you using insane.bbclass, it will now correctly detect
> >> wrong RPATH's in shared libraries and fail on them.
> >>
> >> Unfortunately, as we have not fixed wrong RPATH's yet in our shared
> >> library handling, this will cause builds using insane.bbclass to fail.
> >>
> >> See bug #2140.
> >>
> >> I hope to be able to fix the .so RPATH stuff as well, but any help is welcomed.
> >>
> >
> > So what you're saying is that angstrom won't build until the RPATH
> > problems are fixed? Kind of sucks for those users who don't know how
> > to fix the problem. I'd suggest that this be made a warning instead of
> > a failure (or have a conf entry that makes it one or the other).
>
> It is a huge gaping security hole, so it is indeed an error.
>

A "huge gaping security hole" that requires you to download a
malicious ipk with malicious libraries which figures out what your
build path was, then installs those libraries there.

Or you could just download a malicious ipk which overwrites the actual
libraries.

I don't see what's hude or gaping about this.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGMOMQMkyGM64RGpERAqoYAKCHCwKJaUuL+1REjY/CRBYMxa7afACfTbs3
> 4ErvVInAL06DjxXwHDTtLb0=
> =sa1b
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Justin Patrin


