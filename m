Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9A78D60135
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 20:12:02 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VKZij-0000eN-AB for openembedded-devel@lists.openembedded.org;
	Fri, 13 Sep 2013 22:12:01 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 22:12:01 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 22:12:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Sep 2013 22:11:54 +0200
Message-ID: <l0vrhv$bsr$1@ger.gmane.org>
References: <1379087323-27447-1-git-send-email-ml@communistcode.co.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <1379087323-27447-1-git-send-email-ml@communistcode.co.uk>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-oe][PATCHv4] libsoc: new recipe
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
X-List-Received-Date: Fri, 13 Sep 2013 20:12:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-09-13 17:48, Jack Mitchell schreef:
> From: Jack Mitchell <jack@embed.me.uk>
> 
> Signed-off-by: Jack Mitchell <jack@embed.me.uk> --- v3 -> v4 - Added
> libgcc in RDEPENDS
> 
> v2 -> v3 - Removed DEPENDS on libgcc - Removed autogen.sh pre-configure
> as was unneeded
> 
> v1 -> v2 -added signed-off-by
> 
> meta-oe/recipes-support/libsoc/libsoc_0.3.bb | 14 ++++++++++++++ 1 file
> changed, 14 insertions(+) create mode 100644
> meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> 
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb new file mode 100644 index
> 0000000..41ff8e6 --- /dev/null +++
> b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb @@ -0,0 +1,14 @@ +SUMMARY
> = "libsoc is a C library for interfacing with common SoC peripherals
> through generic kernel interfaces" +HOMEPAGE =
> "https://github.com/jackmitch/libsoc" + +LICENSE = "LGPLv2.1" 
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5" + +inherit
> autotools + +RDEPENDS_${PN} = "libgcc"

And a nitpick: please move R* variabled below do_install, in this case to
the bottom of the recipe.

> + +SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70" +SRC_URI =
> "git://github.com/jackmitch/libsoc.git" + +S = "${WORKDIR}/git"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSM3GKMkyGM64RGpERAjVeAKCsmVjaE/7sh+KLAVEQm2O/3/5LqgCdHdF8
xNpxd01pUYH9OH1Kv+UXPP0=
=1IWz
-----END PGP SIGNATURE-----


