Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N6UGN-00016G-6a
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 20:14:26 +0100
Received: by fxm1 with SMTP id 1so342106fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 11:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FUiQu+gF6bzWLE1plutcUSSgC2isYj9V50HHtK2l9bE=;
	b=qxRFs6GOoRS6Yw7Rghzs54aM2Xj/VfKrpPp8ApKcXkzO8rW7gPLxTVAjiN39fvTAgC
	bAlbmzEsL0nCmd6aPpg3UMBRrUaGsLX+fCtXjwROBOxp2R3j7+gYzGM4UNaqS4zHt9TA
	4V5tRO9JBCsqnYbUYQnxFec99JDxuYhGKnB10=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HPNHHS0676PmNogb6TwDAif9hHLhiPFuFnVZ+LKdC+NyjvcHZ7xfLeIZNygApcEYXu
	hB90ublLirzL38PSFnftgCfTm/tuE3cHL8LkNen7qsbpDXaLXkbLwSYpx8TfjoCWo0UF
	1cbbgFDkH0v8y1nUn81vzGledm87ElBAN7IM8=
Received: by 10.103.76.37 with SMTP id d37mr1802162mul.99.1257531073568;
	Fri, 06 Nov 2009 10:11:13 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 23sm898914mum.44.2009.11.06.10.11.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Nov 2009 10:11:12 -0800 (PST)
Date: Fri, 6 Nov 2009 10:11:03 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091106181103.GA10725@gmail.com>
References: <4AEFEDD5.2080106@SSpaeth.de>
	<359c5480911031448j5c083c75w1578f6f50a2aa5fa@mail.gmail.com>
	<20091103230007.GB3295@jama> <1257391610.16913.4276.camel@shrek>
	<359c5480911042351t7b2326b0kd7cf0b5ff080904f@mail.gmail.com>
	<792ba59f0911050343y1b31dab1l54b774e1da1d6df5@mail.gmail.com>
	<359c5480911060420j3238011dw39e64bf395b399bb@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <359c5480911060420j3238011dw39e64bf395b399bb@mail.gmail.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Maksim 'max_posedon' Melnikau <maxposedon@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>, shr-devel@lists.shr-project.org
Subject: Re: [Shr-Devel] New shr/image results
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
X-List-Received-Date: Fri, 06 Nov 2009 19:14:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (06/11/09 13:20), Nicola Mfb wrote:
> On Thu, Nov 5, 2009 at 12:43 PM, Maksim 'max_posedon' Melnikau
> <maxposedon@gmail.com> wrote:
> > On 11/5/09, Nicola Mfb <nicola.mfb@gmail.com> wrote:
> [...]
> >> However on the new image I got a strange error parsing xml files with
> >> qt libraries, it always gives me an error on line 1, character 1, the
> [...]
> > For me it was fixed by using -O2 instead of -Os, -Os ALWAYS reproduce
> > exactly this error. -O2 - never for me. So, try change your compile

it would be helpful if you could narrow down the case. There is a
possiblity of gcc bug here but a testcase would be required.


> > flags to less agressive (qt-compile flags).
> >
> > Maksim
> >
> 
> Thanks! It fixed the problem! it seems qt runs fine with eglibc and thumb.
> To build qt with -O2 i changed my local.conf adding:
> 
> FULL_OPTIMIZATION_pn-qt4-x11-free = "-fexpensive-optimizations
> -fomit-frame-pointer -frename-registers -O2"

in qt4-x11-free recipe you could use EXTRA_OEMAKE variable to add O2 to CFLAGS probably.
> 
> To fix that upstream I do not know where it should be placed as it
> should affect all distro using gcc 4.4.x?
> 
> Best regards
> 
>     Nicola
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


