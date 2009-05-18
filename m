Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M65xI-0005zf-Vw
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 18:44:53 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJU00AVLJWXEJ30@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	18 May 2009 10:48:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A61E214AF5F; Mon,
	18 May 2009 11:48:33 -0400 (EDT)
Date: Mon, 18 May 2009 11:48:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090518154833.GC19357@denix.org>
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
	<20090513212546.GF32320@denix.org>
MIME-version: 1.0
In-reply-to: <20090513212546.GF32320@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown	implementation and use it by default.
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
X-List-Received-Date: Mon, 18 May 2009 16:44:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 13, 2009 at 05:25:46PM -0400, Denys Dmytriyenko wrote:
> On Wed, May 13, 2009 at 01:53:18PM -0700, Chris Larson wrote:
> > For each recipe which completes a task successfully, this emits the current
> > version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
> > ${TMPDIR}/versions.conf and conf/versions.conf are automatically included,
> > in that order, in subsequent builds, to provide more deterinistic builds by
> > default, and to let the user make the lockdown persist via a simple cp
> > command.
> > 
> > Assuming that the latest ncurses in the recipes is 5.7, and that 5.7 is
> > preferred over 5.3 by default given any distro version preferences, if they
> > exist, the following are examples of its behavior:
> > 
> > $ rm -rf tmp
> > $ bitbake ncurses-5.3
> > $ bitbake -c clean ncurses
> > $ bitbake ncurses # builds ncurses 5.3
> > 
> > $ cp tmp/versions.conf conf/
> > $ rm -rf tmp
> > $ bitbake ncurses # builds ncurses 5.3
> 
> Very nice! Let me try it here...
> 
> > Signed-off-by: Chris Larson <clarson@mvista.com>

Chris,

Will you be sending an updated version of the patch, which handles TMPDIR 
overwritten in local.conf, as we discussed last week? Thanks.

-- 
Denys


