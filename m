Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Oj1iI-0005na-57
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 05:10:47 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6Y0060FWSWMED2@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	10 Aug 2010 22:10:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3F77F14AF64; Tue,
	10 Aug 2010 23:10:08 -0400 (EDT)
Date: Tue, 10 Aug 2010 23:10:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100811031008.GH7189@denix.org>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
	<i3se2n$gj7$1@dough.gmane.org>
	<AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
	<AANLkTinkuGZVYFHL7N6GwM5BftTr-+L4BP7-jwsRZzqL@mail.gmail.com>
	<20100811014245.GF7189@denix.org>
	<AANLkTik64PqPOV4cjfzy4sOzgmr5Q4HDWsnBf=pZcdsQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTik64PqPOV4cjfzy4sOzgmr5Q4HDWsnBf=pZcdsQ@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules	local.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 03:10:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 11, 2010 at 12:13:08PM +0930, Graham Gower wrote:

> Ok, I'm not so passionate about this change... But I'd like to
> highlight why this is not particularly intuitive.
> My experience has been that only certain image targets will build
> without overrides in a local.conf.
> 
> But then i determined that udev 151 didn't like my old kernel, so I
> set  PREFERRED_VERSION_udev = "141". Only this doesn't work because
> the (angstrom) distro pins it and the 151 version is silently picked
> up. I now understand why, but I didn't at the time.

Yeah, udev > 141 doesn't like glibc < 2.9 either.

> So PREFERRED_VERSION_foo="123" might work, or it might not. And the
> same goes for PREFERRED_PROVIDER_foo, which is actually less
> consistent because some use a weak assignment in the conf files and
> others don't.
> 
> Oh, and where is the ?= operator documented? I would have expected to
> find it here: http://bitbake.berlios.de/manual/ch02.html

The only place I was able to find it explained is in OpenEmbedded manual under 
"Conditional assignment" of "Syntax of recipes" chapter:

http://docs.openembedded.org/usermanual/html/recipes_syntax.html

-- 
Denys


