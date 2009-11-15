Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N9i6T-0006qS-I5
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 17:37:32 +0100
Received: by bwz9 with SMTP id 9so4623844bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 08:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=f5ftGGX1r/VmZYyJ7gktem1U0jL1CPoQ000Jozk53mQ=;
	b=skfubFnvJ5lhrsqq4aiaCe841nIOxZs0FriJtQCBA3N2lD/3PS0so2tX/WXYqFpunb
	GiqEYBdsYfBzygJDr0DKdWFjBbtL5dpHwXOoOU8BeLsMYBtsq+aqruXBYC7tWltnz75Q
	hLc7SdeiJGA5bmhCGJAMzW4Whstk9oMf2cFoY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=ZRv/1JI1aqYMtlv0K1zdeSDygb4uZTcgCOC9n9wm9Yn8g3tvIh3yjuPYSwEOTF3gj2
	d6NBpbW1wGrXlAGoy4dH7qAe+x8KdV4YRKaFx1cr4HlmbZFuJF7ScRqlKJEzQ59uvnGU
	ei1i9GkEEdIif8oGjfyPSfagHNQ1w4LRAccts=
Received: by 10.204.156.210 with SMTP id y18mr841476bkw.80.1258302967861;
	Sun, 15 Nov 2009 08:36:07 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm476059fxm.7.2009.11.15.08.36.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 15 Nov 2009 08:36:07 -0800 (PST)
Date: Sun, 15 Nov 2009 17:36:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091115163618.GA3317@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: SRCPV migration
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
X-List-Received-Date: Sun, 15 Nov 2009 16:37:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As I sent earlier as reply to [PATCH] bitbake.conf: SRCPV always upgradeable 
paths for git recipes.

First few changes are already in martin_jansa/srcpv branch. All changes to svn.bb 
recipes seems safe, so I would like to push them really soon. For git.bb changes
I need your advise/ack so please reply.

Original e-mail:

1) svn recipes with +svnr{SRCREV} could be just replaced with
+svnr{SRCPV} as the output should be the same

2) svn recipes with -r{SRCREV}, -svn{SRCREV}, -svnr{SRCREV}, +r{SRCREV},
+svn{SRCREV} unified to +svnr{SRCPV}? I'm not sure if '+' will be sorted
higher version wise, so do we need to bump PE?

3) git recipes with -git{SRCREV}, -gitr{SRCREV}, +git{SRCREV} unified to
+gitr{SRCPV} with PE bump?

Is there better way to create upgradeable path then bumping PE? Package
names/.ipk filenames are a bit ugly with PE imho.

Should I prepare one BIG patch for all recipes or commit them 1 by 1?

XorA said that migrating all recipes at once in his xora/angstrom-srcpv
branch was too much work to maintain and push. So I would like to push
it directly to oe.dev or with really short lived tmp branch, if all
agree that we should migrate all packages globally.

Some statistics:
1032 lines - grep -R "PV *=" recipes

571 "\(svn.bb\)\|\(git.bb\)\|\(SRCREV\)\|\(SRCPV\)"
342 "svn.bb"
258 "svn.bb.*SRCREV"
13  "svn.bb" | grep -v SRCREV | grep -v SRCDATE

without SRCDATEs
0   "svn.bb.*-r"
14  "svn.bb.*+svn\\$"
218 "svn.bb.*+svnr\\$" (this should be safe)

187 "git.bb"
42  "git.bb.*" | grep -v SRCREV (few with SRCDATE for git?)
0   "git.bb.*-git\\$"
32  "git.bb.*-gitr\\$"
18  "git.bb.*+git\\$"
100 "git.bb.*+gitr\\$"


Which should be resolved by package maintained maybe?
13  "svn.bb" | grep -v SRCREV | grep -v SRCDATE
      (probably should have SRCPV in PV, maybe its in PR)
