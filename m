Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LN75C-0001Fi-TK
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 15:51:13 +0100
Received: from [81.170.61.65] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LN6yn-0003Xi-TC
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 14:44:26 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <496DEDF1.9080506@gmx.net>
References: <496D4B33.60102@gmx.net> <gkk2ut$5m8$1@ger.gmane.org>
	<496DC520.90601@gmx.net>
	<1231931047.2952.208.camel@mill.internal.reciva.com>
	<496DEDF1.9080506@gmx.net>
Date: Wed, 14 Jan 2009 14:44:20 +0000
Message-Id: <1231944260.9499.87.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.61.65
Subject: Re: "armv6" override not used
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
X-List-Received-Date: Wed, 14 Jan 2009 14:51:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-01-14 at 14:51 +0100, Robert Schuster wrote:
> it is related to GCC: Although -mfloat-abi=vfp is given __SOFTFP__ is
> not defined and that is required for libffi because otherwise the sysv.S
> assembler file uses instructions not available any more on armv6/armv7.

That sounds more like libffi is to blame.  Shouldn't it be checking for
(defined(__SOFT_FP__) || defined(__VFP_FP__))?  Or, if you really are
using soft-float, then presumably gcc is to blame for not defining
__SOFT_FP__.

Either way, it seems like whichever package is broken should just be
fixed, rather than trying to work around it with architecture-specific
CFLAGS forcing.  Assuming that the problem is libffi trying to use FPA
instructions #ifndef __SOFT_FP__, then it will break on ARMv5
architectures as well if you happen to be using VFP.

p.




