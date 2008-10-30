Received: from [76.96.30.40] (helo=QMTA04.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1Kvbz9-0001Gg-Qp
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 19:11:08 +0100
Received: from OMTA11.emeryville.ca.mail.comcast.net ([76.96.30.36])
	by QMTA04.emeryville.ca.mail.comcast.net with comcast
	id YzSi1a00U0mlR8UA46A1MC; Thu, 30 Oct 2008 18:10:01 +0000
Received: from tmt.rcn.com ([98.229.118.72])
	by OMTA11.emeryville.ca.mail.comcast.net with comcast
	id Z69y1a00g1ZoUlN8X6A0uz; Thu, 30 Oct 2008 18:10:01 +0000
X-Authority-Analysis: v=1.0 c=1 a=PhgSEKdnhadrIIquOaQA:9
	a=aGRv66qsq2vcZLfgt2AA:7 a=L2ZYMmTQyAmQI_jH0uMc0wdjnUgA:4
	a=h9s5Ru71U4oA:10
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Thu, 30 Oct 2008 14:09:12 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <1225386831.17961.15.camel@mill.internal.reciva.com>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
	<E1KvYmj-0007s2-Og@linuxtogo.org>
	<1225379284.3822.154.camel@mill.internal.reciva.com>
	<E1Kvahy-0001AR-Sj@linuxtogo.org>
	<1225386831.17961.15.camel@mill.internal.reciva.com>
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 30 Oct 2008 18:11:08 -0000
Message-ID: <MADEUP.15FE1A15F97DC729.13558@groups.io>
Content-Type: text/plain; charset="us-ascii"

At 01:13 PM 10/30/2008, Phil Blundell wrote:
>On Thu, 2008-10-30 at 12:45 -0400, Tom Talpey wrote:
>> As above - the specs do include "--with-float=soft". I guess I'll have to
>> dig some more. Do I also need -mfloat-abi=softfp in the machine.conf like
>> some of the other arm's?
>
>I don't think so.  If I remember right, -mfloat-abi=softfp is for the
>case where you want to use hard floating point instructions (for speed)
>but still want to retain compatibility with a soft-float ABI.
>
>I wonder if something has gone wrong with your glibc configuration.  Try
>disassembling one of your binaries and see if you can find any reference
>to "wfs" or "rfs" instructions.  Also have a look in libc.so.6 itself to
>see what the syscall instructions look like: for OABI you will see
>something like "swi 0x900004", whereas for EABI it will look more like
>"mov ip, r7; mov r7, #4; swi 0; mov r7, ip".

Looks like EABI to me then, objdump -d libc.so.6 sample syscall:

0002a0c0 <kill>:
   2a0c0:       e1a0c007        mov     ip, r7
   2a0c4:       e3a07025        mov     r7, #37 ; 0x25
   2a0c8:       ef000000        svc     0x00000000
   2a0cc:       e1a0700c        mov     r7, ip
   2a0d0:       e3700a01        cmn     r0, #4096       ; 0x1000
   2a0d4:       312fff1e        bxcc    lr
   2a0d8:       eaffaa98        b       14b40 <__libc_start_main+0x248>
   2a0dc:       e1a00000        nop                     (mov r0,r0)

And no wfs/rfs at all in any binaries. Hmm, let me try the no-OABI
kernel again. Maybe I can get more status from it. Basically it would
say "Freeing init memory" then nothing more, while with-OABI it would
cruise.

Tom.



