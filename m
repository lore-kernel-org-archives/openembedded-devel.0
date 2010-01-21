Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NXwQU-0008Jv-9e
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:46:21 +0100
Received: (qmail 8342 invoked by uid 1003); 21 Jan 2010 12:44:00 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 21 Jan 2010 12:44:00 -0000
Message-ID: <4B584C0F.5090702@balister.org>
Date: Thu, 21 Jan 2010 07:43:59 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B564B3D.7020108@atmel.com>
In-Reply-To: <4B564B3D.7020108@atmel.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] Enable bmp and JPEG files for fbv
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
X-List-Received-Date: Thu, 21 Jan 2010 12:46:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2010 07:15 PM, Ulf Samuelsson wrote:
> Enable bmp and JPEG files for fbv
>
> Previously only supported PNG.
> Ungif still not supported
> Remove unneccesary whitespace
> Do not install manuals to target
>
> Signed-off-by: Ulf Samuelsson<ulf.samuelsson@atmel.com>

Ulf,

Thanks for the patches. Can you fix your commit messages to follow the 
form outlined in:

http://wiki.openembedded.net/index.php/Commit_log_example

Having everyone follow the same form makes it much easier to follow OE 
development by following the git short log.

Sorry I didn't make this comment earlier :(

Philip

> ---
>   recipes/fbv/fbv-1.0b/fbv-1.0b.patch |   12 ++++++++++++
>   recipes/fbv/fbv_1.0b.bb             |   21 +++++++++++----------
>   2 files changed, 23 insertions(+), 10 deletions(-)
>   create mode 100644 recipes/fbv/fbv-1.0b/fbv-1.0b.patch
>
> diff --git a/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
> b/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
> new file mode 100644
> index 0000000..6fbd1fb
> --- /dev/null
> +++ b/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
> @@ -0,0 +1,12 @@
> +diff -urN fbv-1.0b-0rig/Makefile fbv-1.0b/Makefile
> +--- fbv-1.0b-0rig/Makefile	2009-08-20 00:33:58.000000000 +0200
> ++++ fbv-1.0b/Makefile	2009-08-20 00:34:16.000000000 +0200
> +@@ -12,7 +12,7 @@
> + OBJECTS	= ${SOURCES:.c=.o}
> +
> + OUT	= fbv
> +-#LIBS	= -lungif -L/usr/X11R6/lib -ljpeg -lpng
> ++LIBS	= -L/usr/lib -ljpeg -lpng #-lungif
> +
> + all: $(OUT)
> + 	@echo Build DONE.
> diff --git a/recipes/fbv/fbv_1.0b.bb b/recipes/fbv/fbv_1.0b.bb
> index 04c7066..e593eb4 100644
> --- a/recipes/fbv/fbv_1.0b.bb
> +++ b/recipes/fbv/fbv_1.0b.bb
> @@ -1,25 +1,26 @@
>   DESCRIPTION = "Frame Buffer Viewer"
>   LICENSE = "GPL"
> -DEPENDS = "libpng"
> -PR = "r1"
> +DEPENDS = "libpng jpeg"
> +PR = "r2"
>
>   SRC_URI = "http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz \
> -	   file://cross_compile.patch;patch=1"
> +	file://cross_compile.patch;patch=1 \
> +	file://fbv-1.0b.patch;patch=1 \
> +	"
>
>   do_configure() {
> -	CC="${CC}" ./configure --without-libungif --without-bmp \
> -		--without-libjpeg
> +	CC="${CC}" ./configure --without-libungif
>   }
>
>   do_compile() {
>   	oe_runmake CFLAGS="-O2 -Wall -D_GNU_SOURCE -D__KERNEL_STRICT_NAMES" \
>   		CC="${CC}"
>   }
> +
>   do_install() {
>   	install -d ${D}${bindir}
> -        install -m 0755 fbv ${D}${bindir}
> -
> -        # man
> -        install -d ${D}${mandir}/man1/
> -        install -m 0644 fbv.1 ${D}${mandir}/man1/fbv.1
> +	install -m 0755 fbv ${D}${bindir}
>   }
> +
> +PACKAGES = "fbv"
> +


