Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P10lH-00055u-94
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 19:48:12 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9I00NFLS383RF2@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	29 Sep 2010 12:47:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 13B6214AF64; Wed,
	29 Sep 2010 13:47:32 -0400 (EDT)
Date: Wed, 29 Sep 2010 13:47:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100929174732.GA27217@denix.org>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
	<AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
	<AANLkTikFQaRG3S8tJDGCFvWpad51Ac9X8f4DgHS-Rrvv@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTikFQaRG3S8tJDGCFvWpad51Ac9X8f4DgHS-Rrvv@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: generate a named kernel in ${DEPLOY_DIR_IMAGE}
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
X-List-Received-Date: Wed, 29 Sep 2010 17:48:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 29, 2010 at 08:28:37AM +0200, Frans Meulenbroeks wrote:
> 2010/9/29 Andrea Adami <andrea.adami@gmail.com>:
> > On Tue, Sep 28, 2010 at 6:54 PM, Frans Meulenbroeks
> >> As I needed to generate two different kernels for the same machine I
> >> had some kind of problem (as emailed yesterday).
> >> For now I've solved it as follows:
> >>
> >> I created a 2nd recipe (in an overlay):
> >> linux-small_2.6.34.bb
> >> this one essentially only requires linux_2.6.34.bb and sets S to the linux_${PN}
> >> Then I can just add a dir linux-small and add the small defconfig in it.
> >>
> >> That way bitbake linux-small should give me the 2nd kernel.
> >> And actually it builds the kernel but this one is also packaged in a
> >> kernel-*.ipk.
> >> I could have made two different machines, but that seemed somewhat
> >> overkill, so in the end I decided to modify do_install_append in
> >> linux.inc.
> 
> PS: referring to Denys' message about multi-linux.inc: still haven't
> tested it, but what isslightly nasty about it is that it does not
> package, so I cannot easily include modules in an image
> (as my kernels are from the same recipe the modules are compatible,
> and it helps to be able to say in an image recipe that you want to add
> kernel-module-xyz)

Frans,

It packages only the main kernel and all the related modules, configured by 
the usual defconfig file. But it doesn't do it for the additional kernels that 
were built using configuration files from configs/ directory...

-- 
Denys


