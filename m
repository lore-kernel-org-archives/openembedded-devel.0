Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F06965D35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 09:13:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i11so4393293wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BaGo9cSeuVbuXWMqsaP20MZAtCbLISK4BasUQtXm1Lg=;
	b=hV4PnKJI6K5/tWlOL5sZFqJnu9Qc5rC89WY7twJRyTcZRdaeHwHyR0fI1quWnpjtc4
	BGeoQYB+zUAgWbpwo0YA2pqH5RvN6yJcPhM1f4ZtIfZzg/NA9W8id64+C3DTQrHllPNk
	YnPzcrfqgjT5JPoZNGvotAvag9n3JWWSjBxe+lZ/WUrGh4TSmm57Df1vwJlDZBePi7yp
	2zZPjfS4fvMNPmvnnkQvMHmvnlQWsHwsUzNH+iShcpDgQGAp5aYr/Dm9hc9oJ2VH1vne
	q90Y510Re8rAWijust8OqORUGNC1e/bzE+rmNAFr78itMqQlz4uF22hlNBb8AqV60MpT
	xWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BaGo9cSeuVbuXWMqsaP20MZAtCbLISK4BasUQtXm1Lg=;
	b=QKgJxSnK45QSP7eOktyuee1cOQMtR8GFOENm46V86x38BoTLV7zVFI8yAz2Az2LL/5
	15oKHt91vCii7IhiBCV76CCka+/bswWPO8KF1UHoiOYTJA4/6hd0jd+Vc+TP5w9zgyGM
	jj3NPAOKfnpO2UwHFAt/EGa/+jh/twU3EA6i6iAq9/jkq3ZuhCzU/VzoBslF39LuIkqN
	SiXlovAUuNIxy+5CiMgvQttTTIyUOJtk0On7fJVJP0vDU7MFjiDVY3jkq3jVKEu89R7H
	6D7e2VSs4rxQ/Enhrt8HjwOByRe10bmz7VU0jhMCTXGsBSUjN95bNqNWMPf0PpB5RwQh
	iWpg==
X-Gm-Message-State: AJaThX6+jCTghewdK5zpcYfxu+m3N6z3lG4jZjM1VK+1D2QQQb44BkNx
	jkwNJAJCeMS7oVcJO2aiIPOA+tRwXmBFehvaAdI=
X-Google-Smtp-Source: AGs4zMZCT5N4osenf6b4jinvyDiNcVK9NXNQed0pvkkg3wo1UdF1LtGxYh5ITqWHBUfpsqI80tj2mgaZlH+0UwUUSCo=
X-Received: by 10.28.173.199 with SMTP id w190mr1892023wme.69.1511946792867;
	Wed, 29 Nov 2017 01:13:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Wed, 29 Nov 2017 01:13:12 -0800 (PST)
In-Reply-To: <1511925300-19926-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1511925300-19926-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Nov 2017 10:13:12 +0100
Message-ID: <CA+chaQejZPaMESxLo2do+ik0SCc72tyzqo2bKXSJGokCHNF0Sg@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] xrdp: new recipe
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
X-List-Received-Date: Wed, 29 Nov 2017 09:13:12 -0000
Content-Type: text/plain; charset="UTF-8"

You need to inherit distro_features_check as well for
REQUIRED_DISTRO_FEATURES to work.

On Wed, Nov 29, 2017 at 4:15 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Add a new recipe xrdp_0.9.4.bb.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
>
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> new file mode 100644
> index 0000000..4164936
> --- /dev/null
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "An open source remote desktop protocol(rdp) server."
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
> +"
> +
> +DEPENDS = "openssl virtual/libx11 libxfixes libxrandr"
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +SRC_URI = "git://github.com/neutrinolabs/xrdp.git"
> +
> +SRCREV = "c295dd61b882e8b56677cf12791f43634f9190b5"
> +
> +PV = "0.9.4+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

