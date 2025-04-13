Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AC2C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 09:07:14 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.25768.1744535232445677430
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 02:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Br0QnHRP;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e6dee579f38so2590179276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 02:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744535231; x=1745140031; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmtLPmqxdEOk7FRbLhXAL2vAJeTsaDYyfKwq8ChidoA=;
        b=Br0QnHRPlzmc1Sf4ea9rf8UwzEs7365KHyNF+PIzTUuva/IEVEew/hCzs1iEt96AVO
         eDc0jxdvR4e7szhILeTnYTMSuJsVyuktaTCxIwb2/m6wB6Mj7Ty4/GyTpYQ59yu/gvWp
         bPDfn9NieFX7GA9MhEtZtKLVrM6ZKWBHP1Fb+jVp52nCnPRAn6n3vJy/QHILR0mvcrdZ
         1kYxOQmodoP996iMFh2uzjye/yq0X1t5Acbo8mJuWqTpkErqdmKu/vNRUjTkYg0/LFC6
         K02wbTWMaIgCtPOU7tK335/dQLPvlDKebTQCr/ctVZn8O2/WwFWUon81fXtUfzlH6W+a
         mSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744535231; x=1745140031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmtLPmqxdEOk7FRbLhXAL2vAJeTsaDYyfKwq8ChidoA=;
        b=PO8vS8xRgbOpYYDRZQ1RtfkCB9fuMmuPp7QJsRJAg9sgrAJzr0oJcXINGJ57RjH04X
         6sdANoAO500lC70zRX32HomzLat+6MlGpBTe1EpmtO5rfavbqEzyQaDQYjJttkpN6xRj
         jyhzEx9WtLChrAgmKOxitgo3G9M/klK5MbC5gU/ik31h5T35w8HpyGKKnMG8gtPTDHM4
         JNsSOK8ZsFRGfZMI+sLWKdypE1+vLoU0vHuSorANNpN8137UCt9QqYyb6qzqrVygO19r
         lS9rOU4jXwg3f2GjAxiSQStpI/jcZyxqnH1jra672uirpjP0QhhUQCWFpfggWzfVrgsH
         djmg==
X-Gm-Message-State: AOJu0YxT7ur0VfVGrq2/EwFldYYDxpRsGDmn1K6VCo1m19O03u2/x5kN
	MarZZ1tRz0QZahTaEZlvXwudzftnaf0lNVkzzYAVL287Xj38TPiYllAvViO8vSTtthdzBdeU6j8
	vMVUog2W7fp1dAollIJ1DPn13faPaqA==
X-Gm-Gg: ASbGncskF0wkhcyUPF4XTvZrwgUK1kIDpLX8TfkoFr5HpKMCVthliDOrBGJ5qn0E26T
	1fcnM4l9EJ/vNQgwhzLtwGoNveP9k6u+6R8inaxF8ZRnJKYE+et5JRZFK6T1HKZBL+juAw91c9U
	oqbzfVw9uLKVFamLnv/P/WuHm9+VuFn5H8qsXMzkcyi7yKNrcV5HN3xXI=
X-Google-Smtp-Source: AGHT+IEMivVcThrCXqyf2NdQoDZH1zJS6YABtzimEmBR0AODmxfYuBoZqFyJg6aEB5lFR4R5oLTbJ/jDjqePnvxZJto=
X-Received: by 2002:a05:690c:3511:b0:6fd:385d:5f10 with SMTP id
 00721157ae682-70559a9f958mr155236767b3.35.1744535231323; Sun, 13 Apr 2025
 02:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250401185718.2447415-1-jan.vermaete@gmail.com> <CAMKF1srQL9v2vfqEpdk6BffkhPc5K=gVJf5oN1gwxCp6SGKYyg@mail.gmail.com>
In-Reply-To: <CAMKF1srQL9v2vfqEpdk6BffkhPc5K=gVJf5oN1gwxCp6SGKYyg@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 13 Apr 2025 11:07:00 +0200
X-Gm-Features: ATxdqUGuvXHhucM5CZnPEzXKTbZ81QvQEbmqkMimd8KgqaZ_lj1fHvMTToV67ys
Message-ID: <CABF_=yjZjDmgk3=W0v6fbb_1Ecm5Z=KG+HykptnMzZr700hTVg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-mdurl: new recipe version 0.1.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 09:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116824

Hi Khem,

Sorry for the late response.

The code on github does have tests.  However the archive on pypi.org
does not have them.
Would you like to start from the github code to have the tests included?


On Wed, Apr 2, 2025 at 6:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> it seems to have pytests please add support for it and tie it into
> meta-python/conf/include/ptest-packagelists-meta-python.inc
>
> On Tue, Apr 1, 2025 at 11:57=E2=80=AFAM Jan Vermaete via
> lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > * no tests are distributed in the pypi package
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  .../recipes-devtools/python/python3-mdurl_0.1.2.bb  | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-mdurl_0=
.1.2.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb=
 b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
> > new file mode 100644
> > index 0000000000..cc110784e3
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY =3D "Markdown URL utilities"
> > +DESCRIPTION =3D "This is a Python port of the JavaScript mdurl package=
."
> > +HOMEPAGE =3D "https://github.com/executablebooks/mdurl"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daca1dc6b9088f1dda81c89cad2c=
77ad1"
> > +
> > +SRC_URI[sha256sum] =3D "bb413d29f5eea38f31dd4754dd7377d4465116fb207585=
f97bf925588687c1ba"
> > +
> > +inherit pypi python_flit_core
> > +
> > +PYPI_PACKAGE =3D "mdurl"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116484): https://lists.openembedded.org/g/openembed=
ded-devel/message/116484
> > Mute This Topic: https://lists.openembedded.org/mt/112032802/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

