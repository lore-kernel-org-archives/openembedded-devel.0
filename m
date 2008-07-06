Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KFVsm-0004cs-7m
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jul 2008 17:10:36 +0200
Received: (qmail invoked by alias); 06 Jul 2008 15:06:37 -0000
Received: from e178083251.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.83.251]
	by mail.gmx.net (mp023) with SMTP; 06 Jul 2008 17:06:37 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/6yl49QPf6YogUENe9noWAfEbYIe3kSoBHzsOq4m
	9+Ygo0GnuegCGi
Message-ID: <4870DF7B.2050603@gmx.net>
Date: Sun, 06 Jul 2008 17:06:35 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.62
Subject: libtool issues with angstrom and classpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 06 Jul 2008 15:10:57 -0000
X-Groupsio-MsgNum: 5476
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig32C4D3A2B2778537C90E1353"

--------------enig32C4D3A2B2778537C90E1353
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi,
koen already told me that there will be libtool problems when building
classpath in angstrom 2008.1.

what I get are the following error messages:

i686-linux-libtool: link: unsupported hardcode properties
i686-linux-libtool: link: See the libtool documentation for more
information.
i686-linux-libtool: link: Fatal configuration error.

Caused by the following command:

make[3]: Entering directory
`/home/rob/oe/beagle/tmp/work/i686-linux/classpath-initial-0.93-r1/classp=
ath-0.93/native/jni/java-net'
/bin/sh ../../../i686-linux-libtool --tag=3DCC   --mode=3Dlink ccache gcc=
 -W
-Wall -Wmissing-declarations -Wwrite-strings -Wmissing-prototypes
-Wno-long-long -Wstrict-prototypes -pedantic -Werror
-isystem/home/rob/oe/beagle/tmp/staging/i686-linux/usr/include -Os
-module -version-info 0:0:0 -no-undefined
-L/home/rob/oe/beagle/tmp/staging/i686-linux/usr/lib
-Wl,-rpath-link,/home/rob/oe/beagle/tmp/staging/i686-linux/usr/lib
-Wl,-rpath,/home/rob/oe/beagle/tmp/staging/i686-linux/usr/lib -Wl,-O1 -o
libjavanet.la -rpath
/home/rob/oe/beagle/tmp/staging/i686-linux/usr/lib/classpath-initial
javanet.lo java_net_VMInetAddress.lo java_net_VMNetworkInterface.lo
java_net_VMURLConnection.lo gnu_java_net_VMPlainSocketImpl.lo
gnu_java_net_local_LocalSocketImpl.lo
=2E./../../native/jni/classpath/jcl.lo
=2E./../../native/jni/native-lib/libclasspathnative.la -lmagic

I debugged this problem to the point where I found out that it does not
like the '-lmagic'. If I remove that from the makefile the build
continues. However this cannot be the real fix.

What is wrong here and how should I fix it?

What other program that uses libtool and links to an external library
can I look at and study their autotools files?

Regards
Robert



--------------enig32C4D3A2B2778537C90E1353
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIcN97G9cfwmwwEtoRCMkPAJ9KYbhKrKmKfjoWJuQhdTb8RCuL5QCgi62J
S09ErShTndU4qBpIqT0p61I=
=89jm
-----END PGP SIGNATURE-----

--------------enig32C4D3A2B2778537C90E1353--
