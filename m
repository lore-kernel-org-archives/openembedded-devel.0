Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KMOHs-0008RI-Lc
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 16:28:52 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KMOGa-00009H-E0
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 15:27:32 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KMOGa-0007jy-6D
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 15:27:32 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200807251453.21851.openembedded@haerwu.biz>
References: <200807251453.21851.openembedded@haerwu.biz>
Date: Fri, 25 Jul 2008 15:27:31 +0100
Message-Id: <1216996051.22069.99.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: [RFC] Naming of packages for x86 archs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 14:28:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-07-25 at 14:53 +0200, Marcin Juszkiewicz wrote:
> I would like to start discussion about naming for x86 package archs. One 
> of propositions in past was use something like "tune-prescott" does - 
> adding description after arch name (i686p4c). This way we can have list 
> like:
> 
> i586      - pentium
> i586mmx   - pentium with mmx, Geode GX1
> i586c3    - VIA C3
> i586k6    - AMD K6
> i586k62   - AMD K6-2, Geode LX
> i586geode - Geode LX with gcc 4.3 or patched 4.2

I'm not totally thrilled with the idea of jamming the tune flags into
the architecture name.  This seems like it will give you an explosion of
new arch names which, for 99% of packages, will not be usefully
different to one another.

If any particular distro needs that level of distinction then fine, let
them go it for their packages.  But I don't think it should necessarily
be the default.

p.




