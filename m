Received: from [209.85.216.183] (helo=mail-px0-f183.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john3909@gmail.com>) id 1N9pGn-0008D2-Pw
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 01:16:40 +0100
Received: by pxi13 with SMTP id 13so991016pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:reply-to:from:to:references
	:in-reply-to:subject:date:organization:message-id:mime-version
	:content-type:content-transfer-encoding:x-mailer:thread-index
	:content-language;
	bh=10Jfrgqy/yOrR836ICqAQOVuUFyZCn0Z8593fOBMzYY=;
	b=Vdxk/wSndkdDcn+rEFu2NmwCYW3pwAcnY88eNqP6ZDSFFVOzeGHo8NkPyZB/USrSs7
	ZOtd6XIyb+6zY4vootWwrfLnX3Z7R5cqxIzUwdofHwHfuyE2MPI9Gz+zhtRNuJuVDK+Y
	na/hdh4fQDoqqiJ0Aqq2jJgq/YgTebA6U9m/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=reply-to:from:to:references:in-reply-to:subject:date:organization
	:message-id:mime-version:content-type:content-transfer-encoding
	:x-mailer:thread-index:content-language;
	b=dB+gNz9s00gU4m8fUd7Hf7COBUuuLVxEKN1hd7raAOS6CSr5pC43cIaGzPR6FrZLhs
	mUxVennfIckzmX8kje9nrD1xE4dJ0lpMY4shJlAmgKiQabtPwT5414LrbLxAwJy3MXJR
	QX5CmMAopSeWFK5O0OW3oJswOw16+7nQVSjeA=
Received: by 10.114.189.40 with SMTP id m40mr13266512waf.228.1258330128267;
	Sun, 15 Nov 2009 16:08:48 -0800 (PST)
Received: from inspiron9400 (99-26-125-126.lightspeed.sndgca.sbcglobal.net
	[99.26.125.126])
	by mx.google.com with ESMTPS id 23sm1170705pxi.1.2009.11.15.16.08.46
	(version=SSLv3 cipher=RC4-MD5); Sun, 15 Nov 2009 16:08:47 -0800 (PST)
From: "John \(GMail\)" <john3909@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <alpine.LFD.2.00.0911150948430.14311@localhost>
In-Reply-To: <alpine.LFD.2.00.0911150948430.14311@localhost>
Date: Sun, 15 Nov 2009 16:08:45 -0800
Organization: U.S. Power, Inc
Message-ID: <008d01ca6650$f7d79cc0$e786d640$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpmShRwaCzJ1uUQQtG2t8jMPawqBQABgDpg
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: john3909@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: any ETA on a working dev beagleboard demo image?
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
X-List-Received-Date: Mon, 16 Nov 2009 00:16:41 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Robert P. J. Day
> Sent: Sunday, November 15, 2009 6:57 AM
> To: OpenEmbedded Development mailing list
> Subject: [oe] any ETA on a working dev beagleboard demo image?
> 
> 
>   yes, i know i'm sounding like a broken record, but i have an invite
> to give a short local demo of the beagleboard this tuesday and i'd
> like to do it with an angstrom development demo image, just because i
> prefer to live out there on the edge.
> 
>   at the moment, there is just the one package standing in the way --
> guile-native -- and as i recall, someone posted what looked like a
> manual fix.  is that being turned into a patch at any point?  i
> realize i'm nagging, but it's literally been *weeks* since that
> particular bitbake target actually built, and every time it looks like
> it's getting close to being buildable, more packages break.
> 
>   i appreciate that development means exactly that but, at the very
> least, even the development branch should *build*, even if there are
> run issues.
I also had problems building the DEV branch, but as of yesterday,
beagleboard-demo-image builds without errors on Ubuntu 9.10. I was having
problems with webkit-gtk, but Koen released a fix on Saturday and now the
build completes successfully.
> 
> rday
> 
> p.s.  perhaps it would be useful to start tagging the development
> branch at points where it builds, just so someone can always retreat
> to the most recent known good build.
> 
> or perhaps start a branch named, oh, "bleeding", which, when it builds
> properly, can be merged back into development.  whatever.  but it
> strikes me that it's overwhelmingly pointless to have a development
> branch that doesn't build since that gives no one the opportunity to
> actually test it.
> 
> --
> 
> =============================================================
> ===========
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> =============================================================
> ===========
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



