Return-Path: <k.kozlowski.k@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB6978088
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 18:56:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p204so6855445wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 11:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cDLxlW2HIWSiiMMnSDKeuhLWKbi3fu21RvhP9CsAv6Y=;
	b=R47a8yy/Mle3LHFhUdo0MB3TA6FwTpLO8f0CTVDI08w7FYPBD1UfTaSjUGyrQ8UJdX
	XWuXL6aX4DaccLuhjkWyU+W8NyiiAgbqwRnIAclXqeU61bCohYRcQjRfQkdkX8KNXra0
	f8PMpAkO+3PohfzpyUok5gs+CUUh3XH66nS80XlMBOZ3lppzur3L32lxAHlrtW/YhEVH
	UyzPKYiUir6qYQFBDr13nTCM5ftOFR1z76hSrcTVdGczH29uobh91cpYRbp4ajR86DAv
	2lVKXfxMFNTwLkzGnFyanrJ1u6VNvAqPjChF9mDFm+8S/l5uvE1j9iwSVB+VDVsB80Qk
	Vq3Q==
X-Gm-Message-State: AIVw110CujIdIpscNORQXwL5GxSjuR+QTUQMtb2CaF7UWbmnnl5CoafF
	3cW9HXqcLAm2snv6JRo=
X-Received: by 10.80.147.79 with SMTP id n15mr4036121eda.84.1499972178528;
	Thu, 13 Jul 2017 11:56:18 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	s4sm3601957edd.28.2017.07.13.11.56.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Jul 2017 11:56:17 -0700 (PDT)
Date: Thu, 13 Jul 2017 20:56:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20170713185616.q2dishkx4tsbsjok@kozik-lap>
References: <20170709162934.21355-1-krzk@kernel.org>
	<CAJ86T=XFYb5NJD2VxsVra1KbR0eT9RhkPMefu8eNLWU3N9XhiA@mail.gmail.com>
	<20170711200829.xbjjqrvfld3ejpic@kozik-lap>
	<CAJ86T=WaAXxV9JqyoBGKhRzKtdzuYB15Qy7vXeo63xwsLL=VGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WaAXxV9JqyoBGKhRzKtdzuYB15Qy7vXeo63xwsLL=VGA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] recipes-utils: Add recipe for udevil
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
X-List-Received-Date: Thu, 13 Jul 2017 18:56:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 11, 2017 at 02:02:05PM -0700, Andre McCurdy wrote:
> On Tue, Jul 11, 2017 at 1:08 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Tue, Jul 11, 2017 at 12:33:27PM -0700, Andre McCurdy wrote:
> >> On Sun, Jul 9, 2017 at 9:29 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> > udevil is a command line Linux program which mounts and unmounts
> >> > removable devices without a password.
> >> >
> >> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >> > ---
> >> >  .../0001-udevil-0.4.3-fix-compile-with-gcc6.patch  | 12 ++++++++++
> >> >  .../recipes-utils/udevil/udevil_0.4.4.bb           | 28 ++++++++++++++++++++++
> >> >  2 files changed, 40 insertions(+)
> >> >  create mode 100644 meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
> >> >  create mode 100644 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> >> >
> >> > diff --git a/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
> >> > new file mode 100644
> >> > index 000000000000..355e93a37b3b
> >> > --- /dev/null
> >> > +++ b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
> >> > @@ -0,0 +1,12 @@
> >> > +Fix compilation with GCC6
> >> > +
> >> > +--- a/src/device-info.c        2013-12-09 14:59:27.000000000 +0100
> >> > ++++ b/src/device-info.c        2017-03-13 07:06:25.506666680 +0100
> >> > +@@ -3,6 +3,7 @@
> >> > +  * contains code excerpts from udisks v1.0.4
> >> > + ************************************************************************** */
> >> > +
> >> > ++#include <sys/stat.h>
> >> > + #include "device-info.h"
> >> > +
> >> > + static char *
> >> > diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> >> > new file mode 100644
> >> > index 000000000000..4ad4a09ed717
> >> > --- /dev/null
> >> > +++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> >> > @@ -0,0 +1,28 @@
> >> > +SUMMARY = "A command line Linux program which mounts and unmounts removable devices"
> >> > +HOMEPAGE = "http://ignorantguru.github.io/udevil/"
> >> > +
> >> > +DEPENDS = "glib-2.0 \
> >> > +           glib-2.0-native \
> >> > +           intltool-native \
> >> > +           udev \
> >> > +"
> >> > +RDEPENDS_${PN} = "glib-2.0 \
> >> > +                  udev \
> >>
> >> Runtime dependencies on libraries are detected automatically so
> >> explicitly setting RDEPENDS like this shouldn't be required.
> >
> > I'll remove glib then.
> >
> >>
> >> > +"
> >> > +
> >> > +LICENSE = "GPL-3.0"
> >> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >> > +
> >> > +inherit autotools pkgconfig systemd
> >> > +
> >> > +SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${PV}/udevil-${PV}.tar.xz \
> >> > +           file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
> >> > +"
> >> > +
> >> > +SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
> >> > +SRC_URI[sha256sum] = "ce8c51fd4d589cda7be56e75b42188deeb258c66fc911a9b3a70a3945c157739"
> >> > +
> >> > +SYSTEMD_SERVICE_${PN} = "devmon@.service"
> >> > +SYSTEMD_AUTO_ENABLE = "disable"
> >> > +
> >> > +FILES_${PN} += " ${libdir}/systemd/system/devmon@.service"
> >>
> >> Setting SYSTEMD_SERVICE_${PN} should be enough to ensure that the
> >> service file gets packaged correctly, so explicitly adding it to
> >> FILES_${PN} like this shouldn't be required.
> >
> > Without it, bitbake complains:
> > WARNING: udevil-0.4.4-r0 do_package: QA Issue: udevil: Files/directories were installed but not shipped in any package:
> >   /usr/lib
> >   /usr/lib/systemd
> >   /usr/lib/systemd/system
> >   /usr/lib/systemd/system/devmon@.service
> >
> > I wonder if this is related to differences in systemd in my build
> > setting which are leading to error:
> > http://errors.yoctoproject.org/Errors/Details/147258/
> 
> It looks like udevil installs the service file in a hardcoded path
> under ${libdir} rather than respecting ${systemd_unitdir} as defined
> by the distro:
> 
>   https://github.com/IgnorantGuru/udevil/blob/master/etc/Makefile.am
>   https://github.com/IgnorantGuru/udevil/tree/master/etc/systemd
> 
> so some patching or sed fix-ups and moving files in do_install() is
> going to be required to cover cases where the two don't align.
> 
> > I tried DISTRO=poky and DISTRO=nodistro and I cannot reproduce error
> > above (with FILES both are working fine).
> 
> If you look in meta/classes/systemd.bbclass ->
> systemd_check_services() you should see the paths which are searched
> to find the service files defined via SYSTEMD_SERVICE_${PN}. From
> there you should be able to determine why your build appears to find
> the service file somewhere in these search paths and doesn't hit the
> fatal error.

Thanks for hints! I found out that entire systemd_populate_packages()
was ignored because of missing systemd feature. Now I have the same
error as reported.

Best regards,
Krzysztof


