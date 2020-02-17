Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0F06004E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 07:53:36 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c16so17419237ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 23:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QfTL/WxofpDNz7vP8My/2gWvb0UvI+bDHymy+BQaXUI=;
	b=MsvmuhDkq0t/KO3ES16pphKt+7rmj6ZrIdwgdtU9uFqQ5YzCKqMs1i04inCCGxJVzK
	DSaoMmtODa8/RZkpfN8hwD4Eb6DlZC+YK5J04GmSeyqThZxNO4SwsF90lQf6fm5vqeEZ
	eXXKZLWVLsDiGJwYj2WXX+351mnhnR/6loGWWi1Jek+Bg7Z7Efv3nOFkaZkKlb3pkNEU
	rD5Zl+zKQHKMqAM0bJ98Ps4ejoj40QEZi0f7IsGkhHk/+3oGZYg2ciMTZY3zKPgJNxZE
	jj3G+zMuDLyfLbjVUHPyiglyWtEMwquZLde52BXAJgm5Me8ceDq0geoUPBMrW3Gn4X8A
	bBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QfTL/WxofpDNz7vP8My/2gWvb0UvI+bDHymy+BQaXUI=;
	b=Uf9VvTK3pLGeJkYYm0mWx8nVS8Nqyg1dOZ8TKvT3vlOzqEygnQc/Sx1tPDm1B29+NI
	vHVNl2Psg20ONVffs3cPc1ISrJPLWW94SaZW4MIVTnJGee3MJ3TiNPm7cYhE5hDmv3aj
	UgphAGpLfj7IO8Gk6feWTAyeKGnp76DByvEcHu5sODxOmtQEM32otbUmvUazW59IWySn
	TUGrUt5gmgM3qaK8TxG2aTqWc2FzU2yNQaqr2yBAyn/wwxOR3NzQ0iz9a2T8yizyJy7t
	69ghbFN856NPLXt7gkQzLQTjAWp6asB/wJsiAvFdR9oUxEMTq41WzXxUji4Riwm5Wqw7
	VTxQ==
X-Gm-Message-State: APjAAAUaxDHfyWF8hxLteYbIeI8sOFp2/XSixeIZuVaI8/cKLepJ7u1c
	ucaijuODr+TCW4Il7+MOxHjJJsT85f3u7UHmdYw=
X-Google-Smtp-Source: APXvYqz6EtxX759N6NMSskkXHBdT7uecNbCe6nB+n0Q25KSkOQqNExxM0Hm3nP3TI0JvaEw0HWkTzWanoyshjJ359QM=
X-Received: by 2002:a6b:7846:: with SMTP id h6mr11692636iop.224.1581926017122; 
	Sun, 16 Feb 2020 23:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20200217024304.1131392-1-raj.khem@gmail.com>
	<20200217024304.1131392-7-raj.khem@gmail.com>
	<CALbNGRSzRB6zjQO0NBTU5D85+t-BEQuYL27CmHJFJtzGt_sGsg@mail.gmail.com>
	<CAMKF1srBT++6xgJ89JF27T4XFAzdoE3OG2==5BYBX2EnBneaAw@mail.gmail.com>
In-Reply-To: <CAMKF1srBT++6xgJ89JF27T4XFAzdoE3OG2==5BYBX2EnBneaAw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 17 Feb 2020 08:53:26 +0100
Message-ID: <CALbNGRSfyQdeOnUNDDsCEO_y84sW=dkrbdmabZmUxmteyHVaFA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 7/7] gimp: Depend on libexecinfo for musl
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
X-List-Received-Date: Mon, 17 Feb 2020 07:53:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 8:47 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Feb 16, 2020 at 9:55 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Mon, Feb 17, 2020 at 3:43 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > musl does not have internal backtrace implementation like glibc
> > > but we can use external library
> >
> > Sound reasonable and does not affect non musl.
> >
> > BTW: Old email address still works but the email address changed form
> > 'googlemail' to 'gmail'.
>
> Thanks for info.
> perhaps update them in README of layers in meta-openembedded as well.
Ahh sure that's where you got it from :)

Will prepare a patch for that

Andreas

