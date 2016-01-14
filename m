Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A52D0731D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 00:09:25 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so316951421wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 16:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uOlXeaPsnR8QVL0t1yJf3aZ7nYMDbwy/haI90EwcOL4=;
	b=bD1qaXfUB1kXtDanW4JORlC6YO5TrB754A0jKqj2WhBdEyZkXH3vF50TzFky8zcXRa
	OF/1jMKPoKbeEX13JYOXGKGSzOdnp6YtLvOz2QMkXQKR+K+NYjg41dIKJUQycT5smHXW
	0tsml+ApbX5I/qDmLBhKnKyVaX40gAroHh8ait0DQ8v+47z9GxXovXKo62nyTwzXljLh
	o2q754rUfsKjWS/Td+t4HAbjsEY6Q7JcDbHDeKRQZSPwKxzvXdGWVEgo6h9zsknxtuMs
	SmK+Hmhh8nNQy5xhX3E0SaOeoY8lA+w14K4lGNmkqWdckr5nkV0RrmQXIzlEeedMI8I4
	g7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=uOlXeaPsnR8QVL0t1yJf3aZ7nYMDbwy/haI90EwcOL4=;
	b=jIlqPYrxPmT4/qFbmA97hUJxXADXzZ1tNpTEdXtOQM0zfZ9nHUe9r4k5wesXyGMIgF
	/o0vAvqLY+PPo8Df5Yujw6fsaEHTNe7vz1PXOCw7D1eXQKLfFqtzZHePI3vJUNLlZF68
	Z8F5hb72r0ic+mZdmtEOSvORl//6RtvKyXrcM8598OrI6TSj3cRw8VDMSMgnI9QJfPhm
	uBp961VvifT6eYV/Cah+2Qcs7MJkl5pQhEHlKjVIvSTSaX49zUTiNVxMKeQOUiX7EeqP
	2bXQdIbrb39CQGOvNsfgiYLbCW49VnlamOAsYKcik0lbW68rPVpNL72ke1pKnt2jK1UO
	NBPg==
X-Gm-Message-State: ALoCoQndKHEmLfzvfpNSaFsbklaEjLgLAJJQDaBr4sVqmGd7DJK7yE48LX+Z6GIRHptok0bLkzi9z4fJWDPaQl/MIeyFaQMTrg==
MIME-Version: 1.0
X-Received: by 10.194.116.170 with SMTP id jx10mr824116wjb.166.1452730165588; 
	Wed, 13 Jan 2016 16:09:25 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Wed, 13 Jan 2016 16:09:25 -0800 (PST)
In-Reply-To: <CAP0W-R=5hbP28cT+phygoRcQ9qr5NUYdX=fRZBVaDPf0b-Hsxw@mail.gmail.com>
References: <1452496246-18628-1-git-send-email-koen.kooi@linaro.org>
	<CALbNGRQ7isqSbA=gRPYCFJBH7c8z0hmK+79e5ZmQ6zj0Q2Azhg@mail.gmail.com>
	<CAP0W-R=5hbP28cT+phygoRcQ9qr5NUYdX=fRZBVaDPf0b-Hsxw@mail.gmail.com>
Date: Thu, 14 Jan 2016 01:09:25 +0100
Message-ID: <CA+chaQc5uom+6htJCiB+ZHSMRM6Tf9-2M=1F4XSKrwQYU=cVog@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] various: delete qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Thu, 14 Jan 2016 00:09:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It does appear in patchwork:
http://patchwork.openembedded.org/patch/111547/

It's just marked as archive (as every patch after it's moved to specific
bundle), see:
http://openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same_oe_=
project_on_patchwork

On Mon, Jan 11, 2016 at 9:51 AM, Koen Kooi <koen.kooi@linaro.org> wrote:

> On 11 January 2016 at 09:08, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > On Mon, Jan 11, 2016 at 8:10 AM, Koen Kooi <koen.kooi@linaro.org> wrote=
:
> >> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >> ---
> > double efforts? [1]
>
> Looks like it, but [1] doesn't show up in
> http://patchwork.openembedded.org/project/oe/list/ :(
>
> >
> > [1]
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-January/1=
05406.html
> >
> > Andreas
>
>
>
> --
> Koen Kooi
>
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

