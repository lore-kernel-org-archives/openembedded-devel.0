Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QFLrC-000578-5D for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 09:41:50 +0200
Received: from g225080101.adsl.alicedsl.de ([92.225.80.101]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QFLpZ-0004lX-Pi for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 07:40:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Apr 2011 09:39:18 +0200
Message-ID: <1303976359.3990.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: angstrom-2010.x: `bitbake virtual/kernel` fails with `[Errno 2] No such file or directory: '/oe/openembedded/recipes/linux/linux-omap-2.6.37/beagleboard/./configs/'`
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
X-List-Received-Date: Thu, 28 Apr 2011 07:41:50 -0000
X-Groupsio-MsgNum: 31504
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2f/hNafe5fHP1dAj8huR"

--=-2f/hNafe5fHP1dAj8huR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


using `angstrom-2010.x` for `MACHINE =3D "beagleboard"` and executing
`bitbake -k virtual/kernel` from an empty build directory, task unpack
of `linux-omap_2.6.37.bb` fails with the following error.

	$ bitbake -k virtual/kernel
	[=E2=80=A6]
	Build Configuration:
	BB_VERSION        =3D "1.12.0"
	METADATA_BRANCH   =3D "master"
	METADATA_REVISION =3D "9a7d3ae"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "angstrom"
	DISTRO_VERSION    =3D "v20110428"
	TARGET_FPU        =3D "hard"

	NOTE: Resolving any missing task queue dependencies
	NOTE: Preparing runqueue
	NOTE: Executing RunQueue Tasks
	NOTE: Running task 825 of 945 (ID: 10, /oe/openembedded/recipes/linux/linu=
x-omap_2.6.37.bb, do_setscene)
	NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82=
c20e4472: task do_setscene: Started
	NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82=
c20e4472: task do_setscene: Succeeded
	NOTE: Running task 922 of 945 (ID: 8, /oe/openembedded/recipes/linux/linux=
-omap_2.6.37.bb, do_fetch)
	NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82=
c20e4472: task do_fetch: Started
	NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82=
c20e4472: task do_fetch: Succeeded
	NOTE: Running task 923 of 945 (ID: 0, /oe/openembedded/recipes/linux/linux=
-omap_2.6.37.bb, do_unpack)
	NOTE: Running task 924 of 945 (ID: 20, /oe/openembedded/recipes/linux/linu=
x-omap_2.6.37.bb, do_distribute_sources)
	NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82=
c20e4472: task do_unpack: Started
	NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82=
c20e4472: task do_distribute_sources: Started
	ERROR: Error executing a python function in /oe/openembedded/recipes/linux=
/linux-omap_2.6.37.bb:
	OSError: [Errno 2] No such file or directory: '/oe/openembedded/recipes/li=
nux/linux-omap-2.6.37/beagleboard/./configs/'

	ERROR: The stack trace of python calls that resulted in this exception/fai=
lure was:
	ERROR:   File "base_do_unpack", line 35, in <module>
	ERROR:
	ERROR:   File "base_do_unpack", line 32, in base_do_unpack
	ERROR:
	ERROR:   File "base.bbclass", line 29, in oe_unpack
	ERROR:
	ERROR:   File "/oe/openembedded/lib/oe/unpack.py", line 67, in unpack_file
	ERROR:     if os.path.samefile(file, dest):
	ERROR:
	ERROR:   File "/usr/lib/python2.6/posixpath.py", line 152, in samefile
	ERROR:     s1 =3D os.stat(f1)
	ERROR:
	ERROR: The code that was being executed was:
	ERROR:      0031:
	ERROR:      0032:            oe_unpack(d, local, urldata)
	ERROR:      0033:
	ERROR:      0034:
	ERROR:  *** 0035:base_do_unpack(d)
	ERROR:      0036:
	ERROR: (file: 'base_do_unpack', lineno: 35, function: <module>)
	ERROR:      0028:            local =3D urldata.localpath
	ERROR:      0029:            if not local:
	ERROR:      0030:                raise bb.build.FuncFailed('Unable to loca=
te local file for %s' % url)
	ERROR:      0031:
	ERROR:  *** 0032:            oe_unpack(d, local, urldata)
	ERROR:      0033:
	ERROR:      0034:
	ERROR:      0035:base_do_unpack(d)
	ERROR:      0036:
	ERROR: (file: 'base_do_unpack', lineno: 32, function: base_do_unpack)
	NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82=
c20e4472: task base_do_unpack: Failed
	ERROR: Function 'base_do_unpack' failed
	ERROR: Task 0 (/oe/openembedded/recipes/linux/linux-omap_2.6.37.bb, do_unp=
ack) failed with exit code '1'
	Waiting for 1 active tasks to finish:
	0: linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82c20e4472 do=
_distribute_sources (pid 17470)
	NOTE: package linux-omap-2.6.37-r101d+gitrfa3b4e23ec20cfc944db7cc2b30b0d82=
c20e4472: task do_distribute_sources: Succeeded
	ERROR: '/oe/openembedded/recipes/linux/linux-omap_2.6.37.bb' failed

`.configs/` is appended to `SRC_URI` in `multi-kernel.inc` [1].

The strange thing is, that `bitbake -k beagleboard-demo-image` does not
show this error.

A fix would be greatly appreciated.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/m=
ulti-kernel.inc#n16

--=-2f/hNafe5fHP1dAj8huR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk25GZoACgkQPX1aK2wOHVjo9gCfZ3BDeTgxbJaq9VtRNxZa8jej
zgkAn0Gm8ODaWJRyk2Ll9muhye3IvYxn
=Yyka
-----END PGP SIGNATURE-----

--=-2f/hNafe5fHP1dAj8huR--
