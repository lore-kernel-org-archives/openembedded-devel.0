Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8hx2-0005OP-JY
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 01:20:09 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAM006IW3GAVDP1@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 18:19:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 28C0E14AF64; Wed,
	20 Oct 2010 19:19:22 -0400 (EDT)
Date: Wed, 20 Oct 2010 19:19:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020231922.GX11514@denix.org>
References: <AANLkTi=B3qc0KgH_oz0_iLHN0ztbP6g7XD5fP-Jxg--j@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTi=B3qc0KgH_oz0_iLHN0ztbP6g7XD5fP-Jxg--j@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'require' across different collections
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
X-List-Received-Date: Wed, 20 Oct 2010 23:20:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 20, 2010 at 04:12:13PM -0700, Ash Charles wrote:
> Hello,
> 
> Is it possible to use the 'require' or 'include' keywords across
> different collections without specifying an absolute path?
> Specifically, I have an image recipe which adds a few additional
> packages to console-image.bb; it lives in a separate collection i.e.
> it is not recipes/images/.  I currently get parse errors if I try to
> 'require console-image.bb' yet I had thought there was a way of doing
> this and I can't track it down in the mailing list archives.

require recipes/images/console-image.bb

-- 
Denys


