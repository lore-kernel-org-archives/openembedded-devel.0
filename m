Received: from [204.187.63.106] (helo=mail.evertz.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rlott@evertz.com>) id 1LiCn9-0003MX-LG
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 20:11:36 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 13 Mar 2009 15:11:12 -0400
Message-ID: <069B6B31F6201B4389D7EEB9AD827BCA05005FAB@otis.burlington.evertz.tv>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: SIP recipe can't find Qt4 package in x86 build
Thread-Index: AcmkD3lFiqCPPSi3QgSYtvg7rVxNRw==
From: "Rodney Lott" <rlott@evertz.com>
To: "OE-Development Mailing List \(E-mail\)"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: SIP recipe can't find Qt4 package in x86 build
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
X-List-Received-Date: Fri, 13 Mar 2009 19:11:38 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello.

I am new to OE and I couldn't find anything in the devel mailing list =
archives for Feb and March, so I wanted to ask about the following =
issue.

I am configured as follows:

OE Build Configuration:
BB_VERSION        =3D "1.8.13"
METADATA_BRANCH   =3D "<unknown>"
METADATA_REVISION =3D "<unknown>"
TARGET_ARCH       =3D "i486"
TARGET_OS         =3D "linux"
MACHINE           =3D "x86"
DISTRO            =3D "minimal"
DISTRO_VERSION    =3D ".dev-snapshot-20090313"
TARGET_FPU        =3D ""

I am using the following git revision:

commit 12b093a681c4e011062538e4f2c582630997855f
Author: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
Date:   Sun Feb 8 16:42:47 2009 +0100

I am not using the latest because this was what I started with and I =
don't want to pull the latest yet unless it is necessary.

Here's the problem I am having.  I have an image recipe that basically =
contains the following:

require packages/images/minimal-image.bb

IMAGE_INSTALL +=3D "cron"
IMAGE_INSTALL +=3D "ntp"

export IMAGE_BASENAME =3D "cp2210e"

If I build with this, everything is peachy and I get my minimalist image =
with ntp and cron installed.  I then add more IMAGE_INSTALL lines after =
the ntp line:

IMAGE_INSTALL +=3D "python"
IMAGE_INSTALL +=3D "python-twisted"
IMAGE_INSTALL +=3D "python-pyqt"

The build goes on fine for a while and it stops at this:

NOTE: Running task 765 of 1189 (ID: 532, =
/home/rlott/openembedded.git/packages/sip/sip-native_4.7.7.bb, =
do_configure)
NOTE: package sip-native-4.7.7: started
NOTE: package sip-native-4.7.7-ml0: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows =
(/home/rlott/src/oe.cp2210e/tmp/work/i686-linux/sip-native-4.7.7-ml0/temp=
/log.do_configure.30876)
| NOTE: using qmake spec in =
/home/rlott/src/oe.cp2210e/tmp/cross/i686/share/qt4/mkspecs/linux-oe-g++,=
 using profiles ''
| NOTE: qmake postvar substitution:  =
DESTDIR=3D/home/rlott/src/oe.cp2210e/tmp/work/i686-linux/sip-native-4.7.7=
-ml0/sip-4.7.7/sipgen CONFIG=3Dconsole
| Failure to read QMAKESPEC conf file =
/home/rlott/src/oe.cp2210e/tmp/cross/i686/share/qt4/mkspecs/linux-oe-g++/=
qmake.conf.
| Error processing project file: sipgen.pro
| FATAL: Error calling =
/home/rlott/src/oe.cp2210e/tmp/staging/i686-linux/usr/bin/qmake2 on =
sipgen.pro
NOTE: Task failed: =
/home/rlott/src/oe.cp2210e/tmp/work/i686-linux/sip-native-4.7.7-ml0/temp/=
log.do_configure.30876
NOTE: package sip-native-4.7.7-ml0: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package sip-native-4.7.7: failed
ERROR: Build of =
/home/rlott/openembedded.git/packages/sip/sip-native_4.7.7.bb =
do_configure failed
ERROR: Task 532 =
(/home/rlott/openembedded.git/packages/sip/sip-native_4.7.7.bb, =
do_configure) failed
NOTE: Tasks Summary: Attempted 764 tasks of which 309 didn't need to be =
rerun and 1 failed.
ERROR: '/home/rlott/openembedded.git/packages/sip/sip-native_4.7.7.bb' =
failed
NOTE: build 200903121439: completed

The qmake spec file is located in =
/home/rlott/src/oe.cp2210e/tmp/cross/i486/share/qt4/mkspecs/linux-oe-g++/=
qmake.conf, not the i686 version of this.  So, it appears that either =
qt4-x11-free is not putting its stuff in the properly staging location =
or that sip-native isn't resolving the correct version of Qt4 to use. =20

So, my question is how do I in my local.conf (or somewhere in my local =
collection space) tell it to use i486 or i686 and thus have the paths =
consistent?

Thanks.

Rodney Lott



