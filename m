Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5D971AB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 12:12:59 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id b186so111824961vkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 05:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=FIccoLh7hIUi8sYk+go1+0O5K7IrHEwdxyRMBHJ4rjI=;
	b=wL6MP/C9M+ZgSXq/iMdIfN8SkWFwWrK/DK4Q7bbazn30MX5jbZkHnbXCG7VxsL+OsU
	Wrs69HpIoSG7LD9S5QtHJdgQXYEvIkr79ow0cSbXwy6OHyI1XO0uld9CS5KcVW4JfxQA
	2xSIrIlN/dPcCXHuj27+pNwDm2nQYQnxOu+RmIlatM+nCB28KGF3HDGU4Hx2LYr09T9F
	x6WIzBDRwNZtg7wVE+j87wg6W+KzP2Z6y5wgYgpZywi6z+9a0wG0qLTuc828nPJi8SxG
	J2Yf6ae366fQQjUUURgSk2jF2+hGRKV4s4MqSlELqRxjPVLteSSGxy12+aNviW0n/W7i
	fbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=FIccoLh7hIUi8sYk+go1+0O5K7IrHEwdxyRMBHJ4rjI=;
	b=ZfnzvS+x3G6AXPTrMh7IzYJdHCZ4hV+UrPhpaZs+LzxkyIyOldtx3QDLEBI1/bP1Fq
	59kEcuAPCwhALQkAR4SEUnnTmkfTxsocHl1MN9mZ18G0e2fGR1RHmRzfX++4xBh1acKA
	k9pl1pe6Z4n6G+CyGGmf8dTsKAEeqzy0/42HzXzmEwuGHZ5RlL68BckX3XUTO8dC+tT0
	rOxndhc+vgj7yKIXo29EdDf4pRswQkKcz61ZhL8U9SGOXW7WOy3FOhfyC2joi5KfJtCP
	1uSppbqynLCF2dm0taspaWWej5HGMZJ2LQ9nYp1Ca8w7jMBKepibM70U0JaUMF/e4Cc7
	wkIA==
X-Gm-Message-State: AA6/9RnIsoqU0hPGJ/B987Wg7fQxEZkLuJZEvY6RQjtYpRL9urv7i8cap0lGcZwcZO7EWEA3n2J4amj1e7+qtA==
X-Received: by 10.31.0.67 with SMTP id 64mr8349260vka.173.1476447180163; Fri,
	14 Oct 2016 05:13:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Fri, 14 Oct 2016 05:12:29 -0700 (PDT)
In-Reply-To: <20161013184121.18637-1-Martin.Jansa@gmail.com>
References: <20161013183247.GE2924@jama>
	<20161013184121.18637-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2016 14:12:29 +0200
Message-ID: <CAMKF1srWAdJNf3a6WFGQjBycHX1YSHh2USKcywp4GKB0YaoX+w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCHv2] chromium-wayland: skip when CHROMIUM_ENABLE_WAYLAND isn't enabled
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
X-List-Received-Date: Fri, 14 Oct 2016 12:13:00 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2016 at 8:41 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * otherwise chromium-wayland recipe might build with CHROMIUM_ENABLE_WAYLAND 0 and then
>   autodetect couple of x11 libraries
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on atk, but it isn't a build dependency, missing atk in DEPENDS or PACKAGECONFIG? [build-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gdk-pixbuf, but it isn't a build dependency, missing gdk-pixbuf in DEPENDS or PACKAGECONFIG? [build-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gtk+, but it isn't a build dependency, missing gtk+ in DEPENDS or PACKAGECONFIG? [build-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcomposite, but it isn't a build dependency, missing libxcomposite in DEPENDS or PACKAGECONFIG? [build-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcursor, but it isn't a build dependency, missing libxcursor in DEPENDS or PACKAGECONFIG? [build-deps]
>   chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxscrnsaver, but it isn't a build dependency, missing libxscrnsaver in DEPENDS or PACKAGECONFIG? [build-deps]
>
> * reported a while ago in:
>   http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/109131.html
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> index f7ad2ce..bbba147 100644
> --- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> +++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> @@ -28,6 +28,8 @@ python() {
>      if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
>          if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
>              bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
> +    else:
> +        raise bb.parse.SkipPackage("CHROMIUM_ENABLE_WAYLAND isn't enabled")

This is ok.

