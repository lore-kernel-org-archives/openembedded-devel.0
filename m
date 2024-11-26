Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFC9D5A6E8
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 06:50:50 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.40044.1732603844208801294
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 22:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WF0gpMLs;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-296252514c2so5012511fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 22:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732603843; x=1733208643; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ+75oBFHndV1SzS6wNWDo3h5kkGIEp2DlhSAAMoHSE=;
        b=WF0gpMLs2SGc5bRXk9Cb8v8c2MugySLE4DztG0V9Oik7TXzPO6sqSAW9u253vIIVtN
         Sp/6ofL3ptRlzf9XnJ2diFUSL32fLrZ4GeZL1JezmyhVXbQWdeOrk6U9WMFfGSa8Lmhx
         9Tl0Kc2fbadwC/Okj1nTU7Rv1KEmsmG33P3zEgkSkTp2/1yJzzjsymOh2Q36G2egejdr
         2yNUuNe36MHLNrAAZbnv35dlg3QW7TFLVCsA6I7u3JLmjizdX7VBO0/spAdu29zxLfeY
         t0abFtSpK46gLHOqtdQYILnD1CqLrI7JoBqIqi5O3u8PG4eaa6thsLFBR8T43jRxaYQz
         TauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732603843; x=1733208643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZ+75oBFHndV1SzS6wNWDo3h5kkGIEp2DlhSAAMoHSE=;
        b=OAjuZx99Pq2x1iJe0sQ/th066r61yKVKSt/lXYBYfdgzJo7tOh8W2YyRLKK9x7rSL3
         Cot2TxNdjJgaOaXuDuHDgg5+tCVIf9V3jucorzWnH0UVj7FYzMlJlTwWev+ZGoEs22nd
         utNT6ZilFFvy8okbbinj3GmYcEm0OVE0mV15LPBkp9zesmku3Wa7KTyVfSfLG2VpH6Mz
         tShDIkC1btMpYlw3SlOJUBH57AZa4E930vvZv4XIVq53pKNbApQPPDkh6WirqDgA5Vvw
         0qaq4OhjXk/wOOQ67pXc2SbX3ncoifx2Qp8vUtw5fNB6wxd7fY4x2zQAElE/T/vGC+Ri
         SCrw==
X-Gm-Message-State: AOJu0YzrqucplduCWhb9K27spuWou/Db/DbtMRMCcmRPwHWLcqbJWHLI
	XHIV4VugVTmlbxJuiIfGgMvpLHp1lj+jRevIXwA9kYo3oNSaNqKp259SAK3k+W5qqwRD0njVq1V
	0DrEjHtVoiWGrNeQ+rQmQjPQFXmw=
X-Gm-Gg: ASbGncs4qwetkmG6kESl1czRHax1q9IYFZlg202C0A45/IC9k7gBb1TQVOPguOg2n7p
	mFkdWi29RRQ2+d84X4pNlMcHgNfTD0Q==
X-Google-Smtp-Source: AGHT+IFa2e880TjzC7qo7FsqPn3UlfZ0HfFWKEVABGRfPoQzHJVQSkj05B1A/KScKhTZ2rMmGeN3WYka5vZwTw7EM3c=
X-Received: by 2002:a05:6870:648a:b0:297:1d2a:a724 with SMTP id
 586e51a60fabf-29720b1f5c1mr12542758fac.1.1732603842789; Mon, 25 Nov 2024
 22:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20241125145307.5479-1-schonm@gmail.com> <20241125145307.5479-3-schonm@gmail.com>
 <CAMKF1sqgczUcaBXVYdZfF8vyJBhYb8sDA-hxvWF4s1zBE0HCDw@mail.gmail.com>
 <CABTo8gAi66eT6tnSMrbFk=JiPLgxguT2ggW3bhzzVQBjj4wNog@mail.gmail.com>
 <CAMKF1spOXeynnBDL-QYy6R2qixkSMT0XkG=7H87LPRZsJEDoQA@mail.gmail.com>
 <CABTo8gCDkLNOXFXaAw-PyYE6uUJbXcCDGKjpYK_MhXv5_47qRw@mail.gmail.com>
 <CABTo8gArNyLyWx0d9-=F0HXaHEU0Qpya1WrtFO7ex6130S_ViQ@mail.gmail.com> <CAMKF1srp71Ue76GsvoW_gL_yfh7NYh-DuCkdJOK+HpKPMQZ2tQ@mail.gmail.com>
In-Reply-To: <CAMKF1srp71Ue76GsvoW_gL_yfh7NYh-DuCkdJOK+HpKPMQZ2tQ@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Tue, 26 Nov 2024 01:50:31 -0500
Message-ID: <CABTo8gDt6R8ive1k8PhkNEMcBmqvOt+9XwqVQr_BXeas5_+Vfg@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 3/7] libxfce4ui: Upgrade 4.19.3 -> 4.19.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 06:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114060

I was, after getting my layers straightened out, able to reproduce the
problem.  The problem appears with the clang compiler and not with
gcc.  It does not appear to be target specific.  I was able to
generate it on ARM.  It turns out to be a known issue and was
addressed in newer releases of the libxfce4ui package.

