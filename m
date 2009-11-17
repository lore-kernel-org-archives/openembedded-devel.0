Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NALA2-0001Qb-SD
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 11:19:49 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 170061C00239;
	Tue, 17 Nov 2009 11:18:26 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 035AA9001D;
	Tue, 17 Nov 2009 11:18:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan1.mnet-online.de [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id M1hO2IAzmRce; Tue, 17 Nov 2009 11:18:24 +0100 (CET)
Received: from moksoft.de (ppp-88-217-4-4.dynamic.mnet-online.de [88.217.4.4])
	by mail.mnet-online.de (Postfix) with ESMTP;
	Tue, 17 Nov 2009 11:18:24 +0100 (CET)
Received: from localhost by moksoft.de with esmtp (emil_U6DrhMVhLzepG);
	Tue, 17 Nov 2009 11:18:02 +0100
Date: Tue, 17 Nov 2009 11:18:02 +0100
From: mok@mnet-online.de
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20091117101802.GA26627@mrdenker.localdomain>
References: <1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
	<20091116134339.GC23383@jama>
	<1258379748.16625.8.camel@dax.rpnet.com>
	<20091117085518.GF23383@jama>
MIME-Version: 1.0
In-Reply-To: <20091117085518.GF23383@jama>
User-Agent: Mutt/1.5.19 (2009-01-05)
X-SA-Exim-Connect-IP: 212.18.0.10
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: SRCPV migration
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
X-List-Received-Date: Tue, 17 Nov 2009 10:19:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 17 Nov 2009, Martin Jansa wrote:

> BTW: SRCPV seems to be expanded in PV a bit sooner than SRCREV was,
> which with combination with BB_GIT_CLONE_FOR_SRCREV means that all git
> repositories are checked during recipe parsing (Klaus Kurzmann has a
> list of git repositories used in OE recipes which are not accessible)

this is the list of recipes, which are failing when enabling
BB_GIT_CLONE_FOR_SRCREV and using SRCPV... either because the SRC_URI is
not correct, or there is a srcrev set somewhere that does not exist
anymore...

recipes/avahi/mango-lassi_git.bb
recipes/clutter/clutter-gtk-0.6_git.bb
recipes/clutter/clutter-gtk_git.bb
recipes/clutter/clutter-gtk-0.8_git.bb
recipes/clutter/moblin-proto_git.bb
recipes/disko/disko_git.bb
recipes/gnuradio/gnuradio_git.bb
recipes/gstreamer/gst-omapfb_1.0.bb
recipes/gtk-theme-torturer/gtk-theme-torturer_git.bb
recipes/gtk-webcore/midori_git.bb
recipes/libgdbus/libgdbus_git.bb
recipes/linux/linux-davinci_git.bb
recipes/linux/linux-davinci_2.6.25.bb
recipes/linux/linux-davinci_2.6.27.bb
recipes/linux/linux-davinci_2.6.28.bb
recipes/linux/linux-davinci_2.6.30.bb
recipes/linux/linux-kirkwood_2.6.29.5.bb
recipes/linux/linux-kirkwood_2.6.30.5.bb
recipes/linux/linux-kirkwood_2.6.31.bb
recipes/linux/linux-neuros_git.bb
recipes/linux/linux-omap-pm_2.6.28.bb
recipes/linux/linux-omap-pm_2.6.29.bb
recipes/linux/linux-omap-pm_git.bb
recipes/linux/linux-omapzoom_git.bb
recipes/linux/linux-openmoko-2.6.24_git.bb
recipes/linux/linux-openmoko-2.6.28_git.bb
recipes/linux/linux-replicant_git.bb
recipes/linux/linux-xo_git.bb
recipes/linux/openezx-kernel_git.bb
recipes/madbufferfly/madbutterfly_git.bb
recipes/moblin/json-glib_git.bb
recipes/moblin/libccss_git.bb
recipes/moblin/librest_git.bb
recipes/moblin/moblin-menus_git.bb
recipes/moblin/mojito_git.bb
recipes/moblin/twitter-glib_git.bb
recipes/mux/mux_git.bb
recipes/neuros-public/neuros-app-photoalbum_git.bb
recipes/neuros-public/neuros-app-vplayer_git.bb
recipes/neuros-public/neuros-lib-gui_git.bb
recipes/neuros-public/neuros-lib-widgets_git.bb
recipes/neuros-public/neuros-mainmenu_git.bb
recipes/neuros-public/neuros-nwm_git.bb
recipes/neuros-public/neuros-qt-plugins_git.bb
recipes/openbsc/openbsc_git.bb
recipes/openmoko-projects/om-locations_git.bb
recipes/openmoko-projects/tichy_git.bb
recipes/toscoterm/toscoterm_git.bb
recipes/u-boot/u-boot-omap3_git.bb
recipes/vlc/vlc-davinci_0.8.6h.bb
recipes/x-load/x-load_git.bb
recipes/xorg-driver/xf86-video-omapfb_git.bb

-- 
Klaus 'mrmoku' Kurzmann


