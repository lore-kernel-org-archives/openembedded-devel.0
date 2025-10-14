Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824F9CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 04:27:56 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.7720.1760416073094485625
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 21:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xvg2Oxzw;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78142734156so11550877b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 21:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760416072; x=1761020872; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiYea15QmRrJAO8EuKpU+m79fr5Xr5AwVvtA+M+mdlI=;
        b=Xvg2OxzwG9k27tdxxtdd8ZcxnOetfAN90RCIXo77xK+pv6KhLVTKZiTFW1yluSmjaG
         zfzm67AU3Tl1xhr5m1G8LUOBKlHLf9tmD+49CtDpErKEaWt/z8Zh8UVak0kmDlDtf5of
         bU+Aa3rGwualZ1NKCdzkLZCPvy24rLmoTswy/df7HdIpd9ypi45Oh1BgqeifkeiSwxu2
         6FXhiPPKBbc1w2XCxeHbXkvW5jjIjJd98PUGMN3sc5nefrIR4AcAC6BDb9BDE+9sJhzJ
         4deRNBNmbl8Q9hXyFmRpfRnbN+R1TsA6klM1JlOOsrYloh3y3NmlXt7brQGMxPtHAFgt
         O+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760416072; x=1761020872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiYea15QmRrJAO8EuKpU+m79fr5Xr5AwVvtA+M+mdlI=;
        b=a6iIs4+kNlnKiwgYSLAOxpViQuJ+x84kxLjfggieWr5zaRg+1BgfX/MM6OOjL95Rmh
         eEYICEW+/iaaWY1EKTNSsncVSSH8AWKZc1f5EhQHlbolpR6a4N8eZmyBOt0KjCgnz3yw
         GXepCEbV5nPWnFJgRVNX0JxsgYfzY4PMiRCImlTumNqp4QXKhZ7MZAHtggaCuY3qlT/2
         SEF9e3QAA0e5ZVxsnfc3ku6L/GRFQNUyZkx1frgB6iR6Ew5O0Xw5ZdsAgqdNXHgIfI4B
         FqqiqmYJ9Psuipog4CMDjQ+Ni6MRwYVhBh/MPeRQD8tbMCJ9vbdo7e4E2g9Mj0F6CnKh
         qzUA==
X-Gm-Message-State: AOJu0Yxxh/pc2ECko48lz6SmAM1MB9svfvARkocabype7zsDLv20Ta6D
	W1Pw5JfBzvwJ8U/QA3hO4BAJo6z2AKHy0rHUhHZYCbh0JvrsnEA85YaANPyfgTMWF7dOEwJPVUT
	dCerCy7iHMx1xq6SgG6CvAiNsswkwiLU=
X-Gm-Gg: ASbGncsoP8T8zxBxLmLxq9BgPozY6RgLCwbm6VqEVEticO3zQXHCQPzaCHrb4Gqds/Q
	NG/hMdey/buX7GdAtVCjJPXLI+9mCAADQCN2xY3mdRPO7rpkwsD5e2Xn0gaAMAIv2sjj82N2aAP
	COY9YnmfQ4OrtTUx7EzepXxEWFGyELiSBglXEylXUXnt2t/8iLvVkvremcvAOJTyKT6iyyEDnZL
	Gz/98Kxvuk3zc0hDOb8SDDlOwKTW7mvL8l5h7zaFRvJP3WuizW4R5+6bCM=
X-Google-Smtp-Source: AGHT+IEPgNlxiVQtyzgTdVUUx3oaPdK5VBrbBteyaxCq6RoKd/Pl07gRAeGnWE4NZX8ZUPFSiU8hHhPvbO1cbEAACx8=
X-Received: by 2002:a53:c04a:0:20b0:639:2c0f:a062 with SMTP id
 956f58d0204a3-63cea9279a8mr11243806d50.30.1760416072103; Mon, 13 Oct 2025
 21:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251013131725.2583786-1-leon.anavi@konsulko.com>
 <20251013131725.2583786-4-leon.anavi@konsulko.com> <CAMKF1sqG+hC0F5tiH8drCVocT3V4O54UrhV6=x_b9DD4qvy+Og@mail.gmail.com>
In-Reply-To: <CAMKF1sqG+hC0F5tiH8drCVocT3V4O54UrhV6=x_b9DD4qvy+Og@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Oct 2025 21:27:26 -0700
X-Gm-Features: AS18NWBy1B_N411Ye7IJhBrHUCiY3fzyI3iqWxkQQLHSHu-jPnOCqS9w3zyXlNc
Message-ID: <CAMKF1soJ5_bZi+k6C9DbBTfnSLTJ4Z3B4tA=44TL5TKby8omjg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] pydantic: Upgrade 2.11.7 -> 2.12.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 04:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120555

On Mon, Oct 13, 2025 at 9:12=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, Oct 13, 2025 at 6:17=E2=80=AFAM Leon Anavi via lists.openembedded=
.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > Upgrade to release 2.12.0:
> >
> > - Update V1 copy to v1.10.24
> > - Add extra parameter to the validate functions
> > - Add exclude_computed_fields serialization option
> > - Add preverse_empty_path URL options
> > - Add union_format parameter to JSON Schema generation
> > - Add __qualname__ parameter for create_model
> > - Do not try to infer name from lambda definitions in pipelines API
> > - Use proper namespace for functions in TypeAdapter
> > - Use Any for context type annotation in TypeAdapter
> > - Expose FieldInfo in pydantic.fields.__all__
> > - Respect validation_alias in @validate_call
> > - Use Any as context annotation in plugin API
> > - Use proper stacklevel in warnings when possible
> >
>
> We need to fix python3-lief recipe as to reflect this dependency as
> well. It currently has a patch that only handles 2.11
> there is upgrade for lief module available too, please address that
> recipe along with this change set as well.

Well, I got hold of it. patches are on ml

>
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  .../{python3-pydantic_2.11.7.bb =3D> python3-pydantic_2.12.0.bb}  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-pydantic_2.11.7.bb=
 =3D> python3-pydantic_2.12.0.bb} (97%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.=
7.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
> > similarity index 97%
> > rename from meta-python/recipes-devtools/python/python3-pydantic_2.11.7=
.bb
> > rename to meta-python/recipes-devtools/python/python3-pydantic_2.12.0.b=
b
> > index e603e7dccd..8016b55dfe 100644
> > --- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0928095550=
9d1c4ca14bae02f21d49a6"
> >
> >  inherit python_hatchling ptest-python-pytest
> >
> > -SRCREV =3D "9b52422377d974ffc3de4e8b0bf7faab1acf2ec4"
> > +SRCREV =3D "a7928e692e5a7841c4379d1af1fd37966941dade"
> >  PV .=3D "+git"
> >  SRC_URI =3D "git://github.com/pydantic/pydantic;protocol=3Dhttps;branc=
h=3Dmain"
> >  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
> > --
> > 2.47.3
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120531): https://lists.openembedded.org/g/openembed=
ded-devel/message/120531
> > Mute This Topic: https://lists.openembedded.org/mt/115733948/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

