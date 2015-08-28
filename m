Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id E353971633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 04:03:20 +0000 (UTC)
Received: by labnh1 with SMTP id nh1so211732lab.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 21:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WpIuqY+arzTdNQnLZrtE9KpQoI5rSHsY7ivO5GDxC+4=;
	b=Qx11HS3Du9p+7dzFj7NykyGemG8MBps2aQJXvKLRhf0xy3NEWlQ+iNoBno3PVOY0j8
	4UR9GOFzC/giAFmYHm2p5yFhJnvF62nIsxAb8Gya5XX30YMraoKmGztKUQXLrFHB7OJ7
	HvtpJqAEdYfgIPQymJXz3yg/wlCOVsJeQTBt+it3c3zz3E5t3vAe9nlbVduDLq0Tpog9
	Q6oDDGCqz293Sb8zqPGX7aLdth9gJ3kelAqTltk730TtUKO6FSGhl/6EzAZLrrj7p7aT
	ULCEPcLn9Q06qWuvhFCpoysmlVq2jjUBOaNG4OKo633WYbnTahjLEjqN4wObq3wGXW9V
	Hb+w==
MIME-Version: 1.0
X-Received: by 10.112.156.137 with SMTP id we9mr3811760lbb.110.1440734599618; 
	Thu, 27 Aug 2015 21:03:19 -0700 (PDT)
Received: by 10.25.89.74 with HTTP; Thu, 27 Aug 2015 21:03:19 -0700 (PDT)
In-Reply-To: <CAMKF1spG4MmH1BsJqh91H44GW5uPV9ny5DXk0utMR9+VAzpzhQ@mail.gmail.com>
References: <1440650132-10281-1-git-send-email-TicoTimo@gmail.com>
	<55DECD46.2020602@opendreambox.org>
	<CAMKF1spG4MmH1BsJqh91H44GW5uPV9ny5DXk0utMR9+VAzpzhQ@mail.gmail.com>
Date: Thu, 27 Aug 2015 21:03:19 -0700
Message-ID: <CANx9H-C3E6iBfSopgfHdh_KZdy7zuMrOnOXWzi39PZkUjoStXA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH] vlc: fix for libtool error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Aug 2015 04:03:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 8:50 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Aug 27, 2015 at 1:41 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
> >> +    sed -i -e
> s:'${top_builddir_slash}libtool':'${top_buildir_slash}'${TARGET_SYS}-libtool:g
> ${B}/doltlibtool
> >                                                               ^
> > this looks like a typo (missing d).
> >
>
> did not understand where 'd' should be, but I hope '' around
> ${top_builddir_slash} will avoid bitbake exapnding it.
> --
>

Correct.  Already submitted v2 patch:
http://patchwork.openembedded.org/patch/101809/


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

