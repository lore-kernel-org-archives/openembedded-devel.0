Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102DFC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 17:52:09 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.217200.1724089925702535877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 10:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LrbaA+VK;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5d5eec95a74so2925446eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 10:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724089925; x=1724694725; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CzNDlkcEWQgb7XfPDKqsHn6D4/ud9Ulg2tM9biq2nM=;
        b=LrbaA+VKeobORaRWplSxVJ04UKUnveUdflAmkHuP+SMMzqqedYeu/fYoHu8BOhGSI1
         EXrzsR2sRpxOHVoXdSy0BHS2tC7reNeP5zfcALoZdrjsmaOgZ5OcusBly13Xm/HTy9W2
         UkMfz0EOjqmpE1AY+C4h/N9Uk0B0hqVCDtmzGizdDdGNkIX5Wg3QTMFpaYrckoHPCVYb
         /5mydvJcE8kW/KBGo0oeMn4vjxE7eIesRanzVBimVnw9bUAvj8tBpT8jf5CN8+y0ezF0
         jjADAJFxznk1ui7eZs6Zh88GL0EEF2FJrnhEL0BpfXJj86kv78Aql7osynfe2dwdm/hD
         7Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724089925; x=1724694725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CzNDlkcEWQgb7XfPDKqsHn6D4/ud9Ulg2tM9biq2nM=;
        b=ECM+uulrytt85VvimFfeo8k8XBfOzT7fAGghCfUzPamVVFD/qSaJlU4E55590v4U1o
         u4VJC/81Tmb+VTPlB8FbjcZh2BvDtNFqwYjuHyqjt7RoHbQBySPguq9Z5b5ibRYSWCxU
         HCo+KDWbUtay3dYxO+a3QKzbudYXLV4J1fnptgkgSn67kYnwfZwjooI5nmjLw1Z9vaCc
         o46F7vfEzIn3PN5wPVIy1ZfR6TAAgwRl9AsmUrnIv/w3C97coKWux3bTBsp9rTok5FwD
         V1eoGeuMoJTJ2t16gfC3VBbWuLNdvJBZaETIjG3JKZhtAzMgmCJdoSOH9SMRolMYH12E
         uDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRCIoBaBCeRRgNfTLDpgS7R8u5Yda5ygMHdNO89SYmdgpyLG2XS9z92hGCU2S+unnih/aecwcqKV9AdAZvmdTCvth7tumajLZ0aSfYu5Cag9lFv8majIUPUA==
X-Gm-Message-State: AOJu0YxbPn2XbaENthx3TE2Mm4ffcKnlirhjcp7LQAPRA4B1UTHYC04U
	JP+sh/vBhJH98a1gL5DqYDgBopMtTEAgP1aF14wUF1IWDHOPDR6OkD/nADV2ip7SY00I6BeugpJ
	KApBN/QnIMVuKOO1533EEXQaeZiM=
X-Google-Smtp-Source: AGHT+IGHgP6z574Igy8a8+oqkig2SJF/PP1suyvsuh1fNNu/IrrIgcG2WO4udYDjewsYMvoIYfZ5lxjloOd6B2o4Y5Y=
X-Received: by 2002:a05:6820:2221:b0:5da:9ef9:55c5 with SMTP id
 006d021491bc7-5da9ef95724mr11684004eaf.0.1724089924888; Mon, 19 Aug 2024
 10:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240808191119.158166-1-alperyasinak1@gmail.com> <CA+chaQcJnco=qYqvhyrVHJ_5O99rJbM8NuqkvvAAWca5Rjx+ow@mail.gmail.com>
In-Reply-To: <CA+chaQcJnco=qYqvhyrVHJ_5O99rJbM8NuqkvvAAWca5Rjx+ow@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Aug 2024 10:51:38 -0700
Message-ID: <CAMKF1soCdbuW7YfT_Aq26N=jNc08BtgefLD+OAWdC9P=d8sT7A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] blueman: Fix do_package QA issue
To: martin.jansa@gmail.com
Cc: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 17:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111855

On Mon, Aug 19, 2024 at 4:14=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Doesn't this just hide the issue that the systemd service file is
> installed in wrong directory?
>

yes infact it does sadly.

> with current master I'm seeing:
> ERROR: Didn't find service unit 'blueman-mechanism.service', specified
> in SYSTEMD_SERVICE:blueman.
>
> On Thu, Aug 8, 2024 at 9:11=E2=80=AFPM Alper Ak via lists.openembedded.or=
g
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > ERROR: blueman-2.4.3-r0 do_package: QA Issue: blueman: Files/directorie=
s were installed but not shipped in any package:
> >   /usr/lib/systemd/system
> >   /usr/lib/systemd/system/blueman-mechanism.service
> > Please set FILES such that these items are packaged. Alternatively if t=
hey are unneeded, avoid installing them or delete them within do_install.
> > blueman: 2 installed and not shipped files. [installed-vs-shipped]
> > ERROR: blueman-2.4.3-r0 do_package: Fatal QA errors were found, failing=
 task.
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3=
.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> > index 5aa3b2bd5..df2a226f0 100644
> > --- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> > +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> > @@ -40,6 +40,7 @@ FILES:${PN} +=3D " \
> >      ${datadir} \
> >      ${systemd_user_unitdir} \
> >      ${PYTHON_SITEPACKAGES_DIR} \
> > +    ${prefix}${systemd_system_unitdir} \
> >  "
> >
> >  # In code, path to python is a variable that is replaced with path to =
native version of it
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111848): https://lists.openembedded.org/g/openembedde=
d-devel/message/111848
> Mute This Topic: https://lists.openembedded.org/mt/107795994/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

