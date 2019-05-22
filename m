Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id E20C17E341
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 00:52:26 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id y42so404637qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 17:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7IOyU0xgRAY41jwfivzC/2iPxlgD3xxbAlmmpYcHKRY=;
	b=rxjHsaVnunWqO0h6/Wyg+savbIPtziiXrqVvah7GrJ7l6J5iAT1b96EwxvDnH4xu/T
	wuLast9Gp6EqyvOcBqbonewjs4S+M6P3DjZkVRUvergCzonqk/1gtDFCyhHqsWriBJ10
	P4UVpWWXJaRgvHKc8b6a3eB00pRrfsmyyrudVMENuicOl4FSNKyK4tf0ZWY9LhNPIllc
	s8T/5SvVW8ezbmGtnevfEVHJOXpHy7f6KEQ+7HkJJAXvEnPNSeNv+LE1CyVH4gQ8LCsY
	99X5Yx1JHfxZSk1HxlgnAD6PNzm7VKUc/xGblZiRdKMuTMOlPeox6EjstdZq1B5ro8b8
	ASIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7IOyU0xgRAY41jwfivzC/2iPxlgD3xxbAlmmpYcHKRY=;
	b=F9USHyBCyVJQ/BN1KnjElbyllrA25v42r/EmMxo2hbJErkFB1cIjpQRcU7kDCi9o0G
	ZgDSNNCy0VxH50ySlrIh3FhuxH6h/K4mQ+u3cGEJLFOL3KIt/NIiNKY6YQPDWEKkZNVV
	NG3Gv3R6iA8eM02c00u7PC2VVAOBOcPlSkOsejjOzccqcEmA4LCDb0QDGowi3jhxMhye
	66fy9LhJWTRIueDq+msH6MdELXBtwNAmTtFrTt8o3x2oFCDLUli5TMsGyJkcNc1ILnpN
	8yGBaq7wyD6g0pxUdV9G7+abCMESAnousCC/dqrGI9IBcH8ZkJ1+ksnlmI09lRiv9AqZ
	E9xQ==
X-Gm-Message-State: APjAAAVRpcdAhOeR80myyVUhf4SKpN1GjYu9Y8PuYi8T99D1d6g2ch2U
	CZPVW/YenIQD8NVL0lwwccCPYA0tnGALp6TaUFc=
X-Google-Smtp-Source: APXvYqxVxMEPiDCOp9cZ4eQWLk/BBdFLkwn1w1a5GMDw6TVMf483Du+ztPTTJ9bnKnieCUndri3qNftf0i7wOP12Qk8=
X-Received: by 2002:ac8:2f35:: with SMTP id j50mr70036687qta.378.1558486347414;
	Tue, 21 May 2019 17:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161348.20347-1-alejandro.delcastillo@ni.com>
In-Reply-To: <20190521161348.20347-1-alejandro.delcastillo@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 17:52:00 -0700
Message-ID: <CAMKF1spQMMOoKqt0zD1MwBnX3D8MF4PPjO=1eBe_y5RKGdWZTQ@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] apache2: add all extra/*.conf to conffiles
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
X-List-Received-Date: Wed, 22 May 2019 00:52:27 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Alejandro
Please rebase/test it on master if you are proposing it for master.

On Tue, May 21, 2019 at 12:01 PM Alejandro del Castillo
<alejandro.delcastillo@ni.com> wrote:
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
> index 6642f2bda..87e41c20e 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
> @@ -152,7 +152,8 @@ PACKAGES = "${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
>  CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
>                     ${sysconfdir}/${BPN}/magic \
>                     ${sysconfdir}/${BPN}/mime.types \
> -                   ${sysconfdir}/init.d/${BPN} "
> +                   ${sysconfdir}/${BPN}/extra/* \
> +                   ${sysconfdir}/init.d/${BPN}"
>
>  # we override here rather than append so that .so links are
>  # included in the runtime package rather than here (-dev)
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

