Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNJsG-0008SZ-O4 for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 09:11:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNJpR-0002Fm-Fl for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 09:08:57 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 09:08:57 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 09:08:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 May 2011 09:08:46 +0200
Message-ID: <ir541u$cmg$1@dough.gmane.org>
References: <1305874373-7977-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305874373-7977-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCHv2] uclibc: Rename uclibc-libargp -> uclibc-argp and uclibc-libbacktrace -> uclibc-backtrace
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
X-List-Received-Date: Fri, 20 May 2011 07:11:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-05-11 08:52, raj.khem@gmail.com wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

thanks, applied

> ---
>  meta-oe/recipes-core/uclibc/uclibc.inc |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/uclibc/uclibc.inc b/meta-oe/recipes-core/uclibc/uclibc.inc
> index ca2b929..e7d8846 100644
> --- a/meta-oe/recipes-core/uclibc/uclibc.inc
> +++ b/meta-oe/recipes-core/uclibc/uclibc.inc
> @@ -14,7 +14,7 @@ PRIORITY = "required"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>  		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
>  file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
> -INC_PR = "r1"
> +INC_PR = "r2"
>  
>  require uclibc-config.inc
>  STAGINGCC = "gcc-cross-intermediate"
> @@ -59,7 +59,7 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> -PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-libargp uclibc-libbacktrace"
> +PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
>  
>  LEAD_SONAME = "libc.so"
>  
> @@ -92,8 +92,8 @@ FILES_uclibc-utils = "${bindir} ${sbindir}"
>  FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
>  FILES_uclibc-gconv = "${libdir}/gconv"
>  FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
> -FILES_uclibc-libuargp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
> -FILES_uclibc-libubacktrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
> +FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
> +FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
>  
>  RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
>  # uclibc does not really have libsegfault but then using the one from glibc is also not

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN1hN+MkyGM64RGpERArYTAJ4pdiZ5aiQ6AH1f5DA7ywQYn5o2XgCbBATC
TS1TQeaZ/vyg0oDnP2leAgQ=
=qmeH
-----END PGP SIGNATURE-----



