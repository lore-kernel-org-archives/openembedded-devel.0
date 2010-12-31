Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYkIx-00009N-9c
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 20:06:23 +0100
Received: by iwn8 with SMTP id 8so12305526iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 11:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TGla9cCMebcMAN5dCXasIIHFMn1IHcOy0uo5Qy2tjvA=;
	b=BHJPPIcccqT6QsinW7wsrlPW5YN2XDNan9/aNx9JwLN0+5nWq7gPBUuXyavYP+nCsT
	SZoL4u4gd99Lj80Xtxxya+E3yRG0SOiyB971vhzdQW/5FrrAulZLiS/loyYSZxDGpSz/
	qUjZIdy/Y+C2J3ta47d4SULKXf2CPZCAFtPKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GYFzW61og4pRtsqV1Evd9nnXdry0RrFWTiIMIvi9CsFB//wsoxBXNcQ/iGr3A/Xuy5
	mA2GBG+NsmyWRmEVeSFWonhhmkpvrh6fLHPx0CwADqyV8SN+FKuabCGmhKEP0+nQVdN5
	a/XpFnBo+ZxcWWSHSGzb1XcAzyTSj/IpvKJqU=
MIME-Version: 1.0
Received: by 10.231.10.76 with SMTP id o12mr1758649ibo.144.1293822362872; Fri,
	31 Dec 2010 11:06:02 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Fri, 31 Dec 2010 11:06:02 -0800 (PST)
In-Reply-To: <ifl85e$ets$1@dough.gmane.org>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>
	<ifl85e$ets$1@dough.gmane.org>
Date: Fri, 31 Dec 2010 20:06:02 +0100
Message-ID: <AANLkTikBC4nhO1ZSkuYcyoEPNonS4YeXCP6vzKJ3d3Fr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Fri, 31 Dec 2010 19:06:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/31 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-12-10 16:47, Frans Meulenbroeks wrote:
>> The u-boot recipe for pandaboard is nonbuildable for a few
>> months. Apparently this recipe is orphaned.
>> I've made things buildable again by moving to the latest
>> mainline u-boot (as suggested by Steve Sakoman a few monts
>> ago). It builds fine, but is not tested on the actual
>> hardware (as I do not have access to a board).
>> Still I feel that a buildable recipe is better than using a
>> recipe that does not even build.
>
> NAK, since it builds just fine and the result of the new recipe doesn't
> work as good:

It does not build! See the log below.
The recipe says:

SRCREV =3D "ccd0c67858c6e2807c695e2c8f545284cb871866"

PV =3D "2010.9+${PR}+git${SRCREV}"

SRC_URI =3D "git://www.sakoman.com/git/u-boot.git;branch=3Domap4-exp;protoc=
ol=3Dgit \

This SRCREV does not exist!

The only reason it works for you is because you use a mirror that has
a snapshot of the recipe.
If you are concerned about this recipe the least you can do is to make
sure that people can build it even if they do not have your mirror
present.
(by either moving the recipe to a SRCREV that exists or by changing
the SRC_URI to a location that *does* fetch).
In its current form I consider this recipe as broken!

Frans.

frans@linux-suse:~/oe/openembedded> bitbake u-boot-sakoman
Loading cache: 100%
|##########################################################################=
####|
ETA:  00:00:00
Loaded 7231 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
##|
Time: 00:00:29
Parsing of 7278 .bb files complete (6537 cached, 741 parsed). 7982
targets, 310 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        =3D "1.11.0"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "ee3dfcd"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "omap4430-panda"
DISTRO            =3D "minimal"
DISTRO_VERSION    =3D "dev-snapshot-20101231"
TARGET_FPU        =3D "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1229 of 1247 (ID: 9,
/home/frans/oe/openembedded/recipes/u-boot/u-boot-sakoman_git.bb,
do_fetch)
NOTE: package u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284c=
b871866-r0:
task do_fetch: Started
From git://www.sakoman.com/git/u-boot
  * branch            omap4-exp  -> FETCH_HEAD
NOTE: Creating tarball of git repository
 fatal: failed to unpack tree object ccd0c67858c6e2807c695e2c8f545284cb8718=
66
NOTE: package u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284c=
b871866-r0:
task Fetch failed: Unable to fetch URL
git://www.sakoman.com/git/u-boot.git;branch=3Domap4-exp;protocol=3Dgit
from any source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL
git://www.sakoman.com/git/u-boot.git;branch=3Domap4-exp;protocol=3Dgit
from any source.' failed
ERROR: Task 9 (/home/frans/oe/openembedded/recipes/u-boot/u-boot-sakoman_gi=
t.bb,
do_fetch) failed with exit code '1'
ERROR: '/home/frans/oe/openembedded/recipes/u-boot/u-boot-sakoman_git.bb' f=
ailed
frans@linux-suse:~/oe/openembedded>


