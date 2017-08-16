Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id E5F7560778
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 12:52:53 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id g189so11741686vke.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uyyypsnlSVvFv9kIAvOM5wxFWL/BJJ7F6A2yABdYcVI=;
	b=Pzhtno1CkBSumTNQzIJ0eqHY4OpnwPxuDm5yY+AAZZoR2kilF6pITl2h+McbyjMZDt
	rWNwYxOv0zhKkqo0moLpsyJ4bM97S9PWb9JhNvqA1lh8+mwF3dQsiKKrD657goUTq8KM
	qel8F2bLWoFHXyTPpJJZZxUSKoA1dUXWHgXKjvZZCKavlWBe2PKaqVdaTwJyF1fCXoAX
	LETElUd6kyoevR4MskoZSmaVIuw7bHIlwtJGWyJMwhBg+LIUphhL0bXUPwuA80N0pQEs
	XgLZj8ajxpR0k9qylHoaYWmZ7VvFFvT48KCGyG48pBNu+nQ+1eHKx1sgdi7L/L/yxHbi
	Ckow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uyyypsnlSVvFv9kIAvOM5wxFWL/BJJ7F6A2yABdYcVI=;
	b=rAL7A4Oc539tUs+yaK13lfiLDUxscrJajPTC8vrt15L31xgvujaR3DPIP4mRaXMPzb
	QKWcYO9Uei5DTKz4Ea77BonadMupXRC7WI+gwW77FCo+xoZO9PcjTTsm6ssHuGBnsyV9
	syxvocbGpBddAyCwUssboa8N7oO7W96fJ/VeMbmY6wz19c4baSRb/R/OGV+L1Aa/QlXm
	W8TIL2eqmtVBX25yqOw2bb9gQEGhyAohhJHzVIJlW5vD7z1t/h7Pf2cBE0IwHh8YhHXM
	C3+z8xJtbT2UYamfTIylOrCbr/XaB7z5pFK12wN13YJ48Hcn1weiVjhDORSw+H5FWtp5
	atjg==
X-Gm-Message-State: AHYfb5iftAsIoffNJCNr7EldjQJH8XSC6ypKiwOUsd4GhsjC+K3ouM5b
	H+J/Fmi1hZI5L+arr+XGBr4NWMwWWQ==
X-Received: by 10.31.154.1 with SMTP id c1mr1031756vke.97.1502887974622; Wed,
	16 Aug 2017 05:52:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Wed, 16 Aug 2017 05:52:53 -0700 (PDT)
In-Reply-To: <20170816112351.6854-1-pkj@axis.com>
References: <20170816112351.6854-1-pkj@axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Aug 2017 14:52:53 +0200
Message-ID: <CA+chaQe6-aw0U46i1rPpU0rmhURa_kSincAtdTJVmx7PA_8AdA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] start-stop-daemon: Only create a link in ${base_sbindir} if necessary
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
X-List-Received-Date: Wed, 16 Aug 2017 12:52:54 -0000
Content-Type: text/plain; charset="UTF-8"

Missing SOB line.

On Wed, Aug 16, 2017 at 1:23 PM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> If usrmerge is enabled in DISTRO_FEATURES, then ${base_sbindir} and
> ${sbindir} are set to the same path and the symbolic link from
> ${base_sbindir}/start-stop-daemon to ${sbindir}/start-stop-daemon can
> (and should) not be created.
> ---
>  .../recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb  | 6
> ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-
> daemon_1.17.25.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-
> daemon_1.17.25.bb
> index 5ee4472cd..cc2727b75 100644
> --- a/meta-oe/recipes-support/start-stop-daemon/start-stop-
> daemon_1.17.25.bb
> +++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-
> daemon_1.17.25.bb
> @@ -31,6 +31,8 @@ do_install_append () {
>
>      # support for buggy init.d scripts that refer to an alternative
>      # explicit path to start-stop-daemon
> -    mkdir -p ${D}/sbin/
> -    ln -sf /usr/sbin/start-stop-daemon ${D}/sbin/start-stop-daemon
> +    if [ "${base_sbindir}" != "${sbindir}" ]; then
> +        mkdir -p ${D}${base_sbindir}
> +        ln -sf ${sbindir}/start-stop-daemon ${D}${base_sbindir}/start-
> stop-daemon
> +    fi
>  }
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

