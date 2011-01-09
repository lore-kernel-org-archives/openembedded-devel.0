Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pc2Us-0007BM-4z for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 22:08:18 +0100
Received: from f053039058.adsl.alicedsl.de ([78.53.39.58]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pc2UR-00051b-IX for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 21:07:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 09 Jan 2011 22:07:50 +0100
Message-ID: <1294607270.4036.73.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: OT: determining in `Makefile.in` the Python version/path
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
X-List-Received-Date: Sun, 09 Jan 2011 21:08:18 -0000
X-Groupsio-MsgNum: 27844
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7MwWOyMvLvM1EyYWQffm"

--=-7MwWOyMvLvM1EyYWQffm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


when compiling XBMC for the ARM architecture it hard codes Python 2.5
[1] and a patch in the OE repository changes this to Python 2.6 [2].

I tried to use `python-config` to determine the Python version [3].

        ifeq (arm, $(ARCH))
        -# Force external python2.5 for now!
        -LIBS +=3D-lpython2.5
        +# Force external Python for now!
        +LIBS +=3D $(shell python-config --libs)
         endif

This fails with the following error though documented in `log.do_compile`.

        Traceback (most recent call last):
          File "/oe/build/angstrom-dev/sysroots/i686-linux/usr/bin/python-c=
onfig", line 6, in <module>
            from distutils import sysconfig
          File "/oe/build/angstrom-dev/sysroots/i686-linux/usr/lib/python2.=
6/distutils/sysconfig.py", line 22, in <module>
            PREFIX =3D os.path.normpath(sys.prefix).replace( os.getenv("BUI=
LD_SYS"), os.getenv("HOST_SYS") )

Do you know of an easy way to fix this with just adapting `Makefile.in`?
Or is using a separate variable as `PYTHON_LIBS` [4] the only option
besides hard coding and patching?

        ifeq (arm, $(ARCH))
         # Force external Python for now!
        -LIBS +=3D $(shell python-config --libs)
        +PYTHON_LIBS ?=3D $(shell python-config --libs)
        +LIBS +=3D $(PYTHON_LIBS)
         endif


Thanks,

Paul


[1] https://github.com/xbmc/xbmc/#L470
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/xbmc/xb=
mc/0006-Hardcode-python2.6-for-now.patch?id=3D0cc02ded7bd429208ccb0e0e0aa3e=
43aec8a4722
[3] http://trac.xbmc.org/ticket/11041 (Please notice the updated patch wher=
e `($` is changed to `$(`.)
[4] http://trac.xbmc.org/ticket/11042 (Please notice the updated patch wher=
e `($` is changed to `$(`.)

--=-7MwWOyMvLvM1EyYWQffm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0qI6YACgkQPX1aK2wOHVgWOgCggZt44mLq81OTYhbsmW0VxJO6
5FsAn03M9VlpVv5BBsteLslZgcRwxs8k
=7ihM
-----END PGP SIGNATURE-----

--=-7MwWOyMvLvM1EyYWQffm--
