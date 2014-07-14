Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id C5CDF701D6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:43:26 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id c1so2277034igq.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3fFMzhslXbexRuuxvlxcBbBhpjTwp2onHoJz6lze9F4=;
	b=cALnFfSx/Ie4TJ64YtLFT5VdlYwDq+vnohT+mz92jzMWi8IlydoxzAzgRYQIuEn0+w
	JUPPemwbNml1rzqpShsUeeE3CDYN4BVBL9KnkD/Cu/N4KKAGhTjziBuYRO7bLxhcaLue
	mQXPvTwUeSMhAW39O3CrQnNMpfNHcGsnyRdA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=3fFMzhslXbexRuuxvlxcBbBhpjTwp2onHoJz6lze9F4=;
	b=Y+hSVOipLT4itfx7FEqSf4bois335bm5vcEl5Dfi0Vf4fkRx1D4mga4pQqlRdWJyPv
	P6CMWXi5TD8EwcBDLXsvPYF10moXSjsuyyhAI/ZBOcfQRnztrFBCV0ZqRCvT6NQ2pWzT
	KrwNCh7Zfw6p5vV7/JlnaAn/KpAGBIR6/1MRVRtUezEZPFlL91dxfXCaFBNzQih3v+a5
	ad0EC6HDI5nnxmRh1PMOmWX59kxf0Tq/F6z4h+bPx0OkDyik7x7EZxxnef2laPzCODuc
	iO69xaOwT6B1bBVVpH0UE/ZKffQH3D1qM0W/bWPVWICfTZhqCEqI9TvRTVBrc0mFqd4k
	y2zQ==
X-Gm-Message-State: ALoCoQkEIYGJl8R2gUwoOhEAnrgIBQASdbY1qTavH5VUBCt0dFFhS502vVUF3qtlcOBkBxURVXHB
MIME-Version: 1.0
X-Received: by 10.50.43.167 with SMTP id x7mr1398606igl.36.1405377806609; Mon,
	14 Jul 2014 15:43:26 -0700 (PDT)
Received: by 10.50.225.73 with HTTP; Mon, 14 Jul 2014 15:43:26 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407141457150.14590@localhost>
References: <alpine.LFD.2.11.1407141457150.14590@localhost>
Date: Mon, 14 Jul 2014 15:43:26 -0700
Message-ID: <CA+gsK-p7rV+HmdcskYkU0MYRn1zesYDgOUb4raVcj6_xW9x_ag@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 14 Jul 2014 22:43:26 -0000
Content-Type: text/plain; charset=UTF-8

>
>
>   then i noticed that the "splash" feature is defined, not in
> core-image.bbclass, but in the more basic image.bbclass, as is
> package-management:
>
> FEATURE_PACKAGES_package-management = "${ROOTFS_PKGMANAGE}"
> SPLASH ?= "psplash"
> FEATURE_PACKAGES_splash = "${SPLASH}"
>
> And then there is debug-tweaks for which the hooks are defined in
image.bbclass including the function zap_empty_root_password but the
post-processing is added to the variable by core-image.bbclass:

core-image.bbclass: ROOTFS_POSTPROCESS_COMMAND +=
'${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "",
"zap_empty_root_password ; ",d)}'

Since image.bbclass also adds the debug-tweaks to the valid image feature
list

image.bbclass:IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"

my inclination would be to move the addition to ROOTFS_POSTPROCESS_COMMAND
from core-image.bbclass to image.bbclass.

The image feature readonly-rootfs is also added to the valid list by
image.bbclass.

Consequently this makes the image features splash, debug-tweaks,
package-management, splash and readonly-rootfs available to image recipes
that inherit image.bbclass while h/w codecs and others are added by
core-image.bbclass and are only available when an image recipe inherits
core-image.

Then there are the image features dbg-pkgs, dev-pkgs, doc-pkgs,
staticdev-pkgs and ptest-pkgs which are added to the image feature list by
populate_sdk_base.bbclass which image.bbclass inherits and hence they are
available to all images.


>   so is there some rationale for deciding which FEATURE_PACKAGES
> settings are defined in core-image, while others are defined in
> image?
>

That I do not really know. However, to some extend the choices as to what
class adds what image features make sense, alth

   - The minimal set of features splash, debug-tweaks, package-management,
   splash and readonly-rootfs to be added by the basic image.bbclass.
   - Extended image features added by core-image.bbclass.
   - SDK related image features by the populate_sdk_base.bbclass.

My $0.02

Cheers,
:rjs

