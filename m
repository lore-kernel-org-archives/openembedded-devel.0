Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QsrAf-0003K9-Ik for openembedded-devel@lists.openembedded.org;
	Mon, 15 Aug 2011 09:01:13 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qsr6F-0004uw-9v for openembedded-devel@lists.openembedded.org;
	Mon, 15 Aug 2011 08:56:39 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2011 08:56:39 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2011 08:56:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 15 Aug 2011 08:56:27 +0200
Message-ID: <j2afur$7dv$1@dough.gmane.org>
References: <1313255615-14503-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1313255615-14503-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.2
Subject: Re: [meta-xfce][PATCH v2] xfce4-screenshooter: Add initial recipe with version 1.8.0
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
X-List-Received-Date: Mon, 15 Aug 2011 07:01:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Applied, thanks!

Op 13-08-11 19:13, Andreas Mueller schreef:
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de> --- .../xfce4-screenshooter_1.8.0.bb                   |   21 ++++++++++++++++++++ 1 files changed, 21 insertions(+), 0 deletions(-) create mode 100644
> meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
> 
> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb new file mode 100644 index 0000000..ef409c1 --- /dev/null +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb @@
> -0,0 +1,21 @@ +DESCRIPTION = "Application to take screenshots" +HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-screenshooter" +SECTION = "x11/application" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855" +DEPENDS = "xfce4-panel
> libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11" + +PR = "r0" + +inherit xfce + +# SRC_URI must follow inherited one +# decoded to e.g. http://archive.xfce.org/src/apps/xfce4-screenshooter/1.8/xfce4-screenshooter-1.8.0.tar.bz2 +SRC_URI =
> "http://archive.xfce.org/src/apps/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2 \ +" + +FILES_${PN} += "${datadir}/xfce4/panel-plugins/*" +FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug" + +SRC_URI[md5sum] = "b51ab5725418e7258273c4a6402adb02" +SRC_URI[sha256sum] =
> "68748a42ae68c5a8e9ed1c14ec5c741a344ab30b5b325b8812220539548ad83e"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOSMMbMkyGM64RGpERArRsAJ4uflLk9ePUMZF8h7mth4pqe+7mbACgt1l/
sqsd7xHQD7SopaFwActpfuU=
=Gw1d
-----END PGP SIGNATURE-----



