Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCGNn-0002NV-S7 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 21:14:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCGLX-0000N9-Rj for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 21:12:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 21:12:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 21:12:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Apr 2011 21:12:09 +0200
Message-ID: <iokmq9$1qo$1@dough.gmane.org>
References: <1303224907-13125-1-git-send-email-patda293@student.liu.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1303224907-13125-1-git-send-email-patda293@student.liu.se>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] nodejs: Make configure script not use host libutil
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
X-List-Received-Date: Tue, 19 Apr 2011 19:14:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-04-11 16:55, Patrik Dahlström wrote:
> Without this patch the configure script of nodejs-0.4.2 will use host libs for libutil. Excerpt from build/config.log:
> 
> Checking for library util
> ==>
> 
> int main() {
>         return 0;
> }
> 
> <==
> [1/2] cxx: build/.conf_check_0/test.cpp -> build/.conf_check_0/testbuild/default/test_1.o
> ['arm-angstrom-linux-gnueabi-g++', '-march=armv7-a', '-mtune=cortex-a8', '-mfpu=neon', '-mfloat-abi=softfp', '-mthumb-interwork', '-mno-thumb', '--sysroot=/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linux-gnueabi', '-fexpensive-optimizations', '-fomit-frame-pointer', '-frename-registers', '-O2', '-ggdb2', '-fpermissive', '-fvisibility-inlines-hidden', '-DHAVE_OPENSSL=1', '../test.cpp', '-c', '-o', 'default/test_1.o']
> [2/2] cxx_link: build/.conf_check_0/testbuild/default/test_1.o -> build/.conf_check_0/testbuild/default/testprog
> /usr/lib/libutil.so: file not recognized: File format not recognized
> collect2: ld returned 1 exit status
> ['arm-angstrom-linux-gnueabi-g++', '-march=armv7-a', '-mtune=cortex-a8', '-mfpu=neon', '-mfloat-abi=softfp', '-mthumb-interwork', '-mno-thumb', '--sysroot=/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linux-gnueabi', 'default/test_1.o', '-o', '/home/bitbake/build/tmp_beagleboard/work/armv7a-angstrom-linux-gnueabi/nodejs-0.4.2-r0/node-v0.4.2/build/.conf_check_0/testbuild/default/testprog', '-Wl,-O1', '-Wl,--hash-style=gnu', '-L/usr/lib', '-L/usr/local/lib', '-Wl,-Bdynamic', '-lutil']
> command returned 'Build failed:  -> task failed (err #1): \n\t{task: cxx_link test_1.o -> testprog}'not found
> 
> It is strange how the configure script still continues even though it didn't find some of its dependencies.

Welcome to the waf/scons/cmake world...

> Eventually the build will fail with:
> 
> default/src/node_stdio_4.o: In function `node::OpenPTY(v8::Arguments const&)':
> /home/bitbake/build/tmp_beagleboard/work/armv7a-angstrom-linux-gnueabi/nodejs-0.4.2-r0/node-v0.4.2/build/../src/node_stdio.cc:241: undefined reference to `openpty'
> collect2: ld returned 1 exit status
> 
> Signed-off-by: Patrik Dahlström <patda293@student.liu.se>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrd6JMkyGM64RGpERAhL4AJ9g1fpRaCJfFsjdY1J6TeBE6Uxu4ACgiJi7
tBWqH4N4Uhgzba8G2NNcrq8=
=7GVC
-----END PGP SIGNATURE-----



