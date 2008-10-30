Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KvcVC-0007V1-M3
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 19:44:14 +0100
Received: from 88-111-134-150.dynamic.dsl.as9105.com ([88.111.134.150]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KvcTF-0006gd-Pf
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 18:42:14 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Kvc17-0001Gl-VY@linuxtogo.org>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
	<E1KvYmj-0007s2-Og@linuxtogo.org>
	<1225379284.3822.154.camel@mill.internal.reciva.com>
	<E1Kvahy-0001AR-Sj@linuxtogo.org>
	<1225386831.17961.15.camel@mill.internal.reciva.com>
	<E1Kvc17-0001Gl-VY@linuxtogo.org>
Date: Thu, 30 Oct 2008 18:42:12 +0000
Message-Id: <1225392132.4235.437.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Thu, 30 Oct 2008 18:44:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-10-30 at 14:09 -0400, Tom Talpey wrote:
>    2a0c0:       e1a0c007        mov     ip, r7
>    2a0c4:       e3a07025        mov     r7, #37 ; 0x25
>    2a0c8:       ef000000        svc     0x00000000
>    2a0cc:       e1a0700c        mov     r7, ip

Yeah, that is definitely an EABI syscall.

> And no wfs/rfs at all in any binaries. Hmm, let me try the no-OABI
> kernel again. Maybe I can get more status from it. Basically it would
> say "Freeing init memory" then nothing more, while with-OABI it would
> cruise.

Odd.  Might also be worth enabling CONFIG_DEBUG_USER (and passing
user_debug=255 on the command line) to see if you can get any more
detail about what's going wrong.

p.




