Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nto8n-0004Hs-OS
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 21:22:28 +0100
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZP000XP9UOG6Z5@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Mar 2010 15:21:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2B05314AF60; Mon,
	22 Mar 2010 16:18:40 -0400 (EDT)
Date: Mon, 22 Mar 2010 16:18:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100322201840.GB28005@denix.org>
References: <201003222055.23408.murat@bilkon-kontrol.com.tr>
	<20100322191054.GA28005@denix.org>
	<201003222143.00252.murat@bilkon-kontrol.com.tr>
MIME-version: 1.0
In-reply-to: <201003222143.00252.murat@bilkon-kontrol.com.tr>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot_git recipe
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
X-List-Received-Date: Mon, 22 Mar 2010 20:22:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 22, 2010 at 09:43:00PM +0200, Murat Karadeniz wrote:
> murat@linux-dm4x:~/system/oe/build> bitbake -k u-boot_git

You call bitbake to build a package by its name w/o a version (unless you use 
-b option for a specific recipe), hence:

$ bitbake -k u-boot

> NOTE: Handling BitBake files: \ (8095/8095) [100 %]      
> Parsing of 8095 .bb files complete (7785 cached, 310 parsed). 7917 targets, 
> 331 skipped, 0 masked, 0 errors.
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'u-
> boot_git' but it wasn't found in any PACKAGE or RPROVIDES variables
> Unknown Event: <bb.event.NoProvider instance at 0xf38524c>                                                                                      
> NOTE: Resolving any missing task queue dependencies                                                                                             
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'u-
> boot_git' but it wasn't found in any PACKAGE or RPROVIDES variables
> Unknown Event: <bb.event.NoProvider instance at 0x1012e8ec>                                                                                     
> NOTE: Runtime target 'u-boot_git' is unbuildable, removing...                                                                                   
> Missing or unbuildable dependency chain was: ['u-boot_git'] 
> 
> And i m sorry, i could not understand "which branch you are using". i git 
> clone  openembedded from repository. And same way i get bitbake from git repo. 
> And i made a few conf as told as openembedded getting started. i m trying only 
> build u-boot with oe and bitbake.

The default branch being org.openembedded.dev, which is a development branch, 
unlike a stable branch, which you can checkout specifically.

-- 
Denys


