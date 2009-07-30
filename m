Received: from [209.85.222.197] (helo=mail-pz0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MWaYZ-0006up-91
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 20:40:47 +0200
Received: by pzk35 with SMTP id 35so1202655pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 11:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=drhIiZ5qtrb5JjCqU/qn7GI0zMXLs77iC8GYtvY86uk=;
	b=PIMko8muYSvbvVKRnuTVFO+j60h8rSBZdHIL5hShraQQbbyvYWskl/duT+q5JP3Ahb
	7Wz71mgcRVuaKExu9IdQkLqKG09jcDkrpCVHubYH8b9KYmvq+LQHXrs8a5z/CAtOT9Lr
	QZmBeh55SXNmxVycTQk7IegK3KScs6vp5mgAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gSzGhhvnUPDOSfbfkfTcOW66uumDvmbNW1IMH7k/AkfXA6wcxO8lCKAADeGZLwC76F
	IHijQWl26Oi2Ctm3r0UBrRcv5AgMAmFUuIUz+gu82Ogk0E7s8SPPjDTDhtyNsTUQYpJd
	FfiUvfbudXG6F6J+aQnvjq+a736n/oe8jRMU8=
Received: by 10.114.182.5 with SMTP id e5mr869907waf.169.1248978342500;
	Thu, 30 Jul 2009 11:25:42 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-49.dsl.pltn13.sbcglobal.net
	[71.146.25.49])
	by mx.google.com with ESMTPS id k21sm3574575waf.59.2009.07.30.11.25.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 30 Jul 2009 11:25:41 -0700 (PDT)
Date: Thu, 30 Jul 2009 11:25:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090730182536.GA14686@gmail.com>
References: <20090728072202.GA5422@gmail.com>
	<200907290800.39598.holger+oe@freyther.de>
	<19c1b8a90907291055n67d716dh60fba8f064d99932@mail.gmail.com>
	<200907300935.16945.zecke@selfish.org>
MIME-Version: 1.0
In-Reply-To: <200907300935.16945.zecke@selfish.org>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [RFC] Adding TLS selection choice to metadata
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
X-List-Received-Date: Thu, 30 Jul 2009 18:40:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (30/07/09 09:35), Holger Freyther wrote:
> On Wednesday 29 July 2009 19:55:38 Khem Raj wrote:
> 
> > > To cite my patch:
> > >
> > > +# The tls/ntpl support in uclibc is work in progress. For the current
> > > +# targets we should build gcc with --enable-tls=no. In the future we
> > > +# might want to enable TLS for certain architectures and uclibc versions
> > > +# so this is why this method exists.
> > > +def get_gcc_uclibc_tls_setting(bb, d):
> > > +    return "--enable-tls=no"
> >
> > I was thinking of a case when say nptl is supported on mips
> > but someone still wants to build with linuxthreads. In your patch you
> > rely upon the target triplet to decide where to enable it and where
> > not to. 
> 
> In my patch I solely rely on the power of a turing complete language called 
> python. In this python method you can place a:
> 
>       if bb.data.getVar("TARGET_TLS", d, True)
>            return ""
> 
> and be done, in analogue to the FPU setting (hence it is right below the FPU 
> code). do you agree?

yes that will be ok. 

> 
> z.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


