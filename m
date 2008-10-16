Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KqU6j-0008HA-PK
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 16:45:45 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 99C12628089
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 16:40:34 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@openembedded.org
Date: Thu, 16 Oct 2008 16:40:34 +0200
Message-Id: <1224168034.12073.24.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.0 
Subject: mplayer: PATH=...STAGING_BINDIR_CROSS not sufficient with complex PACKAGE_ARCH
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
X-List-Received-Date: Thu, 16 Oct 2008 14:45:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

I just debugged build failure of mplayer in devel branch and it seems to
be either deep in the bitbake.conf and class system or in bad use in the
mplayer package. However I do not understand it in deep. Could somebody
help?

If package uses a high optimization, then it should resource both these
directories:
/OE/build/tmp/staging/x86_64-linux/usr/bin/iwmmxt-angstrom-linux-gnueabi
/OE/build/tmp/staging/x86_64-linux/usr/bin/armv5te-angstrom-linux-gnueabi

Actually PKG_CONFIG_PATH is missing the other part (the iwmmxt one).
And probably both misses the architecture independent part (which may be
an issue for possible no-arch packages providing .pc file that may
appear in future).

Details:

/OE/build/tmp/staging/x86_64-linux/usr/lib/libSDL.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status

which sdl-config
/OE/build/tmp/staging/x86_64-linux/usr/bin/sdl-config

echo $PATH
/OE/build/tmp/staging/x86_64-linux/usr/bin/iwmmxt-angstrom-linux-gnueabi:/OE/build/tmp/staging/x86_64-linux/usr/sbin:/OE/build/tmp/staging/x86_64-linux/usr/bin:/OE/build/tmp/cross/armv5te/bin:/OE/build/tmp/staging/x86_64-linux/sbin:/OE/build/tmp/staging/x86_64-linux/bin:...system stuff

find /OE/build/tmp/staging -name sdl-config
/OE/build/tmp/staging/x86_64-linux/usr/bin/sdl-config
/OE/build/tmp/staging/x86_64-linux/usr/bin/armv5te-angstrom-linux-gnueabi/sdl-config

packages/mplayer/mplayer_svn.bb contains:
MY_ARCH := "${PACKAGE_ARCH}"                                                                                                                
PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'iwmmxt', 'iwmmxt', '${MY_ARCH}',d)}"

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



