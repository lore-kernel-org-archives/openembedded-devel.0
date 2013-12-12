Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 96CCC6BEFB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2013 11:12:03 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Vr4BR-0001Mr-N1 for openembedded-devel@lists.openembedded.org;
	Thu, 12 Dec 2013 12:11:57 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2013 12:11:57 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2013 12:11:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Dec 2013 12:12:13 +0100
Message-ID: <l8c5l6$shd$1@ger.gmane.org>
References: <1386792469-1451-1-git-send-email-philip@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1386792469-1451-1-git-send-email-philip@balister.org>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] mcpp : Add recipe. mcpp is a c/c++ preprocessor.
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
X-List-Received-Date: Thu, 12 Dec 2013 11:12:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Philip Balister schreef op 11-12-13 21:07:
> Includes a patch from Zeroc to help with ice builds.
> 
> Signed-off-by: Philip Balister <philip@balister.org> ---
e/recipes-devtools/mcpp/mcpp_2.7.2.bb
b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
> new file mode 100644 index 0000000..6a635c5 --- /dev/null +++
> b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb @@ -0,0 +1,19 @@ 
> +DESCRIPTION = "MCPP is a portable C/C++ preprocessor"

S/DESCRIPTION/SUMMARY/

> +HOMEPAGE = "http://mcpp.sourceforge.net/" +LICENSE = "BSD"

LIC_FILES_CHKSUM goes here

> + +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \ +
> file://ice-mcpp.patch "

SRC_URI sums go here

> + +inherit autotools + +EXTRA_OECONF = " --enable-mcpplib " + 
> +BBCLASSEXTEND = "native nativesdk"

Delete everything below here

> + + +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5ca370b75ec890321888a00cea9bc1d5" + + 
> +SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05" +SRC_URI[sha256sum]
> = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSqZoNMkyGM64RGpERAkEmAJ95ZnPmjoXWeOY6RUV38Ef0WEQXZQCeN3ld
9YrSiUGZMnDs3qx1COBxhs8=
=XNJE
-----END PGP SIGNATURE-----


