Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rs8uZ-0007Xc-Nb for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 09:17:55 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rs8mx-00028d-Gx for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 09:10:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:10:03 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:10:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 31 Jan 2012 09:08:18 +0100
Message-ID: <jg87hd$beo$2@dough.gmane.org>
References: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-xfce][PATCH] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Tue, 31 Jan 2012 08:17:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-01-12 21:15, Peter Tworek schreef:
> Run tested on netbookpro.
> 
> Signed-off-by: Peter Tworek <tworaz666@gmail.com> --- 
> .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |   16
> ++++++++++++++++ 1 files changed, 16 insertions(+), 0 deletions(-) create
> mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> 
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb new file mode
> 100644 index 0000000..b2e5fb6 --- /dev/null +++
> b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb @@ -0,0 +1,16 @@ 
> +DESCRIPTION = "Lightweight desktop independent, GTK+ archive manager" 
> +HOMEPAGE = "http://xarchiver.sourceforge.net" +SECTION = "x11" +PR =
> "r0"

Please don't add new recipes with PR = r0. PR is going away soon and adding
the default value is just going to create more work.

> + +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" + +DEPENDS = "gtk+
> glib-2.0 xfce4-dev-tools" +RRECOMMENDS = "lzop zip"

RRECOMMENDS_${PN} and move it below do_install

> + +SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2" +SRC_URI[md5sum]
> = "2bc7f06403cc6582dd4a8029ec9d038d" +SRC_URI[sha256sum] =
> "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa677ad2a" + 
> +inherit gettext pkgconfig autotools gtk-icon-cache

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8noXIACgkQMkyGM64RGpFtrgCfSZ0ip0qivM9t9EXS4pmo2Qug
97sAoLaxOZuQzFtva3VNdPr5MLcs5Wya
=KJ/G
-----END PGP SIGNATURE-----



