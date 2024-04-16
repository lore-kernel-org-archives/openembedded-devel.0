Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB92C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 15:03:32 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.22966.1713279803462984325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 08:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CeXpYP6d;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34388753650so2083618f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713279802; x=1713884602; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FiCbHNL7bNMSL6H2S39QxgnIxmag3/omhmqXKuT0Lw=;
        b=CeXpYP6dq3V1qXY8aJiE54dYZNdfHoztQxbfMxfvb04pB23jE515g0hlJY/Q9TuXTc
         XGFZ9onl/fZWWFLyUTEof/C5j4HCCm53f9yDTnh9Aqh+OhFsF9pVBWc2mFjHpor0BH21
         xD06qIYQyxZKmluqnNOkxinfk6nhAIKDdSrL5rKYweDG0fnvfE2r7EFmfZjean0vNgIN
         iPn6vCGGgBgRBd3mjv0hNS6rO6QHuqYeVAjYhw87iCj3fbD6LYqBWfgJLOEzLg8aVxRb
         4C0EbW3LuIolDi9Gra3jJgaYkscLCINnB0Y/t1+rA9c1x3moDQIjyeKpGghZaHFlgq8b
         2QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713279802; x=1713884602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FiCbHNL7bNMSL6H2S39QxgnIxmag3/omhmqXKuT0Lw=;
        b=Iq1GpT+E0E79v+KvHjlXtqrjzAbMgTYcw4BjN86fWdzAX+sjH6Wa6KueJ8LI3sGIbf
         f0v2Yg437mBkwrNkgl+lNa2UVH/WE+bfVj7gSKh0PWL6dbusrCAZ41nEIutx6zU4pi2Z
         wm2yUlr1b8roHbtEFzOOHYb/BzGpFvCcBTlEpt7BBd78yjYPuTDoQhML2VaScQ/1RAW6
         6B2Wu2BDHnOH4mw55qaiqzKdKK17nrvZAT7s/+vkAjyvNiiYGUx0D+gK8n8mFrf7m60t
         ja81ObrFDNFF305r/gF51vCEQMuV6D0b3JgBQWPHP3jgVpEWbfmHVftNdt1iGMJUM+3M
         FpLg==
X-Forwarded-Encrypted: i=1; AJvYcCX/x7X4iynJLSiYsFWPMu9+P59pEMz7J5X8Z1sPdMG4oomtd6Meg/VAV5vY4tvHfQcEuuK2s8HRyF/dAKdCSp427WjUtHFbdn4uRLtz4xuZ3vnp2Ssl0Z3zwg==
X-Gm-Message-State: AOJu0YxxPUW580oeFKHg8ZP3QU1Q5cJeQEJCzqja8JEtsLmXbtO0VodC
	KHlzWS5PQTiTBRklZIkTOCdapDYZVsyJBFYiLx/yUYSow32J76ygU2mP6HFCsjxptbEswjN+YEx
	vjip0R3y55SBXWXnRatV/UF9eVps=
X-Google-Smtp-Source: AGHT+IGAFVrmaCBXW/Xd0fUsVe5Cax1xnW9WhE8GtZgVjEv1s6i0xSLV5oo4LUvCy5ve1G3rmvVSWwkNA22h1I7Zg+k=
X-Received: by 2002:a5d:5742:0:b0:343:84ca:ef27 with SMTP id
 q2-20020a5d5742000000b0034384caef27mr9032877wrw.41.1713279801553; Tue, 16 Apr
 2024 08:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de> <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
 <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de> <AS1PR10MB56979F3C20FEAA7E4EA855CEFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj-idDTJMihKSJYZCf3R16d1qYajfBC6AscGigR91UeqLQ@mail.gmail.com>
In-Reply-To: <CANNYZj-idDTJMihKSJYZCf3R16d1qYajfBC6AscGigR91UeqLQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 16 Apr 2024 17:03:09 +0200
Message-ID: <CA+chaQd60TVDT6iz+KMDPub4HwF5VZOj=akyYSZCSo4SbN5VwQ@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: peter.marko@siemens.com, "marex@denx.de" <marex@denx.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 15:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109982

