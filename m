Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MfAnI-0003Cf-Fm
	for openembedded-devel@openembedded.org; Sun, 23 Aug 2009 12:59:28 +0200
Received: (qmail 31524 invoked by uid 813007); 23 Aug 2009 10:41:52 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Aug 2009 10:41:52 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2009 12:41:51 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc6-00243-g53bc5c0; KDE/4.3.0; x86_64; ;
	)
References: <4A81BE84.6010607@atmel.com>
	<200908211353.59344.marcin@juszkiewicz.com.pl>
	<4A902ECF.3090909@atmel.com>
In-Reply-To: <4A902ECF.3090909@atmel.com>
MIME-Version: 1.0
Message-Id: <200908231241.51880.marcin@juszkiewicz.com.pl>
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Sun, 23 Aug 2009 10:59:28 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 22 sierpnia 2009 o 19:45:51 Ulf Samuelsson napisa=C5=82(a):
> Marcin Juszkiewicz skrev:

> > Any ideas? I have same problem when 2.12 is used. 1.14 works still.
>
> This is the code that will block your progress.
> Can you provide the first 8 dwords of the image you ae trying to load?

http://marcin.juszkiewicz.com.pl/download/at91/ contains at91bootstrap file=
s=20
which I checked on board. I tried with at91sam9263ek files before and today=
=20
with at91sam9263dfc one.

During week I plan to change at91bootstrap recipe to build all variants for=
=20
board (so for MACHINE=3Dat91sam9263ek it will build at91sam9263ek,=20
at91sam9263dfc and at91sam9263nf) as ek/dfc/nf are just variants of one boa=
rd=20
which differ only at at91bootstrap (kernel and userspace is the same). When=
=20
this will work all machine configs other then *ek can be dropped.

> Maybe you have not initialized all the trap vectors
> or you are doing something valid, but unexpected.
>
> Are you loading something else than U-Boot?

U-Boot 2009.08-rc built from your recipe.

> Have now checked the source:
>
> The 2.13 is based on the 1.13 sources.
>
> The 1,14 source code is not available on the Atmel.

ftp://www.linux4sam.org/pub/at91bootstrap/AT91Bootstrap1.14.zip


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




