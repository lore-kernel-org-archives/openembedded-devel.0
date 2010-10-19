Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P89CI-0005FG-Ji for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 12:13:35 +0200
Received: from f053043130.adsl.alicedsl.de ([78.53.43.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P89Bm-0003fT-DK for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:13:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimti+Lv7xzDUrq8MppJdkru3pZgLi3CmMvEwop1@mail.gmail.com>
References: <1287444108.3927.82.camel@mattotaupa>
	<AANLkTimti+Lv7xzDUrq8MppJdkru3pZgLi3CmMvEwop1@mail.gmail.com>
Date: Tue, 19 Oct 2010 12:13:00 +0200
Message-ID: <1287483180.4030.30.camel@mattotaupa>
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
Subject: Re: openldap_2.4.23: `do_configure` fails with `cp: cannot stat `/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/share/libtool/ltmain.sh': No such file or directory`
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
X-List-Received-Date: Tue, 19 Oct 2010 10:13:35 -0000
X-Groupsio-MsgNum: 25122
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-EkrRd+LLg3MPoxXWCSF8"

--=-EkrRd+LLg3MPoxXWCSF8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 18.10.2010, 16:36 -0700 schrieb Khem Raj:
> On Mon, Oct 18, 2010 at 4:21 PM, Paul Menzel wrote:

> > trying to build OpenLDAP to test 980a1e [1], task `do_configure` of
> > `opldap_2.4.23.bb` [2] fails with the following error with `minimal`
> > (eglibc) and `angstrom-2008.1` for `MACHINE =3D "beagleboard"`.
> >
> >        [=E2=80=A6]
> >        Log data follows:
> >        | cp: cannot stat `/oe/build-minimal-eglibc/minimal-dev/sysroots=
/armv7a-oe-linux-gnueabi/usr/share/libtool/ltmain.sh': No such file or dire=
ctory
> >        | ERROR: Function do_configure failed
> >        NOTE: package openldap-2.4.23-r2: task do_configure: Failed
> >        ERROR: TaskFailed event exception, aborting
> >        ERROR: Build of /oe/openembedded/recipes/openldap/openldap_2.4.2=
3.bb do_configure failed
> >        ERROR: Task 11 (/oe/openembedded/recipes/openldap/openldap_2.4.2=
3.bb, do_configure) failed with 256
>=20
> can you search where ltmain.sh exist in your target staging ?

Ah right. I should have provided that information in the first place.

> find /oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueab=
i -name "ltmain.sh"

        /oe/build-minimal-libc$ find minimal-dev/sysroots/armv7a-oe-linux-g=
nueabi/ -name "ltmain.sh"
        minimal-dev/sysroots/armv7a-oe-linux-gnueabi/oe/build-minimal-libc/=
minimal-dev/sysroots/i686-linux/usr/share/libtool/ltmain.sh
        minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/share/doc/gettext/=
examples/hello-c++-kde/admin/ltmain.sh

Did something go wrong during staging of `ltmain.sh`?


Thanks,

Paul


> > [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D980=
a1ea8d5bbe2c0c6e4b8f79883b0f294de979b
> > [2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/ope=
nldap/openldap_2.4.23.bb?id=3D980a1ea8d5bbe2c0c6e4b8f79883b0f294de979b

--=-EkrRd+LLg3MPoxXWCSF8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky9bycACgkQPX1aK2wOHVjMgQCdFZsiErLnhb9uOn1n/Eyrnxlx
rlUAnRGtxFiz7Nj36W37S7LE13aXh6dM
=cA1z
-----END PGP SIGNATURE-----

--=-EkrRd+LLg3MPoxXWCSF8--
