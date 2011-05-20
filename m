Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNJLy-0007A6-Fs for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 08:38:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNJJ7-0001E2-7D for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 08:35:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 08:35:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 08:35:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 May 2011 08:35:18 +0200
Message-ID: <ir5236$3rs$1@dough.gmane.org>
References: <1305859058-7475-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305859058-7475-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] uclibc: Rename uclibc-libargp -> uclibc-argp and uclibc-libbacktrace -> uclibc-backtrace
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
X-List-Received-Date: Fri, 20 May 2011 06:38:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-05-11 04:37, raj.khem@gmail.com wrote:
> From: Khem Raj <raj.khem@gmail.com>

That's missing a PR bump :)

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/uclibc/uclibc.inc |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/uclibc/uclibc.inc b/meta-oe/recipes-core/uclibc/uclibc.inc
> index ca2b929..3e21b4e 100644
> --- a/meta-oe/recipes-core/uclibc/uclibc.inc
> +++ b/meta-oe/recipes-core/uclibc/uclibc.inc
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

iD8DBQFN1gumMkyGM64RGpERAiYXAJ0b4U7gFr0j3uq9qQhu3rbCMirgmQCgmkAS
LhPXZrpwS6wElWzH/Qqrmec=
=B2DD
-----END PGP SIGNATURE-----



