Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SI2NO-0001l5-8q
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 20:34:42 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2B003OPSCSY2W0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	11 Apr 2012 12:24:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 718BB200AB; Wed,
	11 Apr 2012 13:24:27 -0400 (EDT)
Date: Wed, 11 Apr 2012 13:24:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120411172427.GB23477@denix.org>
References: <4F80ACD6.8080901@gmail.com> <20120410064131.GA3583@jama.jama.net>
	<CAMKF1sotvfR6o0rU7dkVxwFVPcApWorM8bLsov+Gk8-OPKRU5Q@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sotvfR6o0rU7dkVxwFVPcApWorM8bLsov+Gk8-OPKRU5Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: meta-linaro and toolchain-layer
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
X-List-Received-Date: Wed, 11 Apr 2012 18:34:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 10, 2012 at 03:48:26PM -0700, Khem Raj wrote:
> On Mon, Apr 9, 2012 at 11:41 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > I haven't tried gcc-4.7 on my armv4t machines yet, because I fear
> > similar issues like with binutils gold (which are still not resolved),
> > because nobody uses armv4t much nowadays :/.
> 
> yes I have tried qemuarm/armv4t build along with qemuarm/armv5t build
> as a test on 4.7
> it boots systemd-image fine. But I would expect others to chime in and
> provide some
> testing help on their platforms/machines, I am still actively fixing
> and rebasing
> the 4.7 patches so expect a bit of churn there
> 
> >
> > The same I fear from 4.6 from meta-linaro, but maybe they will be
> > responsive as you were, when I reported issues on armv4t with some new
> > patch added by linaro..
> 
> I will make sure that happens and I will be maintaining the layer at
> above location

Why? Do we need another fork? Can you upstream your fixes?


> and see how the interaction goes and will help in maintaining the layer
> > So using meta-linaro for gcc-4.6 and gcc-4.7 is fine, but please keep
> > current "snapshot" of gcc-4.6 (oe-core+toolchain-layer patches)
> > somewhere as safe version before meta-linaro 4.6 is well tested on all
> > devices.
> 
> yes essentially we can recover is any time and in worst case I have to maintain
> meta-linaro in which case we can merge both into one and maintain it
> but I will actively
> seek linaro's help in maintaining the layer.

-- 
Denys


