Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D977E7E358
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 09:24:38 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8213.1775208273762244457
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 02:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kzlbUFKs;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38bd15d82bdso12926431fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 02:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775208272; cv=none;
        d=google.com; s=arc-20240605;
        b=RKFy8ThOKzVr7Q61qPwwkKhPJEcohz+Lv8hfU2sfaVDYRyzulB6KivM2PfBab98j3e
         tThcw3SMLcJ2ZEmWkfnl9cUfgEqoTFVCPC4QCYrTofw035ytW4mwFTZBLm2uRTBzFVxV
         esQ1mh36dHHxKI4MrX0Tucen8KYrUe8s23T68Lkrq4YT/24G8nJqJ4Lvng7A0zv1B0dB
         nhTB/hnG9XhOVwoFU3XA38DLFMsh7nOvSxOizgSem3XtIlayGXRsnCVqN2ghDfFlMotq
         4pc0ULPZcTc8NMyA5qK7i3CUOS8sS8DBcRI5beYZ9QijGazblPRI/pO4Ae4EM5zw/9P8
         vkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpqWuzuPAMxuYqTMH+x9iBfdqGXKAbxDrOEsazZYxm0=;
        fh=rU3fGPLPNKY8jp1/1fPFYu3wsKLebEmAEAbEwOc0/O0=;
        b=d58cdRJA8khJr5KcxRtIHLIxlXD8TDZoXiSTLp7zBmdIsOeAtVA+OVs3eSe5FLfmPg
         ULKNcOR1U+F/B15O1ExgBUkTiS0Cz7PCI1zjaIetn750Othl/8m219oXZIByMKV06Cyt
         27rFKIZbg8FFCaQbLz8mbFKoKkG9mf4Zpl89qgltGnwDcpFdsS5ds5jZjyKwee6togWC
         TITdx7d0gflaI1fFv6Dr9Y4yEAiLvFRUtnmf5l+5LkO1ldlYmbFt7BBrxV/anHbAY678
         zglMIr9h1WDWEWvAZdr6bE/Tu6PJPx1bnaisLxV4dfj7M20iSso63Gzm/JnPmZTo2YxX
         zHug==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775208272; x=1775813072; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpqWuzuPAMxuYqTMH+x9iBfdqGXKAbxDrOEsazZYxm0=;
        b=kzlbUFKs60BnJ6fa1hED+AnWNxDvXzU80227LaVaE/T0nmx0k146jYz8Q4R8rpUUVV
         AJbjalzAOlEBEeSIs+zCsKAnFIWU4MF1IZ5QaKSvjUhYpYrq3w1PgNe8Sy+G4i0bjDp9
         62ZKkArZ92ZutqAq3aYt5Ux9kA0wh5giEyYmiDgHG/1hQvHftXOSm/C8VTmxPOvPJW+D
         tLEufJKFkdFh7ioY7mQKFB2ed+3ndkl6uON8/BnjLe/Hy5dZu64focQ/EbmjNiGXY0gw
         RzEqNNO/MAYjYHT9sPphBA12OxCjw/AipjvHQrmRaYcZLym1NkdUdIBDC0pVB8zKPl3o
         8tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208272; x=1775813072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RpqWuzuPAMxuYqTMH+x9iBfdqGXKAbxDrOEsazZYxm0=;
        b=g5xyF7e5txZEbB4i8xMnCDmIiLdRdxZ0VAYZrDsPp5sw82qEPtsy8YCKGFs7Zn238t
         ZVDXqX8BmPR4wSH1f3bKdHRYShBeMR88GzjfistnYKSSX/f2dPDp+Akp48qaOs+tSnST
         7mNoV0QK9uN5SVx2270YKjexhXKwSxA2t1Q6M0vY/sFjfGbFMytEFk4xJ10ZvZscXP8J
         3dKSQOVr7hnSpJmYZ9PJHF47reeXUqZ8aSNB+SWj7Jdbu+IIy74eRfwkFRCcni1KUWGA
         ArLLAM4HfG1CdNG0uC9OsspTAPtTvTQnUCRjMSrNCCnvqY+aW9WnWCRSJJIF2ye5t+X5
         Wl9A==
X-Forwarded-Encrypted: i=1; AJvYcCU5M3L7iiEs+Ysvk/FOyiee8FgJzcmrTscLRC72jTLyt2RHvQo6W208ge/9ybWaKVK8BnVPlmjd971aFqJCYmOzRhw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmO0IH2IPaOfvCKPbssTsTX4nB+/Jqh10NejWbtPKoTxoDJiP6
	QgW6rb/dbfSZU4TDXyTGTJ438qAgy3XeThTttVGpGZhD+KJj2Xa/q8jeJ6s1MeGzYiomovlSCJq
	2Omljkj0+p8UHM2QTVAIK8943WKYhpJ0=
