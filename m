Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1PxK9l-0002tJ-B8
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 15:14:29 +0100
Received: from [192.168.1.178] (79.50.207.190) by smtp205.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4D0D003806EE5662 for openembedded-devel@lists.openembedded.org;
	Wed, 9 Mar 2011 15:12:54 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 09 Mar 2011 15:12:34 +0100
Message-ID: <1299679954.22332.8.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: fennec build problem
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
X-List-Received-Date: Wed, 09 Mar 2011 14:14:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,
I never succeeded to build Fennec because I never had the time and the
will to fix it (the Mozilla build system seem complicated...), but
dcordes_ on #oe On Freenode on irc really wanted  fennec.
So I decided to give a try because it didn't compile for him for another
reason.

Here is the build error:
| make[5]: *** No rule to make target `-lgconf-2', needed by
`libmozgnome.so'.  Stop.
| make[5]: *** Waiting for unfinished jobs....
[...]
| make[5]: Leaving directory
`/home/gnutoo/embedded/oe/oetmps/nokia900/work/armv7a-oe-linux-gnueabi/fennec-1_2.0+4.0b3pre-r0/mozilla-central/objdir/xulrunner/toolkit/system/gnome'
| make[4]: *** [libs_tier_platform] Error 2

here's a grep for -lgconf-2:
gnutoo@gnutoo-laptop:~/embedded/oe/oetmps/nokia900/work/armv7a-oe-linux-gnueabi/fennec-1_2.0+4.0b3pre-r0/mozilla-central/objdir/xulrunner$ grep "\-lgconf-2" -r *

config/autoconf.mk:MOZ_GNOMEUI_LIBS = -pthread -lgnomeui-2 -lSM -lICE
-lbonoboui-2 -lgnomevfs-2 -lgnomecanvas-2 -lgnome-2 -lpopt -lbonobo-2
-lbonobo-activation -lORBit-2 -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0
-latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0
-lcairo -lpango-1.0 -lfreetype -lfontconfig -lgconf-2 -lgmodule-2.0
-lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0

config/autoconf.mk:MOZ_GNOMEVFS_LIBS = -pthread -lgnomevfs-2 -lgconf-2
-lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0

config/autoconf.mk:MOZ_GCONF_LIBS = -pthread -lgconf-2 -lgobject-2.0
-lgthread-2.0 -lrt -lglib-2.0

config.status:s%@MOZ_GNOMEVFS_LIBS@%-pthread -lgnomevfs-2 -lgconf-2
-lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0%g

config.status:s%@MOZ_GCONF_LIBS@%-pthread -lgconf-2 -lgobject-2.0
-lgthread-2.0 -lrt -lglib-2.0%g

config.status:s%@MOZ_GNOMEUI_LIBS@%-pthread -lgnomeui-2 -lSM -lICE
-lbonoboui-2 -lgnomevfs-2 -lgnomecanvas-2 -lgnome-2 -lpopt -lbonobo-2
-lbonobo-activation -lORBit-2 -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0
-latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0
-lcairo -lpango-1.0 -lfreetype -lfontconfig -lgconf-2 -lgmodule-2.0
-lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0%g

Note that it need a modified autoconf.inc, that I will send for
review(as it's core).

Denis



