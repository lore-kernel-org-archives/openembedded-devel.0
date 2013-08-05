Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF5261223
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2013 13:43:39 +0000 (UTC)
Received: from [69.196.158.250] (port=48774 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1V6L4T-0001Ip-68 for openembedded-devel@lists.openembedded.org;
	Mon, 05 Aug 2013 09:43:37 -0400
Date: Mon, 5 Aug 2013 09:43:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1308050937380.6693@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: proper way to express dependencies from meta-oe to meta-gnome?
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
X-List-Received-Date: Mon, 05 Aug 2013 13:43:39 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  for the entertainment value, while building for the beaglebone
black, i did:

  $ bitbake -c fetchall world

and got:

ERROR: Nothing RPROVIDES 'gvfs' (but
/home/rpjday/oe/dist/layers/meta-openembedded/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'gvfs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gvfs']
ERROR: Required build target 'tracker' has no buildable providers.
Missing or unbuildable dependency chain was: ['tracker', 'gvfs']

and it's easy enough to see that, yes, tracker RDEPENDS on gvfs, which
is defined in meta-gnome which is a layer i'm not including.

  so what is the preferred way to resolve stuff like that? is one
simply supposed to *know* (or check) that tracker requires gvfs? or
read the diagnostics and adjust accordingly?

  given that tracker's home page is at gnome.org, would it make more
sense for tracker to be part of meta-gnome instead of meta-oe? just
trying to understand how recipes are distributed among the layers.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

