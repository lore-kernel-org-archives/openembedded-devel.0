Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QZYxy-0001YU-SA
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 03:44:23 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LN700ELWW2JZJ01@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	22 Jun 2011 19:30:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9404114AF5E; Wed,
	22 Jun 2011 20:30:19 -0400 (EDT)
Date: Wed, 22 Jun 2011 20:30:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110623003019.GI1324@denix.org>
References: <1308769321-26192-1-git-send-email-j-lance1@ti.com>
	<20110622211111.GH1324@denix.org>
	<131E5DFBE7373E4C8D813795A6AA7F08034B41731B@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F08034B41731B@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 1/1] matrix-tui: Update to arago toolchain
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
X-List-Received-Date: Thu, 23 Jun 2011 01:44:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 22, 2011 at 05:17:48PM -0500, Maupin, Chase wrote:
> > > @@ -28,7 +21,7 @@ S = "${WORKDIR}/trunk"
> > >  #INITSCRIPT_PARAMS = "defaults 99"
> > >
> > >  do_configure() {
> > > -	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-none-linux-
> > gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:'
> > makefile.init
> > > +	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-arago-linux-
> > gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-arago-linux-gnueabi:'
> > makefile.init
> > 
> > I don't think this is needed. The whole point of that sed magic I put
> > in
> > there, is to make assignments of TUI_INCLUDE_PATH, XML_INCLUDE_PATH and
> > TUI_LIB_PATH conditionally, so they can be overwritten below in the
> > do_compile() task...
> 
> The makefile defaults have been changed to use arm-arago-linux-gnueabi 
> instead of the arm-none-linux-gnueabi.  If you want these values to still be 
> optionally assigned then you would still need these changes right?
> 
> Now perhaps a better way to do this is change the makefile.init to use the 
> ?= optional assignment so that you don't need to do this sed magic.  Would 
> that also work?

That would be great, thanks!


> > >  	sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk

Maybe you can add this one in the default Makefile too? :) Less hacking in the 
recipe.

-- 
Denys


