Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MdWOl-0001Pe-Ct
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 23:39:19 +0200
Received: from 79-79-178-204.dynamic.dsl.as9105.com ([79.79.178.204]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MdW8A-0006mE-4G
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 22:22:11 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250626236.6785.50.camel@conroy-linux>
References: <1250176750.29049.1003.camel@conroy-linux>
	<20090813155909.GC8906@gmail.com>
	<1250612879.6785.12.camel@conroy-linux>
	<20090818174157.GB25000@denix.org>
	<1250620212.6785.43.camel@conroy-linux>
	<20090818195028.GU2227@smtp.west.cox.net>
	<1250626236.6785.50.camel@conroy-linux>
Date: Tue, 18 Aug 2009 22:21:56 +0100
Message-Id: <1250630516.4215.230.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Tue, 18 Aug 2009 21:39:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-08-18 at 16:10 -0400, Chris Conroy wrote:
> I don't see any easy path to change debian.bbclass since it requires
> introspection on the TMPDIR which does not exist for users of an
> external toolchain.

There shouldn't be any need to change debian.bbclass; its work is
already done at the point where your problem is occurring.  It sounds
like your external toolchain is simply failing to ship the appropriate
pkgdata files, and/or package.bbclass is failing to read them in for
some reason.

p.




