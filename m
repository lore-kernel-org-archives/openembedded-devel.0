Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0Dlc-0004JX-QF
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 17:10:38 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so420285wey.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 07:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=WizGhrHASrP6VpXkxDOreP+lqqb8kb1y1Cg0l1ryy9A=;
	b=nBWSrnLmgUgUJVy2MIq6qhr5aFPj1GMTxYYkqbZinHMWjKJkQkzzzmtpDQW+xatEBX
	qYgkigiIDisxYVKRxALh2dYLUuUjOQn+BX2AHnDfyJJcbX33QESk4m0qTgWrtl5/Hs2T
	Z/w9odOJdy62cPNEZQFzRjzsrkq90058sL9D/4VB7aVCrJRowjzGzzoy2COkIEtNKQso
	sozWGG8dv1MlchFjonp4j8D4wtJYSDDvMwmjV7vzVD0OekLuVMuVgDc7J0Dy1MDDXwTM
	EgZoeIz6XhUUDemL5MSXWrZQR1d4o7bABRcWsR2We3yHqDlXFfe/UXWM51iQjhQEnaUi
	hL9A==
MIME-Version: 1.0
X-Received: by 10.194.90.238 with SMTP id bz14mr3430578wjb.9.1359474896938;
	Tue, 29 Jan 2013 07:54:56 -0800 (PST)
Received: by 10.194.179.39 with HTTP; Tue, 29 Jan 2013 07:54:56 -0800 (PST)
In-Reply-To: <ke8q56$cdm$1@ger.gmane.org>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
	<c693696c02e012de92fd19dddeee0d85ab0e687e.1359462547.git.Martin.Jansa@gmail.com>
	<ke8h9h$gak$1@ger.gmane.org>
	<20130129130650.GN16904@jama.palm1.palmone.com>
	<ke8q56$cdm$1@ger.gmane.org>
Date: Tue, 29 Jan 2013 16:54:56 +0100
Message-ID: <CA+chaQciKEr50pQhJ-A49ubdT8GQBb2_oZ7VsVBgWfJfPxCyfg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 3/5] move broken recipes to nonworking directories
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
X-List-Received-Date: Tue, 29 Jan 2013 16:10:43 -0000
Content-Type: text/plain; charset=UTF-8

The error is in nodejs, cloud9 is broken only because of broken dependency.

| Waf: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/nodejs/0.6.20-r0/node-v0.6.20/out'
| Cannot create folder '/usr/include/node/' (original error: [Errno 13]
Permission denied: '/usr/include/node/')

http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130129_043850.log/bitbake.log


On Tue, Jan 29, 2013 at 4:34 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 29-01-13 14:06, Martin Jansa schreef:
> > On Tue, Jan 29, 2013 at 02:02:47PM +0100, Koen Kooi wrote: Op 29-01-13
> > 13:29, Martin Jansa schreef:
> >>>> * this set does not build with distroless qemuarm as reported in
> >>>> 'State of bitbake world' thread, nobody volunteered to fix them
> >
> > Let me have a look at fbida and the cloud9 stuff before moving them.
>
> I fixed the fbida build for armv7a/angstrom, but I can't reproduce the
> cloud9 error for armv7a/angstrom, can you forward me the error log again
> please?
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFRB+vuMkyGM64RGpERAskYAKCsNst/HA5VRY8cRRCfQ+SUTPJZBgCgrpiz
> wn5sJzJUvJjpntPRMVliAMQ=
> =NNvn
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

