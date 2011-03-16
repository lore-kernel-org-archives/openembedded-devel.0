Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1Pzxgt-0004d6-9u
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:51:35 +0100
Received: by fxm19 with SMTP id 19so2039502fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=cpvCcJ6BWQpv0wLuVCjeAl6cjL8bGKdjcZnQUEKJh8Y=;
	b=ot51smHYGxg8JQQK1IvNRGxn3eip44JFBaJkt2Lcw1GqWxN2AZu+KkZLRZUpAvlpdt
	RhchZRl0BpXPyj08wV9T9IHi947IkG5oOp0NfeEvaGqIJPrTWuY0FALSJXI/KGaZyYyD
	6GfNsx62+QRtlKOuu56kB2xigu795fYZM4hQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=HPB6dXvC3DcbyqXcZGtUFZfiuXxQmdTSnDJrQDmQJDdEWZXmkhiL4nBtyJESdklx+i
	Z0pBfjQNmU0fX/bKAqZpzT6bgihACKwjU/3R2DVukBjvpGVGFm4taRxAnvw6mlcSBHWB
	fWGrFfwkUnkdxiXrkka3hXJDHlOCq7vLBdWZc=
Received: by 10.223.121.102 with SMTP id g38mr90072far.9.1300308590151;
	Wed, 16 Mar 2011 13:49:50 -0700 (PDT)
Received: from [192.168.1.103] (121.149-240-81.adsl-dyn.isp.belgacom.be
	[81.240.149.121])
	by mx.google.com with ESMTPS id n26sm147788fam.37.2011.03.16.13.49.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 13:49:49 -0700 (PDT)
Message-ID: <4D81226B.4060704@gmail.com>
Date: Wed, 16 Mar 2011 21:49:47 +0100
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20110131 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: perl-native_5.10.1 fails
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
X-List-Received-Date: Wed, 16 Mar 2011 20:51:35 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi all,

When trying to build an x11-image for pm9263 with angstrom-2010.x,
perl-native fails to build.
The error is listed below. As far as I can tell, the problem is that a
gcc flag is passed to the linker, -fstack-protector. I tried to find out
where this -fstack-protector could come from, but the only trace I could
find was in the Configure of perl-native itself. There is no mention
that it is set when Configure is called in the configure step, nor in
any of the environment variables during the do_configure or do_compile step.

I run Ubuntu 10.10 with gold as the linker. I thought that it might be
the gold linker but neither gold nor ld seem to have this option when
reviewing the man-page.

Regards,

Jan

| Running Makefile.PL in ext/DynaLoader
| ../../miniperl -I../../lib Makefile.PL INSTALLDIRS=perl
INSTALLMAN1DIR=none INSTALLMAN3DIR=none PERL_CORE=1 LIBPERL_A=libperl.so
LINKTYPE=static
| Processing hints file hints/linux.pl
| Unrecognized argument in LIBS ignored:
'-Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib'
| Unrecognized argument in LIBS ignored:
'-Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib'
| Unrecognized argument in LIBS ignored: '-Wl,-O1'
| Unrecognized argument in LIBS ignored: '-fstack-protector'
| Writing Makefile for DynaLoader
| make[1]: Entering directory
`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
| make[1]: Leaving directory
`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
| Making all in ext/DynaLoader
|  make all PERL_CORE=1 LIBPERL_A=libperl.so LINKTYPE=static
| make[1]: Entering directory
`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
| ../../miniperl "-I../../lib" "-I../../lib" DynaLoader_pm.PL DynaLoader.pm
| ../../miniperl "-I../../lib" "-I../../lib" XSLoader_pm.PL XSLoader.pm
| cp XSLoader.pm ../../lib/XSLoader.pm
| cp DynaLoader.pm ../../lib/DynaLoader.pm
| AutoSplitting ../../lib/DynaLoader.pm (../../lib/auto/DynaLoader)
| rm -f DynaLoader.xs
| cp dl_dlopen.xs DynaLoader.xs
| ../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp
-noprototypes -typemap ../../lib/ExtUtils/typemap DynaLoader.xs >
DynaLoader.xsc && mv DynaLoader.xsc DynaLoader.c
| gcc  -c   -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe
-fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -O2   -DVERSION=\"1.10\" -DXS_VERSION=\"1.10\"
-fPIC "-I../.."  -DLIBC="/lib/libc-2.12.1.so" DynaLoader.c
| rm -rf ../../DynaLoader.o
| cp DynaLoader.o ../../DynaLoader.o
| make[1]: Leaving directory
`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
| rm -f libperl.so
| ld -o libperl.so -shared -O2
-L/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
-L/usr/local/lib -fstack-protector op.o perl.o   gv.o toke.o perly.o
pad.o regcomp.o dump.o util.o mg.o reentr.o mro.o hv.o av.o run.o
pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o
utf8.o taint.o deb.o universal.o xsutils.o globals.o perlio.o perlapi.o
numeric.o mathoms.o locale.o pp_pack.o pp_sort.o   DynaLoader.o -lnsl
-ldl -lm -lcrypt -lutil -lpthread -lc
| ld: -fstack-protector: unknown option
| ld: use the --help option for usage information
| make: *** [libperl.so] Error 1
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package perl-native-5.10.1-r10: task do_compile: Failed



