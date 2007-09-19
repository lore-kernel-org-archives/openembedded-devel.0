Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IXv7w-0000QS-SP
	for openembedded-devel@openembedded.org; Wed, 19 Sep 2007 10:41:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8J8bneM026432;
	Wed, 19 Sep 2007 09:37:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26085-09; Wed, 19 Sep 2007 09:37:44 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8J8bgD4026424
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 19 Sep 2007 09:37:42 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Wed, 19 Sep 2007 09:37:41 +0100
Message-Id: <1190191062.7630.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Ross Burton <ross@openedhand.com>
Subject: cross and staging directories
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2007 08:41:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've been experimenting a bit in Poky to find out exactly why we need
the cross directory.

The motivation for this is the load of files we duplicate in both,
particularly linux-libc-headers, headers from glibc-initial, glibc and
glibc-intermediate and libs from glibc and glibc-intermediate.

If we only install glibc to staging, we could half the run time of
populate_staging for glibc and glibc-intermediate which is a nice
timesaver.

Just not staging the files to cross gives some interesting errors.
Whenever anything tries to link to glibc, you see errors about not being
able to find crti.o and friends. The files are in STAGING_LIBDIR, gcc
just refuses to see them. Poky also demonstrated you also occasionally
see errors about missing header files despite the header files being in
STAGING_INCDIR.

Why does this happen? The compiler's default search directories are
basically broken. Looking at the output from "arm-poky-linux-gnueabi-gcc
-print-search-dirs":  

install:

/media/data1/builds/poky/eabi/tmp/cross/lib/gcc/arm-poky-linux-gnueabi/4.1.2/

programs:

/media/data1/builds/poky/eabi/tmp/cross/libexec/gcc/arm-poky-linux-gnueabi/4.1.2/
/media/data1/builds/poky/eabi/tmp/cross/libexec/gcc/arm-poky-linux-gnueabi/4.1.2/
/media/data1/builds/poky/eabi/tmp/cross/libexec/gcc/arm-poky-linux-gnueabi/
/media/data1/builds/poky/eabi/tmp/cross/lib/gcc/arm-poky-linux-gnueabi/4.1.2/
/media/data1/builds/poky/eabi/tmp/cross/lib/gcc/arm-poky-linux-gnueabi/
/usr/libexec/gcc/arm-poky-linux-gnueabi/4.1.2/
/usr/libexec/gcc/arm-poky-linux-gnueabi/
/usr/lib/gcc/arm-poky-linux-gnueabi/4.1.2/
/usr/lib/gcc/arm-poky-linux-gnueabi/
/media/data1/builds/poky/eabi/tmp/cross/lib/gcc/arm-poky-linux-gnueabi/4.1.2/../../../../arm-poky-linux-gnueabi/bin/arm-poky-linux-gnueabi/4.1.2/
/media/data1/builds/poky/eabi/tmp/cross/lib/gcc/arm-poky-linux-gnueabi/4.1.2/../../../../arm-poky-linux-gnueabi/bin/

libraries:

/media/data1/builds/poky/eabi/tmp/cross/lib/gcc/arm-poky-linux-gnueabi/4.1.2/
/usr/lib/gcc/arm-poky-linux-gnueabi/4.1.2/
/media/data1/builds/poky/eabi/tmp/cross/lib/gcc/arm-poky-linux-gnueabi/4.1.2/../../../../arm-poky-linux-gnueabi/lib/arm-poky-linux-gnueabi/4.1.2/
/media/data1/builds/poky/eabi/tmp/cross/lib/gcc/arm-poky-linux-gnueabi/4.1.2/../../../../arm-poky-linux-gnueabi/lib/


So by default it looks in cross for *everything* and has no knowledge of
staging. I ended up reading the gcc source to see what options we have
for injection staging paths into it.

Since crti.o is an internal library, -L options don't cut it. The -B
option does help but you can't use that whilst compiling gcc-cross.
There are various environmental variables you can possibly use but we'd
have to set several to make sure libs, includes and everything else gets
fixed. It felt ugly and I doubt it will work for compiling gcc-cross.

One gcc option which does show potential is the sysroot one. This
happens to solve the libs problem straight off since it adds "/lib/" as
well as "/usr/lib" prefixed by the sysroot and the former happens to
match our staging layout by pure chance. The same trick won't work
for /usr/include though. 

The short term solution I've added to poky is to symlink staging from
the cross directories. No need to install twice and the default compiler
paths work. This solves my original objective of not installing things
twice. Personally I don't think these symlinks should have to exist
though.

I am tempted to suggest we start passing the sysroot option to gcc to
get libs working. A symlink from /usr/include to ../include would be a
better cheat than the above symlinks and gets includes working too.

Previous discussions on the subject of sysroot suggest it won't work for
the 3.3 gcc series but we could use the symlink approach from cross to
staging for that.

Agreeing to the above doesn't mean we have to change staging layout but
perhaps it is another indication we should consider it?

Cheers,

Richard




