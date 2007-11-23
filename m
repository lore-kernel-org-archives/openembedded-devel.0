Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1IvZMA-0004Nv-Jt
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2007 15:18:10 +0100
Received: (qmail invoked by alias); 23 Nov 2007 14:15:43 -0000
Received: from e178064220.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.64.220]
	by mail.gmx.net (mp053) with SMTP; 23 Nov 2007 15:15:43 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/cCj5z+vDcPrtlXzwSlYhT4m5/tN8sx1NOoX4N8u
	wGS9h44Z0uO9IC
Message-ID: <4746E08F.3030306@gmx.net>
Date: Fri, 23 Nov 2007 15:15:43 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: bbclass providing some level of scratchbox compatibility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2007 14:18:10 -0000
X-Groupsio-MsgNum: 3426
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig2C157F840DEF2D79DC0894C0"

--------------enig2C157F840DEF2D79DC0894C0
Content-Type: multipart/mixed;
 boundary="------------030207090608070109000309"

--------------030207090608070109000309
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I am using OE to build binaries that can be run from within Maemo
scratchbox.

The binaries I create are for the native architecture (the one of the
host CPU) not the emulated one. Such binaries need a special rpath. What
the bbclass does is simply putting that special rpath in LD_RUN_PATH
before configuring and compiling. This has the effect that all built
binaries have it in.

Together with a halfway compatible toolchain (CS gcc3.4.4, glibc2.3.x)
that allows me to run those binaries in Maemo's scratchbox.

I am using this for Jalimo[0] and would like to push it upstream. I am
open for suggestions.

File a bug?

Regards
Robert

[0] - http://jalimo.org/wiki/doku.php?id=3Ddoc:howto:cacaoandecjinscratchb=
ox
# By adding this class to your build all binaries get the special rpath
# "/scratchbox/host_shared/lib/:/scratchbox/tools/lib/"
# Doing so makes libraries and programs runnable inside the Scratchbox
# environment as native binaries (not for the CPU that Scratchbox is
# emulating).

do_configure_prepend () {
  export LD_RUN_PATH=3D"/scratchbox/host_shared/lib:/scratchbox/tools/lib"
}

do_compile_prepend () {
  export LD_RUN_PATH=3D"/scratchbox/host_shared/lib:/scratchbox/tools/lib"
}

--------------030207090608070109000309--

--------------enig2C157F840DEF2D79DC0894C0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHRuCPG9cfwmwwEtoRCHwiAJ4tqjqO813PmuN0ZU79QJ7hLO4c1wCdHmHv
pVn3r0APkDvsL7yCDXTt/2c=
=ue8o
-----END PGP SIGNATURE-----

--------------enig2C157F840DEF2D79DC0894C0--
