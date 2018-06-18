Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 319E56FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:52:09 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 74-v6so11275681uav.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1sFQq+R56ugsL3n+rz5kD/hXPJXQpJ7xLC0MrqsY1hQ=;
	b=G1XuULnkYC2XOfz4G63VR6Bb26SuZQloqzYKzpGuZZ1xdAY2+fVd8j6oVbTjrcK3YK
	3ZhmMzMz1HvTn6d4KonXOd3iZSco3WRrgW8BlL9jq59kJJI9fL+Lk4IaU7OmBLPiA/gP
	QYMO9igtNO+hosgdmsjFfItkHNaEntx/N6neMsTFwT1zcJJGfM4t4ePz9DlzNgR9DQdK
	yQrfvmwf0rVn++LWgJHN8cim+Loi5QHlFnEjx3xTqxDMnMdCDzQIqWL/dRPjGG1WSNqa
	lpI/wRiPHj+2HrNDOKdPIz2UiQLZOaixpYWZ0Skp2eGCgP/c6hRMgjDZcZA+/EiQAyJv
	e+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1sFQq+R56ugsL3n+rz5kD/hXPJXQpJ7xLC0MrqsY1hQ=;
	b=A0sOosCYPCRdN2RrHq/uPXH/9hai37UUCPlI/xOCTGdMEHDnnHbEpw62Zbt0nhdBqC
	eTkO8EHYHFe9f1+UYeuoY/1Ely5er2qZw8Kanr9HnCcC2w7DTC133CkbNRFApadBgzx2
	y0l9Rmvu/3Hb7s2R4zEZbzE7zjlGGUHkNWtIGIBllGz5kbvO3F5x/BC6meyrxPg5Ag1w
	mycTTIEo+VS+hMMAPyatVPPZ7HOD57kKPB6Pp3EcPJkQaS7BEgQxud6UhezAQYmB7CCB
	fLrpetPNa0Ocl/0WdAUVKQ8CnuKb9AWPHtsCV7OsaE0cnOWkjC3E/DWDuPQatDCXBTbT
	b8JQ==
X-Gm-Message-State: APt69E0C/OV4KHv6noKj301bQpxoXvNa/z1aiCqc6Dex36LivDK1cDku
	qxfcX3gy5uNCzEeeh/RQIjQ1KhckUkshVC6Sky4=
X-Google-Smtp-Source: ADUXVKIvO4+xmSwCBY4ZdTqZIEHdzNARTCZf5x9eNl91+MMGOEop0fVlILFOiarqKIa5laVFSCS4opH1IdHuygS9kyg=
X-Received: by 2002:ab0:304e:: with SMTP id
	x14-v6mr8350071ual.80.1529344329896; 
	Mon, 18 Jun 2018 10:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 10:51:52 -0700
Message-ID: <CAMKF1sowdJaFO3CH8d7wRtgPKxoc5PEYESQU3w0oHYAVOsq4og@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] thunar: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 17:52:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 9:51 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> Since commit eb0fe21c1535 [thunar: upgrade 1.6.15 -> 1.8.0] we see a
> QA Error/Warning regarding files 'installed-vs-shipped':
>
>     ERROR: QA Issue: thunar: Files/directories were installed but not
>     shipped in any package:
>       /usr/lib
>       /usr/lib/systemd
>       /usr/lib/systemd/user
>       /usr/lib/systemd/user/thunar.service
>

perhaps this should be moved to /lib/systemd/system

> Correct the path to the systemd service file to match what we see in
> other recipes which include "user" service files.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> This issue and patch is for master-next to match the
> merge status of commit eb0fe21c1535.
>
>  meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> index f03fd63..c2f6f59 100644
> --- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> +++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> @@ -21,7 +21,7 @@ FILES_${PN} += " \
>      ${libdir}/thunarx-3/* \
>      ${libdir}/xfce4/panel/plugins/* \
>      ${libdir}/Thunar/[Tt]hunar* \
> -    ${libdir}/systemd \
> +    ${systemd_user_unitdir} \
>      ${datadir}/dbus-1 \
>      ${datadir}/metainfo \
>      ${datadir}/polkit-1 \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

