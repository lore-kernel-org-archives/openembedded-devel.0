Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D7231701D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:34:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2014 02:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,657,1400050800"; d="scan'208";a="572724623"
Received: from snaufer-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.80])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2014 02:34:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Jul 2014 10:34:32 +0100
Message-ID: <2597354.DlVRPly8Em@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1407111233360.5222@localhost>
References: <alpine.LFD.2.11.1407111233360.5222@localhost>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 14 Jul 2014 09:34:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Friday 11 July 2014 12:51:54 Robert P. J. Day wrote:
>   some observations/questions on core-image.bbclass, and whether it
> can be used more understandably. this is being written from the
> perspective of someone who has had the occasional student ask, "why
> was it done *that* way?"
> 
>   so here's the important part of core-image.bbclass:
> 
> CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \
>     \
>     ${CORE_IMAGE_EXTRA_INSTALL} \
>     '
> 
> CORE_IMAGE_EXTRA_INSTALL ?= ""
> 
> IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> 
> inherit image
> 
>   whose job is obviously to define the final contents in IMAGE_INSTALL
> to be handed off to image.bbclass. so far, so good. but notice first
> that while IMAGE_INSTALL and CORE_IMAGE_EXTRA_INSTALL are weakly
> assigned, CORE_IMAGE_BASE_INSTALL is *not*, which -- if one is
> perusing that file -- strongly suggests that if you're inheriting
> from this class file, you really should use that value. but it doesn't
> work that way.
> 
>   first, here's (the relevant parts of) core-image-base.bb:
> 
> IMAGE_FEATURES += "splash"
> inherit core-image
> 
>   that's perfect -- define an additional feature, then pull in
> core-image to take care of the rest. perfectly understandable.
> 
>   core-image-minimal.bb is *not* so clean:
> 
> IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}
> ${CORE_IMAGE_EXTRA_INSTALL}"
> inherit core-image
> 
>   i consider this recipe file potentially confusing since, although it
> inherits core-image, it effectively stomps on the settings in there,
> and just rams an overriding value into IMAGE_INSTALL. in short, rather
> than "inheriting" cleanly from core-image and extending or enhancing
> the recipe, core-image-mimimal simply kicks IMAGE_INSTALL out of the
> way and sets its own final value.

As core-image.bbclass currently works, it core-image-minimal must do this; 
otherwise you'll get packagegroup-base-extended in the image and the name 
"minimal" won't be true anymore. If on the other hand you inherit image 
instead of core-image then you won't be able to use the IMAGE_FEATURES 
definitions that core-image.bbclass defines.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

