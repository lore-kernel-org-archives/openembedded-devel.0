Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OeOpb-0000ug-IO
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 10:51:22 +0200
Received: by bwz10 with SMTP id 10so57554bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=qp77arFBbTWIp/5dps1rFPv4v+kaUHc/C7JDCzKg8Oo=;
	b=vYeV6860EjsXoCksW07YHe/qzLY1n4p1ogfQGxjKbKrpMuxjHqQmduEI0T0jNr8JNM
	GHcuM00U7HBa2kLdzt0sREaAvogrmdtnBiyLsaOHmFiNUzPth4WfpdJcnMwXUliRjguq
	yCcUgjuC+BuuXG51WDWQv1mJQo2QA9AjUio8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=vKpx9Jkg5FCmJuFT26BTM48/1+RFmlUq2iLiJIy4O5/52Ew0jWjGrOuYvhphW0oObd
	pJMbk3bUnGdTE7mHuzU+ca0ukysGw01GgqDPCTUOUSnEWUpihn6PSj7EHtNCWv+aIK/V
	2tmkuwl+VFRHovjZycMiQORl8utwAUyeZsmiI=
MIME-Version: 1.0
Received: by 10.204.120.129 with SMTP id d1mr8583865bkr.175.1280393454203; 
	Thu, 29 Jul 2010 01:50:54 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Thu, 29 Jul 2010 01:50:53 -0700 (PDT)
Date: Thu, 29 Jul 2010 10:50:53 +0200
Message-ID: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE recipe tree quality
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
X-List-Received-Date: Thu, 29 Jul 2010 08:51:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Given the discussions on quality that sometimes pop up (and also triggered
by Robert's message), I decided to kick off a bitbake -k world.
Below are some initial findings. I would like to use this as a starter to
kickoff the discusson on quality and what to do with broken stuff.
And also I hope that people who feel attached to a recipe mentioned below
will take action.

My setting:
local.conf:
IMAGE_LINGUAS = ""
ENABLE_BINARY_LOCALE_GENERATION = "0"

MACHINE = "beagleboard"
DISTRO = "angstrom-2008.1"

EXTRA_IMAGECMD_jffs2 = "--pad --eraseblock=0x20000"
MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1024"

IMAGE_FSTYPES = "tar squashfs ubifs jffs2"
IMAGE_KEEPROOTFS = "1"
OE_ALLOW_INSECURE_DOWNLOADS = "yes"

I opted for angstromg and beagleboard as I feel this is the most often build
configuration, so it should have the least issues.
host is ubuntu 10.04 on 64 bit. tree is oe dev git head (as of jul 29)

All results are not in yet (there are 71047 taksks, I am at 159 :-)
However the parsing already gave some interesting output.
I've ordered them somehwat:

Nothing PROVIDES errors
===================

ERROR: Nothing PROVIDES 'etk'
ERROR: Nothing PROVIDES 'sugar-web-activity'
ERROR: Nothing PROVIDES 'hildon-lgpl' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbDEPENDS
on or otherwise requires it)
ERROR: Nothing PROVIDES 'hildon-base-lib'
ERROR: Nothing PROVIDES 'hildon-libs'
ERROR: Nothing PROVIDES 'python-etk' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
om-settings_svn.bb,
/home/frans/workspace/tst/openembedded.git/recipes/omoney/omoney_svn.bbDEPENDS
on or otherwise requires it)
ERROR: Nothing PROVIDES 'gconf-osso'
ERROR: Nothing PROVIDES 'epsilon'
ERROR: Nothing PROVIDES 'libmsip0'
ERROR: Nothing PROVIDES 'libmikey0'
ERROR: Nothing PROVIDES 'xmu'
ERROR: Nothing PROVIDES 'ipkg' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-sdk-sbox-gpe.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bb,
/home/frans/workspace/tst/openembedded.git/recipes/opkg/opkg-ipkg-compat.bbDEPENDS
on or otherwise requires it)
ERROR: Nothing PROVIDES 'evas-fb'
ERROR: Nothing PROVIDES 'ecore-fb'
ERROR: Nothing PROVIDES 'esmart-fb'
ERROR: Nothing PROVIDES 'imlib2-fb'
ERROR: Nothing PROVIDES 'efl++-fb'
ERROR: Nothing PROVIDES 'codec-engine'
ERROR: Nothing PROVIDES 'sword'
ERROR: Nothing PROVIDES 'clutter-0.6'
ERROR: Nothing PROVIDES 'hildon-fm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbDEPENDS
on or otherwise requires it)
ERROR: Nothing PROVIDES 'libgsmd-lips'
ERROR: Nothing PROVIDES 'libmnetutil0'
ERROR: Nothing PROVIDES 'xdamage'
ERROR: Nothing PROVIDES 'etk-native'
ERROR: Nothing PROVIDES 'bluez-libs-3.36'

Apparently we have some issues here. I am not really a user of any of this
package and for most of them I have no idea what they do (so I have not
really too much interest to burn spare time to fix them) . Some of these are
apparently quite old too.
(I've checked out xdamage, this one is in the DEPENDS of
recipes/xvidcap/xvidcap.inc and that file has not been touched since the
packages -> recipes renaming).

Is anyone interested in a recipe that DEPENDS on these missing packages?
If so, what about some action to fix them.
If not, do we want to leave this crud around? Should we move to a
does-not-build dir? or delete?
Opinions wanted


Nothing RPROVIDES errors
====================

