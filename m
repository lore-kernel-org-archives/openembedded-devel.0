Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kv93r-0006I5-Q9
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 12:18:03 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Kv92v-00081x-A7
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 11:17:05 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1Kv92u-0007i0-K3
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 11:17:04 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810282333.49881.zecke@selfish.org>
References: <200810282333.49881.zecke@selfish.org>
Date: Wed, 29 Oct 2008 11:17:04 +0000
Message-Id: <1225279024.3822.22.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: FYI: Openmoko merge status
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
X-List-Received-Date: Wed, 29 Oct 2008 11:18:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-10-28 at 23:33 +0100, Holger Freyther wrote:
> One funny thing is diverting PRs. In order to merge OE=>OM we need to bump the 
> PR/PE of some packages and I would like to do this in the OE tree. I wonder if 
> we have some kind of policy for that.

Can you explain in more detail what exactly is the issue?

Regarding PE, if OM has epoched some packages that other distros
haven't, I am inclined to say that you should just put "PE_mypackage =
999" in your distro config file for the affected packages.  I would
certainly not be in favour of introducing a new epoch for all distros
just to get in sync with OM.

Regarding PR, the right answer probably depends on the specifics of the
situation and it might be different for each package.

p.




