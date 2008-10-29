Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KvDDk-00082s-57
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 16:46:10 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KvCwi-0004Go-JH
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 15:26:56 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KvCwi-0004E2-BG
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 15:26:56 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Oct 2008 15:26:55 +0000
Message-Id: <1225294016.3822.81.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: arm kernel configurations
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
X-List-Received-Date: Wed, 29 Oct 2008 15:49:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On the subject of gta01 performance I thought it might be worth pointing
out a couple of common kernel inefficiencies:

- out of the box, the arm kernel always compiles itself with APCS-style
frame pointers enabled.  This means that you lose a general purpose
register, and makes the function prologue and epilogue sequences more
heavyweight.  For production use I would always recommend turning off
frame pointers (which involves patching arch/arm/Kconfig.debug) in order
to get a smaller and faster kernel.

- if your userspace is pure EABI, make sure that you have
CONFIG_OABI_COMPAT turned off.  With this option enabled, the kernel
needs to inspect all SWI instructions to see if they might be OABI
syscalls: on machines with Harvard caches, this will almost certainly
involve hauling a cacheline in from main memory, which is slow and leads
to poor dcache utilisation (since you are loading eight words of which
only one is likely to be any use).

- if your userspace doesn't depend on load-rotate (most doesn't
nowadays) then you can hard-wire the alignment trap behaviour to be
SIGBUS and avoid reloading cp15 on every kernel entry.  This saves
another two lines in the dcache.  I don't have a pretty patch for this
yet but contributions would be welcome :-)

These three changes make a measurable difference to the kernel benchmark
results.  For example, syscall entry/exit drops from about 490ns to
about 390ns on my gta01, an improvement of more than 20%.  The cost of
stat() drops from 36.8us to 33.2us, an improvement of 14%.

share and enjoy

p.




