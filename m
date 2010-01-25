Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NZKqP-00023A-1J
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 10:02:52 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWS00DUFM8OLB16@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	25 Jan 2010 02:00:25 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 71C9B14AF60; Mon,
	25 Jan 2010 03:00:24 -0500 (EST)
Date: Mon, 25 Jan 2010 03:00:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100125080024.GB9855@denix.org>
References: <20100125015636.GA9855@denix.org>
	<1264384785-30439-3-git-send-email-denis@denix.org>
	<19c1b8a91001242318y24f120a4s55d5fc17a5d70def@mail.gmail.com>
	<ac9c93b11001242324g4ef5a426td517f965ffde8720@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <ac9c93b11001242324g4ef5a426td517f965ffde8720@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] base.bbclass: don't pre-generate	checksums.ini entries any longer
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
X-List-Received-Date: Mon, 25 Jan 2010 09:02:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 25, 2010 at 08:24:11AM +0100, Frans Meulenbroeks wrote:
> 2010/1/25 Khem Raj <raj.khem@gmail.com>:
> > On Sun, Jan 24, 2010 at 5:59 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > OK
> >
> > Acked-by: Khem Raj <raj.khem@gmail.com>
> 
> Do we want to do this at this point? Or say in a week (or two) after
> people got acquainted  to the new format.

Understandable, hence my comment in the summary message:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/29487/focus=29560

The second patch removes the old code to generate missing checksums.ini
entries - can be applied later, once the switch to the new method is
complete and proven.

> Btw: I'm not really a script kiddie, but I guess it should not be too
> difficult to cook up a script to update the recipes so we can abandon
> checksums.ini
> (two mechanisms does not seem to be the right way).
> Any takers?

While it's possible to script, the migration path was defined as to only allow 
deletion from the central checksums.ini file, while adding new checksums in 
the corresponding recipes. Still, converting all the entries from the 
checksums.ini at once would have been a fastest approach.

-- 
Denys


