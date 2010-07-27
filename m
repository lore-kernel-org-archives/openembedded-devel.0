Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Odtgo-0005KA-Gu
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 01:36:03 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OdtgV-00050H-TK from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 16:35:43 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 27 Jul 2010 16:35:41 -0700
Received: from [172.30.80.63] ([172.30.80.63]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 27 Jul 2010 17:35:40 -0600
Message-ID: <4C4F6D49.8080303@mentor.com>
Date: Tue, 27 Jul 2010 16:35:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C45E471.5070004@mentor.com>
In-Reply-To: <4C45E471.5070004@mentor.com>
X-OriginalArrivalTime: 27 Jul 2010 23:35:41.0029 (UTC)
	FILETIME=[6CBCB150:01CB2DE4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Finishing packaged-staging (this version..)
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
X-List-Received-Date: Tue, 27 Jul 2010 23:36:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> Hey all,
> 
> As Koen mentioned in another thread, packaged-staging is "halfway done". 
>  So, what's left to get things done good enough for now?  From my point 
> of view it's:
> - Need to get binconfig scripts into the target directory
> - Need to $ORIGIN cross tools
> 
> Once that's done we should have fully relocatable pstaging packages and 
> at that point we can talk about how to do things better.
> 
> poky currently has both of these done, and it involves killing the cross 
> directory (roughly, moving it to sysroots/${HOST_OS}).
> 
> Anyone see anything else needed before we can have a pstaging that's 
> functional enough to use as a baseline for rework?
> 
> Richard, any chance someone from your team is going to be working on 
> rebasing your changes against oe.dev soon?

So, given that Khem did the above needed pulling from poky (and exposed 
an issue with it that's being dealt with now), I think this version of 
packaged staging is done.  I'm doing some torture builds currently, but 
the only issue I can think of, at a "doesn't work" level is wrt 
guile-native and I'll RFC a fix for that shortly.  Oh, and perl-native 
is another story I'll RFC in a moment.

-- 
Tom Rini
Mentor Graphics Corporation


