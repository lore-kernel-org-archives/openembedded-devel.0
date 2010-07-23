Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OcFQB-00041w-V7
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:24:04 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OcFPy-00007N-U1
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:23:50 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OcFPy-0002sx-M0
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:23:50 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTik8CaoY=od-BH7_ymJf1Yet5e-cJGJ3PFyPm42N@mail.gmail.com>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com>
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex>
	<AANLkTik8CaoY=od-BH7_ymJf1Yet5e-cJGJ3PFyPm42N@mail.gmail.com>
Date: Fri, 23 Jul 2010 11:23:50 +0100
Message-ID: <1279880630.2692.21.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Fri, 23 Jul 2010 10:24:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-23 at 11:35 +0200, Esben Haabendal wrote:
> config.sub will generally not accept something like armv7a-*

That's probably true, but it ought to accept armv7a-*-* (and has done
for about fifteen years, so I expect almost all packages should now have
picked up that change).  I think OE always uses the triple so there
oughtn't to be any problem in practice.

> If OE had not offered the vendor part of the arch strings to distros,
> it could have
> been solved by (in this case) using arm-v7a-foo ...

That doesn't sound very wholesome.  I don't think 'v7a' is really a
vendor name by any stretch of the imagination.

p.




