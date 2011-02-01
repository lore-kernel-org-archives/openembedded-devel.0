Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PkLZC-0008Hf-Sb
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 20:07:06 +0100
Received: (qmail invoked by alias); 01 Feb 2011 19:06:08 -0000
Received: from p4FE0FFDF.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.255.223]
	by mail.gmx.net (mp036) with SMTP; 01 Feb 2011 20:06:08 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18dzN5N/wUdMM4CQqiz0TnxusBhtu8h4jV0gLocb5
	n47BGufwz2Wmiu
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Feb 2011 20:02:49 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
MIME-Version: 1.0
Message-Id: <201102012002.49849.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: latest clutter-recipe
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
X-List-Received-Date: Tue, 01 Feb 2011 19:07:07 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

it surprised me to see that Koen committed a new recipe for clutter 1.4.2. As you might know I was also working on this and sent some pre-release version here of this (1). What makes me not running in happy mode:

- Many of my previous patches were rejected first because of some commit message. Here we read 'clutter: add 1.4.2' - cool. Which tests were performed?

- the recipe breaks clutter-gst:
| checking for CLUTTER_GST... configure: error: Package requirements (clutter-1.0 < 1.3.0 gio-2.0) were not met:
| 
| Requested 'clutter-1.0 < 1.3.0' but version of Clutter is 1.4.2
I prepared clutter-gst 1.3.4 but I am tired preparing commit messages..

- the recipe breaks clutter-gtk :
| NOTE: make -j 4
| make  all-recursive
| make[1]: Entering directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8'
| Making all in build
| make[2]: Entering directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/build'
| Making all in autotools
| make[3]: Entering directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/build/autotools'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/build/autotools'
| make[3]: Entering directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/build'
| make[3]: Nothing to be done for `all-am'.
| make[3]: Leaving directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/build'
| make[2]: Leaving directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/build'
| Making all in clutter-gtk
| make[2]: Entering directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/clutter-gtk'
|   CC     libclutter_gtk_0.10_la-gtk-clutter-embed.lo
|   CC     libclutter_gtk_0.10_la-gtk-clutter-scrollable.lo
|   CC     libclutter_gtk_0.10_la-gtk-clutter-viewport.lo
|   CC     libclutter_gtk_0.10_la-gtk-clutter-util.lo
|   CC     libclutter_gtk_0.10_la-gtk-clutter-zoomable.lo
|   CCLD   libclutter-gtk-0.10.la
| /home/Superandi/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: cannot find -lclutter-egl-1.0
Let's hope gtk_0.12 will help...

- What exactly is the goal of 'test-conformance-fix.patch' (to get the build working there less cluttering solutions are possible e.g.  sed'ing out BUILIT_SOURCES in Makefile.am)? From my point of view it creates a lot of unusable scripts in the sub folder 'wrapper' and the file 'unit-tests'. Nothing created by this is packed.


Please don't tell me I am invited to change this situation:  Many patches send by non-commit guys are nit-picked at least for commit message - and then I read 'clutter: add 1.4.2' for a recipe breaking lots of others.

Sorry for this, but to me the this should have been a hobby for having fun - but at the moment it's far from

Andreas

(1) http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/029260.html


