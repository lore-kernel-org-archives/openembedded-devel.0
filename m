Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 73D8877E22
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:58:41 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id v203so2091564vkv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 12:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cz9tHws+WwMq/8H/61DyFAVlC+waKFKNIaECIvGTLdQ=;
	b=hg0KKCKNB9fS1k8og8R4ZkPk3PDaWbsOt4tat4GqwK9+jA/w85lHike0fArsFgyuvl
	ZvvJVfbwgKin5za3WeyQ8OVQygkmKDkPLh5esiZsv2dMmq2jZc2nJzYcNhqiO23asnpb
	5oJCC25ITt0++Qq41z2RIh1fzpcUEm/0PDOv1pynjC2fv4gvWqfzl7AvFFYP18Vn0Grb
	UQCm19+YcLNmJ7j7uhTVQY7cph4bLjTy42tOk1jEXcm4jm6/v28Sc5bxLfCkGTL0dswZ
	Nx/ze60B/oeqaySF8Wq4u/JMjyxHxOFVT091jo5PIiP+Nj5X84MhXkZyPpJf34ddztOw
	NDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cz9tHws+WwMq/8H/61DyFAVlC+waKFKNIaECIvGTLdQ=;
	b=iOgPX63GyfK92YpwKQYv4bW4ElqdVwZzBA4flU964bcr8jd4E8Bsnf+zKOQgA0jJYp
	rMtrkqiK5qxOe5ri0wRhAS3zOev3jU6W7xfAexYQxd3/39WEtnGyzM9L0uf75JQ4hP71
	bwik0y0eoUasm+GdB4hLePltueVTdMqSV2xR2GjkMOmHMwyWr+VWLLe/VpY+0pMfFogW
	M37p2gWU5LP7SVRNxQha/u8mVJL5hnp3f6Gpvx0DAIwZNz6L6r0QhqTaslxyC7th3gYV
	Kzx2zd4FfnDiNdnbMnJr2zS2GTK9ExxotJ9BQ6T5+x49ZZSO+o+RsRya8NONmm4dFcpr
	860Q==
X-Gm-Message-State: AHPjjUhs4uDnz5Cyy2N9pQU+Q8gtMl5IxU3IxSZu2chlcaMY0gY6Jsi2
	ZdMgU6BVWJBNt4XgHHzp31M56yEa+g==
X-Google-Smtp-Source: ADKCNb7WNdTTxLwPYexI0aFZe1rNo/+lJzMVlu+PjMkwpy2uiC3ZnL7KuHGTBvZvt9BQHar28jViCUrgQSHnS2BGsJc=
X-Received: by 10.31.77.199 with SMTP id a190mr160695vkb.174.1504727922272;
	Wed, 06 Sep 2017 12:58:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Wed, 6 Sep 2017 12:58:41 -0700 (PDT)
In-Reply-To: <1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 6 Sep 2017 21:58:41 +0200
Message-ID: <CALbNGRSzEDGhGK9bA+8oUeusKVqTHoCktFRPvuVQ9OQJ_NfKvg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
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
X-List-Received-Date: Wed, 06 Sep 2017 19:58:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> There is no upstream revision to the mixer to make it work w/o gstreamer-0.10
>
> also remove from packagegroup-xfce-extended
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb   | 14 --------------
>  .../packagegroups/packagegroup-xfce-extended.bb            |  1 -
>  2 files changed, 15 deletions(-)
>  delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
>
> diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
> deleted file mode 100644
> index bdbec45..0000000
> --- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "A volume control application based on GStreamer"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -
> -inherit xfce-panel-plugin
> -
> -DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
> -
> -SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
> -SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
> -
> -RDEPENDS_${PN} = "gst-meta-audio"
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> index c07188f..ff024b3 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> @@ -61,7 +61,6 @@ RRECOMMENDS_${PN} = " \
>      xfce4-appfinder \
>      xfce4-screenshooter \
>      xfce4-power-manager \
> -    xfce4-mixer \
>      ristretto \
>      xfce4-taskmanager \
>      gigolo \
> --
> 1.8.3.1
>
NAK - I use it daily and there is no proper replacement (not using pulsaudio)

Andreas

