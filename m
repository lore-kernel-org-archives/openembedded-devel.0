Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB8077087
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Apr 2016 17:14:33 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1anr2G-0006zT-Kk from Joe_MacDonald@mentor.com ;
	Wed, 06 Apr 2016 10:14:32 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Wed, 6 Apr 2016
	10:14:32 -0700
Received: by burninator (Postfix, from userid 1000)	id 00872580823; Wed,  6
	Apr 2016 13:14:31 -0400 (EDT)
Date: Wed, 6 Apr 2016 13:14:31 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20160406171431.GB5060@mentor.com>
References: <1459585331-22707-1-git-send-email-mike.looijmans@topic.nl>
	<5703588F.1040406@topic.nl>
MIME-Version: 1.0
In-Reply-To: <5703588F.1040406@topic.nl>
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
X-List-Received-Date: Wed, 06 Apr 2016 17:14:34 -0000
X-Groupsio-MsgNum: 60863
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

[Re: [PATCH] waf-cross-answers: Fix faulty link cross-answers-mipsel.txt] O=
n 16.04.05 (Tue 08:17) Mike Looijmans wrote:

> Just a reminder that currently "waf" is broken and still won't work on
> mipsel platforms without this bugfix.

I merged this for you and pushed it a few minutes ago.  I don't have any
MIPS hardware to test this on but I'm trusting that since you're
reporting it's a build failure that validating for the Edgerouter is a
valid test case.  Is that true?

-J.

>=20
>=20
> On 02-04-16 10:22, Mike Looijmans wrote:
> >Apparently something was wrong in the patch "waf-cross-answers:
> >Add cross-answers-mipsel.txt". and it created a dead symlink.
> >Solve it by just copying the cross-answers-mips.txt instead of
> >linking it.
> >
> >Fixes: 0898fb01ccea229cb0c64796b62f20a7c596ac0b
> >
> >Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >---
> >  .../waf-cross-answers/cross-answers-mipsel.txt     | 40 ++++++++++++++=
+++++++-
> >  1 file changed, 39 insertions(+), 1 deletion(-)
> >  mode change 120000 =3D> 100644 meta-networking/files/waf-cross-answers=
/cross-answers-mipsel.txt
> >
> >diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipse=
l.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> >deleted file mode 120000
> >index 59b4337..0000000
> >--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> >+++ /dev/null
> >@@ -1 +0,0 @@
> >-cross-answers-mips.txt
> >diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipse=
l.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> >new file mode 100644
> >index 0000000..18bfa02
> >--- /dev/null
> >+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
> >@@ -0,0 +1,39 @@
> >+Checking uname sysname type: "Linux"
> >+Checking uname version type: "# Wed May 20 10:34:39 UTC 2015"
> >+Checking simple C program: "hello world"
> >+rpath library support: OK
> >+-Wl,--version-script support: OK
> >+Checking getconf LFS_CFLAGS: NO
> >+Checking correct behavior of strtoll: NO
> >+Checking for working strptime: OK
> >+Checking for C99 vsnprintf: "1"
> >+Checking for HAVE_SHARED_MMAP: OK
> >+Checking for HAVE_MREMAP: OK
> >+Checking for HAVE_SECURE_MKSTEMP: OK
> >+Checking for HAVE_IFACE_GETIFADDRS: NO
> >+Checking for HAVE_IFACE_IFCONF: NO
> >+Checking for HAVE_IFACE_IFREQ: NO
> >+Checking for large file support without additional flags: NO
> >+Checking for -D_FILE_OFFSET_BITS=3D64: OK
> >+Checking for HAVE_INCOHERENT_MMAP: NO
> >+Checking value of NSIG: "128"
> >+Checking value of _NSIG: "128"
> >+Checking value of SIGRTMAX: "127"
> >+Checking value of SIGRTMIN: "34"
> >+Checking whether the WRFILE -keytab is supported: OK
> >+Checking for kernel change notify support: OK
> >+Checking for Linux kernel oplocks: OK
> >+Checking for kernel share modes: OK
> >+Checking whether POSIX capabilities are available: OK
> >+Checking if can we convert from CP850 to UCS-2LE: OK
> >+Checking if can we convert from UTF-8 to UCS-2LE: OK
> >+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
> >+Checking whether we can use Linux thread-specific credentials: OK
> >+Checking whether fcntl locking is available: OK
> >+Checking for the maximum value of the 'time_t' type: NO
> >+Checking whether the realpath function allows a NULL argument: OK
> >+Checking for ftruncate extend: OK
> >+getcwd takes a NULL argument: OK
> >+Checking for small off_t: NO
> >+Checking whether blkcnt_t is 32 bit: NO
> >+Checking whether blkcnt_t is 64 bit: OK
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

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXBUP3AAoJEEn8ffcsOfaWuy0H/19LSOpprki9VMC5CyepPbWb
6eg69qF8B93rC0aOfy+aTkADqwBD/EvL0Yk+GMwSsi39P9P7FIqT+QIHPH+fADbk
PtjOPMLKRpn7ENEq6EES4dMJKLUJid/is9GOEjmAmISuUDAJMM6jemxeTCeljy46
EVVAvdR0tZ7vK83mNCp4rjuLR39Oez8hOFo/YDgp4BGFKDDzagk9kZbX8SCEZFKp
RS0I1ZEykyM5pRSAI3LUF5EUN7mIOaGKPbrp8HaBLQmJbIgJFy7sblY0wPZG6YhP
txhXouuypUwo1Ls5UFTpo1NPf8XZsFnwdkeigenJsKqCzLw2fVN5kq4iSdR7s+4=
=f1/B
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
