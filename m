Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OHglK-0000qM-Bb
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 19:20:55 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L33004PO9AVNOL3@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	27 May 2010 12:16:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 756C014AF60; Thu,
	27 May 2010 13:16:07 -0400 (EDT)
Date: Thu, 27 May 2010 13:16:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100527171607.GK23464@denix.org>
References: <201005271742.21771.vladimir.davydov@promwad.com>
MIME-version: 1.0
In-reply-to: <201005271742.21771.vladimir.davydov@promwad.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: developmet setup
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
X-List-Received-Date: Thu, 27 May 2010 17:20:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 27, 2010 at 05:42:21PM +0300, Vladimir Davydov wrote:
> Hi,

Has anyone looked at srctree class from kergoth? There were some usage 
examples on the list before...


> Maybe following way will not usefull for you, but it is working for me.
> 
> I have overrided do_fetch() method in the kernel recipe to make symlink to my 
> kernel source tree, which is under git control.
> 
> S = "${WORKDIR}/linux-2.6"
> 
> do_fetch () {                                                                                                                                          
>   cd ${WORKDIR}                                                                                                                                      
>   if [ ! -L ${S} ]; then                                                                                                                             
>     ln -sf ${MY_KERNEL_PATH} ${S}                                                                                                             
>   fi                                                                                                                                                 
> }                                                                                                                                                      
> 
> MY_KERNEL_PATH is the local path to my kernel source tree. It is passed from  
> environment variables.
> I'm using this way only for kernel development.
> 
> 
> > Hi all,
> > I was searching a clean way to develop in OE my new kernel and my new
> > applications.
> > 
> > I saw this nice article about kernel development:
> > http://bec-systems.com/site/521/best-practices-for-kernel-development-with-
> > openembedded
> > 
> > I would like a way to develop inside Openembedded, but not in work
> > directory.
> > I mean to develop a project in a git tree, allowing me to use 'git diff'
> > ..... and finally 'git push' to my internal git servers.
> > This is an idea:
> > bitbake -c devshell-path /home/myapplication myapplicationrecipe
> > 
> > Perhaps srctree is a good tool already done for it?
> > 
> > Thanks,
> > Raffaele
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> -- 
> Vladimir Davydov
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


