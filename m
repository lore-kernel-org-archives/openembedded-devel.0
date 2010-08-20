Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OmFJu-0002GR-JE
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 02:18:55 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7F00JHICUMQWL7@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	19 Aug 2010 19:18:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 43AFA14AF64; Thu,
	19 Aug 2010 20:18:22 -0400 (EDT)
Date: Thu, 19 Aug 2010 20:18:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100820001822.GE26112@denix.org>
References: <AANLkTikKsOoeyhu1NgpZ8hm9ihJrWXEwbaZS8P9i0=2-@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTikKsOoeyhu1NgpZ8hm9ihJrWXEwbaZS8P9i0=2-@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnome-utils and gnome-applets configuring without	scrollkeeper
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
X-List-Received-Date: Fri, 20 Aug 2010 00:18:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 18, 2010 at 09:57:18PM -0400, Jason Kridner wrote:
> From what I've seen, EXTRA_OECONF = "--disable-scrollkeeper" does not
> eliminate the dependency on scrollkeeper.
> 
> Taking a read of configure's command-line help:
> --disable-scrollkeeper  do not make updates to the scrollkeeper
> database
> 
> I don't think that means that there isn't a dependency on
> scrollkeeper, only that the database isn't updated.  I can tell you
> that configure won't complete until I run 'bitbake
> scrollkeeper-native'.
> 
> Has anyone really been able to build these without scrollkeeper?  Can
> anyone suggest how to proceed to create a patch?

Something like this?

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=41b3c72649443c24420704864095f2ca88348f31

-- 
Denys


