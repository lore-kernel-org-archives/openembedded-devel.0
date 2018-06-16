Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 10FDB71984
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 04:23:50 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id s187-v6so6795251vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 21:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YJgJYTHvrAcEAKL+1vYWxlkoou5qSiMtr++TWC/4xYA=;
	b=CNoHWhFzwDngx+jqCuk6R0vxRvxfq9TgUYW/wKooYZDYz1AUZ0CFwQkNsYFs/u4V07
	+vBuwq5W0jM1LC1aloNiWzW5i4yljEmNh9myImtzuc5W427IHxv19AKJH9ZXkue1LaDv
	TVSNYT+Y52Chb2SfJtLQgCWtbjOYDu6qH6bgvbPaAc1xHPcdBDXRupXdHRo1ndmgu7Zh
	3Iiq61lNDDDuNhgw4eXTFGeI6xoK36XEJchM8PLP3au1iV7kjtickT9RuSNBK+S5MO+H
	rmb+8Yj0nHtiCB6NaZKPR9sCOnn1i3h/aD0dl/RdDIUPMUZ7Tbiups/byCq0I0jZeGw7
	/UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YJgJYTHvrAcEAKL+1vYWxlkoou5qSiMtr++TWC/4xYA=;
	b=kP/jzp1Y9vddQortE0JHudzsGz/b++iPgcq01SsOe3CFyvI++BDJL9jEWXdhOV+qzy
	vs726Hv0DgD1+7tbA4c3R0xm6h6bE2l0hSMoOWQgeFgZtMR2J3NOEG7IiCheG/N80j/h
	yzVd8uMN4C5AslEdd1bqeoCyhnwn0rm808RdxR6WwetV58zfBn8hbgatSIXI7N6VLJUz
	u3E6zYBWbVKyILxP/UUzV67ZHse+3xEJTCWNZK0EKu5CoIWoooORAgpq9xeVWnqExSHS
	CQjKeaZp2WpxyK+oNU1yMgXNp+7/D/KW/15439IjZX8WjMonWkB79nf1bM2OnFLMglX5
	6bEw==
X-Gm-Message-State: APt69E3fG+NOeVx0gg9JaTMrkLPo7lZWUPrSSdeFt+7nIx/Elia6f5+v
	Y5f73NjU0iyCFDrBlGioSS9d/C+VjMIQBQn6uTc=
X-Google-Smtp-Source: ADUXVKIMz1Lx/IAY1ka0KSqtlcSqDebzuTbfQQSx6NQ5CDAmyvNX86Supxevv6Nts8ob+oFtVXpJXg8RVHb2YOTWT6o=
X-Received: by 2002:a1f:7c4:: with SMTP id 187-v6mr2526773vkh.60.1529123031565;
	Fri, 15 Jun 2018 21:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <1529119696-3508-1-git-send-email-jpuhlman@mvista.com>
In-Reply-To: <1529119696-3508-1-git-send-email-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 21:22:46 -0700
Message-ID: <CAMKF1spRUMqmBR6V8Yh2v0TM9u6tgWU=jshE_pW-jEDYnY=Uyg@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] stunnel: Use nogroup rather then nobody for group
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
X-List-Received-Date: Sat, 16 Jun 2018 04:23:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Jeremy

On Fri, Jun 15, 2018 at 8:31 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> [log_check] warning: group nobody does not exist - using root
>

I do not see this warning in my builds. Could you share steps to reproduce it ?

> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  meta-networking/recipes-support/stunnel/stunnel_5.35.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
> index ec8478d..427c8dd 100644
> --- a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
> +++ b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
> @@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "ffa386ae4c825f35f35157c285e7402a6d58779ad8c3822f74a9d355b5
>  inherit autotools
>
>  EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
> +# When cross compiling, configure defaults to nobody, but provides no option to change it.
> +EXTRA_OEMAKE += "DEFAULT_GROUP='nogroup'"
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)}"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> --
> 2.6.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

