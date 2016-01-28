Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 98310600B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 11:52:05 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id m139so2538790ioe.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 03:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zapVILYIvP9pSHoFYzSku2QMw1/1SBxTFwVXib9jg0E=;
	b=MWxpgdz8ii+kgAzCjKOZxSlIRkiZlaGZgvDg3u3DJ1iC1qdt6uwZ5nfUIOJYrma0Nt
	NZATJHSB3hcnsJ23LSbXqqhF6iHAyTs+72a0rEQtr516sNrv+LO9pZbap7J5goglUS7k
	qaXILEJgbR2urhapILc6mH1qwGWbzRstzsDX/UczBBDYO7B5aiCzXmwxWaIVJIS2i1qn
	Pkf0b3900dG2vwQj6QTMMFF91ABY4hebw6XZdjrdehSlLJfE33hm2wFoMUyFXoEX4hzS
	LI4mDSvYV0cpL/6/JKUxb3wDC3OBqDiOd74kJLyd0GA/AcaRFTmx4btrnXIZyAmkZkY4
	AZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=zapVILYIvP9pSHoFYzSku2QMw1/1SBxTFwVXib9jg0E=;
	b=ku9dD5NSky/moJZE4OZ/AiHfvp2RcFfPNIMmHaaSyrJuHxJ11vtrDFr7Wvh4EdHPH8
	lHb5HgLOJ3Ug3WsOfM9K393ikCZze6kJEc64xCtUumu1/3s1jxwmNNJ5PE17JAdOYnsW
	JUZtCWctzJUqfidL2ckjG8T/0rE5H72tjnrbyy0rLo2cML+8U+x5f1695aoNg8LLOSOA
	r4yhuEAh1fwUkqovQwRZ+rsphD3B8I8DPGeUIty04dO83DW0EH1atw2lhak5OMOSyHZq
	ikGQg4IvjLh0e6VH5mAV7snN3/xfKGAdj/9dbeMkJLgGhwYAfEWB82+5P8uD2mP00lRU
	IFpQ==
X-Gm-Message-State: AG10YOQhEUmB2y80k/Te4aN4NHq7UWUqPo2wgzPmJ8OQ/uxrB51W+MKWzB3Zi0g4IZp8ztNgWL5oQznf4wKw+w==
MIME-Version: 1.0
X-Received: by 10.107.164.38 with SMTP id n38mr3181037ioe.148.1453981926152;
	Thu, 28 Jan 2016 03:52:06 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Thu, 28 Jan 2016 03:52:06 -0800 (PST)
In-Reply-To: <1453978491-8849-1-git-send-email-adrian.ratiu@ni.com>
References: <1453978491-8849-1-git-send-email-adrian.ratiu@ni.com>
Date: Thu, 28 Jan 2016 12:52:06 +0100
Message-ID: <CALbNGRRTKH2BsXQbB7di3geApmPLz-A_gGaEnGzyLEJzPkX7-Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 1/1] xfwm4: add patch to fix touch event handling
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
X-List-Received-Date: Thu, 28 Jan 2016 11:52:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 28, 2016 at 11:54 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Patch sent upstream, pending acceptance
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  ...handling-of-touch-events-on-window-border.patch | 42 ++++++++++++++++++++++
>  meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb       |  6 +++-
>  2 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-touch-events-on-window-border.patch
>
> diff --git a/meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-touch-events-on-window-border.patch b/meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-touch-events-on-window-border.patch
> new file mode 100644
> index 0000000..e01aac5
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfwm4/files/0001-events-fix-handling-of-touch-events-on-window-border.patch
> @@ -0,0 +1,42 @@
> +From cb966e51ea51088a1d4fd5914fc7f917684e0b51 Mon Sep 17 00:00:00 2001
> +From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> +Date: Thu, 28 Jan 2016 11:43:01 +0200
> +Subject: [PATCH] events: fix handling of touch events on window borders
> +
> +When the Xorg server translates touch events into ButtonPress/ButtonRelease
> +events, the subwindow in the XEvent structure is set to zero. This change adds
> +a querry to determine the subwindow for the event in case it is missing.
> +
> +Original patch & discussion at [1].
> +
> +Upstream-Status: Pending acceptance
> +
> +[1] http://xfce.10915.n7.nabble.com/Re-Xfwm-window-borders-do-not-respond-to-touch-screen-td42357.html
> +
> +Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
> +Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> +---
> + src/events.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/src/events.c b/src/events.c
> +index 8aa0f0a..0565594 100644
> +--- a/src/events.c
> ++++ b/src/events.c
> +@@ -917,6 +917,13 @@ handleButtonPress (DisplayInfo *display_info, XButtonEvent * ev)
> +     {
> +         state = ev->state & MODIFIER_MASK;
> +         win = ev->subwindow;
> ++        if (!win) {
> ++                Window root_ret;
> ++                int rx,ry,wx,wy;
> ++                unsigned int mask_ret;
> ++                XQueryPointer(display_info->dpy, ev->window,
> ++                              &root_ret, &win, &rx, &ry, &wx, &wy, &mask_ret);
> ++        }
> +         screen_info = c->screen_info;
> +
> +         if ((ev->button == Button1) && (state) && (state == screen_info->params->easy_click))
> +--
> +2.7.0
> +
> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
> index 41daa00..aa4b290 100644
> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
> @@ -6,7 +6,11 @@ DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbu
>
>  inherit xfce update-alternatives
>
> -SRC_URI += "file://0001-don-t-block-display-events-when-time-is-set-backward.patch"
> +SRC_URI += " \
> +    file://0001-don-t-block-display-events-when-time-is-set-backward.patch \
> +    file://0001-events-fix-handling-of-touch-events-on-window-border.patch \
> +"
> +
>  SRC_URI[md5sum] = "197ef087ca6a263627f1bea6d5a79d6f"
>  SRC_URI[sha256sum] = "f4a988fbc4e0df7e8583c781d271559e56fd28696092f94ae052e9e6edb09eac"
>
> --
> 2.7.0
>
I've checked the thread you point to: I am using xfce for touch
screens and can resize windows, maximize them, move around and close
them all with touch. What kind of error is fixed?

Andreas