> koen@dominion:/OE/org.openembedded.dev/recipes/u-boot$
> MACHINE=3Domap4430-panda bitbake -b u-boot-sakoman_git.bb
>
> Build Configuration:
> BB_VERSION =A0 =A0 =A0 =A0=3D "1.11.0"
> METADATA_BRANCH =A0 =3D "org.openembedded.dev"
> METADATA_REVISION =3D "67c4a78"
> TARGET_ARCH =A0 =A0 =A0 =3D "arm"
> TARGET_OS =A0 =A0 =A0 =A0 =3D "linux-gnueabi"
> MACHINE =A0 =A0 =A0 =A0 =A0 =3D "omap4430-panda"
> DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D "angstrom"
> DISTRO_VERSION =A0 =A0=3D "2010.7-test-20101231"
> TARGET_FPU =A0 =A0 =A0 =A0=3D "hard"
>
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1 of 20 (ID: 11,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_setscen=
e)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_setscene: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_setscene: Succeeded
> - --2010-12-31 19:31:20--
> http://www.angstrom-distribution.org/unstable/sources/git_www.sakoman.com=
.git.u-boot.git_ccd0c67858c6e2807c695e2c8f545284cb871866.tar.gz
> =A0Resolving www.angstrom-distribution.org... 188.40.83.200
> NOTE: Running task 2 of 20 (ID: 9,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_fetch)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_fetch: Started
> NOTE: fetch
> http://www.angstrom-distribution.org/unstable/sources/git_www.sakoman.com=
.git.u-boot.git_ccd0c67858c6e2807c695e2c8f545284cb871866.tar.gz
>
> <snip>
>
> =A02010-12-31 19:39:01 (24.4 KB/s) -
> `/OE/downloads/git_www.sakoman.com.git.u-boot.git_ccd0c67858c6e2807c695e2=
c8f545284cb871866.tar.gz'
> saved [11415903/11415903]
>
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_fetch: Succeeded
> NOTE: Running task 4 of 20 (ID: 16,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_distribute_sources)
> NOTE: Running task 3 of 20 (ID: 0,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_unpack)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_distribute_sources: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_distribute_sources: Succeeded
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_unpack: Started
> NOTE: Unpacking
> /OE/downloads/git_www.sakoman.com.git.u-boot.git_ccd0c67858c6e2807c695e2c=
8f545284cb871866.tar.gz
> to
> /OE/angstrom-dev/work/omap4430-panda-angstrom-linux-gnueabi/u-boot-sakoma=
n-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0/
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_unpack: Succeeded
> NOTE: Running task 5 of 20 (ID: 1,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_patch)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_patch: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_patch: Succeeded
> NOTE: Running task 6 of 20 (ID: 12,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_configu=
re)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_configure: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_configure: Succeeded
> NOTE: Running task 7 of 20 (ID: 13,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_qa_configure)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_qa_configure: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_qa_configure: Succeeded
> NOTE: Running task 8 of 20 (ID: 14,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_compile=
)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_compile: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_compile: Succeeded
> NOTE: Running task 9 of 20 (ID: 2,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_install=
)
> NOTE: Running task 10 of 20 (ID: 4,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_deploy)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_install: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_install: Succeeded
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_deploy: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_deploy: Succeeded
> NOTE: Running task 11 of 20 (ID: 15,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_package=
)
> NOTE: Running task 12 of 20 (ID: 3,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_populate_sysroot)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_populate_sysroot: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_populate_sysroot: Succeeded
> NOTE: Running task 13 of 20 (ID: 5,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_qa_staging)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_qa_staging: Started
> NOTE: package u-boot-sakoman skipped
> NOTE: package u-boot-sakoman-fw-utils skipped
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package: Succeeded
> NOTE: Running task 14 of 20 (ID: 19,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_package_write_ipk)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package_write_ipk: Started
> Packaged contents of u-boot-sakoman-dbg into
> /OE/angstrom-dev/deploy/glibc/ipk/omap4430-panda/u-boot-sakoman-dbg_2010.=
9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6_omap4430-panda.ipk
> Packaged contents of u-boot-sakoman into
> /OE/angstrom-dev/deploy/glibc/ipk/omap4430-panda/u-boot-sakoman_2010.9+r0=
+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6_omap4430-panda.ipk
> NOTE: Not creating empty archive for
> u-boot-sakoman-doc-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-=
r0.6
> Packaged contents of u-boot-sakoman-dev into
> /OE/angstrom-dev/deploy/glibc/ipk/omap4430-panda/u-boot-sakoman-dev_2010.=
9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6_omap4430-panda.ipk
> NOTE: Not creating empty archive for
> u-boot-sakoman-static-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb8718=
66-r0.6
> NOTE: Not creating empty archive for
> u-boot-sakoman-locale-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb8718=
66-r0.6
> NOTE: Not creating empty archive for
> u-boot-sakoman-fw-utils-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb87=
1866-r0.6
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package_write_ipk: Succeeded
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_qa_staging: Succeeded
> NOTE: Running task 15 of 20 (ID: 6,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_package_write)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package_write: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package_write: Succeeded
> NOTE: Running task 16 of 20 (ID: 7,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_package_stage)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package_stage: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package_stage: Succeeded
> NOTE: Running task 17 of 20 (ID: 8,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_package_stage_all)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package_stage_all: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_package_stage_all: Succeeded
> NOTE: Running task 18 of 20 (ID: 10,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_build)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_build: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_build: Succeeded
> NOTE: Running task 19 of 20 (ID: 17,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_rm_work=
)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_rm_work: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_rm_work: Succeeded
> NOTE: Running task 20 of 20 (ID: 18,
> /OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
> do_rm_work_all)
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_rm_work_all: Started
> NOTE: package
> u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
> task do_rm_work_all: Succeeded
> NOTE: Tasks Summary: Attempted 20 tasks of which 0 didn't need to be
> rerun and 0 failed.
> koen@dominion:/OE/org.openembedded.dev/recipes/u-boot$
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNHiPtMkyGM64RGpERApY1AJ9LZNHfpTr7TQGatDxuFCV/fNPOiACfU2n0
> tAJXkFpiWeFxZMI0nnj4jqQ=3D
> =3DvQ8j
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


