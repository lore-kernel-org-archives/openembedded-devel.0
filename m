Return-Path: <denis@denix.org>
X-Greylist: delayed 3604 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Sep 2014 22:34:08 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id D207A6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 22:34:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NC0005DLJW7CP40@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Sep 2014 16:33:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C50DC2069A; Tue,
	16 Sep 2014 17:33:43 -0400 (EDT)
Date: Tue, 16 Sep 2014 17:33:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140916213343.GW2480@denix.org>
References: <CAMKF1srKjh-imfCPMTW9EiZNRFVydO71LSMPzhnAFuoUWtocZg@mail.gmail.com>
	<5417FED2.1030106@pseudoterminal.org>
MIME-version: 1.0
In-reply-to: <5417FED2.1030106@pseudoterminal.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: mpg123 recipe LICENSE_FLAGS = "commercial" issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Sep 2014 22:34:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 16, 2014 at 11:11:46AM +0200, Carlos Rafael Giani wrote:
> On 2014-09-16 07:43, Khem Raj wrote:
> >Hi Carlos/All
> >
> >I want to understand why LICENSE_FLAGS = "commercial" was added to
> >
> >meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> >
> >in initial commit and has been carried over upgrades ever since
> >
> >The license seems to be LGPL 2.0 and is explained in greater detail here
> >
> >http://mpg123.org/cgi-bin/scm/mpg123/trunk/doc/ROAD_TO_LGPL?revision=2607
> >
> >So what portions of it are having different terms for commercial distribution ?
> >
> >Thanks
> >
> >-Khem
> 
> It's because MPEG audio is subject to royalties. This is also the
> reason why gst-plugins-ugly and gstreamer1.0-plugins-ugly have this
> flag.

But does gst-plugins-ugly provide own codecs? It's mostly a collection of 
external plugins, so it shouldn't itself be marked as "commercial":

http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/51055

-- 
Denys

