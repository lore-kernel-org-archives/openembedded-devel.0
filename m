Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MQrqI-0000oi-W2
	for openembedded-devel@openembedded.org; Wed, 15 Jul 2009 01:55:27 +0200
Received: (qmail 12912 invoked from network); 14 Jul 2009 23:42:06 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 14 Jul 2009 16:42:06 -0700
Date: Tue, 14 Jul 2009 16:42:05 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090714234205.GN15944@smtp.west.cox.net>
References: <1247612892-19937-1-git-send-email-GNUtoo@no-log.org>
	<20090714233712.GM15944@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090714233712.GM15944@smtp.west.cox.net>
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
X-List-Received-Date: Tue, 14 Jul 2009 23:55:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2009 at 04:37:12PM -0700, Tom Rini wrote:
> On Wed, Jul 15, 2009 at 01:08:11AM +0200, Denis 'Gnutoo' Carikli wrote:
> 
> > Hi, This patch is permit the login via serial console,and to go to the correct runlevel(2345),
> > without this patch init is blocked at the last script of runlevelS and we can never login via serial console
> > (the patch created /dev/null and /dev/console)
> > I send it for review because it touch a core part and that I'm not shure how the others distro handle that.
> > Here I used:
> > *wrt54.conf
> > *micro-base-image
> > *micro-uclibc
> 
> Does mdev not create certain classes of devices then?  IOW, why isn't
> mdev -s creating these nodes?

To follow up to myself, the 'mdev' package should just go away really.
This particular bug is because 'mdev' has an empty mdev.conf while
busybox's mdev does not, and it contains console/null/etc entries.

-- 
Tom Rini


