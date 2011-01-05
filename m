Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1PaWKw-0008PI-8r
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 17:35:47 +0100
Received: (qmail 9242 invoked by uid 2404007); 5 Jan 2011 16:35:22 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-120-20.dynamic.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by host4.kei.pl with ESMTPA; 5 Jan 2011 16:35:22 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 5 Jan 2011 17:35:43 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.37-11-generic; KDE/4.5.90; x86_64; ; )
References: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
	<201101051252.07668.marcin@juszkiewicz.com.pl>
	<AANLkTiks7z6oag1GLC=cj9a-mmtYqm-0Z1oCE2zZXT9R@mail.gmail.com>
In-Reply-To: <AANLkTiks7z6oag1GLC=cj9a-mmtYqm-0Z1oCE2zZXT9R@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201101051735.43988.marcin@juszkiewicz.com.pl>
Subject: Re: [RFC] linux 2.6.36: upgrade to 2.6.36.2
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
X-List-Received-Date: Wed, 05 Jan 2011 16:35:47 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia =B6roda, 5 stycznia 2011 o 14:51:35 Frans Meulenbroeks napisa=B3(a):
> > I think that stable kernel updates should be applied without asking - b=
ut
> > if there are some patches for some machines in recipe then it needs to
> > be checked does it patch/build before pushing update.
=20
> There are. Both systems mentioned above have patches.
> I've no idea if they will remain to apply after moving to .2. Of
> course I can verify that, but if they fail I am not too sure if I can
> fix things. They are machines that I do not have.

for mach in machine1 machine2;do MACHINE=3D$mach bitbake -b linux_2.6.36.bb=
 -
cpatch;done

This will test does patches apply. If they are then push change, if they no=
t=20
then check why - maybe they contain patches from stable update (edit them=20
then).
=20
> Thinking of it, probably it is better to create a 2.6.36.2 recipe with
> DP =3D -1 for all but my board and leave it to the mx31ads and ts72xx
> machines to move to that recipe when they see fit.

Why not linux-yourmachine_2.6.36.2.bb then? linux_BASE_VER.bb recipes were=
=20
created to limit amount of kernel recipes, not to enlarge it.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz


