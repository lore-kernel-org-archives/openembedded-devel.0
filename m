Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE09C5DF69
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 01:39:02 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12425.1771637931868931530
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Feb 2026 17:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W1o3DRuX;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-463901a0accso939476b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 17:38:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771637931; cv=none;
        d=google.com; s=arc-20240605;
        b=e1jOfn+m2fYSQFH/6i7eTbaz7wZogNIg9RHJVaais+j5pOc14tEZWbG/KQUfWJfiHU
         lLOheBaPOP7oA9JB9uFjkOhQRrfc7APWrxquig0ae4m3hGC8vaNErmflifmNbXxAFbTK
         7qrS09LyyHVK4XrtHuQAVLte0zLvDUyy2p+MNM0b7OCC16N0SPOQZXTwSuQgMyVgu7qD
         ND/tKw9GcJK+ZmEgZrJlOWfdHa7gpBl8OGBk7jRc70NuaWrJUJhmDZADuOXp6+HHY9A0
         88Umc3RGZChtJIMSrUPIRel9Fd06QPgQfcT1Pr3V73RT8skbbTXihXnbZUpfoM1SLUxT
         HuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wv8//iGgycuM9AQJgl1Kw7gl3Zti4P3QHkNoevVjdxE=;
        fh=oA6Y68vxlPfEfksiCfMz36cLAnYvftBz9a5YdAZ0jWU=;
        b=X6GY/TqgXxGxcpyUOXdJZz+MMpPeQpNuYUzEp0+B+rSeAJ5gR7zHZZQRfrrcQrObyU
         PEpq7rFRER6Rfph2UcHJKOXjv1ylOoToejU7RG1RStDUAuazqXI+jvcqZIJTAemMLyyP
         FDe6k8OWK1aX9LPW7IDLjkun7ud7GaduEnlm8ju1H5if/3w1r/G4JO8e4zIR6nXN/Ff0
         lnBiuBeP0K6IKfIDp5RrNYGlSmV9rlwpOCtI68gO9tyC4stvvECEqdv+OF7vc5reR6Mn
         SGKznUDE2crmSqPsobr0A2B1AKp7059QCdrbxjWCbogjD0PL0Sp6N/4qjQWDHRrXrlJk
         r+Uw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771637931; x=1772242731; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wv8//iGgycuM9AQJgl1Kw7gl3Zti4P3QHkNoevVjdxE=;
        b=W1o3DRuXorQTECiwsC52RVQxV3EC5lQvMqUGjR9mgwcFSygNE+Gn/pNfuiKds3XHVV
         i1zABzrOJx6K2OTArRV7YGcB7yke8yCXoJeyjykVor9SlgXsAo6i5j7wnI/d9t+yeHfC
         N5yLHALPPHliigJrqnlI0OOK4wseN5UrF9rpJ5ryHhmFsTEH5M4Tb5VUpgbu1sooFCmI
         YJreviLT8VebbZV+xnxaBDeYwWKZ1ngQUE+P3jxrG2tDIuLo5HxV3pIBzwvIKHx36WVy
         ss+3IJa/S/lDZAyjWWf+6UnQ+xsagQ5Nn6TckjInGmiFMd+s0ywjKUw/56E1VAnWncpM
         nJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771637931; x=1772242731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wv8//iGgycuM9AQJgl1Kw7gl3Zti4P3QHkNoevVjdxE=;
        b=IHhIsMX2sGCNtbd/lfB7L+4ZDze9jYjq9ojA32skXSG8mOw6Rpn58A4AXwe9iUJQfC
         IutrjY8m5lLDxTxRNlDn3JM1YOZqT/DbERsJeHImJPMmWvAlSedm1d/TvB6qprExN2J4
         Ww46ArTvQXGOplbMbBOFttafVkBFIPEURwRTjgphUTrp5D4tFrfVrOT4SHEbQfwv6RfJ
         je3uGJSlQf1R8Zk/CjhAsno9Df9V9O8n7p1fiynE9iAqlB+7FO1U9xquCX01CGthUL0w
         X67x/XCIbx35dTF92bKd+WfXZB/rhyd7WjwDTBF6zy8cgBSOJi+miefwr1EvjEaM91Mx
         dlYA==
X-Forwarded-Encrypted: i=1; AJvYcCVeFl5q0dudb3RwF4yIuSXZpjgm8kD4mU9goIKinlFOaNdSMOISqqgnE2GvifL+gnKA/nm4lZnjuZCBHt8SqFByDDg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmIdZqJ5s0TKHlGtuKvQtAFAOM79ztINmHinJnJmI7olhQLgHR
	IiMfRjPeENbJc0iKPRM3wzfpBVBpGwEmhUJe8upSLtiCWrBUbWRlleq9KbGxqmMepNq6clXW9Lz
	r+4aOXn+qpzoZEqqnIR7rWqeLOs2qKBM=
