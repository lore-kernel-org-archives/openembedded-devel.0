Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TkaS6-0000OR-HY for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 14:09:53 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TkaE5-00020T-BB for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 13:55:21 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 13:55:21 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 13:55:21 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Dec 2012 13:54:59 +0100
Message-ID: <kan4ms$786$1@ger.gmane.org>
References: <1355747077-21644-1-git-send-email-ross.burton@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <1355747077-21644-1-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.4.6
X-Enigmail-Draft-Status: 513
Subject: Re: [meta-multimedia PATCH V2] gst123: add package
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
X-List-Received-Date: Mon, 17 Dec 2012 13:09:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
> b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb new file
> mode 100644 index 0000000..7898b08 --- /dev/null +++
> b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb @@ -0,0
> +1,17 @@ +SUMMARY = "Flexible CLI player in the spirit of mpg123, based
> on GStreamer" +HOMEPAGE = "http://space.twc.de/~stefan/gst123.php" 
> +LICENSE = "LGPLv2.1+" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \ +
> file://src/gst123.cc;beginline=1;endline=19;md5=05d2f5d54b985b986c26af931d2084f8"
>
> 
+
> +DEPENDS = "libx11 gstreamer gst-plugins-base gtk+ ncurses" + +SRC_URI =
> "http://space.twc.de/~stefan/gst123/${BPN}-${PV}.tar.bz2 \ +
> file://display.patch" + +SRC_URI[md5sum] =
> "1e77767c9d6fecee5641f95804f160fe" +SRC_URI[sha256sum] =
> "89d1de025eca0466c125dcd6a11b64341bdf98ee4c03c3e5a12321d77cb8b0ce" + +PR
> = "r0"

Can you please remove PR=r0 from new submissions? It's superfluous and
doesn't actually make a difference when people add patches.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQzxYjMkyGM64RGpERAn3gAJ4/ggf8mAfnnXcBGhQFr9Q0AGQUrACgtVnO
v/1KDdk+ay2m/bpSJ5CZw/0=
=VvlP
-----END PGP SIGNATURE-----



