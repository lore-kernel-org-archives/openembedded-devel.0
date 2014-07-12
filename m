Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id CCD4D70313
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 09:53:42 +0000 (UTC)
Received: from [99.240.204.5] (port=52525 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X5tzy-0004Qo-M3 for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jul 2014 05:53:42 -0400
Date: Sat, 12 Jul 2014 05:53:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAMKF1speMwTzKbLKm8hBXQ14ZgqmHSTKNUt-qS1sw14ac9iw4w@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407120541230.5275@localhost>
References: <alpine.LFD.2.11.1407111233360.5222@localhost>
	<CA+gsK-qzcd3fa=N1pUw3z46mP8DjP0V7sW3k8z79id2o3AtLsw@mail.gmail.com>
	<alpine.LFD.2.11.1407111829140.7344@localhost>
	<CAMKF1speMwTzKbLKm8hBXQ14ZgqmHSTKNUt-qS1sw14ac9iw4w@mail.gmail.com>
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
X-List-Received-Date: Sat, 12 Jul 2014 09:53:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 11 Jul 2014, Khem Raj wrote:

> >   i know, which is exactly what is so counter-intuitive with the way
> > the above is done. you can override those two variables, but not
> > CORE_IMAGE_BASE_INSTALL directly, it just seems silly.
>
> why do you want CORE_IMAGE_BASE_INSTALL to be overridable ? unless
> you want to construct image of your own completely from scratch but
> then why would you want to inherit properties from core-image class.

  one last post on this, then i'll move on -- i didn't want this to
become so involved.

  quite simply, even if you inherit from core-image, the setting of
CORE_IMAGE_BASE_INSTALL *is* overridable -- it's simply overridable in
a disgusting, grotesque, non-intuitive and incomprehensible way.

  i'm happy to leave core-image.bbclass the way it is, and i'll admit
that it works just fine as long as you recognize the crippled way it's
implemented. any base class that requires horrid code like this in an
inheriting class:

IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
inherit core-image

to allegedly *inherit* from core-image but still mangle the allegedly
really, really important value of CORE_IMAGE_BASE_INSTALL is just ...
wrong.

  so, i'm happy to leave things the way they are, knowing that in my
future OE/yocto courses, i will continue to introduce the section on
core images with the lead-in, "you're not going to *believe* what they
did here", after which students will, as always, be wiping their eyes
from laughter.

  and as forrest gump once said, "and that's all i have to say about
that."  carry on.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

