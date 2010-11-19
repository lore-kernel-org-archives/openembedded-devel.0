Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJYBH-00008k-JI
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 22:07:40 +0100
Received: by gyd12 with SMTP id 12so335549gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=U0bPmY4s//QPcdxO8O6+0JfsghUypCqthsAinvKcijA=;
	b=fxtcx3wco151MKNjX3rH7ycr+uwqqskBD1Vfn29K/sYt/pPD+hM4+z691ZUdU3Ue9U
	rEuIomi5NYdBqvzfbo5Nsz/lAs/ntk6T44hwUz8VpPnkdmJOQEv13rNSC8m6fnFM50gq
	nVbMjTDMHUB1RfSPduwPGjX9HEx1PYoqpzOmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oJ2/t27Kg0hFNZNWNZKMSF0/T8JBp3bFtMzvSjdJsG9QWJclqLk/qfx19J6WqeecsW
	Im0IPrHkiUxvm1heb3A04NQlofAS7EOTPGDIxLLYSc+ReeOkQGmoan/b8mbmxfSSpw8M
	UipncksuhI91IuGKudGD6qe33Uemyzxl2KMEA=
Received: by 10.151.42.3 with SMTP id u3mr4287944ybj.294.1290200787482;
	Fri, 19 Nov 2010 13:06:27 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q18sm63788ybk.3.2010.11.19.13.06.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 13:06:26 -0800 (PST)
Date: Fri, 19 Nov 2010 13:05:51 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119210551.GD8017@gmail.com>
References: <E1PJRde-0007Xb-3l@melo.openembedded.org>
	<4CE69FC7.2040607@mistralsolutions.com>
MIME-Version: 1.0
In-Reply-To: <4CE69FC7.2040607@mistralsolutions.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Nagendra <nagendra@mistralsolutions.com>,
	Srinath R <srinath@mistralsolutions.com>, jdk@ti.com,
	umeshk@mistralsolutions.com
Subject: Re: am3517/05 : Add am3517-crane machine type
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
X-List-Received-Date: Fri, 19 Nov 2010 21:07:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/11/10 21:33), Anil wrote:
> Hi All,
> 
> Adding support for AM3517/05-Craneboard machine type to openembedded.
> 
> Craneboard is a hardware development platform based on the Sitara
> AM3517 ARM Cortex - A8 microprocessor device. This is a low cost
> reference design.
> 
> These patches adds support for craneboard  x-load,  u-boot and
> kernel along with configuration file for openembedded.

Thanks for patches. Could you break them up into individual patches
and send them to ml so people can look at the parts they are interested in
http://wiki.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded


> 
>     [1] http://www.ti.com/arm
>     [2] http://www.mistralsolutions.com/products/craneboard.php
> 
> Please review and let me know your comments.
> 
> .--
> Thanks and regards
> Anil kumar .M
> 
> 
> 
> Please do not print this email unless it is absolutely necessary. Spread environmental awareness.
> 
> -------------------------------------------------------DISCLAIMER------------------------------------------------------
> The information transmitted herewith is confidential and proprietary information intended only for use by the individual or entity to which it is addressed. If the reader of this message is not the intended recipient, you are hereby notified that any review, retransmission, dissemination, distribution, copying or other use of, or taking of any action in reliance upon this information is strictly prohibited. If you have received this communication in error, please contact the sender and delete the material from your computer.
> ---------------------------------------------------------------------------------------------------------------------------


and cut such crap out in future. You are sending stuff to public mailing
lists. 

-Khem


