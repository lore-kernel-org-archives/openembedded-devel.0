Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kvb6r-0002jX-4F
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 18:15:01 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Kvb5n-0001id-Nf
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 17:13:57 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1Kvb5k-00010z-E0
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 17:13:55 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Kvahy-0001AR-Sj@linuxtogo.org>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
	<E1KvYmj-0007s2-Og@linuxtogo.org>
	<1225379284.3822.154.camel@mill.internal.reciva.com>
	<E1Kvahy-0001AR-Sj@linuxtogo.org>
Date: Thu, 30 Oct 2008 17:13:51 +0000
Message-Id: <1225386831.17961.15.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Thu, 30 Oct 2008 17:15:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-10-30 at 12:45 -0400, Tom Talpey wrote:
> As above - the specs do include "--with-float=soft". I guess I'll have to
> dig some more. Do I also need -mfloat-abi=softfp in the machine.conf like
> some of the other arm's?

I don't think so.  If I remember right, -mfloat-abi=softfp is for the
case where you want to use hard floating point instructions (for speed)
but still want to retain compatibility with a soft-float ABI.

I wonder if something has gone wrong with your glibc configuration.  Try
disassembling one of your binaries and see if you can find any reference
to "wfs" or "rfs" instructions.  Also have a look in libc.so.6 itself to
see what the syscall instructions look like: for OABI you will see
something like "swi 0x900004", whereas for EABI it will look more like
"mov ip, r7; mov r7, #4; swi 0; mov r7, ip".

> But the Kconfig comment does warn that RMK will kill us! ;-)

Heh.  True, but only if he finds out :-)

p.




