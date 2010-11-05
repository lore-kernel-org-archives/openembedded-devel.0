Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PEMWR-0007Ce-Oo
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 14:40:04 +0100
Received: by bwz10 with SMTP id 10so2816161bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OvvVNqT6xxCj/CwubPPkrUPVjRAgGDpMA8fxF+e5U60=;
	b=fCbzWhHYDBSc9AdJ4l/T2CdVddrsvwEnRa+kVrHHOy/lb8fYEefrIxHv0bnoaaixyf
	TfzVgpJ0zGojab4ww2k7VVQ+NsrxcNf7Qse4RJKDEb2GBRZgfUCsZSsbX7II91al1uQ8
	SM00tP85PxcisfKLawwueCB5Tq8xqyDxgtvtw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HAq5SVdq+NHdOGEqwRxFWOVe3EsPn3L4ETOXokujVdI5UmvRClDdLVySpBvWix2MmG
	VxIEpYCQe59mcyEyBoQyh/SlD9a4SeYggcmiUZfMaXZn3GA+yprtxRKzMxEXGHC2UEbd
	Z7J4eOwC+4WT06VxuLo52Sjo030TqFSCqTu2o=
Received: by 10.204.62.203 with SMTP id y11mr1844633bkh.11.1288964349357;
	Fri, 05 Nov 2010 06:39:09 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d12sm1001568bkw.7.2010.11.05.06.39.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 06:39:08 -0700 (PDT)
Date: Fri, 5 Nov 2010 14:38:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101105133847.GP3440@jama>
References: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1288961484.3826.7.camel@mattotaupa>
	<AANLkTimzdQuJQ1Y5VpNJvF0Y1=1aFDzXL5g1u6LArpS3@mail.gmail.com>
	<1288963608.3826.15.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1288963608.3826.15.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libX11: patch configure.ac so a nios2 system is not seen as an os2 system.
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
X-List-Received-Date: Fri, 05 Nov 2010 13:40:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 05, 2010 at 02:26:48PM +0100, Paul Menzel wrote:
> I agree.
> 
> > Then if it is in the inc file, it needs to be taken out again when the
> > next version comes.
> 
> Sorry, I did not make myself clear. My point was if you could put
> `configure.ac-nios2.patch` into `libX11/` or `files`.

better not to use files at all
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/025673.html

diet-x11_1.1.5.bb libx11-trim_1.1.5.bb will find it ok in libx11* dir,
because of FILESPATHPKG .= ":libx11-${PV}:libx11" in libx11.inc

but even when it's the same file I would keep it in separate dirs,
because newer versions won't need it (hopefully) and then it will be
removed with older versions.

> > Hence it was put in the individual files.
> > 
> > BTW it looks like upstream might go for a slightly different patch.
> > I'll leave it to Martin to decide whether to go for that one or for
> > this one (he is on cc of the upstream correspondence).
> 
> Again, could you provide a link to that discussion.

http://lists.freedesktop.org/archives/xorg/2010-November/051731.html

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


