Received: from [82.71.204.226] (helo=cpanelsmarthost2.zen.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris.sykes@nextstepsolutions.co.uk>)
	id 1Lu1aK-0005Rp-Lv for Openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 11:39:16 +0200
Received: from [82.71.204.21] (helo=zencphosting12.zen.co.uk)
	by cpanelsmarthost2.zen.co.uk with esmtp (Exim 4.63)
	(envelope-from <chris.sykes@nextstepsolutions.co.uk>)
	id 1Lu1Wg-00067S-M4 for Openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 09:35:26 +0000
Received: from sigsegv.plus.com ([212.159.101.170] helo=[192.168.250.101])
	by zencphosting12.zen.co.uk with esmtpa (Exim 4.69)
	(envelope-from <chris.sykes@nextstepsolutions.co.uk>)
	id 1Lu1Wg-0004yu-Fm for Openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 10:35:26 +0100
From: Chris Sykes <chris.sykes@nextstepsolutions.co.uk>
To: Openembedded-devel@lists.openembedded.org
Organization: Next Step Solutions
Date: Wed, 15 Apr 2009 10:35:25 +0100
Message-Id: <1239788125.3467.8.camel@x60.spackhandychoptubes.co.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - zencphosting12.zen.co.uk
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - nextstepsolutions.co.uk
X-SA-Exim-Connect-IP: 82.71.204.226
X-SA-Exim-Mail-From: chris.sykes@nextstepsolutions.co.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: kexec-tools-static build failue for zaurus collie
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
X-List-Received-Date: Wed, 15 Apr 2009 09:39:16 -0000
X-Groupsio-MsgNum: 9366
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XHld17GnAwCc4STtZC5v"

--=-XHld17GnAwCc4STtZC5v
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I'm currently failing in my attempts to get OE built for my Zaurus
collie.  I'm using an up-to-date git checkout on the stable 2009 branch.

OE Build Configuration:
BB_VERSION        =3D "1.8.12"
METADATA_BRANCH   =3D "stable2009"
METADATA_REVISION =3D "272ae318b03bcd062f8b43258ce54a2cd96b9f45"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux"
MACHINE           =3D "collie"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2009.X-test-20090415"
TARGET_FPU        =3D "soft"

Interestingly (or perhaps not), the kexec-tools build seems to go just
fine, it's just kexec-tools-static that has a problem.

It seems to be an include path problem as 'mach/memory.h' is not found.
Here's the start of the failed build log:
| arm-angstrom-linux-klcc -Wall -g -fno-strict-aliasing -I./include
-I./util_lib/include -DVERSION=3D'"1.101"' -DRELEASE_DATE=3D'"15 February
2005"' -DPACKAGE_NAME=3D\"\" -DPACKAGE_TARNAME=3D\"\" -DPACKAGE_VERSION=3D\=
"\"
-DPACKAGE_STRING=3D\"\" -DPACKAGE_BUGREPORT=3D\"\"  -Ikexec/arch/arm/includ=
e
-o /home/csykes/projects/cappuccino/zaurus/build/tmp/work/arm-oabi-angstrom=
-linux/kexec-tools-static-1.101-r4/kexec-tools-1.101/objdir-arm-angstrom-li=
nux/kexec/arch/arm/kexec-zImage-arm.o -c kexec/arch/arm/kexec-zImage-arm.c
| In file included
from /home/csykes/projects/cappuccino/zaurus/build/tmp/staging/arm-oabi-ang=
strom-linux/lib/klibc/include/asm/page.h:183,
|                  from kexec/arch/arm/kexec-zImage-arm.c:18:
| /home/csykes/projects/cappuccino/zaurus/build/tmp/staging/arm-oabi-angstr=
om-linux/lib/klibc/include/asm/memory.h:18:25: error: mach/memory.h: No suc=
h file or directory
| In file included
from /home/csykes/projects/cappuccino/zaurus/build/tmp/staging/arm-oabi-ang=
strom-linux/lib/klibc/include/asm/page.h:183,
|                  from kexec/arch/arm/kexec-zImage-arm.c:18:
| /home/csykes/projects/cappuccino/zaurus/build/tmp/staging/arm-oabi-angstr=
om-linux/lib/klibc/include/asm/memory.h: In function 'virt_to_phys':
| /home/csykes/projects/cappuccino/zaurus/build/tmp/staging/arm-oabi-angstr=
om-linux/lib/klibc/include/asm/memory.h:162: error: 'CONFIG_DRAM_BASE' unde=
clared (first use in this function)


--=20
Chris Sykes

Next Step Solutions Limited
Email: chris.sykes@nextstepsolutions.co.uk
Tel: 0870 3146413

--=-XHld17GnAwCc4STtZC5v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQBJ5apZRhxfZg8kHTARAmoYAJ9kaCS31tlkbDmMUH8L7YcSpzc0eACcCXif
8hhHvRqSzTtUb6T23FQpDrI=
=lVpX
-----END PGP SIGNATURE-----

--=-XHld17GnAwCc4STtZC5v--
