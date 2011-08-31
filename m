Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QyeG4-0006QV-MD
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 08:26:44 +0200
Received: (qmail invoked by alias); 31 Aug 2011 06:21:50 -0000
Received: from p5B0A22AC.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.34.172]
	by mail.gmx.net (mp060) with SMTP; 31 Aug 2011 08:21:50 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19SAAgrdd1S/J6o5k3Kzhs+pUz2KEmGrA2ZtHFq5J
	MKa5p+bCnPT3l5
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 08:25:16 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201108310825.16407.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: meta-oe: midori build fails with linker error
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
X-List-Received-Date: Wed, 31 Aug 2011 06:26:44 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

last night I tried to build midori and get complaining linker:

| [ 72/114] cc_link: _build_/default/extensions/history-list_13.o -> 
_build_/default/extensions/libhistory-list.so
| [ 73/114] cc_link: _build_/default/extensions/statusbar-features_14.o -> 
_build_/default/extensions/libstatusbar-features.so
| [ 74/114] cc_link: _build_/default/extensions/feed-panel/main_15.o 
_build_/default/extensions/feed-panel/feed-rss_15.o 
_build_/default/extensions/feed-panel/feed-atom_15.o 
_build_/default/extensions/feed-panel/feed-parse_15.o 
_build_/default/extensions/feed-panel/feed-panel_15.o -> 
_build_/default/extensions/libfeed-panel.so
| [ 75/114] cc_link: _build_/default/extensions/colorful-tabs_16.o -> 
_build_/default/extensions/libcolorful-tabs.so
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-
angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/ld: 
default/midori/libmidori-core.a(sokoke_1.o): undefined reference to symbol 
'JSContextGetGlobalObject'
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-
angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/ld: note: 
'JSContextGetGlobalObject' is defined in DSO /home/Superandy/tmp/oe-core-
eglibc/sysroots/overo/usr/lib/libjavascriptcoregtk-1.0.so.0 so try adding it to 
the linker command line
| /home/Superandy/tmp/oe-core-
eglibc/sysroots/overo/usr/lib/libjavascriptcoregtk-1.0.so.0: could not read 
symbols: Invalid operation
| collect2: ld returned 1 exit status
| Waf: Leaving directory `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-
angstrom-linux-gnueabi/midori-0.3.6-r1/midori-0.3.6/_build_'
| Build failed:  -> task failed (err #1):
| 	{task: cc_link main_2.o -> midori}
| make: *** [all] Error 1
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see /home/Superandy/tmp/oe-core-
eglibc/work/armv7a-angstrom-linux-gnueabi/midori-0.3.6-
r1/temp/log.do_compile.18897 for further information)
NOTE: package midori-0.3.6-r1: task do_compile: Failed
ERROR: Task 393 (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-
oe/recipes-connectivity/midori/midori_0.3.6.bb, do_compile) failed with exit 
code '1'

Right now I haven't much time to take care - any ideas / volunteers?

Andreas


