Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KdyAv-000611-N9
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Sep 2008 04:14:22 +0200
Received: by rv-out-0708.google.com with SMTP id f25so778210rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2008 19:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6MT17JsYDNqzAMrMM350LwaRjSy+EsimplaMuwtNmok=;
	b=hpSnOPzhiyxsYfCriQECUNvdY7vCEbq0CD7GrvMkXrz12Z3NjA/hseGJmqJTonXFzW
	OvWlejEgFyIvf5Mx51fQYqnr5LtQvxgTsUtUB0f70bO/SPU4jzmHgKvmNJq0YvFE4QAH
	4nybN/xe9voS/LYUDiZ5eQyFQGlDtDtqlP3ck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OMB8GeF9mL/CGQuPI9euGuWuXVlpFRBhDhwmGvtAqVWvWpWKF3shr/zrbsBDznv8E8
	QBvMd6qGFZCP5cNDwpmCWmfxt3IZT58aHlegOt07d9ZnNiLN5ddrW9cS9dqRpdUZ0RCc
	WWVc/E0rkJNcPJsJS8VFtj8C4EjRw1sxXqEfE=
Received: by 10.140.128.3 with SMTP id a3mr2227087rvd.195.1221185498206;
	Thu, 11 Sep 2008 19:11:38 -0700 (PDT)
Received: from localhost ( [71.146.23.38])
	by mx.google.com with ESMTPS id l31sm15568436rvb.2.2008.09.11.19.11.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 11 Sep 2008 19:11:37 -0700 (PDT)
Date: Thu, 11 Sep 2008 19:11:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080912021136.GA20033@gmail.com>
References: <20080911195243.GA16359@denix.org>
	<20080912000208.GA12469@gmail.com>
	<20080912015320.GB17523@denix.org>
MIME-Version: 1.0
In-Reply-To: <20080912015320.GB17523@denix.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: RFC: SDK/external-toolchain fixes
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
X-List-Received-Date: Fri, 12 Sep 2008 02:14:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/09/08 21:53), Denys Dmytriyenko wrote:
> First of all, thanks for your review.
> 
> On Thu, Sep 11, 2008 at 05:02:08PM -0700, Khem Raj wrote:
> > On (11/09/08 15:52), Denys Dmytriyenko wrote:
> > > 
> > > #1 gcc-cross-sdk 4.3.1 missing include-fixed
> > > http://bugs.openembedded.net/show_bug.cgi?id=4536
> > > 
> > > gcc 4.3.x has some GCC-provided headers in include-fixed (namely limits.h),
> > > which are missing in the gcc-cross-sdk version, rendering external toolchain
> > > unusable.
> > 
> > I do not like this fix. IMO Instead of copying them into include directory 
> > they should be let alone in include-fixed directory and packaged. You should 
> > add knowledge of this new directory to the failing package instead. What 
> > packages are broken because of this.
> 
> I agree that this is not a proper fix, but rather a hack. glibc has its own 
> limits.h, which wants to include gcc's limits.h like this:
> 
>  /* Get the compiler's limits.h, which defines almost all the ISO constants.
>     We put this #include_next outside the double inclusion check because
>     it should be possible to include this file more than once and still get
>     the definitions from gcc's header.  */
> #if defined __GNUC__ && !defined _GCC_LIMITS_H_
> /* `_GCC_LIMITS_H_' is what GCC's file defines.  */
> # include_next <limits.h>
> #endif
> 
> This issue was brought up before, but as far as I can tell, it wasn't fixed 
> properly.
> This is initial Koen's post about the issue:
> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005108.html
> And here is your own reply with one of the possible solutions:
> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005111.html
> 

right. So can you try this patch and see if this fixes the problem ?

> Here is how it's "solved" (i.e. worked around) in gcc-cross_4.3.1.bb (4.3.2):
> 
> # Hack till we fix *libc properly
> do_stage_append() {
>         ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
> }
> 
> I'd love to see it fixed properly, but for now I'm trying to bring 
> gcc-cross-sdk on par with gcc-cross.
> 
> > > Provided patch copies them in the include directory as a temporary solution.
> > > A similar temporary solution is present in gcc-cross_4.3.1, see
> > > do_stage_append()
> > > 
> > > 
> > > #2 external-toolchain misses providing runtime libgcc
> > > http://bugs.openembedded.net/show_bug.cgi?id=4542
> > > 
> > > Since external-toolchain misses specifying libgcc as provided runtime library,
> > > dependency tree picks up either gcc-cross or even gcc-noemu...
> > 
> > This one seems ok to me. 
> 
> Thanks! Whom should I ping to get it commited?

I can do it.

> 
> -- 
> Denys
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


