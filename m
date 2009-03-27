Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1Ln8qh-0007uV-43
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 10:59:39 +0100
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 56102547D3; Fri, 27 Mar 2009 10:57:51 +0100 (CET)
Date: Fri, 27 Mar 2009 10:57:51 +0100
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090327095751.GA8994@fh-wedel.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Link error: host instead of target libc
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
X-List-Received-Date: Fri, 27 Mar 2009 09:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 still trying to get nylon/mtx-1 built with the current OE code,
I am getting this error at install of glibc-2.3.3:

| /var/src/OE/tmp/cross/mipsel/lib/gcc-lib/mipsel-oe-linux/3.3.4/../../../../mipsel-oe-linux/bin/ld: skipping incompatible /lib/libc.so.6 when searching for /lib/libc.so.6
| /var/src/OE/tmp/cross/mipsel/lib/gcc-lib/mipsel-oe-linux/3.3.4/../../../../mipsel-oe-linux/bin/ld: cannot find /lib/libc.so.6
| collect2: ld returned 1 exit status
| make[2]: *** [/var/src/OE/tmp/work/mipsel-oe-linux/glibc-2.3.3-r16/build-mipsel-oe-linux/math/libm.so] Error 1

Having asked google I found that people had this kind of problem
before, but I could not extract any hint on how to solve this
there. My checkout of OE dates back to this commit:

| commit 8ff9eac82736ab3adc5ffd223a39d9eafd2409be
| Author: Dmitry 'MAD' Artamonow <mad_soft@inbox.ru>
| Date:   Tue Feb 24 21:38:10 2009 -0800

I followed Mickey's proposal and derived my conf/distro/nylon.conf
from minimal.conf adding my preferred versions etc.

Having had a longer break from nylon maintainership I seem to have
missed a lot of changes in OE; and I am quite clueless now where to
start searching for what causes the above error. Any hint?

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Man muss das Dreibein hin und wieder loben, dann geht es auch schonmal runter,
den Muell wegbringen.


