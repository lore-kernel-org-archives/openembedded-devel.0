Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QwVx9-0003gs-81 for openembedded-devel@lists.openembedded.org;
	Thu, 25 Aug 2011 11:10:23 +0200
Received: from f053043048.adsl.alicedsl.de ([78.53.43.48]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QwVsf-00024S-8k for openembedded-devel@lists.openembedded.org;
	Thu, 25 Aug 2011 09:05:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Aug 2011 11:05:30 +0200
In-Reply-To: <4E55A72B.7070008@balister.org>
References: <4E554AD9.90607@balister.org>
	<20110824194923.GC4258@rhein.zuhause.netz>
	<4E55A72B.7070008@balister.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314263137.4186.4.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: Build failure for openjade in dev: `libtool: link: cannot find the library `=/usr/lib/libstdc++.la'`
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
X-List-Received-Date: Thu, 25 Aug 2011 09:10:23 -0000
X-Groupsio-MsgNum: 33829
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-p7BbDOcRxcUl6HrxuTTS"

--=-p7BbDOcRxcUl6HrxuTTS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 24.08.2011, 18:36 -0700 schrieb Philip Balister:
> On 08/24/2011 12:49 PM, Henning Heinold wrote:
> > On Wed, Aug 24, 2011 at 12:02:49PM -0700, Philip Balister wrote:
> >> I am seeing this building openjade. As near as I can see, there
> >> haven't been any changes to cause this. It does build in
> >> release-2011.3-maintenance.
> >>
> >> Anyone have any clues?
> >>
> >> Philip
> >> | + install-catalog --add /home/balister/oe/tmp/sysroots/x86_64-linux/=
etc/sgml/openjade-1.3.2.cat /home/balister/oe/tmp/sysroots/x86_64-linux/usr=
/share/sgml/openjade-1.3.2/catalog
> >> | install-catalog: unable to write in /etc/sgml.
> >
> > hm maybee you need to traint install-catalog not to write at /etc/sgml
>=20
> It's beginning to look like bitbake master does not work with dev. Back=
=20
> on 1.12.0 bitbake and things seem sane again.

Well, it still fails for me. What build configuration do you use? I
tested `angstrom-2010.x`, `minimal{,-uclibc}` for `MACHINE =3D
"beagleboard"`. (Please always add that to the commit message.)

        mkdir .libs
        libtool: link: warning: library `/oe/build-minimal-eglibc/minimal-d=
ev/sysroots/armv7a-oe-linux-gnueabi/usr/lib/libosp.la' was moved.
        libtool: link: warning: library `/oe/build-minimal-eglibc/minimal-d=
ev/sysroots/armv7a-oe-linux-gnueabi/usr/lib/libosp.la' was moved.
        libtool: link: cannot find the library `=3D/usr/lib/libstdc++.la'
        make[2]: *** [openjade] Error 1



Thanks,

Paul

--=-p7BbDOcRxcUl6HrxuTTS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5WEFoACgkQPX1aK2wOHVj8hACePFdsEo2eg7Ddtb5Oov+BU4pq
+74An3pRziURqngKKObMdprGVQ0Neqio
=lHPg
-----END PGP SIGNATURE-----

--=-p7BbDOcRxcUl6HrxuTTS--