Big list,message continues after the list:
ERROR: Nothing RPROVIDES 'exhibit' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/e17/exhibit_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'om-locations' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
om-locations_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'om-settings' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'assassin' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin-thumbnail_svn.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'assassin-thumbnail' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin-thumbnail_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-hmm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-itools' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-lightmediascanner' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-python-devel.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-pyreverse' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-snmplib' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-spyro' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-urwid' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-vmaps' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'twisted' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqt2' (but
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher.bb, /home/frans/workspace/tst/openembedded.git/recipes/xqt2/
xqt2_20060509.bb, /home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-qpe.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqtlauncher' (but
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher.bb, /home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-xqtlauncher.bb,
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher-blackbox-config.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gstreamer-ti-demo-script' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-gstreamer-ti.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-demo-x11' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libgles-omap3-demos' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bc-cat-omap3-module-tests' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'edje-player' (but
/home/frans/workspace/tst/openembedded.git/recipes/e17/edje-player_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'edje-editor' (but
/home/frans/workspace/tst/openembedded.git/recipes/e17/edje-editor_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'sugar-fructose' (but
/home/frans/workspace/tst/openembedded.git/recipes/sugar/sugar-fructose.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '|' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-base.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'e2fsprogs-uuidgen' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-base.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-todo-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/gpe-todo/
gpe-todo-hildon_0.55.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'evolve' (but
/home/frans/workspace/tst/openembedded.git/recipes/efl1/evolve_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-application-installer' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
osso-application-installer_1.0.03-1.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bluez-utils-compat' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-gpephone.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'diversity-radar' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
diversity-radar_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'lessertunjo' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
lessertunjo_0.0.10.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'omview' (but
/home/frans/workspace/tst/openembedded.git/recipes/omview/omview_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'epsilon-thumbd' (but
/home/frans/workspace/tst/openembedded.git/recipes/omview/omview_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bt950-cs' (but
/home/frans/workspace/tst/openembedded.git/recipes/bt950-cs/bt950-cs_0.1.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'minisip' (but
/home/frans/workspace/tst/openembedded.git/recipes/minisip/minisip_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'systemtap' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-systemtap.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-mamona-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-systemtap.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-applets' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-games' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-inputmethods' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-multimedia' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-emulators' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-applications' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-fonts' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-settings' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'aterm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-wm.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'dspgw-utils' (but
/home/frans/workspace/tst/openembedded.git/recipes/mamona/
mamona-sound-n800_0.1.0.bb,
/home/frans/workspace/tst/openembedded.git/recipes/mamona/
mamona-sound-n770_0.1.0.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ipkgorphan' (but
/home/frans/workspace/tst/openembedded.git/recipes/ipkg/ipkgorphan_0.0.1.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'openmoko-today' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-base/
openmoko-session_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'comic-reader' (but
/home/frans/workspace/tst/openembedded.git/recipes/comic-reader/
comic-reader_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-status-bar' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
hildon-status-bar_0.8.11-1.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'angstrom-bootmanager' (but
/home/frans/workspace/tst/openembedded.git/recipes/angstrom/
angstrom-bootmanager.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'fso-apm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-fso2-compliance.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-feed.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'vlc-davinci' (but
/home/frans/workspace/tst/openembedded.git/recipes/vlc/vlc-davinci_0.8.6h.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal-cli' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal-apps' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'eflpp' (but
/home/frans/workspace/tst/openembedded.git/recipes/efl1/eflpp_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ipkg' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-sdk-sbox-gpe.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bb,
/home/frans/workspace/tst/openembedded.git/recipes/opkg/opkg-ipkg-compat.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-sdk-sbox-gpe' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-sdk-sbox-gpe.bb,
/home/frans/workspace/tst/openembedded.git/recipes/meta/
meta-toolchain-gpe-sbox.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-opie-bluetooth' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-opie-irda' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'outo' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-initscripts' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-thumbnail' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-lgpl' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libhildonbase' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libhildonwidgets' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-fm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-home' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-navigator' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-screenshot-tool' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-contacts-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-mini-browser-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bb,
/home/frans/workspace/tst/openembedded.git/recipes/gpe-mini-browser/
gpe-mini-browser-hildon_0.17.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'opie-dagger' (but
/home/frans/workspace/tst/openembedded.git/recipes/opie-dagger/
opie-dagger_1.2.4.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-opie-apps.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'clutter-gtk-0.6' (but
/home/frans/workspace/tst/openembedded.git/recipes/clutter/
clutter-gtk-0.6_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'udev-compat-wrapper' (but
/home/frans/workspace/tst/openembedded.git/recipes/udev/
udev-compat141_141.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'udev-compat141' (but
/home/frans/workspace/tst/openembedded.git/recipes/udev/
udev-compat141_141.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-openprotium' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_SSH_DAEMON}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_DEV_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_INIT_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_LOGIN_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-etk' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
om-settings_svn.bb,
/home/frans/workspace/tst/openembedded.git/recipes/omoney/omoney_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-python-sharprom' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-minimal.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libmsgenabler2' (but
/home/frans/workspace/tst/openembedded.git/recipes/gpephone/
libmsgenabler2_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libmsip' (but
/home/frans/workspace/tst/openembedded.git/recipes/minisip/libmsip_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-openmoko-python-devel' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-python-devel.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'matchbox-panel-2-applets' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-base.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-xqtlERROR: Nothing RPROVIDES 'exhibit' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/e17/exhibit_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'om-locations' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
om-locations_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'om-settings' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'assassin' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin-thumbnail_svn.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'assassin-thumbnail' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin-thumbnail_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-hmm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-itools' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-lightmediascanner' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-python-devel.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-pyreverse' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-snmplib' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-spyro' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-urwid' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-vmaps' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'twisted' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqt2' (but
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher.bb, /home/frans/workspace/tst/openembedded.git/recipes/xqt2/
xqt2_20060509.bb, /home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-qpe.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqtlauncher' (but
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher.bb, /home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-xqtlauncher.bb,
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher-blackbox-config.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gstreamer-ti-demo-script' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-gstreamer-ti.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-demo-x11' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libgles-omap3-demos' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bc-cat-omap3-module-tests' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'edje-player' (but
/home/frans/workspace/tst/openembedded.git/recipes/e17/edje-player_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'edje-editor' (but
/home/frans/workspace/tst/openembedded.git/recipes/e17/edje-editor_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'sugar-fructose' (but
/home/frans/workspace/tst/openembedded.git/recipes/sugar/sugar-fructose.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '|' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-base.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'e2fsprogs-uuidgen' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-base.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-todo-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/gpe-todo/
gpe-todo-hildon_0.55.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'evolve' (but
/home/frans/workspace/tst/openembedded.git/recipes/efl1/evolve_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-application-installer' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
osso-application-installer_1.0.03-1.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bluez-utils-compat' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-gpephone.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'diversity-radar' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
diversity-radar_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'lessertunjo' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
lessertunjo_0.0.10.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'omview' (but
/home/frans/workspace/tst/openembedded.git/recipes/omview/omview_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'epsilon-thumbd' (but
/home/frans/workspace/tst/openembedded.git/recipes/omview/omview_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bt950-cs' (but
/home/frans/workspace/tst/openembedded.git/recipes/bt950-cs/bt950-cs_0.1.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'minisip' (but
/home/frans/workspace/tst/openembedded.git/recipes/minisip/minisip_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'systemtap' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-systemtap.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-mamona-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-systemtap.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-applets' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-games' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-inputmethods' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-multimedia' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-emulators' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-applications' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-fonts' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-settings' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'aterm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-wm.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'dspgw-utils' (but
/home/frans/workspace/tst/openembedded.git/recipes/mamona/
mamona-sound-n800_0.1.0.bb,
/home/frans/workspace/tst/openembedded.git/recipes/mamona/
mamona-sound-n770_0.1.0.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ipkgorphan' (but
/home/frans/workspace/tst/openembedded.git/recipes/ipkg/ipkgorphan_0.0.1.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'openmoko-today' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-base/
openmoko-session_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'comic-reader' (but
/home/frans/workspace/tst/openembedded.git/recipes/comic-reader/
comic-reader_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-status-bar' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
hildon-status-bar_0.8.11-1.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'angstrom-bootmanager' (but
/home/frans/workspace/tst/openembedded.git/recipes/angstrom/
angstrom-bootmanager.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'fso-apm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-fso2-compliance.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-feed.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'vlc-davinci' (but
/home/frans/workspace/tst/openembedded.git/recipes/vlc/vlc-davinci_0.8.6h.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal-cli' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal-apps' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'eflpp' (but
/home/frans/workspace/tst/openembedded.git/recipes/efl1/eflpp_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ipkg' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-sdk-sbox-gpe.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bb,
/home/frans/workspace/tst/openembedded.git/recipes/opkg/opkg-ipkg-compat.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-sdk-sbox-gpe' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-sdk-sbox-gpe.bb,
/home/frans/workspace/tst/openembedded.git/recipes/meta/
meta-toolchain-gpe-sbox.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-opie-bluetooth' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-opie-irda' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'outo' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-initscripts' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-thumbnail' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-lgpl' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libhildonbase' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libhildonwidgets' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-fm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-home' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-navigator' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-screenshot-tool' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-contacts-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-mini-browser-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bb,
/home/frans/workspace/tst/openembedded.git/recipes/gpe-mini-browser/
gpe-mini-browser-hildon_0.17.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'opie-dagger' (but
/home/frans/workspace/tst/openembedded.git/recipes/opie-dagger/
opie-dagger_1.2.4.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-opie-apps.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'clutter-gtk-0.6' (but
/home/frans/workspace/tst/openembedded.git/recipes/clutter/
clutter-gtk-0.6_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'udev-compat-wrapper' (but
/home/frans/workspace/tst/openembedded.git/recipes/udev/
udev-compat141_141.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'udev-compat141' (but
/home/frans/workspace/tst/openembedded.git/recipes/udev/
udev-compat141_141.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-openprotium' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_SSH_DAEMON}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_DEV_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_INIT_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_LOGIN_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-etk' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
om-settings_svn.bb,
/home/frans/workspace/tst/openembedded.git/recipes/omoney/omoney_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-python-sharprom' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-minimal.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libmsgenabler2' (but
/home/frans/workspace/tst/openembedded.git/recipes/gpephone/
libmsgenabler2_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libmsip' (but
/home/frans/workspace/tst/openembedded.git/recipes/minisip/libmsip_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-openmoko-python-devel' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-python-devel.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'matchbox-panel-2-applets' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-base.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-xqtlauncher' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-xqtlauncher.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqtlauncher-blackbox-config' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-xqtlauncher.bb,
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher-blackbox-config.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'omoney' (but
/home/frans/workspace/tst/openembedded.git/recipes/omoney/omoney_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'opkg-ipkg-compat' (but
/home/frans/workspace/tst/openembedded.git/recipes/opkg/opkg-ipkg-compat.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'e2fsprogs-libs-dev' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-target.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libpng12-dev' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-target.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'nylon-feed' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/nylon-feed.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-mamona-base' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xserver-kdrive-xomap' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'nodejs' (but
/home/frans/workspace/tst/openembedded.git/recipes/esc/esc-node-demo_git.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xvidcap' (but
/home/frans/workspace/tst/openembedded.git/recipes/xvidcap/
xvidcap_1.1.7rc1.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'virtual/xserver' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-gpe.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-base' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-apps' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-libs-install' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-theme' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-feed' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-feed.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-uuid' (but
/home/frans/workspace/tst/openembedded.git/recipes/networkmanager/
cnetworkmanager_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'etk'
ERROR: Nothing RPROVIDES 'sugar-web-activity'
ERROR: Nothing RPROVIDES 'libgpepimc-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/libgpepimc/
libgpepimc-hildon_0.5.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-base-lib'
ERROR: Nothing RPROVIDES 'hildon-libs'
ERROR: Nothing RPROVIDES 'gconf-osso'
ERROR: Nothing RPROVIDES 'epsilon'
ERROR: Nothing RPROVIDES 'libmsip0'
ERROR: Nothing RPROVIDES 'libmikey0'
ERROR: Nothing RPROVIDES 'xmu'
ERROR: Nothing RPROVIDES 'evas-fb'
ERROR: Nothing RPROVIDES 'esmart-fb'
ERROR: Nothing RPROVIDES 'imlib2-fb'
ERROR: Nothing RPROVIDES 'efl++-fb'
ERROR: Nothing RPROVIDES 'codec-engine'
ERROR: Nothing RPROVIDES 'sword'
ERROR: Nothing RPROVIDES 'clutter-0.6'
ERROR: Nothing RPROVIDES 'libmnetutil0'
ERROR: Nothing RPROVIDES 'xdamage'
ERROR: Nothing RPROVIDES 'ti-codec-engine-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-codec-combo-omap3530-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-xdctools-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-dmai-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-dspbios-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-cgt6x-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-legacy-dvsdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'etk-native'
ERROR: Nothing RPROVIDES 'bluez-libs-3.36'
auncher' (but /home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-xqtlauncher.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqtlauncher-blackbox-config' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-xqtlauncher.bb,
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher-blackbox-config.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'omoney' (but
/home/frans/workspace/tst/openembedded.git/recipes/omoney/omoney_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'opkg-ipkg-compat' (but
/home/frans/workspace/tst/openembedded.git/recipes/opkg/opkg-ipkg-compat.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'e2fsprogs-libs-dev' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-target.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libpng12-dev' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-target.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'nylon-feeERROR: Nothing RPROVIDES 'exhibit' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/e17/exhibit_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'om-locations' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
om-locations_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'om-settings' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'assassin' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin-thumbnail_svn.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'assassin-thumbnail' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-feed.bb,
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
assassin-thumbnail_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-hmm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-itools' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-lightmediascanner' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-python-devel.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-pyreverse' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-snmplib' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-spyro' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-urwid' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-vmaps' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'twisted' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-python.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqt2' (but
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher.bb, /home/frans/workspace/tst/openembedded.git/recipes/xqt2/
xqt2_20060509.bb, /home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-qpe.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqtlauncher' (but
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher.bb, /home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-xqtlauncher.bb,
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher-blackbox-config.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gstreamer-ti-demo-script' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-gstreamer-ti.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-demo-x11' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libgles-omap3-demos' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bc-cat-omap3-module-tests' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-demo-x11.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'edje-player' (but
/home/frans/workspace/tst/openembedded.git/recipes/e17/edje-player_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'edje-editor' (but
/home/frans/workspace/tst/openembedded.git/recipes/e17/edje-editor_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'sugar-fructose' (but
/home/frans/workspace/tst/openembedded.git/recipes/sugar/sugar-fructose.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '|' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-base.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'e2fsprogs-uuidgen' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-base.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-todo-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/gpe-todo/
gpe-todo-hildon_0.55.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'evolve' (but
/home/frans/workspace/tst/openembedded.git/recipes/efl1/evolve_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-application-installer' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
osso-application-installer_1.0.03-1.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bluez-utils-compat' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-gpephone.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'diversity-radar' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
diversity-radar_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'lessertunjo' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
lessertunjo_0.0.10.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'omview' (but
/home/frans/workspace/tst/openembedded.git/recipes/omview/omview_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'epsilon-thumbd' (but
/home/frans/workspace/tst/openembedded.git/recipes/omview/omview_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'bt950-cs' (but
/home/frans/workspace/tst/openembedded.git/recipes/bt950-cs/bt950-cs_0.1.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'minisip' (but
/home/frans/workspace/tst/openembedded.git/recipes/minisip/minisip_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'systemtap' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-systemtap.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-mamona-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-mamona-systemtap.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-applets' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-games' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-inputmethods' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-multimedia' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-emulators' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-applications' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-fonts' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-qpe-settings' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie-all.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'aterm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona-wm.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'dspgw-utils' (but
/home/frans/workspace/tst/openembedded.git/recipes/mamona/
mamona-sound-n800_0.1.0.bb,
/home/frans/workspace/tst/openembedded.git/recipes/mamona/
mamona-sound-n770_0.1.0.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ipkgorphan' (but
/home/frans/workspace/tst/openembedded.git/recipes/ipkg/ipkgorphan_0.0.1.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'openmoko-today' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-base/
openmoko-session_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'comic-reader' (but
/home/frans/workspace/tst/openembedded.git/recipes/comic-reader/
comic-reader_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-status-bar' (but
/home/frans/workspace/tst/openembedded.git/recipes/maemo/
hildon-status-bar_0.8.11-1.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'angstrom-bootmanager' (but
/home/frans/workspace/tst/openembedded.git/recipes/angstrom/
angstrom-bootmanager.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'fso-apm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-fso2-compliance.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-feed.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'vlc-davinci' (but
/home/frans/workspace/tst/openembedded.git/recipes/vlc/vlc-davinci_0.8.6h.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal-cli' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal-apps' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'eflpp' (but
/home/frans/workspace/tst/openembedded.git/recipes/efl1/eflpp_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ipkg' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-sdk-sbox-gpe.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bb,
/home/frans/workspace/tst/openembedded.git/recipes/opkg/opkg-ipkg-compat.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-sdk-sbox-gpe' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-sdk-sbox-gpe.bb,
/home/frans/workspace/tst/openembedded.git/recipes/meta/
meta-toolchain-gpe-sbox.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-opie-bluetooth' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-opie-irda' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-opie.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'outo' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-initscripts' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-thumbnail' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-lgpl' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libhildonbase' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libhildonwidgets' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-fm' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-home' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-navigator' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'osso-screenshot-tool' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-contacts-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gpe-mini-browser-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-maemo.bb,
/home/frans/workspace/tst/openembedded.git/recipes/gpe-mini-browser/
gpe-mini-browser-hildon_0.17.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'opie-dagger' (but
/home/frans/workspace/tst/openembedded.git/recipes/opie-dagger/
opie-dagger_1.2.4.bb,
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-opie-apps.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'clutter-gtk-0.6' (but
/home/frans/workspace/tst/openembedded.git/recipes/clutter/
clutter-gtk-0.6_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'udev-compat-wrapper' (but
/home/frans/workspace/tst/openembedded.git/recipes/udev/
udev-compat141_141.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'udev-compat141' (but
/home/frans/workspace/tst/openembedded.git/recipes/udev/
udev-compat141_141.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-openprotium' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_SSH_DAEMON}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_DEV_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_INIT_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES '${DISTRO_LOGIN_MANAGER}' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-openprotium.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-etk' (but
/home/frans/workspace/tst/openembedded.git/recipes/openmoko-projects/
om-settings_svn.bb,
/home/frans/workspace/tst/openembedded.git/recipes/omoney/omoney_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-python-sharprom' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-python-sharprom_20060425.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-minimal' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-minimal.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libmsgenabler2' (but
/home/frans/workspace/tst/openembedded.git/recipes/gpephone/
libmsgenabler2_svn.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libmsip' (but
/home/frans/workspace/tst/openembedded.git/recipes/minisip/libmsip_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-openmoko-python-devel' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-python-devel.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'matchbox-panel-2-applets' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-openmoko-base.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-xqtlauncher' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-xqtlauncher.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xqtlauncher-blackbox-config' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-xqtlauncher.bb,
/home/frans/workspace/tst/openembedded.git/recipes/xqtlauncher/
xqtlauncher-blackbox-config.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'omoney' (but
/home/frans/workspace/tst/openembedded.git/recipes/omoney/omoney_svn.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'opkg-ipkg-compat' (but
/home/frans/workspace/tst/openembedded.git/recipes/opkg/opkg-ipkg-compat.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'e2fsprogs-libs-dev' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-target.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'libpng12-dev' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-target.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'nylon-feed' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/nylon-feed.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-mamona-base' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xserver-kdrive-xomap' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'nodejs' (but
/home/frans/workspace/tst/openembedded.git/recipes/esc/esc-node-demo_git.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xvidcap' (but
/home/frans/workspace/tst/openembedded.git/recipes/xvidcap/
xvidcap_1.1.7rc1.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'virtual/xserver' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-gpe.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-base' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-apps' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-libs-install' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-theme' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-feed' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-feed.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-uuid' (but
/home/frans/workspace/tst/openembedded.git/recipes/networkmanager/
cnetworkmanager_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'etk'
ERROR: Nothing RPROVIDES 'sugar-web-activity'
ERROR: Nothing RPROVIDES 'libgpepimc-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/libgpepimc/
libgpepimc-hildon_0.5.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-base-lib'
ERROR: Nothing RPROVIDES 'hildon-libs'
ERROR: Nothing RPROVIDES 'gconf-osso'
ERROR: Nothing RPROVIDES 'epsilon'
ERROR: Nothing RPROVIDES 'libmsip0'
ERROR: Nothing RPROVIDES 'libmikey0'
ERROR: Nothing RPROVIDES 'xmu'
ERROR: Nothing RPROVIDES 'evas-fb'
ERROR: Nothing RPROVIDES 'esmart-fb'
ERROR: Nothing RPROVIDES 'imlib2-fb'
ERROR: Nothing RPROVIDES 'efl++-fb'
ERROR: Nothing RPROVIDES 'codec-engine'
ERROR: Nothing RPROVIDES 'sword'
ERROR: Nothing RPROVIDES 'clutter-0.6'
ERROR: Nothing RPROVIDES 'libmnetutil0'
ERROR: Nothing RPROVIDES 'xdamage'
ERROR: Nothing RPROVIDES 'ti-codec-engine-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-codec-combo-omap3530-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-xdctools-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-dmai-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-dspbios-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-cgt6x-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-legacy-dvsdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'etk-native'
ERROR: Nothing RPROVIDES 'bluez-libs-3.36'
d' (but /home/frans/workspace/tst/openembedded.git/recipes/meta/
nylon-feed.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-mamona-base' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xserver-kdrive-xomap' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-mamona.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'nodejs' (but
/home/frans/workspace/tst/openembedded.git/recipes/esc/esc-node-demo_git.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'xvidcap' (but
/home/frans/workspace/tst/openembedded.git/recipes/xvidcap/
xvidcap_1.1.7rc1.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'virtual/xserver' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-gpe.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-base' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-apps' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-libs-install' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'maemo-task-theme' (but
/home/frans/workspace/tst/openembedded.git/recipes/meta/meta-maemo.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'task-shr-feed' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/task-shr-feed.bbRDEPENDS
on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python-uuid' (but
/home/frans/workspace/tst/openembedded.git/recipes/networkmanager/
cnetworkmanager_git.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'etk'
ERROR: Nothing RPROVIDES 'sugar-web-activity'
ERROR: Nothing RPROVIDES 'libgpepimc-hildon' (but
/home/frans/workspace/tst/openembedded.git/recipes/libgpepimc/
libgpepimc-hildon_0.5.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'hildon-base-lib'
ERROR: Nothing RPROVIDES 'hildon-libs'
ERROR: Nothing RPROVIDES 'gconf-osso'
ERROR: Nothing RPROVIDES 'epsilon'
ERROR: Nothing RPROVIDES 'libmsip0'
ERROR: Nothing RPROVIDES 'libmikey0'
ERROR: Nothing RPROVIDES 'xmu'
ERROR: Nothing RPROVIDES 'evas-fb'
ERROR: Nothing RPROVIDES 'esmart-fb'
ERROR: Nothing RPROVIDES 'imlib2-fb'
ERROR: Nothing RPROVIDES 'efl++-fb'
ERROR: Nothing RPROVIDES 'codec-engine'
ERROR: Nothing RPROVIDES 'sword'
ERROR: Nothing RPROVIDES 'clutter-0.6'
ERROR: Nothing RPROVIDES 'libmnetutil0'
ERROR: Nothing RPROVIDES 'xdamage'
ERROR: Nothing RPROVIDES 'ti-codec-engine-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-codec-combo-omap3530-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-xdctools-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-dmai-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-dspbios-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-cgt6x-sdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ti-legacy-dvsdk' (but
/home/frans/workspace/tst/openembedded.git/recipes/tasks/
task-arago-toolchain-dvsdk-host.bb RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'etk-native'
ERROR: Nothing RPROVIDES 'bluez-libs-3.36'

Same questions as before:
fix/ignore/move to non-buildable dir/remove


preferred versions errors:
==================

apparently there is some pinning of recipes on versions that do not exist
any more.
Guess this is a distro issue.
List:
NOTE: preferred version 1_0_3 of ti-dm365mm-module not available (for item
ti-dm365mm-module)
NOTE: preferred version 1.2.4 of opie-securityplugin-dummy not available
(for item opie-securityplugin-dummy)
NOTE: preferred version 1_13 of ti-dm355mm-module not available (for item
ti-dm355mm-module)
NOTE: preferred version 3_10_00_02 of ti-codecs-dm365 not available (for
item ti-codecs-dm365)
NOTE: preferred version 1_0_3 of ti-dm365mm-module not available (for item
ti-dm365mm-module)
NOTE: preferred version 1.2.4 of opie-securityplugin-dummy not available
(for item opie-securityplugin-dummy)
NOTE: preferred version 1_13 of ti-dm355mm-module not available (for item
ti-dm355mm-module)
NOTE: preferred version 151 of udev not available (for item
libvolume-id-dev)
NOTE: preferred version 3_10_00_02 of ti-codecs-dm365 not available (for
item ti-codecs-dm365)

Seems ti and udev recipes are involved


unbuildable targets errors:
===================

Quite a list (of course triggered by the above:
[message continues after the list]

NOTE: Runtime target 'exhibit' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['exhibit']
NOTE: Runtime target 'task-openmoko-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko-feed',
'exhibit']
NOTE: Runtime target 'om-locations' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['om-locations']
NOTE: Runtime target 'om-settings' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['om-settings']
NOTE: Runtime target 'assassin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['assassin']
NOTE: Runtime target 'assassin-thumbnail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['assassin-thumbnail']
NOTE: Runtime target 'python-hmm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-hmm']
NOTE: Runtime target 'python-itools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-itools']
NOTE: Runtime target 'python-lightmediascanner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-lightmediascanner']
NOTE: Runtime target 'python-pyreverse' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-pyreverse']
NOTE: Runtime target 'python-snmplib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-snmplib']
NOTE: Runtime target 'python-spyro' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-spyro']
NOTE: Runtime target 'python-urwid' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-urwid']
NOTE: Runtime target 'python-vmaps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-vmaps']
NOTE: Runtime target 'twisted' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['twisted']
NOTE: Runtime target 'xqt2' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xqt2']
NOTE: Runtime target 'xqtlauncher' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xqtlauncher']
NOTE: Runtime target 'gstreamer-ti-demo-script' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gstreamer-ti-demo-script']
NOTE: Runtime target 'task-gstreamer-ti' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-gstreamer-ti',
'gstreamer-ti-demo-script']
NOTE: Runtime target 'task-demo-x11' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-demo-x11']
NOTE: Runtime target 'libgles-omap3-demos' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libgles-omap3-demos']
NOTE: Runtime target 'bc-cat-omap3-module-tests' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bc-cat-omap3-module-tests']
NOTE: Runtime target 'edje-player' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['edje-player']
NOTE: Runtime target 'edje-editor' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['edje-editor']
NOTE: Runtime target 'sugar-fructose' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sugar-fructose']
NOTE: Runtime target '|' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['|']
NOTE: Runtime target 'e2fsprogs-uuidgen' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-uuidgen']
NOTE: Runtime target 'gpe-todo-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-todo-hildon']
NOTE: Runtime target 'evolve' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['evolve']
NOTE: Runtime target 'osso-application-installer' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['osso-application-installer']
NOTE: Runtime target 'bluez-utils-compat' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-utils-compat']
NOTE: Runtime target 'task-mamona' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona',
'bluez-utils-compat']
NOTE: Runtime target 'diversity-radar' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['diversity-radar']
NOTE: Runtime target 'lessertunjo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lessertunjo']
NOTE: Runtime target 'omview' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['omview']
NOTE: Runtime target 'epsilon-thumbd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['epsilon-thumbd']
NOTE: Runtime target 'bt950-cs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bt950-cs']
NOTE: Runtime target 'minisip' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['minisip']
NOTE: Runtime target 'systemtap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['systemtap']
NOTE: Runtime target 'task-mamona-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona-sdk']
NOTE: Runtime target 'task-qpe-applets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-applets']
NOTE: Runtime target 'task-qpe-games' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-games']
NOTE: Runtime target 'task-qpe-inputmethods' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-inputmethods']
NOTE: Runtime target 'task-qpe-multimedia' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-multimedia']
NOTE: Runtime target 'task-qpe-emulators' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-emulators']
NOTE: Runtime target 'task-qpe-applications' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-applications']
NOTE: Runtime target 'task-qpe-fonts' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-fonts']
NOTE: Runtime target 'task-qpe-settings' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-settings']
NOTE: Runtime target 'aterm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aterm']
NOTE: Runtime target 'dspgw-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dspgw-utils']
NOTE: Runtime target 'ipkgorphan' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ipkgorphan']
NOTE: Runtime target 'openmoko-today' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openmoko-today']
NOTE: Runtime target 'openmoko-session' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openmoko-session',
'openmoko-today']
NOTE: Runtime target 'comic-reader' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['comic-reader']
NOTE: Runtime target 'hildon-status-bar' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-status-bar']
NOTE: Runtime target 'angstrom-bootmanager' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['angstrom-bootmanager']
NOTE: Runtime target 'fso-apm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['fso-apm']
NOTE: Runtime target 'task-fso2-compliance' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-fso2-compliance',
'fso-apm']
NOTE: Runtime target 'vlc-davinci' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['vlc-davinci']
NOTE: Runtime target 'task-shr-minimal-cli' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal-cli']
NOTE: Runtime target 'task-shr-minimal-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal-apps']
NOTE: Runtime target 'eflpp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['eflpp']
NOTE: Runtime target 'ipkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ipkg']
NOTE: Runtime target 'task-sdk-sbox-gpe' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-sdk-sbox-gpe']
NOTE: Runtime target 'task-opie-bluetooth' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-bluetooth']
NOTE: Runtime target 'task-opie-irda' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-irda']
NOTE: Runtime target 'outo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['outo']
NOTE: Runtime target 'hildon-initscripts' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-initscripts']
NOTE: Runtime target 'osso-thumbnail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['osso-thumbnail']
NOTE: Runtime target 'hildon-lgpl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-lgpl']
NOTE: Runtime target 'libhildonbase' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libhildonbase']
NOTE: Runtime target 'libhildonwidgets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libhildonwidgets']
NOTE: Runtime target 'hildon-fm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-fm']
NOTE: Runtime target 'hildon-home' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-home']
NOTE: Runtime target 'hildon-navigator' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-navigator']
NOTE: Runtime target 'osso-screenshot-tool' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['osso-screenshot-tool']
NOTE: Runtime target 'gpe-contacts-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-contacts-hildon']
NOTE: Runtime target 'gpe-mini-browser-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-mini-browser-hildon']
NOTE: Runtime target 'opie-dagger' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['opie-dagger']
NOTE: Runtime target 'task-opie-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-apps',
'opie-dagger']
NOTE: Runtime target 'task-opie-extra-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-extra-apps',
'opie-dagger']
NOTE: Runtime target 'clutter-gtk-0.6' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-gtk-0.6']
NOTE: Runtime target 'udev-compat-wrapper' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['udev-compat-wrapper']
NOTE: Runtime target 'udev-compat141' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['udev-compat141']
NOTE: Runtime target 'task-openprotium' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openprotium']
NOTE: Runtime target '${DISTRO_SSH_DAEMON}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_SSH_DAEMON}']
NOTE: Runtime target '${DISTRO_DEV_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_DEV_MANAGER}']
NOTE: Runtime target '${DISTRO_INIT_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_INIT_MANAGER}']
NOTE: Runtime target '${DISTRO_LOGIN_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_LOGIN_MANAGER}']
NOTE: Runtime target 'python-etk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-etk']
NOTE: Runtime target 'task-python-sharprom' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-python-sharprom']
NOTE: Runtime target 'task-shr-minimal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal']
NOTE: Runtime target 'libmsgenabler2' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsgenabler2']
NOTE: Runtime target 'libmsip' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsip']
NOTE: Runtime target 'task-openmoko-python-devel' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['task-openmoko-python-devel']
NOTE: Runtime target 'matchbox-panel-2-applets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['matchbox-panel-2-applets']
NOTE: Runtime target 'task-openmoko-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko-base',
'matchbox-panel-2-applets']
NOTE: Runtime target 'task-openmoko' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko',
'task-openmoko-base', 'matchbox-panel-2-applets']
NOTE: Runtime target 'task-xqtlauncher' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-xqtlauncher']
NOTE: Runtime target 'xqtlauncher-blackbox-config' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['xqtlauncher-blackbox-config']
NOTE: Runtime target 'omoney' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['omoney']
NOTE: Runtime target 'opkg-ipkg-compat' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['opkg-ipkg-compat']
NOTE: Runtime target 'e2fsprogs-libs-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-libs-dev']
NOTE: Runtime target 'task-arago-toolchain-target' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['task-arago-toolchain-target',
'e2fsprogs-libs-dev']
NOTE: Runtime target 'task-arago-toolchain-dvsdk-target' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['task-arago-toolchain-dvsdk-target', 'task-arago-toolchain-target',
'e2fsprogs-libs-dev']
NOTE: Runtime target 'libpng12-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libpng12-dev']
NOTE: Runtime target 'nylon-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nylon-feed']
NOTE: Runtime target 'task-mamona-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona-base']
NOTE: Runtime target 'xserver-kdrive-xomap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xserver-kdrive-xomap']
NOTE: Runtime target 'nodejs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nodejs']
NOTE: Runtime target 'esc-node-demo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['esc-node-demo', 'nodejs']
NOTE: Runtime target 'xvidcap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xvidcap']
NOTE: Runtime target 'virtual/xserver' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virtual/xserver']
NOTE: Runtime target 'maemo-task-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-base']
NOTE: Runtime target 'maemo-task-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-apps']
NOTE: Runtime target 'maemo-task-libs-install' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-libs-install']
NOTE: Runtime target 'maemo-task-theme' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-theme']
NOTE: Runtime target 'task-shr-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-feed']
NOTE: Runtime target 'python-uuid' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-uuid']
NOTE: Runtime target 'cnetworkmanager' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['cnetworkmanager',
'python-uuid']
NOTE: Runtime target 'etk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['etk']
NOTE: Runtime target 'sugar-web-activity' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sugar-web-activity']
NOTE: Runtime target 'libgpepimc-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libgpepimc-hildon']
NOTE: Runtime target 'hildon-base-lib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-base-lib']
NOTE: Runtime target 'hildon-libs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-libs']
NOTE: Runtime target 'gconf-osso' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gconf-osso']
NOTE: Runtime target 'epsilon' is unbuildable, removing...
Missing or unbuildable dependeNOTE: Runtime target 'exhibit' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['exhibit']
NOTE: Runtime target 'task-openmoko-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko-feed',
'exhibit']
NOTE: Runtime target 'om-locations' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['om-locations']
NOTE: Runtime target 'om-settings' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['om-settings']
NOTE: Runtime target 'assassin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['assassin']
NOTE: Runtime target 'assassin-thumbnail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['assassin-thumbnail']
NOTE: Runtime target 'python-hmm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-hmm']
NOTE: Runtime target 'python-itools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-itools']
NOTE: Runtime target 'python-lightmediascanner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-lightmediascanner']
NOTE: Runtime target 'python-pyreverse' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-pyreverse']
NOTE: Runtime target 'python-snmplib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-snmplib']
NOTE: Runtime target 'python-spyro' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-spyro']
NOTE: Runtime target 'python-urwid' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-urwid']
NOTE: Runtime target 'python-vmaps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-vmaps']
NOTE: Runtime target 'twisted' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['twisted']
NOTE: Runtime target 'xqt2' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xqt2']
NOTE: Runtime target 'xqtlauncher' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xqtlauncher']
NOTE: Runtime target 'gstreamer-ti-demo-script' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gstreamer-ti-demo-script']
NOTE: Runtime target 'task-gstreamer-ti' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-gstreamer-ti',
'gstreamer-ti-demo-script']
NOTE: Runtime target 'task-demo-x11' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-demo-x11']
NOTE: Runtime target 'libgles-omap3-demos' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libgles-omap3-demos']
NOTE: Runtime target 'bc-cat-omap3-module-tests' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bc-cat-omap3-module-tests']
NOTE: Runtime target 'edje-player' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['edje-player']
NOTE: Runtime target 'edje-editor' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['edje-editor']
NOTE: Runtime target 'sugar-fructose' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sugar-fructose']
NOTE: Runtime target '|' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['|']
NOTE: Runtime target 'e2fsprogs-uuidgen' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-uuidgen']
NOTE: Runtime target 'gpe-todo-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-todo-hildon']
NOTE: Runtime target 'evolve' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['evolve']
NOTE: Runtime target 'osso-application-installer' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['osso-application-installer']
NOTE: Runtime target 'bluez-utils-compat' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-utils-compat']
NOTE: Runtime target 'task-mamona' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona',
'bluez-utils-compat']
NOTE: Runtime target 'diversity-radar' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['diversity-radar']
NOTE: Runtime target 'lessertunjo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lessertunjo']
NOTE: Runtime target 'omview' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['omview']
NOTE: Runtime target 'epsilon-thumbd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['epsilon-thumbd']
NOTE: Runtime target 'bt950-cs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bt950-cs']
NOTE: Runtime target 'minisip' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['minisip']
NOTE: Runtime target 'systemtap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['systemtap']
NOTE: Runtime target 'task-mamona-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona-sdk']
NOTE: Runtime target 'task-qpe-applets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-applets']
NOTE: Runtime target 'task-qpe-games' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-games']
NOTE: Runtime target 'task-qpe-inputmethods' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-inputmethods']
NOTE: Runtime target 'task-qpe-multimedia' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-multimedia']
NOTE: Runtime target 'task-qpe-emulators' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-emulators']
NOTE: Runtime target 'task-qpe-applications' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-applications']
NOTE: Runtime target 'task-qpe-fonts' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-fonts']
NOTE: Runtime target 'task-qpe-settings' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-settings']
NOTE: Runtime target 'aterm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aterm']
NOTE: Runtime target 'dspgw-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dspgw-utils']
NOTE: Runtime target 'ipkgorphan' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ipkgorphan']
NOTE: Runtime target 'openmoko-today' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openmoko-today']
NOTE: Runtime target 'openmoko-session' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openmoko-session',
'openmoko-today']
NOTE: Runtime target 'comic-reader' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['comic-reader']
NOTE: Runtime target 'hildon-status-bar' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-status-bar']
NOTE: Runtime target 'angstrom-bootmanager' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['angstrom-bootmanager']
NOTE: Runtime target 'fso-apm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['fso-apm']
NOTE: Runtime target 'task-fso2-compliance' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-fso2-compliance',
'fso-apm']
NOTE: Runtime target 'vlc-davinci' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['vlc-davinci']
NOTE: Runtime target 'task-shr-minimal-cli' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal-cli']
NOTE: Runtime target 'task-shr-minimal-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal-apps']
NOTE: Runtime target 'eflpp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['eflpp']
NOTE: Runtime target 'ipkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ipkg']
NOTE: Runtime target 'task-sdk-sbox-gpe' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-sdk-sbox-gpe']
NOTE: Runtime target 'task-opie-bluetooth' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-bluetooth']
NOTE: Runtime target 'task-opie-irda' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-irda']
NOTE: Runtime target 'outo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['outo']
NOTE: Runtime target 'hildon-initscripts' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-initscripts']
NOTE: Runtime target 'osso-thumbnail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['osso-thumbnail']
NOTE: Runtime target 'hildon-lgpl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-lgpl']
NOTE: Runtime target 'libhildonbase' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libhildonbase']
NOTE: Runtime target 'libhildonwidgets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libhildonwidgets']
NOTE: Runtime target 'hildon-fm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-fm']
NOTE: Runtime target 'hildon-home' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-home']
NOTE: Runtime target 'hildon-navigator' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-navigator']
NOTE: Runtime target 'osso-screenshot-tool' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['osso-screenshot-tool']
NOTE: Runtime target 'gpe-contacts-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-contacts-hildon']
NOTE: Runtime target 'gpe-mini-browser-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-mini-browser-hildon']
NOTE: Runtime target 'opie-dagger' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['opie-dagger']
NOTE: Runtime target 'task-opie-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-apps',
'opie-dagger']
NOTE: Runtime target 'task-opie-extra-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-extra-apps',
'opie-dagger']
NOTE: Runtime target 'clutter-gtk-0.6' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-gtk-0.6']
NOTE: Runtime target 'udev-compat-wrapper' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['udev-compat-wrapper']
NOTE: Runtime target 'udev-compat141' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['udev-compat141']
NOTE: Runtime target 'task-openprotium' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openprotium']
NOTE: Runtime target '${DISTRO_SSH_DAEMON}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_SSH_DAEMON}']
NOTE: Runtime target '${DISTRO_DEV_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_DEV_MANAGER}']
NOTE: Runtime target '${DISTRO_INIT_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_INIT_MANAGER}']
NOTE: Runtime target '${DISTRO_LOGIN_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_LOGIN_MANAGER}']
NOTE: Runtime target 'python-etk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-etk']
NOTE: Runtime target 'task-python-sharprom' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-python-sharprom']
NOTE: Runtime target 'task-shr-minimal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal']
NOTE: Runtime target 'libmsgenabler2' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsgenabler2']
NOTE: Runtime target 'libmsip' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsip']
NOTE: Runtime target 'task-openmoko-python-devel' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['task-openmoko-python-devel']
NOTE: Runtime target 'matchbox-panel-2-applets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['matchbox-panel-2-applets']
NOTE: Runtime target 'task-openmoko-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko-base',
'matchbox-panel-2-applets']
NOTE: Runtime target 'task-openmoko' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko',
'task-openmoko-base', 'matchbox-panel-2-applets']
NOTE: Runtime target 'task-xqtlauncher' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-xqtlauncher']
NOTE: Runtime target 'xqtlauncher-blackbox-config' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['xqtlauncher-blackbox-config']
NOTE: Runtime target 'omoney' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['omoney']
NOTE: Runtime target 'opkg-ipkg-compat' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['opkg-ipkg-compat']
NOTE: Runtime target 'e2fsprogs-libs-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-libs-dev']
NOTE: Runtime target 'task-arago-toolchain-target' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['task-arago-toolchain-target',
'e2fsprogs-libs-dev']
NOTE: Runtime target 'task-arago-toolchain-dvsdk-target' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['task-arago-toolchain-dvsdk-target', 'task-arago-toolchain-target',
'e2fsprogs-libs-dev']
NOTE: Runtime target 'libpng12-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libpng12-dev']
NOTE: Runtime target 'nylon-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nylon-feed']
NOTE: Runtime target 'task-mamona-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona-base']
NOTE: Runtime target 'xserver-kdrive-xomap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xserver-kdrive-xomap']
NOTE: Runtime target 'nodejs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nodejs']
NOTE: Runtime target 'esc-node-demo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['esc-node-demo', 'nodejs']
NOTE: Runtime target 'xvidcap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xvidcap']
NOTE: Runtime target 'virtual/xserver' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virtual/xserver']
NOTE: Runtime target 'maemo-task-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-base']
NOTE: Runtime target 'maemo-task-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-apps']
NOTE: Runtime target 'maemo-task-libs-install' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-libs-install']
NOTE: Runtime target 'maemo-task-theme' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-theme']
NOTE: Runtime target 'task-shr-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-feed']
NOTE: Runtime target 'python-uuid' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-uuid']
NOTE: Runtime target 'cnetworkmanager' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['cnetworkmanager',
'python-uuid']
NOTE: Runtime target 'etk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['etk']
NOTE: Runtime target 'sugar-web-activity' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sugar-web-activity']
NOTE: Runtime target 'libgpepimc-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libgpepimc-hildon']
NOTE: Runtime target 'hildon-base-lib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-base-lib']
NOTE: Runtime target 'hildon-libs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-libs']
NOTE: Runtime target 'gconf-osso' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gconf-osso']
NOTE: Runtime target 'epsilon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['epsilon']
NOTE: Runtime target 'libmsip0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsip0']
NOTE: Runtime target 'libmikey0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmikey0']
NOTE: Runtime target 'xmu' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xmu']
NOTE: Runtime target 'evas-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['evas-fb']
NOTE: Runtime target 'esmart-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['esmart-fb']
NOTE: Runtime target 'imlib2-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['imlib2-fb']
NOTE: Runtime target 'efl++-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['efl++-fb']
NOTE: Runtime target 'codec-engine' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['codec-engine']
NOTE: Runtime target 'sword' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sword']
NOTE: Runtime target 'clutter-0.6' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-0.6']
NOTE: Runtime target 'libmnetutil0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmnetutil0']
NOTE: Runtime target 'xdamage' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xdamage']
NOTE: Runtime target 'bluez-cups-backend' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-cups-backend',
'bluez-libs-3.36']
NOTE: Runtime target 'bluez-gstreamer-plugin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-gstreamer-plugin',
'bluez-libs-3.36']
NOTE: Runtime target 'bluez-utils-alsa' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-utils-alsa',
'bluez-libs-3.36']
NOTE: Runtime target 'ti-codec-engine-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-codec-engine-sdk']
NOTE: Runtime target 'task-arago-toolchain-dvsdk-host' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['task-arago-toolchain-dvsdk-host', 'ti-codec-engine-sdk']
NOTE: Runtime target 'ti-codec-combo-omap3530-sdk' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['ti-codec-combo-omap3530-sdk']
NOTE: Runtime target 'ti-xdctools-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-xdctools-sdk']
NOTE: Runtime target 'ti-dmai-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-dmai-sdk']
NOTE: Runtime target 'ti-dspbios-sdk' is unbuildable, removing...
Missing or unbuildable dependeNOTE: Runtime target 'exhibit' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['exhibit']
NOTE: Runtime target 'task-openmoko-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko-feed',
'exhibit']
NOTE: Runtime target 'om-locations' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['om-locations']
NOTE: Runtime target 'om-settings' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['om-settings']
NOTE: Runtime target 'assassin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['assassin']
NOTE: Runtime target 'assassin-thumbnail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['assassin-thumbnail']
NOTE: Runtime target 'python-hmm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-hmm']
NOTE: Runtime target 'python-itools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-itools']
NOTE: Runtime target 'python-lightmediascanner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-lightmediascanner']
NOTE: Runtime target 'python-pyreverse' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-pyreverse']
NOTE: Runtime target 'python-snmplib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-snmplib']
NOTE: Runtime target 'python-spyro' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-spyro']
NOTE: Runtime target 'python-urwid' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-urwid']
NOTE: Runtime target 'python-vmaps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-vmaps']
NOTE: Runtime target 'twisted' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['twisted']
NOTE: Runtime target 'xqt2' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xqt2']
NOTE: Runtime target 'xqtlauncher' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xqtlauncher']
NOTE: Runtime target 'gstreamer-ti-demo-script' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gstreamer-ti-demo-script']
NOTE: Runtime target 'task-gstreamer-ti' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-gstreamer-ti',
'gstreamer-ti-demo-script']
NOTE: Runtime target 'task-demo-x11' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-demo-x11']
NOTE: Runtime target 'libgles-omap3-demos' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libgles-omap3-demos']
NOTE: Runtime target 'bc-cat-omap3-module-tests' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bc-cat-omap3-module-tests']
NOTE: Runtime target 'edje-player' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['edje-player']
NOTE: Runtime target 'edje-editor' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['edje-editor']
NOTE: Runtime target 'sugar-fructose' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sugar-fructose']
NOTE: Runtime target '|' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['|']
NOTE: Runtime target 'e2fsprogs-uuidgen' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-uuidgen']
NOTE: Runtime target 'gpe-todo-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-todo-hildon']
NOTE: Runtime target 'evolve' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['evolve']
NOTE: Runtime target 'osso-application-installer' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['osso-application-installer']
NOTE: Runtime target 'bluez-utils-compat' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-utils-compat']
NOTE: Runtime target 'task-mamona' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona',
'bluez-utils-compat']
NOTE: Runtime target 'diversity-radar' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['diversity-radar']
NOTE: Runtime target 'lessertunjo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lessertunjo']
NOTE: Runtime target 'omview' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['omview']
NOTE: Runtime target 'epsilon-thumbd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['epsilon-thumbd']
NOTE: Runtime target 'bt950-cs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bt950-cs']
NOTE: Runtime target 'minisip' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['minisip']
NOTE: Runtime target 'systemtap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['systemtap']
NOTE: Runtime target 'task-mamona-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona-sdk']
NOTE: Runtime target 'task-qpe-applets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-applets']
NOTE: Runtime target 'task-qpe-games' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-games']
NOTE: Runtime target 'task-qpe-inputmethods' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-inputmethods']
NOTE: Runtime target 'task-qpe-multimedia' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-multimedia']
NOTE: Runtime target 'task-qpe-emulators' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-emulators']
NOTE: Runtime target 'task-qpe-applications' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-applications']
NOTE: Runtime target 'task-qpe-fonts' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-fonts']
NOTE: Runtime target 'task-qpe-settings' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-qpe-settings']
NOTE: Runtime target 'aterm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aterm']
NOTE: Runtime target 'dspgw-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dspgw-utils']
NOTE: Runtime target 'ipkgorphan' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ipkgorphan']
NOTE: Runtime target 'openmoko-today' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openmoko-today']
NOTE: Runtime target 'openmoko-session' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openmoko-session',
'openmoko-today']
NOTE: Runtime target 'comic-reader' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['comic-reader']
NOTE: Runtime target 'hildon-status-bar' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-status-bar']
NOTE: Runtime target 'angstrom-bootmanager' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['angstrom-bootmanager']
NOTE: Runtime target 'fso-apm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['fso-apm']
NOTE: Runtime target 'task-fso2-compliance' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-fso2-compliance',
'fso-apm']
NOTE: Runtime target 'vlc-davinci' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['vlc-davinci']
NOTE: Runtime target 'task-shr-minimal-cli' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal-cli']
NOTE: Runtime target 'task-shr-minimal-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal-apps']
NOTE: Runtime target 'eflpp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['eflpp']
NOTE: Runtime target 'ipkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ipkg']
NOTE: Runtime target 'task-sdk-sbox-gpe' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-sdk-sbox-gpe']
NOTE: Runtime target 'task-opie-bluetooth' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-bluetooth']
NOTE: Runtime target 'task-opie-irda' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-irda']
NOTE: Runtime target 'outo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['outo']
NOTE: Runtime target 'hildon-initscripts' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-initscripts']
NOTE: Runtime target 'osso-thumbnail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['osso-thumbnail']
NOTE: Runtime target 'hildon-lgpl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-lgpl']
NOTE: Runtime target 'libhildonbase' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libhildonbase']
NOTE: Runtime target 'libhildonwidgets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libhildonwidgets']
NOTE: Runtime target 'hildon-fm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-fm']
NOTE: Runtime target 'hildon-home' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-home']
NOTE: Runtime target 'hildon-navigator' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-navigator']
NOTE: Runtime target 'osso-screenshot-tool' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['osso-screenshot-tool']
NOTE: Runtime target 'gpe-contacts-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-contacts-hildon']
NOTE: Runtime target 'gpe-mini-browser-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gpe-mini-browser-hildon']
NOTE: Runtime target 'opie-dagger' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['opie-dagger']
NOTE: Runtime target 'task-opie-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-apps',
'opie-dagger']
NOTE: Runtime target 'task-opie-extra-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-opie-extra-apps',
'opie-dagger']
NOTE: Runtime target 'clutter-gtk-0.6' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-gtk-0.6']
NOTE: Runtime target 'udev-compat-wrapper' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['udev-compat-wrapper']
NOTE: Runtime target 'udev-compat141' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['udev-compat141']
NOTE: Runtime target 'task-openprotium' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openprotium']
NOTE: Runtime target '${DISTRO_SSH_DAEMON}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_SSH_DAEMON}']
NOTE: Runtime target '${DISTRO_DEV_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_DEV_MANAGER}']
NOTE: Runtime target '${DISTRO_INIT_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_INIT_MANAGER}']
NOTE: Runtime target '${DISTRO_LOGIN_MANAGER}' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${DISTRO_LOGIN_MANAGER}']
NOTE: Runtime target 'python-etk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-etk']
NOTE: Runtime target 'task-python-sharprom' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-python-sharprom']
NOTE: Runtime target 'task-shr-minimal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-minimal']
NOTE: Runtime target 'libmsgenabler2' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsgenabler2']
NOTE: Runtime target 'libmsip' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsip']
NOTE: Runtime target 'task-openmoko-python-devel' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['task-openmoko-python-devel']
NOTE: Runtime target 'matchbox-panel-2-applets' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['matchbox-panel-2-applets']
NOTE: Runtime target 'task-openmoko-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko-base',
'matchbox-panel-2-applets']
NOTE: Runtime target 'task-openmoko' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-openmoko',
'task-openmoko-base', 'matchbox-panel-2-applets']
NOTE: Runtime target 'task-xqtlauncher' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-xqtlauncher']
NOTE: Runtime target 'xqtlauncher-blackbox-config' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['xqtlauncher-blackbox-config']
NOTE: Runtime target 'omoney' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['omoney']
NOTE: Runtime target 'opkg-ipkg-compat' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['opkg-ipkg-compat']
NOTE: Runtime target 'e2fsprogs-libs-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-libs-dev']
NOTE: Runtime target 'task-arago-toolchain-target' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['task-arago-toolchain-target',
'e2fsprogs-libs-dev']
NOTE: Runtime target 'task-arago-toolchain-dvsdk-target' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['task-arago-toolchain-dvsdk-target', 'task-arago-toolchain-target',
'e2fsprogs-libs-dev']
NOTE: Runtime target 'libpng12-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libpng12-dev']
NOTE: Runtime target 'nylon-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nylon-feed']
NOTE: Runtime target 'task-mamona-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-mamona-base']
NOTE: Runtime target 'xserver-kdrive-xomap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xserver-kdrive-xomap']
NOTE: Runtime target 'nodejs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nodejs']
NOTE: Runtime target 'esc-node-demo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['esc-node-demo', 'nodejs']
NOTE: Runtime target 'xvidcap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xvidcap']
NOTE: Runtime target 'virtual/xserver' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virtual/xserver']
NOTE: Runtime target 'maemo-task-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-base']
NOTE: Runtime target 'maemo-task-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-apps']
NOTE: Runtime target 'maemo-task-libs-install' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-libs-install']
NOTE: Runtime target 'maemo-task-theme' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['maemo-task-theme']
NOTE: Runtime target 'task-shr-feed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-shr-feed']
NOTE: Runtime target 'python-uuid' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-uuid']
NOTE: Runtime target 'cnetworkmanager' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['cnetworkmanager',
'python-uuid']
NOTE: Runtime target 'etk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['etk']
NOTE: Runtime target 'sugar-web-activity' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sugar-web-activity']
NOTE: Runtime target 'libgpepimc-hildon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libgpepimc-hildon']
NOTE: Runtime target 'hildon-base-lib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-base-lib']
NOTE: Runtime target 'hildon-libs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['hildon-libs']
NOTE: Runtime target 'gconf-osso' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gconf-osso']
NOTE: Runtime target 'epsilon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['epsilon']
NOTE: Runtime target 'libmsip0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsip0']
NOTE: Runtime target 'libmikey0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmikey0']
NOTE: Runtime target 'xmu' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xmu']
NOTE: Runtime target 'evas-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['evas-fb']
NOTE: Runtime target 'esmart-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['esmart-fb']
NOTE: Runtime target 'imlib2-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['imlib2-fb']
NOTE: Runtime target 'efl++-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['efl++-fb']
NOTE: Runtime target 'codec-engine' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['codec-engine']
NOTE: Runtime target 'sword' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sword']
NOTE: Runtime target 'clutter-0.6' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-0.6']
NOTE: Runtime target 'libmnetutil0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmnetutil0']
NOTE: Runtime target 'xdamage' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xdamage']
NOTE: Runtime target 'bluez-cups-backend' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-cups-backend',
'bluez-libs-3.36']
NOTE: Runtime target 'bluez-gstreamer-plugin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-gstreamer-plugin',
'bluez-libs-3.36']
NOTE: Runtime target 'bluez-utils-alsa' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-utils-alsa',
'bluez-libs-3.36']
NOTE: Runtime target 'ti-codec-engine-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-codec-engine-sdk']
NOTE: Runtime target 'task-arago-toolchain-dvsdk-host' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['task-arago-toolchain-dvsdk-host', 'ti-codec-engine-sdk']
NOTE: Runtime target 'ti-codec-combo-omap3530-sdk' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['ti-codec-combo-omap3530-sdk']
NOTE: Runtime target 'ti-xdctools-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-xdctools-sdk']
NOTE: Runtime target 'ti-dmai-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-dmai-sdk']
NOTE: Runtime target 'ti-dspbios-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-dspbios-sdk']
NOTE: Runtime target 'ti-cgt6x-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-cgt6x-sdk']
NOTE: Runtime target 'ti-legacy-dvsdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-legacy-dvsdk']
NOTE: Runtime target 'etk-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['etk-native']
NOTE: Runtime target 'bluez-libs-3.36' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-libs-3.36']
ncy chain was: ['ti-dspbios-sdk']
NOTE: Runtime target 'ti-cgt6x-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-cgt6x-sdk']
NOTE: Runtime target 'ti-legacy-dvsdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-legacy-dvsdk']
NOTE: Runtime target 'etk-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['etk-native']
NOTE: Runtime target 'bluez-libs-3.36' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-libs-3.36']
ncy chain was: ['epsilon']
NOTE: Runtime target 'libmsip0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmsip0']
NOTE: Runtime target 'libmikey0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmikey0']
NOTE: Runtime target 'xmu' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xmu']
NOTE: Runtime target 'evas-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['evas-fb']
NOTE: Runtime target 'esmart-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['esmart-fb']
NOTE: Runtime target 'imlib2-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['imlib2-fb']
NOTE: Runtime target 'efl++-fb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['efl++-fb']
NOTE: Runtime target 'codec-engine' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['codec-engine']
NOTE: Runtime target 'sword' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sword']
NOTE: Runtime target 'clutter-0.6' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-0.6']
NOTE: Runtime target 'libmnetutil0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libmnetutil0']
NOTE: Runtime target 'xdamage' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xdamage']
NOTE: Runtime target 'bluez-cups-backend' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-cups-backend',
'bluez-libs-3.36']
NOTE: Runtime target 'bluez-gstreamer-plugin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-gstreamer-plugin',
'bluez-libs-3.36']
NOTE: Runtime target 'bluez-utils-alsa' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-utils-alsa',
'bluez-libs-3.36']
NOTE: Runtime target 'ti-codec-engine-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-codec-engine-sdk']
NOTE: Runtime target 'task-arago-toolchain-dvsdk-host' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['task-arago-toolchain-dvsdk-host', 'ti-codec-engine-sdk']
NOTE: Runtime target 'ti-codec-combo-omap3530-sdk' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['ti-codec-combo-omap3530-sdk']
NOTE: Runtime target 'ti-xdctools-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-xdctools-sdk']
NOTE: Runtime target 'ti-dmai-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-dmai-sdk']
NOTE: Runtime target 'ti-dspbios-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-dspbios-sdk']
NOTE: Runtime target 'ti-cgt6x-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-cgt6x-sdk']
NOTE: Runtime target 'ti-legacy-dvsdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ti-legacy-dvsdk']
NOTE: Runtime target 'etk-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['etk-native']
NOTE: Runtime target 'bluez-libs-3.36' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-libs-3.36']

