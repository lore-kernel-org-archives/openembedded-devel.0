Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1O9YQH-0005I5-HT
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 08:49:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 1E890A43E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 07:45:47 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id IWq+h1l9zCX0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 07:45:40 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 4991EA43E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 07:45:39 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 40D1720ED2; Wed,  5 May 2010 07:45:27 +0100 (BST)
Date: Wed, 5 May 2010 07:45:27 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100505064527.GA2444@xora-desktop.xora.org.uk>
References: <1273041286-632-1-git-send-email-hvontres@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1273041286-632-1-git-send-email-hvontres@gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libtorrent / rtorrent: add latest upstream versions and fix crash on nslu2
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
X-List-Received-Date: Wed, 05 May 2010 06:49:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

You need to add a PACKAGE_ARCH_nlus2 = "${MACHINE_ARCH}" to this as its
now nslu2 specific.

Graeme

On Tue, May 04, 2010 at 11:34:46PM -0700, Henry von Tresckow wrote:
> - added version 0.12.6 of libtorrent and 0.8.6 of rtorrent
> - added FULL_OPTIMIZATION_nslu2 ="-mcpu=xscale -fexpensive-optimizations -frename-registers -O2 -fpermissive -fno-inline"
> These parameters were recommended at the rtorrent website (http://libtorrent.rakshasa.no/wiki/LibTorrentKnownIssues#NSLU2routersandxscalebaseddevices)
> 
> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
> ---
>  recipes/libtorrent/libtorrent_0.12.6.bb |   22 ++++++++++++++++++++++
>  recipes/libtorrent/rtorrent_0.8.6.bb    |   17 +++++++++++++++++
>  2 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libtorrent/libtorrent_0.12.6.bb
>  create mode 100644 recipes/libtorrent/rtorrent_0.8.6.bb
> 
> diff --git a/recipes/libtorrent/libtorrent_0.12.6.bb b/recipes/libtorrent/libtorrent_0.12.6.bb
> new file mode 100644
> index 0000000..075ce40
> --- /dev/null
> +++ b/recipes/libtorrent/libtorrent_0.12.6.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "library implementing the bittorrent protocol"
> +HOMEPAGE = "http://libtorrent.rakshasa.no"
> +SECTION = "libs/network"
> +LICENSE = "GPL"
> +DEPENDS = "libsigc++-2.0 openssl"
> +
> +SRC_URI = "http://libtorrent.rakshasa.no/downloads/libtorrent-${PV}.tar.gz"
> +PR = "r0.1"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--enable-aligned"
> +
> +FULL_OPTIMIZATION_nslu2 ="-mcpu=xscale -fexpensive-optimizations -frename-registers -O2 -fpermissive -fno-inline"
> +
> +do_stage() {
> +	autotools_stage_all
> +}
> +
> +
> +SRC_URI[md5sum] = "037499ed708aaf72988cee60e5a8d96b"
> +SRC_URI[sha256sum] = "7b02f33164966a05261e83bad76eef537198fefe76eaf57dfd64bb27c7d77129"
> diff --git a/recipes/libtorrent/rtorrent_0.8.6.bb b/recipes/libtorrent/rtorrent_0.8.6.bb
> new file mode 100644
> index 0000000..c765086
> --- /dev/null
> +++ b/recipes/libtorrent/rtorrent_0.8.6.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Console bittorrent client using libtorrent"
> +HOMEPAGE = "http://libtorrent.rakshasa.no"
> +SECTION = "libs/network"
> +LICENSE = "GPL"
> +DEPENDS = "libtorrent curl ncurses gnutls libgpg-error"
> +
> +SRC_URI = "http://libtorrent.rakshasa.no/downloads/rtorrent-${PV}.tar.gz \
> +           file://autoconf-cross-fix.patch;patch=1"
> +
> +PR = "r0"
> +
> +inherit autotools
> +
> +FULL_OPTIMIZATION_nslu2 ="-mcpu=xscale -fexpensive-optimizations -frename-registers -O2 -fpermissive -fno-inline"
> +
> +SRC_URI[md5sum] = "b804c45c01c40312926bcea6b55bb084"
> +SRC_URI[sha256sum] = "8c96c68e1524162abd1fc4b612d0c3d924fccc25159c0b3f208e69281f0b32db"
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


