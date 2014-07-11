Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5C55270200
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 18:30:07 +0000 (UTC)
Received: from [99.240.204.5] (port=46596 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X5faC-0005iA-TL for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2014 14:30:08 -0400
Date: Fri, 11 Jul 2014 14:30:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <CA+gsK-q9aK49C5s7H3uzXxYnWSsU3pBmWzip-kOiaTuJhJgvTw@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407111423001.4101@localhost>
References: <alpine.LFD.2.11.1407111114310.25692@localhost>
	<CA+gsK-q9aK49C5s7H3uzXxYnWSsU3pBmWzip-kOiaTuJhJgvTw@mail.gmail.com>
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
Subject: Re: a bit of pedantry about core images
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
X-List-Received-Date: Fri, 11 Jul 2014 18:30:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 11 Jul 2014, Rudolf Streif wrote:

> Hi Robert,
>
>
> >   documenting some stuff about core images and a few quick questions.
> > first, in core-image.bbclass:
> >
> > # By default we install packagegroup-core-boot and packagegroup-base
> > packages - this gives us
> > # working (console only) rootfs.
> >
> >   actualliy, not quite true:
> >
> > CORE_IMAGE_BASE_INSTALL = '\
> >     packagegroup-core-boot \
> >     packagegroup-base-extended \        <------
> >
> > so that comment just needs to be fixed, i can take care of that.
> >

> Kind of. You can look at it either way. packagegroup-base.bb defines
> a whole bunch of package groups that depend on each other.
> packagegroup-base-extended depends on all of them hence adding it to
> an image will add all of them.

  um ... ok, i'll check that, thanks.

> >   next, i've always cringed at this bit of code:
> >
> >   CORE_IMAGE_BASE_INSTALL = '\
> >     packagegroup-core-boot \
> >     packagegroup-base-extended \
> >     \
> >     ${CORE_IMAGE_EXTRA_INSTALL} \
> >     '
> >
> >   CORE_IMAGE_EXTRA_INSTALL ?= ""
> >
> >   IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> >
> > could that not just be written as:
> >
> >   CORE_IMAGE_EXTRA_INSTALL ?= ""
> >
> >   CORE_IMAGE_BASE_INSTALL = '\
> >     packagegroup-core-boot \
> >     packagegroup-base-extended \
> >     '
> >
> >   IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}" ${CORE_IMAGE_EXTRA_INSTALL}
> >
> > Yes, I agree, that is much cleaner but you have to place the quotes
> correctly.

  i realized what i had done the instant i hit "SEND". so ...

IMAGE_INSTALL ?= "\
      ${CORE_IMAGE_BASE_INSTALL} \
      ${CORE_IMAGE_EXTRA_INSTALL} \
      "

does that look right? any objections?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

