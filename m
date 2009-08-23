Received: from [209.85.222.185] (helo=mail-pz0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mf7E4-0007zT-1f
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 09:10:52 +0200
Received: by pzk15 with SMTP id 15so500157pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 23:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rp5Yn2U2L0EjQRgwcQdPijR7wCOkIheqyj/UAoTeyQ8=;
	b=XeOr7cY7wyJkCO8yYgmfqULfMoaNNkYzyEyL5IQWzR81vZKu2CKioFDgwG0bWiZQYh
	oG+CGLtBPvKg7MaXhDfm2k3INk4jwbMAHMrCjwe2But3DKB6Z21NNspPzl2CvEKMOmCz
	Lqr9YolbSVOrQBkyYSqnRmwM/GYyjki+SJGBY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=W3MOYTMysxixZNgtDT5988bFrOkNCwA1F+oZG89y3WXb+in3LsCHbSmWESTjmW70um
	cTui4HsVX+KKnKng/Iks3ws828w3iPO2+1pqqs6EviVaVwXtGfZpVfkxnrT5p9S9Q5i5
	KrASpv1ATco8B6qC8AY7aSi3DVrDEh4NMh+Sk=
Received: by 10.114.6.3 with SMTP id 3mr4751188waf.166.1251010394238;
	Sat, 22 Aug 2009 23:53:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id m34sm5923097waf.5.2009.08.22.23.53.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 22 Aug 2009 23:53:13 -0700 (PDT)
Date: Sat, 22 Aug 2009 23:53:05 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090823065305.GA6361@gmail.com>
References: <4A8D4947.5030108@gmail.com>
	<200908201526.46349.holger+oe@freyther.de>
	<4A8D98FB.5000400@gmail.com>
	<200908210343.48652.holger+oe@freyther.de>
	<4A8F9BE3.1020606@gmail.com> <4A8FA20F.5050401@gmail.com>
	<20090822231735.GA12848@gmail.com> <4A90C2F4.1010300@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4A90C2F4.1010300@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Sun, 23 Aug 2009 07:10:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/08/09 10:17), Dmitry Vinokurov wrote:
> >>>ERROR: '/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb'
> >>>failed
> >>>--------
> >>>
> >>>I.e. bitbake again confused cross-gcc and x86-gcc. Updated my OE
> >>>with git pull, removed tmp/ and made rebuild -- same result.
> >>Looks like error is in wrong ./configure parameter:
> >>--host=i686-linux instead of --host=arm-oe-linux-gnueabi .
> >>Now I'm trying to find, why --host was set to i686 and where it can
> >>be changed.
> >
> >its a cross package so host being i686-linux (I suppose you are building
> >on i686 box) is ok. Look into the config.log error message should be in
> >there
> >
> >-Khem
> Hm, "configure --help" says "--host=HOST cross-compile to build
> programs to run on HOST [BUILD]" and as I understand, I will run
> programs on ARM, so it should be 'arm-oe-linux-gnueabi'.
> 
> Anyway, even if host should be x86, instead of i686-linux-gcc it
> finds arm-vfp-linux-gcc and fails.

dont confuse pure cross with canadian cross. You are doing a normal
cross build here which means build machine is same as host machine.

Your problem is probably because you are overriding CC and friends
which could be confusing (already confused) configure even more.

Try setting CC_FOR_BUILD=<your native compiler on the build machine>

Thanks

-Khem


