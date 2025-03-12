Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7F7C28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 15:26:51 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.40182.1741793203920881103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 08:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OMNXWA9S;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3fa0eb29cebso601796b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741793203; x=1742398003; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPIMoIr2SGLnQmWRXVGbSTwh7t5Xk8GZLVmPd/X69js=;
        b=OMNXWA9S/XYLA//LCD7u/I9yGW3manYO6iNRT+tihS69bp2g0UhEN2dITmi4c5xGka
         M7IiKW7bariZbqJ9OlxudSJF4JmOvYRRNk2n3mk+fmC3as+qFWQadXgxQWc7HQ1Qh131
         +tp2vCr+3aShP1iuCnJk2g6TUEg7T+Be/KNHaF4TiC8TefZb0oQxCWhRN3W+GZ6U88Uy
         1AHl+AySfULdteX6PJ/Ve1nETdwMLF8V4Wv0GNTicw5NcO+5R2gCvKTqt/SFJVm2zTs7
         7yu47uoeyBCmMjNB24eZ3Rmw7rOlF1uMSYqzq9gvGaepxAmMdNaQBsmsv2+gYNx3r/gv
         ugPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741793203; x=1742398003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPIMoIr2SGLnQmWRXVGbSTwh7t5Xk8GZLVmPd/X69js=;
        b=Bl/iTGo5EU4Sy6wHo4rcY/SHJJc4hkoddKvX32Ptxsuv0yloA/r1kfOhd0l2cRvfnA
         fm+IklGZGOsw5Bsj3HIwDKcD30PP+fq4zr+aMThWDrpR4tqWRb236h14/abjrnr1bzBD
         8AiU8LlPW4FwWffPHPCqHMkYJulNWTMlEQ/AW5sWAwbb1pTCJJ1LOlKPDd8n7iq1BCLq
         NaX+WGUsLNHOkPsxeYDzy3xbg7T+WPK3eXuZi18HhFV96jg2HV6VyIy09SPXHZyN2mdX
         UN+DJsjF1C5vVLiZlmgRT0vlTuONrGX61cdLkzv+C9QVAS9s5YzMT4dbLAlm5uSoGiAQ
         HZsw==
X-Gm-Message-State: AOJu0YxGtdmn1oMwhlC9QCUSGxix9u/nMLMSnA84ixopqZVKucjE6qTB
	WvKDlwcR9SvOd2FBY4V6J2Nw8GBqaFIbI8EZ8DtfF33lR4niGMdLF6bz26apbu07JFXbs3KsvoJ
	XCnAM/m8WrlxlNk4eOqTa3skgKZU=
X-Gm-Gg: ASbGncu4DKLgZfYH2y60gUcsuXbZ/E81056GA2QKlV2743n5ITmpPOCw7Hh8bTdIMXT
	k+VuP3iSYe5wvGdKnMa6T/EHP025uUSphV0X//+8evVVFaDLq/GGo8OKonD+ItZ7M0ZTPAHhZuI
	RhjyOldVGIRbXumbH/zkvIKMkU8+/I4FJR9qyn
X-Google-Smtp-Source: AGHT+IFGQuQDboFkmroAal6UNFa8ubKjdnfzi80djXiWj2Qk/HD2l+1K8Tj2mKhFleGbgW4Eb/hvE4dx50Bm4yGB7V0=
X-Received: by 2002:a05:6808:144e:b0:3f9:28b9:7021 with SMTP id
 5614622812f47-3fc752a6b04mr49469b6e.5.1741793203087; Wed, 12 Mar 2025
 08:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250312093324.3238381-1-yoann.congal@smile.fr>
In-Reply-To: <20250312093324.3238381-1-yoann.congal@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2025 08:26:15 -0700
X-Gm-Features: AQ5f1JrifDuvgvGdASk92Hd2gsA0LdMfi8hzzP63vdrCAkeQYtF562_SGKhUXdE
Message-ID: <CAMKF1sqVKVR7TsCuGtJfmbBL=vYe4jhgFXtzjuDLmALGxXQxXw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] packagegroup-meta-oe: remove thin-provisioning-tools
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 15:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115928

On Wed, Mar 12, 2025 at 2:33=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Since commit e19b4c9755fd ("thin-provisioning-tools: 1.0.13 -> 1.0.14"),
> thin-provisioning-tools is in the clang dynamic layer.
>
> This triggers warnings on AB:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/213/st=
eps/12/logs/warnings
>
> So, remove thin-provisioning-tools from packagegroup-meta-oe-extended.
>

yeah, this will fail when meta-clang is not used. Perhaps it can be
moved to a bbappend under
meta-oe/dynamic-layers/clang-layer/
but I would not sweat over it

> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 449f671f7a..70d05c44bc 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -878,7 +878,6 @@ RDEPENDS:packagegroup-meta-oe-support =3D "\
>      syslog-ng \
>      system-config-keyboard \
>      tbb \
> -    thin-provisioning-tools \
>      tokyocabinet \
>      tree \
>      uchardet \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115917): https://lists.openembedded.org/g/openembedde=
d-devel/message/115917
> Mute This Topic: https://lists.openembedded.org/mt/111656730/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

