Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 39DEF7F7CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 17:04:02 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id x21so24916845qto.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 09:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7WXLNS/o4d10rarrNKMqoJjL687p4q1nLe21ZGlaF9A=;
	b=j2USN+ok85hzSgCCqyUt4D8/BjeKwaCFNOf8clqqgMuNOyW2cKzz6ylKyVxrGip2m2
	N+srPUwYW3GCjWdKY7dOtCsYP5U/YXz2CCFSDv4rfX18xEVIFZcSZx/VoL7y9iIGg+Xk
	hJFk8KC9W45O7sKpmIYq+gyxo2jWsq1jQmFBM8RDFcCJxVSSxBT1Z5IOzLp7dOXkcH2y
	fClE8N+IjncPWf40bEoBO905L7hQ4LNxZD1XRjTv4vuBsC/9d36FdNbiM33R9N0ze00a
	BJdTMyFQbUVbk+KkbrHllB/89f420+SefWVkwyseIC8aFsh33YCR4srqg/Hd+tKcZJ2K
	Yzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7WXLNS/o4d10rarrNKMqoJjL687p4q1nLe21ZGlaF9A=;
	b=RILCNwcrzu+fwD8wtRnQK5qn3yF8iyBWV7uKX4+4DeZ/u+MSsC8Rm3SLp0EO7FfUJ/
	4ja/Gm3bQKIFW7qfyhOQAJS+IzjfW0c2VAjgNow3eykx/YMF+VwjWWy2rbqzxQsOKYgo
	Jc1urvz8QxhbFeyw9y+nhU7rKlh4bjl18Z+LFRtUpleHMVSwsvtRUDX/YS4KNwijn22Z
	7BomkWiIRdHUVZwF44gudtZT/K8BzCWSIM5kaaHoKOlxZHqNlylarQgWD3iZ3UyMbCrf
	k4V5AodWd4vNXoUEVauy6dSRPxORwtH7IzCqeqkLzafkmMlYm76jFkJ1du7PkZiiu3Gu
	bcTg==
X-Gm-Message-State: APjAAAXsICQyQg3bfXvVou3LL0EU/pDhaKIc2V7QQ/XTpGUq4qbPTzj/
	Cd5+Mhzw0PZfn+KywC1U5OO2zgEh7Gi4LG2Co6a3qw6P
X-Google-Smtp-Source: APXvYqzFj3ughldpZoPRSzizGpXhaVDpNthVrcTT0+drFVZ7fpSJSmp8TAr9WL2YO60QgH1mVFGI+pQWHgurso8qmD4=
X-Received: by 2002:ac8:2ddc:: with SMTP id q28mr13297592qta.88.1572887043168; 
	Mon, 04 Nov 2019 09:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20191104155948.3080-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20191104155948.3080-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Nov 2019 09:03:51 -0800
Message-ID: <CAMKF1spk+Nx6Tcp5CstO9gz0K3Lbf-Ayw2KuLkxKgcp3hbTy8Q@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe 1/2] iwd: Use python3 variant of docutils during build
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
X-List-Received-Date: Mon, 04 Nov 2019 17:04:03 -0000
Content-Type: text/plain; charset="UTF-8"

This is in master already

On Mon, Nov 4, 2019 at 8:00 AM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> From: Khem Raj <raj.khem@gmail.com>
>
> python2 is on its way out
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-connectivity/iwd/iwd_0.23.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> index d48fb8450..20c6d04f7 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> @@ -2,9 +2,9 @@ DESCRIPTION = "Wireless daemon for Linux"
>  LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
>
> -inherit autotools pkgconfig systemd pythonnative
> +inherit autotools pkgconfig systemd python3native
>
> -DEPENDS = "ell readline dbus python-docutils-native"
> +DEPENDS = "ell readline dbus python3-docutils-native"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
>  SRCREV = "77f16ae26fc013477f6362a0c33f0e52e82863e0"
> --
> 2.17.1
>
>

