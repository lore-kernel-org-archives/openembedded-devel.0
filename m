Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O2yCT-0007PQ-Hx
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 04:56:06 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1000D282MP4TG6@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	16 Apr 2010 21:52:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8EF3D14AF60; Fri,
	16 Apr 2010 22:52:01 -0400 (EDT)
Date: Fri, 16 Apr 2010 22:52:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100417025201.GA20701@denix.org>
References: <1271471763-28331-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1271471763-28331-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] kill xorg-headers-native
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
X-List-Received-Date: Sat, 17 Apr 2010 02:56:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 16, 2010 at 10:36:03PM -0400, Denys Dmytriyenko wrote:
> Update the combined headers from the following packages:
> * xproto-7.0.16
> * libx11-1.3.3
> * libxau-1.0.5
> * libxdmcp-1.0.3
> * libxt-1.0.8

And now my RFC - should we just kill xorg-headers-native completely and 
replace it with something like:

DEPENDS = "xproto-native libx11-native libxau-native libxdmcp-native libxt-native"

-- 
Denys

> For example, GenericEvent is new since xproto-7.0.13 and prevents
> libx11-native from building on an X-less host.
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>


