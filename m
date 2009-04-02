Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LpT4G-0008Q0-I5
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 21:59:19 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHH00E6WOPLEIAQ@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	02 Apr 2009 14:56:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C71156B83B5; Thu,
	02 Apr 2009 15:56:08 -0400 (EDT)
Date: Thu, 02 Apr 2009 15:56:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090402195608.GB12552@denix.org>
References: <12386320381719-git-send-email-clarson@mvista.com>
	<49D48E6C.7070304@xora.org.uk>
MIME-version: 1.0
In-reply-to: <49D48E6C.7070304@xora.org.uk>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] bitbake.conf, collections.inc: Add	COLLECTIONS mechanism w/ a sane default.
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
X-List-Received-Date: Thu, 02 Apr 2009 19:59:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 02, 2009 at 11:07:40AM +0100, Graeme Gregory wrote:
> Chris Larson wrote:
> > Added code which takes a list of directories in COLLECTIONS, in priority
> > order (highest to lowest), and uses those to populate BBFILES,
> > BBFILE_COLLECTIONS, BBFILE_PATTERN_*, and BBFILE_PRIORITY_*.
> >
> > The default COLLECTIONS is based on BBPATH, so you can now specify a sane
> > BBPATH, not bother setting up the collections variables or BBFILES, and
> > still likely be able to do a build.
> >
> >   
> I haven't had time to test the patch, but I really like the idea of
> this. Also the archives part as well. This will make setup so much
> easier for people wanting to overlay. And improve the ability for OE to
> be shipped in setup scripts.

+1 - support the idea!

I'll try to test the patches on my overlay...

-- 
Denys


