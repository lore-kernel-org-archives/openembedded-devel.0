Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M4W42-0005tF-Vh
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 10:13:30 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M4VxR-0007LX-UH
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 09:06:26 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090513211342.GN7973@smtp.west.cox.net>
References: <20090513205603.AAC121893A7@amethyst.openembedded.net>
	<20090513211342.GN7973@smtp.west.cox.net>
Date: Thu, 14 May 2009 09:06:00 +0100
Message-Id: <1242288360.4514.18.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Koen Kooi : gcc 4.3.3: fix regression from	4.3. 1	that caused fortran to get disabled for linux-gnueabi
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
X-List-Received-Date: Thu, 14 May 2009 08:14:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-05-13 at 14:13 -0700, Tom Rini wrote:
> On Wed, May 13, 2009 at 10:56:03PM +0200, GIT User account wrote:
> 
> > Author: Koen Kooi <koen@openembedded.org>
> > Date:   Wed May 13 22:49:19 2009 +0200
> > 
> > gcc 4.3.3: fix regression from 4.3.1 that caused fortran to get disabled for linux-gnueabi
> 
> This came up on IRC today for something else.  Why do we only build a
> fortran compiler on ARM (EABI)?  Should it just be disabled on a few
> platforms perhaps?

Yes: all these options (JAVA, FORTRAN, OBJC) ought really to be
defaulting to on and only suppressed when necessary for the specific
platform/version combinations where they're known to be broken beyond
economic repair.  

In fact gcc-configure-common.inc is doing the right thing, but it does
seem that some joker has decided to turn them off by default in the
gcc-4.x.x.inc files.  I'd certainly be in favour of deleting those
assignments for new versions of gcc-4.x.x.inc, and perhaps even
retrospectively deleting them for the existing versions too.

p.




