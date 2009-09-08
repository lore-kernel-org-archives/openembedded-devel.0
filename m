Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MlBX1-0000ic-Dp
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 02:59:34 +0200
Received: by bwz6 with SMTP id 6so2919238bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2009 17:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=jXVtAFdQgEjh71v1SLWzdyL9S2+ZW6OcXmbKqiAd1ls=;
	b=boPYydkvB9a8x/aZM4uGeKW8ux09m0ncDHan8iPCKJuvHR7bIEm//SFWdMo/GemnmX
	gjqHCsqAEBUhvaPTxbZmgnNxMye7AeimBMrwCtlojJIU5yIiiX+lY79iJNAgiWlddaUl
	T8NUAdyFOSlGhHmJKwCdTvqaZKg2Wl7MmpUE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=iGZxO0+3HnlSyiIiRNdqjSzg27e7kEBPBEnZg+Fp0tp2rWZIuCFugK/2Q9vrNVU5of
	yvIMXrfghpo4JTnwpKevUvNF4zFl84m252El0vR/LRearPYxoHisDPz7sHhKGJ5qzA7c
	0rhv2HD3Mda0lu2o6K4xnlhlv7AF0wFdO80U0=
MIME-Version: 1.0
Received: by 10.204.23.66 with SMTP id q2mr13099287bkb.191.1252402478286; Tue, 
	08 Sep 2009 02:34:38 -0700 (PDT)
Date: Tue, 8 Sep 2009 10:34:38 +0100
Message-ID: <91283b620909080234i4e80d9fbodb063237da5d8487@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.210
X-SA-Exim-Mail-From: stuart68@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: error linking libpcre
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
X-List-Received-Date: Wed, 09 Sep 2009 00:59:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am building an overo release using kernel 2.6.29. This build was working,
but due to some issues I decided to delete my tmp directory and start the
build again.

It failed at libpcre. I have made no changes in this area.

Here is the tail end of the log file do_compile:

arm-angstrom-linux-gnueabi-libtool: compile:  ccache
arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -DHAVE_CONFIG_H -I.
-isystem/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-isystem/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
-fpermissive -fvisibility-inlines-hidden -MT pcre_stringpiece.lo -MD -MP -MF
.deps/pcre_stringpiece.Tpo -c pcre_stringpiece.cc  -fPIC -DPIC -o
.libs/pcre_stringpiece.o
arm-angstrom-linux-gnueabi-libtool: compile:  ccache
arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -DHAVE_CONFIG_H -I.
-isystem/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-isystem/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
-fpermissive -fvisibility-inlines-hidden -MT pcre_stringpiece.lo -MD -MP -MF
.deps/pcre_stringpiece.Tpo -c pcre_stringpiece.cc -o pcre_stringpiece.o
>/dev/null 2>&1
mv -f .deps/pcre_stringpiece.Tpo .deps/pcre_stringpiece.Plo
/bin/sh ./arm-angstrom-linux-gnueabi-libtool --tag=CXX   --mode=link ccache
arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp
-isystem/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
-fpermissive -fvisibility-inlines-hidden -version-info 0:0:0
-L/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib
-Wl,-rpath-link,/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -o libpcrecpp.la -rpath /usr/lib pcrecpp.lo
pcre_scanner.lo pcre_stringpiece.lo libpcre.la
arm-angstrom-linux-gnueabi-libtool: link: ccache
arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -shared -nostdlib
/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib/crti.o
/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/crtbeginS.o
.libs/pcrecpp.o .libs/pcre_scanner.o .libs/pcre_stringpiece.o   -Wl,-rpath
-Wl,/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libpcre-7.6-r4/pcre-7.6/.libs
-Wl,-rpath
-Wl,/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib
-Wl,-rpath
-Wl,/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib
-L/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib
./.libs/libpcre.so
-L/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3
-L/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib
-L/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/lib
/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libstdc++.so
-L/home/stuart/overo-oe/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/lib -lm
-lc -lgcc_s
/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/crtendS.o
/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib/crtn.o
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-Wl,-rpath-link
-Wl,/home/stuart/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu   -Wl,-soname -Wl,libpcrecpp.so.0 -o
.libs/libpcrecpp.so.0.0.0
arm-angstrom-linux-gnueabi-g++:
/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libstdc++.so:
Too many levels of symbolic links
make[1]: *** [libpcrecpp.la] Error 1
make[1]: Leaving directory
`/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libpcre-7.6-r4/pcre-7.6'
make: *** [all] Error 2
FATAL: oe_runmake failed



When I look into the ....arm-angstrom-linux-gnueabi/lib directory I can see
two symbolic links., The libstdc++.so which links to libstdc++.so.6.

libstdc++.so.6 links to itself.    Not correct !!!!!

I believe it should link to the file libstdc++.so.6.0.10. Indeed if I copy
this file and rename it to libstdc++.so it will compile and link, but  this
does not fix my original problem it only masks it.


Why are the symbolic link targets not set up correctly?????



Any help would be great

