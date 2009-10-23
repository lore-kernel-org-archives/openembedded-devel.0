Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N1JUC-0005og-S9
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 14:43:19 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N1JTE-0001kc-6f
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 13:42:16 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1N1JTE-0005Gt-2v
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 13:42:16 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hbs7hq$j3v$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
	<hbrs68$gbd$1@ger.gmane.org> <200910231133.11053.holger+oe@freyther.de>
	<hbs7hq$j3v$1@ger.gmane.org>
Date: Fri, 23 Oct 2009 13:42:12 +0100
Message-Id: <1256301732.4529.161.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 12:43:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-10-23 at 14:28 +0200, Koen Kooi wrote:
> -libc_baselibs = "${base_libdir}/libcrypt*.so.* 
> ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* 
> ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* 
> ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so 
> ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so 
> ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so 
> ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so 
> ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so 
> ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so 
> ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so 
> ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so 
> ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so 
> ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so 
> ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so 
> ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
> +libc_baselibs = "${base_libdir}/libcrypt*.so.* 
> ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* 
> ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* 
> ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so 
> ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so 
> ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so 
> ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so 
> ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so 
> ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so 
> ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so 
> ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so 
> ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so 
> ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so 
> ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so 
> ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so 
> ${base_libdir}/libcidn-*.so  ${base_libdir}/libmemusage.so"

It took me a moment to spot what was actually happening here, but I
think this is a step in the wrong direction.  Libmemusage is not
something that most folks are going to want in their rootfs; libcidn is
a bit more debatable but I suspect that at least some people will view
it as bloat.  I would prefer to see the glibc packaging becoming less
rather than more monolithic and I think these two libraries would be
better placed in their own subpackages.

(Also, as an aside, this part of the patch doesn't seem to have anything
to do with the static libs and it should probably not be bundled into
the same changeset.)

p.




