Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QaEBE-00054x-Iz for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 23:44:48 +0200
Received: from f053043042.adsl.alicedsl.de ([78.53.43.42]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QaE7z-0002nd-39; Fri, 24 Jun 2011 21:41:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jun 2011 23:41:11 +0200
Message-ID: <1308951671.6255.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	Klaus Kurzmann <mok@fluxnetz.de>
Subject: libgisi: task compile fails with `posix-ext.vapi:7.5-7.30: error: `Posix' already contains a definition for `INET_ADDRSTRLEN'`
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
X-List-Received-Date: Fri, 24 Jun 2011 21:44:48 -0000
X-Groupsio-MsgNum: 32828
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LHNObAzlkjmZQx1kgaWx"

--=-LHNObAzlkjmZQx1kgaWx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task compile of libgisi c993ee694ea98597d619a1ffae397d3416233354 fails
with the following error using `minimal` for `MACHINE =3D "beagleboard"`.


        /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin/va=
lac -C --basedir .. --vapidir ../data --vapidir ../vapi --pkg glib-2.0 --pk=
g gio-2.0 --pkg libgisi --pkg posix --pkg posix-ext --header gisicomm.h --l=
ibrary gisicomm-0.0 gisicomm.vala
        posix-ext.vapi:7.5-7.30: error: `Posix' already contains a definiti=
on for `INET_ADDRSTRLEN'
            const int INET_ADDRSTRLEN;
            ^^^^^^^^^^^^^^^^^^^^^^^^^^
        posix.vapi:476.2-476.34: note: previous definition of `INET_ADDRSTR=
LEN' was here
                public const int INET_ADDRSTRLEN;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        posix-ext.vapi:8.5-8.31: error: `Posix' already contains a definiti=
on for `INET6_ADDRSTRLEN'
            const int INET6_ADDRSTRLEN;
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
        posix.vapi:478.2-478.35: note: previous definition of `INET6_ADDRST=
RLEN' was here
                public const int INET6_ADDRSTRLEN;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        posix-ext.vapi:4.2-4.25: error: `Posix' already contains a definiti=
on for `inet_ntop'
                unowned string inet_ntop (int af, void* src, uint8[] dst);
                ^^^^^^^^^^^^^^^^^^^^^^^^
        posix.vapi:485.2-485.25: note: previous definition of `inet_ntop' w=
as here
                unowned string inet_ntop (int af, void* src, uint8[] dst);
                ^^^^^^^^^^^^^^^^^^^^^^^^
        Compilation failed: 3 error(s), 0 warning(s)

Please forward that to the appropriate people.


Thanks,

Paul

--=-LHNObAzlkjmZQx1kgaWx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4FBHcACgkQPX1aK2wOHVh17wCfdlDv+REPMy/zhodEsCc4Chd6
YI8An1vBGkcXiI7vk1cMgmT2E916TLhL
=LRdW
-----END PGP SIGNATURE-----

--=-LHNObAzlkjmZQx1kgaWx--
