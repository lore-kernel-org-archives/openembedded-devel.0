Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2b9r-0006Fs-E4
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 04:24:23 +0100
Received: by pwj9 with SMTP id 9so1107154pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 20:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=pX71WK81a5ko57VDvufddtdTtk3+zwiuU/LT5Ozaa3s=;
	b=UvDNfuzRDv/rJUdoK5bAbp4FGkt/gWjgdz4fhnm1V0x/8rOPHHYpXL0B+JDYGEqG36
	/7Cs7l7qRU/rQXGFBGIeN02xT/LTiaJIDK3n/5xnEOiIxSCN7LU3bEaxFF3LSDfZWD+R
	ycLnaebZCOMop8c9s23FbbM6ELuMuw1IBZrNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=rx8t0cOewBhgRWJM9Ga2a9bEvJm1dvUnq3QMPj6X/Jr5P2zPC5AZQs+unFGgmvEiRn
	6+SeZSHEFjTminKDUsmjmwDYFxTrglYVFtt110n1EIcg1+J3hF3QGqDKk+kjATHbGSWD
	RN9Is0rWzzdVIf2xcyE5aUVUKelhoSjZXtv+w=
Received: by 10.142.62.35 with SMTP id k35mr5859194wfa.67.1300936950849;
	Wed, 23 Mar 2011 20:22:30 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm10890954wfl.23.2011.03.23.20.22.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 20:22:29 -0700 (PDT)
Date: Wed, 23 Mar 2011 20:22:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110324032254.GD20796@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=4V9JnT1HKi1VJo9j46xXoTHJk_MwAh1fU9F_0@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=4V9JnT1HKi1VJo9j46xXoTHJk_MwAh1fU9F_0@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: How do I change the kernel includes used in building a toolchain?
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
X-List-Received-Date: Thu, 24 Mar 2011 03:24:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/03/11 15:22), Charles Manning wrote:
> I've managed to make the recipes to build a toolchain.
> 
> I've also managed to make the recipes to build a new version kernel
> uImage and modules.
> 
> 
> But the problem I have is that the toolchain I built has kernel
> headers from the wrong kernel version. That means packages like tslib
> which use kernel includes don't work properly because they are
> compiled against obsolete kernel interfaces.
> 
> What do I change so that the sdk includes the correct kernel includes?

in you local.conf set
PREFERRED_VERSION_linux-libc-headers_local     = "2.6.xx"

> 
> Thanks
> 
> Charles
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


