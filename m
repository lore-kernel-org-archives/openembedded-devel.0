Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 295647F302
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:38:56 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id d25so1930728iob.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RQF9NrU6kMEd4RF67FqwJmBDfwEaffIC6U9QU1qhEBw=;
	b=Q8etLXqVoHLwA7qGa/qoXJEiL/dnPrPPNAJQUnYR11490o9Sv41JnGi/1632IxfKuc
	sydZ0nmLWsa5+NB2OSoqcg+p2N2/SoFglbaPKGwo1di3T3ic20ON7oyzbRRdkoUE0sS2
	rztZLK9s0n5fybEbXHMk4/lUIwSLrBzCFPi7RNqYWJ8sEDFNJqw+SFNFMb/HLCiX/+wu
	8NhArTArU02hERnYorDR1He2nZ2It/gIy9umkVZCImtgNEh4UrJf7ih3PL1akGWfntvx
	1FezR1ysLnv7jiJkZ3x26tPANiiD6DTL1T+wX3yN63Q/nKSiYdX+BrA+cFt6fTQgtpz8
	FBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RQF9NrU6kMEd4RF67FqwJmBDfwEaffIC6U9QU1qhEBw=;
	b=AMXO6ANx+GKJ9hIjLUVsRcA64nl1Mn9UiuqNEcoYVVnl7IPwCAk+muc4Otl0TjACH0
	d1Ic8nkJXOtNbpTQFh30QKuPpAFEZRzDRPYzLA9D444kt1YJcZZ+suMMLgmjSWGsgRbU
	a784gosojAyEkStPCv/6kXMNmraxgmRpT5k4XZ7L1kLVT0b4uAnaTGASJll37hHT3bRC
	5rOMvrENOkk0h1yNbGMGVz465tBELyuou8gKCgABHWtW7vM0pcmvjKQ+/X+Ac/OkYcnN
	jGe5IwwbXNMQi/EWbVDH+5KRCLSr69dZCaKSlpP0mUxo0Hr4WFtHNhvv4wzOwRmg1Vol
	AnEQ==
X-Gm-Message-State: APjAAAVx6V3lEyu/NgZ2RUtr36GYfn04I3YIjx1j0ipu+1KC5njTRcni
	f0P05A28pVEUrz4NOEnQtXQTvm6MiTuWYqVOWso=
X-Google-Smtp-Source: APXvYqwgzj7WX+v4Qs+Z+TSouWRWZQdQctdO8d2MZmBvd9M5vJrj3m10Pvld9hfpr7op59Glsi/2g4pQcLJCIBSEPGI=
X-Received: by 2002:a05:6638:627:: with SMTP id
	h7mr8718201jar.33.1567057137138; 
	Wed, 28 Aug 2019 22:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190829052324.11614-1-raj.khem@gmail.com>
In-Reply-To: <20190829052324.11614-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 29 Aug 2019 07:38:45 +0200
Message-ID: <CALbNGRQyPF6XXYoPwQhXUH0YUMC-PyxuY8ZbQgyqPcHC=3wbYg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] ncmpc: Update to 0.34
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
X-List-Received-Date: Thu, 29 Aug 2019 05:38:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 7:23 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Needed to work with boost 1.70+
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-multimedia/musicpd/{ncmpc_0.33.bb =3D> ncmpc_0.34.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.33.bb =3D> nc=
mpc_0.34.bb} (96%)
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb
> similarity index 96%
> rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
> rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb
> index d4ebe1769a..0c99c7c698 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb
> @@ -33,5 +33,5 @@ PACKAGECONFIG[chat_screen] =3D "-Dchat_screen=3Dtrue,-D=
chat_screen=3Dfalse"
>  SRC_URI =3D " \
>      git://github.com/MusicPlayerDaemon/ncmpc \
>  "
> -SRCREV =3D "8e98f89ff07b140e6357dab2a9a9f6432ae0e521"
> +SRCREV =3D "79cf9905355f25bc5cc6d5a05d2846d75342f554"
>  S =3D "${WORKDIR}/git"
> --
> 2.23.0
>
FWIW: Am still on boost 1.69 and build tested this without issues.
Wonder which further fallout boost update will cause this time...

Andreas

