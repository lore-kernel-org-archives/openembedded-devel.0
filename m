Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KHjKn-0001Cq-H0
	for openembedded-devel@openembedded.org; Sat, 12 Jul 2008 19:56:37 +0200
Received: (qmail invoked by alias); 12 Jul 2008 17:56:12 -0000
Received: from e178116136.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.116.136]
	by mail.gmx.net (mp041) with SMTP; 12 Jul 2008 19:56:12 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18+yo9xSxI+AvXfRwCdm6NG0RZW9WQFF07jSOPBNg
	rGcfCMRuXHOwYQ
Message-ID: <4878F04A.6070802@gmx.net>
Date: Sat, 12 Jul 2008 19:56:26 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <484EE136.2050901@buglabs.net>
In-Reply-To: <484EE136.2050901@buglabs.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.63
Cc: openembedded-devel@openembedded.org, Ken Gilmer <ken@buglabs.net>
Subject: Re: Error building classpath-initial
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
X-List-Received-Date: Sat, 12 Jul 2008 17:56:37 -0000
X-Groupsio-MsgNum: 5493
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig17F1F643DB56E5868864449F"

--------------enig17F1F643DB56E5868864449F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Ken,

Ken Gilmer schrieb:
> | /bin/sh ../../../i686-linux-libtool --tag=3DCC   --mode=3Dlink ccache=
 gcc
> -W -Wall -Wmissing-declarations -Wwrite-strings -Wmissing-prototypes
> -Wno-long-long -Wstrict-prototypes -pedantic -Werror
> -isystem/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/inc=
lude
> -Os -module -version-info 0:0:0 -no-undefined
> -L/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/lib
> -Wl,-rpath-link,/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux=
/usr/lib
> -Wl,-rpath,/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/=
lib
> -Wl,-O1 -o libjavanet.la -rpath
> /home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/lib/classpa=
th-initial
> javanet.lo java_net_VMInetAddress.lo java_net_VMNetworkInterface.lo
> java_net_VMURLConnection.lo gnu_java_net_VMPlainSocketImpl.lo
> gnu_java_net_local_LocalSocketImpl.lo
> ../../../native/jni/classpath/jcl.lo
> ../../../native/jni/native-lib/libclasspathnative.la -lmagic
> | i686-linux-libtool: link: unsupported hardcode properties
> | i686-linux-libtool: link: See the libtool documentation for more
> information.
> | i686-linux-libtool: link: Fatal configuration error.
Recently I stepped upon this problem too and began discussing this on
the libtool mailing list. We do not have a concrete solution yet but
there is a workaround for now.

Edit the i686-linux-libtool file in your
/home/kgilmer/dev/sandbox/oe-dev/tmp/work/i686-linux/classpath-initial-0.=
93/classpath-0.93

and set the variable hardcode_direct to no. It should be empty before
and that is causing the problem.

Regards
Robert




--------------enig17F1F643DB56E5868864449F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIePBKG9cfwmwwEtoRCArLAJwIOfsyQti8hn/CKegzvN0m7xGO3wCffte1
/E/xpijz4cI5xoD27jG/3a4=
=CTn3
-----END PGP SIGNATURE-----

--------------enig17F1F643DB56E5868864449F--
