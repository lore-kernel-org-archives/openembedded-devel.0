Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IV3oX-0008J8-B1
	for openembedded-devel@openembedded.org; Tue, 11 Sep 2007 13:21:53 +0200
Received: (qmail 25588 invoked by uid 813007); 11 Sep 2007 11:18:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 11 Sep 2007 11:18:50 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Date: Tue, 11 Sep 2007 13:18:51 +0200
Message-Id: <200709111318.52432.openembedded@haerwu.biz>
Subject: Task-base is big :(
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2007 11:21:53 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit


After long time of doing mostly Poky builds I did few Angstrom builds from 
OE.dev and found that amount of dependencies during build time has grown 
into very long list. It is 2388 tasks now just for "bitbake task-base" 
for fic-gta01 MACHINE.

How to reduce it? Few ideas from me:

1. Switch PACKAGES list to contain only stuff covered by MACHINE_FEATURES

This will give less stuff to build as there will be no building of not 
needed stuff (like pcmciautils for example). We use that way in Poky.

2. Create bluez-utils-lite which do not depend on gstreamer and cups

Those targets adds lot of extra dependencies for build time and many of OE 
users (NOTE: not OE derived distros) do not use that stuff anyway. But 
selecting does build as to use bluez-utils(-full) or lite need to be 
selectable by user also then only by distro.

Poky dropped cups dependency but keeps gstreamer ones but our users do 
full builds usually so gstreamer is built by default.

For MACHINE = "fic-gta01" DISTRO="angstrom-2007.1" I got:

- 1371 tasks for bluez-utils
- 1352 tasks for bluez-utils w/o cups
-  957 tasks for bluez-utils w/o gstreamer
-  868 tasks for bluez-utils w/o cups & gstreamer

503 tasks less is BIG change.

3. Merge gconf-dbus_svn.bb from Poky

In Poky we disabled GTK dependency (only gconf-sanity-check use it) so 
gstreamer/gst-plugins-base will not depend on gtk+. X11 will be built 
anyway.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         A user friendly computer first requires a friendly user.