X-Gm-Gg: AeBDievGB7U1dw/koxEK9/9hNCKUEmtEPm440SczlaSxRhBVv2iSICJPKAw59CXfSRZ
	ppxn2ub9hEjvgHyNF9gdZL2ssfRe7XRkvsXSHCvAVUoN7F6xE6+/Iv6V+x5vPU9K7xsjqQgFBF1
	Vgf9uTpWDBYILy3hSr3xGlp4HaT11Nho9j7Zj8yX+mlZ+OFdBp/xj6X/WWdADcLbd7xqt1qPcDz
	t72/JLezQUNP75cuvRpS0fKhBa9Ok6FR9i9AqFXYnRuHQeyU38aIqGlSuuunNZ1O329HW0CHouR
	/UnTA0i98w==
X-Received: by 2002:a05:651c:e17:b0:38a:8b97:7e9c with SMTP id
 38308e7fff4ca-38d8d36a2e8mr6784301fa.11.1775208271684; Fri, 03 Apr 2026
 02:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260331095820.1967914-1-martin.jansa@gmail.com>
 <CA+s=J=wiBcqMjM=CLgnWgOrXLxWvQ83iQvEdGCpHeQnB0jWmGA@mail.gmail.com> <CAMKF1sorwerjG46cqtEEyYAe2Fbo7D6L5G63vRonjzftX_CDhQ@mail.gmail.com>
In-Reply-To: <CAMKF1sorwerjG46cqtEEyYAe2Fbo7D6L5G63vRonjzftX_CDhQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Apr 2026 11:24:16 +0200
X-Gm-Features: AQROBzC1IdVNJKGZP7yUK8OuSttIdd3TafuZvUIwOXwFvZf1Y2tNV6rI2DkK4mY
Message-ID: <CA+chaQe8TL-hA98DV2zvz4wSVhD1wkAr6DQURZxwHjOwcO0k9w@mail.gmail.com>
Subject: Re: [oe] [scarthgap][meta-oe][PATCH] flatpak: add PACKAGECONFIG for dconf
To: Khem Raj <raj.khem@gmail.com>
Cc: anuj.mittal@oss.qualcomm.com, openembedded-devel@lists.openembedded.org, 
	Markus Volk <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 09:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125981

On Fri, Apr 3, 2026 at 9:58=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Fri, Apr 3, 2026 at 12:34=E2=80=AFAM Anuj Mittal via lists.openembedde=
d.org <anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> On Tue, Mar 31, 2026 at 5:58=E2=80=AFPM Martin Jansa via
>> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > From: Markus Volk <f_l_k@t-online.de>
>> >
>> > Disable by default to avoid a requirement for meta-gnome
>> >
>> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 3 +--
>> >  1 file changed, 1 insertion(+), 2 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta=
-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
>> > index 639027701b..3a2974294f 100644
>> > --- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
>> > +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
>> > @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
>> >  DEPENDS =3D " \
>> >      appstream \
>> >      bison-native \
>> > -    dconf \
>> >      fuse3 \
>> >      gdk-pixbuf \
>> >      glib-2.0 \
>> > @@ -38,7 +37,6 @@ DEPENDS =3D " \
>> >
>> >  RDEPENDS:${PN} =3D " \
>> >      ca-certificates \
>> > -    dconf \
>> >      flatpak-xdg-utils \
>> >      fuse3-utils \
>> >  "
>> > @@ -51,6 +49,7 @@ GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
>> >  GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
>> >
>> >  PACKAGECONFIG[curl] =3D "-Dhttp_backend=3Dcurl,,curl"
>> > +PACKAGECONFIG[dconf] =3D "-Ddconf=3Denabled,-Ddconf=3Ddisabled,dconf"
>>
>> This will change the behaviour for this recipe. Why is it needed? Are
>> there problems if it's left enabled?
>
>
> meta-oe does not depend on meta-gnome but its vice versa. If this option =
is kept enabled by default
> its adding dep on dconf which comes from meta-gnome. We do not want that

Yes, exactly this, as the commit message says.

I've noticed this when running "bitbake -nk world" and this causing:

ERROR: Nothing PROVIDES 'dconf' (but
meta-oe/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb DEPENDS on
or otherwise requires it). Close matches:
  dnf
  gconf
  obconf
ERROR: Nothing RPROVIDES 'dconf' (but
meta-oe/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb RDEPENDS on
or otherwise requires it)
NOTE: Runtime target 'dconf' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dconf']
ERROR: Nothing RPROVIDES 'flatpak' (but
meta-oe/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb RDEPENDS on
or otherwise requires it)
No eligible RPROVIDERs exist for 'flatpak'
NOTE: Runtime target 'flatpak' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['flatpak']
ERROR: Nothing RPROVIDES 'flatpak-dev' (but
meta-oe/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb RDEPENDS on
or otherwise requires it)
No eligible RPROVIDERs exist for 'flatpak-dev'
NOTE: Runtime target 'flatpak-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['flatpak-dev']
ERROR: Nothing RPROVIDES 'xdg-desktop-portal' (but
meta-oe/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
4.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'xdg-desktop-portal'
NOTE: Runtime target 'xdg-desktop-portal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xdg-desktop-portal']
ERROR: Nothing RPROVIDES 'xdg-desktop-portal-dev' (but
meta-oe/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
4.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'xdg-desktop-portal-dev'
NOTE: Runtime target 'xdg-desktop-portal-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xdg-desktop-portal-dev']

