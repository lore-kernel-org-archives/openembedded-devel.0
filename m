Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3E67C6E98D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 22:42:23 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id c10so18701403igq.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 14:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uO5xDLh8x+frer0GOvI3bsjeQw66zEBRBasxa13z64g=;
	b=Z/McJhlDlA6EKveGJgPBEMAhmx9nbwAIdJ9odCxk+aDQjxz87qqeQq2wRT9tPZszue
	EvUXvCiCo6IZD/Uv9hF3hSDZeiocZ+lNeRrD5A1kRzWtChGA9Ss+CnEGt2hi0JTQ5jlG
	228MwCzPXZTWG17nWNe7v4Gs79gsC5rKmbl90OEekBLjCEvcRtyx2vdPNIA3bG1b4wCM
	bCG97+4lJOGDNC70Rex9iNd3Zx/ampMVh6P/pB7BYmAf2Xzjm44AN9D1ZtNbQCPPJcIw
	UDPGlFNa9qNUqSSWL6ktxCOazay0KLwNJLfB9QR5BL/RlhlIh2vQ7+krcNXKAmFqSYfo
	46Tg==
MIME-Version: 1.0
X-Received: by 10.43.138.143 with SMTP id is15mr12754578icc.23.1391121744188; 
	Thu, 30 Jan 2014 14:42:24 -0800 (PST)
Received: by 10.50.8.137 with HTTP; Thu, 30 Jan 2014 14:42:24 -0800 (PST)
In-Reply-To: <CAP71WjxE3bO7f1N9hJtY0JvLnE555z+N+jZ3mrZSWB-k6xSpCw@mail.gmail.com>
References: <1391086167-31517-1-git-send-email-chase.maupin@ti.com>
	<CAMKF1spT1epjxfM1Nyi86wFCk23BAZ26zun-Ju94JkcYiXwE7A@mail.gmail.com>
	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EC@BLRINMSMBX01.bglrodc.lntinfotech.com>
	<1761269.AxNLyBI4PD@leo>
	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8ED@BLRINMSMBX01.bglrodc.lntinfotech.com>
	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EF@BLRINMSMBX01.bglrodc.lntinfotech.com>
	<CAP71WjxE3bO7f1N9hJtY0JvLnE555z+N+jZ3mrZSWB-k6xSpCw@mail.gmail.com>
Date: Thu, 30 Jan 2014 14:42:24 -0800
Message-ID: <CAMKF1spqUrAup9fQm2JXQMLO1PkRfM3nE44HK7+UkWvsM20CLg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ridish RA <Ridish.RA@lntinfotech.com>,
	KalyanKumar Nagabhirava <KalyanKumar.Nagabhirava@lntinfotech.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: Errors when using populate_sdk - has anyone encountered this before?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2014 22:42:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thursday, January 30, 2014, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> hi,
>
> On Thu, Jan 30, 2014 at 10:52 AM, Ridish RA <Ridish.RA@lntinfotech.com<javascript:;>>
> wrote:
> > I think I got the root cause of the issue, meta-linaro that we have
> depends on openembedded-core dylan-qt5.1, but Nicolas recently updated
> > openembedded-core to dora. And I think this is the root cause of the
> issue of the relocatable patch being not able to apply?
> >
> > So do we have meta-linaro layer based openembedded-core dora?
> >
>
> yes, the problem is a misalignment between oe-core and meta-linaro.
> meta-linaro is using a recent qemu upstream commit, and the list of
> patches from oe-core no longer works with meta-linaro qemu_git recipe.
> the 2 commits in upstream qemu responsible for the misalignment are:
>
> 53db78543e473bdf7650a406767d0901c6e26480
> 964c6fa16f50a607f9da5068d6bf15ccc93872c0


i would still consider that oe-core qemus are well pounded and for all
architectures it is a better choice in this case where you are targetting
x86 and not bleeding edge arm

>
> I am cc'ing riku and koen since that needs fixing in meta-linaro
> (nativesdk-qemu does not build).
>
> for now, it's safe to follow Khem's suggestion and use the OE-core qemu.
>

