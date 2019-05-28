Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 579457D3AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 16:14:28 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id b18so17523853qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dr0+ujOL4DBCVgjiBOdWXfmovqFs261SH67N4Nb1OLA=;
	b=IyTKSwMq/8INDqNzqSUIm94GrbFp9zagTBAM1dJRofXCsblezpRf/PXoVt9doYcdUh
	4NvFvBx9tcqkSFQKIwFEaNBSXOMbwYAJLVABL6T6X31kmtCOGBjeqjgSFQGzw9+wHzw0
	+xT8Wv7IRwGwcsGSmMvbWj4LHb/KPyQDvOufrHEk+LL34fMiyyNegjNq6zVeQe2/DC8o
	DmrY4Tbxxugf/n+MmYR3p6M2PDM0UdnVgwaS9FfK8qLRVnznB5tplx3OmcwWwGzbjjOm
	ThRu5fbduE64Rcd/7gP0aogF5TOMEi/xSGmNqk3+uVRru/pGrg6vid94LS8jlvL0oIDe
	CsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dr0+ujOL4DBCVgjiBOdWXfmovqFs261SH67N4Nb1OLA=;
	b=aVZjIErxse9Ja8A8Fth0SQxSVazPFvI+YYCsOj7gwYe0OIwamvnXYXV74RM5LhBXGT
	50LrLGGVuwPORUK0dZdRY6jfD4VnoYCYmINadppMCgfS54mQyfsV3nn4DDYL2Ow0VkFG
	xeSb3w+xB8o2/of9/rPSLMOhUQvAR4W+szPzeWvW0XYpBa/bYJCbjHHEB4rsqgmKaWRx
	HAqc+SsEIe5EeFex1fupiKHgDO+fT9Cj3HzUneSi0ZJOYf6SMk8hTUL8U8zf6tNDs5iJ
	Qmi6591MdQKb4+tY4vhbS+1HFqkMUfKFYBVfISd5CRzLDPI4STGnb2pZrhllTm911UDo
	iqVQ==
X-Gm-Message-State: APjAAAUvs/oD+1Ufv70Sf6Hxs1g5LiEn37K3r/uJuKPHFk+owDfXlOkP
	OWJIyEVSHixZtOyCxuxqPt4THA5w3YF6QqWmkt346GWm
X-Google-Smtp-Source: APXvYqyayJdS+f9ldyxIkRuPNJRPhJduoyugrmixVrLXBkSQg+HDuIciDkU0JjJV/TVJT1tgepCgypWp2qwaMnEKfwM=
X-Received: by 2002:ac8:26dc:: with SMTP id 28mr15099098qtp.88.1559060068950; 
	Tue, 28 May 2019 09:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190522131345.10392-1-andrei@gherzan.ro>
	<CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
	<119819b9-eee8-442e-f4bd-b4005b0a1a6d@gherzan.ro>
In-Reply-To: <119819b9-eee8-442e-f4bd-b4005b0a1a6d@gherzan.ro>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 May 2019 09:14:17 -0700
Message-ID: <CAMKF1srx8acL-pQu6HWt3KutcvTNu=X-Fweos2XZ6vO-mLyK7Q@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Tue, 28 May 2019 16:14:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 8:37 AM Andrei Gherzan <andrei@gherzan.ro> wrote:

> On 28/05/2019 16.13, Khem Raj wrote:
> > Hi Andrei
> >
> > The musl patches need to be forward ported as well. They dont apply
> > cleanly anymore on top of this update.
>
> Seems like. So all the contributions now need to go through local musl
> and glibc testing? This sounds a little bit of an overhead and might
> discourage people in contributing because usually everyone is working on
> one libc variant. Just raising it as a concern. As per this specific
> case, I'm going to fix it and push a V2.


I understand that and in some cases it=E2=80=99s even narrower where one mi=
ght just
be working on one distribution alone for single architecture for that case
failure on architectures they don=E2=80=99t care is
also a nuisance

It=E2=80=99s wide and far testing we can achieve is good for end user same =
goes for
multiple architectures if someone tests a given architecture and reports
build  failures then it=E2=80=99s good to acknowledge that imo

It=E2=80=99s not a blocker I expect someone interested in a given regressio=
n of
this kind to chime and help if possible so don=E2=80=99t see it as an imped=
iment

If we remain cognizant of the fact that upstream might have wider usecases
we will generally be better off cumulatively


>
> --
> Andrei Gherzan
> gpg: rsa4096/D4D94F67AD0E9640 | t: @agherzan
>
>

