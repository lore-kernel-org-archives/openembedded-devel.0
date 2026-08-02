Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FA0C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 08:15:02 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19956.1785658494652738265
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 01:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kjjUdTyp;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-44cedfaab6bso1046831fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 01:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785658494; cv=none;
        d=google.com; s=arc-20260327;
        b=NZRPfql961WELrDFdnzf5gKtCmHn5+B1TgV0GpHMFbtj60ioaXkfzLba4oj6gZMfv0
         ztx4nhRQAoO/ZFBHs1ncXYL13AEKclgfBWZ+VYWAcyNqgioMZ0x+KWQsKcgDLN8341Ug
         WzsBwkCM597Th0ZpLgfy0tlN6xGafNTWXiiIsSp9MslN7Ngvg102rP0KOKIBkJxACNNs
         Kt1C1hMui8ykS2JaqZwwfDez2t5ias0I6ooVNmlA0oaZ/DdN2nOBvuALATWjJjDuCBS8
         1EuNmnQhVO2aLB6zeVlMV3yMvVFh/gy0xXj6dy9A34BuSDQNcIsQ9GvBLIqbCPnoxaft
         +hSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=evjANq80LDoNrCtVi0JRcedDLpzbiQ74VX5MA+acowc=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=Du9IbXyk8fnSKsaqhLb+5bSV/ntt10XMr+WfvjWdBuIW0Be1XNI6kA2b1Xpnr9u061
         ZZgCDj9yGEVszZ85B/8JZ+iqmIsnxJy9dJsSyLJkvkC4n3TH7cBEfFxUTsj3tnIZNfl9
         SbU8i30X7aCtFIIEKoCyaIMLx5A0Ych8ERIxLu3Arf2T77dSHVBBjbto7Ynn4bnk3Hw7
         PKtrim4sgK74Yi6WNwhMHWEm831ZyO3lS3COAL89vExucztlRhNd9YlYkae7HUCPQwsc
         NfkpOyayHWKjzCcHntygfdBfbC7rOvFAXLaogJC+iKNkeQLB38kLxkHW8hJr//wlgrmJ
         ZFKA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785658494; x=1786263294; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=evjANq80LDoNrCtVi0JRcedDLpzbiQ74VX5MA+acowc=;
        b=kjjUdTypDiKF7iyZ2WtNNvbawFLIrjniMyq6xBxuFvPUXPXk2LmA9bHNTPTxwAg90n
         0L9EQsDN7n5ARJtPnnZktQe3+rB4VTCby79YLiXdGu0SRbOnDoLTHzxjg/BzKIaCJDza
         ngM1pJnDtcz5yCAitnctLrSTWaE+hAgBTZeLM+kUYmIuNaqSYhTdGRFXWJo9G9SfXcyZ
         thpVd+kwo8NJi20ql15gHq+VVA3pclFEnMKoKCd5JdFUaJx3+qEC2WJ4sNH4WpopGVK6
         J6CqJ1bkeEMdEQRgdjd8HWHzKfamlr7+IQeJ9/R8kAVMBEG6FTfhmge9q0fOcYevr6wT
         9AvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785658494; x=1786263294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evjANq80LDoNrCtVi0JRcedDLpzbiQ74VX5MA+acowc=;
        b=CuSvTZF8gEbHjLxG9Ca/VWv5ahqb2PffhY/M4mRJK1AptysnG8LdtvDw0lUNOYVXJP
         o2dLk2QoxjfiOM245xFu4/zs7Fpdn1/TSzn3sWMdqeV+CqhftC81A86C0ZAEISP9dDS5
         2HNEewNL4QpoWjbhp5BfM87FvqwWm9a8a9bdjEwix/ZeevZS3qh+lg0ufUIo3tOLPF9w
         s6FtNKpu5r5d6UZgF2moZhMMeMbLYEyeej1G/GWAsSFVn5ulhm6xm9i9GbFB3LjglvcK
         BBvNCNc4vrmBmo007+5AUQgoUx1gf3GHAqpA5ye4dTBPlfrFTgNneg8zuLvaWvVrpCrE
         tVoQ==
