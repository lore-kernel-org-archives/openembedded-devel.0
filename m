Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5A36360CEB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 11:28:47 +0000 (UTC)
Received: from [99.240.204.5] (port=53634 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X5vTz-0001Ka-55 for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jul 2014 07:28:47 -0400
Date: Sat, 12 Jul 2014 07:28:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407120725360.20531@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: is it "PROVIDES =" or "PROVIDES +=" for setting an alternate name?
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
X-List-Received-Date: Sat, 12 Jul 2014 11:28:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i notice that the OE-core codebase likes to mix these two forms of
using PROVIDES. for instance, for a number of libraries to provide
their basename, i see stuff like:

recipes-graphics/xorg-lib/libxmu_1.1.2.bb:PROVIDES = "xmu"
recipes-graphics/xorg-lib/libice_1.0.8.bb:PROVIDES = "ice"
recipes-graphics/xorg-lib/libxdamage_1.1.4.bb:PROVIDES = "xdamage"
recipes-graphics/xorg-lib/libxfont_1.4.7.bb:PROVIDES = "xfont"
recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb:PROVIDES = "xdmcp"

  on the other hand, there is the occasional example of the same thing
that uses "PROVIDES +=" instead:

recipes-support/libpcre/libpcre_8.35.bb:PROVIDES += "pcre"

is there a deliberate distinction made in the recipes between these
two forms?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

