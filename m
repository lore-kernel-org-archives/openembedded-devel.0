Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LaIYr-0004VQ-RY
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 00:44:10 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFC005VH74QVD7H@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	19 Feb 2009 17:41:20 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3D44D6B83B5; Thu,
	19 Feb 2009 18:41:14 -0500 (EST)
Date: Thu, 19 Feb 2009 18:41:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090219234114.GD22652@denix.org>
References: <1235086132-21843-1-git-send-email-clarson@kergoth.com>
MIME-version: 1.0
In-reply-to: <1235086132-21843-1-git-send-email-clarson@kergoth.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Chris Larson <clarson@mvista.com>
Subject: Re: [PATCH] bitbake.conf: rework FILESPATH generation.
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
X-List-Received-Date: Thu, 19 Feb 2009 23:44:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 19, 2009 at 04:28:52PM -0700, Chris Larson wrote:
> From: Chris Larson <clarson@mvista.com>
> 
> Rework FILESPATH generation to be done in bitbake.conf, avoiding the
> confusion about it being in multiple places.  Adds FILESPATHBASE and
> FILESPATHPKG which can be manipulated rather than manipulating FILESPATH
> directly.
> 
> One usage possibility:
> 
> FILESPATHBASE =. "${TOPDIR}/files:"
> 
> Which would let me provide a custom busybox config for this build by
> copying the defconfig from the openembedded metadata into my
> build/files/busybox-1.0/ directory, for example.

Can you please provide more details on this example? Thanks.

-- 
Denys


