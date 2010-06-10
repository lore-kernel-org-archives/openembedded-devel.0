Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMpEs-00074y-Qs
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 23:24:41 +0200
Received: by fg-out-1718.google.com with SMTP id d23so44308fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=m+qY0OWhmN2TKo9PXZR1D583PwE1+3edwXaQo+c44Wg=;
	b=bX9otl41lb4Iwvpb9HoybJkROhnu4pztbLsxUxQ+YofD3/1NiWmqHhzqQM61A1z0h1
	GrYT1qIZRRNKN92ZZnktiVFtjTu0YEx/0MxoTrEpS6AvfJE5qrKAbFtnLu5JhQhKnWS+
	dwqpSa8cULHyyH4s4Y3wifFWlCCVl4SBFaAEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=GocMq8MLrgJLNXEhNkG4URmK6Qo64gexHXVp2mHRvlspz4FakaR0NU5Q1hRNMUUkON
	VnX3+kslEfJfraegI8wTedb8X59OxNKGnWI7qTn5EwF9ET2xVkvWTqK/H+JA0Ln9/+hB
	AkNcOqPRk3fhyURi79fO3lDcbrzTEydlmCMjU=
Received: by 10.204.130.28 with SMTP id q28mr545677bks.177.1276204817733;
	Thu, 10 Jun 2010 14:20:17 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id v2sm1690725bkz.13.2010.06.10.14.20.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 14:20:17 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMpAr-0000W2-E7; Thu, 10 Jun 2010 23:20:29 +0200
Date: Thu, 10 Jun 2010 23:20:29 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20100610212029.GX14941@mx.loc>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
	<AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
	<20100610205040.GW14941@mx.loc>
	<1276203991.13179.33.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1276203991.13179.33.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Thu, 10 Jun 2010 21:24:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 10, 2010 at 10:06:31PM +0100, Phil Blundell wrote:
>On Thu, 2010-06-10 at 22:50 +0200, Bernhard Reutner-Fischer wrote:
>> Both mmu and floatingpoint will need to look at COMBINED_FEATURES.
>> At least for mmu vs. !mmu PACKAGE_ARCH=${MACHINE} is unavoidable, no?
>
>I think both of those are more of a distro than a machine feature,
>really.  I imagine that existing distros which are only interested in
>(i.e. only build for) MMU-equipped targets will not be very thrilled if
>their libc and/or other packages suddenly become MACHINE-specific.

If the machine does not provide a choice to use or not use the MMU then
it makes no sense to take that into account for the package arch (think
bfin or i586 or certain coldfires/m68k), yes. If, OTOH, a machine
supports it (let's say ppc) then there must at least be a nice way to
distinguish ppc<endian><mmu><floatingpoint> i would have hoped.



