Received: from mail-yx0-f204.google.com ([209.85.210.204])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OASSE-00032o-P1
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 20:39:19 +0200
Received: by yxe42 with SMTP id 42so1148786yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 11:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ek1RHQK9Bd9z90kSO5KSrR38H+bpnLGSsIGQoHJMrAU=;
	b=Rsn9czjGgW6m+fLs4tCIiF17/bP83kbox5IfKo4iWFJUNAMaFvJyKzqgO1yp860NxC
	SYvpeKFt/0+Y3GDW2NI9KdA7obb62rGYVxNBuNhtGfV6/j/ZrZARh8EAC2hn74zZQbyz
	HhRgGCQEEHl6PUoGl5F5tkq3+VfV/hwHPyGTo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QkCBBrkSaqb1v2trEO6B01tlfFZ+EyAgOLGr+CvNRTOfN+YD/bKlF6Dop3gE7YYEAH
	qEjJap6nIL1z2Hra+vnGoPSdCgzIh+Q9mBPCYi8a/vqKXy1yLGyB6fnO1v77P9JREKVF
	+k14Gsn/BeQ5lR4PRSCjfLlCb4J+9zg1djzLU=
MIME-Version: 1.0
Received: by 10.231.166.77 with SMTP id l13mr166590iby.63.1273257328197; Fri, 
	07 May 2010 11:35:28 -0700 (PDT)
Received: by 10.231.39.73 with HTTP; Fri, 7 May 2010 11:35:27 -0700 (PDT)
In-Reply-To: <1273249791.457.334.camel@trini-m4400>
References: <1273249791.457.334.camel@trini-m4400>
Date: Fri, 7 May 2010 11:35:27 -0700
Message-ID: <g2j19c1b8a91005071135v23d9be10u641a7cae622ec@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.204
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: mpc8315e-rdb (ppc e300c3) failure
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
X-List-Received-Date: Fri, 07 May 2010 18:39:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 7, 2010 at 9:29 AM, Tom Rini <tom_rini@mentor.com> wrote:
> Hey all,
>
> With DISTRO=minimal and MACHINE=mpc8315e-rdb, I see the following
> failure in virtual/libc (using fe4ff6940b06c73d5b88224b99750bf65accf13d
> in oe.dev): http://pastebin.com/44pdUFqt and I confirmed this prior to
> the RP merge, so this is unrelated.

undefined reference to `_restfpr_14_x'
this is because we use -Os to compile the C startup code. with Os ppc gcc
generates these function calls and these functions are in libgcc as well but the
problem is that in the default link order
crtend.o appears after -lgcc and its linking with libgcc.a so it does not have
the undefined reference and it does not pull the object out of libgcc and hence
linking fails.

The right solution is to compile crtstuff always with -O2 it does not
bloat the size
as its only 2-3 small functions plus it gets us going forward.

If we used -O2 to compile everything you wont see this error.

I will try to fix it when I have time.

Thanks
-Khem


>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


