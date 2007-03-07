Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <christopher.lang@plus.cablesurf.de>)
	id 1HOu9H-00019h-7C
	for openembedded-devel@openembedded.org; Wed, 07 Mar 2007 12:17:35 +0100
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id l27ATAfl008915 for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Mar 2007 11:29:11 +0100
From: Christopher Lang <christopher.lang@plus.cablesurf.de>
To: openembedded-devel@openembedded.org
Date: Wed, 7 Mar 2007 12:17:31 +0100
User-Agent: KMail/1.9.1
References: <1173131731.5842.140.camel@localhost.localdomain>
In-Reply-To: <1173131731.5842.140.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200703071217.31968.christopher.lang@plus.cablesurf.de>
Subject: Re: Bitbake Request for Testing of bitbake 1.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2007 11:17:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Richard,

I did some tests with bb 1.8 and with same setup with 1.66.

1.66 works, 1.8 fails.

results in: http://bugs.openembedded.org/show_bug.cgi?id=3D1944

cheers
Chris


Am Montag, 5. M=E4rz 2007 22:55 schrieb Richard Purdie:
> I've been putting this off for a while but bitbake trunk has branched
> for a new stable release series, 1.8.x which will ultimately replace the
> 1.6.x stable series.
>
> Could people give the 1.8 branch in bitbake a try? If you have problems,
> I will do my best to resolve them before 1.8.0 is released. I estimate
> 1.8.0 is say a week away, I want to release soon.
>
> For what its worth, some of the core devs have been using trunk for a
> while with success and its been used in poky without incident for a
> while now too.
>
>
> What's will be new in 1.8?
>
> * We basically rewrote half the core. Bitbake used to calculate the
> build path "on the fly" which was no use for multithreading, its now
> been replaced with a calculation in advance (taskdata and runqueue).
> This allows it to do simplistic multithreading. Set BB_NUMBER_THREADS =3D
> "100" in local.conf to lock your machine up or something lower to try
> multithreading ;-).
>
> * The -g dependency graph output has changed and now includes a task
> dependency file. Has anyone got a good way to view these graphically
> yet?
>
> * The fetchers were refactored removing duplicate code and standardising
> behaviour.
>
> * Numerous code changes were made internally to refactor/modularise the
> code. This will be useful in future developments (the last code I
> checked in prepares for the UI).
>
>
> What will happen in trunk?
>
> I've branched as I have some fairly invasive changes planned for trunk.
> The aim of these is to split bitbake into a client/server and look at
> UIs. Whilst 1.7.x was very stable more recently, 1.9.x is going to
> break ;-).
>
> The current UI code I have is about as secure as publishing your IP
> address and root password on the web and leaving the telnet port open so
> when I check it in, use at your own risk. I will accept patches to
> address these issues ;-). My main concern is the structure at the moment
> rather than security or functionality which can come later.
>
>
> So please do test the bitbake 1.8 branch and lets make it as successful
> as 1.6!
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


