Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1OQy0o-0001rw-UV
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 09:35:18 +0200
Received: (qmail 7974 invoked by uid 813007); 22 Jun 2010 07:30:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2010 07:30:33 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jun 2010 09:30:28 +0200
User-Agent: KMail/1.13.3 (Linux/2.6.35-4-generic; KDE/4.4.85; x86_64; ; )
References: <AANLkTim2-Y4qW9Wb-kycxo89vNZgBJkdeVSyERXZYCoJ@mail.gmail.com>
In-Reply-To: <AANLkTim2-Y4qW9Wb-kycxo89vNZgBJkdeVSyERXZYCoJ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201006220930.31306.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] patch file location
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
X-List-Received-Date: Tue, 22 Jun 2010 07:35:19 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 22 czerwca 2010 o 09:03:43 Frans Meulenbroeks napisa=C5=82(a):
> I'd like to draw the attention to the location of patch files.
> My original understanding was that these should be in either the files
> dir (if they apply to all), or in a dir with the name of the recipe
> (replacing the _ with a - ).
>
> And I kind-a assumed that if a patch is in a recipe dir it would have
> priority above a version in the files dir.

This is controlled by FILESPATHPKG and OVERRIDES.

> Frankly speaking I have no clue at all which version of the patch will
> be used by the 2.10.1 recipe.=20

glibc-2.4/ one - check FILESPATHPKG setting in glibc_2.10.1.bb recipe.

> The only ways to find out is to study the class code that does the patch =
or
> to actually build the package (in the hope it selects the patch in a
> deterministic way).=20

I did "grep FILES glibc/*" to find out.

> I don't think it is good that if someone is debugging a problem that they
> should have such a hard time to find out what version of a file is
> actually used
=20
> My proposal:
> - only apply patches (seek for patches) in the recipe dir (e.g. in the
> example for glibc_2.10.1.bb this would be glibc-2.10.1) and in the
> files directory

It is not only patches. It is everything in SRC_URI. And we have this=20
mechanism since beginning.
=20
> (optionally we might allow for a mechanism that allows specifying
> patches for higher level recipes; e.g. glibc_2.10.1 could look in
> glibc-2.10.1, glibc-2.10, glibc-2, glibc and files).

We have such mechanism already - it is FILESPATHPKG and related vars.
=20
> How do people feel about this? Any implementation hints?

Why implement when it is already implemented?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




