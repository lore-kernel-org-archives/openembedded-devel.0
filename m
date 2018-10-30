Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 167A079BD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 21:07:25 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id b22-v6so15278982qtr.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 14:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=If3sXhCG/WXhfcGYDEWhKe7Qf4fema3TcTCXtKHXW+s=;
	b=sHUKW5+Pjt2JrSEXpmIaidr6QWoD/+/BvpR7HfTyLeEKXstODQLqyu2fLYqaWxB7yv
	6pkYad2OzMLHCb17l7szBY/TfFuDycF67rqhSIouMV3OH59zKVlyjoWX//qQz52SPZwz
	yIl2NeV3mY525Gn3M1V5zpuONRaVYKpsQKS6jyE5zClCnAhS1hMzC3EvQYHSma+mu9Ff
	hHe3sVHK8oi8uh3243mZHoERJSy+SgRwEQnqtR4A2Lnlo+PubTZX5sVgNTfMmLtm200A
	XGxx9Su1SZCAH5EyNyA4aoJPaI0ZdT6brswT4e5zPlJSntPiqXkJD8NHhdqq4XMqS4Qi
	8TqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=If3sXhCG/WXhfcGYDEWhKe7Qf4fema3TcTCXtKHXW+s=;
	b=l1301XRS9qCFVtpngl3Ay8btCpkW1RxsPwm2mVjTBSZx/ipCDqAACeb+IGkZ9d6UEc
	N9fg7FA619/YKRc1x7qaxdUEKmxJCf5yYIAildxUZ6Az9MN/w4vitHzdNH4RZtC1LJ6U
	Fdx4Ovo8HtORwAdh4NWDsnSO1+8f7e9TXEErFgqn+zwFeP9sR4iYWaZfBwzkVQBHLT1S
	CGRAXVZ298rAh05HEj5W3MiPtOuqQLQZ/CmSG5TA7wRhpYoZSqz7fsLf1LKvRfGzoqro
	2LQbf3XVmsYb4JyBUJ5VITEJDm/D9sxPNq7hXDBQX/0mxvwR6UBS9+PPOO6AcgO+tjlQ
	IKuw==
X-Gm-Message-State: AGRZ1gI9+6DTydFfzpPQrtP+pBSSyo5NJ0rzx6d9rAtK5NgU6R3MOShX
	Q8UtmX3z5F/LazcQyh/UVlLfcwDBLVBRamu7JB05CQ==
X-Google-Smtp-Source: AJdET5cgdDW5AWLC+etuQVPTUMaGFHlhOOhO/yp1btrIZljFLBqTkpwx4HqXEHcqh9OKS3UgeNbYpouoyeFKjJN0DvQ=
X-Received: by 2002:aed:3e94:: with SMTP id
	n20-v6mr339964qtf.196.1540933646798; 
	Tue, 30 Oct 2018 14:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
	<CAJTo0LbH3UCYYHCp6E1gA33fjk2xSr+ZkZjZmn-MDvabT7_EfQ@mail.gmail.com>
	<CAKPa3c2XXz1JNFzu-voxa-O029gh-7eSf1hWAD4U=BAjMfLx9w@mail.gmail.com>
In-Reply-To: <CAKPa3c2XXz1JNFzu-voxa-O029gh-7eSf1hWAD4U=BAjMfLx9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Oct 2018 15:07:00 -0600
Message-ID: <CAMKF1sq6snZg1PyA8n667saiX2qNFD55vOtz3f8_9+MFJAsknw@mail.gmail.com>
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 05/16] lcms2: add recipe for Little Color Management System
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
X-List-Received-Date: Tue, 30 Oct 2018 21:07:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 30, 2018 at 9:04 AM Brendan Kerrigan <brendank310@gmail.com> wrote:
>
> Sounds good, I hadn't seen that. Should the existing lcms recipe be renamed
> to lcms2? Most distros seem to package it as such and it'd also simplify
> the recipe a bit (the PN would align with the tarball and source directory
> name).
>

as long as we maintain upgrade path for binary feeds I would think its ok.

> On Tue, Oct 30, 2018 at 7:23 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> > On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:
> > > +inherit autotools pkgconfig distro_features_check
> >
> > distro_features_check isn't being used.
> >
> > But mainly, just update the existing recipe.
> >
> > Ross
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

