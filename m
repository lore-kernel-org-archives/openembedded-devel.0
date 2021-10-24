Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2883EC433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 17:15:46 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.21243.1635095745560776455
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Oct 2021 10:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+2SImVC;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id w2so8322518qtn.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Oct 2021 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qu87DUPcrX3Z/82zjljVaMvZf2MARkL4NmLiOhoxnUQ=;
        b=O+2SImVCIMIXm5krwBEzDMaU1PLAf8c4Jm5iNjtKg6x1sRlS0enBXOA0pmzATgvGFO
         bsYfgBdOtBf5W1Pul8ctsqN3TxV4BHHfHMGut2tPBuZs+okAKtpP6IeRnO40azDko2Pf
         kPnYuHZhOu0i0yBOAxWVyDy0GkIXn/Wyjw8+9JCuVvQF8vsm7rocaIclccIKngz1Ejln
         T0dqOYO638kdzMl4rkpiFkYHi68jdn37JSJRHyuxRt8CYFR0jnEhyPFw+yh6fQ3WZ4r+
         PR2qB0LRrrDJn74UZi3bW9I9LTN2vv1m0y6hLhKmYMQtdpQSqSBYwJ/jKGIxNpOLbyeF
         IZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qu87DUPcrX3Z/82zjljVaMvZf2MARkL4NmLiOhoxnUQ=;
        b=x78Phv3VaO3jc48P2JvJ8qLILIcx1MPEbYRT3mtyfg9pyz+ZL897YkCaf45TN9GSep
         BE/gqYoAv+9B4YZI3ZLdLzSwVdVTD5v27KK7sac96mJFLQxTKo2cqnpSudHNbHrov0Ug
         EZECd/YBD7mp4crfITtiG8fZbjZ4iNs1Nr794okfHS3lXBndNeOpmI+IxXQFU7ELEDHv
         KmGT4G7gyoL61/VMCF6uZ9X3sGq/t8udTs/ZsE3PV/TFsMFUBo0GhU+2Y5n9LQWas4sy
         tck/EYsFod0leaUBfatF0yEC4vyVh1xg6viONFg7Fy4Ay7Eobqz6qm9h1RY0ARgCUqsz
         1s7Q==
X-Gm-Message-State: AOAM533QPcgS/YYYFXASi0tp6s9TzXvIJp2eNneUyjI9XrsOglaaex8C
	9kBrrJUOA7MSSJ7+VXT6jPrsHH6E12bB87iLk4eAH2ijMNc=
X-Google-Smtp-Source: 
 ABdhPJzzupJgL+TDZrSSm5SjbWAZpBaGo+OkUYiCZMQMyHIvEWXRfy1ocuUKgsGdOuRd50JsDrh0Q71Fg+WDWMnssBI=
X-Received: by 2002:a05:622a:190e:: with SMTP id
 w14mr13265797qtc.112.1635095744546;
 Sun, 24 Oct 2021 10:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
In-Reply-To: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Oct 2021 10:15:18 -0700
Message-ID: 
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
Subject: Re: [oe] should "ntp-dev" package have header files in it, or not?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Oct 2021 17:15:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93555

On Sun, Oct 24, 2021 at 5:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   colleague recently asked me how to get access to one or more header
> files associated with "ntp", so he could:
>
>   #include <ntp.h>
>
> from some other code. casually, i suggested the standard way was to
> add ntp to his recipe's DEPENDS, but that didn't do it, so i built ntp
> in my own aarch64 project, then took a look under packages-split to
> see what got packaged in ntp-dev, and was puzzled to see it was
> absolutely empty.
>
>   is this deliberate? are other recipes not entitled to ntp's header
> files? am i overlooking something?

While the header seems to be meant for public consumption, the build
explicitly does
not export it, so perhaps thats not expected to be used this way anymore.

>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93553): https://lists.openembedded.org/g/openembedded-devel/message/93553
> Mute This Topic: https://lists.openembedded.org/mt/86553439/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

