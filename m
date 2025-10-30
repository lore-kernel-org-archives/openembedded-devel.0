Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B1ECCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 08:10:55 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.21626.1761811852487750023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 01:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nu8bUVGU;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-654ef376363so387675eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 01:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761811852; x=1762416652; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd1i2vYzfayVggm69IibIxXbFfDfHGo+LSRJ918ZNv0=;
        b=Nu8bUVGUf4XKEqUrJhpYlE2b4tHePXsNYCW6NojPT7+7szBaY7+Rm1UsWrzRBilncz
         q/6LmeKvW/sORlGKY3hwEzsXL1unUX2UxC+ivpmhFG535dhm0ODF4YFdyojLi0G7FYL4
         I9Rd7tv4j5irdpm1AcFZE+zHkYPl57PHXBzLv+/NfW4H44Dhtamb7CBfnvJ4ItYoaJYi
         Nd6KXtUvy5NMZu54DETfyNqz2QS7U/WeqjMXzTvsr+hy77uCgpPwa03YIN6Xo34+3l97
         OZgQ6AVbhxiGSZavK5l+bGkmHMqdlTp2IXdihv9dMBTF+f5YUkR7PqZYHxJ66tcqpwMy
         8ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761811852; x=1762416652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd1i2vYzfayVggm69IibIxXbFfDfHGo+LSRJ918ZNv0=;
        b=RB3jK6b1xG1P4s2574Ac1laCUejspLrmZ/95Vzjtj3G7uqJ90Hu2NhRuCN8xNu88sv
         244dwWpuIyg+P3OkEW3F6y6EzSHq/VsUaReVcLoB/w7eRcu5Nu5dUhvsEIF/dI/AcKEI
         6HJhmaK7ErOLU9Ku1raKnQtveEHWNvIpzlX0pmI6nvV4nEwqKyKm5VtKMW8aZTnnzRmq
         3VHWTDtKx9dBEkRGizYhxP3Oo3G/X+vVu1KVo6HnceFqb7OW773qpZZaFsrNCNbnq/8D
         QBR9hzCgE4TUk7r3kaCpNDqD1uA59SIzjFPGEAdJTYDOmAbmTIzbZJt9elm/+hzRhP2O
         8GPg==
X-Gm-Message-State: AOJu0Ywz7kGuSzlsefT7waJFcqSW7804nzzYSVKWQNihmo3+9hkRfAYs
	SPm0Q1QyW1Pdi4oZqwBvbTqR/Gke6vLEuhRdl6akO/k0APY3XJKPbwG/e4GrKPyCx/KxjWrvh95
	7hUAu5OU4VdIcdR3Xus3N8hV3f3cv9M4=
X-Gm-Gg: ASbGncuNX6/bwOxz2vxEevdkEaa2gXnyeAS5x+b4rPzdBn05+wR2x7vyF/GWyc/zOnE
	c+kmWrLOs/diANv2vnA+4/XtGEB83qgjS/YEZzHqSx44Lq3Tlm6sPdAS+tDyq5j5fiZMWc81YBA
	RgUB2uiPrjBFfF338LY5VRDZc4ihem980d8/qo6NFm+mmZ6/s3jdfIcR6NZ8CtMyKAlD7mHxhxB
	cCcEjHHvQ+NmvUONhOe7ZOSPvPGr9PSjdwyLYZEPcNeJaLiLmo9SDrqIEEp89E=
X-Google-Smtp-Source: AGHT+IEUuCMOjd1u/cnLj4lTT37aj9Z1VfSnnQYNW9mNgsk74sdatMtmb+1iC7PRPzW2HSetDSSZVmzfW6ynxBmSOQ4=
X-Received: by 2002:a05:6820:1c96:b0:650:9205:bd15 with SMTP id
 006d021491bc7-656823f76afmr971318eaf.6.1761811851773; Thu, 30 Oct 2025
 01:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
 <20251015063531.1573191-4-ankur.tyagi85@gmail.com> <e51756c87e168db3530749128054f01259c65974.camel@intel.com>
In-Reply-To: <e51756c87e168db3530749128054f01259c65974.camel@intel.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 30 Oct 2025 21:10:40 +1300
X-Gm-Features: AWmQ_bkMQ9GCc0VVqyNoA-Y1OpzmE_6hhapWSf6tzYwNp0z6IvM9d--A_ZugrCg
Message-ID: <CADySD0FRFuSv+PeKfv6SrKKDAvXrfaxw9Y+Q--gU_tnQWmgpKw@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 4/4] opencv: ignore CVE-2025-53644
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 08:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121199

On Thu, Oct 30, 2025 at 7:27=E2=80=AFPM Mittal, Anuj <anuj.mittal@intel.com=
> wrote:
>
> On Wed, 2025-10-15 at 19:35 +1300, Ankur Tyagi via
> lists.openembedded.org wrote:
> > Details https://nvd.nist.gov/vuln/detail/CVE-2025-53644
> >
> > CVE was fixed by [1] but the change [2] which introduced CVE was not
> > present this version (4.9.0).
> >
> > $ git tag --no-contains 40faced6 | grep 4.9.0
> > 4.9.0
> >
> > [1]
> > https://github.com/opencv/opencv/commit/a39db41390de546d18962ee1278bd6d=
bb715f466
> > [2]
> > https://github.com/opencv/opencv/commit/40faced6c18baa6fbc7c1fbd409d59d=
6ddecc74f#diff-ae9fbe252ce7879e83e7ae22e594d50b5a8d2ea8dfb4cc8e02e896902a1a=
8f10R2872
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-oe/recipes-support/opencv/opencv_4.9.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-
> > oe/recipes-support/opencv/opencv_4.9.0.bb
> > index cf836d3ecf..e4910553bf 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
> > @@ -208,3 +208,5 @@ do_install:append() {
> >          rm -rf ${D}${bindir}/setup_vars_opencv4.sh
> >      fi
> >  }
> > +
> > +CVE_STATUS[CVE-2025-53644] =3D "cpe-incorrect: This version (4.9.0)
> > doesn't contain the change which introduced CVE."
>
> Actually it looks like CPE data was revised recently to include minimum
> version as 4.10.0 so this should not be required now. Can you please
> check again?
>

You are right about updated CPE, it is not valid anymore for v4.9.0.
Thanks for looking into it.

> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120693):
> > https://lists.openembedded.org/g/openembedded-devel/message/120693
> > Mute This Topic: https://lists.openembedded.org/mt/115766814/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub [
> > anuj.mittal@intel.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

