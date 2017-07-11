Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61000606B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:04:56 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id l21so6608404ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 00:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+YtSnm8oL5gh4J2AN+mNH6YlCiagZfSNLAMqIqTwRY=;
	b=UKj3MkqNRzopP6rZ7wHoAKf4ZeSjJ1WmAHjr/72/u3avqyuZIH1yWALyrgrn74YJBS
	3CdgJiWZzEcODWX43/Z+rWQXa/ShDz6GS0JvEBlygZVdzbmQqF3bVpnVny2hhUWgOhms
	+rcYnnnva61tWTIsYKDs/YFaIemGxppBHaptrtqR4hiKmCQZKilyV2gtkNw5IXwJfVh0
	ySnTopX+/A5Xu1jxMVO7wOeBTKwiKhpW8wnMG8mJwN16aXZdps6jWsiiCdMv1Xi+ZOoY
	MS+BNJtSUNaveCNGHAoYpRxOMpQfaSRxvO9NuFIeWYi6/7D4gYSHHPZOMIYaFJ8tHLNA
	ZGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+YtSnm8oL5gh4J2AN+mNH6YlCiagZfSNLAMqIqTwRY=;
	b=Flwovv4yyLZWq09kyjb2Bh8TyEFTC6XDgWFDqsB+DX5QwAva/2G8hTuRlGSKBbeKvK
	0RKW4C/ljsjohbj4AQAYNyemgXRhFTTz0Amau/hYixbCdcW/tSFR7SW7AqTDxfzn7dfW
	MgFFxKN6HLN7f2Meb+HkUXIc5H06LMCadf+VWNnCqveHAlxkA+BNqpWxYoa59TYD0R5e
	i81yDUlq0Q9qQ5ZYJ9FcGHbVRNpun+WTKWLUtEIn9f7UWpxaBSSX6EubMjeZRKLgf04e
	+go5oF3NZNdvTHyxoJs3R0gm5qZK9lmma5qwmtps4jdCTP43AjqNTBpBoA34c+924ACs
	oi0g==
X-Gm-Message-State: AIVw1106vW6WHQibJ4PCcCHhWkGiINNm6Jylulw18kA6w+jPwHrxoCKG
	mwtbwc7foZqeVy64IWdfdA2a2ao+VA==
X-Received: by 10.13.230.12 with SMTP id p12mr3392031ywe.276.1499756698278;
	Tue, 11 Jul 2017 00:04:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Tue, 11 Jul 2017 00:04:57 -0700 (PDT)
In-Reply-To: <20170710213324.43346-1-raj.khem@gmail.com>
References: <20170710213324.43346-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jul 2017 09:04:57 +0200
Message-ID: <CA+chaQcgnc_ADfO9+xYC7KZqvAoe9+B1VN=w3K+ftxVuefMkOw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: Do not enforce gold as default linker
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
X-List-Received-Date: Tue, 11 Jul 2017 07:04:57 -0000
Content-Type: text/plain; charset="UTF-8"

USEGOLD
or
USE_GOLD
?

On Mon, Jul 10, 2017 at 11:33 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Provide a knob USEGOLD however to enable it if desired
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes-browser/chromium/chromium-browser.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium-browser.inc
> b/recipes-browser/chromium/chromium-browser.inc
> index 094a3d3..1e4fb1e 100644
> --- a/recipes-browser/chromium/chromium-browser.inc
> +++ b/recipes-browser/chromium/chromium-browser.inc
> @@ -200,7 +200,12 @@ python add_ozone_wayland_patches() {
>      d.appendVar('SRC_URI', ' ' + d.getVar('OZONE_WAYLAND_EXTRA_PATCHES',
> False))
>  }
>
> -USEGOLD ?= "-Dlinux_use_gold_flags=1"
> +# uncomment below or set it in a bbappend if you want to use gold linker
> +# to link chromium irrespective of system linker, gold speeds up linking
> +# chromium ( 8mins to < 2mins on a decent xeon system)
> +#
> +#USEGOLD = "-Dlinux_use_gold_flags=1"
> +USE_GOLD ??= ""
>
>  EXTRA_OEGYP = " \
>         -Dangle_use_commit_id=0 \
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

