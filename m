Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QoAVb-0006Sg-Vq for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 10:39:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QoARO-00012k-BO for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 10:35:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 10:35:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 10:35:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 02 Aug 2011 10:32:19 +0200
Message-ID: <j18cmj$j39$2@dough.gmane.org>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe 00/19] Add xfce48 desktop system to meta-oe
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
X-List-Received-Date: Tue, 02 Aug 2011 08:39:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Do you have a public repo where this can be pulled from?

Op 01-08-11 23:02, Andreas Mueller schreef:
> Run tested on pandaboard with color display errors and without display errors on overo (created a meta-gumstix for test - see [1]).
> 
> All tests were performed with xfce-base-image.bb for meta-angstrom which will be send out together with this patch series.
> 
> Known issues:
> 
> * This patch series needs iceauth for building and running properly. A patch was sent but is trapped for style-guide / license issues (see [2] and [3]) * xfwm4 must be started once manually on terminal-console to work properly. * thunar crashes -> gdb session required * All optional dependencies
> found in configure.ac / configure.in were set in DEPENDS. Some might be better in RRECOMMENDS * QA issues with desktop files and RPATH /usr/* redundancies * exo: gnomemount replacement for removable devices on desktop (see [4]) not yet finished ( copy on postinst? ) * exo: python bindings were
> removed (they are about to be moved to pyxfce see [5]) * Fix html creation on xfce-utils / xfce-session / xfwm / thunar / xfdesktop by individual patches. These patches will be removed on the next mainline versions see [6]
> 
> [1] https://gitorious.org/schnitzeltony-oe-meta/meta-gumstix [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/034169.html [3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/034176.html [4] http://wiki.xfce.org/gnomemount-replacement [5]
> http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560 [6] http://mail.xfce.org/pipermail/xfce4-dev/2011-July/028999.html
> 
> 
> Andreas Mueller (19): meta-xfce: Add layer information xfce.bbclass: A class for xfce-global settings xfce4-dev-tools: Add initial recipe with version 4.8.0 libxfce4util: Add initial recipe with version 4.8.1 garcon: Add initial recipe with version 0.1.8 exo: Add initial recipe with version
> 0.6.2 xfconf: Add initial recipe with version 4.8.0 libxfce4ui: Add initial recipe with version 4.8.0 xfce-utils: Add initial recipe with version 4.8.2 xfce4-panel: Add initial recipe with version 4.8.5 xfce4-session: Add initial recipe with version 4.8.1 xfce4-appfinder: Add initial recipe with
> version 4.8.0 xfwm4: Add initial recipe with version 4.8.1 xfce4-settings: Add initial recipe with version 4.8.2 thunar: Add initial recipe with version 1.2.2 xfdesktop: Add initial recipe with version 4.8.2 gtk-xfce-engine: Add initial recipe with version 2.8.1 xfce-terminal: Add initial recipe
> with version 0.4.8 task-xfce-base: Add initial recipe adding all recipes required for xfce desktop
> 
> meta-xfce/classes/xfce.bbclass                     |   11 + meta-xfce/conf/layer.conf                          |    9 + .../xfce-terminal/xfce-terminal_0.4.8.bb           |   20 + meta-xfce/recipes-xfce/exo/exo/configure.patch     |   43 ++ .../recipes-xfce/exo/exo/exo-no-tests-0.6.patch    |
> 12 + .../exo/exo/fix-qa-desktop-type-error.patch        |  531 ++++++++++++++++++++ meta-xfce/recipes-xfce/exo/exo/gnome-mount         |   64 +++ meta-xfce/recipes-xfce/exo/exo_0.6.2.bb            |   36 ++ meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb      |   14 + 
> .../gtk-xfce-engine/gtk-xfce-engine_2.8.1.bb       |   16 + .../recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb    |   14 + .../libxfce4util/libxfce4util_4.8.1.bb             |   14 + meta-xfce/recipes-xfce/tasks/task-xfce-base.bb     |   35 ++ .../thunar/thunar/relative-symlinks-docs.patch     |
> 28 + meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb      |   34 ++ .../xfce-utils/relative-symlinks-docs.patch        |   11 + .../recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb    |   27 + .../xfce4-appfinder/xfce4-appfinder_4.8.0.bb       |   12 + .../xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
> |   18 + .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb  |   34 ++ .../xfce4-session/relative-symlinks-docs.patch     |   11 + .../xfce4-session/xfce4-session_4.8.1.bb           |   32 ++ .../xfce4-settings/xfce4-settings_4.8.2.bb         |   12 + meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
> |   15 + .../xfdesktop/relative-symlinks-docs.patch         |   28 + .../recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb      |   19 + .../xfwm4/xfwm4/relative-symlinks-docs.patch       |   28 + meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb        |   37 ++ 28 files changed, 1165 insertions(+), 0
> deletions(-) create mode 100644 meta-xfce/classes/xfce.bbclass create mode 100644 meta-xfce/conf/layer.conf create mode 100644 meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb create mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch create mode 100644
> meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch create mode 100644 meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch create mode 100644 meta-xfce/recipes-xfce/exo/exo/gnome-mount create mode 100644 meta-xfce/recipes-xfce/exo/exo_0.6.2.bb create mode 100644
> meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb create mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.8.1.bb create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb create mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb create mode 100644
> meta-xfce/recipes-xfce/tasks/task-xfce-base.bb create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch create mode 100644 meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb create mode 100644 meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch create
> mode 100644 meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb create mode 100644 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb create mode 100644 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb create mode 100644
> meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.1.bb create mode 100644
> meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb create mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch create mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb create
> mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFON7YTMkyGM64RGpERAriDAJ9joYypN+gLdmlAeHV5L9b+YxO3JACgqSGk
CXBTmtwQPhAuenA79gw8mmk=
=Yh/C
-----END PGP SIGNATURE-----