./fltk/fltk2_svn.bb:PV = "1.9.9+svnr${SVNREL}"
./openscada/openscada_svn.bb:PV = "0.6.4"
./mythtv/mythtv_svn.bb:REALPV = "0.22"
./freesmartphone/fsoraw_svn.bb:PV = "0.0.1"
this should be easy:
./openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb:PV = "0.1.0+svn${SVNREV}"
./openmoko-panel-plugins/openmoko-panel-battery_svn.bb:PV = "0.1.1+svn${SVNREV}"
./openmoko-panel-plugins/openmoko-panel-bt_svn.bb:PV = "0.1.0+svn${SVNREV}"
./openmoko-panel-plugins/openmoko-panel-gps_svn.bb:PV = "0.1.0+svn${SVNREV}"
./openmoko-panel-plugins/openmoko-panel-memory_svn.bb:PV = "0.0.0+svn${SVNREV}"
./openmoko-panel-plugins/openmoko-panel-wifi_svn.bb:PV = "0.0.0+svn${SVNREV}"
./openmoko-panel-plugins/openmoko-panel-gsm_svn.bb:PV = "0.1.0+svn${SVNREV}"
./openmoko-panel-plugins/openmoko-panel-usb_svn.bb:PV = "0.1.0+svn${SVNREV}"
./openmoko-panel-plugins/openmoko-panel-clock_svn.bb:PV = "0.1.0+svn${SVNREV}"

42  "git.bb.*" | grep -v SRCREV (few with SRCDATE for git?)
./gnome/gnome-bluetooth_git.bb:PV = "2.28.1"
./libdlo/libdlo_git.bb:PV = "0.1.0"
./networkmanager/networkmanager_git.bb:PV = "0.7.1+git"
./networkmanager/cnetworkmanager_git.bb:PV = "0.8+git"
./networkmanager/netm-cli_git.bb:PV = "0.4+git"
./networkmanager/network-manager-applet_git.bb:PV = "0.7.1+git"
./cairo/cairo_git.bb:PV = "1.9.3"
./xorg-xserver/xserver-kdrive_git.bb:PV = "1.4+git${SRCDATE}"
./linux/linux-hackndev-2.6_git.bb:PV = "${K_MAJOR}.${K_MINOR}.${K_MICRO}-${HHV}"
./linux/linux-efika_2.6.21+git.bb:PV = "2.6.21+git${SRCDATE}"
./linux/linux-omap_git.bb:PV = "2.6.31"
./linux/linux-powerpc-fsl_git.bb:PV = "2.6.30"
./linux/linux-omap2_git.bb:PV = "2.6.26"
./kexecboot/kexecboot_git.bb:PV = "0.5"
./ekiga/ekiga_git.bb:PV = "3.2.6+git"
./moblin/nbtk_git.bb:PV = "0.8.0"
./moblin/hornsey_git.bb:PV = "0.0"
./moblin/bognor-regis_git.bb:PV = "0.4.1"
./moblin/bickley_git.bb:PV = "0.0"
./gtk-theme-torturer/gtk-theme-torturer_git.bb:PV = "0.0.0+git${SRCDATE}"
./matchbox-keyboard/mboxkbd-layouts-gui_git.bb:PV = "0.0+git5b42aeff36d930dc3a9b75eedc74dacfec45f43f"
./connman/connman-gnome_git.bb:PV = "0.5+git"
./connman/connman_git.bb:PV = "0.42+git"
./python/python-phoneutils_git.bb:PV = "0.0.2+gitr${SRCPV}"
./quake/quake3-pandora-gles_git.bb:PV = "0.0"
./gstreamer/gst-plugin-gles_git.bb:PV = "0.10"
./bluez/bluez-gnome_git.bb:PV = "0.10+git${SRCDATE}"
./mamona/mamona-input-methods_git.bb:PV = "0.1+git"
./mamona/mamonaim-e-applet_git.bb:PV = "0.1+git"
./xorg-lib/pixman_git.bb:PV = "0.17.1"
./packagekit/packagekit_git.bb:PV = "0.4.6+git"
./hal/hal_git.bb:PV = "0.5.9.1+git${SRCDATE}"
./hal/hal-info_git.bb:PV = "${SRCDATE}+git"
./xcb/xcb-demo_git.bb:PV = "0.1+git"
./xcb/libxcb_git.bb:PV = "1.0+git"
./xcb/xcb-util_git.bb:PV = "0.2+git"
./xcb/xcb-proto_git.bb:PV = "1.0+git"
./gphoto2/ptp-gadget_git.bb:PV = "1.1"
./clutter/clutter-gst-0.9_git.bb:PV = "0.9.0"
./clutter/clutter_0.8+git.bb:PV = "0.8.8"
./clutter/clutter-0.9_git.bb:PV = "1.1.0"
./geoclue/geoclue_git.bb:PV = "0.11.1"

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


