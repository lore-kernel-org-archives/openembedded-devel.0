Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 990E570252
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 23:22:22 +0000 (UTC)
Received: from [99.240.204.5] (port=36946 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6pZf-0006kL-N8 for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jul 2014 19:22:23 -0400
Date: Mon, 14 Jul 2014 19:22:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <CA+gsK-p7rV+HmdcskYkU0MYRn1zesYDgOUb4raVcj6_xW9x_ag@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407141919070.5707@localhost>
References: <alpine.LFD.2.11.1407141457150.14590@localhost>
	<CA+gsK-p7rV+HmdcskYkU0MYRn1zesYDgOUb4raVcj6_xW9x_ag@mail.gmail.com>
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
Subject: Re: defining FEATURE_PACKAGES_* in core-image.bbclass vs image.bbclass
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
X-List-Received-Date: Mon, 14 Jul 2014 23:22:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Jul 2014, Rudolf Streif wrote:

> >   then i noticed that the "splash" feature is defined, not in
> > core-image.bbclass, but in the more basic image.bbclass, as is
> > package-management:
> >
> > FEATURE_PACKAGES_package-management = "${ROOTFS_PKGMANAGE}"
> > SPLASH ?= "psplash"
> > FEATURE_PACKAGES_splash = "${SPLASH}"
> >
> > And then there is debug-tweaks for which the hooks are defined in
> image.bbclass including the function zap_empty_root_password but the
> post-processing is added to the variable by core-image.bbclass:
>
> core-image.bbclass: ROOTFS_POSTPROCESS_COMMAND +=
> '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "",
> "zap_empty_root_password ; ",d)}'
>
> Since image.bbclass also adds the debug-tweaks to the valid image
> feature list
>
> image.bbclass:IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
>
> my inclination would be to move the addition to ROOTFS_POSTPROCESS_COMMAND
> from core-image.bbclass to image.bbclass.
>
> The image feature readonly-rootfs is also added to the valid list by
> image.bbclass.

  i didn't notice the rest of these as i stopped looking after the
splash example and thought i'd ask about it.

> Consequently this makes the image features splash, debug-tweaks,
> package-management, splash and readonly-rootfs available to image
> recipes that inherit image.bbclass while h/w codecs and others are
> added by core-image.bbclass and are only available when an image
> recipe inherits core-image.

  is there something special about hwcodecs that suggests it should
stay in core-image rather than moving to image as well? i'm just
trying to understand the rationale.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

