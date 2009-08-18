Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1MdVI4-0002Ng-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 22:28:21 +0200
X-AuditID: 0a1e000a-b7ba8ae000000dd5-f7-4a8b0ae0cdf1
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090818195028.GU2227@smtp.west.cox.net>
References: <1250176750.29049.1003.camel@conroy-linux>
	<20090813155909.GC8906@gmail.com>
	<1250612879.6785.12.camel@conroy-linux>
	<20090818174157.GB25000@denix.org>
	<1250620212.6785.43.camel@conroy-linux>
	<20090818195028.GU2227@smtp.west.cox.net>
Date: Tue, 18 Aug 2009 16:10:36 -0400
Message-Id: <1250626236.6785.50.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
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
X-List-Received-Date: Tue, 18 Aug 2009 20:28:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-08-18 at 12:50 -0700, Tom Rini wrote:
> 
> OK, here's the problem, I think.  You're trying to make an image for say
> i686-armv6-sdk-linux-gnueabi?  What are you expecting to be in this raw
> image however, the contents of say meta-toolchain, extracted and put
> into a ext2?  For most people, meta-toolchain, and the resulting tarball
> are the output that gets used.
> 

The problem is the dependencies get satisfied during the build because
package X depends on glibc, but external-toolchain.bb chimes in and says
"Hi, I provide virtual/libc." Package X builds and links just fine since
the external-toolchain dropped everything in the right place.

The problem comes whenever opkg needs to deal with dependencies since it
doesn't know about 'virtual/libc'. It sees that Package X wants glibc
and it can't find it since it only knows about the debian-named version
called 'libc6'. Glibc never gets built (since it's already been built)
and thus never gets debian renamed.

I don't see any easy path to change debian.bbclass since it requires
introspection on the TMPDIR which does not exist for users of an
external toolchain.

I hope this is clear. Let me know if there are any points of confusion.

In the meantime, turning off the renaming successfully works around this
bug.

--Chris Conroy


