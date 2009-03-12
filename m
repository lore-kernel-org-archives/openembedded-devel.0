Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LhaPR-00046g-Uu
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 03:12:34 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGD00HPSFGLBRS2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	11 Mar 2009 21:12:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1AD5A6B83B5; Wed,
	11 Mar 2009 22:12:21 -0400 (EDT)
Date: Wed, 11 Mar 2009 22:12:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090312021221.GA12341@denix.org>
References: <1236790606.14496.4.camel@northpole>
	<19c1b8a90903111534g39f25ba4ocd1f3a5099acf48b@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <19c1b8a90903111534g39f25ba4ocd1f3a5099acf48b@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: tinylogin not found
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
X-List-Received-Date: Thu, 12 Mar 2009 02:12:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 11, 2009 at 03:34:03PM -0700, Khem Raj wrote:
> On Wed, Mar 11, 2009 at 9:56 AM, Jader <jader@2mi.com.br> wrote:
> > Hello.
> > I'm trying to compile minimal-image but I've got a tinylogin error.
> > It seems tinylogin is deprecated, http://tinylogin.busybox.net/
> > redirects to http://bugs.busybox.net/
> >
> > How can I disable it from build?
> 
> What distro are you compiling for ?
> try bitbake -g and inspect the dependencies and find out why is it
> being pulled in
> it only shows up explicitly in task-mamona.bb

Khem,

It's being pulled in because of the image.bbclass setting IMAGE_LOGIN_MANAGER 
to tinylogin by default.

> Furthermore tinylogin should be moved to obsoleted packages IMO

I'm not sure if tinylogin is deprecated or it's just a misconfiguration of 
their server - udhcp.busybox.net also points to bugs.busybox.net...
And both of the projects are still in the source control, even though they 
haven't been touched for years. Most of the functionality been rolled into 
BusyBox itself...

Has anybody seen any announcements?

-- 
Denys


