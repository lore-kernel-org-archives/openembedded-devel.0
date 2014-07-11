Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id ABE0165F0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 16:52:04 +0000 (UTC)
Received: from [69.196.158.250] (port=37172 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X5e3J-0001zk-Ao for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2014 12:52:05 -0400
Date: Fri, 11 Jul 2014 12:51:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407111233360.5222@localhost>
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
Subject: the awkwardness of using core-image.bbclass
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
X-List-Received-Date: Fri, 11 Jul 2014 16:52:07 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  some observations/questions on core-image.bbclass, and whether it
can be used more understandably. this is being written from the
perspective of someone who has had the occasional student ask, "why
was it done *that* way?"

  so here's the important part of core-image.bbclass:

CORE_IMAGE_BASE_INSTALL = '\
    packagegroup-core-boot \
    packagegroup-base-extended \
    \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    '

CORE_IMAGE_EXTRA_INSTALL ?= ""

IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"

inherit image

  whose job is obviously to define the final contents in IMAGE_INSTALL
to be handed off to image.bbclass. so far, so good. but notice first
that while IMAGE_INSTALL and CORE_IMAGE_EXTRA_INSTALL are weakly
assigned, CORE_IMAGE_BASE_INSTALL is *not*, which -- if one is
perusing that file -- strongly suggests that if you're inheriting
from this class file, you really should use that value. but it doesn't
work that way.

  first, here's (the relevant parts of) core-image-base.bb:

IMAGE_FEATURES += "splash"
inherit core-image

  that's perfect -- define an additional feature, then pull in
core-image to take care of the rest. perfectly understandable.

  core-image-minimal.bb is *not* so clean:

IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
inherit core-image

  i consider this recipe file potentially confusing since, although it
inherits core-image, it effectively stomps on the settings in there,
and just rams an overriding value into IMAGE_INSTALL. in short, rather
than "inheriting" cleanly from core-image and extending or enhancing
the recipe, core-image-mimimal simply kicks IMAGE_INSTALL out of the
way and sets its own final value.

  a final issue is, if you define a new core-image variation and
simply want to add some extra packages to it, what's the proper way to
do that? at first glance, i might have just created a new .bb file and
assigned some extra package names to CORE_IMAGE_EXTRA_INSTALL,
wouldn't that work? but the ref manual states quite clearly that you
are supposed to use that variable *only* in your local.conf file? any
reason for that?

  as i read it, the accepted way is to use:

IMAGE_INSTALL += "mtd-utils"

but is there some reason one can't use CORE_IMAGE_EXTRA_INSTALL from
within a recipe file? it seems like that would make recipe files
easier to read.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

