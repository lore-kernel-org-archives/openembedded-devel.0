Return-Path: <elvis.dowson@gmail.com>
Received: from mail-ee0-f50.google.com (unknown [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6769E65EB1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 07:19:51 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id e51so2043801eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:message-id:date:to:mime-version;
	bh=Sk2lTJ6TpCoS0ZpT7GoRmChY0CT8haDjzGZPOjKtiPw=;
	b=GhwV8d+3EDPxZCkLhbMy4Nbnfl4zRK8soaFbVA5Csm2eEmvmRpWktLrHE2mshBoq7D
	Ot+NbAmnJ6ZNS474PTmMBLXr7N4ubdhxEekPZIRnXviAwqHic2+xd7CaWCM3uzdmtMNI
	TtdcRPRRe47gnMXYm8TTMaR/vMSj1kvUuULgBlzoivC3lZ0qP+PBjMzYa9L5rKifDw7Z
	UQB14bMVBKnckWJ8WGUT99AQu1Z9D8USvDe8JS5ljB1GUOcDG2gzd28ejFOsNCeSkCuO
	NfXNayxvJzr7ROdilfT1txwCFMy5j/Q9a+sYCbtFt4ozjZhexOhb7b8+FHueGmd9Fs2h
	1VBA==
X-Received: by 10.14.183.5 with SMTP id p5mr29412045eem.52.1400311192413;
	Sat, 17 May 2014 00:19:52 -0700 (PDT)
Received: from [192.168.1.104] ([94.205.109.98])
	by mx.google.com with ESMTPSA id o49sm6680765eep.33.2014.05.17.00.19.50
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 17 May 2014 00:19:51 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <6B7DE98C-8076-4293-AA23-C459EAE53F44@gmail.com>
Date: Sat, 17 May 2014 11:19:46 +0400
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
X-Mailer: Apple Mail (2.1878.2)
Subject: [poky] gcc-cross-initial_4.8.bb, do_patch failed with exit code '1'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 May 2014 07:19:54 -0000
X-Groupsio-MsgNum: 49957
Content-Type: multipart/signed;
	boundary="Apple-Mail=_070A4378-00C6-4EEB-98FB-E9B44DAB13AF";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_070A4378-00C6-4EEB-98FB-E9B44DAB13AF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

Currently poky master branch fails to build gcc-4.8 because of numerous =
on going adaptations to include gcc-4.9.

The most recent one is as follows:

Build Configuration:
BB_VERSION        =3D "1.23.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-12.10"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "zc706-zynq7"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.6+snapshot-20140517"
TUNE_FEATURES     =3D " arm armv7a vfp neon zynq"
TARGET_FPU        =3D "vfp-neon"
meta             =20
meta-yocto       =20
meta-yocto-bsp    =3D "master:85f51bb754d154ba1f2d3a3903b67d4994efe52f"
meta-xilinx       =3D "master:869cba51d3db7909077ad0f066b784ebfd3b092d"
meta-xilinx-community =3D =
"master:b93b7ccfa7bddbe7f5fb280e24b7ddccd78c09ff"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Command Error: exit status: 1  Output:
Applying patch 0002-uclibc-conf.patch
patch: **** Can't open patch file patches/0002-uclibc-conf.patch : No =
such file or directory
Patch 0002-uclibc-conf.patch can be reverse-applied
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: =
/tool/yocto/build/zc706/tmp/work-shared/gcc-4.8.2-r0/temp/log.do_patch.132=
12
ERROR: Task 344 =
(/tool/yocto/poky/meta/recipes-devtools/gcc/gcc-cross-initial_4.8.bb, =
do_patch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 363 tasks of which 3 didn't need to be =
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /tool/yocto/poky/meta/recipes-devtools/gcc/gcc-cross-initial_4.8.bb, =
do_patch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.


Regards,

Elvis Dowson

--Apple-Mail=_070A4378-00C6-4EEB-98FB-E9B44DAB13AF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQQcBAEBCgAGBQJTdw2SAAoJENajI+UwiZtECIkf/0yx2mPLS3kKEQ/B0Px6qFsv
4Wo0QB8jX1+a3gblw2difj7huLBdb9dmifu1yT0Aef4tWE6Em5chYPSlEQf/9uXX
iDZa4YZwASvt+60PjuTGRraxK7kLvnuV23WJtMMDoBMkCGDoBsjAPATtDDm75IxR
P/+GC+xc8wJdimcFXiOnI+T7yjVvudnTIupKxGlf4VNFTXfDWCIHM1aZskKJ/Bk7
Ep5wSVe/yQbLcIOwKQwH95kxy9f8c5FTase8KdRMB8UpHCVEOzGlLovxpumVzas2
2zIVa9ueHIRRPP7xd/0jWpxz/o3cfHz+JzJ7Slehzq4oP0eoaqFu2N3GBsZVSeZy
DPsaz1YjFjY1WaSYpoxvcFr97X8v6PItTN8ietR4GOVjUvsIIS8UqhfYwMX+md0a
DQNMES6fdYCPus1ljp3GWlymVd7ZdTHVAZDHKGE9Lgk//bUWnnr/VKNk0KnlwxGU
xC+fwTDqBFUy54yj3sloWMIM0TEga2PFpNofShZpBNcOyR84ZHqF87//LmUawBVl
t555wBEAFBvAVGPSEBf6qJ4WRzGdC9zdEiOKjAnAXyd17uIJRpEM2IDAExm8A3wK
E6ZTl1KhF6yrUrS+d67uVADNLqwaG0OuNfDA4/P1qfMElhFQH/cWAsqfQ1XFYMsN
bqTBzK863bm9xfezclW4riT2/AAhQT2ysPmvPRLRh93rxMLIzwIEivcZV3ppp/rB
sY0lnKjgGN1ZoARRL55E+VcBGyXZc/ZFvxCLu/erkmtcnyDETXVhZb/Kd7ZbAuKj
rm7E+AaBaHZGvxUm9VeBuIZYEo3QQo+ghlA720wO26O2KtjOc/zKTnC0J5iM1IfT
2v8FY7Hsrn7ERo1LBqx9k32s5nGVGT1qsxp1Y9Cc3zgpDf/BI0opqzUQszJnWLx7
jJvKrN9DivQRkKXKJxxkJMIUNRzmWVKUzX6hoTGdDqUP3eq/XlF4McdruGJD5NDI
WL5ol5kyh9BSH5ZWFwkPro3tOGktx6DdIWE8Uh0K4eWc9Q4VNiZyZHGUmU8WKqTq
ljTPxkRqCz85vd+Beju8874msCrSd6QffuTIzNULNMU6dM+4RyH79QOhpHGKe8kT
gZuGSASRutH5anMZL6iBR13aK/bY8ff/QgtpVyvF3860X+Mb901kq+gUERBX1w+G
MEBoNLSkCKYRUYpER/WIc5Dm+jQ/68bBQ29SpqurPaRceQQwFPEhwepr6W19D3DC
g7IOjITRUrKcc7qDqjbp/rBdgc7Feu/D13pzBMsLQWj8h9fA67qGi54VEtfdwSTA
6Sw9+z7Mk21AgvWwDUSY18FhTIG6FAlM1LpGxexgLqCXI/FfWvZexUBuZqj29ns=
=/q3G
-----END PGP SIGNATURE-----

--Apple-Mail=_070A4378-00C6-4EEB-98FB-E9B44DAB13AF--
