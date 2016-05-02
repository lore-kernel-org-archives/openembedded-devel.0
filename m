Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3DD6E687
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 May 2016 22:12:48 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id x35so467848ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2016 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=Vt3BKHlnCItY+peHG6DokmqSylEgSaXph6uA/7nUn/U=;
	b=AGaNq7wEUwNCmHqcVjk8A4K0CFbVjVQkKqcZqhw2BJba59DQRrvQeMy0IBb3ynymlT
	w+XnEMHq3ZAzdzziFr/AcurvMpoHsK0lSFCymA50TaSzfyTj99KsvT0lBuwb5eSNPkPf
	8un26RcQgF9gRkDp6IQ+hPKjHydxbzAIJqOP+YjR86rh7/lAM55VTl8CqP8EItoFA5k7
	W/Uv2Nhg7QdKUv5QRnDnAO1z8QCDhbN5G62ebp1HGvOQ461hg6Jfyjpou+NMnAqQTsAH
	nB5qHEFF+oBCHJoWRmkmHkbRqkRegdiboBxxzwhlxA8DHSj8wY2gFHXoygKWiAlX9MN0
	jyZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=Vt3BKHlnCItY+peHG6DokmqSylEgSaXph6uA/7nUn/U=;
	b=EhiAKchaowBUnfWy8YgQAUBFa3G9tZBtK1ghuPotvGz5KBRztZsKd4X+iIKMBNnAHZ
	16b6QRbx4AKx8b2nWAmD53+gUFQ4uxFWLn++XGJyE2jrvK6NBOxayQRFKzly4ShLrWhk
	pVg79B8L5Jp8S83EONigyxnio/681svvJtLAgA6l8wxISvdUkcXE4lrMSDEaBFcj1r4i
	GIQ82s1LMdgV/zeqJ8MJ3cdv4tEQ5+3EV0tZvTBh5cgU7MH5s4Qn087wdTG/YAfQ8U+6
	yRlopkyuZAg7X6XqclTn+FXAoqh8N5EAuDIGiK140iNhqW3o0Pp43NNxPB/pO8arI46m
	LLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=Vt3BKHlnCItY+peHG6DokmqSylEgSaXph6uA/7nUn/U=;
	b=Kwo2riVVgUCeTB8zItLvBSWEt5g6dIoW+rlx3Gx696gKAWX1EuZJt1xac5UO8eA4wg
	0gVaLDG9aA0ITud2WrWvPPa3ceKr8xPdFr50J11kPS63om3LaoUOgZdU63LrwOsSB0Qg
	F3FsbMtY5L9nnQa9Lg40HbvuhFav4Pb/SUh9t8djOKwhOItDmb8tAqrdNp2Cd+KtbVMk
	Vzhag3bf3tOPAg0CBW8dXmaOCh3b7F4McjF0L5N+4UasO79AkoowvptXHVE/PdAIyHNt
	ZcnmgOU+X78RVFT1cI1racH3enc8s2v6tzUNSh444EbIsImqz1tWh3BrZcYSUyv3P0V4
	jtow==
X-Gm-Message-State: AOPr4FW1pXrCOM3CcEBOQZRr08/rBspyHz4HcVmXqKSAcyfYCte9kb5dO+clAPAX0SsLBNIdfuT9LnIotDgG7A==
X-Received: by 10.107.147.7 with SMTP id v7mr42100748iod.3.1462227169521; Mon,
	02 May 2016 15:12:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Mon, 2 May 2016 15:12:30 -0700 (PDT)
In-Reply-To: <1462222453-30407-1-git-send-email-ann.thornton@nxp.com>
References: <1462222453-30407-1-git-send-email-ann.thornton@nxp.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 2 May 2016 22:12:30 +0000
X-Google-Sender-Auth: jMYIe4T4vqzDW6dBtDTNUMXaQcI
Message-ID: <CABcZANkpmDKL-fsM94nQ5o+193Hqo3_b5ikv9sokc4JO5M=n+g@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] packagegroup-tools-bluetooth.bb: Selects the tools appropriate for the version of bluez being used.
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
X-List-Received-Date: Mon, 02 May 2016 22:12:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 2, 2016 at 8:54 PM, Ann Thornton <ann.thornton@nxp.com> wrote:

> Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
> ---
>  .../packagegroups/packagegroup-tools-bluetooth.bb  | 40
> ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
>
> diff --git a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> new file mode 100644
> index 0000000..bdab389
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> @@ -0,0 +1,40 @@
> +# Copyright (C) 2014-2015 Freescale Semiconductor
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> +
> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +SUMMARY = "Set of Bluetooh related tools for inclusion on images"
>

Typo: Bluetooh


> +DESCRIPTION = "Add bluetooth tools based on the version of BlueZ in use.\
> +The tools that have been tested and work the best are pulled in \
> +automatically.  The same packagegroup can be used in a recipe without \
> +the need to know which version of BlueZ is in use. \
> +Supports BlueZ4 and BlueZ5."
>

This is more a description of the recipe than the package, but this ends up
in the package. This should describe what the purpose of the package is,
not how it's implemented. "Tools" is also rather vague here. Which tools,
for what purpose?


> +inherit packagegroup
> +
> +BLUEZ4_INSTALL = " \
> +    obexftp \
> +"
> +
> +BLUEZ5_INSTALL = " \
> +     bluez5-noinst-tools \
> +     bluez5-obex \
> +     bluez5-testtools  \
> +     libasound-module-bluez \
> +     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',
> "pulseaudio-module-bluetooth-discover \
> +
> pulseaudio-module-bluetooth-policy \
> +
> pulseaudio-module-bluez5-discover \
> +
> pulseaudio-module-bluez5-device \
> +
> pulseaudio-module-switch-on-connect \
> +
> pulseaudio-module-loopback", \
> +                                             '', d)} \
>

This "_INSTALL" naming is a bit odd -- this isn't an image. These are
runtime dependences, not lists of packages to install. The difference is
subtle, but important. I'd suggest renaming those variables.

+# Install either bluez4 or bluez5 if they are in distro.
> +# Otherwise install nothing.
> +RDEPENDS_${PN} = " \
> +     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez5',
> '${BLUEZ5_INSTALL}', "", d)} \
> +     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez4',
> '${BLUEZ4_INSTALL}', "", d)} \
> +"


I'd suggest inheriting bluetooth and using the BLUEZ variable which is
already set to 'bluez5' or 'bluez4' based on the distro features.
RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}" would work, if you defined the
variables as RDEPENDS_bluez4 and RDEPENDS_bluez5, for example. bitbake can
handle nested variable references. Anyone else want to weigh in on this?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

