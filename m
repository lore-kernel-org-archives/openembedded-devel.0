Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SUOO1-0002gd-Bw
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 22:30:25 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M42005MIZ55VP50@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	15 May 2012 15:20:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B38352010D; Tue,
	15 May 2012 16:19:53 -0400 (EDT)
Date: Tue, 15 May 2012 16:19:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120515201953.GB14162@denix.org>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<3578934.ouGGrvIU0p@helios>
MIME-version: 1.0
In-reply-to: <3578934.ouGGrvIU0p@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Tue, 15 May 2012 20:30:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 15, 2012 at 05:23:43PM +0100, Paul Eggleton wrote:
> On Tuesday 15 May 2012 18:12:35 Thilo Fromm wrote:
> > I'm trying to remove an element from DISTRO_FEATURES (specifically
> > "ld-is-gold"), but I am unable to find the right spot to do it. The
> > distribution we're using (Angstrom, as it happens) sets this in
> > conf/distro/angstrom-v2012.x.conf. My machine configuration is the
> > wrong spot to modify DISTRO_FEATURES, since it will be processed
> > first. local.conf is not working, too.
> > 
> > So could anybody please tell me where I need to put my
> > 
> > DISTRO_FEATURES = "${@'${DISTRO_FEATURES}}'.replace('ld-is-gold',  '')}"
> > 
> > so it applies for the build?
> 
> Unfortunately such hacks only work for variables that are not set within the 
> distro configuration, which is applied after local.conf.

Well, while still being an ugly hack, this should still be possible using 
local overrides... I.e. VAR_local in OE or VAR_forcevariable in OE-core/Yocto. 
You may need to use immediate assignment to avoid circular dependency, though.

-- 
Denys


