Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PvGLo-0004U9-Ku
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 22:46:25 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PvGKQ-0005Iq-23
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 22:44:58 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinrZHXCyA2USHeuOijx0KrZrNVY7K3uhqwpLaao@mail.gmail.com>
References: <AANLkTinrZHXCyA2USHeuOijx0KrZrNVY7K3uhqwpLaao@mail.gmail.com>
Date: Thu, 03 Mar 2011 21:44:47 +0000
Message-ID: <1299188687.17920.150.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: gcc ICE (gcc 4.1.2, nios2), test program included
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
X-List-Received-Date: Thu, 03 Mar 2011 21:46:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 19:48 +0100, Frans Meulenbroeks wrote:
> Dear all,
> 
> I've bumped onto an issue that I seem unable to resolv.
> With gcc 4.1.2, target nios2, I get an ICE when compiling dbus:
>
> [...]
>
> Anyone an idea on how to tackle this.

I'm not sure there's much to say about this really.  An ICE is, more or
less by definition, a compiler bug in gcc, and the version you're
testing with is quite old now (by normal standards if not in the Altera
world).  So your options would seem to be:

a) find a newer gcc and hope that it fixes the bug;

b) debug the failure for yourself (see the gcc manual and/or mailing
list for advice); or

c) persuade someone else, presumably one of the nios2 gcc maintainers,
to debug it.

p.



