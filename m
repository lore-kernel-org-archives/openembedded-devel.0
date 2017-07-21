Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2308B71984
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 08:56:09 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id x125so22318689ywa.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 01:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ouAoyR/EOdGTzQ+fHXjE984OaJgGC4P6aXpD1I7gOdQ=;
	b=A8sCyFgK+yfrG66gs9CLKdg2RK4RF/FARisZqyI18JfzDhgdkRBSMkrupVXDZ5Jfr3
	4G1p1KW4cSZ3H8hRWk5POIzhrO8V/2KYsxGEoji62HqMCAjd+pZblxm8QgWyykdQRLXg
	Y1S1/Yrvqe7+6oOKMoqQp2Nq/W8fZXkPlC8ZnUWg4se/BpeP8vBHvRjK+3Z1CcMO06uE
	aD5s/gefQwvgHIj5sI7wo1eV1CHFwhoveTVmzYNg7BvST9mGwB7K81PSKFoGF6TvpGYg
	w6fK+4zOvBRzZLYg0Ty7rB98gunKg4sGuOVUHITZSOsZKP7sO9oMotEu6gQhXGuem4Hq
	Vttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ouAoyR/EOdGTzQ+fHXjE984OaJgGC4P6aXpD1I7gOdQ=;
	b=fbYqZchql1GwOBJsXQkEzMMSPRSxieyFqZogHHVt+uYJ2sAhktV6LvEO8ZJoUMaCLA
	FvmxRnb8dWXYwNubscCzVWt0g/sAiGlEkjVwHhPmfYmbc0RyaWW4K9YPeotGS6QvzB52
	p6TIMemhQJKZs8+Lyo0dj0Z3W46Va1/TraM5aiHF+zzGOwccBWlreJ2AbbbYyZM4dzgb
	2IEC/y7ZLNSagLiTfulT2juLmTSdSrS6vAuF2bZn1cFGJjSR1T308gdcbRqr7CfXsOiR
	2jGSbnvW0zIjpOSZGRPuUxOkxQhsggZ8OdIcURkFDI0wMjjYsmGcZQKzxLXYVAF+gN92
	ajLw==
X-Gm-Message-State: AIVw110bySmD8238SYK6iyeHPxxdiJ6gA58erTIBmiSXYfDQRjrCROVn
	65XAC8SqnykbOnzf6CCnFi801wcdJg==
X-Received: by 10.13.223.141 with SMTP id i135mr4825881ywe.37.1500627371035;
	Fri, 21 Jul 2017 01:56:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Fri, 21 Jul 2017 01:56:10 -0700 (PDT)
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jul 2017 10:56:10 +0200
Message-ID: <CA+chaQceN=yak2xd2RqPucsNR2xfnPKAJQztnfEPxovsH6iqGg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-gnome 1/9] cheese: remove (previously blacklisted)
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
X-List-Received-Date: Fri, 21 Jul 2017 08:56:10 -0000
Content-Type: text/plain; charset="UTF-8"

The PNBLACKLIST message says it will be removed on 2017-09-01. I already
have a patch which will remove all blacklisted recipes with such
PNBLACKLIST but I'll apply it only at the end of next month.

On Thu, Jul 20, 2017 at 5:35 PM, Ross Burton <ross.burton@intel.com> wrote:

> Cheese 2.30.1 is very old (2010) and has been blacklisted for some time, so
> remove it.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 26
> -------------------------
>  1 file changed, 26 deletions(-)
>  delete mode 100644 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>
> diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
> b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
> deleted file mode 100644
> index 3f5a5b124..000000000
> --- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -SUMMARY = "Take photos and videos with your webcam, with fun graphical
> effects"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
> -
> -DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg
> gnome-desktop evolution-data-server intltool-native"
> -
> -PR = "r2"
> -
> -inherit gnome
> -
> -SRC_URI[archive.md5sum] = "1599fded8a1797ea51fb010af4e6c45b"
> -SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afcf
> f86ae0939a74f66ce030d4eed3bc3cbd9a"
> -GNOME_COMPRESS_TYPE="bz2"
> -
> -FILES_${PN} += "${datadir}/dbus-1"
> -RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
> -
> -EXTRA_OECONF += "--disable-scrollkeeper"
> -
> -do_configure_prepend() {
> -    sed -i -e "s: help : :g" ${S}/Makefile.am
> -}
> -
> -PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer - the recipe
> will be removed on 2017-09-01 unless the issue is fixed"
> -
> -PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop - the recipe
> will be removed on 2017-09-01 unless the issue is fixed"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

