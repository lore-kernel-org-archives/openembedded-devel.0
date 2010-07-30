Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Oem0j-0006ZY-By
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 11:36:15 +0200
Received: (qmail 23021 invoked by uid 813007); 30 Jul 2010 09:35:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 30 Jul 2010 09:35:54 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 11:36:15 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-10-generic; KDE/4.4.92; x86_64; ; )
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<4C5293A0.70802@xora.org.uk>
	<AANLkTi=6zRL-+P-2jZzhgZXoMVSY-XdaBCW=JnNqmJom@mail.gmail.com>
In-Reply-To: <AANLkTi=6zRL-+P-2jZzhgZXoMVSY-XdaBCW=JnNqmJom@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007301136.16075.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Fri, 30 Jul 2010 09:36:16 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 30 lipca 2010 o 11:07:32 Frans Meulenbroeks napisa=C5=82(=
a):
> > More interesting to me would be an algorithm more like.
> >=20
> > while recipe in recips/*.bb; do
> >    rm -rf tmp/ ; bitbake recipe
> > done
> >=20
> > with the test noting if the fail is due to a blacklisted dependency, a
> > totally missing dependency (recipe been deleted sometime in past) or an
> > actual compile fail due to a missing DEPENDS entry somewhere in the tre=
e.
> >=20
> > But this is going to burn CPU time like never before.

> Definitely an interesting test. Actually with packaged staging this might
> become manageble.
> I would not mind running such a test, even if it takes a week or so.

I did such ones for Poky and with packaged staging dir outside of tmpdir it=
=20
works very good. Most of time is spent on removing tmp and repopulating=20
it from packages.
=20
> I guess it is hard to do this for older versions of recipes though.
> afaik bitbake -b will not build things one depends on and bitbake recipe
> will take either the pinned version or otherwise the last one a
> non-negative DEFAULT_PREFERENCE.

"bitbake recipe-version" works but you will need more work to get 'version'=
=20
part as it can contain SRCREV etc.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




