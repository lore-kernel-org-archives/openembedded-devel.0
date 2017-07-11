Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE12780B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 21:02:04 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z45so1044591wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nVGm5Kh8gsV1VZnzdMOMjc2YCYiUyaUmXq/krKyrpuE=;
	b=cmB9J+UnnZOsc8Z2JGDEZ/Y8kFGpW1Taq34DpGRLABRXqiTN9Mp0kdhafVpDj4uKkB
	0u79dxhU+4nUzJEyhZODG+oMXDGnJ7lGWVX3jvUJCZMH0ryEXmv6smPvrEgn9Pf7/SeI
	eBnS+JLSH85dJ/I8QXMPzcw75w92/VkPCMvfDC1Gws7x2tiIJvONzUbbUsoh8IXzKcfd
	BS7PQkI5VzsbG2HEB6FaA+vM+9OQfA0IG5AIw85jZeATcaTy/+gNKkcDM/AkN4SF7hxr
	CVuxpkY6EPZaIxOAK9OwISk75TaRTlh81d2fDolfUtgbdvvPpkw+zcE/EaFPyGtF3OOo
	c89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nVGm5Kh8gsV1VZnzdMOMjc2YCYiUyaUmXq/krKyrpuE=;
	b=BOdxsWqEn1jxFupFwBeL72gIu0d1Xr/yg/HAR4pRbQuI1zUVoGzh70hEBnitXVK0x+
	FBiD2c+Fdc/dpw2qJXUO+zdnYZGAK1jENH8VpOiFD1pchyDlHWF5f347yVUdTi343Ivq
	7An55gtY75nMyx9JPUHha4ilZtYC66Tz7LuzfYpuktQMN2kp7KND7mOcPEYoH2aOvvnI
	TjgQNx0xhscFxNqOYgvuTCUOurYzvFAMRkyORF8MFNKiqNwUrwjlf4Kn5YaLP36JplDZ
	ovNNWNy+vt02ryn09/nuj2LDRk14U2OCWYOK3HKVnrfZa74rGd7/8o3h1YHXy0XWSKgm
	uEpQ==
X-Gm-Message-State: AIVw113p+H8YcnK05RkYzb0ATE02cm9g+LLZe9PZ8r0RodK1qMjQd2uW
	00EIeRqzxFOKaYLABUJh8BIW+9lt4Pya
X-Received: by 10.223.172.15 with SMTP id v15mr1013918wrc.84.1499806925599;
	Tue, 11 Jul 2017 14:02:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.170 with HTTP; Tue, 11 Jul 2017 14:02:05 -0700 (PDT)
In-Reply-To: <20170711200829.xbjjqrvfld3ejpic@kozik-lap>
References: <20170709162934.21355-1-krzk@kernel.org>
	<CAJ86T=XFYb5NJD2VxsVra1KbR0eT9RhkPMefu8eNLWU3N9XhiA@mail.gmail.com>
	<20170711200829.xbjjqrvfld3ejpic@kozik-lap>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 11 Jul 2017 14:02:05 -0700