X-Gm-Message-State: AOJu0YywsI9Vi5WBS4xmFv1f7/np7Ves77eePI/eTOTAdoEfpb/cPKcF
	tZJxoMHGOiRpWxfoGQy7oeyrXFuJ0GvwwoAb2eD0ti6INWaFXOq8cQ3Pm+G8NHxrnE4b4g19HPN
	FGxONQqvaMPfK5jYaebxNubQu6bhYnfQ=
X-Gm-Gg: AR+sD11S10e6+YZxPOxv0a65YtDXfax9p3SNR9CpuvJiIR0izPuFHFLuI+BuDGYIgd0
	x9WL+mTXKhtybBkgvM1ZYktdskrZxiNphk1TLTGbgxb+XnnOnBVGdSTWZqjf2qGQEV+KC8IaUJS
	qlRBEVwI+FAsMfYJ8d8vLB8udgRNiG+aWPodSW1QEfdfcBjM+8PKxdSsS1j+TTEQ0ChALoEk4jA
	xeDFEgISFsHg65ys2WHK+p6D4gAm3VSAtVMqmshNJRPaqb0Pe9OKCffMCoiotejYOnVS+ZRZdeU
	HFKWCsQhMgT/o//weUtZUMaqZRJckhOUa/7X7xwjRI5OrIbl7cOmwKLrGw==
X-Received: by 2002:a05:6871:e406:b0:447:9dcd:ad3 with SMTP id
 586e51a60fabf-45905e2dc31mr10640911fac.18.1785658493782; Sun, 02 Aug 2026
 01:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
 <CAMKF1sqfU+AADR--Bria3NnKDCnKbV7Lux1ESx4ccGTx-60tPg@mail.gmail.com> <CADySD0Gw=nY-BYmgrgiwRy5VRq0Oykgg5O1-6u6kX61vEpzG2g@mail.gmail.com>
In-Reply-To: <CADySD0Gw=nY-BYmgrgiwRy5VRq0Oykgg5O1-6u6kX61vEpzG2g@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 2 Aug 2026 20:14:41 +1200
X-Gm-Features: AUfX_mwGUhcZovoK49sKonYybCbvuerQ-KvYyR_mA8oMOmsiXLfIR5NSX3Rv3Sk
Message-ID: <CADySD0HPxtz3Yj_U9KPE7BeRdNn=sW=38NWJWkKyHnaPQ+nu3Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/20] imagemagick: upgrade 7.1.28 -> 7.1.29
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 08:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128651

You have already done the needful, thanks for sorting it out.

I have sent some additional minor fixes.

On Sun, Aug 2, 2026 at 4:48=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.com=
> wrote:
>
> sure, I'll do it soon.
>
> On Sun, Aug 2, 2026 at 3:41=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > please rebase this series on top of master-next and resend please.
> >
> > On Sat, Aug 1, 2026 at 6:11=E2=80=AFAM Ankur Tyagi via lists.openembedd=
ed.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>
> >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> ---
> >>  .../{imagemagick_7.1.2-28.bb =3D> imagemagick_7.1.2-29.bb}        | 2=
 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-28.bb =
=3D> imagemagick_7.1.2-29.bb} (99%)
> >>
> >> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.=
bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
> >> similarity index 99%
> >> rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.b=
b
> >> rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
> >> index 7fd34dc54c..0890edb8c5 100644
> >> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
> >> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
> >> @@ -17,7 +17,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagic=
k.git;branch=3Dmain;protocol=3Dhtt
> >>             file://imagemagick-ptest.sh \
> >>  "
> >>
> >> -SRCREV =3D "c2068fb3394af17fb9e3a78c712af2ca67141836"
> >> +SRCREV =3D "360eda553586e389c9c725fc49df94f209a8a3c7"
> >>
> >>  inherit autotools pkgconfig update-alternatives ptest
> >>  export ac_cv_sys_file_offset_bits =3D "64"
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#128595): https://lists.openembedded.org/g/openembe=
dded-devel/message/128595
> >> Mute This Topic: https://lists.openembedded.org/mt/120549559/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

