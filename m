Return-Path: <k.kozlowski.k@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8311177DCA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 18:41:32 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id 77so1014826wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 11:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xp30QMwSUvwU/xT9BwCUc60+U+cNQSyZWtAKJmfViEY=;
	b=IsrCSjfRxo1FMmbVU7kNyqRh9SUtDmPyxLrwRyw5FDbx4h6foysbCVCzISU3mdscDJ
	FIzqp7LIggl3Eu1rdhfCjAu4agX8IwetFKqgUabMcmiW+H0tDo/U9LwqFaulXk1bFPRT
	h3d41BM02n9HKNDKGkNicujT4h/PiSNzG1pjRZusThhTdO1Y/gTbHTVEtiRM3O3mZADO
	S8GRrwiqXaSNaHWVGjmmxPDWt/8gTjPjf8PNWAPZSzWg1NkBNMF1kzY2e5OTGImomT2M
	s9ET0sMA0iwrLcfBmskOyT7C+Je5xm9/iF36H/BX6rQciqClEf5B7/aft/A3W+OErO1G
	XDCA==
X-Gm-Message-State: AIVw1109ZU8L1bVk8YBd/KAljrOXg5E/ZJbEhPnCXe+sl0bFZ2v0c3XL
	RMUzi4/pVk6Afg==
X-Received: by 10.80.143.163 with SMTP id y32mr3550836edy.103.1499798493205;
	Tue, 11 Jul 2017 11:41:33 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	w23sm41087edb.22.2017.07.11.11.41.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jul 2017 11:41:32 -0700 (PDT)
Date: Tue, 11 Jul 2017 20:41:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170711184131.tadrysrr5meyjw42@kozik-lap>
References: <20170709162934.21355-1-krzk@kernel.org>
	<CA+chaQfYB8ONFeTgGsq_kBsLOjAUcfY5y_roReYdL1gMo7B_6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfYB8ONFeTgGsq_kBsLOjAUcfY5y_roReYdL1gMo7B_6Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 11 Jul 2017 18:41:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 11, 2017 at 02:28:45PM +0200, Martin Jansa wrote:
> Please use 4 spaces for indentation

Sure, I'll fix it.

> and the service file doesn't exist
> causing build to fail as in:
> http://errors.yoctoproject.org/Errors/Details/147258/

Weird... It builds fine on core-image-minimal and sato. Also, after
building sato I can see it under /usr/lib/systemd/system/devmon@.service

Best regards,
Krzysztof

> 
> On Sun, Jul 9, 2017 at 6:29 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > udevil is a command line Linux program which mounts and unmounts
> > removable devices without a password.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../0001-udevil-0.4.3-fix-compile-with-gcc6.patch  | 12 ++++++++++
> >  .../recipes-utils/udevil/udevil_0.4.4.bb           | 28
> > ++++++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 meta-filesystems/recipes-utils/udevil/files/0001-
> > udevil-0.4.3-fix-compile-with-gcc6.patch
> >  create mode 100644 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> >
> > diff --git a/meta-filesystems/recipes-utils/udevil/files/0001-
> > udevil-0.4.3-fix-compile-with-gcc6.patch b/meta-filesystems/recipes-
> > utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
> > new file mode 100644
> > index 000000000000..355e93a37b3b
> > --- /dev/null
> > +++ b/meta-filesystems/recipes-utils/udevil/files/0001-
> > udevil-0.4.3-fix-compile-with-gcc6.patch
> > @@ -0,0 +1,12 @@
> > +Fix compilation with GCC6
> > +
> > +--- a/src/device-info.c        2013-12-09 14:59:27.000000000 +0100
> > ++++ b/src/device-info.c        2017-03-13 07:06:25.506666680 +0100
> > +@@ -3,6 +3,7 @@
> > +  * contains code excerpts from udisks v1.0.4
> > + **************************************************************************
> > */
> > +
> > ++#include <sys/stat.h>
> > + #include "device-info.h"
> > +
> > + static char *
> > diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> > b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> > new file mode 100644
> > index 000000000000..4ad4a09ed717
> > --- /dev/null
> > +++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY = "A command line Linux program which mounts and unmounts
> > removable devices"
> > +HOMEPAGE = "http://ignorantguru.github.io/udevil/"
> > +
> > +DEPENDS = "glib-2.0 \
> > +           glib-2.0-native \
> > +           intltool-native \
> > +           udev \
> > +"
> > +RDEPENDS_${PN} = "glib-2.0 \
> > +                  udev \
> > +"
> > +
> > +LICENSE = "GPL-3.0"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > +
> > +inherit autotools pkgconfig systemd
> > +
> > +SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${
> > PV}/udevil-${PV}.tar.xz \
> > +           file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
> > +"
> > +
> > +SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
> > +SRC_URI[sha256sum] = "ce8c51fd4d589cda7be56e75b42188
> > deeb258c66fc911a9b3a70a3945c157739"
> > +
> > +SYSTEMD_SERVICE_${PN} = "devmon@.service"
> > +SYSTEMD_AUTO_ENABLE = "disable"
> > +
> > +FILES_${PN} += " ${libdir}/systemd/system/devmon@.service"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

