Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 174E160762
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 23:53:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so12134552wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 15:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NOQGqaT7SkLCDPSbNK50vV7FRrP7pnH0yYloyJw+rU0=;
	b=g8ey/qNRO5/1fCnoQ14zOdxR44JHVLadRxCafOqW20p1iYQ9Mzed8EJvXdxeWEJLO6
	63MdOAARxjNpBMWfkUNidysGC7yimauKm1wH4YNS68PC3Bhjj8jnJoCmy6sdhRiSuXJW
	czhpB/2x/63SCJT8fgGRpIZq95s7wFKyNwpCYnU0JR3uRppfPUnh6a2VyN122pz9Oe7H
	rk06swWXXp3P76yp514OxJe5j8K9aEt+RYH8utcb6PumpDmzkSGm05zlnPu4jUbDTien
	FiPmpD7Sl0ri2EbMRKmyEdOFIMDwpW9ryHNyDzZ+s2kESXroJ0QTC0kCXWEaqvIhA5Zg
	NJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NOQGqaT7SkLCDPSbNK50vV7FRrP7pnH0yYloyJw+rU0=;
	b=gtfxdo5jUxi8Vil/uPdkwWeABVTEZyfIdFEA22dd37w5Q0Y/hScwfnRxTUjQB+hH+w
	QfsE7n8eslWKPc7KaadjK3jsC6ygPzKZep9v38VgVjWHyv7zxolSvbYp2ItEEnTkA/+M
	c4g4SxRoIVXKd1UJxP6Eb+RGsXyDqmDs+/hA29mbcRvO68n8HTVOR/f92GdXbLpKHOj6
	krm2m+Kiz+09noiieB4t4UUlSQowwSdDHGmYYXePpl6/9BcQMrFGYaTL0SqV6Qr175KM
	fjixy8VNYB+oAIlaSlMS/uugBUpT8EClYQ5qtNv9TQ3oYm2xcK0Z1aW0KV0wnwMYs7TB
	ScPw==
X-Gm-Message-State: AIkVDXJ38eqGlHsfWOszHT2SgtPuQmniZvXuGcCEgAstAKexcfMdQBl3PiiCrkL7Ag3zrYnc6oQIu3q1v4nRcA==
X-Received: by 10.28.16.65 with SMTP id 62mr9085158wmq.81.1482018800213; Sat,
	17 Dec 2016 15:53:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Sat, 17 Dec 2016 15:53:19 -0800 (PST)
In-Reply-To: <20161123092209.23699-10-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-10-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Dec 2016 00:53:19 +0100
Message-ID: <CA+chaQeVHj6iwyku+wz5fiSg-R55r0msjwGsLSiYUR=2U35mcA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 10/49] libvdpau: Add recipe
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
X-List-Received-Date: Sat, 17 Dec 2016 23:53:22 -0000
Content-Type: text/plain; charset=UTF-8

directfb seems to autodetect this as well:

directfb-1.7.7: directfb rdepends on libvdpau, but it isn't a build
dependency, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libx11, but it isn't a build
dependency, missing libx11 in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxau, but it isn't a build
dependency, missing libxau in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxcb, but it isn't a build
dependency, missing libxcb in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxdmcp, but it isn't a build
dependency, missing libxdmcp in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxext, but it isn't a build
dependency, missing libxext in DEPENDS or PACKAGECONFIG? [build-deps]


On Wed, Nov 23, 2016 at 10:21 AM, Khem Raj <raj.khem@gmail.com> wrote:

> From: Koen Kooi <koen@dominion.thruhere.net>
>
> Needed for x86 machines
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 23
> +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
>
> diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
> b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
> new file mode 100644
> index 0000000..31f4df4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Video Decode and Presentation API for UNIX"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
> +
> +DEPENDS = "virtual/libx11 libxext dri2proto"
> +
> +PV = "1.1.1+git${SRCPV}"
> +
> +SRCREV = "a21bf7aa438f5dd40d0a300a3167aa3d6f26dccc"
> +SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +do_install_append() {
> +    rm -f ${D}${libdir}/*/*.la
> +}
> +
> +FILES_${PN}-dbg += "${libdir}/vdpau/.debug"
> +FILES_${PN}-dev += "${libdir}/vdpau/lib*${SOLIBSDEV}"
> +FILES_${PN} += "${libdir}/vdpau/lib*${SOLIBS}"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

