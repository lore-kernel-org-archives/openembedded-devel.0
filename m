Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1URkvs-00056g-H5 for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 17:03:06 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1URkez-0007i7-IR for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 16:45:33 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 16:45:33 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 16:45:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 15 Apr 2013 16:45:28 +0200
Message-ID: <kkh3q2$gl0$1@ger.gmane.org>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <20130415141253.GC10628@jama.dyndns-home.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 15 Apr 2013 15:03:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-04-13 16:12, Martin Jansa schreef:
> Hi,
> 
> just reminder of pending build issues with distro-less qemuarm world
> buils, unfortunately a lot of these recipes are still there since I
> started to send "world build status", so I will comment only on new or
> suspicious entries.
> 
> Complete log as always available at 
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130415_033339.log/
>
>  qemux86 and qemux86-64 still running (one build takes +- 24hours)
> 
> # old entries: 
> meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb,
> do_compile 
> meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb,
> do_compile 
> meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb,
> do_compile 
> meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb,
> do_configure 
> openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb,
> do_compile 
> meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb,
> do_compile 
> meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb,
> do_compile 
> meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb,
> do_configure 
> meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb,
> do_compile 
> meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb,
> do_compile 
> meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb,
> do_configure openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb,
> do_compile 
> meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb,
> do_compile 
> meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,
> do_compile 
> meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb,
> do_compile 
> meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb,
> do_compile
> 
> *gnome*: biggest part of this is caused by libnotify3/libnotify conflicts
> and list of failing gnome recipes always is different, depending which
> libnotify version was built/reused from sstate first :/

Speaking of GNOME, I noticed that I have to manually (re)run postinst for
gconf schemas after first boot to get the apps to work. Is anyone seeing the
same?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRbBKIMkyGM64RGpERAnCnAKCxdb+wJRn7w+W7b0guKni0zRoKvwCbB/Ff
P1SN9I/Ch7aw4reNUvgyr5s=
=Am0B
-----END PGP SIGNATURE-----



