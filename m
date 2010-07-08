Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OXAbX-00057u-3l
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:14:48 +0200
Received: from gandalf.denix.org ([unknown] [71.251.56.71])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L59000MY0X5OWN0@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	08 Jul 2010 12:08:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 89AB614AF60; Thu,
	08 Jul 2010 13:07:53 -0400 (EDT)
Date: Thu, 08 Jul 2010 13:07:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100708170753.GC12383@denix.org>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
	<1278529036.4413.67.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1278529036.4413.67.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 09 Jul 2010 10:14:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 07, 2010 at 07:57:15PM +0100, Phil Blundell wrote:
> On Wed, 2010-07-07 at 20:49 +0200, Frans Meulenbroeks wrote:
> > 2010/7/7 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> > > added INCOMPATIBLE_MACHINE
> > > we have COMPATIBLE_MACHINE but that does not allow to say that
> > > a package is supported by all except a certain machine.
> > > a regexp like "(?!arch)"
> > > This mechanism can be used to exclude certain machines.
> > > Idea is that in binutils and gcc you can use this to specify that
> > > a certain version does not support a certain machine
> > 
> > actually what I wanted to say in the commit message is that a regexp
> > like (?!arch) does not work.
> > \b(?!arch) or ^(?!arch) didn't work either and consulting #python did
> 
> This might just be an accident of wording, but you do realise that
> COMPATIBLE_MACHINE is tested against ${MACHINE} (i.e. not any of the
> ${xx_ARCH} variables), right?  If you want to test arches then you want
> ${COMPATIBLE_ARCH}.
> 
> I just did a quick test with (?!foo) in C_M and it seemed to work ok for
> me.  Specifically:
> 
> MACHINE = goodmach
> COMPATIBLE_MACHINE = "(?!badmach)"
> 
> works, whereas
> 
> MACHINE = badmach
> COMPATIBLE_MACHINE = "(?!badmach)"
> 
> is rejected.  What exactly goes wrong for you?

Just to confirm that the regular expression above does work, when tested 
against the correct variable, as I've been using it for quite a while in my 
recipes, e.g.:

http://arago-project.org/git/?p=arago.git;a=blob;f=recipes/images/arago-qte-image.bb;hb=HEAD

-- 
Denys


