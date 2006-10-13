Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GYHjp-0007z6-Pp
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Oct 2006 09:45:50 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 55D19C3C60
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 17:39:22 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19154-01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 17:39:20 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 21AFCAD8FB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 17:39:20 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 139A7133BBC3; Fri, 13 Oct 2006 17:39:20 +1000 (EST)
Date: Fri, 13 Oct 2006 17:39:20 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061013073919.GA5510@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
Mime-Version: 1.0
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: libtool .la wierdness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2006 07:45:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Does someone knows how these libtool .la files are meant to work
and/or why they are the way they are.

When trying to link against libclamav I'm getting this:

  | if ccache i486-linux-gcc -DHAVE_CONFIG_H -I. -I/data/oe/build/wrap-glibc/tmp/work/p3scan-2.9.05d-r0/p3scan-2.9.05d/src -I..   -isystem/data/oe/build/wrap-glibc/tmp/staging/i486-linux/include -I/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib/../include -I/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib/../include  -isystem/data/oe/build/wrap-glibc/tmp/staging/i486-linux/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -MT restart.o -MD -MP -MF ".deps/restart.Tpo" -c -o restart.o restart.c; \
  |       then mv -f ".deps/restart.Tpo" ".deps/restart.Po"; else rm -f ".deps/restart.Tpo"; exit 1; fi
  | /bin/sh ../i486-linux-libtool --tag=CC --mode=link ccache i486-linux-gcc  -isystem/data/oe/build/wrap-glibc/tmp/staging/i486-linux/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2  -L/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib -Wl,-rpath-link,/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib -Wl,-O1 -L/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib/../lib -lclamav -L/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib/../lib -lssl -lcrypto -lpcre -o p3scan   p3scan.o getlinep3.o parsefile.o scanner_avpd.o scanner_avpd_new.o scanner_clamd.o scanner_trophie.o scanner_bash.o scanner_basic.o getline_ssl.o restart.o  -lpthread
  | mkdir .libs
  | i486-linux-libtool: link: cannot find the library /usr/lib/libz.la'
  | make[2]: *** [p3scan] Error 1
  | make[2]: Leaving directory /data/oe/build/wrap-glibc/tmp/work/p3scan-2.9.05d-r0/p3scan-2.9.05d/src'
  | make[1]: *** [all-recursive] Error 1
  | make[1]: Leaving directory /data/oe/build/wrap-glibc/tmp/work/p3scan-2.9.05d-r0/p3scan-2.9.05d'
  | make: *** [all] Error 2
  | FATAL: oe_runmake failed
  NOTE: Task failed: /data/oe/build/wrap-glibc/tmp/work/p3scan-2.9.05d-r0/temp/log.do_compile.6491
  NOTE: package p3scan-2.9.05d-r0: task do_compile: failed
  ERROR: TaskFailed event exception, aborting
  NOTE: package p3scan-2.9.05d: failed
  ERROR: Build of p3scan failed

This appears to be due to the obsolute path being to the libz .la
file being placed in the libclamav .la file:

  [nynaeve][ 5:24PM]/data/oe/build/wrap-glibc%> cat tmp/staging/i486-linux/lib/libclamav.la | grep dependency_libs
  dependency_libs=' -L/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib /usr/lib/libz.la -lbz2 /usr/lib/libgmp.la -lpthread -lnsl'

And it looks like it is doing this for any dependent libraries that
have a corresponding .la file themselves (see how libz and libgmp have
corresponding .la files):

  [nynaeve][ 5:24PM]/data/oe/build/wrap-glibc%> (cd tmp/staging/i486-linux/lib && ls libz* libbz* libgmp* libnsl*)
  libbz2.a      libbz2.so.1.0@    libgmp.la     libgmp.so.3.3.3*  libnsl.so@    libz.la     libz.so.1.2.3*
  libbz2.so@    libbz2.so.1.0.2*  libgmp.so@    libnsl-2.4.so*    libnsl.so.1@  libz.so@
  libbz2.so.1@  libgmp.a          libgmp.so.3@  libnsl.a          libz.a        libz.so.1@

If I modify the libclamav.la to be this:

  dependency_libs=' -L/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib -lz -lbz2 -lgmp -lpthread -lnsl'

then p3scan builds, links and runs fine. If I delete libclamav.la then p3scan
builds, links and runs fine.

If I remove the libz and libgmp .la files and then rebuild clamav you can
see the change in libclamav .la file:

  [nynaeve][ 5:25PM]/data/oe/build/wrap-glibc%> (cd tmp/staging/i486-linux/lib && rm libz.la libgmp.la)
  [nynaeve][ 5:26PM]/data/oe/build/wrap-glibc%> ./bb -b packages/clamav/clamav_0.88.4.bb -c clean
  ...
  [nynaeve][ 5:26PM]/data/oe/build/wrap-glibc%> ./bb -b packages/clamav/clamav_0.88.4.bb
  ...
  [nynaeve][ 5:27PM]/data/oe/build/wrap-glibc%> cat tmp/staging/i486-linux/lib/libclamav.la | grep dependency_libs
  dependency_libs=' -L/data/oe/build/wrap-glibc/tmp/staging/i486-linux/lib -lz -lbz2 -lgmp -lpthread -lnsl'
  [nynaeve][ 5:27PM]/data/oe/build/wrap-glibc%>

This look like a libtool problem to me, but libtool is one very confusing
tool. Should it be putting the "/usr/lib/libz.la" style references in the
.la files? Or should it know to look for those .la files elsewhere when
processing them? Or should we just do away with the .la files in staging
altogether?

-- 
 Jamie Lenehan <lenehan@twibble.org>


