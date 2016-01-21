Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id BC1396FF23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 11:31:06 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r129so168100509wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 03:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LNTk89kBMnR+YP4NnkRPBGWlPr826TEYd7tvhufhqR8=;
	b=DOn5S5uGq2oen1ZDAC5Wh1ozh65bWFohkvHKwUuPhxLqYju4kk6MiKbCmLMquGs8wp
	ZP9Y6zqnB9DwpHxsdUs0N98jncV0J68B92K505Yn0ZDe5fqjbjpQTA0DzahS3fg6X5h/
	WymQM+YMdQUteIk748b9290I3tuleWdlgTXSlw48lx4APAcFanpLbwjbt2dvCEQehipe
	Ngl0VrWC5tlGsRiU42uEwtRJ8bIt5cQaBSr7iGjYbAXg0db6gqECQTBkM/KN7xAroNGJ
	NSvIYU6fDYfqcgacVRxRUHZey51k9T5lUZg6/ZC0QQZsKQ85aGpfWmR2IgselNDRB1Gm
	7E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=LNTk89kBMnR+YP4NnkRPBGWlPr826TEYd7tvhufhqR8=;
	b=VHdlc9YTp17CA0TPAvZGepBVxKF+TY3+K1Y/9p+wvmW+oR+Kussk4OuOgyEoB3Qhyc
	9n/23+A60Gb5t5A/4Kgtl0niheqXHCLyVEY+D43ie5BGYuzOZkS5bRqT8E7MrUztk4fD
	QfQBN8yqLclXRhC5JotraRUQqFhaC3BIJkgflu3oL+1rYsce9DYXU/lyfHdBjfk4JfVd
	B76+yxfs+F/cr8wMBu8c6lzU8c8mCEoecufLIz4KFKhBSJuaQ5lX7ZvjGk3pCM/th5el
	6y/7o794UFJVfJEaJbpWV9eM5Sbpl0bWuU76J2JhLn9fUfIBRddkXbx4Dau/OUTmnBlZ
	8EIA==
X-Gm-Message-State: AG10YORW0zTcz2zVkKN0q5zhGgKzEKe+uqgKVOdK7sh9psYrSgPQTL8FTaQS4ks63FgUsWWjAl+iJArzpRUAwg==
MIME-Version: 1.0
X-Received: by 10.28.139.205 with SMTP id n196mr10368629wmd.0.1453375866640;
	Thu, 21 Jan 2016 03:31:06 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Thu, 21 Jan 2016 03:31:06 -0800 (PST)
In-Reply-To: <CAP0W-Rnxg-MABr5-V03kP4Bezr39AyKeuKv=UZSLqtzvpoBm1A@mail.gmail.com>
References: <1452496246-18628-1-git-send-email-koen.kooi@linaro.org>
	<CALbNGRQ7isqSbA=gRPYCFJBH7c8z0hmK+79e5ZmQ6zj0Q2Azhg@mail.gmail.com>
	<CAP0W-R=5hbP28cT+phygoRcQ9qr5NUYdX=fRZBVaDPf0b-Hsxw@mail.gmail.com>
	<CAP0W-R=4t0Ah2ucP5gShOD8SRaO2Jk9tdJ6N7yF+8rv4K34p0g@mail.gmail.com>
	<CA+chaQc1diTb_YNP7MziMGdHmVm08DtK0JWMg6PyBv=TsiY9eg@mail.gmail.com>
	<CAP0W-Rnxg-MABr5-V03kP4Bezr39AyKeuKv=UZSLqtzvpoBm1A@mail.gmail.com>
Date: Thu, 21 Jan 2016 12:31:06 +0100
Message-ID: <CA+chaQeBLYGqRRLh+wdBdqLzptpeqt=CqLG4WPHsOw0BJowNOg@mail.gmail.com>
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
X-List-Received-Date: Thu, 21 Jan 2016 11:31:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Can you please sent rebased patch to remove the left-overs? Thanks.

On Thu, Jan 21, 2016 at 10:42 AM, Koen Kooi <koen.kooi@linaro.org> wrote:

> On 21 January 2016 at 10:31, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> http://git.openembedded.org/meta-openembedded/commit/?id=3D2bd11da4b50f40=
1c9c49975aeedaaafa6a59d08b
> > was merged week ago
>
> Ah, I see what happened:
>
> [koen@thinkpad meta-openembedded]$ git show -M | diffstat
>
>  qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket=
.h-as-inclu.patch
> |   41 -
>  qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
>                   |   40 -
>  qcanobserver/qcanobserver/candemo.xml
>                     |   40 -
>  qt-creator/qt-creator/fix.missing.cpuid.h.patch
>                     |  384 ----------
>  qt-creator/qt-creator/qbs_transformer_product.patch
>                     |   93 --
>  qtserialport/qtserialport.inc
>                     |   48 -
>  6 files changed, 646 deletions(-)
>
> My version was rebased and only drops leftovers. I only noticed that
> my patch was still there, I didn't look at the diffstat.
>
> All is good :)
>
> >
> > On Thu, Jan 21, 2016 at 8:26 AM, Koen Kooi <koen.kooi@linaro.org> wrote=
:
> >>
> >> ping! Can one of the two patches to unbreak parsing go in before the
> >> weekend?
> >>
> >> On 11 January 2016 at 09:51, Koen Kooi <koen.kooi@linaro.org> wrote:
> >> > On 11 January 2016 at 09:08, Andreas M=C3=BCller
> >> > <schnitzeltony@googlemail.com> wrote:
> >> >> On Mon, Jan 11, 2016 at 8:10 AM, Koen Kooi <koen.kooi@linaro.org>
> >> >> wrote:
> >> >>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >> >>> ---
> >> >> double efforts? [1]
> >> >
> >> > Looks like it, but [1] doesn't show up in
> >> > http://patchwork.openembedded.org/project/oe/list/ :(
> >> >
> >> >>
> >> >> [1]
> >> >>
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-January/1=
05406.html
> >> >>
> >> >> Andreas
> >> >
> >> >
> >> >
> >> > --
> >> > Koen Kooi
> >> >
> >> > Builds and Baselines | Release Manager
> >> > Linaro.org | Open source software for ARM SoCs
> >>
> >>
> >>
> >> --
> >> Koen Kooi
> >>
> >> Builds and Baselines | Release Manager
> >> Linaro.org | Open source software for ARM SoCs
> >
> >
>
>
>
> --
> Koen Kooi
>
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs
>

