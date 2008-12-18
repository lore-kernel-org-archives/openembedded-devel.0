Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDKVT-0007Qj-16
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 16:09:43 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LDKQo-0004ln-Nv for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 23:05:05 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDKRB-0000LK-W6
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 23:05:18 +0800
Date: Thu, 18 Dec 2008 23:05:17 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20081218150517.GI2135@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
References: <20081218071901.GB2135@buddha.tw.openmoko.com>
MIME-Version: 1.0
In-Reply-To: <20081218071901.GB2135@buddha.tw.openmoko.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: openmoko-merges
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
X-List-Received-Date: Thu, 18 Dec 2008 15:09:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Okay, here is what I will do:

1) commit zero controversial part into oe.dev first.

2) put fastboot related stuffs into another branch for review

3) rebase -i the rest to create a clean history, force update the
openmoko-merges branch, then ask for review again.


Regards,
John




On Thu, Dec 18, 2008 at 03:19:01PM +0800, John Lee wrote:
> Hi,
> 
> Please review john_lee/openmoko-merges.  I started from
> holger/openmoko-merges then rebased it to oe.dev.
> 
> The general principle is:
> 
> 1) Minimal impact: most of the big changes apply to om distro only.
> My thought is we merge this first, then apply to the general.
> 
> 2) Keep history: I did it the hard way by cherry-picking one by one
> since the history is different after the mtn->git switch.  Most of the
> commit messages are kept, but that creates a lot of commits to review.
> 
> 3) PKG_TAGS, qtopia, toolchain, om-utils and opkg stuffs are left out
> for later merge.
> 
> Not sure how long it's going to take.  My plan is to merge it this
> Monday if it's okay...
> 
> 
> Regards,
> John
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


