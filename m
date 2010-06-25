Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OS9Nb-0007Dk-LI
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 15:55:41 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OS9J6-00060i-HN from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 06:51:00 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 25 Jun 2010 06:51:00 -0700
Received: from [134.86.104.18] ([134.86.104.18]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 25 Jun 2010 07:50:59 -0600
Message-ID: <4C24B443.80303@mentor.com>
Date: Fri, 25 Jun 2010 08:50:59 -0500
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C227543.3050502@zenlinux.com>
In-Reply-To: <4C227543.3050502@zenlinux.com>
X-OriginalArrivalTime: 25 Jun 2010 13:50:59.0557 (UTC)
	FILETIME=[7154E150:01CB146D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: Should do_runstrip be removed for kernel packages?
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
X-List-Received-Date: Fri, 25 Jun 2010 13:55:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Scott Garman wrote:
> Hello,
> 
> I've noticed for many kernel builds in OE/Poky that there are non-fatal 
> runstrip errors being generated during the do_pacakge stage of the build.
> 
> This is happening because a handful of utility binaries (in arch/boot/ 
> and scripts/) are being compiled for the host architecture, and then 
> strip for the target architecture is being run. When these architectures 
> don't match, runstrip complains and generates these errors.
> 
> Currently in Poky we are maintaining a blacklist of these binaries and 
> deleting them in do_install:
> 
> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=698dab01098816e4894beb4b3dad556f045c074d 
> 
> 
> This is a hack that I'd like to keep as temporary as possible.
> 
> I'm curious though if it is even common to perform do_runstrip for 
> kernel packages? What are the use cases that require this? If there are 
> none, then I'm inclined to simply disable do_runstrip in kernel.bbclass.
> 
> Another option - less elegant, but better than the current hack - might 
> be to use a variable to disable runstrip and set that within the kernel 
> recipe files.

There's already a SKIP for strip, iirc.  Throwing that into 
kernel.bbclass or the modules bbclass would get the discussion moving 
more, perhaps (I'm a bit torn here).

-- 
Tom Rini
Mentor Graphics Corporation


