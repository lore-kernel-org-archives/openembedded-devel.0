Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoZhA-0003SM-RR for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 12:28:36 +0200
Received: from f053041083.adsl.alicedsl.de ([78.53.41.83]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoZgl-00006V-F3 for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 10:28:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinxVh9JCQnQpSxV_rr74truVwBeQ3e+=nc1Yf=s@mail.gmail.com>
References: <1282754957-7589-1-git-send-email-norguhtar@gmail.com>
	<1282775656.3711.22.camel@mattotaupa>
	<AANLkTi=gHjEM7eFzNEsZOq9b3y9X06NRq4amF9h0_yhG@mail.gmail.com>
	<1282812356.3726.33.camel@mattotaupa>
	<AANLkTinxVh9JCQnQpSxV_rr74truVwBeQ3e+=nc1Yf=s@mail.gmail.com>
Date: Thu, 26 Aug 2010 12:28:05 +0200
Message-ID: <1282818485.3726.52.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] upstart: fix sysvinit compat
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
X-List-Received-Date: Thu, 26 Aug 2010 10:28:39 -0000
X-Groupsio-MsgNum: 22672
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xzpdKpD73tSpOPUNoZM9"

--=-xzpdKpD73tSpOPUNoZM9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Please do not include =C2=BB>=C2=AB in front of your *latest* answers.]


Am Donnerstag, den 26.08.2010, 16:07 +0600 schrieb Anatoly Shipitsin:
> On Thu, Aug 26, 2010 at 14:45, Paul Menzel <paulepanter@users.sourceforge=
.net> wrote:
> >
> > I mean, did you write the those rc, rcS and rcS-default scripts
> > yourself? (Probably not judging from the copyright in the header.) So
> > where did you those from? From another distribution? Are they included
> > somewhere?
> >
> > I'm get it from sysvinit recipe

Maybe add a note to the commit message then.

[=E2=80=A6]

> > Just to be clear that a meant the following line.
> >
> > > +EXTRA_OEMAKE +=3D "'bindir=3D${base_bindir}' \
> > > +              'sbindir=3D${base_sbindir}' \
> > > +              'usrbindir=3D${bindir}' \
> > > +              'usrsbindir=3D${sbindir}' \
> > > +              'includedir=3D${includedir}' \
> > > +              'mandir=3D${mandir}'"
> >
> > > Automatically  upstart installed in /usr but for simple and right
> > > switching with update-alternatives
> > > it's move to root.
> >
> > Sorry, I do not understand. What is =C2=BBroot=C2=AB? If it is =C2=BB/=
=C2=AB I do not see in
> > which line it is used.
> >
> > yes to /

Can you give me the line where it is installed to /. Is not always a
subdirectory of / used?

> > > I'm got this additional parameters from sysvinit.
> >
> > Are you referring to those two?
> >
> > > +USE_VT ?=3D "1"
> > > +SYSVINIT_ENABLED_GETTYS ?=3D "1"
> >
> > But why don=E2=80=99t you add them to `recipes/upstart/upstart_0.3.8.bb=
`. You
> > could add them to the inc file then.
>
> I'm forgot about this. But now i'm try build upstart_0.3.8.bb and this no=
t
> buildable.

Can you find out if this version is pinned by any distribution in OE?

    $ git grep "0\.3\.8"

did not return anything for me regarding Upstart as far as I could see.

Maybe send a patch removing 0.3.8 first with =C2=BBupstart: remove 0.3.8 b/=
c
not buildable=C2=AB as the commit summary and the failure in the commit
message. That would be great.


Thanks,

Paul

--=-xzpdKpD73tSpOPUNoZM9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx2QbQACgkQPX1aK2wOHVjX7ACfRy+olOjCuOp3gB1ZbvrMEkXS
WhMAn3J9l3fRzkrKhCg3DTr2Zoq0JWoa
=Nwo4
-----END PGP SIGNATURE-----

--=-xzpdKpD73tSpOPUNoZM9--
