Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PpMOM-00012Y-Ob
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 16:00:38 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PpMNG-0000hk-Gt
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 15:59:30 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D5A89CD.803@opendreambox.org>
References: <4D5A5871.7000005@dresearch.de>  <4D5A89CD.803@opendreambox.org>
Date: Tue, 15 Feb 2011 15:01:06 +0000
Message-ID: <1297782066.2178.126.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Tue, 15 Feb 2011 15:00:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-02-15 at 15:12 +0100, Andreas Oberritter wrote:
> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
> > "Kernel headers are backwards compatible, but not forwards compatible.  This
> > means that a program built against a C library using older kernel headers
> > should run on a newer kernel (although it may not have access to new
> > features), but a program built against newer kernel headers may not work on an
> > older kernel."[2]
> 
> Isn't this what the variable OLDEST_KERNEL is good for, when compiling
> glibc?

Not quite, no.  OLDEST_KERNEL is used to configure glibc's internal
kernel compatibility code and doesn't have much to do with the headers.

Under normal circumstances, glibc will include a bunch of compatibility
functions which allow the same binary to work (up to a point) on a range
of kernel versions.  For example, sys_pselect6 was added, on arm at
least, in 2.6.32, and if glibc finds itself running on an older kernel
it will fall back to using sys_select instead.  However, if you
configure with --enable-kernel=2.6.32 then you are promising to glibc
that it will never be used on an older kernel and this compatibility
logic can be omitted: you will now just get a "kernel too old" error if
you try to boot on 2.6.31 or lower.

p.




