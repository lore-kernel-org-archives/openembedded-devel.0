Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N1JHS-0004dp-3U for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 14:30:09 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N1JGT-0005E1-EZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 14:29:05 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 14:29:05 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 14:29:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Oct 2009 14:28:42 +0200
Message-ID: <hbs7hq$j3v$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>	<1256286976.4529.117.camel@mill.internal.reciva.com>	<hbrs68$gbd$1@ger.gmane.org>
	<200910231133.11053.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200910231133.11053.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Fri, 23 Oct 2009 12:30:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-10-09 11:33, Holger Hans Peter Freyther wrote:

> The last bit is that I would like to put /usr/lib/libc_nonshared.a into the
> libc-dev package

How does this look to you: 
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=koen/static-libs-rework

 From 3846a3fd24746db0f9d1c28fad70761f6ef6a9a4 Mon Sep 17 00:00:00 2001
From: Koen Kooi <koen@openembedded.org>
Date: Fri, 23 Oct 2009 12:19:50 +0000
Subject: glibc package bbclass: tweak library packaging

Static libs move around a bit:

glibc-dev:
/usr/lib/libpthread_nonshared.a
/usr/lib/libc_nonshared.a

glibc-static:
/usr/lib/libm.a
/usr/lib/libbsd-compat.a
/usr/lib/libanl.a
/usr/lib/libpthread.a
/usr/lib/libcrypt.a
/usr/lib/libresolv.a
/usr/lib/libutil.a
/usr/lib/libieee.a
/usr/lib/librt.a
/usr/lib/libnsl.a
/usr/lib/libdl.a
/usr/lib/libc.a
/usr/lib/libmcheck.a
/usr/lib/libBrokenLocale.a
/usr/lib/libg.a
---
diff --git a/recipes/glibc/glibc-package.bbclass 
b/recipes/glibc/glibc-package.bbclass
index 4d7f6fd..708f044 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -29,19 +29,19 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
  # Set this to zero if you don't want ldconfig in the output package
  USE_LDCONFIG ?= "1"

-PACKAGES = "glibc-dbg glibc catchsegv sln nscd ldd localedef 
glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss 
glibc-thread-db glibc-pcprofile"
+PACKAGES = "glibc-dbg glibc catchsegv sln nscd ldd localedef 
glibc-utils glibc-dev glibc-static glibc-doc glibc-locale libsegfault 
glibc-extra-nss glibc-thread-db glibc-pcprofile"
  PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* 
locale-base-* glibc-binary-localedata-*"

  INSANE_SKIP_glibc-dbg = True

-libc_baselibs = "${base_libdir}/libcrypt*.so.* 
${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* 
${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* 
${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so 
${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so 
${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so 
${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so 
${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so 
${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so 
${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so 
${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so 
${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so 
${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so 
${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so 
${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
+libc_baselibs = "${base_libdir}/libcrypt*.so.* 
${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* 
${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* 
${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so 
${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so 
${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so 
${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so 
${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so 
${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so 
${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so 
${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so 
${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so 
${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so 
${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so 
${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so 
${base_libdir}/libcidn-*.so  ${base_libdir}/libmemusage.so"

  FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo 
${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', 
d)}"
  FILES_ldd = "${bindir}/ldd"
  FILES_libsegfault = "${base_libdir}/libSegFault*"
  FILES_glibc-extra-nss = "${base_libdir}/libnss*"
  FILES_sln = "${base_sbindir}/sln"
-FILES_glibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen"
+FILES_glibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen 
${libdir}/*non_shared.a"
  FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/nscd* 
${sysconfdir}/init.d/nscd*"
  FILES_glibc-utils = "${bindir}/* ${sbindir}/*"
  FILES_glibc-gconv = "${libdir}/gconv/*"
--
cgit v0.8.2.1-10-g45e7



