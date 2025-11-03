Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7960CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 21:06:47 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2468.1762204004778546846
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 13:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NslEUjoK;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-781421f5be6so51865387b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 13:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762204004; x=1762808804; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBCGXT8WHNCvFxh8Lsf41pKUsJ7fAJIhHVCrRJEdF08=;
        b=NslEUjoKwB/tSLc57frO31uSx1Q7Iu253wLOY6CT1dQC/y7Ak15hDrRDOp3oNQf0gU
         cOcrgD3Lvzk7hMdpgY2u+H0gMM4HbB76wAUNJ9gv5KNDf5cxFyimrn57/mas3DRIj1ZG
         78hGx3WDamOO3Rcwzus8NkFjxGNKL0Ak4SikHSFFmhy4dLCj6HDD3wqOxiReAMDSFSzN
         WFxrFPyBBj3DE+Ob4tbWML3TaLJ03kuVlV9oTPJ7qyD6cRTa0iUD/zYGL6HkcBxqtMzg
         s4AdvLPaSrQ30EyGzMCsqPsJqo4+FSMXsUooZAO3x20t9kAd0nF09QUKS15nupmFUhT3
         33bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762204004; x=1762808804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBCGXT8WHNCvFxh8Lsf41pKUsJ7fAJIhHVCrRJEdF08=;
        b=qam7jok5b5fQ+TsWbQJArplDYCizgdVFR+gnnSNDT3xrx43ZCkHMGPBUHN/NpDrei1
         zynJ6Oc2Xuc6tUgkCvqH+6yfh6GUz+D3lzWpQf4dApSrdBYOVVFtseT8/0nJFUdPveU6
         W7RV/W2McR7YIELXWbZ5cWiDR2oqhADZw4Df9eS0A1zChiixysdT6eMGgX4PRZPLIm9+
         YVCgcg3pb7xVl+rad1Uogek6KoE3kzAOwEGJDsPV4EsGoyCoqL5vwHp6l2B0hceyT2rT
         sDH3hNvN0rSnC1GhGheTtjQffkjwUwl6ryhRMgfO/Fl7jpO4bMguTXycbSw2k7QqFt4l
         OW2A==
X-Gm-Message-State: AOJu0YyLUrY1Ed/93k790G5lfBHu0xOP4owpO71RJDf+Wg3KUsj+p5f7
	L+B/fgD9E754RVdu8rURi3Z+1vpV5rirWj7v4zl8WV/QCxeZ2q2zB6pYoB2n3q2sw59CLibpyU1
	QhsB8PbYfmgf0pNtxkhTsi6Ru2ZB5I22PzdTF
X-Gm-Gg: ASbGncvbKhdVl55AaTwV/2Y3EzrokNUWSJ2NcSyOzDqBtZbMCplX2HYT8dmFJwikFHi
	EG2t+bM5CCv5B2Qxy4eGSuSYpR9FLi/Hag1dfWLfvj+Hr2MzJbayuBu5qt+4OrDBFGD7aBd/Ldy
	OqscQzuIUD0E9mzluX3c2mmZvKCAQ/+7wAfnbezYE6Lb3ib6YywrplJCa6HR4zN2qEGx2Nrd5XV
	nGTcfRUR6SJdscWXVM90L0RxMH6k67x0GCLhzcMWBpiAcikg1DJORW0PoESxNjWtIxtpoDxIt+f
	PX3O/v+FTil43nUK/t6G8yB0JsPhhwrH1QbrluR9C6EdaDhP+YHr4tnkoACrZEGzekCZ/YBP0MJ
	3c4eOCpi7CcBWkrGi7GoD
X-Google-Smtp-Source: AGHT+IGT0VCXODkb61lVyV9rSk0jfKjH2Fcem8uwwPy2G9oMIhddtx4D/Pdzy9WEdZ6A/UY2CYoYw35b/xLotSSATPY=
X-Received: by 2002:a05:690c:18:b0:784:9deb:fd7 with SMTP id
 00721157ae682-78648403687mr119064257b3.23.1762204003797; Mon, 03 Nov 2025
 13:06:43 -0800 (PST)
MIME-Version: 1.0
References: <20251103200433.1766280-1-jan.vermaete@gmail.com>
In-Reply-To: <20251103200433.1766280-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Nov 2025 13:06:16 -0800
X-Gm-Features: AWmQ_bn8UkGRH1uRDIUS4lQ1iKup-5jo2AtZoLJcXrLDcpXD4-LbomtNVYZuBHs
Message-ID: <CAMKF1srn9eqk1M99yhH0x=VQax3eHRzUPj==tqUPaiF-nu-1Yw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-rich-toolkit: add new recipe
 (version 0.15.1)
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 21:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121284

Does it have tests ? the please enable them via ptests

On Mon, Nov 3, 2025 at 12:04=E2=80=AFPM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../python/python3-rich-toolkit_0.15.1.bb        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-rich-tool=
kit_0.15.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.1=
5.1.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb
> new file mode 100644
> index 0000000000..d63850b3ba
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Rich toolkit for building command-line applications"
> +HOMEPAGE =3D "https://github.com/patrick91/rich-toolkit"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://pyproject.toml;md5=3D29c91c89ee62891477a147=
6375143bef;beginline=3D6;endline=3D6"
> +
> +SRC_URI[sha256sum] =3D "6f9630eb29f3843d19d48c3bd5706a086d36d62016687f9d=
0efa027ddc2dd08a"
> +
> +inherit pypi python_hatchling
> +
> +PYPI_PACKAGE =3D "rich_toolkit"
> +
> +RDEPENDS:${PN} =3D "\
> +    python3-click \
> +    python3-rich \
> +    python3-typing-extensions \
> +"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121282): https://lists.openembedded.org/g/openembedde=
d-devel/message/121282
> Mute This Topic: https://lists.openembedded.org/mt/116105107/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

