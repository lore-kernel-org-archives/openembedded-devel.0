Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24E2C624A6
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 10:10:47 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11049.1771755038446197868
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Feb 2026 02:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kf29gE6z;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6799774d0fcso1999041eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 02:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771755037; cv=none;
        d=google.com; s=arc-20240605;
        b=dps+7tX5zB7TrkI+LXO119VpIV6O1oKg7AlRfYNdcnWhZAPhYf3JIFSs0Yybxqsyx6
         XAwyRm/9qftp4W/Kx29W8t8JE89FFoF9l4ldey4jidiulhzfOpJEG1Gyqq8xFBEQHyK7
         1AVrBkQTifdF1tozxw5Fq8urWNxH3bYPkQDbxKM4n4/XZIBUpppbyR+CWQu+2yr0rR3B
         YMu3sgzsHQnQSZc12ZPnik9zijfVwKsPSbL6NF919oS4kUlc2TpK8m6/N3Uw7H41hZz0
         91KZgOYg+qYqunPATMqVTIEOGHgHoV2zV8plI43LUx6pRRpWjUomGgZOIBFzZ5nr2jAt
         3Ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mA1GZuEA4cIrpGqcZGmKimIttoPnMbvH1/xJ4Mz6SW4=;
        fh=Cy8QjMJa8hAWF3reyCFRDelDSebBp/RKPuwlwAkl26c=;
        b=jtCaFPbkMx0BtyCg8BDruQTdBnEUmGLn+oQdfAt1GOAISE4ViLnGig5BPn+E7764b3
         4SCxMBgwEUioGXniqDahEA5ijkoIdQ1dnfQNzR4wv1fB8j44P87trxr2m/5FXcQUgvhe
         5lLbPYkdWzti6jI/gRXdCsciX12I3ORQsslWo9t/eM4I34ft4jU8CnfTCZeY4L7fqmgq
         6VR4hOohvkA9MPDYN8Zq989OrFDTU/shJubeCjYXWaO1jqDtJBNlABsWidwOi20EOjfg
         x5BqwEDY2Md1xOOrvwjpBnNi4B2aqwWMjPDdVBiYJsTIB8Cdwh3cPq0n8P178cX3Vf8a
         sQlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771755037; x=1772359837; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mA1GZuEA4cIrpGqcZGmKimIttoPnMbvH1/xJ4Mz6SW4=;
        b=Kf29gE6zXHGxF8wxtMK5Rw6WUKU9V5//QCg2AJgKVNM2m4yjpUkFWwsEHt0GChVVZx
         kEQ54M5KSayPeJ0iWddm4iEm4KykK2h8G/wBAEuaSPN+ynxVEOUNwEq+B1LqH9GV7jkn
         uowcQUwExVn3cB/K73E1gu+XlbANH+vKkd4WnONxPjxOhybwXjrMx6LBVS0lfWd0ezyo
         /MfcXuaWvjNDyZ70gsPLQcp0CDgHJqLM6+Z8UNwuF55uNmxoUp0fJUs/aFG2/W+1qJxc
         /Ll3aR0/5Dc5Zb4Na/UfzsuHQkba6Stp1x4PLkQALHL/Zx8WCyW7vueueIhboWEKRjMo
         B04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771755037; x=1772359837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mA1GZuEA4cIrpGqcZGmKimIttoPnMbvH1/xJ4Mz6SW4=;
        b=aL42vF2WVlPmLbKk2AsNenbT8E85psikWpbgJN/pZOj+GD+qq0IveydVrzTHjhpLYl
         IHdVmy8biMEfr+ITpOR9/J3MEgwFWYGbm1HrWEzY+Y64i5+S5Lnazm+X+eu1PCd5Gk6T
         ZJnmXFo/K4zQAq+EDp0zRLnyE0S96py1mq29o6hc1v1pV8a/3HqeHrLPKHhrS/mkipPv
         h3JovMLnpPYviyFHJMrYFJ0r0OzQ6x02Pvcbasi/DtOTx92uCrlyhSiwjVj/WdCSHcV5
         HWk1UExCASGgUgM5Ijr5zPho4XQwE/ria/J6epU5ykHmNXlDyK6IJtJon6CebH0lr3SZ
         OhJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMsWifBmNtLYT+wLyHl7dovipYJ9hAw9hSk4oC03Kawndithik6uibjBq89RyHtmuTWkUofZxaLuXTVIsASNxmRhA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKTQjjL6Q0EjNoU/dZgF92ncpIhzkbXbpL0BosikN/n379E7yt
	bYSVOfQmFjfGis10IMC/jJkU1t2GrvSEwJLdj4Kpp6ZD1JMWkNJAfAngXCeMBHdSh8IaY70fsIQ
	/XU+cFBUy1chfaZq2GANsradaIIZzX24=
X-Gm-Gg: AZuq6aJJjPtBU8JzxZd2GtPDnzvbN4qSSusu9lvTDGE6b/xbLenyhCOTJpWs7Y45TLB
	5KIjEpnTu1jXEltJaFtohaodhcqb2G5CPh28B29euOriNwCay9HG7Vp9ihHYjqm2+inDRPyH+6E
	4X/dHyxfA3QRgogSE8QX9zjfHR+Mkyx3GGecQiuLlR5tYysjS9tXP8ASmd+OMV75g3IF7z+M5c9
	BYS2Sc6NCdJ3n3JdCgkufIfhAenT/lYGRb95UcWhstBg3esnuS79b2JxNwOg6yCqSaos7K2IS+u
	Tq+tbEq9Ag==
