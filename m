Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N1ldt-00009X-N0
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 20:47:13 +0200
Received: from 88-109-185-146.dynamic.dsl.as9105.com ([88.109.185.146]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N1lce-0004al-N6
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 19:45:57 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1256398757.4681.0@zaurus>
References: <1256398757.4681.0@zaurus>
Date: Sat, 24 Oct 2009 19:45:32 +0100
Message-ID: <1256409932.15214.67.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 18:47:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2009-10-24 at 17:39 +0200, Stanislav Brabec wrote:
> Phil Blundell wrote:
> > On Sat, 2009-10-24 at 10:48 +0200, Koen Kooi wrote:
> > > On 24-10-09 00:31, Stanislav Brabec wrote:
> 
> > > > binutils-2.18-r8.1: /usr/lib/libiberty.a
> > 
> > I'm not convinced you really want to be shipping libiberty at all.
> > Every project that uses this library tends to bundle a local copy in
> > with its source code.
> 
> Probaby agree. One instance of libibery per distro with header still
> can exist.

Yeah, you could do that if you wanted.  Debian doesn't seem to ship it
which suggests that there isn't a great deal of demand for such a thing,
but it would be harmless enough.

> > Those are probably special.  I'm not quite sure what the deal is with
> > libstdc++_pic, that would need some further investigation.
> 
> _pic.a is a convenient name for static libraries, if their contents may
> be linked into a shared library (i. e. they are compiled with -fPIC).

Right, but it isn't entirely obvious to me why one would (in general)
want to install such a library.  Do you know what the actual use-case
for libstdc++_pic is?  If this is for mklibs-style library reduction
then it probably belongs in yet another subpackage if anywhere.

p.




