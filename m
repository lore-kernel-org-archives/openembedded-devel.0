Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1O9bXV-0001FI-KT
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 12:09:15 +0200
Received: from host86-150-22-11.range86-150.btcentralplus.com ([86.150.22.11]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1O9bTr-00045p-Kb
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 11:05:27 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1O9bTr-00085d-6b
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 11:05:27 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BE141CA.30904@dresearch.de>
References: <4BE13C20.1010902@dresearch.de>
	<20100505094242.GF2444@xora-desktop.xora.org.uk>
	<4BE141CA.30904@dresearch.de>
Date: Wed, 05 May 2010 11:05:26 +0100
Message-ID: <1273053926.18119.331.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux vs. linux-libc-headers?
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
X-List-Received-Date: Wed, 05 May 2010 10:09:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-05-05 at 12:00 +0200, Steffen Sledz wrote:
> Am 05.05.2010 11:42, wrote Graeme Gregory:
> > I thought glibc was supposed to gracefully fall back on missing syscalls?
> 
> May be, but not satisfactorily.
> 
> E.g. we've seen that g_file_monitor (from glib) falls back to
> polling each second instead of using inotify_init.

That sounds like it's just a bug in glibc.  I guess you should fix it
there.

p.




