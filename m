Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MqAGi-0000dc-Q0
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 20:39:19 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQD00FTCYFU2WC9@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	22 Sep 2009 13:38:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EB9B214AF5F; Tue,
	22 Sep 2009 14:38:17 -0400 (EDT)
Date: Tue, 22 Sep 2009 14:38:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090922183817.GC18271@denix.org>
References: <4AB8CF91.1070907@dresearch.de>
	<f96d234e0909221128v65e7f834wc1687fe5fdf5136b@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <f96d234e0909221128v65e7f834wc1687fe5fdf5136b@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake freeze :(
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
X-List-Received-Date: Tue, 22 Sep 2009 18:39:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 22, 2009 at 02:28:22PM -0400, Cliff Brake wrote:
> On Tue, Sep 22, 2009 at 9:22 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> > Since a few days i see this crazy behavior. Sometimes bitbake freezes (everytime at the same stages if it freezes) when building a target (e.g. with "bitbake drapptempl"). top tells me that a "make all" process is running and consuming all resources of one cpu.
> 
> I had an issue recently where opkg was prompting the user to overwrite
> a file in the rootfs phase.  I would ctrl-C bitbake when it appeared
> to be hung, but soon learned there were additional bitbake processes
> still running.  When I ran killall bitbake, the error message showed
> up.  You might find something by running bitbake with -DDDD.

Now, that you mentioned it, I have also seen it before! There was a file clash 
between 2 recipes providing the same file, so opkg was waiting for the user 
input asking to overwrite the file during the rootfs step. But opkg I/O is 
being redirected, so it appears that bitbake is hung. I found out about the 
problem from the rootfs log file in the tmp/work directory, where the 
output is being redirected to... :)

-- 
Denys


