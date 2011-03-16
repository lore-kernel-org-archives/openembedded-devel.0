Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1Q00bZ-00041T-C6
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 00:58:17 +0100
Received: by wyb40 with SMTP id 40so2093527wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type;
	bh=OBLFOUsDxQ5WEUQBJYZq20bHOF7GNaZiAGMrEqusqhc=;
	b=tXstk8vBd0tUzlWB1ckoFpknyHGkDGOoTCPmTVR/clca8GxvYIizrFq4ijIMDP2jSs
	owDqCK5JrYx/E8M55yP6fiGyxkujYNfQLm3eAQXz/2mQoP3ni7JvyRaPqXsV9bofDwNL
	CCQepsm2HhtUGX60yw0YH7XRs0t2jGFnWnetA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	b=IjnCi5djwaOFfItK8gEliaiKqjcNwxhq+XTIQ2t9YGfVuHPNqWs1nZX7y/519sP/ps
	oWEIL7/WquR8PfUxfoNR4ZBcekgDdjkwxZ85piJGjhtgMhcJlzEAa9DEtzsUP8rEzAdZ
	X+JZvhi9hU3G20VV0BlJzQ1/OGN5+pcEUKw+w=
Received: by 10.227.39.66 with SMTP id f2mr648273wbe.2.1300319786520;
	Wed, 16 Mar 2011 16:56:26 -0700 (PDT)
Received: from [192.168.1.103] (121.149-240-81.adsl-dyn.isp.belgacom.be
	[81.240.149.121])
	by mx.google.com with ESMTPS id y16sm278184wby.13.2011.03.16.16.56.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 16:56:25 -0700 (PDT)
Message-ID: <4D814E28.6080701@gmail.com>
Date: Thu, 17 Mar 2011 00:56:24 +0100
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20110131 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D81226B.4060704@gmail.com> <4D81331E.2070604@mentor.com>
In-Reply-To: <4D81331E.2070604@mentor.com>
Subject: Re: perl-native_5.10.1 fails
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
X-List-Received-Date: Wed, 16 Mar 2011 23:58:17 -0000
X-Groupsio-MsgNum: 30317
Content-Type: multipart/mixed; boundary="------------020502060403070202050506"

--------------020502060403070202050506
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/16/11 23:01, Tom Rini wrote:
> On 03/16/2011 01:49 PM, Jan Paesmans wrote:
>> Hi all,
>>
>> When trying to build an x11-image for pm9263 with angstrom-2010.x,
>> perl-native fails to build.
>> The error is listed below. As far as I can tell, the problem is that a
>> gcc flag is passed to the linker, -fstack-protector. I tried to find out
>> where this -fstack-protector could come from, but the only trace I could
>> find was in the Configure of perl-native itself. There is no mention
>> that it is set when Configure is called in the configure step, nor in
>> any of the environment variables during the do_configure or
>> do_compile step.
>>
>> I run Ubuntu 10.10 with gold as the linker. I thought that it might be
>> the gold linker but neither gold nor ld seem to have this option when
>> reviewing the man-page.
>
> Can you edit the recipe and add in:
> EXTRA_OEMAKE = 'LD="${CCLD}"'
>
> And do a bitbake -c clean perl-native then bitbake perl-native
> Thanks.
>
That did the trick. Now perl-native compiles fine. However when I
checked the output of the log.do_compile I did notice a change a the
behaviour. I was expecting the -fstack-protector flag to be gone,
instead it is still there. However, instead of invoking ld for the final
link, now gcc is invoked. Below you can find the relevent section of the
log file. Also in attachment is a patch with the change you suggested.

Thanks for the help.
Regards,

Jan

Running Makefile.PL in ext/DynaLoader
../../miniperl -I../../lib Makefile.PL INSTALLDIRS=perl
INSTALLMAN1DIR=none INSTALLMAN3DIR=none PERL_CORE=1 LIBPERL_A=libperl.so
LINKTYPE=static
Processing hints file hints/linux.pl
Unrecognized argument in LIBS ignored:
'-Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib'
Unrecognized argument in LIBS ignored:
'-Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib'
Unrecognized argument in LIBS ignored: '-Wl,-O1'
Unrecognized argument in LIBS ignored: '-fstack-protector'
Writing Makefile for DynaLoader
make[1]: Entering directory
`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
make[1]: Leaving directory
`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
Making all in ext/DynaLoader
 make all PERL_CORE=1 LIBPERL_A=libperl.so LINKTYPE=static
make[1]: Entering directory
`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
../../miniperl "-I../../lib" "-I../../lib" DynaLoader_pm.PL DynaLoader.pm
../../miniperl "-I../../lib" "-I../../lib" XSLoader_pm.PL XSLoader.pm
cp XSLoader.pm ../../lib/XSLoader.pm
cp DynaLoader.pm ../../lib/DynaLoader.pm
AutoSplitting ../../lib/DynaLoader.pm (../../lib/auto/DynaLoader)
rm -f DynaLoader.xs
cp dl_dlopen.xs DynaLoader.xs
../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp
-noprototypes -typemap ../../lib/ExtUtils/typemap DynaLoader.xs >
DynaLoader.xsc && mv DynaLoader.xsc DynaLoader.c
gcc  -c   -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe
-fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -O2   -DVERSION=\"1.10\" -DXS_VERSION=\"1.10\"
-fPIC "-I../.."  -DLIBC="/lib/libc-2.12.1.so" DynaLoader.c
rm -rf ../../DynaLoader.o
cp DynaLoader.o ../../DynaLoader.o
make[1]: Leaving directory
`/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
rm -f libperl.so
gcc  -o libperl.so -shared -O2
-L/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
-L/usr/local/lib -fstack-protector op.o perl.o   gv.o toke.o perly.o
pad.o regcomp.o dump.o util.o mg.o reentr.o mro.o hv.o av.o run.o
pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o
utf8.o taint.o deb.o universal.o xsutils.o globals.o perlio.o perlapi.o
numeric.o mathoms.o locale.o pp_pack.o pp_sort.o   DynaLoader.o -lnsl
-ldl -lm -lcrypt -lutil -lpthread -lc
LD_LIBRARY_PATH=/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1
gcc  -o perl 
-L/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
-Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
-Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
-Wl,-O1 -fstack-protector -L/usr/local/lib -Wl,-E
-Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.10.1/CORE
perlmain.o  libperl.so `cat ext.libs` -lnsl -ldl -lm -lcrypt -lutil
-lpthread -lc
LD_LIBRARY_PATH=/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1 
./miniperl -Ilib mkppport
running
/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/miniperl
-I../../lib PPPort_pm.PL


--------------020502060403070202050506
Content-Type: text/plain;
 name="perl-native_5.10.1.bb.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="perl-native_5.10.1.bb.patch"

diff --git a/recipes/perl/perl-native_5.10.1.bb b/recipes/perl/perl-native_5.10.1.bb
index 5aa0c7b..586fcbd 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -29,6 +29,8 @@ S = "${WORKDIR}/perl-${PV}"
 
 inherit native
 
+EXTRA_OEMAKE = 'LD="${CCLD}"'
+
 do_configure () {
     ./Configure \
         -Dcc="${CC}" \

--------------020502060403070202050506--
