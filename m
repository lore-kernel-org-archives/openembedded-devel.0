Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P14n5-0002bH-At for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 00:06:20 +0200
Received: from g225082119.adsl.alicedsl.de ([92.225.82.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P14mu-0007qQ-Lw for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:06:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CA35BB7.2000505@dresearch.de>
References: <4CA0B4FF.3050601@dresearch.de>
	<1285601000-28294-1-git-send-email-t.fromm@dresearch.de>
	<1285765693.4578.14.camel@mattotaupa> <4CA35BB7.2000505@dresearch.de>
Date: Thu, 30 Sep 2010 00:06:07 +0200
Message-ID: <1285797967.27605.18.camel@mattotaupa>
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
Subject: Re: [PATCH] Add falloc.h to the exported kernel header files.
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
X-List-Received-Date: Wed, 29 Sep 2010 22:06:20 -0000
X-Groupsio-MsgNum: 24192
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WiOrsnTkazULZKY9E7FS"

--=-WiOrsnTkazULZKY9E7FS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Thilo,


Am Mittwoch, den 29.09.2010, 17:31 +0200 schrieb Thilo Fromm:

[=E2=80=A6]

> >> This adds include/linux/falloc.h to the list of files
> >> exported by the kernel to the C library.
> >> The include file is required for building e.g. a recent util-linux-ng
> >> against 2.6.24.
> >
> > it looks like the same fix was committed upstream [3] in March 2008 [4]=
.
> > Since the Linux kernel 2.6.24 was released in January 2008 this fixed
> > should be present in all Linux kernels>=3D 2.6.24.
>=20
> It is present in all kernels > 2.6.24. It's actually in the changelog=20
> for 2.6.25:=20
> <http://ftp.halifax.rwth-aachen.de/kernel/linux/kernel/v2.6/ChangeLog-2.6=
.25>=20
> (search the page for "falloc.h").
>=20
> But we're stuck with 2.6.24 :-/
>=20
> > If you sent a patch iteration, please add that information to the commi=
t
> > message.
>=20
> What's a patch iteration?

I am no native speaker, but I mean a revised patch, i. e. PATCH v2.

> >> Signed-off-by: Thilo Fromm<t.fromm@dresearch.de>
> >> ---
> >>   .../linux-libc-headers/files/export_falloc_h.patch |   10 ++++++++++
> >>   .../linux-libc-headers_2.6.24.bb                   |    1 +
> >>   2 files changed, 11 insertions(+), 0 deletions(-)
> >>   create mode 100644 recipes/linux-libc-headers/files/export_falloc_h.=
patch
> >>
> >> diff --git a/recipes/linux-libc-headers/files/export_falloc_h.patch b/=
recipes/linux-libc-headers/files/export_falloc_h.patch
> >> new file mode 100644
> >> index 0000000..5860e88
> >> --- /dev/null
> >> +++ b/recipes/linux-libc-headers/files/export_falloc_h.patch
> >
> > Could you please add a patch header as suggested in [2].
>=20
> I suppose you're referring to a line like
>=20
> upstream: OE-only
>=20
> ? As this patch is not supposed to go upstream (because it's already=20
> there) - do you think this is still necessary?

I looked at your revised patch (v2). This information is not for the
commit message but should be placed at the beginning of the patch file
`files/export_falloc_h.patch` [1]. My suggestion is the following.

        upstream: http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linu=
x-2.6.git;a=3Dcommit;h=3D040922c04cf2c8ac70be2e88a8a9614ecdb41d2e
        comment: Patch is present in Linux kernel >=3D 2.6.25.

> Otherwise I'd just adjust the patch summary and then resubmit the patch=
=20
> as v2.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/eglibc/=
files/eglibc-dont-cache-slibdir.patch

--=-WiOrsnTkazULZKY9E7FS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyjuE8ACgkQPX1aK2wOHVgjsACaA/LzUoRwqsQV4JfZCJq//wlv
99gAn1TxjI1Y6jM9LekiEyFRmVTfEmXI
=GYsK
-----END PGP SIGNATURE-----

--=-WiOrsnTkazULZKY9E7FS--
