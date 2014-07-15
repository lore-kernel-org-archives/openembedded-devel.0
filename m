Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 56BBB70199
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:02:15 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20140715110215751
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:02:15 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [69.196.158.250] (port=51482 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X70Us-0003k7-5m for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jul 2014 07:02:10 -0400
Date: Tue, 15 Jul 2014 07:02:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CA+gsK-p7rV+HmdcskYkU0MYRn1zesYDgOUb4raVcj6_xW9x_ag@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407150648350.4969@localhost>
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
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
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
X-List-Received-Date: Tue, 15 Jul 2014 11:02:23 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Jul 2014, Rudolf Streif wrote:

> >
> >
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
> Since image.bbclass also adds the debug-tweaks to the valid image feature
> list
>
> image.bbclass:IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"

  ... snip ...

  there's something i'll throw in here now that i'm thinking about it.
i've wondered about that very line above -- what is its purpose?

  as i read it, the primary purpose for the variable IMAGE_FEATURES is
to define packagegroups through the use of FEATURE_PACKAGES_* that you
see in core-image.bbclass. (so this is again a bit of weirdness where
code in image.bbclass refers up the "inheritance tree" to stuff found
in core-image.bbclass.)

  however, there are of course some IMAGE_FEATURES that don't
correspond directly to package groups; eg, package-management,
debug-tweaks, read-only-rootfs. so why is "package-management" not
listed in the line:

image.bbclass:IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"

is that variable flag supposed to list all valid, non-packagegroup
IMAGE_FEATURES?

  i can see that debug-tweaks is processed explicitly in
image.bbclass:

ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'

  but, then again, so is package-management:

ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"

  so why is debug-tweaks assigned to IMAGE_FEATURES[validitems] but
not package-management? oh, wait, i just noticed that image.bbclass
explicitly does this:

FEATURE_PACKAGES_package-management = "${ROOTFS_PKGMANAGE}"

so that package-management *will* be recognized as a valid image
feature here in image.bbclass:

def check_image_features(d):
    valid_features = (d.getVarFlag('IMAGE_FEATURES', 'validitems', True) or "").split()
    valid_features += d.getVarFlags('COMPLEMENTARY_GLOB').keys()
    for var in d:
       if var.startswith("PACKAGE_GROUP_"):
           bb.warn("PACKAGE_GROUP is deprecated, please use FEATURE_PACKAGES instead")
           valid_features.append(var[14:])
       elif var.startswith("FEATURE_PACKAGES_"):
           valid_features.append(var[17:])
    valid_features.sort()

  gaaaaaaaaah! i need more coffee ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


