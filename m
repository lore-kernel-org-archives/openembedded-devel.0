Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1L1qQB-0000Wg-2V
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Nov 2008 23:48:48 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 466FB24097; Mon, 17 Nov 2008 09:46:28 +1100 (EST)
Date: Mon, 17 Nov 2008 09:46:17 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081117094617.9a4ad7a9.raster@rasterman.com>
In-Reply-To: <gfpdr0$6vm$1@ger.gmane.org>
References: <gfnf5u$r3j$1@ger.gmane.org>
	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>
	<gfpdr0$6vm$1@ger.gmane.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Sun, 16 Nov 2008 22:48:48 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Nov 2008 16:22:07 +0100 Koen Kooi <k.kooi@student.utwente.nl>
babbled:

> On 16-11-08 15:59, Stefan Schmidt wrote:
> > Hello.
> >
> > Sorry for the delay. Having a cold I decided to have a releaxed weekend.
> > Will take a deeper look next days if the stuff below does not help.
> >
> > On Sat, 2008-11-15 at 22:32, Koen Kooi wrote:
> >> I just built and installed the updated e-wm and it refuses to start:
> >
> > Installed means from the updated angstrom feed I guess?
> 
> Yes, I did 'bitbake e-wm', synced the new packages to the feeds and did 
> 'opkg update ; opkg upgrade' on the device (an omap3evm board).
> On the omap3evm board I'd like to test illume to see if it is fit to 
> replace mb-wm in angstrom pda images, on the beagleboard I'd like to run 
> a 'regular' e-wm. The omap3evm was running the 'regular' e-wm at the 
> time of the upgrade.

hmmm. i wonder... did this actually rebuild and upgrade all the dependencies?
that could be the problem. right now the efl .bb's SHOULD have a dependency on
the SAME svnrev (ie e-wm svnr37568 should depend on svnr37568 of evas, edje
etc. etc.). but they don't. are: eet, evas, edje, ecore, eina, efreet, embryo,
edje, e-wm in-sync with their version?

> > As a sidenote. This was not rushed in without testing or review. I spent
> > some good hours on reviewing it together with mickey, in his role as E
> > maintainer in OE. We also decided to keep some more patches out until there
> > is more time for review.
> >
> > And I of course tested it before pushing. Building and actually using it. No
> > breakage here. But as I only tested with a complete new image and not with
> > updating from a feed I may have messed up here. Should not happen though :(
> 
> It seems that almost no OE developer is tracking upgrade paths for such 
> intrusive changes, which is a pity. You'd be suprised how much bugs 
> there are when you try to build an image from the feeds[1] instead of 
> from a pristine deploy/. Anyway, mistakes happen :)
> 
> > If eina is installed in a matching version I would need the following to
> > track this down as I don't have the problem here:
> 
> libeina0 - 2:0.0.1+svnr37324-r0.1 -
> 
> > - Full x.log
> 
> http://dominion.thruhere.net/koen/OE/e17/e-log.txt
> 
> It has scary messages about missing vars, but it *does* find the evas 
> engines. However:

