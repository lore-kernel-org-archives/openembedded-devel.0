Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id EBFC57F82F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 18:55:22 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id e187so4034384qkf.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CftdHucuvqaWG8ICbWoLhF3N3DSZCyT0IwUyit+7HJo=;
	b=D8W+Ngxa4P0qjLt56CYwMtF13sxO0Yrqg9b5xYLAg5nUFRpPONCeNRD7H8RwCEvaI8
	oHEzgDn4+DJ4AfPIou23Z8vQL/Xd15GS+aelnDS6mC/uxzRh0CNf+j5N/NAHbHBZbgfw
	ZrE+Li8TuMJYcnWbdvrQRNSolUOniJ9g5G4C3Dcnu+KfZeyDiwa9dvDVbhtWGMc85TDJ
	u2gEjKnyrblEzMJRmDNq/LY+ZyarNBZuvOuXqNSz7eH86cxk3/mT3Ab97fywzOdL3qcs
	jjV4JXrq73q3yslLV0xm5gSeYXooWNbZUEjBhhRDfDiJ5fpfZ+3IML2wJQ6/RZmxQ3OJ
	gtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CftdHucuvqaWG8ICbWoLhF3N3DSZCyT0IwUyit+7HJo=;
	b=D0EgaxHbiInMLqF+0DrDpSz6FYbpy5LK4FeXPEa1MDJqDypNYlr9SI/zMnIksu38B7
	ECKlQQm5TAM6SnghFALSvQLj3XPuqD20nOWQM0d7MXmVt1n7hp2f/YegIC9rBCpy1pgd
	GTMqfTBC+xkv1zdboJ5T+d3J91sAHqjlPqSgHfTJIQb1TpfA9D5mzf0Xo3MUPFLnkfh/
	mrGJJcq91tsZCoi6wSG81Jffzbr7D8MdfJDLka+C1bcQ+SbGGQMEbrBNSAMBuoJIgL/6
	s3X7H9k84Wc1OWGnhdgLvFOiTeBrvojMaXL5NOzBwHYqaYQpCdYDTT3n9TRK0MWN56PR
	8K+g==
X-Gm-Message-State: APjAAAVi4LMdKWXLMDJdkC8veJ9k9Ouo0QBj4JQQUWzPMTQYDAdSxx6L
	8TVPdPiy2ClWAfGkfx21kNJLsOWbwBhGJcT5P1++9Et4
X-Google-Smtp-Source: APXvYqymE8W/fSgx4CudMP9sa87HvE3qjplKbgRqPhORpg2cz6vdlJRkzJD0dlpqR3hDAdHDhiFWBJFdWYZcyDFTZcc=
X-Received: by 2002:a37:4bc2:: with SMTP id y185mr9637961qka.474.1574362523518;
	Thu, 21 Nov 2019 10:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20191121023440.36149-1-Qi.Chen@windriver.com>
	<94f0644e0fcbcfbaf226d4d25cf28e64170e5c86.camel@andred.net>
In-Reply-To: <94f0644e0fcbcfbaf226d4d25cf28e64170e5c86.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2019 10:54:56 -0800
Message-ID: <CAMKF1spvG3YymsZeJSP4zsVSH1Nr1mFFREZp7F-N0s3MDxMSHg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-jsonschemea: add missing dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2019 18:55:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 10:51 PM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> there's a typo in the subject line
>
> jsonschemea -> jsonschema
>
Thanks Andre, I took care of it in master-next

> A.
>
> On Thu, 2019-11-21 at 10:34 +0800, Chen Qi wrote:
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta-python/recipes-devtools/python/python-jsonschema.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc =
b/meta-python/recipes-devtools/python/python-
> > jsonschema.inc
> > index 1841b5893..5599cc6f4 100644
> > --- a/meta-python/recipes-devtools/python/python-jsonschema.inc
> > +++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
> > @@ -23,6 +23,7 @@ RDEPENDS_${PN} +=3D " \
> >      ${PYTHON_PN}-strict-rfc3339 \
> >      ${PYTHON_PN}-unittest \
> >      ${PYTHON_PN}-setuptools-scm \
> > +    ${PYTHON_PN}-zipp \
> >  "
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.17.1
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