Same question as before: what are we doing with these recipes?
fix? (who?) ignore? move to non-buildable dir? remove ?
Opinions wanted


multiple providers:
==============

NOTE: multiple providers are available for bluez-utils-dbus (bluez4,
bluez-cups-backend, bluez-gstreamer-plugin, bluez-utils-alsa)
NOTE: multiple providers are available for wxwidgets (wxwidgets,
wxwidgets-opengl, wxwidgets-ansi)
NOTE: multiple providers are available for runtime e-wm-menu (e-wm,
menu-freesmartphone)
NOTE: multiple providers are available for runtime x11vnc (x11vnc,
libvncserver)
NOTE: multiple providers are available for runtime gnash-browser-plugin
(gnash, gnash-fb)
NOTE: multiple providers are available for runtime arora-data (arora-e,
arora)
NOTE: multiple providers are available for runtime java2-runtime (cacao,
jamvm, openjdk-6-jre)
NOTE: multiple providers are available for runtime gst-plugin-avi
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-matroska
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-mpegstream
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-mpegaudioparse
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-mpegvideoparse
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-mpeg2dec
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-playbin
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-decodebin
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-volume
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-audioconvert
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-audioresample
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime
gst-plugin-typefindfunctions (gst-plugins-bad, gst-plugins-good,
gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-autodetect
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-debug
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-audiotestsrc
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-videotestsrc
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-ivorbisdec
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-ogg
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-mad
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-id3demux
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-wavparse
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-gnomevfs
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-alsa
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-ximagesink
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-videoscale
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-videorate
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime
gst-plugin-ffmpegcolorspace (gst-plugins-bad, gst-plugins-good,
gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime abiword (abiword,
abiword-embedded)
NOTE: multiple providers are available for runtime libstdc++-dev (gcc,
external-toolchain-csl, external-toolchain-generic, external-toolchain)
NOTE: multiple providers are available for runtime gst-plugins-base-meta
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugins-good-meta
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugins-bad-meta
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugins-ugly-meta
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime esd (esound, osso-esd)
NOTE: multiple providers are available for runtime libltdl (libtool-sdk,
libtool)
NOTE: multiple providers are available for runtime module-init-tools-depmod
(module-init-tools, module-init-tools-cross)
NOTE: multiple providers are available for runtime xcursor-transparent-theme
(xcursor-transparent-theme, xcursor-watchonly-theme)
NOTE: multiple providers are available for runtime hotplug (udev,
hotplug-ng, linux-hotplug)
NOTE: multiple providers are available for runtime gdbserver (gdbserver,
gdb)
NOTE: multiple providers are available for runtime libmysqlclient-dev
(mysql5, mysql)
NOTE: multiple providers are available for runtime gst-plugin-dvb
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime libltdl-dev (libtool-sdk,
libtool)
NOTE: multiple providers are available for runtime abiword-plugin-collab
(abiword, abiword-plugins)
NOTE: multiple providers are available for runtime libmysqlclient (mysql5,
mysql)
NOTE: multiple providers are available for runtime gst-plugin-app
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-video4linux2
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime e-wm-sysactions (e-wm,
e-wm-sysactions-shr)
NOTE: multiple providers are available for runtime lxsession-lite
(lxsession-lite, lxsession)
NOTE: multiple providers are available for runtime virtual-japanese-font
(qpf-unismall, qpf-unifont)
NOTE: multiple providers are available for runtime busybox-static
(busybox-static, busybox)
NOTE: multiple providers are available for runtime xfwm4-theme-default
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime libpanel-applet
(gnome-panel, libgweather)
NOTE: multiple providers are available for runtime xserver-kdrive-fbdev
(xserver-kdrive, xserver-kdrive-1300)
NOTE: multiple providers are available for runtime
openmoko-sound-theme-standard (openmoko-sound-theme-standard,
openmoko-sound-theme-standard2)
NOTE: multiple providers are available for runtime dvbtraffic (dvbtraffic,
dvb-apps)
NOTE: multiple providers are available for runtime libgcc-dev (gcc,
external-toolchain-csl, external-toolchain-generic, external-toolchain)
NOTE: multiple providers are available for runtime bl (bl, gpe-conf)
NOTE: multiple providers are available for runtime gst-plugin-vorbis
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-decodebin2
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-xvimagesink
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-flv
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-nuvdemux
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-a52dec
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-ossaudio
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime midpath
(midpath-openmoko, midpath-maemo)
NOTE: multiple providers are available for runtime libfftw3 (fftw, fftwl,
fftwf)
NOTE: multiple providers are available for runtime openmoko-sound-system
(openmoko-sound-system, openmoko-sound-system2)
NOTE: multiple providers are available for runtime gst-plugins
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-audio
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-audiofile
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-esd
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-tagedit
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-ivorbis
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-tcp
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-schroedinger
(gst-plugin-schroedinger, schroedinger)
NOTE: multiple providers are available for runtime xfwm4-theme-daloa
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-moheli
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-default-4.0
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-default-4.2
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-default-4.4
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-kokodi
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-sassandra
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-stoneage
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-therapy
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-tyrex
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime xfwm4-theme-wallis
(xfwm4-themes, xfwm4)
NOTE: multiple providers are available for runtime dialog-static
(dialog-static, dialog)
NOTE: multiple providers are available for runtime gst-plugin-flac
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-souphttpsrc
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-mms
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-modplug
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime gst-plugin-sid
(gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
NOTE: multiple providers are available for runtime frameworkd-config
(frameworkd-config-shr, frameworkd)
NOTE: multiple providers are available for runtime xserver-kdrive
(xserver-kdrive, xserver-kdrive-1300)

Some of these are quite explainable, but there are also some where I
seriously question why they exist.
Some cleaning seems desirable


I would like to see some discussion on how to move forward with this.

As I write the build is still running. When done I'll report back with a
list of recipes that are not buildable (but guess that will take a day or
so)

Frans.

