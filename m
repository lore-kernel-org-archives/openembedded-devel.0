Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Luwj3-0007Ch-0l
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 00:40:01 +0200
Received: by wa-out-1112.google.com with SMTP id n7so529879wag.12
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=KfE1zMX8946ADF9q6byGz0qLrDnGjsAzYF8rH0ZwobE=;
	b=U0W/ESqoKJzZxxDS0Zt/KURbFXJt73zuGjWDSEHS3zTZWi129qEV2Gb9Pbh0fuQKVF
	KpxRMGAXTcbS5rvZiqV5RUFFH/5LbwEiNHmMyZaQItVFtQn4oJnM4KNiIIbCni5QBbVo
	uEyp9sMD3+3GfoZ9OtdbDpXitHvmSTfforBwk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XRAeVW5sHI0jOceKeB6ziXSeqvtkw7+kwokj8JLTtih8GURJfckYaxa0R7virlMtO5
	B9fGMvZTo3lSm+4CuYPOmGJDwMrUdDcCjV8AliM4dWn7A4Fkx+9K02NInyEZV680lmFx
	s9trmdLcPjyjKTjzoZKK3k545ruKwS1A8lMs8=
Received: by 10.114.211.1 with SMTP id j1mr1693911wag.176.1240007758503;
	Fri, 17 Apr 2009 15:35:58 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id q20sm12409183pog.17.2009.04.17.15.35.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 17 Apr 2009 15:35:57 -0700 (PDT)
Date: Fri, 17 Apr 2009 15:35:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090417223550.GA15643@gmail.com>
References: <1239739518-1325-1-git-send-email-dhuggins@cs.cmu.edu>
	<20090416162942.GF17629@smtp.west.cox.net>
	<49E76412.50807@cs.cmu.edu>
	<20090416171150.GI17629@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090416171150.GI17629@smtp.west.cox.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org,
	David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: Re: [PATCH] Supply uclibc-thread-db package expected by	task-sdk-base
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
X-List-Received-Date: Fri, 17 Apr 2009 22:40:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/04/09 10:11), Tom Rini wrote:
> On Thu, Apr 16, 2009 at 01:00:02PM -0400, David Huggins-Daines wrote:
> > Tom Rini wrote:
> > > On Tue, Apr 14, 2009 at 04:05:18PM -0400, David Huggins-Daines wrote:
> > >
> > >   
> > >> Currently, building task-sdk-base (and by extension meta-toolchain) fails
> > >> for uclibc targets.  This is because task-sdk-base depends on the thread
> > >> debugging library uclibc-thread-db, but this is not built by the uclibc
> > >> recipe unless PTHREADS_DEBUG_SUPPORT is enabled.  In addition, once it is
> > >> built, if you are using Debian version numbers, it will be helpfully
> > >> renamed to "libthread-db1" and the build will still fail.
> > >>
> > >>     
> > As pointed out earlier on this thread (and verified - there was some
> > confusion on my part since I didn't fully clean before rebuilding), the
> > library renaming itself doesn't cause any problems.  The only actual
> > problem is the lack of PTHREADS_DEBUG_SUPPORT.
> > > That's interesting as when I pushed these changes I did test with a
> > > uclibc target too.  What DISTRO/MACHINE are you using?
> > >   
> > I have a custom distro and machine, but broadly speaking it is
> > minimal-uclibc and ep93xx...
> 
> OK, that's what I was wondering.  Khem, do we think
> PTHREADS_DEBUG_SUPPORT should get enabled globally?  If so, then we
> should go and audit all of the distro uClibc.distro files and get this
> fixed for everybody.  Thanks.

yes I think it is needed for debugging threads so we have to enable it.
right we need to put it in all config files. I will take a look.

> 
> -- 
> Tom Rini
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


