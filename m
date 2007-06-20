Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1I0xWo-0001ol-H0
	for openembedded-devel@openembedded.org; Wed, 20 Jun 2007 12:35:10 +0200
Received: (qmail 6881 invoked by uid 813007); 20 Jun 2007 10:31:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Jun 2007 10:31:27 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jun 2007 12:31:26 +0200
User-Agent: KMail/1.9.7
References: <BAY143-F26F6CAE5A52DDDF6A67FC9B9110@phx.gbl>
In-Reply-To: <BAY143-F26F6CAE5A52DDDF6A67FC9B9110@phx.gbl>
MIME-Version: 1.0
Message-Id: <200706201231.27942.openembedded@hrw.one.pl>
Subject: Re: Question - How dose bitbake select a kernel
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
X-List-Received-Date: Wed, 20 Jun 2007 10:35:11 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 20 czerwca 2007, Pelle Svensson napisa=B3:
> Hi,
>
> I'm starting to put together a image.bb file.
> I can't figure out how I control the selection of kernel.
> In the tasks file it says 'RDEPENDS=3D... kernel ...'.
> When building in verbose I get
>
> NOTE: multiple providers are available for runtime kernel
> (poodle-kernel-2.4-embedix, LAB-kernel, linux-h1940, linux-omap-2.6,
> a780-kernel, linux-bast, corgi-kernel-2.4-embedix,
> shepherd-kernel-2.4-embedix, linux, poodle255-kernel-2.4-embedix,
> husky-kernel-2.4-embedix);
> NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime
> kernel

> 1. How did bitbake come up with this list? Is done by bb-file's name or
> a tag inside?

It checks all providers of "virtual/kernel" target.

> 2. Should I add 'PREFERRED_PROVIDER_kernel=3Dmy-target-kernel.bb'  if so
> where?

In machine config:

PREFERRED_PROVIDER_virtual/kernel =3D "my-target-kernel"

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                   Nie rzucim ziemi, sk=B1d nasz root...




