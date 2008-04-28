Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jin@mediatomb.cc>) id 1JqYzi-0002wC-Dc
	for openembedded-devel@openembedded.org; Mon, 28 Apr 2008 21:26:34 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 6BBED832CA; Mon, 28 Apr 2008 21:26:07 +0200 (CEST)
Date: Mon, 28 Apr 2008 21:26:07 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel <openembedded-devel@openembedded.org>
Message-ID: <20080428192607.GB28476@deadlock.dhs.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: problem building meta-toolchain for arm/uclibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 19:26:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

I keep struggling with meta-toolchain and I hope to get some input on this.

I'm on oe stable, angstrom-2007.1, ARM9, uclibc, EABI

I start with a clean build: bitbake meta-toolchain

Unfortunately gcc-cross-sdk fails to build:
NOTE: package gcc-cross-sdk-4.1.2-r11: task do_compile: failed

And here's the most interesting part:
| /opt/44296fe048e6bdbb2da959e5d681dfdf/etcb/OE/build/angstrom/cross/bin/arm-angstrom-linux-uclibcgnueabi-ld: cannot find libc.so.6
| collect2: ld returned 1 exit status
| make[3]: *** [libgcc_s.so] Error 1

Is it looking for libc.so.6 on a uclibc build?

Here is the full log:
http://www.deadlock.dhs.org/jin/log_do_compile_uclibcgnueabi_gcc_cross_sdk.txt

I started to poke around, looking for differences between the configuration
options of the sdk and non-sdk versions.

Apart of the directories most things are the same, the only other additonal
options were in the gcc-cross-sdk (vs. gcc-cross)  configuration:
--enable-clocale=generic and --disable-nls (the non-sdk gcc-cross did not have
those).

I also looked at binutils-cross and binutils-cross-sdk, here binutils-cross
had two more options: --enable-install-libbfd --disable-werror The rest,
except for the paths was the same.

I also noticed that the sdk variants use the already available tools from
the cross directory, not sure if that can be related to my problem
binutils-cross:
checking for arm-angstrom-linux-uclibcgnueabi-gcc... no

binutils-cross-sdk:
checking for arm-angstrom-linux-uclibcgnueabi-gcc... arm-angstrom-linux-uclibcgnueabi-gcc

At this point I am sort of stuck, so if anyone has an idea or a clue - I'll
be happy to hear about it. Thanks!

Kind regards,
Jin

P.S. I'd submit a bug... but the bugtracker is still down :(



