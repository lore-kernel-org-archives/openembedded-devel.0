Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S0GJ7-0000sp-RM for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 18:48:49 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S0GB2-0002er-G9 for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 18:40:28 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 18:40:28 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 18:40:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Feb 2012 18:40:23 +0100
Message-ID: <ji399r$72u$1@dough.gmane.org>
References: <1329792457-3884-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1329792457-3884-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH] udev: Upgrade 180 -> 181
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
X-List-Received-Date: Wed, 22 Feb 2012 17:48:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-02-12 03:47, Khem Raj schreef:
> 180 does not compile with kmod-5

As a precaution: how did you test it?

regards,

Koen

> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
> .../recipes-core/udev/{udev_180.bb => udev_181.bb} |    5 +++-- 1 files
> changed, 3 insertions(+), 2 deletions(-) rename
> meta-oe/recipes-core/udev/{udev_180.bb => udev_181.bb} (95%)
> 
> diff --git a/meta-oe/recipes-core/udev/udev_180.bb
> b/meta-oe/recipes-core/udev/udev_181.bb similarity index 95% rename from
> meta-oe/recipes-core/udev/udev_180.bb rename to
> meta-oe/recipes-core/udev/udev_181.bb index 4cabcce..1e0a02a 100644 ---
> a/meta-oe/recipes-core/udev/udev_180.bb +++
> b/meta-oe/recipes-core/udev/udev_181.bb @@ -22,8 +22,9 @@ DEPENDS =
> "gperf-native usbutils acl glib-2.0 util-linux kmod" # version specific
> SRC_URI SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/${P}.tar.gz \ 
> file://gtk-doc.make" -SRC_URI[md5sum] =
> "7a74429e5b4d5cc3d389945774807e46" -SRC_URI[sha256sum] =
> "d8f021cc940da7c1f928e2e651c6aa00c5695f3227f560de4a65584e2f089115" + 
> +SRC_URI[md5sum] = "86fed9d76060c8157e550ca1b4ee3250" +SRC_URI[sha256sum]
> = "b4b0fb6553926bb83ff43b65df44f29a3bce0980a970bcc4a80d5e4f81946f30"
> 
> # generic SRC_URI SRC_URI += " \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9FKIQACgkQMkyGM64RGpHcQgCfdh9XbBY2PiWIPan2P9ie0l6x
uzwAnAkeAaFqawKu1OA57wAaeRSuJP0/
=U/fR
-----END PGP SIGNATURE-----



