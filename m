Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1FiD-0006Ls-IM for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 11:46:02 +0200
Received: from f053042246.adsl.alicedsl.de ([78.53.42.246]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1Fi2-0002Wt-Ej for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 09:45:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimvzxaKE3d=oEYAA7BnX3XZLb9btL36qJ2Bhxwn@mail.gmail.com>
References: <1285792798-6529-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1285796123.27605.4.camel@mattotaupa>
	<AANLkTimvzxaKE3d=oEYAA7BnX3XZLb9btL36qJ2Bhxwn@mail.gmail.com>
Date: Thu, 30 Sep 2010 11:45:49 +0200
Message-ID: <1285839949.3805.64.camel@mattotaupa>
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
Subject: Re: [PATCH] kernel.bbclass: avoid NOTE messages for files that are staged but not packaged
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
X-List-Received-Date: Thu, 30 Sep 2010 09:46:02 -0000
X-Groupsio-MsgNum: 24208
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Y1vpxwxv3dg0Kw/If2Hx"

--=-Y1vpxwxv3dg0Kw/If2Hx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.09.2010, 08:30 +0200 schrieb Frans Meulenbroeks:
> 2010/9/29 Paul Menzel <paulepanter@users.sourceforge.net>:

> > Am Mittwoch, den 29.09.2010, 22:39 +0200 schrieb Frans Meulenbroeks:
> >> copy the files directly from the work area to staging. That way
> >> there are no unpackaged files in image/ so no NOTE messages.
> >> Additional advantage is that it is faster as we save the copy to the i=
mage dir.
> >>
> >> See also http://thread.gmane.org/gmane.comp.handhelds.openembedded/374=
87
> >>
> >> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> >> Acked-by: Roman I Khimov <khimov@altell.ru>
> >> Tested-by: Petr ?tetiar <ynezz@true.cz>
> >> Acked-by: Eric B?nard <eric@eukrea.com>
> >
> > please fix the special characters when you commit this.
>=20
> Will do, I have just cut'n'pasted the lines. but I agree I was lazy
> and it was better to fix this.
>
> > I tried to apply your patch using `pwam.sh 3097` and saw that you
> > already accidentally had commited this patch in
> > 9a5382aad4e5a3e52fa52722cf5587fdba958e9f [1].
> >
> >        wpa-supplicant : moved unused files to obsolete dir
> >
> > Please revert that commit and commit appropriately.
>=20
> Thanks for spotting this. I have already reverted the commit.

Thank you! The commit ID 285f58b3a48df7c4891afd02c7d9ca041675b41d [2].

> Will make a new patch for it.
> Guess this accidently got picked up by the wpa-supplicant commit and
> went unnoticed.
> I'll try to take some more care next time.
> apologies for any inconvenience.

No apologies needed. It is good to see that you professionals are human
nonetheless.

On the positive side I could still build test the kernel.bbclass change
and it worked for me.

Tested-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D285f58b=
3a48df7c4891afd02c7d9ca041675b41d

--=-Y1vpxwxv3dg0Kw/If2Hx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykXE0ACgkQPX1aK2wOHVhgSACgh8WuLB/BHClD+TXYE/ttupQ7
2+QAn1Use1ixqUNASaU98Ezxv0K6NODh
=L4TS
-----END PGP SIGNATURE-----

--=-Y1vpxwxv3dg0Kw/If2Hx--
