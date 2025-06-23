Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EEAC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 20:18:00 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.4928.1750709873738774085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 13:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OIvb8yh4;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b31c84b8052so5117722a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750709873; x=1751314673; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5032Krb7yxFtpLYaHs4ydl3/LCx5vDp/hdUytg+C3g=;
        b=OIvb8yh4F+0qjC7oslV2oOfnxSqCzdiQPh1uXq5xFt8aHS6UNBNa3UrRETpl7M4ytP
         3ESqcloslndEH/wJO6C8U1nK9NS9oQx0RFDI9d5GDeKKnstL/vylh40x2bq+pF/Uoy9y
         PLSOJmbPgOKdHAmyP3TEE1T4T0nlo1+x+EgrLqzK1alkY8OOGdTUJiPptNhWmMp4T2gv
         KtyURdUA03ewAPbxwEPcQfV4o0qkn+4Fx7UqA098x4pGMXtSg7COnfF24no0ZGRcSIAF
         3W3Xya/vC+EaknUAG9gaGkzdctij6qK03hSBtL33z2dEAFZC8f9tbXc+wHtN9qEmbM/j
         syGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750709873; x=1751314673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5032Krb7yxFtpLYaHs4ydl3/LCx5vDp/hdUytg+C3g=;
        b=vpKe7Q3m5ys1yQEWaHmaxuaF0zH/vQkNQ6LltxatBeXD7bM2iPFvDTz5DM3B3p6lrw
         t1T0pFznuETW6WYqoQt/vccLNqxjT7ny8GNPU8ovup2VFm6QpQsS77uRoGyHAQCWEUMs
         9IwAeYvf7SPF7VBmSV8sr2l/WeQJ3zL/OhdJAZ+1rs5XyeEZ4S5RLWicTRJNdltCZsUs
         qRlmv5rEivaCPWAyW13LSk5GU2Nqg8QxAWoC8juj5RmY24JtRq+wetSRyG5XJY1/lrxT
         DGqgt244o2NWMN4ILciLLq3aeH3YvN+a3OMzImNt5mUvADeZ1bnDw/nlNuRJ5v5SPCgc
         XLcg==
X-Gm-Message-State: AOJu0Yxho0DtJ47q093D9+tLTPDjOHAwAuBbHw7QAwNvdMuGcL90glj4
	WWFJJTBucCB39vCcyIq/uHg5EmZiC5O+dQjz9yxRvJWsCRinX8Wl4FYTMt5Cb6AEyadzN9F81Lb
	r4km2vpowOV+eC2Ap2pvQB2txS9IebAI=
X-Gm-Gg: ASbGncuPjXHRXoXqqDm08xQ/RBxgT3Zom1y5I4VYDyiaawxJ9JjOnoIdzW9OmaSJnDx
	uT3vDvYSEii7xO0dDtlbSyBmtKx8CjE+P7a/sn93xkGYt0J5ZOx+HHH13MN1gM/U5p8rmP6F3p7
	cq/aAfena9ZPAK76LGODVpNS/A+03BfQ6oCjvrt8EE0tE=
X-Google-Smtp-Source: AGHT+IGey9MbhCHIwnL8IovPp6uc4YRRgVmWiAr8syPuSrs9+OtJ4zRNMZr9BZmS+FIpKQdA0kcIKytYY/g/+0iqLa4=
X-Received: by 2002:a17:90a:dfce:b0:311:f05b:86a5 with SMTP id
 98e67ed59e1d1-3159d565d3dmr25708338a91.0.1750709872931; Mon, 23 Jun 2025
 13:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250623191048.488812-1-alperyasinak1@gmail.com> <CABF_=yia4NmdasTLkJNs+t10Z3YZL3pXkOpjN+WLw42=JyiPQw@mail.gmail.com>
In-Reply-To: <CABF_=yia4NmdasTLkJNs+t10Z3YZL3pXkOpjN+WLw42=JyiPQw@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Mon, 23 Jun 2025 23:17:41 +0300
X-Gm-Features: AX0GCFuWCebiLeq1QjB1cqYK2y0ABhZRKmaoxak8Ps8AcEnY9GUW14-87hrAxdQ
Message-ID: <CAGpma=6-q0_RmzvkXXoWvt6iK8KTBnX9RUO9cG7SnRSqAmFQaA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] tk: Fix compile error
To: jan vermaete <jan.vermaete@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 20:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118091

I thought about using PV, but if tcl and tk can be upgraded
independently (tcl recipe is in poky, tk is in meta-oe), this may
cause failures if tcl is upgraded without upgrading tk. That's why I
preferred to hard code the version.

If there is a better way to handle this, I=E2=80=99m open to suggestions.

jan vermaete <jan.vermaete@gmail.com>, 23 Haz 2025 Pzt, 22:45
tarihinde =C5=9Funu yazd=C4=B1:
>
> Could the variable PV not be used in the directory name to replace the
> hard code version number?
>
> Br
>
> On Mon, Jun 23, 2025 at 9:11=E2=80=AFPM Alper Ak via lists.openembedded.o=
rg
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > tk9.0.1/unix/../generic/tk.h:19:10: fatal error: tcl.h: No such file or=
 directory
> > |    19 | #include <tcl.h>
> > |       |          ^~~~~~~
> >
> > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recip=
es-devtools/tcltk/tk_9.0.1.bb
> > index 504b40927e..230a244a6b 100644
> > --- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> > +++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> > @@ -30,6 +30,8 @@ S =3D "${UNPACKDIR}/${BPN}${PV}"
> >  # Short version format: "8.6"
> >  VER =3D "${@os.path.splitext(d.getVar('PV'))[0]}"
> >
> > +CFLAGS +=3D "-I${STAGING_INCDIR}/tcl9.0.1/generic"
> > +
> >  LDFLAGS +=3D "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
> >
> >  inherit autotools features_check pkgconfig
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#118088): https://lists.openembedded.org/g/openembed=
ded-devel/message/118088
> > Mute This Topic: https://lists.openembedded.org/mt/113794949/2167232
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[jan.vermaete@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

