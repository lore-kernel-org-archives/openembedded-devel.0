Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id B41D36ACED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 19:06:01 +0000 (UTC)
Received: from [69.196.158.250] (port=50604 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6lZa-00060t-Rj for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jul 2014 15:06:02 -0400
Date: Mon, 14 Jul 2014 15:05:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407141457150.14590@localhost>
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
Subject: defining FEATURE_PACKAGES_* in core-image.bbclass vs image.bbclass
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
X-List-Received-Date: Mon, 14 Jul 2014 19:06:06 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i was perusing core-image.bbclass and noticed that the alleged list
of "Available IMAGE_FEATURES" didn't mention "splash" so i was going
to submit a simple patch to add a line for it, before i noticed
something that puzzled me.

  i know there are some features that don't correspond to packagegroup
names, and here's one from core-image.bbclass:

FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"

so that feature is clearly a "core image" feature. (i know the
meta-intel layer uses this feature.)

  then i noticed that the "splash" feature is defined, not in
core-image.bbclass, but in the more basic image.bbclass, as is
package-management:

FEATURE_PACKAGES_package-management = "${ROOTFS_PKGMANAGE}"
SPLASH ?= "psplash"
FEATURE_PACKAGES_splash = "${SPLASH}"

  so is there some rationale for deciding which FEATURE_PACKAGES
settings are defined in core-image, while others are defined in
image?

  i'll still add a line for splash to core-image.bbclass.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

