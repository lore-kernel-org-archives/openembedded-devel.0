Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1Oh8gn-0008OO-A6
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 00:13:42 +0200
Received: from US194MX010.tycoelectronics.net (163.241.185.53) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server (TLS) id 8.1.393.1; Thu, 5 Aug 2010 18:13:04 -0400
Received: from us194mx002.tycoelectronics.net ([163.241.202.108]) by
	US194MX010.tycoelectronics.net ([::1]) with mapi;
	Thu, 5 Aug 2010 18:13:04 -0400
From: "Snyder, Jay A" <jay.snyder@tycoelectronics.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Aug 2010 18:13:03 -0400
Thread-Topic: xf86-input-mouse -- dependency problem
Thread-Index: AQHLNOtfIuKKjVglRU+Mvk72YykHIQ==
Message-ID: <B3E33FFB737EB346B7569E8F883B89E320C6F92BBA@us194mx002.tycoelectronics.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xf86-input-mouse -- dependency problem
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
X-List-Received-Date: Thu, 05 Aug 2010 22:13:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I need to build xf86-input-mouse and xf86-input-keyboard to actually use a =
mouse and keyboard with my target


I did this before with a 2009-dec-04 git pull that used xserver-xorg 1.6.1

Now with the pull I did on July 29, that has xserver-xorg 1.7.4, I get the =
following:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

checking for XORG... configure: error: Package requirements (xorg-server >=
=3D 1.5.99.901 xproto  randrproto) were not met:
|=20
| Requested 'xorg-server >=3D 1.5.99.901' but version of xorg-server is 1.4=
.0.90
|=20
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|=20
| Alternatively, you may set the environment variables XORG_CFLAGS
| and XORG_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|=20
NOTE: Task failed: /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/x=
f86-input-mouse-1_1.5.0-r14.1/temp/log.do_configure.16587
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/oe/2010-07-29/openembedded/recipes/xorg-driver/xf86-i=
nput-mouse_1.5.0.bb do_configure failed
ERROR: Task 7 (/home/oe/2010-07-29/openembedded/recipes/xorg-driver/xf86-in=
put-mouse_1.5.0.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 2896 tasks of which 2896 didn't need to be r=
erun and 1 failed.
ERROR: '/home/oe/2010-07-29/openembedded/recipes/xorg-driver/xf86-input-mou=
se_1.5.0.bb' failed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

When I try to build xf86-input-keyboard.    It appears to get the version i=
nfo from xserver-kdrive (which is 1.4.0.90).     I thought kdrive was depre=
cated?
Why does it still get built?

I have the PREFERRED_PROVIDER stuff set up to favor xorg, but kdrive still =
gets built.


HELP!?!?!?

Thanks,
Jay
 =


