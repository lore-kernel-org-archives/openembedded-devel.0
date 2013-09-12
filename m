Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8D74D6028B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 16:15:38 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VK9YA-0000AJ-VD for openembedded-devel@lists.openembedded.org;
	Thu, 12 Sep 2013 18:15:22 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 18:15:22 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 18:15:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Sep 2013 18:14:26 +0200
Message-ID: <l0sp8p$8o0$1@ger.gmane.org>
References: <1378999913-22567-1-git-send-email-ross.burton@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <1378999913-22567-1-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-multimedia][PATCH] dleyna: switch to git clones instead of generated tarballs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Sep 2013 16:15:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-09-13 17:31, Ross Burton schreef:
> The tarballs used were the dynamically-generated tarballs from github,
> which recently have changed checksum.  Avoid this problem entirely by
> fetching from git, locked to the relevant tag.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> --- .../recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb        |
> 6 +++--- .../recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
> |    6 +++--- 2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git
> a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
> b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb 
> index 6d81ed2..fb0194b 100644 ---
> a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb 
> +++
> b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb 
> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
> 
> DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
> 
> -SRC_URI = "https://github.com/01org/${BPN}/archive/v${PV}.zip" 
> -SRC_URI[md5sum] = "9fc4db84b3459bc77232b24bde48b000" -SRC_URI[sha256sum]
> = "9cdee47bbbfa3de5aaa5cf3fc9e208ccd97e5079f6d8fa84a6d1f24a1b760237" 
> +SRC_URI = "git://github.com/01org/${BPN}.git" +SRCREV =
> "1996ecbe4a06c95d22f7d958e32e3d28f7a4a2e9" +S = "${WORKDIR}/git"
> 
> inherit autotools
> 
> diff --git
> a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
> b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
>
> 
index d23babe..478b1c7 100644
> ---
> a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
>
> 
+++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
> 
> DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
> 
> -SRC_URI = "https://github.com/01org/${BPN}/archive/v${PV}.zip" 
> -SRC_URI[md5sum] = "1e19349712a34dd56a14fc280b5d8b74" -SRC_URI[sha256sum]
> = "d6623d98dd35ee32bc08349b4a22d12101dda38a2ece1e468ff0160e519a854d" 
> +SRC_URI = "git://github.com/01org/${BPN}.git" +SRCREV =
> "4a0b1d7cd8e22d3cb0e09c77c344ceccbcbbd34f" +S = "${WORKDIR}/git"
> 
> inherit autotools
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSMehiMkyGM64RGpERAsTeAJ0R8qOVSYvcJ9iztlKzIa92UkongQCeNwjh
u3SRenLrGTVa/GjCncFhWjU=
=vWrd
-----END PGP SIGNATURE-----


