Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnxjW-0007TT-1j
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 19:28:42 +0100
Received: by pvd12 with SMTP id 12so448322pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 10:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1hvOPW9DISS1gx+W0Aj+bwtKtGYVGucZRrzejQnproA=;
	b=rujkPcWH1pQvDZ6kL4tWeaN75CtHpJq1T548c/Y3Wx62k0p9Tm0RLEDDGjt+mij3uy
	f8WCTZgwre4pUgs7Vbh30TN9qz8WoWRo8JB1yESJbh7UYK+a7grCclgTs7L1eBYZmfH1
	HZ6TogAD4qPbh0rUBLuJZDmS2miI1B/IsXQGU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fa3QgZ/yeZOrhhRou4tfnAapf+O6AxdjhoTiVNeHtL9Jpr4FOe38icYeYakTFyHrat
	dYq2LTdP6WSs2Ro1NIFIOhLxncR/TuzcnKEJyC2sN0itFIVNf/r8C9Hnxai9ZctbrFTw
	O3Rn9Pz24Ybv0Gh0VqPf7b8epBvTCrSNS6lSE=
Received: by 10.142.104.10 with SMTP id b10mr633229wfc.37.1297448855152;
	Fri, 11 Feb 2011 10:27:35 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm1336500wfh.12.2011.02.11.10.27.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 10:27:33 -0800 (PST)
Date: Fri, 11 Feb 2011 10:27:22 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211182722.GA32278@gmail.com>
References: <AANLkTindnAy_ujVZdrRCbKmwOSos-FJT_=cy5T+BVir+@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTindnAy_ujVZdrRCbKmwOSos-FJT_=cy5T+BVir+@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: binutils QA errors (RPATH)
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
X-List-Received-Date: Fri, 11 Feb 2011 18:28:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/01/11 10:43), Frans Meulenbroeks wrote:
> From my testing build (20110128)
> 
> NOTE: package binutils-2.21-r13.2: task do_package: Started
> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/bin/embedspu
> NOTE: Multiple libraries (libbfd-2.21.so, libopcodes-2.21.so) found
> and LEAD_SONAME not defined
> ERROR: QA Issue with binutils: package binutils contains bad RPATH
> /home/hudson/jobs/OE_test/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
> in file /home/hudson/jobs/OE_test/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/binutils-2.21-r13.2/packages-split/binutils/usr/bin/powerpc-oe-linux-gnuspe-readelf
> ERROR: QA Issue with binutils: package binutils contains bad RPATH
> /home/hudson/jobs/OE_test/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
> in file /home/hudson/jobs/OE_test/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/binutils-2.21-r13.2/packages-split/binutils/usr/bin/powerpc-oe-linux-gnuspe-elfedit
> ERROR: QA Issue with binutils: package binutils contains bad RPATH
> /home/hudson/jobs/OE_test/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
> in file /home/hudson/jobs/OE_test/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/binutils-2.21-r13.2/packages-split/binutils/usr/lib/libbfd-2.21.so

hmmm I see these errors in my build. let me see if I can fix it.

> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


