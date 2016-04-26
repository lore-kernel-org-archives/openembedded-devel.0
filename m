Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 401BD65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 13:25:39 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u206so6526696wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XduQ2KXjX0L49YjtwfJT8KO+7Rm7k1TDOMTq4JE1KZ8=;
	b=hNN+NVK+o/8C//XE514iRkDiSUxyQj/ll5VPMr8nfDHeeaEzoVIAkl2SmMK4ZmUJR/
	rd9FHDiR5uBuVk9as3wEhWmA2lTE0F9SR74Xka7KBZUgCof1SaNfQ+W2/hVHviqhD/92
	CqpimyrL4FRWboIQ8EvW/hsFmqLnOIIbQOxqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XduQ2KXjX0L49YjtwfJT8KO+7Rm7k1TDOMTq4JE1KZ8=;
	b=CsA2UMqUkHkf15zNboyUXKa0JLUUJzIDaPxESO068HaQUXEmwrOWF9NMSiY2DYgypS
	UsQ/PW21RzfPp4UUyfKKNNd35K+yY1P3krTgolNGZOztrLg9+pqDAlZNIGXH5CP3wyQm
	OkNxFcinfGGMD09PRlfSsq+KEIrSHxSNTQ4ICt2HA9Pbfg67LpcOAnpUD95M7lxdp7nb
	3pA3GfS90RraGxk52eYHWQOg9KW9/ISl6eSuaQiSAAnPdI7rzh2cESdv2I262m5EeOvV
	rwdUbTWj47aPrMmVe6ycS0Iz82A29Ea08gNG+5HRXzelsQMZhFbw5dQR8E2Awx++i7tf
	0JYA==
X-Gm-Message-State: AOPr4FWUC/2/GWD3w2BZjKppGprQTvFXCquUsnUJOOu20WKLI1Eu/3qHMyoSVv6HU1S2lt0T2biqZV8FwNwirIh2
X-Received: by 10.28.139.129 with SMTP id n123mr3724353wmd.13.1461677140063;
	Tue, 26 Apr 2016 06:25:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.2.2 with HTTP; Tue, 26 Apr 2016 06:25:20 -0700 (PDT)
In-Reply-To: <1459776944-1846-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1459776944-1846-1-git-send-email-nicolas.dechesne@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 26 Apr 2016 15:25:20 +0200
Message-ID: <CAP71WjwZ=GT446CC1UfytKKH-DKVn+OPfBe-okCikUcahjetTA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	akuster808@gmail.com, Martin Jansa <Martin.Jansa@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [meta-oe][PATCH] openbox: add run time dependency on openbox-theme-clearlooks
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
X-List-Received-Date: Tue, 26 Apr 2016 13:25:40 -0000
Content-Type: text/plain; charset=UTF-8

Martin, Armin,

this patch was merged in master, and it applies cleanly on jethro, is
that possible to get it merged in jethro as well?

thanks

On Mon, Apr 4, 2016 at 3:35 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> Without this default theme install , openbox is unable to start, and shows the
> following message:
>
> dragonboard-410c:/home/linaro# openbox
> ObRender-Message: Unable to load the theme 'Clearlooks'
> ObRender-Message: Falling back to the default theme 'Clearlooks'
> ObRender-Message: Unable to load the theme 'Clearlooks'
> Openbox-Message: Unable to load a theme.
>
> As discussed in [1] , the solution is to make sure that openbox-theme-clearlooks
> is always included.
>
> [1] https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg47153.html
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
> index 9f42177..b354ae7 100644
> --- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
> +++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
> @@ -37,7 +37,7 @@ python populate_packages_prepend() {
>      do_split_packages(d, theme_dir, '(.*)', theme_name, '${PN} theme for %s', extra_depends='', allow_dirs=True)
>  }
>
> -RDEPENDS_${PN} += "${PN}-core ${PN}-config"
> +RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks"
>  FILES_${PN}-core = "${bindir}/openbox ${libdir}/*${SOLIBS}"
>
>  FILES_${PN}-lxde += "${datadir}/lxde/ \
> --
> 2.8.0.rc3
>

