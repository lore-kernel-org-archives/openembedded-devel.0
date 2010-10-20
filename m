Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8PRT-0002Tr-FF
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 05:34:22 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAK00E56KJRIB07@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	19 Oct 2010 22:33:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 04D8814AF64; Tue,
	19 Oct 2010 23:33:26 -0400 (EDT)
Date: Tue, 19 Oct 2010 23:33:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020033326.GC6202@denix.org>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
	<1273859746.22943.454.camel@trini-m4400>
	<AANLkTimDt7fVT14jNofov1ESwO2M_CvBAe6RsdvzZicE@mail.gmail.com>
	<1273881865.8005.205.camel@trini-m4400> <1274035921.24454.68.camel@rex>
	<AANLkTimze8vRUUloa6gaRBU6jvp8zrcSAKDvqCu3ppaY@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTimze8vRUUloa6gaRBU6jvp8zrcSAKDvqCu3ppaY@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep	?)
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
X-List-Received-Date: Wed, 20 Oct 2010 03:34:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 20, 2010 at 12:57:23AM +0200, Andrea Adami wrote:
> Same issue happens during rebuild from packaged staging
> 
> 
> Cannot load module
> /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la:
> /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/.libs/im-xim.so:
> undefined symbol: g_realloc_n
> | /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la
> does not export GTK+ IM module API:
> /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/.libs/im-xim.so:
> undefined symbol: g_realloc_n

If anybody cares, this issue is still present with the latest glib/gtk+ on 
Angstrom with 4+ threads...

-- 
Denys

> 
> ...
> 
> NOTE: package gtk+-native-2.20.0-r8.0: task do_compile: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> virtual:native:/oe/openembedded/recipes/gtk+/gtk+_2.20.0.bb do_compile
> failed
> ...
> 
> Andrea