You should find on the mailing list a patch to go to version 4.19.6.

Thanks for your patience,
Jason


On Mon, Nov 25, 2024 at 3:50=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Mon, Nov 25, 2024 at 12:23=E2=80=AFPM J. S. <schonm@gmail.com> wrote:
>>
>> Khem,
>>
>> I'm still not seeing the problem on an Arm target.  So I will move to
>> a riscv target to see if I can at least reproduce what you are seeing.
>>
>> I did  find this which provides a work around.  Although I'm also open
>> to just dropping the update.
>>
>> https://bugs.gentoo.org/924321
>
>
> Yeah this seems to be the exact problem I am seeing
>
> Workaround fix is ok infact it=E2=80=99s a real bug
>
>>
>> I'll let you know what I see with the riscv build.
>>
>> Thanks,
>> Jason
>>
>> On Mon, Nov 25, 2024 at 3:01=E2=80=AFPM J. S. <schonm@gmail.com> wrote:
>> >
>> > I've updated my DISTRO_FEATURES to have ld-is-lld and will let you
>> > know what I find.
>> >
>> > On Mon, Nov 25, 2024 at 2:41=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
>> > >
>> > > On Mon, Nov 25, 2024 at 11:33=E2=80=AFAM J. S. <schonm@gmail.com> wr=
ote:
>> > > >
>> > > > Khem,
>> > > >
>> > > > I have TOOLCHAIN =3D "clang" in my local.conf file and was not see=
ing
>> > > > this error.  Is this perhaps riscv specific?
>> > >
>> > > I think you will also need ld-is-lld in DISTRO_FEATURES to reproduce
>> > > it. It possible its RISCV specific but I think
>> > > first thing is to get LLD linker going for build it and see if you c=
an
>> > > reproduce it too.
>> > >
>> > > >
>> > > > I ask because I built core-image-minimal-xfce with raspberry PI 5
>> > > > target as an arm 64 build.
>> > > >
>> > > > Thanks,
>> > > > Jason.
>> > > >
>> > > > On Mon, Nov 25, 2024 at 1:46=E2=80=AFPM Khem Raj <raj.khem@gmail.c=
om> wrote:
>> > > > >
>> > > > > with lld linker I see errors like
>> > > > >
>> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceSe=
tIOErrorHandler
>> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
>> > > > > --no-allow-shlib-undefined)
>> > > > >    |
>> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceAd=
dConnectionWatch
>> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
>> > > > > --no-allow-shlib-undefined)
>> > > > >    |
>> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceCo=
nnectionNumber
>> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
>> > > > > --no-allow-shlib-undefined)
>> > > > >    |
>> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IcePr=
ocessMessages
>> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
>> > > > > --no-allow-shlib-undefined)
>> > > > >    |
>> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
>> > > > > IceSetShutdownNegotiation
>> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
>> > > > > --no-allow-shlib-undefined)
>> > > > >    |
>> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceCl=
oseConnection
>> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
>> > > > > --no-allow-shlib-undefined)
>> > > > >
>> > > > > On Mon, Nov 25, 2024 at 6:54=E2=80=AFAM J. S. via lists.openembe=
dded.org
>> > > > > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
>> > > > > >
>> > > > > > Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libx=
fce4ui-4.19.4
>> > > > > >
>> > > > > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
>> > > > > > ---
>> > > > > >  .../libxfce4ui/{libxfce4ui_4.19.3.bb =3D> libxfce4ui_4.19.4.b=
b}   | 2 +-
>> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > > > >  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.b=
b =3D> libxfce4ui_4.19.4.bb} (92%)
>> > > > > >
>> > > > > > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19=
.3.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
>> > > > > > similarity index 92%
>> > > > > > rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.=
3.bb
>> > > > > > rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.=
bb
>> > > > > > index e53d01d00..ce711eb36 100644
>> > > > > > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
>> > > > > > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
>> > > > > > @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEAT=
URES}"
>> > > > > >
>> > > > > >  # TODO: Check if 0001-... can go
>> > > > > >  SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-=
shortcuts.xml-fix.patch"
>> > > > > > -SRC_URI[sha256sum] =3D "16815eef494ba9bac9c854e95c205c0bc5568=
c8022c31604348f9edadb02f227"
>> > > > > > +SRC_URI[sha256sum] =3D "c873ec46d5dd448df60a8385e029892f85b40=
ad66200cc3c055ab7156d718796"
>> > > > > >
>> > > > > >  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
>> > > > > >  EXTRA_OECONF +=3D "--disable-vala"
>> > > > > > --
>> > > > > > 2.43.0
>> > > > > >
>> > > > > >
>> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > > > > > Links: You receive all messages sent to this group.
>> > > > > > View/Reply Online (#114040): https://lists.openembedded.org/g/=
openembedded-devel/message/114040
>> > > > > > Mute This Topic: https://lists.openembedded.org/mt/109772240/1=
997914
>> > > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-dev=
el/unsub [raj.khem@gmail.com]
>> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > > > > >

