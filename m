Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RF7Tb-0000hf-7g for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 18:52:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RF7Ny-0003wC-2J for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 18:46:58 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Oct 2011 18:46:58 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Oct 2011 18:46:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 15 Oct 2011 18:46:44 +0200
Message-ID: <j7cddk$e0b$1@dough.gmane.org>
References: <1318696873-5478-1-git-send-email-koen@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1318696873-5478-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe 1/2] libdivecomputer: initial add
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
X-List-Received-Date: Sat, 15 Oct 2011 16:52:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

You might see these patches popping up some more, Khem and I are testing the
git hooks for patchwork.

Op 15-10-11 18:41, Koen Kooi schreef:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
> .../libdivecomputer/libdivecomputer_git.bb         |   16
> ++++++++++++++++ 1 files changed, 16 insertions(+), 0 deletions(-) create
> mode 100644
> meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> 
> diff --git
> a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb new
> file mode 100644 index 0000000..ac609a9 --- /dev/null +++
> b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb @@ -0,0
> +1,16 @@ +DESCRIPTION = "Libdivecomputer is a cross-platform and open
> source library for communication with dive computers from various
> manufacturers." +HOMEPAGE = "http://www.divesoftware.org/libdc/" + 
> +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24" + +DEPENDS =
> "libusb1" + +inherit autotools pkgconfig + +PV = "0.0.0" +SRCREV =
> "b7a6be15ca58cc8f89fbc8fa1a4c840e13d51092" +SRC_URI =
> "git://libdivecomputer.git.sourceforge.net/gitroot/libdivecomputer/libdivecomputer"
>
> 
+S = "${WORKDIR}/git"
> + +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOmbj0MkyGM64RGpERAqUaAJ9fV9XzntBnkW1PMPE6OTMGPd8bYACguiaD
EejKJlRKrvkSFQ6CkDAedk8=
=Je//
-----END PGP SIGNATURE-----



