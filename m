Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C0D4571C9E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 19:58:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u63so11031204wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 11:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dbUfTSy3rpnKfjAPFBVCW28V4HcSZbrgC7uljqbkiIA=;
	b=GL7CQ81E69OxoJkNgt6bg9xe7lzaprFqIA43iuUfOEZ7JzVQwvbc7BJRllFfvk/4gX
	7IPS6LvwsTIDTZ7k8O2AZqtPhA22Fe+Qp6UxHpCXR1ur5Fj7CVJv0U7KNIB3CZCqYF3S
	Rk31yze1kZMDvkzpGxEFN8c6k2dCUgvE1zbuaeF0Qbi9B4jwZS7g4XavjQzKPYG+KrIw
	wkI8Vbi8O/8kvfzoqsW0mIVWPmRcpIkJ9K1JjAXAsUkAezby+Rb/99NAMZnRGuLFA1eM
	p+LVRBy+bA4MHylkFIAGvAzyIfb+JCJEp+1ro0B/kaKE6oTYk9sIR9BD/mT294Ge9kiF
	6TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dbUfTSy3rpnKfjAPFBVCW28V4HcSZbrgC7uljqbkiIA=;
	b=oFX0JEBvVl/1Ih1ShGMZrM0S167GNCNO8+Yj1/Q/IrDUOrZvNK/uF6F/v6H1NpvxRZ
	ZCFTWJJLEMLAAsi24XBj0wOaFquDE7Mmex5mn3Riqum8FZbJNvBvcqiN2UamBR5eE9Vb
	ulIW+nmhmmy117DTp1phWA/oT1kkHTKOQsV6WKOx3cR1HvIpJpVz+0agdWe7tg5+tU3L
	o73cqzRdmkIRfVy9ZrdlB4rO57Yu8qHdnZouWz+WTXPPeL8NTZYRtN4z3tETB5KxysBW
	/KXSb62KyDgQyHFCYK/iST0EFKTpm+ne3CxQKG2yFEtYKSV09g++iUX05keo/G4Zb8P6
	eVpw==
X-Gm-Message-State: AMke39lDhxKaqnNyL8PivOygJlKtnwfLan3141d/VRjlOMliwA7/rIOPq1xhSW1iLYhYW9TsO8tIal8xQk0kFA==
X-Received: by 10.28.74.69 with SMTP id x66mr7967740wma.124.1487534290107;
	Sun, 19 Feb 2017 11:58:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sun, 19 Feb 2017 11:58:09 -0800 (PST)
In-Reply-To: <1487181811-31445-4-git-send-email-paul.gortmaker@windriver.com>
References: <1487181811-31445-1-git-send-email-paul.gortmaker@windriver.com>
	<1487181811-31445-4-git-send-email-paul.gortmaker@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 19 Feb 2017 20:58:09 +0100
Message-ID: <CA+chaQdDMYNGa7KC2-Rgoz-+DXh0v7cfUZRx5W1FcP4rcSdbFQ@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] farsight/xfce4-mixer: unblacklist recipes
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
X-List-Received-Date: Sun, 19 Feb 2017 19:58:10 -0000
Content-Type: text/plain; charset=UTF-8

farsight2 is still failing:
http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132936.html

On Wed, Feb 15, 2017 at 7:03 PM, Paul Gortmaker <
paul.gortmaker@windriver.com> wrote:

> These were 3rd level fallout from gstreamer being blacklisted, as
> they depended on packages that depended on gstreamer.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta-oe/recipes-support/farsight/farsight2_0.0.22.bb     | 3 ---
>  meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb | 2 --
>  2 files changed, 5 deletions(-)
>
> diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> index 8c783a9f4770..2989850e9875 100644
> --- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> +++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> @@ -28,6 +28,3 @@ FILES_${PN}-dbg += "${libdir}/*/.debug"
>
>  SRC_URI[md5sum] = "e1f540cf3ebab06c3d7db1f46b44ac88"
>  SRC_URI[sha256sum] = "3ae59aa61a8071c9fad111e5fd606a
> abc27961eb4192f8729987a27dae6b3974"
> -
> -PNBLACKLIST[farsight2] ?= "Depends on blacklisted libnice"
> -PNBLACKLIST[farsight2] ?= "Depends on blacklisted gst-plugins-base"
> diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
> b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
> index 2c91fa9b930e..bdbec458bc47 100644
> --- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
> +++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
> @@ -12,5 +12,3 @@ SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
>  SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5
> a59286e994a137acda5609570c57112de2"
>
>  RDEPENDS_${PN} = "gst-meta-audio"
> -
> -PNBLACKLIST[xfce4-mixer] ?= "Depends on blacklisted gst-plugins-base"
> --
> 2.7.4
>
>

