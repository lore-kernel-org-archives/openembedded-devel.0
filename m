Received: from saturne.centre-cired.fr ([193.51.120.234])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pertusus@free.fr>) id 1QIe4x-0001xs-5o
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 11:45:39 +0200
Received: from patoune ([193.51.120.13]) (authenticated bits=0)
	by saturne.centre-cired.fr (8.14.4/8.14.4) with ESMTP id p479aA2e003514
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 7 May 2011 11:36:22 +0200
Date: Sat, 7 May 2011 11:33:51 +0200
From: Patrice Dumas <pertusus@free.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110507093351.GA28914@free.fr>
Mail-Followup-To: Patrice Dumas <pertusus@free.fr>,
	openembedded-devel@lists.openembedded.org
Mime-Version: 1.0
User-Agent: Mutt/1.4.2.2i
X-Miltered: at saturne.centre-cired.fr with ID 4DC5128A.000 by Joe's j-chkmail
	(http://j-chkmail.ensmp.fr)!
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (saturne.centre-cired.fr
	[193.51.120.234]); Sat, 07 May 2011 11:36:22 +0200 (CEST)
X-Spam-Status: No, score=1.3 required=3.5 tests=FREEMAIL_FROM,
	FSL_HELO_NON_FQDN_1,HELO_NO_DOMAIN,RDNS_NONE,T_TO_NO_BRKTS_FREEMAIL
	autolearn=no version=3.3.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	saturne.centre-cired.fr
Subject: problem with fetching u-boot git and bitbake git fetch debugging
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
X-List-Received-Date: Sat, 07 May 2011 09:45:39 -0000
X-Groupsio-MsgNum: 31680
Content-Type: multipart/mixed; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I am new to openembedded, so I may be doing something plainly wrong, though
I tried to RTFM before posting...

I am trying to merge the archos 101 (archos gen8) conf provided by archos 
in the dev openembedded tree, building on a centos 5.

I have a problem for u-boot, there is an error fetching the source.  I 
could normally try to redo what bitbake does manually and find myself 
why it dosn't work, however, even though I added a lot of -D to 
bitbake, it doesn't say exactly what it does, I guess it goes to a 
directory before launching the git commands and setup something to have
the git commands succeed, but I cannot know which directory and how.

For instance there is
DEBUG: Running export HOME=....; git log --pretty=oneline -n 1 1 -- 2> /dev/null | wc -l
DEBUG: Running export....; rm * -Rf

and I doubt it does that in the directory I launch bitbake from.

Is there a way to have bitbake say what it exactly does?


Here is all the information about what I do I think is relevant. The 
openembeded tree is in /diskdata/dumas/archos_openembedded/openembedded/.

$ pwd
/diskdata/dumas/archos_openembedded

$ export BBPATH=/diskdata/dumas/archos_openembedded/build:/diskdata/dumas/archos_openembedded/openembedded
$ python26 /home/dumas/src/bitbake-1.10.2/bin/bitbake -D -D -D -D -D -D -D -b /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot/u-boot_git.bb > u-boot.out 2>&1

I attach u-boot.out and build/conf/local.conf

In it there is:

MACHINE = "archos-gen8"
DISTRO = "angstrom-2010.x"

I also attach openembedded/conf/machine/archos-gen8.conf.

I have added other files, but I don't think this is relevant for the issue
here, I can post them if you like, though.  Here is a list of all the files

#       conf/machine/archos-gen8.conf
#       recipes/archos-init/
#       recipes/images/archos-image.bb
#       recipes/images/initramfs-archos-image.bb
#       recipes/linux/linux-omap-archos-2.6.29-omap1/
#       recipes/linux/linux-omap-archos_2.6.29-omap1.bb
#       recipes/linux/linux-rp-2.6.24/
#       recipes/pointercal/files/archos-gen8/
#       recipes/xorg-xserver/xserver-xorg-conf/archos-gen8/

(of course I plan to propose a patch for the openembedded tree once I have
succeeded to compile and boot an image, but I am not there for now...).

-- 
Pat

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="u-boot.out"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by saturne.centre-cired.fr id p479aA2e003514

DEBUG: Using cache in '/diskdata/dumas/archos_openembedded/tmp/cache/eglibc=
/archos-gen8'
DEBUG: Parsing /diskdata/dumas/archos_openembedded/openembedded/recipes/u-b=
oot/u-boot_git.bb (full)
DEBUG: BB /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot/u=
-boot_git.bb: handle(data)
DEBUG: LOAD /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot=
/u-boot_git.bb
DEBUG: CONF /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot=
/u-boot_git.bb:1: including u-boot.inc
DEBUG: BB /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot/u=
-boot.inc: handle(data, include)
DEBUG: LOAD /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot=
/u-boot.inc
DEBUG: setVarFlag(do_deploy, dirs, ${S}, data)
DEBUG: update_data()
DEBUG: update_data()
DEBUG: update_data()
DEBUG: providers for u-boot are: ['u-boot']
DEBUG: update_data()
DEBUG: sorted providers for u-boot are: ['/diskdata/dumas/archos_openembedd=
ed/openembedded/recipes/u-boot/u-boot_git.bb']
DEBUG: adding /diskdata/dumas/archos_openembedded/openembedded/recipes/u-bo=
ot/u-boot_git.bb to satisfy u-boot

Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "cd15fba"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "archos-gen8"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v20110507"
TARGET_FPU        =3D "hard"

--2011-05-07 10:59:16--  http://www.angstrom-distribution.org/unstable/sour=
ces/git_www.denx.de.git.u-boot.git_1.tar.gz
R=E9solution de www.angstrom-distribution.org... 188.40.83.200
Connexion vers www.angstrom-distribution.org|188.40.83.200|:80...connect=E9=
.
requ=EAte HTTP transmise, en attente de la r=E9ponse...404 Not Found
2011-05-07 10:59:16 ERREUR 404: Not Found.

NOTE: Preparing runqueue
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_unpack
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_patch
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_install
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_populate_sysroot
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_deploy
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_qa_staging
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_package_write
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_package_stage
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_package_stage_all
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_listtasks
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_clean
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_cleanall
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_distclean
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_checkuri
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_checkuriall
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_fetch
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_fetchall
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_build
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_buildall
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_setscene
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_configure
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_qa_configure
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_compile
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_package
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_distribute_sources
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_distribute_sources_all
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_distsrcall
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_devshell
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_package_write_ipk
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_recipe_sanity
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_recipe_sanity_all
DEBUG: Processing /diskdata/dumas/archos_openembedded/openembedded/recipes/=
u-boot/u-boot_git.bb:do_package_update_index_ipk
NOTE: Marking Active Tasks
NOTE: Pruned 14 inactive tasks, 18 left
NOTE: Assign Weightings
NOTE: Compute totals (have 1 endpoint(s))
NOTE: Executing runqueue
DEBUG: Stamp current task 11 (/diskdata/dumas/archos_openembedded/openembed=
ded/recipes/u-boot/u-boot_git.bb, do_setscene)
DEBUG: Marking task 9 (/diskdata/dumas/archos_openembedded/openembedded/rec=
ipes/u-boot/u-boot_git.bb, do_fetch) as buildable
DEBUG: Stampfile /diskdata/dumas/archos_openembedded/tmp/stamps/archos-gen8=
-angstrom-linux-gnueabi/u-boot-git-r75.do_fetch not available

NOTE: Running task 2 of 18 (ID: 9, /diskdata/dumas/archos_openembedded/open=
embedded/recipes/u-boot/u-boot_git.bb, do_fetch)
DEBUG: Parsing /diskdata/dumas/archos_openembedded/openembedded/recipes/u-b=
oot/u-boot_git.bb (full)
DEBUG: BB /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot/u=
-boot_git.bb: handle(data)
DEBUG: LOAD /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot=
/u-boot_git.bb
DEBUG: CONF /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot=
/u-boot_git.bb:1: including u-boot.inc
DEBUG: BB /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot/u=
-boot.inc: handle(data, include)
DEBUG: LOAD /diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot=
/u-boot.inc
DEBUG: setVarFlag(do_deploy, dirs, ${S}, data)
DEBUG: update_data()
DEBUG: update_data()
DEBUG: update_data()
DEBUG: Executing task do_fetch
DEBUG: update_data()
NOTE: package u-boot-git-r75: task do_fetch: Started
DEBUG: mkdirhier(/home/dumas/sources)
DEBUG: mkdirhier(/diskdata/dumas/archos_openembedded/tmp/work/archos-gen8-a=
ngstrom-linux-gnueabi/u-boot-git-r75/temp)
DEBUG: mkdirhier(/home/dumas/sources)
DEBUG: mkdirhier(/diskdata/dumas/archos_openembedded/tmp/work/archos-gen8-a=
ngstrom-linux-gnueabi/u-boot-git-r75/temp)
DEBUG: update_data()
DEBUG: update_data()
NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/git_www.d=
enx.de.git.u-boot.git_1.tar.gz
DEBUG: executing /usr/bin/env 'PATH=3D/diskdata/dumas/archos_openembedded/b=
uild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/dum=
as/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/dum=
as/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arc=
hos_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_ope=
nembedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/=
tmp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin=
:/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin=
' wget -t 5 --passive-ftp --no-check-certificate -P /home/dumas/sources 'ht=
tp://www.angstrom-distribution.org/unstable/sources/git_www.denx.de.git.u-b=
oot.git_1.tar.gz'
DEBUG: Mirror fetch failure: http://www.angstrom-distribution.org/unstable/=
sources/git_www.denx.de.git.u-boot.git_1.tar.gz;protocol=3Dgit
DEBUG: Running export HOME=3D/home/dumas; export SSH_AUTH_SOCK=3D/tmp/ssh-U=
Dbrb11929/agent.11929; export PATH=3D/diskdata/dumas/archos_openembedded/bu=
ild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arch=
os_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_open=
embedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/t=
mp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:=
/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin;=
 git log --pretty=3Doneline -n 1 1 -- 2> /dev/null | wc -l
DEBUG: Running export HOME=3D/home/dumas; export SSH_AUTH_SOCK=3D/tmp/ssh-U=
Dbrb11929/agent.11929; export PATH=3D/diskdata/dumas/archos_openembedded/bu=
ild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arch=
os_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_open=
embedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/t=
mp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:=
/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin;=
 rm * -Rf
DEBUG: Running export HOME=3D/home/dumas; export SSH_AUTH_SOCK=3D/tmp/ssh-U=
Dbrb11929/agent.11929; export PATH=3D/diskdata/dumas/archos_openembedded/bu=
ild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arch=
os_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_open=
embedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/t=
mp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:=
/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin;=
 git fetch git://www.denx.de/git/u-boot.git master
DEBUG: Running export HOME=3D/home/dumas; export SSH_AUTH_SOCK=3D/tmp/ssh-U=
Dbrb11929/agent.11929; export PATH=3D/diskdata/dumas/archos_openembedded/bu=
ild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arch=
os_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_open=
embedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/t=
mp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:=
/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin;=
 git fetch --tags git://www.denx.de/git/u-boot.git
DEBUG: Running export HOME=3D/home/dumas; export SSH_AUTH_SOCK=3D/tmp/ssh-U=
Dbrb11929/agent.11929; export PATH=3D/diskdata/dumas/archos_openembedded/bu=
ild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arch=
os_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_open=
embedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/t=
mp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:=
/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin;=
 git prune-packed
DEBUG: Running export HOME=3D/home/dumas; export SSH_AUTH_SOCK=3D/tmp/ssh-U=
Dbrb11929/agent.11929; export PATH=3D/diskdata/dumas/archos_openembedded/bu=
ild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arch=
os_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_open=
embedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/t=
mp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:=
/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin;=
 git pack-redundant --all | xargs -r rm
NOTE: Creating tarball of git repository
DEBUG: Running export HOME=3D/home/dumas; export SSH_AUTH_SOCK=3D/tmp/ssh-U=
Dbrb11929/agent.11929; export PATH=3D/diskdata/dumas/archos_openembedded/bu=
ild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arch=
os_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_open=
embedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/t=
mp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:=
/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin;=
 tar -czf /home/dumas/sources/git_www.denx.de.git.u-boot.git.tar.gz ./.git/=
*
ERROR: Task 9 (/diskdata/dumas/archos_openembedded/openembedded/recipes/u-b=
oot/u-boot_git.bb, do_fetch) failed with 256
ERROR: '/diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot/u-b=
oot_git.bb' failed
DEBUG: mkdirhier(/home/dumas/sources/git/www.denx.de.git.u-boot.git/1)
DEBUG: created /home/dumas/sources/git/www.denx.de.git.u-boot.git/1
DEBUG: Running export HOME=3D/home/dumas; export SSH_AUTH_SOCK=3D/tmp/ssh-U=
Dbrb11929/agent.11929; export PATH=3D/diskdata/dumas/archos_openembedded/bu=
ild/bin:/diskdata/dumas/archos_openembedded/openembedded/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/armv7a/bin:/diskdata/duma=
s/archos_openembedded/tmp/sysroots/i686-linux/usr/sbin:/diskdata/dumas/arch=
os_openembedded/tmp/sysroots/i686-linux/usr/bin:/diskdata/dumas/archos_open=
embedded/tmp/sysroots/i686-linux/sbin:/diskdata/dumas/archos_openembedded/t=
mp/sysroots/i686-linux//bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:=
/home/dumas/bin:/data/shared/common_code/bin:/data/dumas/dumas-patoune/bin;=
 git read-tree 1
NOTE: Task failed: Fetch failed: Unable to fetch URL git://www.denx.de/git/=
u-boot.git;protocol=3Dgit from any source.
NOTE: package u-boot-git-r75: task do_fetch: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /diskdata/dumas/archos_openembedded/openembedded/recipes/u-=
boot/u-boot_git.bb do_fetch failed
ERROR: Task 9 (/diskdata/dumas/archos_openembedded/openembedded/recipes/u-b=
oot/u-boot_git.bb, do_fetch) failed with 256
ERROR: '/diskdata/dumas/archos_openembedded/openembedded/recipes/u-boot/u-b=
oot_git.bb' failed

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="local.conf"

#
# OpenEmbedded local configuration file (sample)
#
# Please visit the Wiki at http://openembedded.org/ for more info.
#
#
# Be SURE to read this file in its entirety and the GettingStarted page on the
# wiki before proceeding.
#
# Once you have done that, remove the line at the end of this
# file and build away.
# 
# WARNING: lines starting with a space (' ') will result in parse failures.
# Remove '# ' from commented lines to activate them.
#
# NOTE: Do NOT use $HOME in your paths, BitBake does NOT expand ~ for you.  If you
# must have paths relative to your homedir use ${HOME} (note the {}'s there
# you MUST have them for the variable expansion to be done by BitBake).  Your
# paths should all be absolute paths (They should all start with a / after
# expansion.  Stuff like starting with ${HOME} or ${TOPDIR} is ok).

# Use this to specify where BitBake should place the downloaded sources into
DL_DIR = "${HOME}/sources"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES = "/path/to/openembedded/recipes/*/*.bb"
BBFILES = "/diskdata/dumas/archos_openembedded/openembedded/recipes/*/*.bb"

# Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
# This is a regular expression, so be sure to get your parenthesis balanced.
# BBMASK = "/(nonworking|obsolete)/"

# Comment this if your host distribution does not provide the
# help2man tool.
ASSUME_PROVIDED += "help2man-native"

# Uncomment this if your host distribution has recent enough Linux
# Kernel header files.  Utilities we use to generate certain types of
# target filesystems need somewhat recent header files.
# ASSUME_PROVIDED += "linux-libc-headers-native"

# Uncomment this if you want to use a prebuilt toolchain. You will need to
# provide packages for toolchain and additional libraries yourself. You also
# have to set PATH in your environment to make sure BitBake finds additional binaries.
# ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc virtual/libc"

# Uncomment this if you are building Linux 2.4 Embedix kernels.
# i.e. openzaurus-sa-2.4.18 and openzaurus-pxa-2.4.18 - and don't forget
# to rename the binaries as instructed in the Wiki.
# Most users do not need this anymore thankfully!
# ASSUME_PROVIDED += "virtual/arm-linux-gcc-2.95"

# Select between multiple alternative providers, if more than one is eligible.
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

# Uncomment this to specify where BitBake should create its temporary files.
# Note that a full build of everything in OpenEmbedded will take GigaBytes of hard
# disk space, so make sure to free enough space. The default TMPDIR is
# <build directory>/tmp
# Don't use symlinks in in the path to avoid problems
# TMPDIR = /usr/local/projects/oetmp

# Uncomment this to specify a machine to build for. See the conf directory
# for machines currently known to OpenEmbedded. This will automatically take care
# of TARGET_ARCH
# MACHINE = "c7x0"
MACHINE = "archos-gen8"

# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH = "arm"

# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you want
# to build a uclibc based system.
# Normally the DISTRO of your choosing will take care of this 
# TARGET_OS = "linux"
# TARGET_OS = "linux-uclibc"

# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although it no longer contain version number in the (file-)name
# openzaurus-unstable is a so called "versioned"  distro, i.e. they 
# explicitely select specific versions of various packages.
# Stay away from unversioned distros unless you really know what you are doing
# DISTRO = "angstrom-2008.1"
DISTRO = "angstrom-2010.x"

# Uncomment and modify the following lines if you wish to use an external
# binary toolchain, in this case one built by CodeSourcery.  The following
# example is for ARM and we set TOOLCHAIN_VENDOR to "-none" as the CodeSourcery
# ARM tools are arm-none-linux-gnueabi-$tool.  Other arches need different
# values here.  This assumes that the tools are already in the users PATH.
# TOOLCHAIN_VENDOR = "-none"
# TOOLCHAIN_TYPE = "external"
# TOOLCHAIN_BRAND = "csl"
# TOOLCHAIN_PATH = "/path/to/installed/copy/of/CodeSourcery/Sourcery_G++_Lite"

# This example is for the Angstrom ARM toolchain, that uses cross prefix of
# arm-angstrom-linux-gnueabi-$tool. This assumes that the tools are already
# in the users PATH.
# TOOLCHAIN_VENDOR = "-angstrom"
# TOOLCHAIN_TYPE = "external"
# TOOLCHAIN_BRAND = "angstrom"
# TOOLCHAIN_PATH = "/usr/local/angstrom/arm"

# Uncomment this if you want to use linux-headers from the linux-libc-headers
# recipe as opposed to those bundled with the external (csl/angstrom) toolchain
# PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"

# So far, angstrom.conf sets ENABLE_BINARY_LOCALE_GENERATION
# to generate binary locale packages at build time using qemu-native and
# thereby guarantee i18n support on all devices. If your build breaks on 
# qemu-native consider disabling ENABLE_BINARY_LOCALE_GENERATION (note that
# this breaks i18n on devices with less than 128MB RAM) or installing
# a working third-party qemu (e.g. provided by your distribution) and
# adding qemu-native to ASSUME_PROVIDED. Caveat emptor, since third-party
# qemus lack patches needed to work with various OE targets.
# ENABLE_BINARY_LOCALE_GENERATION = "0"
# ASSUME_PROVIDED += "qemu-native"

# If ENABLE_BINARY_LOCALE_GENERATION is set to "1", you can limit locales
# generated to the list provided by GLIBC_GENERATE_LOCALES. This is huge
# time-savior for developmental builds. Format: list of locale.encoding pairs
# with spaces as separators.
# GLIBC_GENERATE_LOCALES = "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"

# Uncomment this to select a particular major kernel version if the MACHINE setting
# supports more than one major kernel version. Currently this is suported by the
# following MACHINE types: poodle, tosa and simpad.
# MACHINE_KERNEL_VERSION = "2.6"

# Uncomment one of these to build packages during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT = "package_ipk"
# INHERIT = "package_tar"

# Add the required image file system types below. Valid are 
# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz), ext4(.gz|.bz2),
# squashfs, squashfs-lzma
IMAGE_FSTYPES = "jffs2 tar"

# Uncomment this if you want to keep the temporary rootfs
# directory, this can be useful during development.
# (Note that this rootfs is NOT usuable as NFS export.)
IMAGE_KEEPROOTFS = "1"

# Uncomment this to enable the use of ccache when building.  Due to
# the nature of our builds this is only helpful in cases when one
# is rebuilding a recipe or set of recipes, repeatedly.
# CCACHE = "${@bb.which(bb.data.getVar('PATH', d, 1), 'ccache') and 'ccache '}"

# Uncomment this to disable the parse cache (not recommended).
# CACHE = ""

# Uncomment this if you want BitBake to emit debugging output
# BBDEBUG = "yes"

# Use DEBUG_BUILD to build packages with DEBUG_OPTIMIZATION instead of
# FULL_OPTIMIZATION.
#
# DEBUG_BUILD = "1"

# If you want to have unstripped ready-to-debug binaries, set this to "no",
# although for debugging you can use automatically produced -dbg packages.
# If you need to have completely undebuggable builds, set this to "full",
# by default gnu.debuglink section is left in the binaries after stripping, so
# this might be useful if you want to have checksum-level binary consistency
# across successive builds.
# PACKAGE_STRIP = "no"

# Uncomment these to build a package such that you can use gprof to profile it.
# NOTE: This will only work with 'linux' targets, not
# 'linux-uclibc', as uClibc doesn't provide the necessary
# object files.  Also, don't build glibc itself with these
# flags, or it'll fail to build.
#
# PROFILE_OPTIMIZATION = "-pg"
# SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
# LDFLAGS =+ "-pg"

# Uncomment this to enable parallel make.
# This allows make to spawn mutliple processes to take advantage of multiple 
# processors. Useful on SMP machines. This may break some packages - we're
# in the process of marking these so let us know if you find any.
# PARALLEL_MAKE = "-j 4"

# Uncomment to run multiple bitbake threads in parallel.
# Bitbake can do multiple jobs in parallel: Its a good idea make use of 
# all available resources: e.g. to download sources while some other
# piece of software is compiled.
# BB_NUMBER_THREADS = "2"

# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS = "yes"

# Uncomment this if you want to install shared libraries directly under their SONAME,
# rather than installing as the full version and symlinking to the SONAME.
# PACKAGE_SNAP_LIB_SYMLINKS = "1"

# EDIT THIS FILE and then remove the line below before using!
# REMOVE_THIS_LINE:="${@bb.fatal('Read the comments in your conf/local.conf')}"

# INHERIT += "rm_work"

# BB_NUMBER_THREADS = "7"

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="archos-gen8.conf"

#@TYPE: Machine
#@NAME: OMAP3 based Archos Gen 8
#@DESCRIPTION: Machine configuration for the Archos Gen8 devices

TARGET_ARCH = "arm"
require conf/machine/include/omap3.inc

#ASSUME_PROVIDED += "u-boot"

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
XSERVER = "xserver-xorg \
           xf86-input-evdev \
           xf86-input-mouse \
           xf86-input-tslib \
           xf86-video-omapfb \
           xf86-input-keyboard"

#What is the correct one, both seem in use?
MACHINE_GUI_CLASS = "bigscreen"
GUI_MACHINE_CLASS = "bigscreen"

#1024 * 600 Widescreen
MACHINE_DISPLAY_WIDTH_PIXELS = "1024"
MACHINE_DISPLAY_HEIGHT_PIXELS = "600"

KERNEL_IMAGETYPE = "zImage"

PREFERRED_PROVIDER_virtual/kernel = "linux-omap-archos"

# Ship all kernel modules
MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"

IMAGE_FSTYPES += "tar.bz2"
EXTRA_IMAGECMD_jffs2 = "-lnp "

SERIAL_CONSOLE = "115200 ttyS2"

MACHINE_FEATURES = "kernel26 apm alsa bluetooth usbgadget usbhost keyboard vfat ext2 screen touchscreen wifi"


--PEIAKu/WMn1b1Hv9--
