Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N8Vio-000064-Jv
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 10:12:09 +0100
Received: by fxm1 with SMTP id 1so1857893fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 01:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mxTrFdclbBPuSAfa1cgvDUR+sNOLrJ1O+OoIMn3AltU=;
	b=P2Vc3XZ9h06dcD6Qs5RS34Z6N61zbwfkrhI9uQZc5VKcBaX7u63cyAjD3apAJ8mdju
	Vc8lXrbFkHDZQ7ZXCIxCg67ITotXZD8tyfIo/rFu0OZZUkRP2b8xK3woqOHnyHbQK30F
	1ytAngjCehj+xqGsZ5kZAhjcBsxB4kfanz/C0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kP/7e3LEufIuUIKWug0IOtqEVA8BYXukAdLxqUbw5MgAk33QNchagXuS6vjOA5NQvs
	3vrgTpogm/aT2N0pu4J2atMH1eho4J2lpWsIexkKh+Da9olaFPw9jGO528NmKXHD03aO
	mzlGxrnGBJacRxIjDN5h+Po7nR3LTq5O1BUZs=
Received: by 10.204.162.200 with SMTP id w8mr409436bkx.141.1258017047743;
	Thu, 12 Nov 2009 01:10:47 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm839338fxm.5.2009.11.12.01.10.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 12 Nov 2009 01:10:47 -0800 (PST)
Date: Thu, 12 Nov 2009 10:10:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091112091020.GE11484@jama>
References: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>
	<20091111153745.GA2533@xora-eee>
MIME-Version: 1.0
In-Reply-To: <20091111153745.GA2533@xora-eee>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] bitbake.conf: SRCPV always upgradeable paths for git recipes
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
X-List-Received-Date: Thu, 12 Nov 2009 09:12:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2009 at 03:37:45PM +0000, Graeme Gregory wrote:
> Signed-off-by: Graeme Gregory <dp@xora.org.uk>
> 
> For inclusion in .dev
> 
> Graeme

Thanks pushed.

What about SRCREV->SRCPV migration?

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


