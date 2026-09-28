Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7FCCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:19:13 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60058.1790608750371603834
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 08:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fcHrFJ6X;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fb93aee5eso3350131d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 08:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608749; cv=none;
        d=google.com; s=arc-20260327;
        b=UYUIsdZm1ZVwWbdyzsxpzn8mcTO4vYhcNEUZ7JLkUeLKGDHuns3URLrdl7PxZLjeNS
         wPTVl17syMsPeY5IHkgwPSuCMLU9G58UEB0uAfgs1fgaV2H2C+Oiag7xyKuOvu3NAPzW
         23dplvXrqnmhz0to4E9Qq8+/x9JDCPTzF0JXhjD8Ps0ya6KamrrwSYQPGDTeuj63cZCz
         U8hWMYhnESifofWYg9DyXmOBRhwGFsXmzcki7XDgqD2kzyhzYnYiaYE0FB0A26PSPKSE
         +CniU2K4aUiZqOyQ5yk7RC3j1oY+FLrFl9FLhQu5Fuo9UIrfp32uOa09ttUscyhEzFe6
         L0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nTnmLMr8W5PY6q+oEFoDT4c2PzYWb+Po53jnrggoRSY=;
        fh=TKJj+TQbOfhIZO+HJtRVqEbv76mR7gPejKPp/8pTfkM=;
        b=tCJ5J3cQjxAQCERzqcCr6UR4+H8QTHOqByP8bPlgtKnGqyN8orVUyNE//hBofw3eX9
         XvCH0dcRKJiJvLHpE2q8zq65wdWMCGcH4WSuj/cgApcfjgudagdJtdtap3HTbDCKkLjN
         H3l3LltIpL4WFo+8o77akge997NCtiklBaNMR2W2ThO0z1QNeYkLZus8tgv2TAIRyWjI
         EnMofbzFy1J0pSMSlRext0IyI8XITYtnHDZ6/MZv6y8VK9jxmGa47p1O0unmb9QqbFcT
         sZ0lzENxk766u9W7r6rIMGceQWhMfPVb+7bVlU5Z1BbBl5ZkCzDyUjEA1KIyzJp9h7/2
         ByOg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608749; x=1791213549; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTnmLMr8W5PY6q+oEFoDT4c2PzYWb+Po53jnrggoRSY=;
        b=fcHrFJ6XoD7tRntLgLEbm/asRfkyCwPHypfYmJz/t7k8Qbb8vCNEbTc1PuIUtE/2J+
         htIV0v7F9mrfasY2BHPUZgBbvq7fjEsR6vdjaISDgpkoedtbQAmjMMe+7sAN4RDiOrbh
         WDSRWl+YLZVzfWWiHxG+87isas9ZS5SWXvKFTnkvXBob3lmKl2Q3Qckz8oHVt2FIJbsL
         rqTUuE4mwgi5a5YUUKwX+lGilpSOzc/OP6p8bufXi/aon1mPIqnD0O3pkezAVwkyxpzs
         HdkiyqJPuuCsxlgj+C92A9sp72VxNZv/N+Cui633VjtER6m5jBrItIoiSQKUDwMpqy9X
         YMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608749; x=1791213549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nTnmLMr8W5PY6q+oEFoDT4c2PzYWb+Po53jnrggoRSY=;
        b=j076CZs7VpkikGrvDw9LOf16WceXv7jbPdFwi1rEBQIBLHlGjMWMzj6rVH6iFj7AB4
         OSqvPbC+2enY0HoWWF7uqLuUZuq1/NJ0kzARfyTESK8RJRWyvHEze3fLSTwEKvVvAhju
         I2uwsQbLrq1JZTeQafkeY4VokiniFRO1eHQz0TwBXx6Sl2fDtaEJNo6q9NiDQ2Y4K8gZ
         lMZKOogeiEg/vykMovXhoIKd9ASDrVhjfkkVwl63RN7ztZ/fwgwyAh1ds2YScVYaP6m1
         m48RbOHSQsoPQPYLjcEhViLzeTCaQRGHpq18IGa9kMa0EX0RGzG+pTvG2JR6wVCZWRWa
         GcUw==
X-Gm-Message-State: AFq9FYLcE//Z0cpO786r+/4mZVSdn+xv6kGFBd7kj9sRpEqxoqoZB3bJ
	gVVNSGalZl4VfiyIt7Fsg8eVPtdm3wwQ4SCeufffY4PteuMjxnBZeEExmGuOKTy95ctLZT6JFmy
	qwV9XmUlHhszQvta0F8EaKuujL6GyRHMdnr1Z
