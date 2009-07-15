Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MR9zI-0002tt-RY
	for openembedded-devel@openembedded.org; Wed, 15 Jul 2009 21:17:57 +0200
Received: (qmail 19572 invoked from network); 15 Jul 2009 19:04:30 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 15 Jul 2009 12:04:30 -0700
Date: Wed, 15 Jul 2009 12:04:29 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090715190429.GD19826@smtp.west.cox.net>
References: <1247612892-19937-1-git-send-email-GNUtoo@no-log.org>
	<20090714233712.GM15944@smtp.west.cox.net>
	<20090714234205.GN15944@smtp.west.cox.net>
	<1247652638.6648.202.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1247652638.6648.202.camel@mill.internal.reciva.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: mdev.sh: permit serial console login and permit correct	runlevel
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
X-List-Received-Date: Wed, 15 Jul 2009 19:17:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2009 at 11:10:38AM +0100, Phil Blundell wrote:
> On Tue, 2009-07-14 at 16:42 -0700, Tom Rini wrote:
> > To follow up to myself, the 'mdev' package should just go away really.
> > This particular bug is because 'mdev' has an empty mdev.conf while
> > busybox's mdev does not, and it contains console/null/etc entries.
> 
> Ah yes, right.  It looks like the immediate bug is that micro-base-image
> is setting IMAGE_DEV_MANAGER = "mdev", which is causing the bogus
> package to get dragged in.  I guess that variable should probably just
> be left empty to use busybox mdev.

No, I think it needs to be set to busybox-mdev, as busybox and udev can
coexist.

-- 
Tom Rini


