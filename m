Received: from [67.19.73.58] (helo=pug.o-hand.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <richard@openedhand.com>) id 1Gnajw-0001I9-BJ
	for openembedded-devel@openembedded.org; Fri, 24 Nov 2006 14:05:12 +0100
Received: from max.rpnet.com (tim.rpsys.net [194.106.48.114])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 34D3D10CC42F;
	Fri, 24 Nov 2006 08:12:35 -0500 (EST)
From: Richard Purdie <richard@openedhand.com>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 24 Nov 2006 13:01:57 +0000
Message-Id: <1164373318.26934.14.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Mailman-Approved-At: Sat, 25 Nov 2006 18:27:00 +0100
Subject: STAGING_BINDIR
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
X-List-Received-Date: Fri, 24 Nov 2006 13:05:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I have hit a problem. At first I thought it was going to be a simple one
but it isn't and raises a question I've wondered about for a long time.

The problem is I had both an x86 build and an arm build in the same tree
with multimachine. In theory, this should work and it very nearly does
except I see odd compile failures in gnutls. The compile failures turn
out to be from x86 assembler. The x86 assembler is creeping in due to
corrupted include parameters from gcc. The corrupted parameters are
coming from running the "libgcrypt-config" binary. 

To make things more interesting, this only happens if you build x86,
then arm. If you build arm first, it all works...

Basically we have a race. Both the armv5te libgcrypt build and the x86
libgcrypt build install the "libgcrypt-config" binary into
STAGING_BINDIR.

from bitbake.conf we see:

STAGING_DIR = "${TMPDIR}/staging"
STAGING_BINDIR = "${STAGING_DIR}/${BUILD_SYS}/bin"
STAGING_LIBDIR = "${STAGING_DIR}/${HOST_SYS}/lib"
STAGING_INCDIR = "${STAGING_DIR}/${HOST_SYS}/include"
STAGING_DATADIR = "${STAGING_DIR}/${HOST_SYS}/share"
STAGING_LOADER_DIR = "${STAGING_DIR}/${HOST_SYS}/loader"
STAGING_FIRMWARE_DIR = "${STAGING_DIR}/${HOST_SYS}/firmware"

which has always struck me as odd - BINDIR uses ${BUILD_SYS} rather than
${HOST_SYS}. I did discuss this a long time ago when I was a lot newer
to OE. multimachine wasn't as widely supported than and it was argued
that since binaries installed there were to be run on ${BUILD_SYS}
rather than ${HOST_SYS}, this was really ok. If we change this to
${HOST_SYS}, my build issues would disappear as the arm and x86 versions
will end up in different places. I think the time has come to do
something about this but its not that simple :)

The -native packages install to ${BUILD_SYS}/bin and the arch specific
ones to ${HOST_SYS}/bin. So we add both to PATH, problem solved?

What happens when we start using packaged staging and ${HOST_SYS}/bin
contains arm binaries? Our staging generally doesn't at the moment but
is likely to in future and we do not want arm binaries in PATH.

My proposal is therefore to use:

STAGING_BINDIR = "${STAGING_DIR}/${BUILD_SYS}/bin/${HOST_SYS}" and have
native.bbclass override this with ${BUILD_SYS}/bin

We'd then add both ${BUILD_SYS}/bin and ${BUILD_SYS}/bin/${HOST_SYS} to
the PATH.

Does anyone see a better way to handle this?

I suspect there are going to be problems with binaries missing from
${STAGING_BINDIR} when we switch to packages staging. I just wonder why
we haven't see those problems with packaged staging yet? Is anyone
actively using/testing it?

Regards,

Richard




