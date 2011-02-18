Received: from snt0-omc4-s12.snt0.hotmail.com ([65.55.90.215])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <waswart@hotmail.com>) id 1PqZ88-0005LA-2P
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 23:48:52 +0100
Received: from SNT125-W51 ([65.55.90.201]) by snt0-omc4-s12.snt0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 18 Feb 2011 14:46:32 -0800
Message-ID: <SNT125-W513CCBD0BD604EFC3F9B4CBAD40@phx.gbl>
X-Originating-IP: [122.59.247.98]
From: Willem Swart <waswart@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Feb 2011 14:46:31 -0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Feb 2011 22:46:32.0721 (UTC)
	FILETIME=[B0811810:01CBCFBD]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbake unifdef quilt-native failing
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
X-List-Received-Date: Fri, 18 Feb 2011 22:48:52 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi=2C
I would appreciate any advice to get the following sorted. It happens even =
with a clean OE directory. I have also deleted all the files in the sources=
/downloads directory so there are not stale downloads/checksum files.
Any help would be appreciated.
ThanksWillem
$bitbake virtual/kernel
Build Configuration:BB_VERSION        =3D "1.10.2"METADATA_BRANCH   =3D "or=
g.openembedded.dev"METADATA_REVISION =3D "ee63bd5"TARGET_ARCH       =3D "ar=
m"TARGET_OS         =3D "linux-gnueabi"MACHINE           =3D "beagleboard"D=
ISTRO            =3D "angstrom"DISTRO_VERSION    =3D "2010.7-test-20110218"=
TARGET_FPU        =3D "hard"
NOTE: Resolving any missing task queue dependenciesNOTE: Preparing runqueue=
NOTE: Executing runqueueNOTE: Running task 2 of 1093 (ID: 34=2C /home/wass/=
comp/dev/oe/setup-scripts/sources/openembedded/recipes/quilt/quilt-native_0=
.48.bb=2C do_fetch)NOTE: Running task 4 of 1093 (ID: 757=2C virtual:native:=
/home/wass/comp/dev/oe/setup-scripts/sources/openembedded/recipes/unifdef/u=
nifdef_2.4.bb=2C do_fetch)NOTE: package quilt-native-0.48-r7.1: task do_fet=
ch: StartedFATAL: quilt-native-0.48: http://download.savannah.gnu.org/relea=
ses/quilt/quilt-0.48.tar.gz cannot check archive integrityERROR: Function b=
ase_do_fetch failedERROR: TaskFailed event exception=2C abortingERROR: Buil=
d of /home/wass/comp/dev/oe/setup-scripts/sources/openembedded/recipes/quil=
t/quilt-native_0.48.bb do_fetch failedNOTE: package unifdef-native-2.4-0: t=
ask do_fetch: StartedERROR: Task 34 (/home/wass/comp/dev/oe/setup-scripts/s=
ources/openembedded/recipes/quilt/quilt-native_0.48.bb=2C do_fetch) failed =
with exit code 1FATAL: unifdef-native-2.4: http://dotat.at/prog/unifdef/uni=
fdef-2.4.tar.gz cannot check archive integrityERROR: Function base_do_fetch=
 failedERROR: TaskFailed event exception=2C abortingERROR: Build of virtual=
:native:/home/wass/comp/dev/oe/setup-scripts/sources/openembedded/recipes/u=
nifdef/unifdef_2.4.bb do_fetch failedNOTE: The checksums for '/home/wass/co=
mp/dev/oe/setup-scripts/sources/downloads/quilt-0.48.tar.gz' did not match.=
Expected MD5: 'f77adda60039ffa753f3c584a286f12b' and Got: '62cb60923a263866=
595592c06951ef03'Expected SHA256: '73fd760d3b5cbf06417576591dc37d67380d1893=
92db9000c21b7cbebee49ffc' and Got: '620c9208a5912480e5995f068bd9aec13321c08=
115b248b97c358dccd3d98ea9'NOTE: Your checksums:SRC_URI[md5sum] =3D "62cb609=
23a263866595592c06951ef03"SRC_URI[sha256sum] =3D "620c9208a5912480e5995f068=
bd9aec13321c08115b248b97c358dccd3d98ea9"
FATAL: quilt-native-0.48: http://download.savannah.gnu.org/releases/quilt/q=
uilt-0.48.tar.gz cannot check archive integrityERROR: Task 757 (virtual:nat=
ive:/home/wass/comp/dev/oe/setup-scripts/sources/openembedded/recipes/unifd=
ef/unifdef_2.4.bb=2C do_fetch) failed with exit code 1ERROR: '/home/wass/co=
mp/dev/oe/setup-scripts/sources/openembedded/recipes/quilt/quilt-native_0.4=
8.bb' failedERROR: 'virtual:native:/home/wass/comp/dev/oe/setup-scripts/sou=
rces/openembedded/recipes/unifdef/unifdef_2.4.bb' failed
 		 	   		  =

