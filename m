Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OcFKB-0003ev-2k
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:17:53 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OcFJz-0008Sk-5K
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:17:39 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OcFJy-0002kD-U1
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:17:39 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279875548.13006.32.camel@rex>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com>
	<i2bir6$un3$1@dough.gmane.org>  <1279875548.13006.32.camel@rex>
Date: Fri, 23 Jul 2010 11:17:38 +0100
Message-ID: <1279880258.2692.15.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 10:17:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-23 at 09:59 +0100, Richard Purdie wrote:
> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
> > It's all 'arm-angstrom-foo', I was just about to make the suggestion to
> > change it to 'armv7a-angstrom-foo' :)
> 
> I've just been talking to Koen about this. When building for armv7a,
> TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".

Ah, right, I see. 

> I suspect if we change TARGET_ARCH to be armv7a, nasty things will
> happen but I could be wrong.

I can't think offhand of any bad thing that would result from doing
that.  It certainly might be worth a try. 

On the other hand, I also can't think offhand of any significant way in
which the gcc builds for different subarches are going to be different.
The architecture selection is all done at run time using -march in
CFLAGS, isn't it?

> Is that libiberty.a file actually useful or could we just stop
> binutils-cross installing it?

No, it isn't useful.

p.



