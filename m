Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id A68426AC9D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 22:30:21 +0000 (UTC)
Received: from [99.240.204.5] (port=48541 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X5jKg-0006HN-4q for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2014 18:30:22 -0400
Date: Fri, 11 Jul 2014 18:30:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CA+gsK-qzcd3fa=N1pUw3z46mP8DjP0V7sW3k8z79id2o3AtLsw@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407111829140.7344@localhost>
References: <alpine.LFD.2.11.1407111233360.5222@localhost>
	<CA+gsK-qzcd3fa=N1pUw3z46mP8DjP0V7sW3k8z79id2o3AtLsw@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: the awkwardness of using core-image.bbclass
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
X-List-Received-Date: Fri, 11 Jul 2014 22:30:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 11 Jul 2014, Rudolf Streif wrote:

> Hi Robert,
>
>
>
> >   some observations/questions on core-image.bbclass, and whether it
> > can be used more understandably. this is being written from the
> > perspective of someone who has had the occasional student ask, "why
> > was it done *that* way?"
> >
> >   so here's the important part of core-image.bbclass:
> >
> > CORE_IMAGE_BASE_INSTALL = '\
> >     packagegroup-core-boot \
> >     packagegroup-base-extended \
> >     \
> >     ${CORE_IMAGE_EXTRA_INSTALL} \
> >     '
> >
> > CORE_IMAGE_EXTRA_INSTALL ?= ""
> >
> > IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> >
> > inherit image
> >
> >   whose job is obviously to define the final contents in IMAGE_INSTALL
> > to be handed off to image.bbclass. so far, so good. but notice first
> > that while IMAGE_INSTALL and CORE_IMAGE_EXTRA_INSTALL are weakly
> > assigned, CORE_IMAGE_BASE_INSTALL is *not*, which -- if one is
> > perusing that file -- strongly suggests that if you're inheriting
> > from this class file, you really should use that value. but it doesn't
> > work that way.
> >
> > Consider CORE_IMAGE_BASE_INSTALL as a default value for IMAGE_INSTALL.
> It's internal to the core-image class only. Hence, it makes sense for it to
> be directly assigned. It is not meant to be used by any other classes or
> recipes. With the default value the most simple recipe you can write to use
> the core-image class is:
>
> myimage.bb:
>    inherit core-image
>
> which will produce an image that boots to the console and include
> hardware support if so defined by machine and distro features.
>
> IMAGE_INSTALL and CORE_IMAGE_EXTRA_INSTALL are meant to be
> overwritten by image recipes and configuration files.

  i know, which is exactly what is so counter-intuitive with the way
the above is done. you can override those two variables, but not
CORE_IMAGE_BASE_INSTALL directly, it just seems silly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

