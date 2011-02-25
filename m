Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pt3rs-0000gZ-Fq
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 21:02:24 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pt3qa-0008HI-ST
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 21:01:04 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
Date: Fri, 25 Feb 2011 20:00:57 +0000
Message-ID: <1298664057.3818.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Fri, 25 Feb 2011 20:02:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-02-25 at 19:03 +0000, Otavio Salvador wrote:
> I am fighting with an issue for last cuple of days and after checking
> a lot of weird stuff it seems that the root cause of problem is a
> linking issue.
> 
> I am having trouble with apps using semaphores. Those are lacking the
> GLIBC_2.1 or similar tags and then doesn't work. I rebuilt the
> application to check and it keep doing the linking wrong.
> 
> Any clue?
> 
> Distro: minimal
> Machine: i586-generic

Can you be more specific about what's going wrong?  I guess you are
saying that your libc lacks the GLIBC_2.1 version of some symbol, but
which one?  Does the problem show up during linking or at run time?
Which binaries in particular?

p.




