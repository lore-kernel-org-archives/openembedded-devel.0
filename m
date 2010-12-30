Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYNCR-0006vw-OA for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 19:26:07 +0100
Received: from f053036091.adsl.alicedsl.de ([78.53.36.91]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYNCC-0008NA-MX for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 18:25:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D1C6256.6030100@eukrea.com>
References: <1293699334-4159-1-git-send-email-eric@eukrea.com>
	<1293704431.5436.5.camel@mattotaupa>  <4D1C6256.6030100@eukrea.com>
Date: Thu, 30 Dec 2010 19:25:51 +0100
Message-ID: <1293733551.5436.83.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [RFC] dealing with hard coded `libtool` in `Makefile.*` (was: [PATCH] gnome-power-manager: fix compilation)
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
X-List-Received-Date: Thu, 30 Dec 2010 18:26:07 -0000
X-Groupsio-MsgNum: 27586
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DNxpzuLxh62jeGGjp50c"

--=-DNxpzuLxh62jeGGjp50c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,


Am Donnerstag, den 30.12.2010, 11:43 +0100 schrieb Eric B=C3=A9nard:

> On 30/12/2010 11:20, Paul Menzel wrote:
> > Am Donnerstag, den 30.12.2010, 09:55 +0100 schrieb Eric B=C3=A9nard:
> >
> > I would prefer if the error message `libtool: Command not found` (if it
> > is that short) is noted in the commit summary.
> >
> > 	gnome-power-manager: fix compilation: `libtool: Command not found`
>
> OK fixed and pushed.

great! This is ae6002 [1].

> >> * libtool is hardcoded in src/Makefile and leads to
> >> libtool: Command not found
> >>
> >> Signed-off-by: Eric B=C3=A9nard<eric@eukrea.com>
> >> ---
> >>   recipes/gnome/gnome-power-manager_2.30.0.bb |    1 +
> >>   1 files changed, 1 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/recipes/gnome/gnome-power-manager_2.30.0.bb b/recipes/gno=
me/gnome-power-manager_2.30.0.bb
> >> index a752852..0c7bcb5 100644
> >> --- a/recipes/gnome/gnome-power-manager_2.30.0.bb
> >> +++ b/recipes/gnome/gnome-power-manager_2.30.0.bb
> >> @@ -27,6 +27,7 @@ do_configure_append() {
> >>           for i in $(find ${S} -name "Makefile") ; do
> >>               sed -i -e s:-Werror::g $i
> >>           done
> >> +		sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${S}/src/Makefil=
e
> >>   }
> >>
> >>   PACKAGES =3D+ "${PN}-applets"
> >
> > Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
> >
> > What is the proper patch to send upstream? Is `${TARGET_SYS}` always
> > defined? But =C2=BB-=C2=AB would still make problems, wouldn=E2=80=99t =
it? Is there a
> > program implementing this correctly in `Makefile`?
> >
> - TARGET_SYS is OE specific.
> - The "--" is here to only replace the 2 or 3 instances of libtool concer=
ned=20
> by the workaround.

I meant the `-` in `${TARGET_SYS}-libtool`, so if `${TARGET_SYS}` would
be empty than `-libtool` is not usable.

> - I don't know what would be the proper patch to send upstream (and don't=
 have=20
> time to check for this now). I've just seen there are several new release=
 of=20
> gnome-power-manager so the problem may already be fixed, will see when I =
have=20
> some time.

Well as you wrote it is hard coded twice `src/Makefile.am`, also in
2.32.0. But I cannot find it in the current in master branch. It was
removed in commit 756876 [2]. But I guess this will not be compatible
with the current GNOME stuff in OE and is for the migration to GNOME 3.
But I have no idea.

`system-tools-backend_2.10.1.bb` also has to deal with hard coded
`libtool` and just copies it over [3].

        do_configure() {
        	sed -i -e 's:CC=3D$(CC):CC=3D"$(CC)":g' ${S}/Net-DBus/Makefile.am
        	sed -i -e 's:CC=3D$(CC):CC=3D"$(CC)":g' ${S}/Net-DBus/Makefile.in
        	libtoolize --force --install
        	aclocal
        	gnu-configize
        	oe_runconf
        	cp ${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool ${S}
        }

To summarize, it is not useful to prepare a patch for upstream inclusion
since there will not be a 2.34 or 2.32.x release, I guess.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dae60020=
2dbf68be4cc7515b877ef143c1f5f8c31
[2] http://git.gnome.org/browse/gnome-power-manager/commit/?id=3D7568769fb1=
e46de1b8ed8601fe106df9b367bb45
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/gnome/s=
ystem-tools-backends_2.10.1.bb?id=3D8d914cdf124e940b7a06ad3343077b68e01e601=
9

--=-DNxpzuLxh62jeGGjp50c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0czq8ACgkQPX1aK2wOHVjJLQCdG8VBMra8NiswpOViqUHSQRrK
OxEAn3l9C7FhzYEyEG/H+WXFGXGaEJ0x
=GkTE
-----END PGP SIGNATURE-----

--=-DNxpzuLxh62jeGGjp50c--
