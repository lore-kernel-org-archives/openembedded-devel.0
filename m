Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4617BEB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 18:15:24 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.1446.1687284917285399465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 11:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=R1bOEzou;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a034e628fcso1045287b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 11:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687284916; x=1689876916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz4ypvGwXGR/qmu4cO/mlmC5O7H+Ybb0HHf/fczhDFI=;
        b=R1bOEzouJs6ExZ9z1kIH7iXKX+pKvmFiBFhXvDiNtsv+Kszg7nN5zbwFogCFVgtuMv
         prQND73rPliKCcre+jTjtxCkxjnI9bzvitTzIWdznpfggw0QIH5H2tBLL+9LCh11vZfo
         /Yi1O2q1VT8Pss1nk/KN9TOLzWcQl16LvPF/OkTvcmta/AJ95AMZ71c94CzCn6VzaFvd
         xgsUkAcuQ4TNY8t3L0l6sWre9nCBRkMg7QxFMgv3AGZ6BeEsadfRHYmTnO2RdZhl+Yf4
         R+bJWUIUHGCUFHFsjRvrxjJaooDPUzyOIkMKG+pgVtL6LBLUke8KEQi9sBUUkyFhLc6v
         CfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687284916; x=1689876916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz4ypvGwXGR/qmu4cO/mlmC5O7H+Ybb0HHf/fczhDFI=;
        b=InyU6ITQo8k3dB4EHr10pbQ76PbjvFMZYsb+WjbWL7+752g7Ae0HVDLOLV2myZfcMw
         TuGcvhyjODLhzjm8AtSjEaEFXiV3eMiSswT3JLFuvCSNgvZaPgP+U+DPl+qGUckzamNA
         Cu6tXboL+0cz173gWoOQKaczyYw5WI7j9liU+yUQ85hSnQNPr9MwViXOS/a/PsrXt/lH
         X1dK8eN2+1+SvMZXrG86r2SYi5S431MmwKrqvbjsmhCSBEU5iToDVxwceoNvPcIxog/Q
         CFSmOcQhZIxjgy2PqSGFYn+loVbngV7h2mH2/kmhmjaErfueSSXeFEyqqKREfXQNn2cr
         HkpQ==
X-Gm-Message-State: AC+VfDw0bKvJspNPB6KQ+h71QgRJRseRn7DtMO/A4/cfJiLSDkGBaqzF
	11EMlO785QwZtIxvZolQttctDgS13jyhefN2Q64=
X-Google-Smtp-Source: ACHHUZ5n3s1EBA9DKZnzXSpb93SNxmQ94M6gULyson3yawlJq7lr6Ff19zauR7sKnDauGaDCs40hNbReOmqJnLVn20Q=
X-Received: by 2002:a05:6808:138c:b0:3a0:43d5:11fe with SMTP id
 c12-20020a056808138c00b003a043d511femr520949oiw.26.1687284916466; Tue, 20 Jun
 2023 11:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230619132214.213417-1-brgl@bgdev.pl> <20230619132214.213417-2-brgl@bgdev.pl>
 <5a677745-c6a2-bd0a-5507-98bc3b185877@gmail.com> <CAMKF1sq=L-GyguojmkSd4KD9Aq5mAEaM9O-pUnECZqhzdrfetQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq=L-GyguojmkSd4KD9Aq5mAEaM9O-pUnECZqhzdrfetQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Jun 2023 11:14:50 -0700
Message-ID: <CAMKF1sp403GSqm3iA99qrw-14zLbbViwQ68AOK6XhUKN4kBK3w@mail.gmail.com>
Subject: Re: [meta-python][RESEND PATCH 01/54] python3-pywbem: drop unneeded
 class from RDEPENDS
To: Bartosz Golaszewski <brgl@bgdev.pl>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 18:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103468

Some more dep failures on parse

23:11:18 ERROR: Nothing RPROVIDES 'python3-nocasedict-native' (but
virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openemb=
edded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
RDEPENDS on or otherwise requires it)
23:11:18 NOTE: Runtime target 'python3-nocasedict-native' is
unbuildable, removing...
23:11:18 Missing or unbuildable dependency chain was:
['python3-nocasedict-native']
23:11:18 NOTE: Runtime target 'python3-pywbemtools-dev' is
unbuildable, removing...
23:11:18 Missing or unbuildable dependency chain was:
['python3-pywbemtools-dev', 'python3-pywbem-native',
'python3-nocasedict-native']
23:11:19 NOTE: Runtime target 'python3-pywbemtools' is unbuildable, removin=
g...
23:11:19 Missing or unbuildable dependency chain was:
['python3-pywbemtools', 'python3-pywbem-native',
'python3-nocasedict-native']
23:11:23 ERROR: Nothing RPROVIDES 'python3-nocaselist-native' (but
virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openemb=
edded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
RDEPENDS on or otherwise requires it)
23:11:23 NOTE: Runtime target 'python3-nocaselist-native' is
unbuildable, removing...
23:11:23 Missing or unbuildable dependency chain was:
['python3-nocaselist-native']
23:11:28 ERROR: Nothing RPROVIDES 'python3-yamlloader-native' (but
virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openemb=
edded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
RDEPENDS on or otherwise requires it)
23:11:28 NOTE: Runtime target 'python3-yamlloader-native' is
unbuildable, removing...
23:11:28 Missing or unbuildable dependency chain was:
['python3-yamlloader-native']

On Tue, Jun 20, 2023 at 11:03=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> here are some failures
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2841
>
> On Mon, Jun 19, 2023 at 6:16=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On 6/19/23 6:21 AM, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The native package has the same dependencies. Even if normally they a=
re
> > > satisfied by python3-native, we should still use a global RDEPENDS.
> > >
> >
> > This will deepen the dependency list for native packages. Why should we
> > do this ?
> >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >   meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1=
.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > > index 71af06881..8b0383cf6 100644
> > > --- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > > +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > > @@ -27,7 +27,7 @@ DEPENDS +=3D " \
> > >       ${PYTHON_PN}-wheel-native \
> > >   "
> > >
> > > -RDEPENDS:${PN}:class-target +=3D "\
> > > +RDEPENDS:${PN} +=3D "\
> > >       ${PYTHON_PN}-datetime \
> > >       ${PYTHON_PN}-io \
> > >       ${PYTHON_PN}-netclient \

