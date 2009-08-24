Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MfZCC-0004ao-EA for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 15:02:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MfYv1-0006u7-Av
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 14:45:03 +0200
Received: from 195.145.229.154 ([195.145.229.154])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 14:45:03 +0200
Received: from rolf.offermanns by 195.145.229.154 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 14:45:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Offermanns <rolf.offermanns@gmx.net>
Date: Mon, 24 Aug 2009 12:34:13 +0000 (UTC)
Message-ID: <loom.20090824T142939-794@post.gmane.org>
References: <4A8D4947.5030108@gmail.com>
	<200908201526.46349.holger+oe@freyther.de>
	<4A8D98FB.5000400@gmail.com>
	<200908210343.48652.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 195.145.229.154 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.2) Gecko/20090803 Fedora/3.5.2-2.fc11 Firefox/3.5.2)
Sender: news <news@ger.gmane.org>
Subject: Re: LPC3250, helloworld-image,	configure: error: cannot run C compiled programs
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
X-List-Received-Date: Mon, 24 Aug 2009 13:02:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther <holger+oe <at> freyther.de> writes:

> 
> On Thursday 20 August 2009 20:42:03 Dmitry Vinokurov wrote:
> 
> I will update the documentation with these bits:
> 
> ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
> ASSUME_PROVIDED += " virtual/libc "
> ASSUME_PROVIDED += "linux-libc-headers "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-initial "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-intermediate "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}binutils "
> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}libc-for-gcc "
> ASSUME_PROVIDED += "virtual/libintl "
> ASSUME_PROVIDED += "virtual/libiconv "
> 
> TARGET_PREFIX = "arm-linux-gnueabi-"
> ASSUME_SHLIBS = "libc.so.6:libc"
> 
> The main difference are. Assume provided more binaries/libraries, use the 
> TARGET_PREFIX instead of CC, CXX, NM....
> 
> does this work any better?

I recently stumbled upon the same problems and in addition to the things above
(which I can all confirm) I had to add:

ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}libc-initial "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-initial " 
ASSUME_PROVIDED += " gcc-cross " 

to keep bitbake from including glibc / gcc from the build queue.

-Rolf



