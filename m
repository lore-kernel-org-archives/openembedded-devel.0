Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <dp@xora.org.uk>) id 1GuVsL-00043z-5V
	for openembedded-devel@openembedded.org; Wed, 13 Dec 2006 16:18:29 +0100
Received: from xora.org.uk ([::ffff:85.210.128.96])
	(AUTH: LOGIN dp, TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Wed, 13 Dec 2006 15:16:31 +0000
	id 0003850E.4580194F.0000670F
Date: Wed, 13 Dec 2006 15:22:59 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@openembedded.org
Message-ID: <20061213152259.GR5148@stygia.hyboria>
Mime-Version: 1.0
User-Agent: Mutt/1.5.11
Subject: [RFC] Correct the .la files produced by gcc cross
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
X-List-Received-Date: Wed, 13 Dec 2006 15:18:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

In my libstdc++.la file in tmp/cross/${TARGET_SYS}/lib/

The following badness occurs.

dependency_libs='
-L/home/gg/zaurus/build-terrier-ang/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r8/gcc-4.1.1/build.x86_64-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/src
-L/home/gg/zaurus/build-terrier-ang/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r8/gcc-4.1.1/build.x86_64-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/src/.libs
-lm -lm -lm
-L/home/gg/zaurus/build-terrier-ang/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r8/gcc-4.1.1/build.x86_64-linux.arm-angstrom-linux-gnueabi/./gcc
-L/home/gg/zaurus/build-terrier-ang/tmp/cross/arm-angstrom-linux-gnueabi/bin
-L/home/gg/zaurus/build-terrier-ang/tmp/cross/arm-angstrom-linux-gnueabi/lib
-L/home/gg/zaurus/build-terrier-ang/tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.1.1
-L/home/gg/zaurus/build-terrier-ang/tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.1.1/../../../../arm-angstrom-linux-gnueabi/lib
-lgcc_s -lc -lgcc_s -lm -lgcc_s -lc -lgcc_s  '

Which you will note leads the linker to start using
tmp/staging/${BUILD_SYS}/lib which is not a compatible architecure in
most cases. And for me causes libtool linking to fail when it looks at
x86_64 .so files while linking for arm executables.

I think this line should be sed magiced to something along the lines of

dependency_libs='
-L/home/gg/zaurus/build-terrier-ang/tmp/cross/${TARGET_SYS}/lib
-lgcc_s -lc -lm'

What are the clever peoples thoughts on this.

Graeme



