Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kvcnw-00086D-MU
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 20:03:56 +0100
Received: from 88-111-134-150.dynamic.dsl.as9105.com ([88.111.134.150]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KvcmI-0007fT-Hk
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 19:01:54 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1KvcSD-0007H7-V3@linuxtogo.org>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
	<E1KvYmj-0007s2-Og@linuxtogo.org>
	<1225379284.3822.154.camel@mill.internal.reciva.com>
	<E1Kvahy-0001AR-Sj@linuxtogo.org>
	<1225386831.17961.15.camel@mill.internal.reciva.com>
	<E1Kvc17-0001Gl-VY@linuxtogo.org>  <E1KvcSD-0007H7-V3@linuxtogo.org>
Date: Thu, 30 Oct 2008 19:01:53 +0000
Message-Id: <1225393313.4235.451.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: arm kernel configurations
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
X-List-Received-Date: Thu, 30 Oct 2008 19:05:02 -0000
X-List-Received-Date: Thu, 30 Oct 2008 19:05:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-10-30 at 14:37 -0400, Tom Talpey wrote:
> Interesting. This time it booted all the way to GPE. But, hid2hci
> faulted and the kernel trapped on it. Nothing strange at all about
> that binary, and the same one works fine on the OABI kernel.

That's very strange indeed.  Does it do the same thing every time or is
it more random than that?

> >Unable to handle kernel paging request at virtual address 560000b8

This doesn't seem to have any obvious relation at all to the OABI
setting.  There's no reason why the kernel should be trying to access
that memory address during a core dump.  At a first appearance I would
say that you have some kind of hardware problem (misconfigured memory or
the like) but obviously in that case you would expect it to fail under
OABI too.  So, all in all, very weird.

p.




