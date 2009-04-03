Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LpnaL-0003jm-CN
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 19:53:47 +0200
Received: (qmail 22898 invoked by uid 813007); 3 Apr 2009 17:51:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 3 Apr 2009 17:51:12 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Apr 2009 19:51:05 +0200
User-Agent: KMail/1.11.0 (Linux/2.6.29; KDE/4.2.1; x86_64; ; )
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
	<200904021325.22988.marcin@juszkiewicz.com.pl>
	<d2b9ea600904030918s2f45debak2f76d45022fbe850@mail.gmail.com>
In-Reply-To: <d2b9ea600904030918s2f45debak2f76d45022fbe850@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904031951.12061.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Fri, 03 Apr 2009 17:53:47 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 3 kwietnia 2009 o 18:18:49 Esben Haabendal napisa=B3(a):
> > No, but we require minimal versions of BitBake to be used with OE
> > metadata so I prefer to have version which is granted to work.
> > Imagine situation when OE.dev will require BitBake 1.8.22 which
> > will not work with 'stable/2009' branch.

> I fully understand the situation, but I am just wondering if we
> shouldn't be paying more attention to this problem.
>
> For the stable branches I need to maintain, I have had to make a
> solution control which version of bitbake is used with each branch.
> Maybe it would be worth to try work out a more general version of
> such a solutin.
>
> But, I think it would be great if we "encode" into the OpenEmbedded
> metadata which version of bitbake is recommended, and maybe even
> which versions work and which is not expected to work. It could be
> something as simple as adding a ".bitbake" to the top of the
> metadata which contains a single line in the style of
> "tags/bitbake-1.8.10", which would then make it possible for
> people to know which version to use, and even automate
> this in their setups.
>
> We could then also make bitbake aware of this file, and then print
> out a warning if a "wrong" version is used.
>
> I am sure I am not the only one who have had to debug strange
> problems before finding out that it would just be easier to go back
> to an older bitbake version...
>
> It is not that it is a big problem to import BitBake into
> OpenEmbedded, although it generally is not the best solution to many
> things, as it makes it a bit painful to propagate eventual critical
> fixes to all the places where it is needed, but I just think that
> this is an important issue that is worth to find a proper solution
> for.

sanity.conf sets one variable: BB_MIN_VERSION =3D "1.8.12" and this is=20
checked on start of each build. We bump that only when BitBake is=20
released and if change is really required.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