oooooh! thaqt's bad. well ok - the scary stuff. e is actually marginally smart.
it doesnt just rely on knowing its installed location at compile time. you can
actually relocate e and efl on the fly at runtime. even if you build with a
prefix of --prefix=/usr or /usr/local or /opt/e17 - just mv all the
PREFIX/lib/.so's, PREFIX/bin/binaries and PREFIX/share/* dirs and PREFIX/lib/*
dirs of the respective app (in this case - same applies to evas or edje etc.)
and they will figure out their new home (as long as they retain a common PREFIX
for that package - ie share/* stuff moves to the same PREFIX as libs and bins).
it tries to figure this out many ways. first it checks /proc/self/maps. it
looks for a function inside the process (or lib) to see where it's mapped and
if the address is int he mapping range for anything in /proc/self/maps - if it
finds it the full path is there (well - should be unless its deleted or stack
or heap...) if this fails it looks at argv[0] - if its a full path.. well..
thats the binary - if its not - it checks for the binary in $PATH and when
found knows the full path. if this fails... it falls back to the good old
"compiled in prefix" like everyone else - it also allows you to set environment
variables to tell it what its prefix should be, if you moved it. these always
take precedence if set, even over auto-finding. what is most odd... is that
it's failing for you. on a linux host i can't imagine it failing
- /proc/self/maps is the first port of call and that should work! something
strange is up here... maybe its the missing AUTHORS
file? /usr/share/enlightenment/AUTHORS - thats uses as a "is it there" file
detect for the prefix search. it's an extra check (it's also used by e's about
box). ok checked - yes. AUTHORS missing from packaging. fixed:
--------
diff --git a/packages/e17/e-wm_svn.bb b/packages/e17/e-wm_svn.bb
index a2fabc7..7734bf2 100644
--- a/packages/e17/e-wm_svn.bb
+++ b/packages/e17/e-wm_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Enlightenment Window Manager Version 17"
 DEPENDS = "eet evas ecore edje efreet edbus"
 LICENSE = "MIT BSD"
 PV = "0.16.999.043+svnr${SRCREV}"
-PR = "r17"
+PR = "r18"
 
 inherit e update-alternatives
 
@@ -92,6 +92,8 @@ FILES_${PN} = "\
   ${datadir}/enlightenment/data/icons \
   ${datadir}/enlightenment/data/input_methods \
   ${datadir}/enlightenment/data/config/profile.cfg \
+  ${datadir}/enlightenment/AUTHORS \
+  ${datadir}/enlightenment/COPYING \
   ${sysconfdir} \
 "
 FILES_${PN}-config-default = "${datadir}/enlightenment/data/config/default"
--------
this will fix the scary output :) e's own fallbacks to the old-school "compiled
in path" saved it from ever breaking... hooray for multiple levels of
redundancy :) thanks for that catch!

> root@omap3evm:~# cat /usr/bin/enlightenment_start.oe
> #!/bin/sh
> 
> E_PROFILE=""
> if [ -r /etc/enlightenment/default_profile ]; then
>    . /etc/enlightenment/default_profile
> fi
> 
> renice -10 -p $$
> exec enlightenment_start $E_PROFILE
> 
> root@omap3evm:~# ls /etc/enlightenment/
> sysactions.conf
> root@omap3evm:~#
> 
> Do I need an extra package to get the default_profile?

hmm the above is a bit of legacy before e had proper default profile settings.
the default profile.. is "default" if its not set
there. /usr/share/enlightenment/data/config/profile.cfg contains it (eet -l to
list keys, eet -x config profile.cfg profile-name; cat profile-name  to extract
- u can insert with eet too).

i wouldn't recommend using the default_profile file thing. this is only here to
keep openmoko's previous setup happy. you can always change profiles on the fly
runtime and to go back to default is a few clicks away (default will always run
the install wizard as e comes out of the box). so yes - you need another package
to provide that default_profile, (which is just a test file that has "-profile
PROFILENAME" in it). once you have this you are stuck in that profile though -
no escape (without a restart of your x session entirely after
removing/changing the package).

> > - Full strace
> 
> http://dominion.thruhere.net/koen/OE/e17/e-strace.txt

stat64("/usr/share/eenlightenment/data/images/test.png", 0x398dca0) = -1 ENOENT
(No such file or directory)

aha! that's the one. that SHOULD be in the e-wm-images package missing!

opkg search /usr/share/enlightenment/data/images/test.png
e-wm-images - 0.16.999.043+svnr37468-r17.1
- /usr/share/enlightenment/data/images/test.png

(yes different svnrev - but that shouldn't make a difference - i'm just a little
head locally of my public patchset. i am sure stefan can confirm that test.png
is in the images package for the oe svnrev int he images he built)

> > - Full list of installed packages
> 
> http://dominion.thruhere.net/koen/OE/e17/e-installed-packages.txt
> 
> Thanks for looking into this, let me know if you need more info.

strange - all the libs and e-wm etc. seem to be in sync (except etk - but that
wont affect e). how it should be. odd that u have the tiff saver module and not
the loader!

> regards,
> 
> Koen
> 
> [1] modulo bugs due to not running image_post_process commands
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



