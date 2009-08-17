Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Md3CZ-0004yP-4J
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:28:48 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id D97F41B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 14:15:24 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 16:11:08 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
	<1250515743-10823-2-git-send-email-msmith@cbnco.com>
In-Reply-To: <1250515743-10823-2-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
Message-Id: <200908171611.08535.holger+oe@freyther.de>
Subject: Re: [PATCH 2/3] mtools: don't install-info; fixes build on non-Debian hosts
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
X-List-Received-Date: Mon, 17 Aug 2009 14:28:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 17 August 2009 15:29:02 Michael Smith wrote:
> The install-info installed into staging by dpkg-native looks for
> /var/backups/infodir.bak and /usr/share/base-files/info.dir on
> the build system. On Debian/Ubuntu this is benign, but on other
> distros these files don't exist and the install fails.
>
> The info file is still installed, we just don't try to rebuild the
> nonexistent directory.
>
> There are cleaner ways to solve this in the long run:
>
> http://dev.openbossa.org/trac/mamona/ticket/139
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>


Signed-off-by: Holger Freyther <zecke@selfish.org>

again, no need to bump the PR.



> ---
>  recipes/mtools/mtools_4.0.10.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/mtools/mtools_4.0.10.bb
> b/recipes/mtools/mtools_4.0.10.bb index b53306a..18fbb7d 100644
> --- a/recipes/mtools/mtools_4.0.10.bb
> +++ b/recipes/mtools/mtools_4.0.10.bb
> @@ -13,12 +13,15 @@
> SRC_URI="http://ftp.gnu.org/gnu/mtools/mtools-${PV}.tar.bz2 \
> file://plainio.patch;patch=1 \
>  	file://use-sg_io.patch;patch=1"
>
> -S = "${WORKDIR}/mtools-${PV}"
> +PR = "r1"
>
>  inherit autotools
>
>  EXTRA_OECONF = "--without-x"
>
> +# Don't try to run install-info -- it'll fail on non-Debian build systems.
> +EXTRA_OEMAKE = "INSTALL_INFO="
> +
>  do_fix_perms() {
>  	chmod 644 ${S}/*.c ${S}/*.h
>  }