X-Gm-Gg: AZuq6aKN7n8RZ8usM5PVmO/pYfrlrchYjE7KtoStiqBuW39vUsCFWMUD3+bzbHUAQ6c
	LYVpL5Yd6N5zzooxsQzuHx/f4FgN7gxde9mZwaDllaucPHFcOMlC4zban2BJ+49YP+oQToRY/A+
	2ejKfjusxOzA0hpFA0ALBY+1Xcz5quCPjT91YJZiaGYIlAu2BygmEWG2r7L34J7JggNX3egaSc/
	nDpFe6a64un7uuUdHLC5J4WTwCZS3rZljZaJnmWZJsSA2RXyedkFthUKMzHcCiXCzB6Mb6WBRsR
	XcRhhAZo
X-Received: by 2002:a05:6808:f06:b0:462:dae0:196d with SMTP id
 5614622812f47-4644617b3aemr1161466b6e.10.1771637931057; Fri, 20 Feb 2026
 17:38:51 -0800 (PST)
MIME-Version: 1.0
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
 <20260211120025.4190831-8-ankur.tyagi85@gmail.com> <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
 <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr> <CADySD0FrCrza-8-Qvv8dWA9rXFkv=OkgNwO-Pof8efCrEWdXgg@mail.gmail.com>
 <cfd43b84-61a3-41ba-8931-42d2ca77c44d@gmail.com>
In-Reply-To: <cfd43b84-61a3-41ba-8931-42d2ca77c44d@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 21 Feb 2026 14:38:40 +1300
X-Gm-Features: AaiRm50ehZAtWJWb3iB4eJOfLY4sFgdW_3qYTt6ix_EZPqJ_AwM4G7dYih-F9ak
Message-ID: <CADySD0HMEs5e9aQq7fKwtjhSFrc4orJ0r46vWAaDt6Hpk+8kmw@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update SRC_URI
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, anuj.mittal@oss.qualcomm.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Feb 2026 01:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124527

On Fri, Feb 20, 2026 at 7:45=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
>
> On 2/20/26 04:34, Ankur Tyagi via lists.openembedded.org wrote:
> > On Thu, Feb 19, 2026 at 9:19=E2=80=AFPM Yoann Congal <yoann.congal@smil=
e.fr> wrote:
> >> On Thu Feb 19, 2026 at 4:04 AM CET, Anuj Mittal via lists.openembedded=
.org wrote:
> >>> On Wed, Feb 11, 2026 at 8:01=E2=80=AFPM Ankur Tyagi via lists.openemb=
edded.org
> >>> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>>
> >>>> The previous one became inaccessible.
> >>>>
> >>>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>> ---
> >>>>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 ++-
> >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.=
1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>> index f172168335..a90a33ada4 100644
> >>>> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
> >>>>  HOMEPAGE =3D "http://tomoyo.sourceforge.jp/"
> >>>>  SECTION =3D "System Environment/Kernel"
> >>>>
> >>>> -SRC_URI =3D "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-2021=
0910.tar.gz"
> >>>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
> >>> How do we know it's -20210910?
> >> Also, please put add a downloadfilename containing "${PV}". If not, it
> >> will break the mirroring test at the next upgrade.
> >>
> >> Thanks!
> > Thanks Anuj, Yoann.
> >
> > Let's drop this patch for now as existing SRC_URI seems to be working a=
gain.
>
> Is it working though? When I visit it, it offers me to buy the domain,
> and the direct SRC_URI[1] gives me http 403. Is it geo-dependent?
>

hmm, maybe it is.

> That "-20210910" comes from the original filename. IMO the full BPN
> should be tomoyo-tools-2.6.1 (this number refers to another software),
> and the version is 20210910, but didn't want to start messing with the
> versions with such an old recipe.
>
> [1]:
> http://jaist.dl.sourceforge.jp/tomoyo/70710/tomoyo-tools-2.6.1-20210910.t=
ar.gz
>

I tested with following SRC_URI which addresses all comments

SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BPN}-${PV}.tar.gz"
PV .=3D "-20210910"

If ok then I will send v2.

cheers
Ankur

> > I will monitor the situation and send a new patch if needed.
> >
> > cheers
> > Ankur
> >
> >>>>  SRC_URI[sha256sum] =3D "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aee=
fd42fd311c4022b78010a"
> >>>>
> >>>> +PV .=3D "-20210910"
> >>>>  S =3D "${UNPACKDIR}/${BPN}"
> >>>>
> >>>>  LICENSE =3D "GPL-2.0-only"
> >>>>
> >>>>
> >>>>
> >>
> >> --
> >> Yoann Congal
> >> Smile ECS
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#124520): https://lists.openembedded.org/g/openembe=
dded-devel/message/124520
> >> Mute This Topic: https://lists.openembedded.org/mt/117754895/6084445
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [skandigraun@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