X-Received: by 2002:a05:6820:1513:b0:66a:1886:e4dd with SMTP id
 006d021491bc7-679c44eb7f7mr2685672eaf.45.1771755037539; Sun, 22 Feb 2026
 02:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
 <20260211120025.4190831-8-ankur.tyagi85@gmail.com> <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
 <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr> <CADySD0FrCrza-8-Qvv8dWA9rXFkv=OkgNwO-Pof8efCrEWdXgg@mail.gmail.com>
 <cfd43b84-61a3-41ba-8931-42d2ca77c44d@gmail.com> <CADySD0HMEs5e9aQq7fKwtjhSFrc4orJ0r46vWAaDt6Hpk+8kmw@mail.gmail.com>
 <8f30d396-53c0-4aa0-af90-914b9e7eb1aa@gmail.com>
In-Reply-To: <8f30d396-53c0-4aa0-af90-914b9e7eb1aa@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 22 Feb 2026 23:10:26 +1300
X-Gm-Features: AaiRm52M1r2IYXZ8Z1kLlrIN9h_iNfPolhOQ8-VHRULSxbSRpZoNyjynFl_lfvw
Message-ID: <CADySD0Hq2n---EM4HgghtAjZRmzbJCFeb5FGD2regv21zAE5FA@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update SRC_URI
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, anuj.mittal@oss.qualcomm.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 10:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124530

On Sat, Feb 21, 2026 at 8:48=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
>
>
> On 2/21/26 02:38, Ankur Tyagi wrote:
> > On Fri, Feb 20, 2026 at 7:45=E2=80=AFPM Gyorgy Sarvari <skandigraun@gma=
il.com> wrote:
> >>
> >> On 2/20/26 04:34, Ankur Tyagi via lists.openembedded.org wrote:
> >>> On Thu, Feb 19, 2026 at 9:19=E2=80=AFPM Yoann Congal <yoann.congal@sm=
ile.fr> wrote:
> >>>> On Thu Feb 19, 2026 at 4:04 AM CET, Anuj Mittal via lists.openembedd=
ed.org wrote:
> >>>>> On Wed, Feb 11, 2026 at 8:01=E2=80=AFPM Ankur Tyagi via lists.opene=
mbedded.org
> >>>>> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>>>>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>>>>
> >>>>>> The previous one became inaccessible.
> >>>>>>
> >>>>>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>>>> ---
> >>>>>>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 +=
+-
> >>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.=
6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>>>> index f172168335..a90a33ada4 100644
> >>>>>> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>>>> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>>>> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
> >>>>>>  HOMEPAGE =3D "http://tomoyo.sourceforge.jp/"
> >>>>>>  SECTION =3D "System Environment/Kernel"
> >>>>>>
> >>>>>> -SRC_URI =3D "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20=
210910.tar.gz"
> >>>>>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
> >>>>> How do we know it's -20210910?
> >>>> Also, please put add a downloadfilename containing "${PV}". If not, =
it
> >>>> will break the mirroring test at the next upgrade.
> >>>>
> >>>> Thanks!
> >>> Thanks Anuj, Yoann.
> >>>
> >>> Let's drop this patch for now as existing SRC_URI seems to be working=
 again.
> >> Is it working though? When I visit it, it offers me to buy the domain,
> >> and the direct SRC_URI[1] gives me http 403. Is it geo-dependent?
> >>
> > hmm, maybe it is.
> >
> >> That "-20210910" comes from the original filename. IMO the full BPN
> >> should be tomoyo-tools-2.6.1 (this number refers to another software),
> >> and the version is 20210910, but didn't want to start messing with the
> >> versions with such an old recipe.
> >>
> >> [1]:
> >> http://jaist.dl.sourceforge.jp/tomoyo/70710/tomoyo-tools-2.6.1-2021091=
0.tar.gz
> >>
> > I tested with following SRC_URI which addresses all comments
> >
> > SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BPN}-${PV}.tar.gz"
> > PV .=3D "-20210910"
> >
> > If ok then I will send v2.
>
> I'm a bit confused about this too... BP already contains PV, it's
> definition is:
>
> BP =3D "${BPN}-${PV}"
>
> Does this patch really need change?
>

ah right, went in circles...

So question for Anuj and Yoann to help understand the concern with the
patch when existing SRC_URI already uses "{BP}-20210910.tar.gz"

>
> >
> > cheers
> > Ankur
> >
> >>> I will monitor the situation and send a new patch if needed.
> >>>
> >>> cheers
> >>> Ankur
> >>>
> >>>>>>  SRC_URI[sha256sum] =3D "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869a=
eefd42fd311c4022b78010a"
> >>>>>>
> >>>>>> +PV .=3D "-20210910"
> >>>>>>  S =3D "${UNPACKDIR}/${BPN}"
> >>>>>>
> >>>>>>  LICENSE =3D "GPL-2.0-only"
> >>>>>>
> >>>>>>
> >>>>>>
> >>>> --
> >>>> Yoann Congal
> >>>> Smile ECS
> >>>>
> >>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#124520): https://lists.openembedded.org/g/openem=
bedded-devel/message/124520
> >>>> Mute This Topic: https://lists.openembedded.org/mt/117754895/6084445
> >>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [skandigraun@gmail.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>
>

