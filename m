Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0WSi-0000bz-D8 for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 11:27:02 +0200
Received: from f053043200.adsl.alicedsl.de ([78.53.43.200]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0WSZ-0002NF-AU for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 09:26:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CA1B071.3000908@dresearch.de>
References: <1285660172.4168.10.camel@mattotaupa>
	<1285661564-1308-1-git-send-email-t.fromm@dresearch.de>
	<1285662820.4168.24.camel@mattotaupa> <4CA1B071.3000908@dresearch.de>
Date: Tue, 28 Sep 2010 11:26:49 +0200
Message-ID: <1285666009.4168.28.camel@mattotaupa>
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
Subject: Re: [v2] wvstreams-4.6: Remove dbus support because it breaks the build
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
X-List-Received-Date: Tue, 28 Sep 2010 09:27:02 -0000
X-Groupsio-MsgNum: 24091
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PWDwM/lxJSlS2sm4Zcu6"

--=-PWDwM/lxJSlS2sm4Zcu6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Thilo,


Am Dienstag, den 28.09.2010, 11:08 +0200 schrieb Thilo Fromm:

> > Do you know, if and how =C2=BBPATCH=C2=AB got stripped in the subject? =
Without it,
> > Patchwork will not pick it up, I think.
>=20
> It got stripped because of your recommendation to use=20
> --subject-prefix=3D"v2". The "How to submit a patch to OpenEmbedded" wiki=
=20
> page at=20
> <http://wiki.openembedded.net/index.php/How_to_submit_a_patch_to_OpenEmbe=
dded#Create_and_Commit_your_patch>=20
> recommends the same.

I see. Thank you for clarification. I always thought `--subject-prefix`
got added after =C2=BBPATCH=C2=AB.

> Anyway, the patch got picked up by patchwork.

Good. Probably because you replied and it stayed in the thread.

> >> From: t.fromm<t.fromm@ba11ecae-741b-462f-8724-1218f99f5906>
> >
> > Where does that line come from. Did you send this patch from the same
> > system and did you configure git correctly?
> >
> > 	git config user.name Thilo Fromm
> > 	git config user.email t.fromm@dresearch.de
> >
> > It is just a cosmetic error, but this line will be shown in the commit
> > history and used for the weekly changelog generation.
>=20
> I have these two config fields set up exactly like this. Git, however,=
=20
> chooses to generate a mail with two From: header lines.

Strange Maybe you can take a look in `~/.gitconfig` and `.git/config` in
your local repository.

> >> If wvstreams is configured with DBus support enabled (by not providing
> >> --without-dbus) the the build fails at link time as libdbus cannot be
> >> found:
> >>
> >> | ./CXX -c dbus/wvdbusconn
> >> | ./CXX -c dbus/wvdbusmarshal
> >> | ./CXX -c dbus/wvdbusmsg
>=20
> [...]
>=20
> >>
> >> +PR =3D "r2"
> >> +
> >
> > I think `PR` starts at 0 by default.
>=20
> Well, I though this recipe was already *there* before I started, so it's=
=20
> not a "r0". But all right, I'll reset this ro "r0" in [v3].

No I meant you can set it to =C2=BBr1=C2=AB.

> >>   SRC_URI =3D "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.g=
z \
> >>   	"
> >>
> >> @@ -10,7 +12,8 @@ inherit autotools pkgconfig
> >>
> >>   LDFLAGS_append =3D " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}=
/lib"
> >>
> >> -EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam"
> >> +# dbus detection currently broken in configure.ac; remember to add "d=
bus (>=3D 1.2.14)" to DEPENDS  when fixed
> >> +EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without=
-dbus"
> >>
> >>   PACKAGES_prepend =3D "libuniconf libuniconf-dbg "
> >>   PACKAGES_prepend =3D "uniconfd uniconfd-dbg "
> >
> > Just a question. Do you know if the other version of wvstreams suffer
> > from the same problem?
>=20
> Nope, no idea. I am merely trying to get one single build from start to=
=20
> finish, but OpenEmbeddded keeps breaking all the time. I've been doing=
=20
> this for about a week now without success.
>=20
> Given the current (in)stability of the build framework I think I'm far,=
=20
> far away from a system state reliable enough to even think about the=20
> cross-versioning build tests you're suggesting.

Good luck with your builds and thank you for your contribution.


Thanks,

Paul

--=-PWDwM/lxJSlS2sm4Zcu6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyhtNkACgkQPX1aK2wOHVhQOwCeKHR9BUdns/a4DK0prx9NkEia
tkoAnRbmKnbgjIwqX4Xm3LTbO67XEg7w
=4cfY
-----END PGP SIGNATURE-----

--=-PWDwM/lxJSlS2sm4Zcu6--
