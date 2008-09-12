Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Kdw9d-0001Ot-CD
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Sep 2008 02:04:53 +0200
Received: by py-out-1112.google.com with SMTP id y77so472572pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2008 17:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=t2+/AsHvSdVigLYjCbUWtGZTFpv9QZexkKo3sIOc0HU=;
	b=slS2FBUL00yGXF5C8yaX2IGA9w08NexiwyTbEvesPi+Xs5FvshMzW9Mu+M1XSKgNBL
	DpzzcbvxfCRJC/kbC/bcBEgbPr4s2321jwpAL8bKj+yjiXSXhPLNNgZhpdQx8Qaun21D
	rXbVKHfhURuDmeGqOyyA4BdH92v7FT8i4dd90=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AWzArRvJc+8+e28tpVzGz8fCYfLyR2qD6TWv1hgb5gXrYKDatshO5Z70AQnPAMmstZ
	hTVbvG3juuEWxQCDnH0ulWF4GFo5XAKZmqAQhu4R/18nVFXlWci1C+KTMbIagOEwUsmu
	RD7in33TnTtY61KQEjMIN3lQ6p3aIJk0KJhHU=
Received: by 10.142.242.11 with SMTP id p11mr1197578wfh.174.1221177730256;
	Thu, 11 Sep 2008 17:02:10 -0700 (PDT)
Received: from localhost ( [71.146.23.38])
	by mx.google.com with ESMTPS id 22sm14276352wfd.7.2008.09.11.17.02.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 11 Sep 2008 17:02:10 -0700 (PDT)
Date: Thu, 11 Sep 2008 17:02:08 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080912000208.GA12469@gmail.com>
References: <20080911195243.GA16359@denix.org>
MIME-Version: 1.0
In-Reply-To: <20080911195243.GA16359@denix.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: RFC: SDK/external-toolchain fixes
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
X-List-Received-Date: Fri, 12 Sep 2008 00:04:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/09/08 15:52), Denys Dmytriyenko wrote:
> Hi,
> 
> I've been playing with OE's SDK and external-toolchain features lately and
> stumbled upon couple of issues. Thanks to Philip Balister for commiting
> trivial fixes in, now I have 2 more, which require wider review. Please let
> me know of any problems or comments. Thanks.
> 
> 
> #1 gcc-cross-sdk 4.3.1 missing include-fixed
> http://bugs.openembedded.net/show_bug.cgi?id=4536
> 
> gcc 4.3.x has some GCC-provided headers in include-fixed (namely limits.h),
> which are missing in the gcc-cross-sdk version, rendering external toolchain
> unusable.

I do not like this fix. IMO Instead of copying them into include directory they should be let alone in include-fixed directory and packaged. You should add knowledge of this new directory to the failing package instead. What packages are broken because of this. 

> 
> Provided patch copies them in the include directory as a temporary solution.
> A similar temporary solution is present in gcc-cross_4.3.1, see
> do_stage_append()
> 
> 
> #2 external-toolchain misses providing runtime libgcc
> http://bugs.openembedded.net/show_bug.cgi?id=4542
> 
> Since external-toolchain misses specifying libgcc as provided runtime library,
> dependency tree picks up either gcc-cross or even gcc-noemu...

This one seems ok to me. 

> 
> Attached patch fixes the problem.
> 
> 
> -- 
> Denys
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


