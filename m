Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id CC0E2784E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 10:03:18 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id i11so11244883wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 02:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CslZ3GMVfH7U4DY89y1xknfUUAZ/YtTEOIED7N08iDE=;
	b=XI2FZrr0eREPElqKmyyy2RXnD6UtqTq7PEP7CIKrw0bP3UDiGFhH/CHXXxBaDb4v4D
	cDw8z2MQ0HJI6txb8plm5Xa/ITtk4kQG8o8iOuJTit8yVkYZrFOMicWYGNW2fvMOuVUm
	5mKfECW2KVPWrbp4VmRHKnlat0ghuDuQ+cn/hAGCp+HU7t40MzAtjGA01WnTnrsOza4+
	EpxwKiEHa6xz8gwdicNxFvPOsgTy07u2wzdz5LQzQL6DcnPejNmxAur2J5PbxJv8jdD7
	qeB8suNKDkRNK5Dn1P4nx1zyGWQiXPI/wtYedHS/9DhLZXp9YYQy7IXfzB/ZG2bDPJvB
	pdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CslZ3GMVfH7U4DY89y1xknfUUAZ/YtTEOIED7N08iDE=;
	b=SB8/7R4J0rFURRmbeo9Xl3dzrM7TbSc62xM8NShTZMKAHAVa+w0z9yY7F897Rzh4jz
	0LKfbcyxCOYnQ+2mt9gaO2cm/TnANsXsZngTDwDlwtPfpC7Cz9kdefDwbFpUVCQ/0aIp
	cR31v2eAnw9TAmbhD3CPVvQgcrr0/Mnp4Ppe0kqTecSekr1cZ6asT8YETpVdfyhS+cqs
	rYs78KQxYrlMKuCb9TijQEW0A2YqMSQZgqtGAvReZo3Mw5S9tKlXoJBR8MRsnft+st0m
	Zi7V+orFr/20MvkSRXjKz0jicHaLMtrRQn7h/OktVcDfhP5OF/0jjpUeN0yC5vVSS2gc
	CWrw==
X-Gm-Message-State: AJaThX6BDgpD282/uSFS2Wn6pAwAw4RolH9s1bjTuiCMjx6AN98dxxK1
	PQHlS4X5zYlWEhopPFPqaqGIWqrITankQDu2ypU=
X-Google-Smtp-Source: AGs4zMZ+iK08SJukTYdik0gEuCmGjh0wSh0dmnAG/vchSJMQgvkDG+AeMCOOmqR0z7jT9ypruK88aOxSY6jnXhxTBHk=
X-Received: by 10.28.65.65 with SMTP id o62mr76886wma.112.1512036199330; Thu,
	30 Nov 2017 02:03:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.105.70 with HTTP; Thu, 30 Nov 2017 02:03:17 -0800 (PST)
In-Reply-To: <1512018832-43434-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1512018832-43434-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 Nov 2017 11:03:17 +0100
Message-ID: <CA+chaQdMZeuwrJNeD5McBuT3GbRfg_kxAFfK81BLwADFvqAhoA@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] xrdp: new recipe
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
X-List-Received-Date: Thu, 30 Nov 2017 10:03:19 -0000
Content-Type: text/plain; charset="UTF-8"

Now DESCRIPTION somehow is back.

On Thu, Nov 30, 2017 at 6:13 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Add a new recipe xrdp_0.9.4.bb.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
>
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> new file mode 100644
> index 0000000..92c2289
> --- /dev/null
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "An open source remote desktop protocol(rdp) server."
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
> +"
> +
> +inherit distro_features_check
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

