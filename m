Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8149EC88E72
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 01:54:14 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13979.1789437249935681618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 18:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=avzMuURh;
 spf=pass (domain: gmail.com, ip: 74.125.231.76, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc20so3437663fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 18:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789437249; cv=none;
        d=google.com; s=arc-20260327;
        b=jxghiq/1hTADijV3e15WE7U6TyG0+aNcu2Cy4NZr9Vkt2B3b+Vu/WN/Pw8ij/PBnM0
         eCLHFoFU8A7gw5Ha6FvNXUOL0MZGfzr15PVRQ5Kp1Sk/QyrNhMuLK7ZDTBtndKW7mxcY
         AIqIn5b8DR5P9UYG1S7ojkTXfoO0dozrwJnO9fVzJv/e3i10eqWptZMa8xhwvYyvj+SZ
         8ac+qUASWoX2ph5sWj1L++gLb2AdNO85Vxw2XwekSt3nPXHnK4d2BmIz/N86xGJnR4Ys
         2rLC0iz0ddc23DsV2s8q2zI7L+pbcZCOB++mEPVN8h/VYECJqgyYEoioSUM+OKA8lDUe
         cjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hyogF0Nw1nbvatxa/m+WEifkNVRU+m3oVJhvB6fa+XU=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=f0E0/WDpxXul7wnBc5Lo6hKSec8xy1CDsOfiNbIdxSvk6ofs2A53HxnxD6tJRa5gev
         9fZQI8DEcV09xNxoddlUAaNxbyCgWnUFpOnIAbxnnnDgIvuoWbtxIg5Lk7rX7BOQlj9D
         qi4xIevhUXgHn5S24xcRC6HKO5RtCEowtU+IkMucdxSkjdsFBCH1GQyUo75aCzk8c/yo
         K6gfHmUq9FtNvcCmKOgLDsLQgBD0noGzCyHIoFzT8tSwAs38WVnB4VHkfu3pS7tzNBiW
         TMMvBGm1ZJIbz1t6zMEl2yBmW67G8B1qUc0GDilAxoXAubc0uKLoyaBHJxWho31ugUeC
         /sPg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437249; x=1790042049; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hyogF0Nw1nbvatxa/m+WEifkNVRU+m3oVJhvB6fa+XU=;
        b=avzMuURhRk+3OwF7Og+N5bRwK3v9ph1DwDfxzc6NTFal/6XMpFes1v5jUOuRnVJaeI
         D0KU9H99gpkM0DNNtM+B3fghYObjF00sGdTX67fRMicFy5HtH91BH/IsBY9pQGSR3zYN
         Jmwws0Zlcvv1piYSv89rZtuBvEnapro/pt6oQOOBdoUB8hwLji1p2l8FQqLCyRyVr5Yh
         Y/kcfVfLRwYqL7dgikpPt+rdetBvY/PT+fvWA3JFUMc937MQ6Fg0u4LIU6Qvwhw0XXbx
         vC9qOYBKH8JmyZiY5I1byWoHkIIyV5bfFp1XVvJMAOZxzVc8eFrIV4FlwQusvXZqUYnu
         uzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437249; x=1790042049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyogF0Nw1nbvatxa/m+WEifkNVRU+m3oVJhvB6fa+XU=;
        b=ntT5bQUMdZbIJHpYaAuxQavE19Mb+DYsZfPJPNxv6/fYnztxuGD6KdAjwvs8ZYUiLj
         iFGaubP+vO2HB0K6GqMnWirewSlOiW+Y9taBk9zQ3DkDyGa+/JCFToMBGdY7bM3/nh3B
         zmQAidFV6kkQG/2LUmVJasrWBMmHEfCHRwzlbm5W9Bsuap9nBKN8HVVYXglJ2qy+fIgP
         xXaR/MlO6ro3xcqFK+ZseGCH6U+17o5BPuAmnjbwYtqMIQTXWnVINISRFBfzezjaQX9d
         VFKp/WCMvRPxN3l8IeSlkkNiaDwSTcj0ZdYbq1rUmuFk5kGigOGNSgk2Hm7DDJdeP6fN
         LARg==
X-Gm-Message-State: AFuF++npWZAtvoWtcf87Eh5jYSqbB1CLI/El/4DdntDlJ/5ZN2oF9oc0
	iqziDeJIE8sMjTU0hlL8DjnRNXC2kz939MXvGgJ6wVl/m2GnPsUYyyiafAx2wK25g6OMnm3JJ5Y
	w3/tJKW6ahxDVP9pcZUu6epnNgOkYXAA=
X-Gm-Gg: AYBFou1AdzXMvgNOPJ/bco/lX7KZIB362AStJ20pDLiSeW0IEp+Gye49oTYKzVZEJvM
	B9p+0GbvXJjsgA49BC/fIdyuRrqt5CIRoIhnyASYx4sumQYqkNPxnMGtY2+EW2384zuZjGJ6waT
	Nh0XNO3y7TdJroQlYRxLjbk+gFo23K8q9V1I86QJVHXsn398Zc6cgU8MF57q+WBlXaCIAM2CnWN
	ceMKfI9gPYDCYKXsxNzrpZ3DO3Vs5auXIK5cMHsbx2ZxQo7HvIeog/3yI+iLP8orT5WnfqVNw4g
	q7qc/5f7S24MhKb+1pCB+OLy4TM5eodzlVRmijkwiTnEZ2W8HWI0KMlxusBb0uAmkQ3NhQ==
X-Received: by 2002:a05:6870:44b:b0:47b:dbb4:7cbb with SMTP id
 586e51a60fabf-481f9b10f9fmr5420446fac.14.1789437249092; Mon, 14 Sep 2026
 18:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
 <20260907102318.2459883-17-ankur.tyagi85@gmail.com> <CA+s=J=z+RK=jzDJTuWt9C1d1MVt09upLgvGvn1ZszjxGAu8KQQ@mail.gmail.com>
In-Reply-To: <CA+s=J=z+RK=jzDJTuWt9C1d1MVt09upLgvGvn1ZszjxGAu8KQQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 15 Sep 2026 13:53:55 +1200
X-Gm-Features: AcwNN1XF27ObZo6SexDDRgkgU-52_8J4AwZzW51okmp16HapzjR8L1LMIkn2QTg
Message-ID: <CADySD0FLqkxJFH=2JSa8FtHY13RzCJoy-OTHX=dbHFyUMcKL0g@mail.gmail.com>
Subject: Re: [oe][meta-oe][wrynose][PATCH 17/33] smarty: mark CVEs patched
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130030

On Tue, Sep 15, 2026 at 1:28=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> On Mon, Sep 7, 2026 at 6:25=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > CVE-2024-35226[1], CVE-2026-62992[2], CVE-2026-62996[3] are patched in
> > current version.
> >
> > Details:
> > https://nvd.nist.gov/vuln/detail/cve-2024-35226
> > https://nvd.nist.gov/vuln/detail/cve-2026-62992
> > https://nvd.nist.gov/vuln/detail/cve-2026-62996
> >
> > [1]https://github.com/smarty-php/smarty/commit/0be92bc8a6fb83e6e0d88394=
6f7e7c09ba4e857a
> > [2]https://github.com/smarty-php/smarty/commit/99c048ce7a590c519b79fbd3=
8ad0143a08183a1f
> > [3]https://github.com/smarty-php/smarty/commit/3c9f77a2e06ce319ae009249=
6af32cc8f3adc52e
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-oe/recipes-support/smarty/smarty_5.8.4.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb b/meta-oe/r=
ecipes-support/smarty/smarty_5.8.4.bb
> > index dcb7c85a80..cf6c42345c 100644
> > --- a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
> > +++ b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
> > @@ -35,3 +35,7 @@ FILES:${PN} +=3D "${datadir}/php/smarty3/"
> >  RDEPENDS:${PN} =3D "php"
> >
> >  CVE_PRODUCT =3D "smarty:smarty smarty-php:smarty"
> > +
> > +CVE_STATUS[CVE-2024-35226] =3D "fixed-version: fixed since v5.2.0"
> > +CVE_STATUS[CVE-2026-62992] =3D "fixed-version: fixed since v5.8.2"
> > +CVE_STATUS[CVE-2024-62996] =3D "fixed-version: fixed in v5.8.4"
>
> Should this be CVE-2026-62996?

yep, I'll send v2

>
> Thanks,
>
> Anuj

