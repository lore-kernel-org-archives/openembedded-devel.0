Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D01B6D4F3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2018 21:37:14 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id l200so6066278ywe.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2018 13:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hJRUokLTQ1S+rCXvtUfepVY5axRjupvS3q1DHFl9HfI=;
	b=UYMxiuWebkJOPAtiVbjnrKjw826yOsZpmDbw6x8a+Ps2FN4li8Z0t3Y92ADphQw5dE
	PxhkRv2+zUtyuNZ/lWHDhq/CSGOCQwbOIQ0zPJPC62X2L7Ooqxdr0R6AwvgIVkngfG2p
	RvkDw2Svel5gliSoIt9/N8ge+gmDWKK5YF2Tks+AKguDh2nlXOHFQor6kfxtEQApmXs6
	YpC7eKzKHyKTSUWym1WTEtcIAgYEKehOnFxyycgPog7D5Qg36GTq+pu5kEA4kXVzgJyh
	Svy4hrMgr33fDy700a9xrevDb6BConUOa1BJSAWCplt+Bldew4tu06QDltdrdLKgbtXm
	PE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hJRUokLTQ1S+rCXvtUfepVY5axRjupvS3q1DHFl9HfI=;
	b=hxeMLfvXTvrQXYUkY8FEGGukS8MWCS2AMgJXXDaCdTsbEFLhYv4LDHuSAIKWu7uNbt
	Bw2n/B53GE8pCHdeo36LC4ZZw4lSUWaRkFfT1y1bT0UM9pqkqJyWTKKZj4Z0JWCaRrNl
	aMZD+nt+04pRsB79AI+oaTmnl2HiOo0zdBHif5nOwpjvcmxp3Ti/ySXa/xeUiPanQXCg
	fxLUWyBZ5cwzkEaXFMYLKUfiO0dww04iw9eJKdmgVglDNs1f6wOrgDpdVLC3NhXRVP25
	ocqYYKL6SopUpl1467CRuTz1/S+r+gJn1OozgFTeFKaRGtvuJFFzEunSUOirkYglmafP
	dAnQ==
X-Gm-Message-State: AGRZ1gJJU4o/gGcVJgXfSW4j/qNE85as7D6xsyjBGffX9vY5hbLOwdkT
	XV7l48TIMIEVuBotH34yxvnSS4cdRs72GwHCWQc=
X-Google-Smtp-Source: AJdET5eK910LUnLOcF/g6nRqe1t37qABwKjnkrPB6PEo1nXm+K8fyhSq8x27MJ/ZMXwsqL52RJEH6eCvgOLHMxsHeKU=
X-Received: by 2002:a81:294f:: with SMTP id p76mr22448095ywp.401.1543095435869;
	Sat, 24 Nov 2018 13:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
	<CAMRc=MdVJYYBcB0NkQpE2O3qQ=c+mnj6+ktsxRMdjBpPALOgZw@mail.gmail.com>
In-Reply-To: <CAMRc=MdVJYYBcB0NkQpE2O3qQ=c+mnj6+ktsxRMdjBpPALOgZw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 24 Nov 2018 22:37:03 +0100
Message-ID: <CALbNGRRqeSVDzM8tn36t01YiAS0DJE_ExSXNRupp6esOEF7oKA@mail.gmail.com>
To: brgl@bgdev.pl
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/6] sigrok: set of new packages
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
X-List-Received-Date: Sat, 24 Nov 2018 21:37:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 24, 2018 at 9:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> pt., 23 lis 2018 o 22:00 Andreas M=C3=BCller <schnitzeltony@gmail.com> na=
pisa=C5=82(a):
> >
> > On Fri, Nov 23, 2018 at 4:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > >
> > > This series adds recipes for libsigrok and accompanying libraries and
> > > tools. The eventual goal is to add pulseview - the graphical interfac=
e
> > > for sigrok - to meta-qt5-extra.
> > I had started this at meta-qt5-extra but... Did you prepare already
> > something for sigrok? If yes: Would be happy to receive your patches -
> > if no I can try the recipe already started together with the recipes
> > you sent here.
> >
> > Andreas
>
> I'm not sure I understood you - do you mean if I prepared something
> for pulseview for meta-qt5-extra or if I want to put libsigrok
> packages in meta-qt5-extra? For the latter: I think that the right
> place for those packages in meta-openembedded and only pulseview
> should go into meta-qt5-extra. For the former: I'll be creating the
> recipe for pulseview on Monday probably.
>
> Bart
I meant first option. Like your suggestion you prepare and I wait - no
need to get my unfinished work polished.

Andreas

