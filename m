Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NXIIH-0003lG-Bx
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 18:55:12 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWI00AXD9NB1UD3@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	19 Jan 2010 11:52:29 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 501EC14AF60; Tue,
	19 Jan 2010 12:52:23 -0500 (EST)
Date: Tue, 19 Jan 2010 12:52:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100119175223.GB5266@denix.org>
References: <alpine.LFD.2.00.1001190305430.13206@localhost>
	<alpine.LFD.2.00.1001190647010.20935@localhost>
MIME-version: 1.0
In-reply-to: <alpine.LFD.2.00.1001190647010.20935@localhost>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: tinderbox, bug reports and a freshly-broken mplayer
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
X-List-Received-Date: Tue, 19 Jan 2010 17:55:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 19, 2010 at 06:53:19AM -0500, Robert P. J. Day wrote:
> On Tue, 19 Jan 2010, John Willis wrote:
> 
> > As for TinderBox, I did include some links in an earlier mail
> >
> > "I think Phil (or someone else) suggest you consider contributing your build
> > logs to OESTATS/TinderBox
> > (http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_and_
> > failure_reports) at least with that setup you leave a reference the failing
> > logs in bug reports/mails so people can have a look into all the gory
> > details :)."
> >
> > It only takes a few minor changes to your local.conf and all your build logs
> > and build status are automatically uploaded to the server. This makes
> > diagnosing build issues/collective debugging etc. that little bit easier as
> > anyone can go to http://tinderbox.openembedded.org/builders/<your_nick> and
> > see what your builds and failures and dig into the logs. If you worried
> > about personal info. being uploaded then check into oestats-client.bbclass
> > to see what is happening under the hood.
> >
> > To prove a point this is a link to the failed mplayer build I did yesterday
> > (http://tinderbox.openembedded.org/packages/431300/).
> 
>   thanks, i'll dig into this after today.  for now, i'll just drop the
> SRCREV on mplayer to get a working build and watch the logs.

The above explanation and the linked instructions are very detailed and 
helpful. If you use Angstrom though, oestats/tinderbox is already enabled, so 
you just need to set some vars to use it. Add the following lines to your 
local.conf file:

INHERIT += "oestats-client"
OESTATS_SERVER = "tinderbox.openembedded.org"
OESTATS_BUILDER = "<your_nick>"

-- 
Denys


