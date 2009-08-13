Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbcsY-00053S-3z
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 18:10:15 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id CA4341B10C0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 15:56:53 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 17:52:57 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250176750.29049.1003.camel@conroy-linux>
In-Reply-To: <1250176750.29049.1003.camel@conroy-linux>
MIME-Version: 1.0
Message-Id: <200908131752.57975.holger+oe@freyther.de>
Subject: Re: gcc-cross-sdk (GCC 4.2.3) limits.h woes
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
X-List-Received-Date: Thu, 13 Aug 2009 16:10:17 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 13 August 2009 17:19:10 Chris Conroy wrote:
> I've spent a pretty good chunk of time this past week trying to get a
> working external toolchain, but I've hit a bit of a wall and can't
> figure out how to fix this last problem.

I'm a bit hungry so here is just my config:

conf/local.conf
DL_DIR = "${HOME}/source/sources/"
DISTRO = "angstrom-2008.1"
MACHINE="db1200"
IMAGE_FSTYPES += " ext2 "

BB_NUMBER_THREADS = "4"
PARALLEL_MAKE = "-j4"
ENABLE_BINARY_LOCALE_GENERATION="0"
ENTERPRISE_DISTRO = "1"

BBFILES="${HOME}/source/embedded/openembedded/recipes"

$ bitbake meta-toolchain-qte

just passed today (thanks to Graham's work).. on my i686..


     binutils: 2.18
     gcc: 4.3.3
     glibc: 2.9


maybe that is useful?


PS: For gcc4.2.x we need to pass more include dirs... the error with 
#include_next is that it runs out of search paths.... With poky I pushed it a 
bit but didn't manage to build a working version


