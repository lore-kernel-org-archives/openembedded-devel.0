Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8gPS-0008WH-7r
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 23:41:25 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAL00L2JYVBN041@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 16:40:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B95EB14AF64; Wed,
	20 Oct 2010 17:40:22 -0400 (EDT)
Date: Wed, 20 Oct 2010 17:40:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020214022.GW11514@denix.org>
References: <20101020203828.GU11514@denix.org>
	<AANLkTinqUsT2vubiPH-vM4oxSaDhcqvA=khN2q-tXHkA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTinqUsT2vubiPH-vM4oxSaDhcqvA=khN2q-tXHkA@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: LICENSE field format
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
X-List-Received-Date: Wed, 20 Oct 2010 21:41:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 20, 2010 at 11:17:29PM +0200, Frans Meulenbroeks wrote:
> 2010/10/20 Denys Dmytriyenko <denis@denix.org>:
> > All,
> >
> > We've had a number of discussions on the license matter recently. Trying to
> > unify those brings us to the question of the LICENSE field format in recipes.
> > As some projects are dual/triple licensed or use multiple licenses at the same
> > time, it becomes hard to specify it all in the LICENSE field, especially when
> > there are no rules defined. We do have several different formats used to
> > separate multiple licenses, which is quite confusing and doesn't make it clear
> > whether licenses are AND-ed or OR-ed (I know those are not legal terms, but
> > for the purpose of this discussion that's fine :)) Here are some examples:
> >
> > LICENSE = "License1 License2"
> > LICENSE = "License1|License2"
> > LICENSE = "License1, License2"
> > LICENSE = "License1+License2"
> > LICENSE = "License1/License2"
> >
> > LICENSE = "Very Long License Name"
> > LICENSE = "License with some exceptions"
> >
> > To make matters worse, src_distribute.bbclass splits the field at spaces and
> > creates directories for each token. So, for the last two examples above, we
> > end up with 4 directories for every license - each word is a separate
> > directory...
> >
> > I'd like to raise this issue and start a discussion on unifying the LICENSE
> > field format (and fixing src_distribute.bbclass accordingly). Would be nice to
> > collect some ideas here on the maillist and/or discuss it further during OEDEM
> > next week. Please feel free to comment.
> >
> > --
> > Denys
> 
> What do others do?
> I know debian has a license file. (and actually that could probably be
> a good source of info to set our LICENSE field)

Debian uses "or" plus "and" keywords:

License: GPL-2+ or Artistic-2.0
License: GPL-2+ and BSD

Also, comma is used to change the priority of "or/and":

License: GPL-2+ or Artistic-2.0, and BSD

Licenses with spaces are allowed:

License: GPL-2+ with OpenSSL exception

And, BTW, "GPL version 2 or later" is specified as "GPL-2+". The format is 
detailed here:

http://dep.debian.net/deps/dep5/

I guess, we can try to adopt the "and/or" syntax...

-- 
Denys


