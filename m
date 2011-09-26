Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1R8IKq-0006wb-TC
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 23:03:33 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LS5005L9BG002F0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	26 Sep 2011 14:57:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 562EB14AF5F; Mon,
	26 Sep 2011 15:57:36 -0400 (EDT)
Date: Mon, 26 Sep 2011 15:57:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110926195736.GB24402@denix.org>
References: <BAY168-W73BC4907A15BF1630143379D0F0@phx.gbl>
	<BAY168-W1105B78F9D2BC795FE21E909DF30@phx.gbl>
MIME-version: 1.0
In-reply-to: <BAY168-W1105B78F9D2BC795FE21E909DF30@phx.gbl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: do_patch failure ltp_20101031.bb as file not uncompressed	propely
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
X-List-Received-Date: Mon, 26 Sep 2011 21:03:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 27, 2011 at 12:39:23AM +0500, ali anwar wrote:
> 
> > From: ali_3k1@hotmail.com
> > To: openembedded-devel@lists.openembedded.org
> > Date: Fri, 23 Sep 2011 18:36:55 +0500
> > Subject: Re: [oe] do_patch failure ltp_20101031.bb as file not uncompressed propely
> > 
> > 
> > To elaborate manually "tar -xf" untar as well as uncompressd the 
> > tp-full-20101031.bz2 file. Where as OE only uncompressed it and did NOT 
> > untar so I recieved following:
> > ERROR: Error executing a python function in 
> > /home/qatools/ali/trunk/meta-oe/meta-oe/recipes-benchmark/ltp/ltp_20101031.bb:OSError: 
> > [Errno 20] Not a directory: '/home/qatools/ali/trunk/build_release_ltp/work/ppce500mc-linux/ltp-20101031-r0/ltp-full-20101031'

Ali,

Please contact upstream and request they fix their filename - the way they 
named it clearly indicates it's bz2 compressed, but not a tar archive. It 
should be either .tar.bz2 or at least .tbz2 extension and not just .bz2

-- 
Denys


> > 
> > > From: ali_3k1@hotmail.com
> > > To: openembedded-devel@lists.openembedded.org
> > > Date: Fri, 23 Sep 2011 16:34:51 +0500
> > > Subject: [oe] do_patch failure ltp_20101031.bb as file not uncompressed	propely
> > > 
> > > 
> > > Hi All,
> > > This is my first e-mail to OE mailing list. There is an issue which I am facing with ltp recipe in open embedded which I like to discuss.
> > > Currently ltp_20101031.bb for source points to http://downloads.sourceforge.net/ltp/ltp-full-20101031.bz2. But problem is that do_unpack extracts ltp-full-20101031.bz2 to tar archive (GNU).
> > > qa@qatools:~/ali/build_release_ltp/work/ppce500mc-linux/ltp-20101031-r0$ file ltp-full-20101031ltp-full-20101031: POSIX tar archive (GNU)
> > > Where as manually I am able to untar the file properly using "tar -xf". Now there are two solutions to this problem. 
> > > 1. We modify the source to contain `tar.bz2` in its name instead of only .bz2 if a tar archived is compressed, which I guess is the correct way as well.
> > > 2. Change the functionality of OE to verify/ recognize the extracted contents and again uncompress it if required.
> > > Notes:I am on a Ubuntu 10.04 64 bit host.
> > > Thanks,Ali 		 	   		  
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >  		 	   		  
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  		 	   		  
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


