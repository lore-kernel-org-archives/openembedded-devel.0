Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 469047807B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 15:19:22 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id f200so5213491ywb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jshwDW0dtUhCcg/WGDAt8B6ST7VKHVxDhhkJH58M/fY=;
	b=r0xiRu8FB1qAaBMS7sQxtwwmYeA0Zdtsksrof8fmdJqe+f6J3XpBONk6S/Yguc+SLP
	bZAPR4Cr+eFJByTNkF6KMY1wUbzUYtwQzj0kOJ7OjhGzBlZKUx8ro1YoSeKrDvHhk1WL
	FyJ8FtW7Qg/gc9WhO9f5ppTrzef6vF1Kt/N7kg/9YdelusxO3XuIG8yqBp/8d/mcPiZw
	5SVu2h0xI9HUHEt3HOHYoZQ9H8SPqJSlaR7zEOnVj/GVi41YzsPlU9EaeWJvJkkV4bxR
	9zjFLRFAMyLRoyn+tKlPqqp8HNuNIheBhUtG7jEvsCdQohjcgbQATMYll7qKneaUe6Vu
	YczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jshwDW0dtUhCcg/WGDAt8B6ST7VKHVxDhhkJH58M/fY=;
	b=Xy65Z3nXHOLoQGJWvr8/VY/jrASLFvjgkRiF2MM5yx1zoa3oNLPwwqTEToD96F+Mxa
	D3NzS1oAFYyqvuU6ZwC/oqBFKTAJHBFHr2HUjFQDr86DnHXP6lhKVRheQCS6hVOgWl7y
	zyBj8OJytfLuc85gX6USZCdqizqAXLZafUY8fyUlaFfNE+Up/+DPxsTUR+j/Dd9dN/BD
	jaxiXlM8Qq/Y2/CbhAux0N4Ub4D3TgZojw68tYQh20UL0Xrux4X/IhbgYOALaz426GYX
	/54CdFZG7sGp8Pf0DLozBqBAjjR2IVV1rMWwwHDWjP52sFs0YEuKdk2o7Uiyx9hLePs4
	029w==
X-Gm-Message-State: AKS2vOwMe36cHciiSD+XEoWrxUgB3AR2PsfNs05IbGjgRGWNb+yCbHDB
	r0UySPoRvzt5NgvTRflDT/l/OLgLng==
X-Received: by 10.129.44.130 with SMTP id s124mr12069583yws.2.1498749564021;
	Thu, 29 Jun 2017 08:19:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 29 Jun 2017 08:19:23 -0700 (PDT)
In-Reply-To: <20170629090503.13157-1-kai.kang@windriver.com>
References: <20170629090503.13157-1-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 29 Jun 2017 17:19:23 +0200
Message-ID: <CA+chaQc5qaypv72qzhfHVx66nfuWFGz5sRB0OMF2MvmsNa7Trg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gflags: update downloadfilename
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
X-List-Received-Date: Thu, 29 Jun 2017 15:19:23 -0000
Content-Type: text/plain; charset="UTF-8"

Change it to git fetcher, because github archives can be regenerated from
time to time.

On Thu, Jun 29, 2017 at 11:05 AM, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> The downloadfilename of gflags is not proper for multilib recipe.
> Replace it with ${BP}.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
> b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
> index 5fc28f6..e2bac9a 100644
> --- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
> +++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/gflags/gflags"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551
> df"
>
> -SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz;
> downloadfilename=${PN}-${PV}.tar.gz"
> +SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz;
> downloadfilename=${BP}.tar.gz"
>  SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
>  SRC_URI[sha256sum] = "466c36c6508a451734e4f4d76825cf
> 9cd9b8716d2b70ef36479ae40f08271f88"
>
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

