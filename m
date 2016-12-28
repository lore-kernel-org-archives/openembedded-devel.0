Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96C4B6612C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 23:20:30 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id d5so13604648uag.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 15:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=pTVCtmDbp8VX3h17YF4mMz5ioWz6eeWYl5L8x6rXtiw=;
	b=LiJFlEQFwSxeMQ5cD0kA2CF/DSxFn11m1Fy9dH/NMekNRoX3Hpp3Fu1xGHmwdKjG+Q
	N8JphmDAkPgeFZT0HGzPJDi5Ko2BQAq3WPZcj0yN1Wxg6WdQfVUrmWDnct4Ai9XKiuiq
	Vo/4lu4899iQiDVnvbC+qxbh53fywSAdHF9QOy5Cjo7XHWjeW5YyHKpnih/6+fka7gz1
	axelXIMd47EHAAoAz97q57UTPnn8EBTvX+Edo76aPhpTveOHOfDiGuaTgJVWTbkxoyru
	UblQydPwhBH7MMBfKM79xDLJanSI+hHsi0YRwdK3XQDiJLFs4MJkMJbBDWhz7zVzurQj
	vUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=pTVCtmDbp8VX3h17YF4mMz5ioWz6eeWYl5L8x6rXtiw=;
	b=NEQI3EGmngRNqeudtcsFkkaW6Xtx9BGkiWgQCowLqWZJI0CERXH9tMmFBpdKEXDC1S
	D6S9kNisfUyi1GXjmRBV+PLKewQx36GfOWydm4soGUgcDrDc/mXGJCgu1DEFM0UrRLv1
	S9hLlWTHKpysgEpPMBSZp8+RF8MB1lFFMl6TkXaoBsg20+KzOQXY9j89OxAK/C4/oPBC
	MNAxApq2jPa5t/57KwnW+fAoWnhElBTBxB3xmnRSLHXV8pgotJTH6SXnChQZyuEMC5r7
	y4EcQnYyIOVE7shvc4m12qD3LHZgQ/S1WjaZP/Kv/Z5tTlodvpDt7ycpjlIzOwjIJOPn
	R8QA==
X-Gm-Message-State: AIkVDXJsehL49Uv15M4DP1HVRO9DZ2168+KtXBZvse2aX4R3D1amCf8SUSuWhziToxl8xLl9rTwUyD5kv+7V0Q==
X-Received: by 10.176.71.86 with SMTP id i22mr17442440uac.31.1482967231283;
	Wed, 28 Dec 2016 15:20:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 28 Dec 2016 15:20:00 -0800 (PST)
In-Reply-To: <20161228074640.21371-1-Qi.Chen@windriver.com>
References: <20161228074640.21371-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Dec 2016 15:20:00 -0800
Message-ID: <CAMKF1soFTQKwwz6BicXfguD722ZCq34hhad0RWqRGaDZVZYAww@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rsyslog: use atomic builtins to avoid race issue
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
X-List-Received-Date: Wed, 28 Dec 2016 23:20:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 27, 2016 at 11:46 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> rsyslog uses a small program to check if compiler has atomic builtins
> or not. This does not work when cross compiling, resulting in potential
> race issue. In fact, when running ptest on intel-x86-64 board, we have
> met the race problem.
>
> As our compiler gcc, has atomic builtins, we force ap_cv_atomic_builtins
> to be 'yes' so that rsyslog could make use of the atomic builtins and avoid
> the race issue.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
> index 4e2c122..27162e1 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caa
>
>  inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
>
> -EXTRA_OECONF += "--disable-generate-man-pages"
> +EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"

Does this also cover 64bit builtins ? secondly, a note for
architectures not supporting atomics to disable this would be good.

>
>  # first line is default yes in configure
>  PACKAGECONFIG ??= " \
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

