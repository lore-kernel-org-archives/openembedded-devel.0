Received: from [195.54.101.72] (helo=proxy2.bredband.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LHYun-0003ej-CK
	for openembedded-devel@openembedded.org; Tue, 30 Dec 2008 08:21:21 +0100
Received: from ironport2.bredband.com (195.54.101.122) by proxy2.bredband.net
	(7.3.127)
	id 494BF3020027045B for openembedded-devel@openembedded.org;
	Tue, 30 Dec 2008 08:15:52 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApANALpZWUlT4zhBPGdsb2JhbAAIk2IBAQEBNagzWIR5i0GGRA
Received: from c-4138e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.221]) ([83.227.56.65])
	by ironport2.bredband.com with ESMTP; 30 Dec 2008 08:15:52 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@openembedded.org
Organization: Atmel Nordic AB
Date: Tue, 30 Dec 2008 07:15:55 +0100
Message-Id: <1230617755.15416.11.camel@linux-yrgm.site>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: =?UTF-8?B?b3BrZy9vcGtnLW5hdGl2ZV9zdm4uYmI6ICLvu79zdm4gY28gLXIgMTk0CWh0dHA6Ly9zdm4ub3Blbm1va28ub3JnL3RydW5rL3NyYy90YXJnZXQvL29wa2dAMTk0IiBmYWlscyE=?=
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
X-List-Received-Date: Tue, 30 Dec 2008 07:21:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I downloaded a new distribution during this week and=20
got the following error:


> NOTE: Running task 2855 of 4901 (ID: 44, /home/ulf/projects/OE/openembedd=
ed/packages/opkg/opkg-native_svn.bb, do_setscene)
> NOTE: package opkg-native-0.1.4+svnr194: started
> NOTE: package opkg-native-0.1.4+svnr194-r2: task do_setscene: started
> NOTE: Checking if staging package installed
> NOTE: No. Manually removing any installed files
> NOTE: package opkg-native-0.1.4+svnr194-r2: task do_setscene: completed
> NOTE: package opkg-native-0.1.4+svnr194: completed
> NOTE: Running task 2856 of 4901 (ID: 45, /home/ulf/projects/OE/openembedd=
ed/packages/opkg/opkg-native_svn.bb, do_fetch)
> NOTE: package opkg-native-0.1.4+svnr194: started
> NOTE: package opkg-native-0.1.4+svnr194-r2: task do_fetch: started
> NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/opkg_sv=
n.openmoko.org_.trunk.src.target._194_.tar.gz
> --2008-12-30 00:38:10--  http://www.angstrom-distribution.org/unstable/so=
urces/opkg_svn.openmoko.org_.trunk.src.target._194_.tar.gz
> Resolving www.angstrom-distribution.org... 85.214.40.226
> Connecting to www.angstrom-distribution.org|85.214.40.226|:80... connecte=
d.
> HTTP request sent, awaiting response... 404 Not Found
> 2008-12-30 00:38:10 ERROR 404: Not Found.
>=20
> NOTE: Fetch ;module=3Dopkg;proto=3Dhttp
> svn: URL 'http://svn.openmoko.org/trunk/src/target/opkg' doesn't exist
> NOTE: Task failed: Fetch failed: Fetch command export SSH_AUTH_SOCK=3D/tm=
p/keyring-vcy2cd/ssh; export PATH=3D/home/ulf/projects/OE_atmel/build/tmp/s=
taging/i686-linux/usr/bin:/home/ulf/projects/OE_atmel/build/tmp/staging/i68=
6-linux/usr/bin/i686-linux:/home/ulf/projects/OE_atmel/build/tmp/staging/i6=
86-linux/usr/sbin:/home/ulf/projects/OE_atmel/build/tmp/staging/i686-linux/=
usr/bin:/home/ulf/projects/OE_atmel/build/tmp/cross/i686/bin:/home/ulf/proj=
ects/OE_atmel/build/tmp/staging/i686-linux/sbin:/home/ulf/projects/OE_atmel=
/build/tmp/staging/i686-linux/bin:/home/ulf/projects/OE_atmel/bitbake/bin:/=
home/ulf/projects/OE/bitbake/bin:/home/ulf/bin:/usr/local/bin:/usr/bin:/bin=
:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr=
/lib/mit/sbin:/usr/lib/qt3/bin:/home/ulf/projects/Buildroot/20081221/buildr=
oot-arm/build_arm/staging_dir/usr/bin:/home/ulf/projects/Buildroot/20081221=
/buildroot-arm/build_arm/staging_dir/usr/bin; /usr/bin/env svn co -r 194 ht=
tp://svn.openmoko.org/trunk/src/target//opkg@194 opkg failed with signal 1,=
 output:
> svn: URL 'http://svn.openmoko.org/trunk/src/target/opkg' doesn't exist
>=20
> NOTE: package opkg-native-0.1.4+svnr194-r2: task do_fetch: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package opkg-native-0.1.4+svnr194: failed
> ERROR: Build of /home/ulf/projects/OE/openembedded/packages/opkg/opkg-nat=
ive_svn.bb do_fetch failed
> ERROR: Task 45 (/home/ulf/projects/OE/openembedded/packages/opkg/opkg-nat=
ive_svn.bb, do_fetch) failed
> NOTE: Tasks Summary: Attempted 2855 tasks of which 0 didn't need to be re=
run and 1 failed.
> ERROR: '/home/ulf/projects/OE/openembedded/packages/opkg/opkg-native_svn.=
bb' failed
> NOTE: build 200812291602: completed


I.E:
"=EF=BB=BFsvn co -r 194 http://svn.openmoko.org/trunk/src/target//opkg@194"
failed.

/conf/distro/include/sane-srcrevs.inc contains:

SRCREV_pn-opkg ?=3D "194"
SRCREV_pn-opkg-native ?=3D "194"
SRCREV_pn-opkg-sdk ?=3D "192"
SRCREV_pn-opkg-utils ?=3D "4578"
SRCREV_pn-opkg-utils-native ?=3D "4595"

so the svn download tries version 194.

If you do an svn without specifying the revision,
then you download revision 4880.
A lot has happened since then, and I guess Rev 194
has disappeared.

Has tried 4880 and the build seems to continue
past this points, but I would like to know
if there is a reason to use another revision.


Best Regards
Ulf Samuelsson



