Received: from [209.85.217.223] (helo=mail-gx0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhZPs-0006Ez-UK
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 03:41:13 +0200
Received: by gxk23 with SMTP id 23so4037821gxk.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 18:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=jK6GEcpa5T1hwbE2PYJN5HpouV0SvVEDg9wgq92GemQ=;
	b=t3swzkM/wGDykxn8oGPLiwksCqeBXv/LTM3vtO8t+6yR4sQ/2ky6mW1+w7qj295In4
	/Qf8CsvMD9lqk7LCJ3EplASyBWfSZip+31p8RZz77d7G6MW59hIJHLuChV+gJiIFXF4c
	YQJpdMgbLDq4lNvBrtX9fpHwySVzggc2u8oKk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=GVOhlZou8piiactZFiRUFybmTtB/gip8NaCPjCfpw0HxehE6R8mT/nLQJ01mmh/c1P
	LP34dPBnKdehB/2hak7JBLmykv3qb/s8bm4+1y/KiBQmrH600Nyspnss8HdRlXMr7aPN
	orMYI17R0b37nuZ8RiiiuYsPjyWtBIZZyMSc8=
Received: by 10.151.25.2 with SMTP id c2mr4237079ybj.130.1251595370589;
	Sat, 29 Aug 2009 18:22:50 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 23sm201434pzk.0.2009.08.29.18.22.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Aug 2009 18:22:49 -0700 (PDT)
Date: Sat, 29 Aug 2009 18:22:44 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090830012244.GA5033@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 01:41:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (29/08/09 00:50), Khem Raj wrote:
> On Fri, Aug 28, 2009 at 7:02 PM, Tom Rini<trini@embeddedalley.com> wrote:
> > On Fri, Aug 28, 2009 at 05:00:44PM -0700, Khem Raj wrote:
> >
> >> Target triplet powerpc-*-linux-gnuspe is chosen for machines with SPE
> >> which is e500 cores.
> >
> > Two things.  First, doesn't that override the previous TARGET_OS?  Or
> > did I miss some magic in there to use the previous result?
> 
> hmm yes it wil if it is linux-gnueabi then the second assignment will
> reset it to linux
> 
> Discard it.  I think we need something better

We can override only for powerpc second time around. So changing it to 

TARGET_OS_powerpc =
"linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc',
'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari', 'tqm8540']]}"

will that be ok ?

Thanks

-Khem


