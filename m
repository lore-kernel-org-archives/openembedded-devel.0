Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1KFl-0000PC-Ar for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 16:36:58 +0200
Received: from g225136165.adsl.alicedsl.de ([92.225.136.165]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1KFZ-0001Bx-U3 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 14:36:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CA49A05.9030500@dresearch.de>
References: <1285838213.3805.52.camel@mattotaupa>
	<1285850437-2620-1-git-send-email-t.fromm@dresearch.de>
	<1285852480.3805.79.camel@mattotaupa> <4CA49A05.9030500@dresearch.de>
Date: Thu, 30 Sep 2010 16:36:44 +0200
Message-ID: <1285857404.3805.106.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] linux-libc-headers_2.6.24: Add falloc.h to kernel exported headers
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
X-List-Received-Date: Thu, 30 Sep 2010 14:36:59 -0000
X-Groupsio-MsgNum: 24222
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-T+u7s5ReeyrL+XAxzn9s"

--=-T+u7s5ReeyrL+XAxzn9s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Thilo,


Am Donnerstag, den 30.09.2010, 16:09 +0200 schrieb Thilo Fromm:

> >> This adds include/linux/falloc.h to the list of files exported by the =
kernel to the C library.
> >> The include file is required for building e.g. a recent util-linux-ng =
against 2.6.24.
> >>
> >> Starting from 2.6.25 a similar patch has been accepted upstream (the m=
ainline
> >> kernel). For 2.6.24, however, falloc.h is not exported although it's p=
resent.
> >>
> [...]
> >>   .../linux-libc-headers/files/export_falloc_h.patch |   11 ++++++++++=
+
> >> +++ b/recipes/linux-libc-headers/files/export_falloc_h.patch
> >> @@ -0,0 +1,11 @@
> >> +upstream: OE-only
> >
> > Hmm, do you think it is OE only. As written in my other message I
> > consider this an upstream patch, which has been committed already.
> >
> >          upstream: http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds=
/linux-2.6.git;a=3Dcommit;h=3D040922c04cf2c8ac70be2e88a8a9614ecdb41d2e
> >          comment: Patch is present in Linux kernel>=3D 2.6.25.
>=20
> Technically, this upstreamed patch is not my patch. Upstream is way=20
> older, it's from a different author, etc. Plus it's included in=20
> successive kernel releases, but it's not in the version affected by my=
=20
> patch. From my point of view my patch is an OE-only hack because it=20
> back-ports to an older kernel version a different patch which originated=
=20
> from OE (?) a long time ago and then went mainline.
>=20
> I'll of course change this to your suggestion if this is a problem. I=20
> did not do this yet so my patch won't get confused with the original one=
=20
> that went mainline.

But as far as I can see, both patches do exactly the same thing. I do
not care about the authorship.

My main point is, that if someone is going through the patch files and
wonders, if that patch has to go upstream these comments help a lot.

I am not so long into OE, so others might clarify this.

The following would work too.

	upstream: OE-only
	comment: Same patch is present in Linux kernel =E2=89=A5 2.6.25 and was co=
mmitted in <http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.=
git;a=3Dcommit;h=3D040922c04cf2c8ac70be2e88a8a9614ecdb41d2e>.


Thanks,

Paul

--=-T+u7s5ReeyrL+XAxzn9s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykoHwACgkQPX1aK2wOHViPAwCZASbZTaIT51ZeyomQORpkoomT
T6cAn0mqKMWTL8ZtIwNm1tt779fxQGGb
=hNxm
-----END PGP SIGNATURE-----

--=-T+u7s5ReeyrL+XAxzn9s--
