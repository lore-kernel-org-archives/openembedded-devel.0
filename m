Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7337C731E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 09:31:17 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u188so218038184wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 01:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hyyKGhSYPBkLN2zdCBzQ55nOFu2q3LAbvRDp0plcthE=;
	b=SU807dChNnfHa2y9zggUd0DIF75aIR9GujDrXImb31gEHCZfKdmzg2sWUAwSbYsYXt
	qZzMGRUVIOAJJemRIl6LcdkZmaZUjvI356qtm+ADRfcvESbwAaFm+8jQiY8dYlE3np17
	F55kjnuEn/0ZHmA1F1YcULnkEBWqgCJbMIVPrBzkEgY5LgW71inJfS+BE7VGoqFyEFAq
	QQdcKxVoDZOOrz4eg8S/YkMCnOIRcwlZdPzbagrh0ow6H/3x4JVbY2EmoiPjwq7nG2vZ
	39yxmFyex0aWNoQ8dvp3BnQ3tbMqyRgmiDoCasKXSNf7n1FvSOvxJVdHMwp/wKYkbKFu
	eTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=hyyKGhSYPBkLN2zdCBzQ55nOFu2q3LAbvRDp0plcthE=;
	b=EXDZk4wFHUY/queo2bfDiBQcrWfDIOHTVrChj1b651E6LbgZLZOu9R2GWazXfVwdKu
	gSp11iHksIpoCl2Kv0S3d0+FobFaoHmEvkSuh+tBodDhvU9/jMxOqemz/kMd0QnDQLtD
	3sxeRu8BQbbIz7mtP9NQaqNDBjqJTFRCNK+SFSM1deNzhsLCWQiUcVondfEyUt+HN4mK
	+LwtBxM1KXq4LLWrDkIhkRO8QkGTEJBphwVoXjmcQNaFlb3JK9TB1gHU41niDjKhSQLH
	uyTxpg2qCul/WM1cn9RcRZiOoB98i0H10D3reAn9K30jyd2kwbJTCvC40oNSONM0ja45
	zPxg==
X-Gm-Message-State: AG10YOTVoGmed7A9lg1HVdCc3buDit+1HpAdhm3UVONLkJ8iT6ZqW5fMgR762O5KY/NtRIfINVYBSJbSzMrrkQ==
MIME-Version: 1.0
X-Received: by 10.28.97.11 with SMTP id v11mr9585632wmb.42.1453368677268; Thu,
	21 Jan 2016 01:31:17 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Thu, 21 Jan 2016 01:31:17 -0800 (PST)
In-Reply-To: <CAP0W-R=4t0Ah2ucP5gShOD8SRaO2Jk9tdJ6N7yF+8rv4K34p0g@mail.gmail.com>
References: <1452496246-18628-1-git-send-email-koen.kooi@linaro.org>
	<CALbNGRQ7isqSbA=gRPYCFJBH7c8z0hmK+79e5ZmQ6zj0Q2Azhg@mail.gmail.com>
	<CAP0W-R=5hbP28cT+phygoRcQ9qr5NUYdX=fRZBVaDPf0b-Hsxw@mail.gmail.com>
	<CAP0W-R=4t0Ah2ucP5gShOD8SRaO2Jk9tdJ6N7yF+8rv4K34p0g@mail.gmail.com>
Date: Thu, 21 Jan 2016 10:31:17 +0100
Message-ID: <CA+chaQc1diTb_YNP7MziMGdHmVm08DtK0JWMg6PyBv=TsiY9eg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] various: delete qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Thu, 21 Jan 2016 09:31:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

http://git.openembedded.org/meta-openembedded/commit/?id=3D2bd11da4b50f401c=
9c49975aeedaaafa6a59d08b
was merged week ago

On Thu, Jan 21, 2016 at 8:26 AM, Koen Kooi <koen.kooi@linaro.org> wrote:

> ping! Can one of the two patches to unbreak parsing go in before the
> weekend?
>
> On 11 January 2016 at 09:51, Koen Kooi <koen.kooi@linaro.org> wrote:
> > On 11 January 2016 at 09:08, Andreas M=C3=BCller
> > <schnitzeltony@googlemail.com> wrote:
> >> On Mon, Jan 11, 2016 at 8:10 AM, Koen Kooi <koen.kooi@linaro.org>
> wrote:
> >>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >>> ---
> >> double efforts? [1]
> >
> > Looks like it, but [1] doesn't show up in
> > http://patchwork.openembedded.org/project/oe/list/ :(
> >
> >>
> >> [1]
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-January/1=
05406.html
> >>
> >> Andreas
> >
> >
> >
> > --
> > Koen Kooi
> >
> > Builds and Baselines | Release Manager
> > Linaro.org | Open source software for ARM SoCs
>
>
>
> --
> Koen Kooi
>
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs
>

