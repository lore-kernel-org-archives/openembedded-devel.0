Received: from [198.175.154.225] (helo=us194mx04.tycoelectronics.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john.charlton@tycoelectronics.com>)
	id 1LXyFh-0000Rx-PM for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 14:38:45 +0100
Received: from us194mx11.tycoelectronics.net ([163.241.185.106]) by
	us194mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.2499); 
	Fri, 13 Feb 2009 08:37:05 -0500
Received: from us194mx07.tycoelectronics.net ([163.241.185.38]) by
	us194mx11.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Fri, 13 Feb 2009 08:37:05 -0500
Received: from us194mx002.tycoelectronics.net (163.241.202.108) by
	us194mx07.tycoelectronics.net (163.241.185.38) with Microsoft SMTP
	Server (TLS) id 8.1.336.0; Fri, 13 Feb 2009 08:37:04 -0500
Received: from us194mx002.tycoelectronics.net ([163.241.202.108]) by
	us194mx002.tycoelectronics.net ([163.241.202.108]) with mapi;
	Fri, 13 Feb 2009 08:37:04 -0500
From: "Charlton, John" <john.charlton@tycoelectronics.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Feb 2009 08:37:02 -0500
Thread-Topic: Devshell X display error
Thread-Index: AcmN4CdY9xDplUOAS8mF+YjnvoqJng==
Message-ID: <CF7FB0793253794F9F45991443E5FE20050080FC56@us194mx002.tycoelectronics.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Feb 2009 13:37:05.0054 (UTC)
	FILETIME=[28A013E0:01C98DE0]
Subject: Devshell X display error
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
X-List-Received-Date: Fri, 13 Feb 2009 13:38:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am getting the following error when I attempt to start a gnome-terminal d=
evshell as follows:

bitbake -c devshell virtual/kernel

This was working the last time I used it with org.openembedded.stable and t=
he angstrom.2007.1 distro for i686-generic but with the following configura=
tion I always get the 'X11 connection rejected because of wrong authenticat=
ion.' error and it doesn't display the gnome-terminal window.  If I run gno=
me-terminal from the command line it works correctly as do other x window a=
pplications.


OE Build Configuration:
BB_VERSION        =3D "1.8.13"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "b935d0e40c9bd24294d13bfbde0cbdcd14671e0c"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "at91sam9261ek"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2009.X-test-20090212"
TARGET_FPU        =3D "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 32 of 32 (ID: 4, /home/us075929/projects/oe/openembedded=
/packages/linux/linux_2.6.20.bb, do_devshell)
NOTE: package linux-2.6.20: started
NOTE: package linux-2.6.20-r8: task do_devshell: started
X11 connection rejected because of wrong authentication.
ERROR: function do_devshell failed

--John


