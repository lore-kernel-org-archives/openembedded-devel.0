Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OVtCu-0005Py-Mf for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 23:28:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OVt8H-0007m4-E4 for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 23:23:17 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jul 2010 23:23:17 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jul 2010 23:23:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 05 Jul 2010 23:23:07 +0200
Message-ID: <i0tifs$aq3$1@dough.gmane.org>
References: <4C3137CF.8090503@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <4C3137CF.8090503@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gpsd_2.94.bb: fix CROSS COMPILE badness
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
X-List-Received-Date: Mon, 05 Jul 2010 21:28:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-07-10 03:39, Graham Gower wrote:
> configure.ac shouldn't check the host system for includes/libraries,
> disable checking for libusb.

I actually need libusb support for gpsd :(

> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
>  .../gpsd/files/2.94-remove-libusb-badness.patch    |   32 ++++++++++++++++++++
>  recipes/gpsd/gpsd_2.94.bb                          |    5 ++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/gpsd/files/2.94-remove-libusb-badness.patch
> 
> diff --git a/recipes/gpsd/files/2.94-remove-libusb-badness.patch b/recipes/gpsd/files/2.94-remove-libusb-badness.patch
> new file mode 100644
> index 0000000..1517ede
> --- /dev/null
> +++ b/recipes/gpsd/files/2.94-remove-libusb-badness.patch
> @@ -0,0 +1,32 @@
> +--- gpsd-2.94/configure.ac.orig	2010-07-05 11:01:08.000000000 +0930
> ++++ gpsd-2.94/configure.ac	2010-07-05 11:01:44.000000000 +0930
> +@@ -243,18 +243,18 @@
> + # /usr/include/libusb-*/libusb.h
> + #
> + AC_MSG_CHECKING([for libusb version >= 1.0.0])
> +-if test -f /usr/include/libusb-*/libusb.h ;
> +-then
> +-    usb=$(basename /usr/lib/libusb-*.so | sed -e s/\.so// -e s/^lib//)
> +-    AC_DEFINE([HAVE_LIBUSB], [], [will link with -l$usb; ])
> +-    LIBUSB=-l${usb}
> +-    INCUSB=-I/usr/include/lib${usb}
> +-    ac_libusb=yes
> +-    AC_MSG_RESULT([found.])
> +-else
> +-    ac_libusb=yes
> ++#if test -f /usr/include/libusb-*/libusb.h ;
> ++#then
> ++#    usb=$(basename /usr/lib/libusb-*.so | sed -e s/\.so// -e s/^lib//)
> ++#    AC_DEFINE([HAVE_LIBUSB], [], [will link with -l$usb; ])
> ++#    LIBUSB=-l${usb}
> ++#    INCUSB=-I/usr/include/lib${usb}
> ++#    ac_libusb=yes
> ++#    AC_MSG_RESULT([found.])
> ++#else
> ++    ac_libusb=no
> +     AC_MSG_RESULT([not found.])
> +-fi
> ++#fi
> + AC_SUBST(LIBUSB)
> + AC_SUBST(INCUSB)
> + 
> diff --git a/recipes/gpsd/gpsd_2.94.bb b/recipes/gpsd/gpsd_2.94.bb
> index 5cf8b2e..2d63b32 100644
> --- a/recipes/gpsd/gpsd_2.94.bb
> +++ b/recipes/gpsd/gpsd_2.94.bb
> @@ -1,9 +1,10 @@
>  require gpsd.inc
>  
> -SRC_URI += "file://libtool.patch"
> +SRC_URI += "file://libtool.patch \
> +	    file://2.94-remove-libusb-badness.patch"
>  SRC_URI[gpsd.md5sum] = "ce70bcd707ac1df861d4c72f503c09d1"
>  SRC_URI[gpsd.sha256sum] = "1520b87d106d198aa42137db4b230615dbd0d06b04e6fcc84e010172fba2da41"
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  PARALLEL_MAKE = ""

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMMk07MkyGM64RGpERAi1IAJ0YOlrlMIto2vYkZ4xssH1sbRGpGACghMZZ
ByEOFbWFL6KdcXEId6J/Zu4=
=vI5w
-----END PGP SIGNATURE-----