Message-ID: <CAJ86T=WaAXxV9JqyoBGKhRzKtdzuYB15Qy7vXeo63xwsLL=VGA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
X-List-Received-Date: Tue, 11 Jul 2017 21:02:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 1:08 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Jul 11, 2017 at 12:33:27PM -0700, Andre McCurdy wrote:
>> On Sun, Jul 9, 2017 at 9:29 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> > udevil is a command line Linux program which mounts and unmounts
>> > removable devices without a password.
>> >
>> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> > ---
>> >  .../0001-udevil-0.4.3-fix-compile-with-gcc6.patch  | 12 ++++++++++
>> >  .../recipes-utils/udevil/udevil_0.4.4.bb           | 28 ++++++++++++++++++++++
>> >  2 files changed, 40 insertions(+)
>> >  create mode 100644 meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
>> >  create mode 100644 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
>> >
>> > diff --git a/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
>> > new file mode 100644
>> > index 000000000000..355e93a37b3b
>> > --- /dev/null
>> > +++ b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
>> > @@ -0,0 +1,12 @@
>> > +Fix compilation with GCC6
>> > +
>> > +--- a/src/device-info.c        2013-12-09 14:59:27.000000000 +0100
>> > ++++ b/src/device-info.c        2017-03-13 07:06:25.506666680 +0100
>> > +@@ -3,6 +3,7 @@
>> > +  * contains code excerpts from udisks v1.0.4
>> > + ************************************************************************** */
>> > +
>> > ++#include <sys/stat.h>
>> > + #include "device-info.h"
>> > +
>> > + static char *
>> > diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
>> > new file mode 100644
>> > index 000000000000..4ad4a09ed717
>> > --- /dev/null
>> > +++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
>> > @@ -0,0 +1,28 @@
>> > +SUMMARY = "A command line Linux program which mounts and unmounts removable devices"
>> > +HOMEPAGE = "http://ignorantguru.github.io/udevil/"
>> > +
>> > +DEPENDS = "glib-2.0 \
>> > +           glib-2.0-native \
>> > +           intltool-native \
>> > +           udev \
>> > +"
>> > +RDEPENDS_${PN} = "glib-2.0 \
>> > +                  udev \
>>
>> Runtime dependencies on libraries are detected automatically so
>> explicitly setting RDEPENDS like this shouldn't be required.
>
> I'll remove glib then.
>
>>
>> > +"
>> > +
>> > +LICENSE = "GPL-3.0"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> > +
>> > +inherit autotools pkgconfig systemd
>> > +
>> > +SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${PV}/udevil-${PV}.tar.xz \
>> > +           file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
>> > +"
>> > +
>> > +SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
>> > +SRC_URI[sha256sum] = "ce8c51fd4d589cda7be56e75b42188deeb258c66fc911a9b3a70a3945c157739"
>> > +
>> > +SYSTEMD_SERVICE_${PN} = "devmon@.service"
>> > +SYSTEMD_AUTO_ENABLE = "disable"
>> > +
>> > +FILES_${PN} += " ${libdir}/systemd/system/devmon@.service"
>>
>> Setting SYSTEMD_SERVICE_${PN} should be enough to ensure that the
>> service file gets packaged correctly, so explicitly adding it to
>> FILES_${PN} like this shouldn't be required.
>
> Without it, bitbake complains:
> WARNING: udevil-0.4.4-r0 do_package: QA Issue: udevil: Files/directories were installed but not shipped in any package:
>   /usr/lib
>   /usr/lib/systemd
>   /usr/lib/systemd/system
>   /usr/lib/systemd/system/devmon@.service
>
> I wonder if this is related to differences in systemd in my build
> setting which are leading to error:
> http://errors.yoctoproject.org/Errors/Details/147258/

It looks like udevil installs the service file in a hardcoded path
under ${libdir} rather than respecting ${systemd_unitdir} as defined
by the distro:

  https://github.com/IgnorantGuru/udevil/blob/master/etc/Makefile.am
  https://github.com/IgnorantGuru/udevil/tree/master/etc/systemd

so some patching or sed fix-ups and moving files in do_install() is
going to be required to cover cases where the two don't align.

> I tried DISTRO=poky and DISTRO=nodistro and I cannot reproduce error
> above (with FILES both are working fine).

If you look in meta/classes/systemd.bbclass ->
systemd_check_services() you should see the paths which are searched
to find the service files defined via SYSTEMD_SERVICE_${PN}. From
there you should be able to determine why your build appears to find
the service file somewhere in these search paths and doesn't hit the
fatal error.

> Other build settings are:
> BB_VERSION        = "1.34.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "ubuntu-17.04"
> TARGET_SYS        = "i586-oe-linux"
> MACHINE           = "qemux86"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "m32 i586"
>
> Best regards,
> Krzysztof
>