Target python recipes are already blacklisted since
https://github.com/shr-project/meta-python2/commit/10c65fc18998d302f34634ff=
ceaf31ab335056dd
so meta-python2 already provides just python-native and necessary
bbclasses (as pythonnative.bbclass and few others).

So I don't want to add another identical python2 recipe in meta-qt5
(which will be included for all meta-qt5 users) while now only a few
recipes in meta-qt5 need meta-python2 layer to be included:

./recipes-qt/qt-kiosk-browser/qt-kiosk-browser_git.bb:    if
'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
./recipes-qt/qt-kiosk-browser/qt-kiosk-browser_git.bb:        raise
bb.parse.SkipRecipe('qtwebengine dependency requires meta-python2 to
be present.')
./recipes-qt/qt5/qtpdf_git.bb:# still depends on python2
./recipes-qt/qt5/qtpdf_git.bb:# First patch skips "python2" dependency
checks for the pdf module
./recipes-qt/qt5/qtpdf_git.bb:
file://0001-configure.json-remove-python2-dependency.patch \
./recipes-qt/qt5/qtpdf_git.bb:PACKAGECONFIG[webengine-pdf] =3D
"-feature-webengine-python2,-no-feature-webengine-python2,python3-native"
./recipes-qt/qt5/qtpdf/0001-configure.json-remove-python2-dependency.patch:=
Subject:
[PATCH] configure.json: remove python2 dependency
./recipes-qt/qt5/qtpdf/0001-configure.json-remove-python2-dependency.patch:=
-
                        && features.webengine-python2
./recipes-qt/qt5/qtwebengine_git.bb:inherit
${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2",
"pythonnative", "", d)}
./recipes-qt/qt5/qtwebengine_git.bb:    if 'meta-python2' not in
d.getVar('BBFILE_COLLECTIONS').split():
./recipes-qt/qt5/qtwebengine_git.bb:        raise
bb.parse.SkipRecipe('Requires meta-python2 to be present.')
./recipes-qt/qt5/qt5-creator_git.bb:    if 'meta-python2' not in
d.getVar('BBFILE_COLLECTIONS').split():
./recipes-qt/qt5/qt5-creator_git.bb:        raise
bb.parse.SkipRecipe('Requires meta-python2 to be present.')
./recipes-qt/qt5/qtwebview_git.bb:    if 'meta-python2' not in
d.getVar('BBFILE_COLLECTIONS').split():
./recipes-qt/qt5/qtwebview_git.bb:        raise
bb.parse.SkipRecipe('Requires meta-python2 to be present.')

That's why I've included scarthgap compatibility in my fork of meta-python2=
.

As there is strong opinion against declaring scarthgap compatibility
in official meta-python2 from Timo, Alex and Jose, I don't plan to
merge Marek's change (nor my version with additional fixes for
Upstream-Status etc).

Maybe usable compromise would be to delete all (already blacklisted)
target recipes from existing meta-python2 and leave only the
python-native to make it even more clear what this layer is
temporarily used for (maybe even with another blacklist by default
like I_REALLY_SWEAR_TO_MIGRATE_TO_PYTHON3_OR_DIE_TRYING) which IMHO
makes better sense than importing this old unsupported python-native
to meta-qt5.

Cheers,

On Tue, Apr 16, 2024 at 4:27=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 16 Apr 2024 at 16:19, Peter Marko via lists.openembedded.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > Following works for yocto kirkstone + meta-lts-mixin kirkstone/go + met=
a-lts-mixin kirkstone/rust + meta-virtualization master
> > LAYERSERIES_COMPAT_virtualization-layer +=3D "kirkstone"
> >
> > meta-qt5 should be able to do something similar with meta-python2 if me=
ta-python2 is frozen...
>
> If I remember right, meta-qt5 does not need target python2, it need
> only native python2 because the qt5 web widget contains a badly
> outdated chromium. So meta-qt5 could just copy the python2 recipe
> directly into the layer perhaps and drop meta-python2 dependency.
>
> Alex

