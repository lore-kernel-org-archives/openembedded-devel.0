Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QNpXI-0007d8-0i for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 19:00:20 +0200
Received: from f053038077.adsl.alicedsl.de ([78.53.38.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QNpUc-00078d-Ep for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 16:57:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2011 18:57:22 +0200
Message-ID: <1305997042.12054.71.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: minimal-uclibc: pulseaudio: task compile fails with `./.libs/libpulsecommon-0.9.22.so: undefined reference to `backtrace_symbols'`
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
X-List-Received-Date: Sat, 21 May 2011 17:00:20 -0000
X-Groupsio-MsgNum: 32232
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-imgc2O9VECmVGU4z9VQP"

--=-imgc2O9VECmVGU4z9VQP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


with the latest change for uClibc=20

        commit 2a1c9e1ee5eb8067592d26100b563dd2ae7be00d
        Author: Henning Heinold <heinold@inf.fu-berlin.de>
        Date:   Mon May 2 22:49:36 2011 +0200
       =20
            ulibc: bump git to version 71d63ed75648da9b0b71afabb9c60aaad792=
c55c and add some features
           =20
            * enable backtrace support and put libubacktrace into own packa=
ge, needed by firefox
            * added one patch from Timo Ter=C3=A4s to implement RTLD_NO, ne=
eded by openjdk
            * added one patch from Timo Ter=C3=A4s  implement ORIGIN_PATH, =
needed by openjdk
            * remove fts-support.patch, because is applied upstream
            * bump PR

task compile of `pulseaudio_0.9.22.bb` fails with the following error.

        [=E2=80=A6]
          CCLD   pulseaudio
        ./.libs/libpulsecommon-0.9.22.so: undefined reference to `backtrace=
_symbols'
        ./.libs/libpulsecommon-0.9.22.so: undefined reference to `backtrace=
'
        collect2: ld returned 1 exit status
        make[3]: *** [pulseaudio] Error 1


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D2a1c9e1=
ee5eb8067592d26100b563dd2ae7be00d
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/screen/=
screen-4.0.3/no-stropts.patch

--=-imgc2O9VECmVGU4z9VQP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3X7vIACgkQPX1aK2wOHVjpDQCgi7ilPaCdN0t9ioIMxOR8W04c
45gAnikYrBw/asD7A9kiyUeX6oSL+NDx
=dJYp
-----END PGP SIGNATURE-----

--=-imgc2O9VECmVGU4z9VQP--