X-Gm-Gg: AYBFou3HpwfdpJCG56AugAje9PbBp9XWRRl4+P5zieFdg0yhNzb/Q2iSirxQsjZPuoy
	prjOWY8hDHn85dqJo8QaW6byUs9TSmo62+4cANqxk8wyFa6Vo2DrfZBSwOInr4pRHa/v9AxU7V5
	VcQlTrq7/b2g+EIahgBZzFySGgxpyQYu2ckWIYwfkVaxslVOvewnEqi5vBaHiwdJn8cWrcshxAC
	xSczcAYyHFl/sLRkmz+Tiz0d0sbkqR7eKxI/1C0Tf1RVD98e33GZbqGuV77XtLSQy8JwYQXvxZR
	uB6WvDC6akLLqX3GfTa1CZQ2fJbTNRVVv2h0ytiagYLHw6TV377harCFdJbsOaV9pxH5HgPzPzx
	SoG+6D0Zh0EIcLOqmAuT8gfPiTQJ7Q78pcUvOF5HBzYxK9DDThSOklT+sIEIG2cJBfMjdzsncJU
	zorZ6uf61tNVrVdI1TXuE/vWS5y/hmfTLfULhKQInACC9vnPbhCPKmc+RfyRyFAr7NSq3GvVIK0
	Oo9uzVwFrcDYLVPTE0f46KjCFs14BHIwYVvGIiHAQBIZd3YBN5VqsH/hYeaAYRyTh5Y71OK4L5M
	tzbnTg2jzZjxYTu1CCjezcXusSb8wf8dSyK4Y4U=
X-Received: by 2002:a05:690e:1287:b0:672:9b54:d7d0 with SMTP id
 956f58d0204a3-672ed435f6dmr5109909d50.72.1790608748977; Mon, 28 Sep 2026
 08:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260928010600.87898-1-f_l_k@t-online.de> <CAMKF1soeW19NdDrgErnRf6EL8-dqUVkVXpAysW8VDVCswrDUbg@mail.gmail.com>
 <ZPJ2MT.5L785RXUBQ6R2@t-online>
In-Reply-To: <ZPJ2MT.5L785RXUBQ6R2@t-online>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Sep 2026 08:18:57 -0700
X-Gm-Features: AclHuK8du3sV-jIedOs_kHPNIFH2lF_i0l0zlhWLOKwPpnsxzVJ_FwwARCQHHX8
Message-ID: <CAMKF1sqy=B3-qj1vNwjj2BQEKgpkQgj+h7Xj+vzp8ir=yqQe6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] kmscon: treat platform display controllers
 as primary GPUs
To: Markus Volk <f_l_k@t-online.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006a22fa065c8c963e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 15:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130443

--0000000000006a22fa065c8c963e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026, 2:58=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrote=
:

> On Sun, Sep 27 2026 at 19:39:13 -07:00:00, Khem Raj <raj.khem@gmail.com>
> wrote:
>
> Whats the future plan for this patch ? it seems worthy of upstreaming.
>
>
> The patch would first need to be tested a bit more thoroughly. The proble=
m
> with AI-generated patches is that they are created much
>
> faster than they can be tested.
>
Good to know perhaps mention it as RFC then ?

> In this case, I noticed an issue on my Intel Arc card: The patch treats
> every DRM device without a
>
> PCI parent as primary, so kmscon also detects the vgem device
> (card0)=D0=B2=D0=82=E2=80=9Dwhich has no KMS outputs=D0=B2=D0=82=E2=80=9D=
and tries to open a display on it
>
> every 20 ms, which floods the journal.
>
>
> v2: only devices on the platform bus are treated as primary
>

--0000000000006a22fa065c8c963e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 28, 2026, 2:58=E2=80=
=AFAM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div id=3D"m_5066467623318894841convey-body" dir=3D"auto">On Sun, Sep 27 2=
026 at 19:39:13 -07:00:00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt; wrote:<b=
r><blockquote type=3D"cite">Whats the future plan for this patch ? it seems=
 worthy of upstreaming.</blockquote><div><br></div><div><p>The patch would =
first need to be tested a bit more thoroughly. The problem with AI-generate=
d patches is that they are created much</p><p>faster than they can be teste=
d.</p></div></div></blockquote></div></div><div dir=3D"auto">Good to know p=
erhaps mention it as RFC then ?</div><div dir=3D"auto"></div><div dir=3D"au=
to"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div id=3D"m_5066467623318894841convey-body" di=
r=3D"auto"><div><p>In this case, I noticed an issue on my Intel Arc card: T=
he patch treats every DRM device without a</p><p>PCI parent as primary, so =
kmscon also detects the vgem device (card0)=D0=B2=D0=82=E2=80=9Dwhich has n=
o KMS outputs=D0=B2=D0=82=E2=80=9Dand tries to open a display on it</p><p>e=
very 20 ms, which floods the journal.</p><p><br></p><p>v2: only devices on =
the platform bus are treated as primary</p></div></div></blockquote></div><=
/div></div>

--0000000000006a22fa065c8c963e--

