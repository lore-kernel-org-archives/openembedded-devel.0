Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hollis_Blanchard@mentor.com>) id 1TOB7J-0004Gc-Di
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 16 Oct 2012 19:39:46 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1TOAuR-0003LD-3q from Hollis_Blanchard@mentor.com 
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 16 Oct 2012 10:26:27 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 16 Oct 2012 10:26:26 -0700
Received: from [147.34.8.164] (147.34.91.1) by SVR-ORW-FEM-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server (TLS) id 14.1.289.1;
	Tue, 16 Oct 2012 10:26:26 -0700
Message-ID: <507D98C1.6000105@mentor.com>
Date: Tue, 16 Oct 2012 10:26:25 -0700
From: Hollis Blanchard <hollis_blanchard@mentor.com>
Organization: Mentor Graphics, Embedded Systems Division
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121009 Thunderbird/16.0
MIME-Version: 1.0
To: <openembedded-devel@lists.linuxtogo.org>
X-OriginalArrivalTime: 16 Oct 2012 17:26:26.0450 (UTC)
	FILETIME=[5F013720:01CDABC3]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: libxml2 using host's zlib?
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
X-List-Received-Date: Tue, 16 Oct 2012 17:39:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I was trying to build php using meta-webserver, and got stuck with this 
error during configuration of php-native:

    configure:49076: gcc -o conftest -I/usr/include
    -isystem/mnt/mel/build/tmp/sysroots/i686-linux/usr/include -O2 -pipe
    -g0 -fvisibility=hidden
    -isystem/mnt/mel/build/tmp/sysroots/i686-linux/usr/include
    -L/usr/lib -L/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
    -L/mnt/mel/build/tmp/sysroots/i686-linux/lib
    -Wl,-rpath-link,/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
    -Wl,-rpath-link,/mnt/mel/build/tmp/sysroots/i686-linux/lib
    -Wl,-rpath,/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
    -Wl,-rpath,/mnt/mel/build/tmp/sysroots/i686-linux/lib -Wl,-O1
    -Wl,--hash-style=both
    -Wl,-rpath,/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
    -L/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
    -Wl,-rpath,/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib/../lib
    -L/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib/../lib conftest.c
    -lz -lcrypt -lrt -lm -lnsl -lxml2 -lcrypt -lxml2 -lz -lm -lxml2 -lz
    -lm >&5
    /mnt/mel/build/tmp/sysroots/i686-linux/usr/lib/libxml2.so: undefined
    reference to `gzopen64@ZLIB_1.2.3.3'


My build host has /lib/libz.so.1.2.3.3, so my guess is:
* libxml2 is linking with libz from the host
* php-native properly links with zlib-native from Poky (1.2.7), plus the 
tainted libxml2
* libxml2 fails to link because it wants symbols from 1.2.3, which it 
can't find in zlib-native

I've tried the following:

    hblancha@sb-ubuntu-1004:/mnt/mel$ diff -u
    poky/meta/recipes-core/libxml/libxml2.inc{.orig,}---
    poky/meta/recipes-core/libxml/libxml2.inc.orig      2012-10-16
    10:54:17.000000000 -0500
    +++ poky/meta/recipes-core/libxml/libxml2.inc   2012-10-16
    10:55:54.000000000 -0500
    @@ -9,7 +9,7 @@
    file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907
    \
    file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"

    -DEPENDS_virtclass-native = "python-native"
    +DEPENDS_append_virtclass-native = " python-native"
      DEPENDS =+ "zlib"

      SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
    @@ -25,8 +25,8 @@
      }

      EXTRA_OECONF = "--without-python --without-debug --without-legacy
    --without-catalog --without-docbook --with-c14n --without-lzma"
    -EXTRA_OECONF_virtclass-native =
    "--with-python=${STAGING_BINDIR}/python --without-legacy
    --with-catalog --without-docbook --with-c14n --without-lzma"
    -EXTRA_OECONF_virtclass-nativesdk =
    "--with-python=${STAGING_BINDIR}/python --without-legacy
    --with-catalog --without-docbook --with-c14n --without-lzma"
    +EXTRA_OECONF_virtclass-native =
    "--with-python=${STAGING_BINDIR}/python --without-legacy
    --with-catalog --without-docbook --with-c14n --without-lzma
    --with-zlib=${STAGING_LIBDIR}"
    +EXTRA_OECONF_virtclass-nativesdk =
    "--with-python=${STAGING_BINDIR}/python --without-legacy
    --with-catalog --without-docbook --with-c14n --without-lzma
    --with-zlib=${STAGING_LIBDIR}"
      EXTRA_OECONF_linuxstdbase = "--without-python --with-debug
    --with-legacy --with-catalog --with-docbook --with-c14n --without-lzma"

      # required for pythong binding

    hblancha@sb-ubuntu-1004:/mnt/mel/build$ bitbake -c clean libxml2-native
    [...]
    hblancha@sb-ubuntu-1004:/mnt/mel/build$ bitbake libxml2-native
    [...]
    hblancha@sb-ubuntu-1004:/mnt/mel/build$ nm
    tmp/sysroots/i686-linux/usr/lib/libxml2.so | grep gzopen
              U gzopen64@@ZLIB_1.2.3.3

As you can see, it didn't help: libxml2.so still is linking with the 
host's zlib-1.2.3.3, and php-native fails to configure because of it.

How to fix? Thanks!

-- 
Hollis Blanchard
Product Owner, Sourcery Analyzer <http://go.mentor.com/sourceryanalyzer>
Mentor Graphics, Embedded Systems Division


