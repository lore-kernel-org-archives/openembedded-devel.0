Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LZHo7-0001Tu-HZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Feb 2009 05:43:43 +0100
Received: from gandalf.denix.org ([71.251.57.220]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KF700JLO10NGNJC@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	16 Feb 2009 22:41:17 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EB0336B83B5; Mon,
	16 Feb 2009 23:41:10 -0500 (EST)
Date: Mon, 16 Feb 2009 23:41:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090217044110.GB3240@denix.org>
References: <20090217022412.GA3240@denix.org>
MIME-version: 1.0
In-reply-to: <20090217022412.GA3240@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Enterprise kills BBMASK
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
X-List-Received-Date: Tue, 17 Feb 2009 04:43:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 16, 2009 at 09:24:12PM -0500, Denys Dmytriyenko wrote:
> Sorry for the "sensational" subject... :)
> 
> Basically, some time back I noticed that BBMASK stopped working. I didn't have 
> time to look into it, until today. One of Mickey's commits broke the tree, 
> because bunch of recipes require a missing .inc file, leading to Bitbake 
> parsing failure.

Oh, and by the way, after some discussion on irc I ended up adding an "empty" 
fso-image.inc file just to let Bitbake parse through the tree:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=faa823642b911ac367af38cc5625360987b61a98

Mickey, please replace it with the actual file once you get back... :)

-- 
Denys


