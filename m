Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QP7C9-0007xH-3X
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 08:03:49 +0200
Received: from STOEXMBXC03.domain01.net
	([fe80:0000:0000:0000:99c4:3913:164.170.217.90]) by
	stoexhub02.domain01.net
	([10.12.10.2]) with mapi; Wed, 25 May 2011 08:00:46 +0200
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 25 May 2011 08:00:45 +0200
Thread-Topic: kbd and console-tools collision when using systemd
Thread-Index: AQHMGqEWRh23y3NpkEyLUcwODaS5Mg==
Message-ID: <AEF4F94AE6BD724F91B503AC1AFED2392C5E8391CF@STOEXMBXC03.domain01.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: kbd and console-tools collision when using systemd
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
X-List-Received-Date: Wed, 25 May 2011 06:03:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We have recently switched our local distro to use systemd for the init-proc=
ess. This works fine for our HW-target (apart from some non-optimal configu=
ration, but that is something we're looking into). Our HW-target is based o=
n the at91sam9g20.

However, sometime later, we tried to rebuild our distro for qemuarm, to eas=
e the work on some of the systemd configuration. Qemuarm (just as any other=
 Qemu-target) adds keyboard to the machine-features, and task-boot.bb trans=
lates this into the inclusion of the keymaps package, which in turns draws =
in console-tools. This is where we are getting problems.

Local distro uses task-boot.bb
Qemu -> keymps -> RDEPENDS console-tools
Systemd -> RRECOMMENDS kbd

This leads to lots of clashes with e.g. usr/bin/dumpkeys, usr/bin/unicode_s=
top etc.
Currently we have solved this by using a local copy of task-boot.bb in one =
of our layers, which lets the machine feature keyboard include kbd-keymaps =
instead of keymaps.

Is there some better/simpler way (maintainence wise) to solve the problem? =
Or is the local task-boot.bb the best way to handle it? (It's always better=
 to try to reduce the amount of local copies, to be able to benefit from th=
e community, and to easier contribute back).

Is there some way we could make such a change using e.g. a .bbappend?=20

Regards,
Anders

--=20
Anders Darander
ChargeStorm AB               =


