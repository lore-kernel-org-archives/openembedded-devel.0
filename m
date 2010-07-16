Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZfFD-0007Pq-3N
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 09:22:06 +0200
Received: by bwz10 with SMTP id 10so1184110bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 00:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XGlm+KRsRxwx8lUvzzhsWOLOmunD68+NmFDyfy748GY=;
	b=C6U9EnXYJWwfumKUF1cGNJlGv0LJyXT/+PJl/CeIv6+Pld0D4qr+4YCpDgoo+vfvYA
	HlavRf95xqOo/iu7gIRbYboJ13hHl2hw/yPqZs/XNdpbN+B7AL1JHbTwU3+5mSSK+otR
	FxM6eB3wIOj9MCPVeNM1Pb2S1MFmx58Kxpe4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BjmvaZ4iIRJ2jXi5EtomMoln9q5PgrEvxCsC/9ORh8rNgxR1qj+rcRi2eqG+NktQ79
	apx4YdUrnAG8qHpq+UNPVO67ph9+ZpLFu6DV+HHiW1mpUvaa0QrHTTTva9t+GlkLJTk1
	NM8JWq8Odt7ffz7E2f9TiL3pEvWLrJcl7QpdA=
MIME-Version: 1.0
Received: by 10.204.150.92 with SMTP id x28mr593049bkv.132.1279264919730; Fri, 
	16 Jul 2010 00:21:59 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Fri, 16 Jul 2010 00:21:58 -0700 (PDT)
In-Reply-To: <201007160917.07949.marcin@juszkiewicz.com.pl>
References: <1279227362-6279-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201007160917.07949.marcin@juszkiewicz.com.pl>
Date: Fri, 16 Jul 2010 09:21:58 +0200
Message-ID: <AANLkTikh4Wy3_b0LkbfBlu0gwBn_SBZ_g2a8iDPwV8rA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	PLING_QUERY,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] binutils: added COMPATIBLE_TARGET_SYS = "(?!nios2)"
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
X-List-Received-Date: Fri, 16 Jul 2010 07:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2010/7/16 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

> Dnia czwartek, 15 lipca 2010 o 22:56:02 Frans Meulenbroeks napisa=B3(a):
> > added COMPATIBLE_TARGET_SYS =3D "(?!nios2)" to all versions
> > that do not support nios2.
> >
> > Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> > ---
> > Once accepted I will remove the pinning from nios2.inc
> >
> > Frans
> >
> >  recipes/binutils/binutils_2.14.90.0.6.bb      |    2 ++
> >  recipes/binutils/binutils_2.14.90.0.7.bb      |    2 ++
> >  recipes/binutils/binutils_2.15.94.0.1.bb      |    2 ++
> >  recipes/binutils/binutils_2.16.1.bb           |    2 ++
> >  recipes/binutils/binutils_2.16.91.0.6.bb      |    2 ++
> >  recipes/binutils/binutils_2.16.91.0.7.bb      |    2 ++
> >  recipes/binutils/binutils_2.16.bb             |    2 ++
> >  recipes/binutils/binutils_2.17.50.0.1.bb      |    2 ++
> >  recipes/binutils/binutils_2.17.50.0.5.bb      |    2 ++
> >  recipes/binutils/binutils_2.17.50.0.8.bb      |    2 ++
> >  recipes/binutils/binutils_2.17.bb             |    2 ++
> >  recipes/binutils/binutils_2.18.50.0.7.bb      |    2 ++
> >  recipes/binutils/binutils_2.18.atmel.1.0.1.bb |    2 ++
> >  recipes/binutils/binutils_2.18.bb             |    2 ++
> >  recipes/binutils/binutils_2.19.1.bb           |    2 ++
> >  recipes/binutils/binutils_2.19.51.0.3.bb      |    2 ++
> >  recipes/binutils/binutils_2.19.51.bb          |    2 ++
> >  recipes/binutils/binutils_2.19.bb             |    2 ++
> >  recipes/binutils/binutils_2.20.bb             |    2 ++
> >  recipes/binutils/binutils_cvs.bb              |    2 ++
> >  20 files changed, 40 insertions(+), 0 deletions(-)
>
> Maybe instead of populating so many files set it in binutils.inc (so all
> version will be marked as incompatible) and then set
> COMPATIBLE_TARGET_SYS=3D""
> in version which is compatible.
>

Good idea. Guess it was too late yesterday for me to think about that.
I'll come up with a new patch tonight or tomorrow. (also for the other
recipes)

Frans

>
> Regards,
> --
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

