Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvGQ-0002Y4-5M
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 03:57:34 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO00MQ14WYA891@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 20:46:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5C98714AF5F; Mon,
	22 Jun 2009 21:46:10 -0400 (EDT)
Date: Mon, 22 Jun 2009 21:46:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623014610.GA14716@denix.org>
References: <1245698893.7001.18.camel@utx.utx.cz>
	<1245699460.3521.17.camel@kc.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1245699460.3521.17.camel@kc.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Is RDEPENDS = "foo" supported?
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
X-List-Received-Date: Tue, 23 Jun 2009 01:57:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 22, 2009 at 08:37:40PM +0100, Phil Blundell wrote:
> On Mon, 2009-06-22 at 21:28 +0200, Stanislav Brabec wrote:
> > Is RDEPENDS = "foo" allowed in recipes? If yes, then it does not work.
> 
> It is allowed, and in at least some situations it will even work, but in
> the vast majority of cases it is not the right thing to do.  There are
> two problems with it: both of them have been discussed here on the list
> quite recently, but to recap:

Here is the original thread, for reference:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/24663

> 1) ${RDEPENDS} will apply to all the output subpackages, i.e. ${PN}-dev,
> ${PN}-doc and various ${PN}-locale-* things.  In most cases, ${PN} is
> the only one that you actually want to receive the dependency.
> 
> 2) ${RDEPENDS} will be overridden by ${RDEPENDS_${PN}} if the latter is
> set.  This is sometimes done by .bbclass files and the like, in which
> case any dependencies you set in ${RDEPENDS} will be ineffective.
> 
> > I have been searching for a reason, why my image does not set keymap.
> > Reason: console-tools were missing. Replacing RDEPENDS by RDEPENDS_${PN}
> > in the keymaps recipe fixed it.
> 
> In this particular case, update-rc.d.bbclass sets RDEPENDS_${PN} and
> hence (2) above will apply.
> 
> > Does it mean, that this and another 622 recipes use invalid syntax of
> > RDEPENDS or is it a bug in the toolchain?
> 
> It's probably true that almost all of those 623 recipes should be using
> RDEPENDS_${PN} or something similar instead of plain RDEPENDS.

Yeah, I had to fix some of my recipes in the overlay here...

-- 
Denys


