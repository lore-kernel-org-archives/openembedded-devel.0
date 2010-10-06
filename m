Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3Udb-00059c-Ng for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 16:06:34 +0200
Received: from f053037105.adsl.alicedsl.de ([78.53.37.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3UdI-0005pY-NA; Wed, 06 Oct 2010 14:06:12 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 06 Oct 2010 16:06:10 +0200
Message-ID: <1286373970.3792.6.camel@mattotaupa>
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
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: libfsotransport_git: `do_compile()` fails with error: Pointer arithmetic not supported for `void*'
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
X-List-Received-Date: Wed, 06 Oct 2010 14:06:53 -0000
X-Groupsio-MsgNum: 24430
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Gdw1+m8hfeQc8VPXqA0W"

--=-Gdw1+m8hfeQc8VPXqA0W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`libfsotransport_git.bb` fails to compile with the following error [1]. The=
 log from Tinderbox is is not from my build machine, but I do get the same =
error.

        NOTE: make
        make  all-recursive
        make[1]: Entering directory `/home/shr/shr-unstable/tmp/work/armv4t=
-oe-linux-gnueabi/libfsotransport-1_0.9.6+gitr842+43fae6cf5e3aa57f5d7fed467=
896d2d4d0f69679-r2.2/git/libfsotransport'
        Making all in fsotransport
        make[2]: Entering directory `/home/shr/shr-unstable/tmp/work/armv4t=
-oe-linux-gnueabi/libfsotransport-1_0.9.6+gitr842+43fae6cf5e3aa57f5d7fed467=
896d2d4d0f69679-r2.2/git/libfsotransport/fsotransport'
        /home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/bin/valac -C -=
-basedir .. --vapidir ../vapi --pkg posix --pkg linux --pkg glib-2.0 --pkg =
gio-2.0 --pkg gee-1.0 --pkg fsobasics-2.0 --header fsotransport.h --library=
 fsotransport-2.0  -D FAST_BAUD --pkg hsuart basetransport.vala commandqueu=
e.vala delegate.vala null.vala parser.vala pipe.vala pty.vala serial.vala s=
ocket.vala transport.vala hsuart.vala
        basetransport.vala:463.13-463.31: error: Pointer arithmetic not sup=
ported for `void*'
                    rdata +=3D (int)bread;
                    ^^^^^^^^^^^^^^^^^^^
        basetransport.vala:463.13-463.31: error: Assignment: Invalid callba=
ck assignment attempt
                    rdata +=3D (int)bread;
                    ^^^^^^^^^^^^^^^^^^^
        Compilation failed: 2 error(s), 0 warning(s)
        make[2]: *** [.vala.stamp] Error 1
        make[2]: Leaving directory `/home/shr/shr-unstable/tmp/work/armv4t-=
oe-linux-gnueabi/libfsotransport-1_0.9.6+gitr842+43fae6cf5e3aa57f5d7fed4678=
96d2d4d0f69679-r2.2/git/libfsotransport/fsotransport'
        make[1]: *** [all-recursive] Error 1
        make[1]: Leaving directory `/home/shr/shr-unstable/tmp/work/armv4t-=
oe-linux-gnueabi/libfsotransport-1_0.9.6+gitr842+43fae6cf5e3aa57f5d7fed4678=
96d2d4d0f69679-r2.2/git/libfsotransport'
        make: *** [all] Error 2
        FATAL: oe_runmake failed
        ERROR: Function do_compile failed

Might this be related to the switch to new Vala version 0.11.0 [3] which ha=
s such a check included [2]? Commit ecafbae [4] seems not to be enough.


Thanks,

Paul


[1] http://tinderbox.openembedded.net/public/logs/task/8443672.txt
[2] http://git.gnome.org/browse/vala/commit/?id=3D14235edbf8e66d5d1d130c3e0=
2ef9067e64635c2
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9b47372=
447a631e0c7322908c1d08ec46061ed0c
[4] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Decafbae=
0c94d17af681106687ca3e4e317112c11

--=-Gdw1+m8hfeQc8VPXqA0W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkysgk0ACgkQPX1aK2wOHVi95wCfbrEje0Fxpx8Ctu6QjikvKMPx
XSwAn2ZQa8ylQwJAenfdjAT0cJGsMSds
=sDPe
-----END PGP SIGNATURE-----

--=-Gdw1+m8hfeQc8VPXqA0W--
