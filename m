Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.5372.1627999218361566994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 07:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OkmMw0jA;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y12so29124093edo.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yiqjxE6I1mQpsbxKCifU7EX+47IearGN7STzPO1pIBY=;
        b=OkmMw0jASTDF/dSIdO6DzjEghz6zcFKoJHg/gW+lun0YvR870b7MO5I5LLu/8Ikzud
         aqtqeHAURhpGFtWG8Pfkl310jIEhBElKK6cb8hfURh44YPJ/Vyyg2rqUtz8DxcvC6oiC
         3G8K5Jmq52ooSlwKqUkQKx+H9DFVm8d4f+XvnH73yuiSzWIOivfqCKvpEkezm/MiCFgW
         ua6Dq/iqe5PrdzN2e1zwl3owTKkGs/FESfsLFn/ftnT0LTc6hdpEh64H4kJ0h907tmz6
         bD2phrCia/ZmJprxCY+2MhZ333ZfIWC7VEyVZX4Va83ocmfR0jb5UalCpFKMk7ip3Zts
         PNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yiqjxE6I1mQpsbxKCifU7EX+47IearGN7STzPO1pIBY=;
        b=EgBYpcvyJkR7ttC0QmcLVLVDb7enLaeHLLbKuhQVjELbA/oJYpmIN66iUHaOI6fRuz
         6Tb1uv55zGL9Jt4fwhkQAMS6yqpiY+lppAUocKUbaOZDatsQcyVTmyOzXCEjh2LAdeue
         BbRAPN4BVo1ECThmVHrZYAqLt7uUm5dYW1BhJv/CN9he8oDlSQnHaJkWbzog7eYKdfE5
         WWanu3NucfvQcNl904wTuiFb1EwShgrbWGuVMQgkQuuRWiBNZx6xRWL5zgDAhaFV0hvT
         KD2Zq/bcI9yt8TQT41VuEwclquKDkryiCzRJYnZbEQsThmeLvVOG2Z8IbRTROCfVqS+T
         UfbQ==
X-Gm-Message-State: AOAM533WwcbRXnStpjiNgUs/EevbKJdaAaU+hmHutF1wdKFp/pbVlaCS
	9JJkhiMtE8+M/aboTlNHATAZ2yeckSIDQLns4LA=
X-Google-Smtp-Source: ABdhPJwnX9dCwBGkZPWBd6uuDFCQYqQZTciFHz3q6tiHUUCmhTUd7YipsOnXVUo6ZA/i69gKYMcDCbnwdorhMoxc/zw=
X-Received: by 2002:a50:85c2:: with SMTP id q2mr4361137edh.157.1627999216770;
 Tue, 03 Aug 2021 07:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h8HhO5EMV8k4y6a8pMFOMO9Wv68zAO+Zy6KJSEUFePRFw@mail.gmail.com>
 <6c1da27d-dc2b-7a32-ad5d-cade68a796f8@gmail.com> <CAFZh4h8r3XOuNWA-3h9yraUZ+U7PLnPd7hxDLcyEQGiVM6EqrA@mail.gmail.com>
 <CAMKF1sosZLX7Ha7N23c+x=coBbzaavajL=+vmiXFXmZ86oDZTQ@mail.gmail.com>
 <CAFZh4h-oyyAdWC-vceBEJuUgZMEL7h7f5CRRO3f6yx6iY-zs7Q@mail.gmail.com> <CAMKF1so85_HpSoqt=ZBvgf_jYoJJnnBtVXUjPZfsJdupHa6_zA@mail.gmail.com>
In-Reply-To: <CAMKF1so85_HpSoqt=ZBvgf_jYoJJnnBtVXUjPZfsJdupHa6_zA@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Tue, 3 Aug 2021 16:00:05 +0200
Message-ID: <CAAQYJAsZCm3=Vo-R_26FhVH3CeD0PmeJmA4fuXUO1FQghkKqdg@mail.gmail.com>
Subject: Re: [oe] Any way to make cryptsetup smaller? I have a small 32M NOR flash and 11M SquashFS rootfs.
To: Khem Raj <raj.khem@gmail.com>
Cc: Brian Hutchinson <b.hutchman@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Brian,

wow, I think we are the last NOR users here in OE.
I gave the collie to Marcin: let see if another OpenZaurus arises :)

Cheers
A.A.


On Tue, Aug 3, 2021 at 5:16 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Aug 2, 2021 at 4:14 PM Brian Hutchinson <b.hutchman@gmail.com> w=
rote:
> >
> >
> >
> > On Mon, Aug 2, 2021 at 7:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >> I meant build an image like you do and then add cryptsetup and do a b=
uild again this all after enabling build history then check build history r=
epo and it will have the information on top commit about what changed and w=
hich all packages got added and how much are they adding to size
> >
> >
> > Use both:
> >
> > INHERIT +=3D "buildhistory"
> >
> > BUILDHISTORY_COMMIT =3D "1"
>
> yes see for e.g.
> https://github.com/YoeDistro/yoe-distro/blob/master/sources/meta-yoe/con=
f/distro/yoe.inc#L49
> https://github.com/YoeDistro/yoe-distro/blob/master/sources/meta-yoe/con=
f/distro/yoe.inc#L93
>
>
> >
> > ???
> >
> > I've never used it before.
> >
> > Do I have to smoke /tmp and rebuild everything?
>
> No, but perhaps better to do so. You can still reuse sstate
>
> >
> > Regards,
> >
> > Brian
>
>=20
>
