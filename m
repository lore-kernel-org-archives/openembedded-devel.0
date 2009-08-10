Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MaasQ-0001RK-PT
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 21:49:54 +0200
Received: by wa-out-1112.google.com with SMTP id m34so544946wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lwxp1MzvVqolp+c0Ew+jDvOj4+rBUO+lma2/IUchsxc=;
	b=UZ8FAAdHkihdgI6vAZUUU3LO+1QRmyPSVK+1Qld24R4n524zPLa8YQktIskKvJPhO9
	letd5eIURpy9CN3DtJRCxOn4Y6gvCoOb6xzrgOvFWcurub8S8erTBH8DjRRs5CHtRTKN
	9LO32kyG0xL9fLAsbBQwUJ6r9GMtzMb9HkmX0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EzeeHrT4sqpTQ1pjLd8hBAWsctHe5SqMDhhQIcOgVQmE05YHcKxIFYSOwr4NAzuC2L
	DN3tHr9ozCbToAB3qW5bjDsBfT5ZrkySipBqQzIJggysX/o7CdVjPU2c3H5OVASGMwDr
	vd4gOfLN0DJ0jrxCQrByVugLkIzP4gf6gGsNo=
Received: by 10.114.38.5 with SMTP id l5mr6693208wal.226.1249932817251;
	Mon, 10 Aug 2009 12:33:37 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id m30sm7721299wag.69.2009.08.10.12.33.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Aug 2009 12:33:36 -0700 (PDT)
Date: Mon, 10 Aug 2009 12:33:33 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090810193333.GB8142@gmail.com>
References: <4A805102.6060505@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <4A805102.6060505@cbnco.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: pciutils and pci.ids.gz
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
X-List-Received-Date: Mon, 10 Aug 2009 19:50:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/08/09 12:55), Michael Smith wrote:
> Hi,
>
> commit 257821eeea20420af8369a3db6fb398926fdfe84
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sun Aug 9 01:58:23 2009 -0700
>
>     pciutils_3.1.2.bb: Dont install gzipped versio of pci.ids its not  
> there.
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

got pushed inadvertently

>
> Ahh, I have a feeling the pciutils lib/configure script is looking in  
> the wrong place to autodetect ZLIB (it wants /usr/include/zlib.h). I'll  
> send a patch to fix.

Atleast we found a problem.

>
> If you revert someone's change, could you please post about it to the  
> mailing list? I only caught this by accident when looking through a week  
> or two of logs.
>
> Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


