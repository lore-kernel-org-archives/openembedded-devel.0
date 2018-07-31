Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id AC76678D86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:38:52 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id u11-v6so4486337uan.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OUk5+AxrZodp/7upGmsiDD/kFMSDlTc3EuInXe6+h4o=;
	b=RjXVPDEQDj/e+7Miuuj6P/RgBDwHzlOLAQmpgghw4RSo9sjeDkgLJRquySxwc3A3BK
	GLf+5WLAar8X7J/pGlhvvHnx65RDItEO2szpMR1sYwjcKkyBcE0riX23Mj4VAwKEopz3
	hOW0L1dTbFk6zIZFFk4GCdYULXELbkuk3vOoQAoBTLi23A3FEx+SlQ6M/rM6fVyOX9cC
	FZUUvY0RdYNLuYqhv1omufvlt1PEZrAMjfJN+DDgZuTGp+o9b7vJNI6GLMfyemRzc9R3
	K2Wy/UNDCztA/3osxw1yqz8FhbUghYDuDPfZnhdrcUJ3cUxkElZTPwZsT4dbJi01ijoX
	e0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OUk5+AxrZodp/7upGmsiDD/kFMSDlTc3EuInXe6+h4o=;
	b=MepOy157oe01YCVCc/RJ2VebunAxW9Zf+fmjhSlbgv1CGU9wsaFsWdVZOPpAOjlVtg
	U8oLFX2Um+seLTaV511byT8aiKOxoobaYin+XVSiFImFzAehSuuariP11uF0RjFAFClo
	+wbCBuv5Ru6G7Egd3Gea/W11yq5YILyRuzIrbCOr5HUBSqP03mqF91KXE0rYjjwAt7xd
	16dRFBwCmohQMpTE+nubQBsxM/SnkfVyLjqYPSQXkVBmi6dmIq9GNyYIs1kKv0dsO8W7
	5PGyWafOxxcPwD/zGkBhl2mvDXEASJN4keb/wbZwCtXW4oY5sXTjoNdVxIXn/nNTSPWg
	opdQ==
X-Gm-Message-State: AOUpUlHweVY98GVsz0R6PgiX2ILdxyjWPdplCYb/DS3qhahDOEblmlLD
	Us+jH7gSMFaREbr4o1kBucFtMtydqfLnap8Cm8lWzg==
X-Google-Smtp-Source: AAOMgpcpXnPuu9R4185m00Wy5Jx+b8SFTUrzWFygFBrpXl3KFIp5E1wWB38FfvvC/D+67GGpBAavGx4Cnmg5DkIpTlk=
X-Received: by 2002:a9f:35ec:: with SMTP id
	u41-v6mr13952415uad.86.1533001133340; 
	Mon, 30 Jul 2018 18:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180730021613.26889-1-robert.joslyn@redrectangle.org>
	<20180730021613.26889-2-robert.joslyn@redrectangle.org>
In-Reply-To: <20180730021613.26889-2-robert.joslyn@redrectangle.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 30 Jul 2018 18:38:42 -0700
Message-ID: <CANx9H-C9T8NyDrBwbwq7d_OLftU9g_cHg=fcLg1oc8_oiPSWsA@mail.gmail.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 2/5] python-traceback2: Add recipe
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
X-List-Received-Date: Tue, 31 Jul 2018 01:38:52 -0000
Content-Type: text/plain; charset="UTF-8"

Why no python3 version n as well?

On Sun, Jul 29, 2018 at 8:42 PM Robert Joslyn <
robert.joslyn@redrectangle.org> wrote:

> ---
>  .../recipes-devtools/python/python-traceback2_1.4.0.bb    | 15
> +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-traceback2_1.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python-traceback2_1.4.0.bb b/meta-python/recipes-devtools/python/
> python-traceback2_1.4.0.bb
> new file mode 100644
> index 000000000..696c875c6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "A backport of traceback to older supported Pythons"
> +HOMEPAGE = "https://github.com/testing-cabal/traceback2"
> +LICENSE = "Python-2.0"
> +LIC_FILES_CHKSUM =
> "file://PKG-INFO;beginline=31;endline=31;md5=368ddc8588431c180ae7c33f4fb57519"
> +
> +DEPENDS = "${PYTHON_PN}-pbr-native"
> +
> +SRC_URI[md5sum] = "9e9723f4d70bfc6308fa992dd193c400"
> +SRC_URI[sha256sum] =
> "05acc67a09980c2ecfedd3423f7ae0104839eccb55fc645773e1caa0951c3030"
> +
> +inherit pypi setuptools
> +
> +CLEANBROKEN = "1"
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-linecache2"
> --
> 2.16.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

