Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 840CC6C23A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 15:24:23 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d71so1781226qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n4GyqNkMpc1x7tgDIVJls/mWQUo7TU+GYR2ALoWiuW8=;
	b=kcU6+mJDBuiVOcS2ZPE+Xe4NY2JtWNB3j3rIS0fxbS7HG8FD3VXxt/AXKClXqS0NhI
	+gM9+j2i1BPfMXa4jhjq1kebg+tK1zFK6Enfo9DN1lqESBtpBLSSbdX0+eeRTIuy/Tq3
	CZaqC7sqp1OtQIYy6PBCyvA35vADhIfOjHn+w2d3AMxmFFi6BtYbVBkj+SN6djrR8Say
	3A5E5HAw2uqWdpIj5IUypvQkoS5FBPSH8rYKrbwZyrZgUU9w1PljzItMb5IW8oflg0RN
	xaR8jEDuVTecihrYDl9g9BqBUijkT5SdEL5PB5ABE2CD1tkNVYZX+vseBGREUj0C/hcc
	rl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n4GyqNkMpc1x7tgDIVJls/mWQUo7TU+GYR2ALoWiuW8=;
	b=DZ72u9GbPzMCznAcHHUHs/qoumvofzstWHoxCJMoJPXdvXtCWa8jVKelcjS64cuI1g
	l6SlFP4aK+bPyh/VDd3cVuEc/CBPF4UFnKiPYqZhHbzjsqWNPzpZHDZwUp/qsQXjGey4
	e9D8RM5OENKEangkETA9UxaS5nwCPbJIvqzPYE6HlgGWGvkHCo1ARTSwgyNNy2F9RNUH
	jdyR86EKCYil5pGfN5+0ekgtTJZJ8wM5ZXj/gl1tjw3cnB8S6AzAn9L5tdiKD0dgWMNF
	M4yA70mqdi6SPtszT67prBKOCq37xjlY7I5Q0i2jGcR2hd+THYdgW/X/+ezEB2wpRmmu
	oQvA==
X-Gm-Message-State: APjAAAXE1UvrMz3WETiTi0A6SbRx8Hf8BmgO1boDhIMCtcHwKd47Ov19
	2I6ctTYxojziBTQoZ4CHo/oWIUXeI9KST+ApYjUa1Etu
X-Google-Smtp-Source: APXvYqzKNyee2dEu5zdbPHnVxbg10GMcmakd+kGA1rHg2ajWNBi0I/eeop39Qnb43I84uUeR95BoWI26HioWUKkrNYQ=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr18844969qkf.337.1576337063829; 
	Sat, 14 Dec 2019 07:24:23 -0800 (PST)
MIME-Version: 1.0
References: <20191212202252.2786262-1-raj.khem@gmail.com>
	<20191212202252.2786262-3-raj.khem@gmail.com>
	<20191213043716.GA30893@localhost>
	<CAMKF1so-nxHanPu6Nv3arQmSNoMyHwVj43+Myd6ZNeY=qVHU6A@mail.gmail.com>
	<20191213225815.GA8776@localhost>
	<c195b79f-5c33-69d8-ab72-d432254d78ef@gmail.com>
	<20191214142059.GE8776@localhost>
In-Reply-To: <20191214142059.GE8776@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Dec 2019 07:24:13 -0800
Message-ID: <CAMKF1so5pQDJZx2Gm=ktRRyh01w5SFy5L9FxCQbT5xjU+6gEgw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xterm: Fix latent issue found with musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Dec 2019 15:24:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 14, 2019 at 6:21 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Fri, Dec 13, 2019 at 09:55:49PM -0800, Khem Raj wrote:
> > On 12/13/19 2:58 PM, Adrian Bunk wrote:
> > > On Fri, Dec 13, 2019 at 01:55:33PM -0800, Khem Raj wrote:
> > > > On Thu, Dec 12, 2019 at 8:37 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > On Thu, Dec 12, 2019 at 12:22:52PM -0800, Khem Raj wrote:
> > > > ...
> > > > > > +_POSIX_SOURCE is app-defined not system
> > > > >
> > > > > This is true for musl, not for glibc.
> > > > >
> > > > > The handling of _POSIX_SOURCE and _POSIX_VERSION differs between
> musl
> > > > > and glibc due to glibc supporting older POSIX versions, and glibc
> also
> > > > > supporting developers of portable code to select some specific
> older
> > > > > POSIX version.
> > > > >
> > > > No thats not right.
> > > > _POSIX_SOURCE (like all FTMs) is
> > > > defined by the application to request a feature/standards profile
> > > > it's not libc telling you "this is posix" or anything like that.
> > >
> > > It is also defined when _POSIX_C_SOURCE is defined, or _GNU_SOURCE,
> > > or when the default non-strict gcc mode is used.
> > >
> > > The latter means that it is in practice nearly always defined when the
> > > libc supports applications written against older versions of POSIX.
> > >
> > but these macros are not used in this case so its irrelevant here.
>
> No macro has to be used, with gcc default settings _POSIX_SOURCE
> is defined:


Again this was what I said originally was not correct

>
>
> $ cat test.c
> #include <unistd.h>
> int tmp = _POSIX_SOURCE;
> $ gcc -O2 -Wall -c test.c
> $
>



> musl is different, since it does not aim at fully supporting
> applications that were written against an older version of
> the POSIX standard.
>
> > > > _POSIX_VERSION tells you that
> > > > ...
> > >
> > > _POSIX_VERSION being defined tells you that you have unistd.h included.
> > >
> > > With glibc the value of _POSIX_VERSION depends on what
> feature/standards
> > > profile the application has requested.
> >
> > I would not look into how glibc does something and call it standard.
>
> I would not look into how musl does something and call it standard.


Who said that effort is to find common solution

>
>
> I checked what musl and glibc do and what the standard says.
>
> > It guards these definitions by its internal defines ( prefixed with __)
> which
> > is internal to a libc implementation,  applications are not exposed to
> > private namespace.
>
> _POSIX_SOURCE is defined in POSIX.1-1990 and mentioned in later versions
> of POSIX.
>
> _POSIX_VERSION is defined in all(?) versions of POSIX.
>

Ok thank you

>
> cu
> Adrian
>

