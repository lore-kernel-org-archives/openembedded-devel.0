Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MeJSB-0003WV-RH
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 04:02:07 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1D0761B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 01:48:45 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Aug 2009 03:43:48 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8D4947.5030108@gmail.com>
	<200908201526.46349.holger+oe@freyther.de>
	<4A8D98FB.5000400@gmail.com>
In-Reply-To: <4A8D98FB.5000400@gmail.com>
MIME-Version: 1.0
Message-Id: <200908210343.48652.holger+oe@freyther.de>
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Fri, 21 Aug 2009 02:02:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 20 August 2009 20:42:03 Dmitry Vinokurov wrote:

I will update the documentation with these bits:


ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
ASSUME_PROVIDED += " virtual/libc "
ASSUME_PROVIDED += "linux-libc-headers "
ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc "
ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-initial "
ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-intermediate "
ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}binutils "
ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}libc-for-gcc "
ASSUME_PROVIDED += "virtual/libintl "
ASSUME_PROVIDED += "virtual/libiconv "

TARGET_PREFIX = "arm-linux-gnueabi-"
ASSUME_SHLIBS = "libc.so.6:libc"


The main difference are. Assume provided more binaries/libraries, use the 
TARGET_PREFIX instead of CC, CXX, NM....


does this work any better?
	z.


