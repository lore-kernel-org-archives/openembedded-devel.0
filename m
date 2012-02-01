Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RsUke-0005lP-1n for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 08:37:08 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RsUd1-0004rg-HR for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 08:29:15 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 08:29:15 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 08:29:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 01 Feb 2012 08:29:05 +0100
Message-ID: <jgapk0$gd9$1@dough.gmane.org>
References: <1328044407-30273-1-git-send-email-tworaz666@gmail.com>
	<1328047522-19230-1-git-send-email-tworaz666@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1328047522-19230-1-git-send-email-tworaz666@gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-gnome][PATCH 2/2 v2] Add recipe for gnome-mplayer 1.0.5.
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
X-List-Received-Date: Wed, 01 Feb 2012 07:37:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-01-12 23:05, Peter Tworek schreef:
> Run tested on netbookpro.
> 
> Signed-off-by: Peter Tworek <tworaz666@gmail.com> --- 
> .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |   19
> +++++++++++++++++++ 1 files changed, 19 insertions(+), 0 deletions(-) 
> create mode 100644
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
> 
> diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
> b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb new file
> mode 100644 index 0000000..55e82b5 --- /dev/null +++
> b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb @@ -0,0
> +1,19 @@ +DESCRIPTION = "A GTK+ interface to MPlayer" +HOMEPAGE =
> "http://code.google.com/p/gnome-mplayer" +SECTION = "multimedia" + 
> +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552" + +DEPENDS = "gmtk
> gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver" 
> +RDEPENDS = "mplayer"

RDEPENDS_${PN} and move it down to its proper place


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8o6b8ACgkQMkyGM64RGpFR9gCglJ0TWZZ2llPc4Q+hWudsTiAq
JF8AnRT/uMr+xiblTJhmRlwpOBY0dk/S
=YgDw
-----END PGP SIGNATURE-----



