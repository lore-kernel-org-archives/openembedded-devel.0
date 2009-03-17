Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Ljb9f-00071A-2H
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 16:24:56 +0100
Received: (qmail 6572 invoked by uid 813007); 17 Mar 2009 15:23:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Mar 2009 15:23:49 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Mar 2009 16:23:50 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81-dirty; KDE/4.2.1;
	x86_64; ; )
References: <200903171538.21499.marcin@juszkiewicz.com.pl>
	<gpodc3$nos$1@ger.gmane.org>
In-Reply-To: <gpodc3$nos$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200903171623.51062.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 15:25:00 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 17 marca 2009 o 15:50:43 Koen Kooi napisa=C5=82(a):
> On 17-03-09 15:38, Marcin Juszkiewicz wrote:
> > Which things needs defining? I have few in mind:
> >
> > 1. Adding new things. This should be possible only by backporting
> > from OE.dev tree and needs to be Acked by at least 2-3 developers
> > which use stable branch. New code has to build for at least one
> > distro and ARM+x86 architectures (unless it is related to one arch
> > or even one machine).
>
> So things must get tested before committing, right?

Yes. If change which was tested only on ARM I can run test for x86 but=20
this will enlarge review time.

> > 2. Marking recipes as buildable or not. With over 6000 of them it
> > is really hard to check everything for status. We can remove many
> > old versions but sometimes they are useful for some projects. I
> > would rather add things like BUILDABLE_armv4t =3D "1" into recipe or
> > into conf/distro/include/${DISTRO}-status.inc file. Similar status
> > for recipes which are known to not work for some archs.
>
> Just have a CSV file that includes the test coverage for package +
> machines. We can have one per distro. If needed we can extract the
> info from tinderbox after we've done a few builds.

The CSV file is ok for me too - small script added into contrib/ would=20
show this data in more handy way.

> > 3. Dealing with non buildable stuff. We have 'nonworking' and
> > 'obsolete' dirs in metadata - both should be dropped in stable
> > branch. Other recipes can be marked as not buildable or dropped
> > from branch - I did not thought yet on it.
>
> That does mean you can't easily resurrect recipes, but seeing that
> only happens once every 5 years or so..

"All changes has to exists in .dev tree" so if someone will fix broken=20
recipe then change will land in .dev first probably... Unless there is=20
no same version in .dev anymore.

> > 4. Lifetime of branch. Will we do new stable release after 6 months
> > or after one year? For how long stable branch will be supported by
> > OE itself? I know that there will be companies which will provide
> > support for longer time - thats what I do with Poky 'pinky' now.
>
> The previous branch had a 12 + 3 month lifecycle, 12 months of
> support then 3 months to wind down.

1 year sounds good. Poky 'pinky' is about 1 year old and still usable.

> I certainly want to join the effort, but I fear that creating a
> stable branch might make some people more inclined to dump even worse
> crap in .dev, which would not be a good thing. So *if* we go with a
> stable branch we should make sure .dev well be in a good shape as
> well.

There always will be good and bad things with .dev branch. We can look=20
to adapt some rules from stable to .dev later. Larger changes can go=20
through separate branches.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




