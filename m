Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYjvp-0007wB-Ng for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 19:42:31 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYjvN-00024i-0y for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 19:42:01 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 19:42:01 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 19:42:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 31 Dec 2010 19:41:49 +0100
Message-ID: <ifl85e$ets$1@dough.gmane.org>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Enigmail-Version: 1.0.1
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
X-List-Received-Date: Fri, 31 Dec 2010 18:42:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-12-10 16:47, Frans Meulenbroeks wrote:
> The u-boot recipe for pandaboard is nonbuildable for a few
> months. Apparently this recipe is orphaned.
> I've made things buildable again by moving to the latest
> mainline u-boot (as suggested by Steve Sakoman a few monts
> ago). It builds fine, but is not tested on the actual
> hardware (as I do not have access to a board).
> Still I feel that a buildable recipe is better than using a
> recipe that does not even build.

NAK, since it builds just fine and the result of the new recipe doesn't
work as good:

koen@dominion:/OE/org.openembedded.dev/recipes/u-boot$
MACHINE=omap4430-panda bitbake -b u-boot-sakoman_git.bb

Build Configuration:
BB_VERSION        = "1.11.0"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "67c4a78"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "omap4430-panda"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20101231"
TARGET_FPU        = "hard"

NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 20 (ID: 11,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_setscene)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_setscene: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_setscene: Succeeded
- --2010-12-31 19:31:20--
http://www.angstrom-distribution.org/unstable/sources/git_www.sakoman.com.git.u-boot.git_ccd0c67858c6e2807c695e2c8f545284cb871866.tar.gz
 Resolving www.angstrom-distribution.org... 188.40.83.200
NOTE: Running task 2 of 20 (ID: 9,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_fetch)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_fetch: Started
NOTE: fetch
http://www.angstrom-distribution.org/unstable/sources/git_www.sakoman.com.git.u-boot.git_ccd0c67858c6e2807c695e2c8f545284cb871866.tar.gz

<snip>

 2010-12-31 19:39:01 (24.4 KB/s) -
`/OE/downloads/git_www.sakoman.com.git.u-boot.git_ccd0c67858c6e2807c695e2c8f545284cb871866.tar.gz'
saved [11415903/11415903]

NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_fetch: Succeeded
NOTE: Running task 4 of 20 (ID: 16,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_distribute_sources)
NOTE: Running task 3 of 20 (ID: 0,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_unpack)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_distribute_sources: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_distribute_sources: Succeeded
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_unpack: Started
NOTE: Unpacking
/OE/downloads/git_www.sakoman.com.git.u-boot.git_ccd0c67858c6e2807c695e2c8f545284cb871866.tar.gz
to
/OE/angstrom-dev/work/omap4430-panda-angstrom-linux-gnueabi/u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0/
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_unpack: Succeeded
NOTE: Running task 5 of 20 (ID: 1,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_patch)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_patch: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_patch: Succeeded
NOTE: Running task 6 of 20 (ID: 12,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_configure)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_configure: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_configure: Succeeded
NOTE: Running task 7 of 20 (ID: 13,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_qa_configure)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_qa_configure: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_qa_configure: Succeeded
NOTE: Running task 8 of 20 (ID: 14,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_compile)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_compile: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_compile: Succeeded
NOTE: Running task 9 of 20 (ID: 2,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_install)
NOTE: Running task 10 of 20 (ID: 4,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_deploy)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_install: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_install: Succeeded
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_deploy: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_deploy: Succeeded
NOTE: Running task 11 of 20 (ID: 15,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_package)
NOTE: Running task 12 of 20 (ID: 3,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_populate_sysroot)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_populate_sysroot: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_populate_sysroot: Succeeded
NOTE: Running task 13 of 20 (ID: 5,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_qa_staging)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_qa_staging: Started
NOTE: package u-boot-sakoman skipped
NOTE: package u-boot-sakoman-fw-utils skipped
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package: Succeeded
NOTE: Running task 14 of 20 (ID: 19,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_package_write_ipk)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package_write_ipk: Started
Packaged contents of u-boot-sakoman-dbg into
/OE/angstrom-dev/deploy/glibc/ipk/omap4430-panda/u-boot-sakoman-dbg_2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6_omap4430-panda.ipk
Packaged contents of u-boot-sakoman into
/OE/angstrom-dev/deploy/glibc/ipk/omap4430-panda/u-boot-sakoman_2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6_omap4430-panda.ipk
NOTE: Not creating empty archive for
u-boot-sakoman-doc-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6
Packaged contents of u-boot-sakoman-dev into
/OE/angstrom-dev/deploy/glibc/ipk/omap4430-panda/u-boot-sakoman-dev_2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6_omap4430-panda.ipk
NOTE: Not creating empty archive for
u-boot-sakoman-static-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6
NOTE: Not creating empty archive for
u-boot-sakoman-locale-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6
NOTE: Not creating empty archive for
u-boot-sakoman-fw-utils-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0.6
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package_write_ipk: Succeeded
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_qa_staging: Succeeded
NOTE: Running task 15 of 20 (ID: 6,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_package_write)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package_write: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package_write: Succeeded
NOTE: Running task 16 of 20 (ID: 7,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_package_stage)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package_stage: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package_stage: Succeeded
NOTE: Running task 17 of 20 (ID: 8,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_package_stage_all)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package_stage_all: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_package_stage_all: Succeeded
NOTE: Running task 18 of 20 (ID: 10,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_build)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_build: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_build: Succeeded
NOTE: Running task 19 of 20 (ID: 17,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb, do_rm_work)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_rm_work: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_rm_work: Succeeded
NOTE: Running task 20 of 20 (ID: 18,
/OE/org.openembedded.dev/recipes/u-boot/u-boot-sakoman_git.bb,
do_rm_work_all)
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_rm_work_all: Started
NOTE: package
u-boot-sakoman-2010.9+r0+gitccd0c67858c6e2807c695e2c8f545284cb871866-r0:
task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 20 tasks of which 0 didn't need to be
rerun and 0 failed.
koen@dominion:/OE/org.openembedded.dev/recipes/u-boot$

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNHiPtMkyGM64RGpERApY1AJ9LZNHfpTr7TQGatDxuFCV/fNPOiACfU2n0
tAJXkFpiWeFxZMI0nnj4jqQ=
=vQ8j
-----END PGP SIGNATURE-----



