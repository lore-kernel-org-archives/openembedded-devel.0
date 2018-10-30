Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id CA8F579C99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:42:34 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c16-v6so11912014qtj.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 20:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nnXLSgMyjOijUFQW56KbqHBMVuuxbvvdy8rk1zPOBEY=;
	b=Sw3x5vHqrTdpAGUZ6aSM/mH+NjZ79lmkl08fKXx8rPU21GAJup2JiuP7OvfeaJg/Na
	AG3Q5vlt6HcMI0CgakIyLoX6JRIMWhKkQN5hXnU4RQUYQsnwxGrF4vZo5S4K7KySIL9L
	+Rk/9TGADjquTinsolQ/R0ni0f5MDwMv9rerMcSzgKm/CfL/ZiM3eTh7v6T39+e5Skhe
	aOfI4DTitohUGFFpAu2KQu3k3vpKRaT2RrXkemPY/DY6zjYp+76sYCroSqvqhpS2PJBM
	5+9l0N80b4ded7RvCqzAqeAjxMr7OQNUWPq1j9z8GZZgX0/eW+dcu1wCI37Jz97duHOu
	/vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nnXLSgMyjOijUFQW56KbqHBMVuuxbvvdy8rk1zPOBEY=;
	b=ovgIfecZmhu0yUMeynpWbV0nii9zeTIMlOmagqZnWn2a1e3bpVCjqvtb90wVSo+7fQ
	8LY3XP2D1Zv0PNAekGoTR/STK7upNegVCnWwa8/MEZKXcB5XKos//LCxJBLnMg8kk7ha
	v4iYd3XwYh3Ug+0ztCDwtJFN4C/pKOmhrzQz+dAql+/WMqQ8oVBXFYKmJtmbXUQcUP8e
	o0r0oi5+40zTSgIcqwKUgUwRl9fuhoc011MG1UA3XHxAzbmpa3PMaEBouW+uZKaR5N2s
	mgJ8nWtjJEv/qFs4k78CUDzRA3+pJY56peXDRPn7IPQ6gYcN/KynUAj4hDrQPbfyme5+
	OnCg==
X-Gm-Message-State: AGRZ1gLTZviAUiwQ5iU7pEW7SJSq1k1XSufdxrhgWWbY3ZijNBbhGm4v
	HE0eDt/6+d591Xp3L7UtCIFG4nB0Rbfw2iflogo=
X-Google-Smtp-Source: AJdET5cZ5j5RMH2Z2PG06yjhtjuDKqxXmp9GlTxCCz0z8TieUAGPr7UcWTaHjnyXDfBdTtrEUucwZX8sG2tSrmsMErA=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr5267218qvq.55.1540870955623; 
	Mon, 29 Oct 2018 20:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
In-Reply-To: <068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 19:41:32 -0700
Message-ID: <CAMKF1soTgsG_qRNdOUWbiREk9tTM-XNmfqXRKT-imm71SXHQ-Q@mail.gmail.com>
To: brendank310 <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: schnitzeltony@googlemail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 05/16] lcms2: add recipe for Little Color Management System
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
X-List-Received-Date: Tue, 30 Oct 2018 03:42:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 9:42 AM brendank310 <brendank310@gmail.com> wrote:

> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
> b/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
> new file mode 100644
> index 000000000..29947ae76
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Little Color Management System"
> +LICENSE = "MIT"
> +#DEPENDS = " glib-2.0 gettext-native "
> +


We can delete this if commented out

>
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6c786c3b7a4afbd3c990f1b81261d516"
> +
> +SRC_URI = "
> https://sourceforge.net/projects/lcms/files/lcms/${PV}/${PN}-${PV}.tar.gz
> \
> +           "
> +
> +SRC_URI[md5sum] = "8de1b7724f578d2995c8fdfa35c3ad0e"
> +SRC_URI[sha256sum] =
> "48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20"
> +
> +inherit autotools pkgconfig distro_features_check
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

