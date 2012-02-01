Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RshDf-0005dI-N5 for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 21:55:55 +0100
Received: from f053046240.adsl.alicedsl.de ([78.53.46.240]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rsh68-0002hQ-GS for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 20:48:08 +0000
Message-ID: <1328129225.14469.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 01 Feb 2012 21:47:05 +0100
In-Reply-To: <4F298E4B.3060706@gmail.com>
References: <1328039657-3070-1-git-send-email-tworaz666@gmail.com>
	<1328087681.4185.3.camel@mattotaupa> <4F298E4B.3060706@gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [meta-xfce][PATCH v2] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Wed, 01 Feb 2012 20:55:55 -0000
X-Groupsio-MsgNum: 36831
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-LHTnvvRl3T/cAdQGvzgb"

--=-LHTnvvRl3T/cAdQGvzgb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 01.02.2012, 20:11 +0100 schrieb Peter Tworek:
> On 02/01/2012 10:14 AM, Paul Menzel wrote:

> > Am Dienstag, den 31.01.2012, 20:54 +0100 schrieb Peter Tworek:
> >
> > Please remember that the commit summary follows a certain pattern [1].
> >
> > xarchiver: Add 0.5.2 (initial recipe)
> Thanks for the tip, I didn't know about that.
> >
> >> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
> >> ---
> >>   .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |   16 ++++++++++=
++++++
> >>   1 files changed, 16 insertions(+), 0 deletions(-)
> >>   create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.=
bb
> >>
> >> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/met=
a-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> >> new file mode 100644
> >> index 0000000..66e9273
> >> --- /dev/null
> >> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> >> @@ -0,0 +1,16 @@
> >> +DESCRIPTION =3D "Lightweight, desktop independent GTK+ archive manage=
r"
> >> +HOMEPAGE =3D "http://xarchiver.sourceforge.net"
> > Does a =C2=BB/=C2=AB need to be added at the end?
> I'm not sure I follow. What do you mean by =C2=BB/?

I am not sure if a slash is required for a valid URL.

    HOMEPAGE =3D "http://xarchiver.sourceforge.net/"

Please note the added slash / at the end.

> >> +SECTION =3D "x11"
> >> +
> >> +LICENSE =3D "GPLv2"
> > Looking at the FAQ Xarchive is distributed under GPLv2+ [2].
> I wasn't aware that GPLv2+ is a valid license value. Thanks I'll fix it=
=20
> in v3.
>=20
> >
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f"
> >> +
> >> +DEPENDS =3D "gtk+ glib-2.0 xfce4-dev-tools-native"
> >> +
> >> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
> >> +SRC_URI[md5sum] =3D "2bc7f06403cc6582dd4a8029ec9d038d"
> >> +SRC_URI[sha256sum] =3D "cea932ff9d505969201fd502470bbebbc5726ab3d6765=
e142fc8295aa677ad2a"
> >> +
> >> +inherit gettext pkgconfig autotools gtk-icon-cache
> >> +
> >> +RRECOMMENDS_${PN} =3D "lzop zip tar"
> > With these changes this patch is
> >
> > Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>


Thanks,

Paul


> > [1] http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > [2] http://xarchiver.sourceforge.net/doc/ch01s03.html

--=-LHTnvvRl3T/cAdQGvzgb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8ppMkACgkQPX1aK2wOHVhhWgCffr9wLm5ax4oOxBTBzAqi1sfl
QIgAoIxaoTRuiYhhRo9ZujcBVWeF8o42
=+rTs
-----END PGP SIGNATURE-----

--=-LHTnvvRl3T/cAdQGvzgb--
