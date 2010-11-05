Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1PEKNf-000338-Be
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 12:22:52 +0100
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1PEKMo-0003Pc-9I; Fri, 05 Nov 2010 11:21:58 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>)
	id 1PEKMo-0004zQ-19; Fri, 05 Nov 2010 11:21:58 +0000
From: Phil Blundell <philb@gnu.org>
To: Holger Freyther <holger+oe@freyther.de>
In-Reply-To: <4CD2FAF0.4080905@freyther.de>
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>
	<4CD2FAF0.4080905@freyther.de>
Date: Fri, 05 Nov 2010 11:21:57 +0000
Message-ID: <1288956117.3770.1109.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
X-SA-Exim-Connect-IP: 62.7.80.110
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH/RFC] qt4-embedded: tune QT_ARCH for armv6
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
X-List-Received-Date: Fri, 05 Nov 2010 11:22:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-11-04 at 19:26 +0100, Holger Freyther wrote:
> Phil do you happen to know why unaligned access got allowed starting from
> armv6? How fast will it be?

I don't know, but I would suspect that unaligned access was added to
ARMv6 in response to customer demand, and because a certain other
popular architecture supported it already.

Having the silicon be able to do unaligned accesses isn't a totally
worthless thing.  If you're faced with, say, a 32-bit int of unknown
alignment which you want to demarshal, there are two possible ways you
can do it in a pre-v6 world:

a) use four single-byte loads plus some ALU operations to combine the
results.  This is guaranteed safe for all alignments, but the LDRB+LDRB
+ORR+LDRB+ORR+LDRB+ORR sequence is inefficient compared to a single LDR:
it takes seven cycles to execute and requires a scratch register, even
if the operand is in fact naturally aligned at runtime.

b) use a single LDR instruction, let the MMU trap unaligned accesses,
and fix them up in software using sequence (a).  This has the advantage
that the aligned case runs at full speed, but the performance penalty
for loads which turn out to be unaligned is severe, probably at least
several tens of cycles and perhaps even more than that.  If many
unaligned operands are encountered then the performance might be worse
than just using (a) in the first place.

If the processor can do unaligned accesses natively then this problem
goes away: you can just use a single LDR instruction and it will always
execute at the maximum speed the hardware is capable of for that
particular operand.  For naturally aligned operands the load will
complete in a single cycle, just like it always did.  Since AHB doesn't
support unaligned access at the bus level, misaligned operands will need
two bus cycles but that's still much faster than either of the
software-based approaches.

p.




