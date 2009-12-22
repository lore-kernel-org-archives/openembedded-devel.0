Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NNBkI-0001q2-Ti
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 21:54:22 +0100
Received: from gandalf.denix.org ([71.255.235.232]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KV200MUUKIMTNJ2@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	22 Dec 2009 13:52:03 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 70BBE14AF60; Tue,
	22 Dec 2009 14:51:57 -0500 (EST)
Date: Tue, 22 Dec 2009 14:51:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091222195157.GB2271@denix.org>
References: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>
	<4B30E03B.1040500@mwester.net>
MIME-version: 1.0
In-reply-to: <4B30E03B.1040500@mwester.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why rootfs directory in temp is empty
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
X-List-Received-Date: Tue, 22 Dec 2009 20:54:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Dec 22, 2009 at 09:05:31AM -0600, Mike Westerhof wrote:
> Guo Hongruan wrote:
> > Hi guys,
> >   Today, I build an base-image using OE. And I want to check the content
> > of rootfs, but I found the directory rootfs in building directory is
> > empty. I remember there was the ontent of the target root filesystem.
> > Why have to remove them? Does it means the rootfs directory is unuseful?
> > 
> > Thanks a lot!
> > 
> 
> Add IMAGE_KEEPROOTFS = "1" to your local.conf file.
> I'm not sure why the change was made to clean it out every build, though.

To prevent people from using it as an NFS share and having problems.

-- 
Denys


