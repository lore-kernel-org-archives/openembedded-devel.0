Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1ODzRo-0004r4-GL
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 14:29:29 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 6934B140DB; Mon, 17 May 2010 14:25:29 +0200 (CEST)
Date: Mon, 17 May 2010 14:25:29 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517122529.GA30953@zlo.nu>
References: <alpine.DEB.2.00.1005121257070.3272@lynx>
	<hsgbec$a9i$3@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hsgbec$a9i$3@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: on ubuntu 10.04, how to reset /bin/sh to refer to bash?
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
X-List-Received-Date: Mon, 17 May 2010 12:29:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2010 at 09:58:04AM +0200, Koen Kooi wrote:
> On 12-05-10 18:58, Robert P. J. Day wrote:
> >   my first time setting up to build OE on ubuntu 10.04, and trying to
> > "bitbake fetch" complains that it's a bad idea for /bin/sh to refer to
> > dash.  fair enough, so since /bin/sh -> dash, do i just reset the
> > symlink manually?  or is there something more elegant?  thanks.
> 
> And for the record: It's not OE (anymore) that requires bash, it's the
> software we build. E.g. GTK+'s libtool has bashisms. And there are a lot
> more.

Exactly. So depending on what you want to build, you can get away with
dash as /bin/sh fine. We've been using the patch in
http://patchwork.openembedded.org/patch/914/ successfully for some time
now, but we do not need any GTK+ stuff on our images.

Marc


