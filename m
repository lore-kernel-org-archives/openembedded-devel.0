Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxVmz-0007l1-0p
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 03:35:16 +0200
Received: by gwj21 with SMTP id 21so1100024gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ceKKQS/+OpcjPkngRi9PsQTNw/meKTmIt4uDQmMiSRw=;
	b=Ie0BzD9yJbQnC2p6qxovOBUdtNNy3sn4y5CVkj7WkY9FSnptQnSAaPio4zuLUdnh1E
	mgpc75LJ4e/tHAXNkN8/D8itMNSoR7c7xjvimZWrpQErbA5uFBTFZsqy0n88sx4ONRVc
	+lVTyJ8EMpxOATChmdI4jz36KMbhVfR+lGNrs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TWw4GucvIfH2mS+uicSlP5WtIiM+bCzA+AZtvVDB09Ez75H6UcKWwQjeFJAjREUv2V
	PHb+kQvqLnquIBYKvaHXSzAGQ3u9k99/RckCvthzpVRGV6B65hv8S3e7xIcolVWc34nM
	mI1DbQkpx7KaiGmEQHmg9CSLudQJtirHNsO3A=
Received: by 10.101.167.36 with SMTP id u36mr4141495ano.171.1270171914258;
	Thu, 01 Apr 2010 18:31:54 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 21sm1311475iwn.3.2010.04.01.18.31.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 18:31:51 -0700 (PDT)
Date: Thu, 1 Apr 2010 18:32:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100402013248.GB6161@gmail.com>
References: <t2n46a47f951003312246y97e7b196m59c6d8136580adb0@mail.gmail.com>
	<p2k46a47f951004010909sfb05675bx2ad6274204621bd6@mail.gmail.com>
	<20100401182116.GA27613@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100401182116.GA27613@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-users@linuxtogo.org
Subject: Re: error building meta-toolchain for powerpc 405
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
X-List-Received-Date: Fri, 02 Apr 2010 01:35:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/04/10 20:21), Bernhard Reutner-Fischer wrote:
> On Thu, Apr 01, 2010 at 11:09:56AM -0500, Ryan Phillips wrote:
> 
> >Patch attached... It looks like gcc-package-sdk needs to have the
> >strips be optional.
> 
> Apart from the question below, why not just invoke strip once for all of
> them?
> ${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/*.so.* || :
> 
> just curious..

While this is certainly possible, I am not in favor of using wildcards in
this case because, its more explicit on what we want to strip and it also 
can tell us problems if a given .so was not built for some reason where we
expected it to.


> 
> >                    Is this the correct fix or should libstdc++
> >already exist?
> >
> >Related Commit: 8c4198fc
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


