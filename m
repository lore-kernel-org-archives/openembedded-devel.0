Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com
	[209.85.161.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4607C1EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 17:54:10 +0000 (UTC)
Received: by mail-yw1-f44.google.com with SMTP id b63so4157865ywc.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oUZtNTVFnGB16LoTObnqPCtRMCEKGMtLqCvr9G98peY=;
	b=cZpVxH/AjoVkBAn76+MTqxCKRbrgjssNfjKCHkUrAmBQG59m0gklrKfDhLZ/HXH1Ik
	Wkjjfmb359pC8hBzT6f3e86Dl2Dpmf7G+BWfHhwdJyDPYGWQhJWDFHrtdf1Cbjk4uDzm
	X439KMaPJMP1L6uxG3WyhPvw8hS1xK6tuuiwjAKcFu3M8JKF/QfXb1JaKA4RTt+el6Az
	d7fO/xyKWJqf3V3NF9DrGV9S7K/2QQH/vSy17gaLbp8kCfkNdSrAfiEUS3h+19Gd1mHw
	o+89Ewo1eU1hQY641YjBNVlUsz6q2910G2eZXn97F+nW8AXOu7ooOoAmZ/xe0ydnyaIp
	UPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oUZtNTVFnGB16LoTObnqPCtRMCEKGMtLqCvr9G98peY=;
	b=p+AFrS3NGGtoLRJR06Uo49z36kGRZXpw660pnrBKGX5Jwid9vVtb+w0/xceQhBlqoX
	uxngGIJ1H4uGjkfxCrysI2XtDsmq2nFQg5eCr4NVuQNJEVLGGNUcTvs5EiDKc9+1xuzg
	bpZAkfF07PORkhRQe4/u9r5riD7SYwzsY8MBb14qfHU1GZPZXyQR7OXLmByDefNdm0lK
	7FNdn38Oj6Bpxmq/Us6EKaaVeBL6LhqRBDuPXF3NWqFqX4XfUlllbZt4PNA1+0BC1THr
	+Bjo+dyXTTXS59ZfNzAXAG/xR0cM2pfwFtAbGXz9Eo2d/8mCcyYC0GcByY+ObpUTPmSZ
	jCug==
X-Gm-Message-State: AJcUukfmC2z+9eaqK03U57KnsRE1nPVGVqbxqMQ5WhIEWSk+mp71R7TD
	tih1HhveQS9m36jV//qQtoQqhUlZp4iHOcnKim0=
X-Google-Smtp-Source: ALg8bN5iIxp2IB3znIxEWWzRz+GMhl2Frt9MJPUisWebdMyMOSpHwC/ZZTc0/g1TJU0MequMrOq1gnC15s5C2+X+Gcc=
X-Received: by 2002:a81:202:: with SMTP id 2mr14535230ywc.291.1547747651542;
	Thu, 17 Jan 2019 09:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-3-stefan@agner.ch>
In-Reply-To: <20190117162629.47677-3-stefan@agner.ch>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 17 Jan 2019 18:53:59 +0100
Message-ID: <CALbNGRTLbuAi7czFzrSw4knWDR4t4Nq_pzsuTT6pVeY3vLYTig@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] xfce4-power-manager: enable polkit depending on distro feature
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
X-List-Received-Date: Thu, 17 Jan 2019 17:54:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> systemd and polkit are not directly related. It is just fine to build
> with systemd but without polkit.
Surely it builds but is it still usable as unpriviledged user?

Andreas
> Rename the systemd package config
> to polkit and enable it depending on whether polkit is enabled in
> DISTRO_FEATURES.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
> index ed117b0a6..1cdcb4160 100644
> --- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
> @@ -20,8 +20,8 @@ EXTRA_OECONF = " \
>      --enable-panel-plugins \
>  "
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> -PACKAGECONFIG[systemd] = "--enable-polkit, --disable-polkit, polkit"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
> +PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
>
>  PACKAGES += "xfce4-powermanager-plugin"
>
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

