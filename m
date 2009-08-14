Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbnC5-0007ED-IF
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 05:11:05 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7D2C71B10C13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 02:57:54 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Aug 2009 04:53:51 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <003d01ca049a$43702c60$ca508520$@Willis@Distant-earth.com>
In-Reply-To: <003d01ca049a$43702c60$ca508520$@Willis@Distant-earth.com>
MIME-Version: 1.0
Message-Id: <200908140453.51789.holger+oe@freyther.de>
Subject: Re: [PATCH] Fix build issue with gamin_0.1.8.bb and recent GCC/GLibC combos.
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
X-List-Received-Date: Fri, 14 Aug 2009 03:11:05 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 14 July 2009 17:46:31 John Willis wrote:
> Update gamin_0.1.8.bb to build with recent GCC and GLibC 2.8 > via addition
> of configure.in patch (use AC_USE_SYSTEM_EXTENSIONS instead of
> AC_ISC_POSIX).
>
> Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>

Signed-off-by: Holger Freyther <zecke@selfish.org>


the patch can not be applied because your mailer decided to wrap the lines. :)

z.

> ---
>  recipes/gamin/files/configure_ucred.patch |   11 +++++++++++
>  recipes/gamin/gamin_0.1.8.bb              |    3 ++-
>  2 files changed, 13 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/gamin/files/configure_ucred.patch
>
> diff --git a/recipes/gamin/files/configure_ucred.patch
> b/recipes/gamin/files/configure_ucred.patch
> new file mode 100644
> index 0000000..016c4df
> --- /dev/null
> +++ b/recipes/gamin/files/configure_ucred.patch
> @@ -0,0 +1,11 @@
> +--- trunk/configure.in	2007/08/06 08:35:56	326
> ++++ trunk/configure.in	2008/06/03 15:34:24	330
> +@@ -29,7 +29,7 @@
> +
> + AM_PROG_LIBTOOL
> +
> +-AC_ISC_POSIX
> ++AC_USE_SYSTEM_EXTENSIONS
> + AC_PROG_CC
> + AM_PROG_CC_STDC
> + AC_HEADER_STDC
> diff --git a/recipes/gamin/gamin_0.1.8.bb b/recipes/gamin/gamin_0.1.8.bb
> index 754f47d..2f35392
> --- a/recipes/gamin/gamin_0.1.8.bb
> +++ b/recipes/gamin/gamin_0.1.8.bb
> @@ -2,7 +2,8 @@ DESCRIPTION = "Gamin is a file and directory monitoring
> system defined to be a s
>  LICENSE = "LGPL"
>
>  SRC_URI = "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.tar.gz
> \
> -           file://no-abstract-sockets.patch;patch=1"
> +           file://no-abstract-sockets.patch;patch=1 \
> +           file://configure_ucred.patch;patch=1"
>
>  EXTRA_OECONF = " --without-python "


