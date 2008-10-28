Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kuqce-0001pQ-77
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Oct 2008 16:36:44 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1Kuqbg-0003qm-Se; Tue, 28 Oct 2008 15:35:45 +0000
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1Kuqbg-0000I6-MT; Tue, 28 Oct 2008 15:35:44 +0000
From: Phil Blundell <pb@reciva.com>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <87skqgq1xf.fsf@neumann.lab.ossystems.com.br>
References: <1225195813.9866.33.camel@mill.internal.reciva.com>
	<87skqgq1xf.fsf@neumann.lab.ossystems.com.br>
Date: Tue, 28 Oct 2008 15:35:43 +0000
Message-Id: <1225208144.9866.44.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : xorg-xserver-common.inc: set	userid to allow Xorg to be run by users
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
X-List-Received-Date: Tue, 28 Oct 2008 15:36:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-10-28 at 11:33 -0200, Otavio Salvador wrote:
> I somewhat understand your complains. Debian usea a wrapper for that
> propouse. I like this idea and I believe it might be a way to go.
> 
> http://git.debian.org/?p=pkg-xorg/debian/xorg.git;a=blob;f=debian/local/xserver-wrapper.c;hb=HEAD
> 
> What do you think about it?

Yes, this sounds like the right solution to that problem.  However, I
think even this ought to be a DISTRO opt-in rather than the default,
since for many people it will probably be unnecessary.

p.




