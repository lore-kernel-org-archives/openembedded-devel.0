Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKSMF-00068C-BV for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:34:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKSI0-0002U6-21 for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:30:04 +0200
Received: from 83.150.95.26 ([83.150.95.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 10:30:04 +0200
Received: from henri.bragge by 83.150.95.26 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 10:30:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Henri Bragge <henri.bragge@dcombus.com>
Date: Fri, 4 Jun 2010 08:27:00 +0000 (UTC)
Message-ID: <loom.20100604T102513-753@post.gmane.org>
References: <alpine.DEB.2.00.1005140557420.29014@lynx>
	<4BED7085.9020608@zenlinux.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 83.150.95.26 (Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.0.19) Gecko/2010040200 Ubuntu/8.04 (hardy) Firefox/3.0.19)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO,SPF_HELO_PASS,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: numerous &quot; strip command failed&quot; ERRORs in building beagle image
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
X-List-Received-Date: Fri, 04 Jun 2010 08:35:21 -0000
X-List-Received-Date: Fri, 04 Jun 2010 08:35:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Scott Garman <sgarman <at> zenlinux.com> writes:

> This happens in the do_package task of many of the kernel builds. I was 
> looking into it just the other night as it triggers BuildBot to think 
> that the build failed (because it sees a non-zero exit status from this 
> section).
> 
> Is it even necessary to stage the kernel scripts/ directory? That's the 
> final thing happening in the do_install task in kernel.bbclass. Removing 
> that line would be a one-liner patch fix to this issue.

Has there been, or will there ever be any progress on this? Just asking if I
should work around this on my own build system..

- Henri




