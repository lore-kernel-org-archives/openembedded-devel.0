Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 901177316D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 13:42:48 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1apc75-0002af-HP from Joe_MacDonald@mentor.com ;
	Mon, 11 Apr 2016 06:42:47 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 Apr 2016 06:42:47 -0700
Received: by burninator (Postfix, from userid 1000)	id 2768A58044A; Mon, 11
	Apr 2016 09:42:46 -0400 (EDT)
Date: Mon, 11 Apr 2016 09:42:46 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20160411134245.GD5884@mentor.com>
References: <1459585331-22707-1-git-send-email-mike.looijmans@topic.nl>
	<5703588F.1040406@topic.nl> <20160406171431.GB5060@mentor.com>
	<570BA7BB.5090504@topic.nl>
MIME-Version: 1.0
In-Reply-To: <570BA7BB.5090504@topic.nl>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] waf-cross-answers: Fix faulty link cross-answers-mipsel.txt
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Apr 2016 13:42:49 -0000
X-Groupsio-MsgNum: 60943
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline

--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [PATCH] waf-cross-answers: Fix faulty link cross-answers-mipsel.txt] O=
n 16.04.11 (Mon 15:33) Mike Looijmans wrote:

> On 06-04-16 19:14, Joe MacDonald wrote:
> >Hi Mike,
> >
> >[Re: [PATCH] waf-cross-answers: Fix faulty link cross-answers-mipsel.txt=
] On 16.04.05 (Tue 08:17) Mike Looijmans wrote:
> >
> >>Just a reminder that currently "waf" is broken and still won't work on
> >>mipsel platforms without this bugfix.
> >
> >I merged this for you and pushed it a few minutes ago.  I don't have any
> >MIPS hardware to test this on but I'm trusting that since you're
> >reporting it's a build failure that validating for the Edgerouter is a
> >valid test case.  Is that true?
>=20
> Don't know that particular box,

It's the only MIPS machine I could find in meta-yocto-bsp.  I don't know
anything about it either.

> but if it failed to build (because it's mipsel and reports a missing
> file) before this patch, then yes, that's okay as a test.

Okay, let me know if something still seems busted and we'll try to turn
it around quickly for you.

-J.

>=20
> M.
>=20
>=20
> >
> >>
> >>
> >>On 02-04-16 10:22, Mike Looijmans wrote:
> >>>Apparently something was wrong in the patch "waf-cross-answers:
> >>>Add cross-answers-mipsel.txt". and it created a dead symlink.
> >>>Solve it by just copying the cross-answers-mips.txt instead of
> >>>linking it.
> >>>
> >>>Fixes: 0898fb01ccea229cb0c64796b62f20a7c596ac0b
> >>>
> >>>Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >>>---
> >>>  .../waf-cross-answers/cross-answers-mipsel.txt     | 40 ++++++++++++=
+++++++++-
> >>>  1 file changed, 39 insertions(+), 1 deletion(-)
> >>>  mode change 120000 =3D> 100644 meta-networking/files/waf-cross-answe=
rs/cross-answers-mipsel.txt
> >>>
> >>>diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mip=
sel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> >>>deleted file mode 120000
> >>>index 59b4337..0000000
> >>>--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> >>>+++ /dev/null
> >>>@@ -1 +0,0 @@
> >>>-cross-answers-mips.txt
> >>>diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mip=
sel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> >>>new file mode 100644
> >>>index 0000000..18bfa02
> >>>--- /dev/null
> >>>+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> >>>@@ -0,0 +1,39 @@
> >>>+Checking uname sysname type: "Linux"
> >>>+Checking uname version type: "# Wed May 20 10:34:39 UTC 2015"
> >>>+Checking simple C program: "hello world"
> >>>+rpath library support: OK
> >>>+-Wl,--version-script support: OK
> >>>+Checking getconf LFS_CFLAGS: NO
> >>>+Checking correct behavior of strtoll: NO
> >>>+Checking for working strptime: OK
> >>>+Checking for C99 vsnprintf: "1"
> >>>+Checking for HAVE_SHARED_MMAP: OK
> >>>+Checking for HAVE_MREMAP: OK
> >>>+Checking for HAVE_SECURE_MKSTEMP: OK
> >>>+Checking for HAVE_IFACE_GETIFADDRS: NO
> >>>+Checking for HAVE_IFACE_IFCONF: NO
> >>>+Checking for HAVE_IFACE_IFREQ: NO
> >>>+Checking for large file support without additional flags: NO
> >>>+Checking for -D_FILE_OFFSET_BITS=3D64: OK
> >>>+Checking for HAVE_INCOHERENT_MMAP: NO
> >>>+Checking value of NSIG: "128"
> >>>+Checking value of _NSIG: "128"
> >>>+Checking value of SIGRTMAX: "127"
> >>>+Checking value of SIGRTMIN: "34"
> >>>+Checking whether the WRFILE -keytab is supported: OK
> >>>+Checking for kernel change notify support: OK
> >>>+Checking for Linux kernel oplocks: OK
> >>>+Checking for kernel share modes: OK
> >>>+Checking whether POSIX capabilities are available: OK
> >>>+Checking if can we convert from CP850 to UCS-2LE: OK
> >>>+Checking if can we convert from UTF-8 to UCS-2LE: OK
> >>>+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
> >>>+Checking whether we can use Linux thread-specific credentials: OK
> >>>+Checking whether fcntl locking is available: OK
> >>>+Checking for the maximum value of the 'time_t' type: NO
> >>>+Checking whether the realpath function allows a NULL argument: OK
> >>>+Checking for ftruncate extend: OK
> >>>+getcwd takes a NULL argument: OK
> >>>+Checking for small off_t: NO
> >>>+Checking whether blkcnt_t is 32 bit: NO
> >>>+Checking whether blkcnt_t is 64 bit: OK
> >>>
> >>
> >>
> >>
> >>Kind regards,
> >>
> >>Mike Looijmans
> >>System Expert
> >>
> >>TOPIC Embedded Products
> >>Eindhovenseweg 32-C, NL-5683 KH Best
> >>Postbus 440, NL-5680 AK Best
> >>Telefoon: +31 (0) 499 33 69 79
> >>E-mail: mike.looijmans@topicproducts.com
> >>Website: www.topicproducts.com
> >>
> >>Please consider the environment before printing this e-mail
> >>
> >>
> >>
> >>
> >>
> >
>=20
>=20
>=20
> Kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>=20
> Please consider the environment before printing this e-mail
>=20
>=20
>=20
>=20
>=20

--=20
-Joe MacDonald.
:wq

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXC6nVAAoJEEn8ffcsOfaWSrYIAItKIGEOsS1hqdoxb8EkMwSJ
z2W1LsSQb5K+nTBUuZMn9vp5bMI7PpupdjtEP0Kw/6ebA+FxHMP/QPcHJozahffP
vL8M8h53QUtr/rW3T2dmD2+szoRtzun6BVVODrz5eygBO5X5oNTVGfDuTMsBgTe2
W5GBfoIWn2oBe7P3cCIgMyHj+hYKYSqAjtztwqQYuDsM8qxu0RpZEH2gO2s6jyoy
e9n14juw/nXwnbppg8SSeeI6ZxeUx+z0yg6Z8tbaVRes62sozfpO9iWybOOoBmze
EyG+wwsA1bPAcPcHeGk5NR0MkgdusQtm7LeizkeweTAiHEU685yLi2xFKkZsZOQ=
=TsOu
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
