Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D4C9B749F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 16:04:42 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q6-v6so19300059qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DrTiJGCSkqOX9Ajai6cKmHZyR2zU6nl8YEpU9ecjTf8=;
	b=bYVnW7lbpmjzCNHjEiqJLus3vJErMREcWQhylVouHkTQD8zbJtZjA9+TK4YMGXGBaO
	PlSoJU0mpioAFpFx9VhfQuTeWLEN4QeYAKgexOSKJVqh7+07Qg07u85rn//6h3I9Qd4Z
	PVXnx64OnUZ93hvDbUTAaGKfq8vRVyhKhXkwgAzz55aQ8sx+yV63TWzPo8dsiDDrahKs
	702r/ruFPtxJQuStKKKgHq7N0ReWNC2JN8E08yGDnzeXJaBlkMBXvEvXa4tV4mQxDrMn
	hAWO6CL202mKJka6Jc706K436pqc4uKw7hKrWfV6ZdtwsOTElnrdw0nAw68tLAnFI2po
	IZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DrTiJGCSkqOX9Ajai6cKmHZyR2zU6nl8YEpU9ecjTf8=;
	b=ZAFtDiUPLLGln10UQ8ktPIoshYqbbz2TFFiP4hmPpIW99ItyY+hNMvhu3EZJVFkFuu
	fiWfsQZ9TuPwftsYmcuemgI8q8pr1L8NDBsc7Dy37upcpPx/lGNwZry/ATVSx7CgZ87h
	Df5J678cebjDYCALJPeamsgqqakOqmCzX75+zez1FgtMZ7TxGRpaM9xZrdkPLUeBmzdy
	jd1mTVbI8GoSuVnwuf94t2V3s/JRBfSD3nwEaGt/jYCmIcI9J2OONBexRIrvm8lOT9Ve
	KxaY86IY63n+lMfumJN7VHbTD/7AubK0w0jebWfwd3kMjnmrZLQ0ljLTONr6rr6uONZF
	sVtA==
X-Gm-Message-State: ALKqPwedty18LS5hGIGhM5g/RHTmZ39poOK6MaLaNbGMOYFDfvEKIYgj
	JS0Dz3CHvI+85mQ2M0QALRoDjifwmCfU0sgp7hc=
X-Google-Smtp-Source: ADUXVKKV2BEY+kjQSmOY2MniA+mzD+rIAQusvRH9WxUUySnCeE+e1jUiL6pnFodvJmtrPQKyFtUE8xle6EmjYHjP3Cw=
X-Received: by 2002:ac8:1c4b:: with SMTP id
	j11-v6mr16902870qtk.188.1527609883084; 
	Tue, 29 May 2018 09:04:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 09:04:12
	-0700 (PDT)
In-Reply-To: <1527143259-6532-1-git-send-email-yi.zhao@windriver.com>
References: <1527143259-6532-1-git-send-email-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 09:04:12 -0700
Message-ID: <CAMKF1spw0KO4_EZ3tmyb-nJ4_akM-7xJR=SKKh7BZ4Vr=KtcVA@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] meta-multimedia: update LAYERDEPENDS
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
X-List-Received-Date: Tue, 29 May 2018 16:04:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 23, 2018 at 11:27 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
> Add meta-oe as LAYERDEPENDS to fix ParseError:
> meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb:13:
> Could not inherit file classes/dos2unix.bbclass
>

If thats the only dependency on meta-oe then
Perhaps dos2unix class should be migrated to OE-Core. Can you prepare
a patch for that instead ?

We should try to make these layers independent of each other as much
as we can.

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-multimedia/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
> index cfedf2f..24d7a6d 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -28,5 +28,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
>  LAYERVERSION_multimedia-layer = "1"
>
>  LAYERDEPENDS_multimedia-layer = "core"
> +LAYERDEPENDS_multimedia-layer += "openembedded-layer"
>
>  LAYERSERIES_COMPAT_multimedia-layer = "sumo"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

