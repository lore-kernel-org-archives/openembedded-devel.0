Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9GBS-0007N6-F7 for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 16:02:22 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9FzX-0003Aj-SL for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:50:03 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 15:50:03 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 15:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 05 Sep 2012 15:45:21 +0200
Message-ID: <k27l12$e10$2@ger.gmane.org>
References: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
	<1346852108-16462-2-git-send-email-sander@outrightsolutions.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1346852108-16462-2-git-send-email-sander@outrightsolutions.nl>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH 2/2] ifuse: add recipe to expose files on Apple devices via fuse
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
X-List-Received-Date: Wed, 05 Sep 2012 14:02:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-09-12 15:35, Sander van Grieken schreef:
> Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl> --- 
> meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb |   16
> ++++++++++++++++ 1 file changed, 16 insertions(+) create mode 100644
> meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb
> 
> diff --git a/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb
> b/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb new file mode 100644 
> index 0000000..07131d6 --- /dev/null +++
> b/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb @@ -0,0 +1,16 @@

Missing DESCRIPTION

> +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7" +HOMEPAGE
> ="http://www.libimobiledevice.org/" + +DEPENDS = "fuse libimobiledevice" 
> + +PR = "r0"

Default, drop that

> + +SRC_URI = " \ +
> http://www.libimobiledevice.org/downloads/ifuse-${PV}.tar.bz2 \ +    " + 
> +SRC_URI[md5sum] = "4152526b2ac3c505cb41797d997be14d" +SRC_URI[sha256sum]
> = "47835c8afb72588b3202fe0b206d7ea37a68663d9aa4eaf73f0a4bcb6215fc05" + 
> +inherit autotools pkgconfig

And I suspect you need to add:

RRECOMMENDS_${PN} =+ "kernel-module-fuse"



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQR1dxMkyGM64RGpERAk17AKCVhnhiW2mFV5e5LUh8HG4fb7jz7ACfbB54
ePt2IZ0NL52LI6a+n8CDojY=
=LwZK
-----END PGP SIGNATURE-----



