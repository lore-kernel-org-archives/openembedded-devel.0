Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 430FB7320F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2016 04:44:46 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 1so107555418ion.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ZHW9AcyVjqLjwk5r9ZAVDh8s7XikJk5f2t1hbMWZl5I=;
	b=jwcRLW+O+OLTE075rNYDC350Sj69ma+vDYirBPc1N/c+zQIYFt/nPuBCbpm5V0RB3o
	mzACrUXq3Mt2PGyxaLDB7otyaMj9EP8pA7mP4Le7qVy00rjOB3PAWqVgcUzwgu+ZyRhq
	qqtSgWZYwOe5Q/WSRZWmDmXklBXurGfnsERpHa5NYrpaNcD3rTt+ObhtKtxQIiyp6Wps
	0kWN2k+EmQdDfW1dbEQ8B4EM2QC73PIULU/PJMityYj11xNqb9O7TnjE9jippRkSPjIa
	RpbGqdG8O4BcWRPDJ188No3x3/IeLjyq2q64Aqp/s7vpgOy/Sx6fIie3VXbdbbf8p/jQ
	6lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ZHW9AcyVjqLjwk5r9ZAVDh8s7XikJk5f2t1hbMWZl5I=;
	b=NFnaeipwRhxho+sBKSIL9oH6gVJ5gqnfA0ikGubLLvh+dPtBg/ZJyTpLlrcN333Jra
	6ARgx4ZEzPwO4kqndXoY+Tp1hB4BnxwM1vtJva0+Je5QrBbLVpi+O3TPNvR4b+viCpaD
	PfCn1L473H/TnRnS3PKbELj7apob0Ufth7LndeinWuEzEbU+5npHf9nM2KhaOcFf3RN8
	KSKQwjK4npOAztYirySZXaxtbexBVawfoHUckwFLrFp/mrgoHOPfKk16RERX/mWQxpOI
	F1+Ekt0EQpx8gOIIA3j7fKNxGeqTBNU18T5NvLseoiiH6zl8YT7UkvQlVkbaBrRl7h3t
	NpRA==
X-Gm-Message-State: AG10YOSxpoc5aX1C21sW4tmJvvIlgqdj0/r+U9EqelC5kvbTHG2uHJGOXVVIv/nzHvSzYiBlEJb+OXEJu6T0Sg==
X-Received: by 10.107.165.14 with SMTP id o14mr6514525ioe.49.1453524286693;
	Fri, 22 Jan 2016 20:44:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 20:44:17 -0800 (PST)
In-Reply-To: <1453438061-29267-1-git-send-email-armccurdy@gmail.com>
References: <1453438061-29267-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 20:44:17 -0800
Message-ID: <CAMKF1src979xxQBgg1F_WiPz6UJy3h3uj+f9DJXsCP8=ErygEQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] gst-plugins-base: drop obsolete dependency on liboil
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
X-List-Received-Date: Sat, 23 Jan 2016 04:44:47 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 21, 2016 at 8:47 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> liboil was replaced by Orc prior to the gst-plugins-base 0.10.30 release:
>
>   http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=8e4314f0fbfa4957f8e84d46824d10178b106fe6
>

while you are at it. Another package which expresses dependency on
liboil is pulseaudio which seems to be unneeded as well.
if you can remove both the deps then liboil recipe can be dropped from
OE-Core as well.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
> index 8afc165..aa6b3a1 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                      file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
>                      file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
>
> -DEPENDS += "alsa-lib liboil libogg libvorbis libtheora util-linux tremor glib-2.0-native"
> +DEPENDS += "alsa-lib libogg libvorbis libtheora util-linux tremor glib-2.0-native"
>
>  SRC_URI += "file://gst-plugins-base-tremor.patch \
>              file://configure.ac-fix-subparse-plugin.patch \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

