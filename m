Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8967F17F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:41:23 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a27so33763810qkk.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x5HKor5x5IbaAFoCxy97uw9MrpiLDe/xP1iSZIc3tEI=;
	b=VJ14hKKF8nc7nb/25SgOPKzseNcESm/5vayKgsDT4GgXAQ0Do7ODMLSSwWYUFZN9qq
	hYqGsbuefghWmxnxml7u6qEVC59q3v5vWnJXFPjVdcCoS9I5Fa/DaYYJIPLlNUNNmDdd
	UdQDis3clsSlNhk8hFNrPE4JXg+pWbqsN830E2cnj5nSfaSOZBDJCZHEAaYCZi5ZOSsR
	1OudPVjPwLBrNm4XR08noz/5H2AadHYLuiY3XN9PY3uHJ9x3Al/XoJxV8AgJ27i7OYpt
	59wMVUTYSxBoaM76gchHIcXt96DDdhx0rOLm/WCHNSodqfakReeZUqtp3mjTRJQEEnKU
	yS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x5HKor5x5IbaAFoCxy97uw9MrpiLDe/xP1iSZIc3tEI=;
	b=AjTqD4Sfh7SNKRbcT6d6kKC36KqZeHGX6Iesd7Lo06hXRD5Ld9U5HMox7TBPJ/a55U
	dAMUK0NFkMwPCrAVTCLqdGYtGxTTNh5oM2+HG5l0CQcWsE5l9B4Eq6za9BMR/KHO4CN2
	yRaczVl0doKZ6kd/J9x3WGK7FghntUT/PQelL4/Hoxo9Eukm4PlBT9XIY5eN8AyXP0FF
	Sz/fwAaX9M1YSmGpl1Lbv8pehn2NBaBe6bhzJyGIHzZTRm2utLyJ7SVLynTzbfvuh51X
	dfkuFN4f4RsG46bJjlk/emMyvk+k6vUp+Pq0w2y2OwTsrvLT98Y07uJOtYs2UuDmn3ed
	K8gw==
X-Gm-Message-State: APjAAAWXpYNirOQlTFtSFsEVpjjX1KXaUZs0XcEU4ViX35CsOqHJWkQB
	9QzDP2vUc2FYbI3zeIvLPWtpUk6z8ezplcUSuCG4d6B4
X-Google-Smtp-Source: APXvYqz56ID+c6AaDLTyNa+1hTiByJ8DUjQoxZbixqDai888ypCUVLngMOCceoQgsVO1xeQ65d5SOE5XRDvIkvkSEs4=
X-Received: by 2002:a37:c81:: with SMTP id 123mr55942777qkm.474.1563975684142; 
	Wed, 24 Jul 2019 06:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <1563602668-35526-1-git-send-email-andromeda@intel.com>
	<AA9B40170ABA1047B45E714CB2B866B706BC069D@PGSMSX103.gar.corp.intel.com>
	<CAMKF1soCg3ytMiOoy63ePT+nR1kpnj8ntuNTjg0cngBKJX3NmA@mail.gmail.com>
	<AA9B40170ABA1047B45E714CB2B866B706BC13D5@PGSMSX103.gar.corp.intel.com>
In-Reply-To: <AA9B40170ABA1047B45E714CB2B866B706BC13D5@PGSMSX103.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 06:41:13 -0700
Message-ID: <CAMKF1spQVDmckhTWZ=kUNZrvy-dxARGmC+L4z559mkrTiwpE6w@mail.gmail.com>
To: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python3-pyatspi: Add Dbus ATSPI recipe
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
X-List-Received-Date: Wed, 24 Jul 2019 13:41:23 -0000
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.

On Wed, Jul 24, 2019 at 12:09 AM Chan, Aaron Chun Yew <
aaron.chun.yew.chan@intel.com> wrote:

> Hi Khem,
>
> The parsing error was due to missing native support for
> python3-dbus-native in another patch I submitted today.
>
> http://lists.openembedded.org/pipermail/openembedded-core/2019-July/284963.html
>
> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Sunday, July 21, 2019 2:11 AM
> To: Chan, Aaron Chun Yew <aaron.chun.yew.chan@intel.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [meta-python][PATCH v2] python3-pyatspi: Add Dbus ATSPI recipe
>
> Parsing errors seen
>
> 18:07:40 ERROR: Nothing PROVIDES 'python3-dbus-native' (but
> /mnt/jenkins/workspace/yocto-world/sources/meta-openembedded/meta-python/recipes-devtools/python/
> python3-pyatspi_2.32.1.bb
> DEPENDS on or otherwise requires it). Close matches:
> 18:07:40   python3-absl-native
> 18:07:40   python3-gitdb-native
> 18:07:40   python3-six-native
> .....
>
> 18:07:41 ERROR: Nothing RPROVIDES 'python3-pyatspi' (but
> /mnt/jenkins/workspace/yocto-world/sources/meta-openembedded/meta-python/recipes-devtools/python/
> python3-pyatspi_2.32.1.bb
> RDEPENDS on or otherwise requires it)
> 18:07:41 No eligible RPROVIDERs exist for 'python3-pyatspi'
> 18:07:41 ERROR: Nothing RPROVIDES 'python3-pyatspi-dev' (but
> /mnt/jenkins/workspace/yocto-world/sources/meta-openembedded/meta-python/recipes-devtools/python/
> python3-pyatspi_2.32.1.bb
> RDEPENDS on or otherwise requires it)
> 18:07:41 No eligible RPROVIDERs exist for 'python3-pyatspi-dev'
>
>
> On Fri, Jul 19, 2019 at 11:17 PM Chan, Aaron Chun Yew <
> aaron.chun.yew.chan@intel.com> wrote:
> >
> > From: Aaron Chan <aaron.chun.yew.chan@intel.com>
> >
> > pyatspi provide python3 support for Assistive Technology Service Provide
> Interface (AT-SPI2) protocol over Dbus.
> >
> > This is useful not only for Accessibility (a11y) but also provides a
> medium for automation of GUI testing (such as python3-dogtail).
> >
> > Signed-off-by: Aaron Chan <aaron.chun.yew.chan@intel.com>
> > ---
> >  .../recipes-devtools/python/python3-pyatspi_2.32.1.bb    | 16
> ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644
> > meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> >
> > diff --git
> > a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> > b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> > new file mode 100644
> > index 0000000..6d80c10
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY = "Python bindings for DBus AT-SPI2 accessibility"
> > +DESCRIPTION = "AT-SPI2 is a protocol over DBus, toolkit widgets use to
> provide content to screen readers such as Orca"
> > +SECTION = "devel/python"
> > +HOMEPAGE = "https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886
> \
> > +
> file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
> > +DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+
> python3-pygobject"
> > +
> > +SRC_URI = "git://
> github.com/GNOME/pyatspi2.git;protocol=https;branch=gnome-3-32"
> > +SRCREV = "dc4565208fca00da06b972915a080ad3c63f640d"
> > +S = "${WORKDIR}/git"
> > +
> > +inherit pkgconfig autotools python3native
> > +
> > +FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyatspi/*"
> > --
> > 2.7.4
> >
>

