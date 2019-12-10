Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 722687FC5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 10:03:53 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v16so15420549edy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 02:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CEttfOghQfhF12qLM4iasUMZWQOtlycOgFAm93APISY=;
	b=GWnft80oSwUVLy9qu9uKEgRykuJvEV5FYyEz/iS3jrSm+qobLi478N59huBDT6/Oxv
	XLfBbq0Olc/L8gRaVZ9n9YYaktt/TM1FJQfpxZKMdCdhEe++HxrS0lNB/BZ7tqrLWSpl
	BXPUzCVhOym+KEW8VS+7jx2FC75w88n/IxC33qsYNp3bhFNovKpIbwK4piKyX+AfdMtP
	W/Bjp8w/Z5DZSEpte84Hw5ertzyo0rlCcRXaU9EAfceGeCA/YscQfhT/BzyzVtT4HoHF
	F2wJketm71PXEzXvFg4DizBKFbfDe1Ud2IfwiV7QmtGpY5KkLRjEwmDPuXdeIyifG/NV
	ZgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CEttfOghQfhF12qLM4iasUMZWQOtlycOgFAm93APISY=;
	b=oS4X/x1tHZXc7HfwtZpSNERrqCkAOkmg89ehPihFyY9CJdhfllCXgVaxk7+hIKRdX+
	uRRXnR9ciBDKoSn63HDpFtnRKEsECiKA+CcGFWFbqG7q1/6VKEtxA1VYDj9ByGDB6+Vw
	j2wn/5qSqKtsSa8jMTHxGQSia0xdOSPlPMJ08sy6j8sY2hnCX+zJlQlptxZzegqiydFO
	ImSnrk2UiwtkJs2JpGzTVDRorT4X3l4A2wzNth6k9WLRe0NUA48ZJZMUOLkzQjAN3VUs
	QaI0qLCNeLKkp9XRN6Bzkg0Gh0R1XLXs0QP80x0ZfiNb3JbJHC+F900h2wE3pcjmI+lY
	DQSw==
X-Gm-Message-State: APjAAAX4z3K8oMhu7f9UsIqtMmdGeGMjkORX7lc809VuwXJrRxd7Q14u
	8QA4VVJ3TugitQF4kh84JlinHDW3iVZf9yHAF/U=
X-Google-Smtp-Source: APXvYqy8nH0l12bQ1crez3F+J3SMQmCn41Piuts8AX6sOzlUpSLMb9HAOWKqqDi4B7hdrTbPO7TaaBddyZsT48D7scM=
X-Received: by 2002:a50:c343:: with SMTP id q3mr36896214edb.209.1575972234070; 
	Tue, 10 Dec 2019 02:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20191210093850.6292-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20191210093850.6292-1-costamagnagianfranco@yahoo.it>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Dec 2019 11:03:42 +0100
Message-ID: <CA+chaQe=2S1t_wpXzbExnPuGnSXy=XvscZ_n_xyMxscRZYY=mA@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: update to version 6.0.14 and unblacklist
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
X-List-Received-Date: Tue, 10 Dec 2019 10:03:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

what kernel are you using?

Now with vboxsf also included in staging of vanilla kernel, this recipe is
less useful then it used to be (vboxguest and vboxvideo were included long
time ago and we're using them without any issues in LuneOS)

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.4&id=df4028658f9dd7f82fd190e9db5bd82c05f94625


On Tue, Dec 10, 2019 at 10:39 AM Gianfranco Costamagna <
costamagna.gianfranco@gmail.com> wrote:

> ---
>  ...oxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/vboxguestdrivers/{
> vboxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} (92%)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.0.14.bb
> similarity index 92%
> rename from meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_5.2.22.bb
> rename to meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.0.14.bb
> index 0f8d7af3f..bd7339e1a 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
> @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
>  SRC_URI = "
> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
>      file://Makefile.utils \
>  "
> -SRC_URI[md5sum] = "c9c2f162ac5f99d28d8c0ca43b19ed01"
> -SRC_URI[sha256sum] =
> "5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4"
> +SRC_URI[md5sum] = "2766d6f628dcd8f0bc216d0f8a2abc8e"
> +SRC_URI[sha256sum] =
> "5e12b14f0c38bf195d9592d76a9e0a128df2d38cd77c26ce5b5488397715dd0c"
>
>  S = "${WORKDIR}/vbox_module"
>
> @@ -78,6 +78,3 @@ FILES_${PN} = "${base_sbindir}"
>
>  # autoload if installed
>  KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
> -
> -PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

