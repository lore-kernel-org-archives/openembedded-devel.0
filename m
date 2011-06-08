Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QUL6t-0000G3-Cn
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 17:55:59 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMH004AVAQZGM56@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Jun 2011 10:52:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 232C414AF5D; Wed,
	08 Jun 2011 11:52:11 -0400 (EDT)
Date: Wed, 08 Jun 2011 11:52:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110608155211.GA29476@denix.org>
References: <1307535707.2529.4783.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
MIME-version: 1.0
In-reply-to: <0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Amend recipes which do not contain a (new) target machine	in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 15:55:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 08, 2011 at 05:46:19PM +0200, Hauser, Wolfgang (external) wrote:
> >I guess you might not be able to append to COMPATIBLE_MACHINE from
> >amend.inc since amend.bbclass probably doesn't get run early enough.
> >But you should be able to use COMPATIBLE_MACHINE_append_pn-... in your
> >layer.conf, or COMPATIBLE_MACHINE += in a .bbappend file.  Are those
> not
> >working for you?
> 
> The .bbappend files don't work with bitbake version 1.10.2 which is
> required by OE release 2011.03.
> 
> I want to use linux-omap-psp_2.6.32.bb as kernel recipe, how is the
> exact format for COMPATIBLE_MACHINE_append_pn-... ?
> 
> I tried COMPATIBLE_MACHINE_append_linux-omap-psp = "mymachine" and
> COMPATIBLE_MACHINE_append_pn-linux-omap-psp = "mymachine", both don't
> work for me.

COMPATIBLE_MACHINE is a regular expression, so you need to make sure the 
syntax is not broken when you append to it. In the case of linux-omap-psp, you 
can try adding "|mymachine"...

-- 
Denys


