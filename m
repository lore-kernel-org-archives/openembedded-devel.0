Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC1371E16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 09:44:21 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id s27so31620771wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 01:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hR/5XpRuXHsNhqdUfrL5ULg0lPZ+bRbMQQGIDsGSX5Y=;
	b=FTtAW6aS6qST6F6RdlPQJm8SVLHRX1HARPGFWujYNXPgVpQwV93m/zdoe3yL7YNFil
	s9a8MeQLdhaNVr/K8gxwTENkmKtXl5lI4JIS7BmFwmU5+EM1cSMBa/95IX7nFzVAT1bL
	awr1tWCE803QD8Sniq0XHplmTy6dh6rrYjAAhJJ20rHVeiVpMoDHF1/3EMRYh4KJob07
	07vhH+i0Q6WkeN40D2bvxAlUcky+dL1fnZsb9oqHUxxaj+sVmpOb+MiAl/zWF4WFgXAJ
	q6sI+D0OziWH+UYgynJ6bb66Ii/fR+GDNunIVTaWfHSmDfsjbhxgk0uysc3sfcBZt/9+
	NN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hR/5XpRuXHsNhqdUfrL5ULg0lPZ+bRbMQQGIDsGSX5Y=;
	b=QfSU7BUxZHOcu2UN5YE/NkPsOwC0tXTaRmTTPl1URe58EHbFVXJ8I7ua1HgHfKfDAP
	qRLViPRerPR66wTPiYfgLERYvIcgm/k4GXY7llKxRbt2yRLWpoI8cEXrBF9A2D0VLB4G
	a8X8Y4EQG6+/vEsWrc8HmzusMghSdw6mO8gZDgYnPeP01UyfC70gDl8yjFCRBRDXf/0L
	Ujhr29LLMW0BNNHMEO1DDQChzIBpU6N6bsrKPTB2SXwz8S6jfgbYFhP1VrymVsQLowAk
	Rn9ICIv77jSMphybXGPpoUFLJwP2O7RxSZrLOCetOpz3XK8WFSIYVujDtl5PRls8Rn1J
	uOnw==
X-Gm-Message-State: AMke39noKI8Rev2STCX0O6dQS/0O6Y9T8uF/x/YFx5tx/H7ZNSvdJBVk3hToC1I/dCmT4yLeCLY4J56N8mmt/A==
X-Received: by 10.223.153.55 with SMTP id x52mr16738176wrb.196.1487670263122; 
	Tue, 21 Feb 2017 01:44:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.212.30 with HTTP; Tue, 21 Feb 2017 01:44:22 -0800 (PST)
In-Reply-To: <CALbNGRQN5vrCT8C-aRV3NQUBiZ6O80fA_SyznjfMUy5rmmx8Kw@mail.gmail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
	<20170220180700.29836-9-schnitzeltony@googlemail.com>
	<CALbNGRSktvJjZj42x1uX+YjYC=E9ZjmnBVeoSjKa1p1j1Q9h1Q@mail.gmail.com>
	<CALbNGRQN5vrCT8C-aRV3NQUBiZ6O80fA_SyznjfMUy5rmmx8Kw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Feb 2017 10:44:22 +0100
Message-ID: <CA+chaQd4gHT+8BZ8ncPcZfApw-kVd5gPBd_SCrn_ohcBc3CqyA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 08/44] mpd: rework DEPENDS and unblacklist
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
X-List-Received-Date: Tue, 21 Feb 2017 09:44:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The V1 for mpd fails in do_compile:
http://errors.yoctoproject.org/Errors/Details/133835/

will test it with V2.

I'll update the libqmi and geany with extra dependencies before triggering
new builds so you don't need to resend them.

On Tue, Feb 21, 2017 at 9:42 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Mon, Feb 20, 2017 at 11:24 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > On Mon, Feb 20, 2017 at 7:06 PM, Andreas M=C3=BCller
> > <schnitzeltony@googlemail.com> wrote:
> >> To be honest: Have no idea why it failed detecting icu-i18n
> >>
> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ...
> >> +inherit autotools useradd systemd
> > ^ I bet it still fails. Guess pkgconfig is missing here...
> >
> I have rebased rss-fixes-andmore branch and send V2 for both mpd patches
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

