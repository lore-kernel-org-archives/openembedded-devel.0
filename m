Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 61F6D78493
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 02:32:25 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g20-v6so11221288qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2018 19:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=amM4aSNslybV3jJUA9K085saRVBhVRVcV/4spECe2Js=;
	b=cualvj6DJoy53ndTgVB0emNcZTLhLnxN52x566pfeKmEMD2OhTFWNLBpaOA5p6OZX6
	QPnF+UAm19CAVihIgo74WSJKFQQPfr8bnq5jlqxRTe3gBiW9Jc30XNW9cmgpsOP9QRx0
	GXbose+p8LzfeRYPaAsWxGIHD0j4I2o5iX/Merz1qPPcP6rfu/Kx7zh3rcfYpFYa+dnT
	fRPWQNJOTV4qVmc8xoNY0gzvOmXXGtnwWMEMoPO7N8rmMwth3Lr5wH8QnVw+ZycEvXMu
	6kJOttY7pg9fLLyhD5+EDKy9hoavK0VBLEFYFipBBJ9eYNfkIQjaLqYeKwEtkkaNUVkO
	lr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=amM4aSNslybV3jJUA9K085saRVBhVRVcV/4spECe2Js=;
	b=b4h3MQHfsHsuszol7j5+BhIMxVlNTriC2HxFGpG1p/T7OG8x6NJsyNj/baWUN0o5u3
	qfKeB1YgHsesqKeezoITqiN0DCX+bEBfw5+3EFym5andl/jDKcBDqmc+5r0S7qrfqUIW
	PXXRPPnYy+mSf7OojAyC0hMNbAW/eOouGbDeyNRGLr6G8TMd13r8u3pu06+33jCXMek4
	nIhzPu+gVvLVQ9VooWktM4urI0eOMzEJItC1wJE24hMDy4WjzUAdKQsixQxKULp9rcsA
	vFpO7QgdDFcMltIxjtatGyT3nUMovt73yi26DtVQ02asijwpB+5iznpDrX6MEcBXL36M
	+kjw==
X-Gm-Message-State: ABuFfogpRkG5N2JJBkIal3BijK4nmu6bflwNkezYQQaCraafdXjIr/f7
	A/jFGcsFYOSrfq/Xgn8jqM4COjk4PyO/EynXI3I=
X-Google-Smtp-Source: ACcGV60fhBus8uKCaXAnZE96wswWJP++/p6/+N2xAUlBkO0Ih1h8xuOH/8oksFu0H3my4q5/KKg5c1F2mnrlM8Yrv34=
X-Received: by 2002:a37:655:: with SMTP id
	82-v6mr16760567qkg.223.1538965945877; 
	Sun, 07 Oct 2018 19:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <1538815194-5528-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1538815194-5528-1-git-send-email-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Oct 2018 19:31:59 -0700
Message-ID: <CAMKF1so2RTBJFS566+VNDMC8276Vd6DSUfMrKh1TPMrhmUsX=w@mail.gmail.com>
To: ankit.tarot@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencl-icd-loader: Initial recipe for OpenCL ICD loader
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
X-List-Received-Date: Mon, 08 Oct 2018 02:32:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 6, 2018 at 1:43 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> This patch provides ICD loader library and ICD loader test binary
> and some helper library for test.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  .../opencl-icd-loader/opencl-icd-loader_git.bb     | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
>
> diff --git a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> new file mode 100644
> index 0000000..f6a8fef
> --- /dev/null
> +++ b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> @@ -0,0 +1,47 @@
> +SUMMARY  = "OpenCL ICD Loader"
> +DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
> +LICENSE  = "CLOSED"

this seems to be problematic, usually khronos s/w is under a known open
source license if its closed source then I would not like to maintain
it in open OE layers.
if its wrongly marked at closed please fix it in v2.

> +LIC_FILES_CHKSUM = "file://icd.h;beginline=1;endline=36;md5=c406ef72ec08f23326801455d7713b07"
> +SECTION = "base"
> +
> +inherit pkgconfig cmake
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "b342ff7b7f70a4b3f2cfc53215af8fa20adc3d86"
> +SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git"
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -m 0755 ${S}/../build/bin/icd_loader_test ${D}${bindir}/

could be use ${B} here

> +       chrpath -d ${D}${bindir}/icd_loader_test
> +       install -d ${D}${libdir}
> +       install -m 0644 ${S}/../build/lib/libIcdLog.so ${D}${libdir}/
> +       install -m 0644 ${S}/../build/lib/libOpenCLDriverStub.so ${D}${libdir}/
> +       chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
> +       install -m 0644 ${S}/../build/lib/libOpenCL.so.1.2 ${D}${libdir}/

same here.

> +       cd ${D}${libdir}
> +       ln -s libOpenCL.so.1.2 libOpenCL.so.1
> +       ln -s libOpenCL.so.1 libOpenCL.so
> +}
> +
> +PACKAGES = "opencl-icd-loader opencl-icd-loader-dev"
> +PACKAGES += "libicdlog libicdlog-dbg"
> +
> +FILES_${PN} = " \
> +       ${bindir}/icd_loader_test \
> +       ${libdir}/libOpenCLDriverStub.so \
> +       ${libdir}/libOpenCL.so.1.2 \
> +"
> +FILES_${PN}-dev = " \
> +       ${libdir}/libOpenCL.so \
> +       ${libdir}/libOpenCL.so.1 \
> +"
> +
> +FILES_libicdlog = "${libdir}/libIcdLog.so"
> +FILES_libicdlog-dbg = "${libdir}/.debug/libIcdLog.so \
> +       /usr/src/debug/opencl-icd-loader/git-${PR}/git/test \
> +       /usr/src/debug/opencl-icd-loader/git-${PR}/git \
> +"

Please use bitbake variables instead of hardcoding /usr

> +
> +DEPENDS = "opencl-headers"
> +RDEPENDS_${PN} = "opencl-headers libicdlog"

rdep on a headers package seems wrong  here.

> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

